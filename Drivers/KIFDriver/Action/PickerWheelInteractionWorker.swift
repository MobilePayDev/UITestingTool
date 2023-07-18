import UITestingTool
import UIKit

final class PickerWheelInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? PickerWheelInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard let elementView = element.view, elementView.isVisibleInWindowFrame() else {
            Assert.fail("Element '\(accessibilityIdentifier)' does not exist", in: interaction.context)
            return
        }
        
        if let datePicker = elementView as? UIDatePicker {
            let date = datePicker.date
            
            switch interaction.action {
            case .index(let index):
                
                let period: Int = {
                    switch interaction.index {
                    case 0: // days
                        return 60 * 60 * 24
                    case 1: // hours
                        return 60 * 60
                    case 2: // minutes
                        return 60 * datePicker.minuteInterval
                    default:
                        return 1
                    }
                }()
                
                let interval = Double(index * period)
                let modifiedDate = date.addingTimeInterval(interval)
                datePicker.date = modifiedDate
                
            case .value(let value):
                if interaction.index == 0 {
                    let monthComponents = Calendar.current.monthSymbols
                    if let month = monthComponents.firstIndex(of: value), let modifiedDate = Calendar.current.date(bySetting: .month, value: month + 1, of: date) {
                        datePicker.date = modifiedDate
                    }
                } else if interaction.index == 1, let day = Int(value), let modifiedDate = Calendar.current.date(bySetting: .day, value: day + 1, of: date) {
                    datePicker.date = modifiedDate
                } else if interaction.index == 2, let year = Int(value), let modifiedDate = Calendar.current.date(bySetting: .year, value: year, of: date) {
                    datePicker.date = modifiedDate
                }
            }

            return
        }

        Assert.fail("Element '\(accessibilityIdentifier)' is not a supported picker", in: interaction.context)
    }
}
