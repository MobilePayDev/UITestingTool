import UITestingTool
import UIKit

final class SlideActionInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? SlideActionInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard let elementView = element.view, elementView.isVisibleInWindowFrame() else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        (elementView as? UISlider)?.value = interaction.value
        (elementView as? UISlider)?.sendActions(for: .valueChanged)
        (elementView as? UISlider)?.sendActions(for: .touchUpInside)
    }
}
