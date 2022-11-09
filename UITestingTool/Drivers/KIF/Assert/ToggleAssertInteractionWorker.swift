import UITestingTool
import UIKit

final class ToggleAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? ToggleAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view.isVisibleInWindowFrame(),
        let toggle = element.view as? UISwitch else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        if interaction.isOn {
            Assert.true(toggle.isOn, "Switch is toggled on", in: interaction.context)
        } else {
            Assert.false(toggle.isOn, "Switch is toggled off", in: interaction.context)
        }
    }
}
