import XCTest
import UITestingTool

class TestCase: XCTestCase {

    private(set) var app: XCUIApplication!

    override func setUpWithError() throws {
        try super.setUpWithError()
        continueAfterFailure = false

        app = XCUIApplication()
    }
}
