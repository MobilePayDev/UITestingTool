import UITestingTool
import XCTest

final class WaitInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)

        guard let interaction = interaction as? WaitInteraction else { fatalError() }

        if case .seconds(let time) = interaction.timeout {
            element.usingTimeout(Double(time)).waitForView()
            element.waitForAnimationsToFinish()
        }

        switch interaction.event {
        case .exist:
            Assert.true(element.view != nil, "Wait for element '\(accessibilityIdentifier)' exist timed out", in: interaction.context)
        case let .existOrNot(completion):
            completion(element.view != nil)
        }
    }
}
