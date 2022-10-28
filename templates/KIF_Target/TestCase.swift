import UITestingTool
import KIFDriver
//import KIF
//@testable import MY_APP

class TestCase: KIFTestCase { // swiftlint:disable:this final_class

    override func setUpWithError() throws {
        try super.setUpWithError()

        continueAfterFailure = false
        KIFDependencies.inject()
        clearAppState()
    }
    
    override func tearDownWithError() throws {
        try super.tearDownWithError()
        clearAppState()
        clearAppRootController()
    }
    
    private func clearAppRootController() {
        let newRootViewController = UIViewController();
        if #available(iOS 13, *) {
            UIApplication.shared.delegate?.window??.rootViewController = newRootViewController
        } else { // The hack for earlier iOS versions
            fatalError("Proper way to change root ViewController for older iOS versions")
            // Fix for https://stackoverflow.com/a/27153956/849645
        }
    }

    private func clearAppState() {
        // App state clearing code
        // Depending on your app it might be that clearing app state is enough just in `tearDownWithError` or `setUpWithError`
    }
}
