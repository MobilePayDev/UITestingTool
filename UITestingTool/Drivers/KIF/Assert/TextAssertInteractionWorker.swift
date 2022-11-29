import UITestingTool
import UIKit

final class TextAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? TextAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view != nil && element.view.isVisibleInViewHierarchy() else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        guard element.view is UITextInput || element.view is UILabel else {
            let text: String?
            
            if let navigationBar = element.view as? UINavigationBar {
                text = navigationBar.titleLabel()?.text
            } else {
                text = element.view.accessibilityLabel ?? element.view.accessibilityValue
            }
            
            if interaction.assertion == .equal {
                Assert.equal(text, interaction.text, "Expected text: \"\(interaction.text)\", got text: \"\(element.view.accessibilityLabel ?? "")\"",
                             in: interaction.context)
            } else {
                Assert.notEqual(text, interaction.text, "Expected text: \"\(interaction.text)\" to be different from text: \"\(text ?? "")\"",
                                in: interaction.context)
            }
            
            return
        }

        guard interaction.assertion == .equal else {
            let text: String?
            if let label = element.view as? UILabel {
                text = label.text
            } else if let textInput = element.view as? UITextInput {
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
            
            Assert.notEqual(text, interaction.text, "Expected text: \"\(interaction.text)\" to be different from text: \"\(text ?? "")\"",
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
