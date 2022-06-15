import XCTest
@testable import UITestingConfiguration

class ConfigurationEncoderTests: XCTestCase {

    func test_encoding_WHEN_multiple_different_configurations_THEN_keys_auto_incremented() throws {
        struct Config1: Configuration {}
        struct Config2: Configuration { let value: Int }
        let encoder = ConfigurationEncoder()

        let result1 = encoder.launchEnvironment(for: Config1())
        XCTAssertEqual(result1?.key, "UITestingConfiguration_1_Config1")

        let result2 = encoder.launchEnvironment(for: Config2(value: 99))
        XCTAssertEqual(result2?.key, "UITestingConfiguration_2_Config2")
    }

    func test_encoding_WHEN_multiple_same_configurations_THEN_keys_auto_incremented_AND_same_order() throws {
        struct Config: Configuration { let value: Int }
        let encoder = ConfigurationEncoder()

        let result1 = encoder.launchEnvironment(for: Config(value: 77))
        XCTAssertEqual(result1?.key, "UITestingConfiguration_1_Config")
        XCTAssertEqual(result1?.value.base64DecodedString, "{\"value\":77}")

        let result2 = encoder.launchEnvironment(for: Config(value: 99))
        XCTAssertEqual(result2?.key, "UITestingConfiguration_2_Config")
        XCTAssertEqual(result2?.value.base64DecodedString, "{\"value\":99}")
    }
}

private extension String {

    var base64DecodedString: String? {
        guard let data = Data(base64Encoded: self) else { return nil }
        
        return String(data: data, encoding: .utf8)
    }
}
