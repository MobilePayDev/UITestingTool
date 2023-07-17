import UITestingTool
import UIKit

class KIFInteractionElementWorker: KIFInteractionWorker, InteractionElementWorker { // swiftlint:disable:this final_class
    func element(for interaction: Interaction) -> Any? {
        guard let accessibilityInteraction = interaction as? AccessibilityElementInteraction else { return nil }
        let actor = KIFUIViewTestActor(
            inFile: String(describing: interaction.context.file),
            atLine: Int(interaction.context.line),
            delegate: self
        )

        let element: KIFUIViewTestActor?
        if let parentElement = (driver as? KIFDriver)?.element {
            let parentView = parentElement.view

            element = actor?.usingPredicate(NSPredicate(block: { inputView, _ in
                guard let parentView else { return false }
                guard let view = inputView as? UIView else { return false }
                guard view.accessibilityIdentifier == accessibilityInteraction.accessibilityId else { return false }

                let match = view.kif_ancestorMatching { ancestor in
                    return ancestor == parentView
                }

                return match != nil
            }))
        } else {
            element = actor?.usingIdentifier(accessibilityInteraction.accessibilityId)
        }

        return element
    }
}

fileprivate extension UIView {
    func kif_ancestorMatching(_ block: (UIView?) -> Bool) -> UIView? {
        var view = superview
        while(view != nil) {
            if block(view) {
                return view
            } else {
                view = view?.superview
            }
        }
        return nil
    }
}
