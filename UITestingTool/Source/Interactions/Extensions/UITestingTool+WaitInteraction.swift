extension Driver { // swiftlint:disable:this file_name

    @discardableResult public func wait(for event: WaitInteraction.Event, timeout: Time = .seconds(10), file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ WaitInteraction(event: event, timeout: timeout, context: Context(file: file, line: line))
    }
}
