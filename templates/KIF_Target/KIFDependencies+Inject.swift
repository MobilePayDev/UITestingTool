import KIFDriver
import UIKit
//import KIF

extension KIFDependencies {
    
    static func inject() {
        KIFDependencies.configuration = KIFDependenciesConfiguration(
            viewTestActor: KIFUIViewTestActorBridge.self,
            viewExtension: KIFUIViewExtensionBridge.self
        )
    }
}

private final class KIFUIViewTestActorBridge: NSObject, KIFUIViewTestActorInterface {
    
    private var actor: KIFUIViewTestActor!
    private weak var delegate: KIFTestActorDelegateInterface?
    
    var view: UIView! {
        actor.view
    }
    
    init?(inFile file: String, atLine line: NSInteger, delegate: KIFTestActorDelegateInterface) {
        super.init()
        self.delegate = delegate
        self.actor = KIFUIViewTestActor(inFile: file, atLine: line, delegate: self)!
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

extension KIFUIViewTestActorBridge: KIFTestActorDelegate {
    
    func fail(with exception: NSException!, stopTest stop: Bool) {
        delegate?.fail(with: exception, stopTest: stop)
    }
    
    func fail(withExceptions exceptions: [Any]!, stopTest stop: Bool) {
        delegate?.fail(withExceptions: exceptions, stopTest: stop)
    }
}

private final class KIFUIViewExtensionBridge: KIFUIViewExtensionInterface {
    
    private let view: UIView
    
    init(_ view: UIView) {
        self.view = view
    }
    
    func isVisibleInWindowFrame() -> Bool {
        view.isVisibleInWindowFrame()
    }
    
    func tap() {
        view.tap()
    }
    
    func tap(at point: CGPoint) {
        view.tap(at: point)
    }
    
    func isVisibleInViewHierarchy() -> Bool {
        view.isVisibleInViewHierarchy()
    }
}
