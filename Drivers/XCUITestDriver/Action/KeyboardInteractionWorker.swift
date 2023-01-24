import UITestingTool
import XCTest

struct KeyboardInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? KeyboardInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        switch interaction.action {
        case let .text(text):
            element.typeText(text)
        case .delete:
            element.typeText(XCUIKeyboardKey.delete.rawValue)
        case .return:
            element.typeText(XCUIKeyboardKey.return.rawValue)
        }
    }
}
