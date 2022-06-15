extension UITestingTool {

    @discardableResult public func typeText(_ text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        for char in text {
            key(text: String(char), file: file, line: line).tap(file: file, line: line)
        }
        return driver
    }

    @discardableResult public func typeKeys(_ keys: [String], file: StaticString = #filePath, line: UInt = #line) -> Driver {
        for key in keys {
            self.key(text: key, file: file, line: line).tap(file: file, line: line)
        }
        return driver
    }
}
