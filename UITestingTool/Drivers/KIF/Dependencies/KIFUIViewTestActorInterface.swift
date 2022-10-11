import UIKit

public protocol KIFTestActorDelegate {
    func fail(with exception: NSException!, stopTest stop: Bool)
    func fail(withExceptions exceptions: [Any]!, stopTest stop: Bool)
}

public protocol KIFUIViewTestActorInterface {
    // @property (nonatomic, strong, readonly) UIView *view;
    var view: UIView! { get }
    
    // + (instancetype)actorInFile:(NSString *)file atLine:(NSInteger)line delegate:(id<KIFTestActorDelegate>)delegate
    init?(inFile file: String, atLine line: NSInteger, delegate: KIFTestActorDelegate)
    
    // - (instancetype)usingIdentifier:(NSString *)accessibilityIdentifier
    @discardableResult func usingIdentifier(_ accessibilityIdentifier: String) -> Self
    
    // - (instancetype)usingTimeout:(NSTimeInterval)executionBlockTimeout
    @discardableResult func usingTimeout(_ executionBlockTimeout: TimeInterval) -> Self
    
    // - (void)waitForAnimationsToFinish;
    func waitForAnimationsToFinish()
    
    // - (void)setSwitchOn:(BOOL)switchIsOn
    func setSwitchOn(_ switchIsOn: Bool)
    
    // - (void)tap;
    func tap()

    // - (void)longPressWithDuration:(NSTimeInterval)duration;
    func longPress(withDuration duration: TimeInterval)
    
    // - (void)expectToContainText:(NSString *)expectedResult;
    func expect(toContainText expectedResult: String)
    
    // - (UIView *)waitForView;
    @discardableResult func waitForView() -> UIView?
    
    // - (instancetype)validateEnteredText:(BOOL)validateEnteredText;
    @discardableResult func validateEnteredText(_ validateEnteredText: Bool) -> Self
    
    // - (void)enterText:(NSString *)text;
    func enterText(_ text: String)
    
    // - (void)clearText;
    func clearText()
    
    // - (void)scrollByFractionOfSizeHorizontal:(CGFloat)horizontalFraction vertical:(CGFloat)verticalFraction;
    func scroll(byFractionOfSizeHorizontal horizontalFraction: CGFloat, vertical verticalFraction: CGFloat)
}
