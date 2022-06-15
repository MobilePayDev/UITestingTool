extension Driver { // swiftlint:disable:this file_name

    @discardableResult public func value(_ completion: @escaping (Any?) -> Void, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ ValueInteraction(completion: completion, context: Context(file: file, line: line))
    }
}
