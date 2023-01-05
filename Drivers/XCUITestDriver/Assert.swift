import UITestingTool
import XCTest

public struct Assert {
    public static func fail(_ message: String, in context: Context) {
        XCTFail(message, file: context.file, line: context.line)
    }

    public static func `true`(_ expression: Bool, _ message: String, in context: Context) {
        XCTAssertTrue(expression, message, file: context.file, line: context.line)
    }

    public static func `false`(_ expression: Bool, _ message: String, in context: Context) {
        XCTAssertFalse(expression, message, file: context.file, line: context.line)
    }

    public static func notNil(_ expression: Any?, _ message: String, in context: Context) {
        XCTAssertNotNil(expression, message, file: context.file, line: context.line)
    }

    public static func equal(_ expression1: String?, _ expression2: String?, _ message: String, in context: Context) {
        XCTAssertEqual(expression1, expression2, message, file: context.file, line: context.line)
    }
    
    public static func notEqual(_ expression1: String?, _ expression2: String?, _ message: String, in context: Context) {
        XCTAssertNotEqual(expression1, expression2, message, file: context.file, line: context.line)
    }
}
