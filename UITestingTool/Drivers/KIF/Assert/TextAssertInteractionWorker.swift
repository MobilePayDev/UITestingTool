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
            
            Assert.equal(text, interaction.text, "Expected text: \"\(interaction.text)\", got text: \"\(element.view.accessibilityLabel ?? "")\"",
                         in: interaction.context)
            return
        }

        element.expect(toContainText: interaction.text)
    }
}
