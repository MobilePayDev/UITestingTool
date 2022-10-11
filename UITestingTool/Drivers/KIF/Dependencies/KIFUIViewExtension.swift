import UIKit

extension UIView {
    
    // - (BOOL)isVisibleInWindowFrame;
    func isVisibleInWindowFrame() -> Bool {
        KIFDependencies.configuration.viewExtension.init(self)
            .isVisibleInWindowFrame()
    }
    
    // - (void)tap;
    func tap() {
        KIFDependencies.configuration.viewExtension.init(self)
            .tap()
    }
    
    // - (void)tapAtPoint:(CGPoint)point;
    func tap(at point: CGPoint) {
        KIFDependencies.configuration.viewExtension.init(self)
            .tap(at: point)
    }
    
    // - (BOOL)isVisibleInViewHierarchy
    func isVisibleInViewHierarchy() -> Bool {
        KIFDependencies.configuration.viewExtension.init(self)
            .isVisibleInViewHierarchy()
    }
}
