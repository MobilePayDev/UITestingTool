import UITestingTool

class KIFInteractionElementWorker: KIFInteractionWorker, InteractionElementWorker { // swiftlint:disable:this final_class
    func element(for interaction: Interaction) -> Any? {
        guard let accessibilityInteraction = interaction as? AccessibilityElementInteraction else { return nil }
        let actor = KIFUIViewTestActor(
            inFile: String(describing: interaction.context.file),
            atLine: Int(interaction.context.line),
            delegate: self
        )
        
        let element = actor?.usingIdentifier(accessibilityInteraction.accessibilityId)
        return element
    }
}
