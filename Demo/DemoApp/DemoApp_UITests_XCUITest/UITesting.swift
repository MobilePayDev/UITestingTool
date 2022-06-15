import UITestingTool
import XCUITestDriver

final class UITesting: UITestingTool {

    init(_ testCase: TestCase) {
        let driver = XCUITestDriver(app: testCase.app)
        super.init(driver: driver)
    }
}
