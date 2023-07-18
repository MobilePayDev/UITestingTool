import UITestingTool
import XCTest

struct SlideActionInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? SlideActionInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard element.exists else {
            Assert.fail("Element '\(element.identifier)' does not exist", in: interaction.context)
            return
        }

        element.adjust(toNormalizedSliderPosition: CGFloat(interaction.value))
    }
}
