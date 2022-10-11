import UITestingTool
import UIKit

final class SlideActionInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? SlideActionInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard element.view != nil, element.view.isVisibleInWindowFrame() else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        (element.view as? UISlider)?.value = interaction.value
        (element.view as? UISlider)?.sendActions(for: .valueChanged)
        (element.view as? UISlider)?.sendActions(for: .touchUpInside)
    }
}
