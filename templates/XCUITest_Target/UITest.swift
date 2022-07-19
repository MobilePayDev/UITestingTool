import XCTest
import UITestingTool
import XCUITestDriver

final class UITest: UITestingTool {

    init(_ testCase: TestCase) {
        let driver = XCUITestDriver(
            app: testCase.app,
            interactionElementWorkers: [],
            interactionWorkers: []
        )
        super.init(driver: driver)
    }
}
