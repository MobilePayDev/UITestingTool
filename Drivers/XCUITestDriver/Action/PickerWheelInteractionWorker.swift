import UITestingTool
import XCTest

struct PickerWheelInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? PickerWheelInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        guard element.exists else {
            Assert.fail("Element '\(element.identifier)' does not exist", in: interaction.context)
            return
        }

        let pickerWheel = element.pickerWheels.element(boundBy: interaction.index)
        guard pickerWheel.exists else {
            Assert.fail("Picker wheel do not exist", in: interaction.context)
            return
        }
        
        switch interaction.action {
        case .index(let index):
            pickerWheel.swipeByIndex(index)
        case .value(let value):
            pickerWheel.adjust(toPickerWheelValue: value)
        }
    }
}

private extension XCUIElement {

    func swipeByIndex(_ index: Int) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.15
        let pressDuration: TimeInterval = Double.leastNormalMagnitude

        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment

        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))

        let dragDestination = index > 0 ? aboveCentre : belowCentre
        
        for _ in 0..<abs(index) {
            centre.press(forDuration: pressDuration, thenDragTo: dragDestination, withVelocity: .slow, thenHoldForDuration: pressDuration)
        }
    }
}
