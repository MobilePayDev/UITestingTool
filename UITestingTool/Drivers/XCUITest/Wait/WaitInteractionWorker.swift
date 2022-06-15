import UITestingTool
import XCTest

final class WaitInteractionWorker: InteractionWorker {

    private let element: XCUIElement!

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? WaitInteraction else { fatalError() }
        
        let timeout: TimeInterval
        switch interaction.timeout {
        case let .seconds(seconds):
            timeout = TimeInterval(seconds)
        }
        let exist = element.waitForExistence(timeout: timeout)

        switch interaction.event {
        case .exist:
            Assert.true(exist, "Wait for exist timed out", in: interaction.context)
        case let .existOrNot(completion):
            completion(exist)
        }
    }
}
