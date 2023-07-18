import UITestingTool
import XCTest

struct ToggleAssertInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? ToggleAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element '\(element.identifier)' does not exist", in: interaction.context)
            return
        }
        
        if interaction.isOn {
            Assert.true(element.isOn, "Switch '\(element.identifier)' is toggled on", in: interaction.context)
        } else {
            Assert.false(element.isOn, "Switch '\(element.identifier)' is toggled off", in: interaction.context)
        }
    }
}

private extension XCUIElement {
    
    var isOn: Bool {
        guard let state = value as? String else { return false }
        let toggleOn = "1"
        return state == toggleOn
    }
}
