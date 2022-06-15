import XCTest
@testable import UITestingConfiguration

class ConfigurationDecoderTests: XCTestCase {

    func testExample() throws {
        let environment: [String: String] = [
            "UITestingConfiguration_2_Config": "{\"value\":99}".base64String,
            "UITestingConfiguration_99_Config": "{\"value\":11}".base64String,
            "UITestingConfiguration_1_Config": "{\"value\":77}".base64String
        ]
        let context = ConfigurationDecoder.configurationContext(for: environment)

        XCTAssertEqual(context[0].type, "Config")
        XCTAssertEqual(context[0].data.asText, "{\"value\":77}")

        XCTAssertEqual(context[1].type, "Config")
        XCTAssertEqual(context[1].data.asText, "{\"value\":99}")

        XCTAssertEqual(context[2].type, "Config")
        XCTAssertEqual(context[2].data.asText, "{\"value\":11}")
    }
}

private extension String {
    var base64String: String {
        self.data(using: .utf8)!.base64EncodedString()
    }
}

private extension Data {
    var asText: String? {
        String(data: self, encoding: .utf8)
    }
}
