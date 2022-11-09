import UITestingTool

final class LongPressInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? LongPressInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view.isVisibleInViewHierarchy() else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        element.longPress(withDuration: interaction.duration)
    }
}
