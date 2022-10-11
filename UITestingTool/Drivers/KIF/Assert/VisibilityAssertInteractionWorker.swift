import UITestingTool
import KIF

final class VisibilityAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? VisibilityAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard element.view != nil else {
            if interaction.visibility == .sufficientlyVisible {
                Assert.fail("Element does not exist", in: interaction.context)
            }
            return
        }
        
        switch interaction.visibility {
        case .sufficientlyVisible:
            Assert.true(!element.view.frame.isEmpty, "Element has empty frame", in: interaction.context)
            Assert.true(element.view.isVisibleInViewHierarchy(), "Element not visible on screen", in: interaction.context)
        case .notVisible:
            guard element.view != nil else { return }
            let hasInvalidFrame = element.view.frame.height == 0 || element.view.frame.width == 0 || element.view.alpha == 0.0
            Assert.true(!element.view.isVisibleInWindowFrame() || hasInvalidFrame, "Element is visible on screen", in: interaction.context)
        }
    }
}
