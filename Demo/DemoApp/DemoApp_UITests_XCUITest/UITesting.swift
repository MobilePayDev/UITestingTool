import UITestingTool
import XCUITestDriver

final class UITesting: UITestingTool {

    init(_ testCase: TestCase) {
        let driver = XCUITestDriver(
            app: testCase.app,
            interactionElementWorkers: [],
            interactionWorkers: []
        )
        super.init(driver: driver)
    }
}
