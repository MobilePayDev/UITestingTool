import UITestingTool
import XCTest

struct LongPressInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? LongPressInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }
        Assert.true(element.isHittable, "Element is not hittable", in: interaction.context)
        element.press(forDuration: interaction.duration)
    }
}
