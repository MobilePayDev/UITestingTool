extension Driver { // swiftlint:disable:this file_name

    @discardableResult public func assertSelected(file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ SelectedAssertInteraction(isSelected: true, context: Context(file: file, line: line))
    }

    @discardableResult public func assertNotSelected(file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ SelectedAssertInteraction(isSelected: false, context: Context(file: file, line: line))
    }
}
