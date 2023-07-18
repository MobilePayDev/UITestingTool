import UITestingTool
import XCTest

struct ValueInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? ValueInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element '\(element.identifier)' does not exist", in: interaction.context)
            return
        }
        
        interaction.completion(element.value)
    }
}
