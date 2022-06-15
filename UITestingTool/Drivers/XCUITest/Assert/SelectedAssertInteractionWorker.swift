import UITestingTool
import XCTest

struct SelectedAssertInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? SelectedAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        if interaction.isSelected {
            Assert.true(element.isSelected, "Element is not selected", in: interaction.context)
        } else {
            Assert.false(element.isSelected, "Element is selected", in: interaction.context)
        }
    }
}
