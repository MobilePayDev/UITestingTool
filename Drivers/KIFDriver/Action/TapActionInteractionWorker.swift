import UITestingTool
import UIKit

final class TapActionInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        // Appears to help in situations where element to tap is 'animating' i.e scrolling
        element.waitForAnimationsToFinish()
        
        let elementView: UIView! = element.view
        
        if let switchElement = elementView as? UISwitch {
            element.setSwitchOn(!switchElement.isOn)
            return
        }
        
        guard elementView == nil || elementView.isUserInteractionEnabled else {
            elementView.superview?.tap(at: .zero)
            return
        }
        
        
        if let button = elementView as? UIButton {
            let targets = button.allTargets
            
            for target in targets {
                if let actions = button.actions(forTarget: target, forControlEvent: .touchDown), !actions.isEmpty {
                    button.sendActions(for: .touchDown)
                    element.waitForAnimationsToFinish()
                    return
                }
                
                if let actions = button.actions(forTarget: target, forControlEvent: .touchUpInside), !actions.isEmpty {
                    button.sendActions(for: .touchUpInside)
                    element.waitForAnimationsToFinish()
                    return
                }
            }
        }
        
        element.tap()
    }
}
