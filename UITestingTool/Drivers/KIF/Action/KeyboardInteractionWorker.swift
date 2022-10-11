import UITestingTool

final class KeyboardInteractionWorker: KIFInteractionWorker {

    override func execute(_ interaction: Interaction) {
        super.execute(interaction)
        
        guard let interaction = interaction as? KeyboardInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.view != nil, element.view.isVisibleInViewHierarchy() else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        switch interaction.action {
        case let .text(text):
            element.validateEnteredText(false)
            element.enterText(text)
        case .delete:
            typeDelete()
        case .return:
            typeReturn()
        }
    }

    private func typeDelete() {
        // it should delete one char but deletes everything
        element.clearText()
    }
    
    private func typeReturn() {
        self.element.enterText("\n")
    }
}
