import UITestingTool

final class VisibilityAssertInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? VisibilityAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard let elementView = element.view else {
            if interaction.visibility == .sufficientlyVisible {
                Assert.fail("Element does not exist", in: interaction.context)
            }
            return
        }
        
        switch interaction.visibility {
        case .sufficientlyVisible:
            Assert.true(!elementView.frame.isEmpty, "Element has empty frame", in: interaction.context)
            Assert.true(elementView.isVisibleInViewHierarchy(), "Element not visible on screen", in: interaction.context)
            Assert.true(elementView.window?.isKeyWindow == true, "Element not in key window", in: interaction.context)
        case .notVisible:
            let hasInvalidFrame = elementView.frame.height == 0 || elementView.frame.width == 0 || elementView.alpha == 0.0
            Assert.true(!elementView.isVisibleInWindowFrame() || hasInvalidFrame, "Element is visible on screen", in: interaction.context)
        }
    }
}
