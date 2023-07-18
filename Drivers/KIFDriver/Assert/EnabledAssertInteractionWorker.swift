import UITestingTool
import UIKit

final class EnabledAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? EnabledAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard let elementView = element.view else {
            Assert.fail("Element '\(accessibilityIdentifier)' does not exist", in: interaction.context)
            return
        }
        
        guard let control = elementView as? UIControl else {
            if interaction.isEnabled {
                Assert.true(elementView.isUserInteractionEnabled, "Element '\(accessibilityIdentifier)' is not enabled", in: interaction.context)
            } else {
                Assert.false(elementView.isUserInteractionEnabled, "Element '\(accessibilityIdentifier)' is not disabled", in: interaction.context)
            }
            return
        }
        
        if interaction.isEnabled {
            Assert.true(control.isEnabled, "Element '\(accessibilityIdentifier)' is not enabled", in: interaction.context)
        } else {
            Assert.false(control.isEnabled, "Element '\(accessibilityIdentifier)' is not disabled", in: interaction.context)
        }
    }
}
