import UIKit

final class KIFUIViewTestActor: KIFUIViewTestActorInterface {
    
    private let actor: KIFUIViewTestActorInterface
    
    var view: UIView! {
        actor.view
    }
    
    init?(inFile file: String, atLine line: NSInteger, delegate: KIFTestActorDelegateInterface) {
        self.actor = KIFDependencies.configuration.viewTestActor.init(inFile: file, atLine: line, delegate: delegate)!
    }
    
    @discardableResult func usingIdentifier(_ accessibilityIdentifier: String) -> Self {
        actor.usingIdentifier(accessibilityIdentifier)
        return self
    }
    
    @discardableResult func usingTimeout(_ executionBlockTimeout: TimeInterval) -> Self {
        actor.usingTimeout(executionBlockTimeout)
        return self
    }
    
    func waitForAnimationsToFinish() {
        actor.waitForAnimationsToFinish()
    }
    
    func setSwitchOn(_ switchIsOn: Bool) {
        actor.setSwitchOn(switchIsOn)
    }
    
    func tap() {
        actor.tap()
    }

    func longPress(withDuration duration: TimeInterval) {
        actor.longPress(withDuration: duration)
    }
    
    func expect(toContainText expectedResult: String) {
        actor.expect(toContainText: expectedResult)
    }
    
    @discardableResult func waitForView() -> UIView? {
        return actor.waitForView()
    }
    
    @discardableResult func validateEnteredText(_ validateEnteredText: Bool) -> Self {
        actor.validateEnteredText(validateEnteredText)
        return self
    }
    
    func enterText(_ text: String) {
        actor.enterText(text)
    }
    
    func clearText() {
        actor.clearText()
    }
    
    func scroll(byFractionOfSizeHorizontal horizontalFraction: CGFloat, vertical verticalFraction: CGFloat) {
        actor.scroll(byFractionOfSizeHorizontal: horizontalFraction, vertical: verticalFraction)
    }
}
