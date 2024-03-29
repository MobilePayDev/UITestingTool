import UITestingTool
import UIKit

final class TextAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? TextAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard let elementView = element.view, elementView.isVisibleInViewHierarchy() else {
            Assert.fail("Element '\(accessibilityIdentifier)' does not exist", in: interaction.context)
            return
        }

        guard elementView is UITextInput || elementView is UILabel else {
            let text: String?
            
            if let navigationBar = elementView as? UINavigationBar {
                text = navigationBar.titleLabel()?.text
            } else {
                text = elementView.accessibilityLabel ?? elementView.accessibilityValue
            }
            
            if interaction.assertion == .equal {
                Assert.equal(text, interaction.text, "Element '\(accessibilityIdentifier)' expected text: \"\(interaction.text)\", got text: \"\(elementView.accessibilityLabel ?? "")\"",
                             in: interaction.context)
            } else {
                Assert.notEqual(text, interaction.text, "Element '\(accessibilityIdentifier)' expected text: \"\(interaction.text)\" to be different from text: \"\(text ?? "")\"",
                                in: interaction.context)
            }
            
            return
        }

        guard interaction.assertion == .equal else {
            let text: String?
            if let label = elementView as? UILabel {
                text = label.text
            } else if let textInput = elementView as? UITextInput {
                let start = textInput.beginningOfDocument
                let end = textInput.endOfDocument
                if let range = textInput.textRange(from: start, to: end) {
                    text = textInput.text(in: range)
                } else {
                    text = ""
                }
            } else {
                text = ""
            }
            
            Assert.notEqual(text, interaction.text, "Elemenet '\(accessibilityIdentifier)' expected text: \"\(interaction.text)\" to be different from text: \"\(text ?? "")\"",
                            in: interaction.context)
            return
        }
        
        element.expect(toContainText: interaction.text)
    }
}

private extension UINavigationBar {
    func titleLabel() -> UILabel? {
        for subview in subviews {
            for subSubview in subview.subviews where subSubview is UILabel {
                return subSubview as? UILabel
            }
        }
        return nil
    }
}
