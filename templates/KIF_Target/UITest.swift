import UITestingTool
import KIFDriver

final class UITest: UITestingTool {

    init(_ testCase: TestCase) {
        let driver = KIFDriver(
            interactionElementWorkers: [],
            interactionWorkers: []
        )
        super.init(driver: driver)
    }
}
