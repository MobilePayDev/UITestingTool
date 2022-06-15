extension Driver { // swiftlint:disable:this file_name

    @discardableResult public func assert(visibility: VisibilityAssertInteraction.Visibility, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ VisibilityAssertInteraction(visibility: visibility, context: Context(file: file, line: line))
    }

    @discardableResult public func assert(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ TextAssertInteraction(text: text, assertion: .equal, context: Context(file: file, line: line))
    }

    @discardableResult public func assert(textIsNot: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ TextAssertInteraction(text: textIsNot, assertion: .notEqual, context: Context(file: file, line: line))
    }

    @discardableResult public func assert(isEnabled: Bool, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ EnabledAssertInteraction(isEnabled: isEnabled, context: Context(file: file, line: line))
    }
    
    @discardableResult public func assert(toggleIsOn: Bool, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ ToggleAssertInteraction(isOn: toggleIsOn, context: Context(file: file, line: line))
    }
}
