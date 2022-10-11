import UIKit

public protocol KIFUIViewExtensionInterface {
    
    init(_ view: UIView)
    
    // - (BOOL)isVisibleInWindowFrame;
    func isVisibleInWindowFrame() -> Bool
    
    // - (void)tap;
    func tap()
    
    // - (void)tapAtPoint:(CGPoint)point;
    func tap(at point: CGPoint)
    
    // - (BOOL)isVisibleInViewHierarchy
    func isVisibleInViewHierarchy() -> Bool
}
