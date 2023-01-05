import UITestingTool
import XCTest

struct VisibilityAssertInteractionWorker: InteractionWorker {

    private let element: XCUIElement!
    private let existanceTimeout: TimeInterval = 1

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? VisibilityAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        switch interaction.visibility {
        case .sufficientlyVisible:
            Assert.true(element.waitForExistence(timeout: existanceTimeout), "Element does not exist", in: interaction.context)
            Assert.true(!element.frame.isEmpty, "Element has empty frame", in: interaction.context)
            Assert.true(XCUIApplication().windows.element(boundBy: 0).frame.contains(element.frame), "Element not visible on screen", in: interaction.context)
        case .notVisible:
            guard element.waitForExistence(timeout: existanceTimeout) else {
                // If element do not exist it is not visible
                return
            }
            let isElementFrameOnScreen = XCUIApplication().windows.element(boundBy: 0).frame.contains(element.frame)
            guard isElementFrameOnScreen else {
                // Element frame is not visible on screen
                return
            }
            Assert.false(element.isHittable, "Element is hittable", in: interaction.context)
        }
    }
}
