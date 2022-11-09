import UITestingTool
import XCTest

struct Assert {
    static func fail(_ message: String, in context: Context) {
        XCTFail(message, file: context.file, line: context.line)
    }

    static func `true`(_ expression: Bool, _ message: String, in context: Context) {
        XCTAssertTrue(expression, message, file: context.file, line: context.line)
    }

    static func `false`(_ expression: Bool, _ message: String, in context: Context) {
        XCTAssertFalse(expression, message, file: context.file, line: context.line)
    }

    static func notNil(_ expression: Any?, _ message: String, in context: Context) {
        XCTAssertNotNil(expression, message, file: context.file, line: context.line)
    }

    static func equal(_ expression1: String?, _ expression2: String?, _ message: String, in context: Context) {
        XCTAssertEqual(expression1, expression2, message, file: context.file, line: context.line)
    }
    
    static func notEqual(_ expression1: String?, _ expression2: String?, _ message: String, in context: Context) {
        XCTAssertNotEqual(expression1, expression2, message, file: context.file, line: context.line)
    }
}
