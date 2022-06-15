import UITestingTool
import XCTest

struct EnabledAssertInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? EnabledAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }
        
        if interaction.isEnabled {
            Assert.true(element.isEnabled, "Element is not enabled", in: interaction.context)
        } else {
            Assert.false(element.isEnabled, "Element is not disabled", in: interaction.context)
        }
    }
}
