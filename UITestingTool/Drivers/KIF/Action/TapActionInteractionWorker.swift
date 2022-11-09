import UITestingTool
import UIKit

final class TapActionInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        // Appears to help in situations where element to tap is 'animating' i.e scrolling
        element.waitForAnimationsToFinish()
        
        if let switchElement = element.view as? UISwitch {
            element.setSwitchOn(!switchElement.isOn)
            return
        }
        
        if element.view != nil, !element.view.isUserInteractionEnabled {
            element.view.superview?.tap(at: .zero)
        } else {
            // Appears to help whenever we call `tap`
            element.waitForAnimationsToFinish()
            element.tap()
        }
    }
}
