import UITestingTool
import XCTest

struct TapActionInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard element.exists else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }
        Assert.true(element.isHittable, "Element is not hittable", in: interaction.context)
        element.tap()
    }
}
