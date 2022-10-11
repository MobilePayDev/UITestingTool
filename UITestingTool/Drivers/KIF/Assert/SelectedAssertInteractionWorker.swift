import UITestingTool
import UIKit

final class SelectedAssertInteractionWorker: KIFInteractionWorker {
    
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? SelectedAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view.isVisibleInWindowFrame(),
              let element = element.view as? UIControl else {
            
            if let segmentedControl = element.view?.superview as? UISegmentedControl {
                let identifier = element.view?.accessibilityIdentifier
                let selectedIndex = segmentedControl.selectedSegmentIndex
                
                var subviews = segmentedControl.subviews.filter {
                    NSStringFromClass(type(of: $0.self)) == "UISegment"
                }
                
                subviews.sort {
                    return $0.frame.origin.x < $1.frame.origin.x
                }

                let selectedSegment = subviews[selectedIndex]
                let selectedSegmentIdentifier = selectedSegment.accessibilityIdentifier
                let isSelected = selectedSegmentIdentifier == identifier
                
                if interaction.isSelected {
                    Assert.true(isSelected, "Element is not selected", in: interaction.context)
                } else {
                    Assert.false(isSelected, "Element is selected", in: interaction.context)
                }
            } else {
                let isSelected = element.view.accessibilityTraits.contains(.selected)
                if interaction.isSelected {
                    Assert.true(isSelected, "Element is not selected", in: interaction.context)
                } else {
                    Assert.false(isSelected, "Element is selected", in: interaction.context)
                }
            }
            return
        }

        let isSelected = element.accessibilityTraits.contains(.selected) || element.isSelected
        
        if interaction.isSelected {
            Assert.true(isSelected, "Element is not selected", in: interaction.context)
        } else {
            Assert.false(isSelected, "Element is selected", in: interaction.context)
        }
    }
}
