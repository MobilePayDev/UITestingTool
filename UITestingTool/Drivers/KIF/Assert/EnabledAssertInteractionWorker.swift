import UITestingTool
import UIKit

final class EnabledAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? EnabledAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view != nil else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }
        
        guard let control = element.view as? UIControl else {
            if interaction.isEnabled {
                Assert.true(element.view.isUserInteractionEnabled, "Element is not enabled", in: interaction.context)
            } else {
                Assert.false(element.view.isUserInteractionEnabled, "Element is not disabled", in: interaction.context)
            }
            return
        }
        
        if interaction.isEnabled {
            Assert.true(control.isEnabled, "Element is not enabled", in: interaction.context)
        } else {
            Assert.false(control.isEnabled, "Element is not disabled", in: interaction.context)
        }
    }
}
