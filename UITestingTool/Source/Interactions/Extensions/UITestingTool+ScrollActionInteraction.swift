extension Driver { // swiftlint:disable:this file_name

    @discardableResult public func scroll(_ direction: ScrollDirection, times: Int = 1, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ ScrollActionInteraction(action: .scroll(direction: direction, times: times), context: Context(file: file, line: line))
    }

    @discardableResult public func scrollToEdge(_ edge: ScrollEdge, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ ScrollActionInteraction(action: .scrollToEdge(edge: edge), context: Context(file: file, line: line))
    }
    
    @discardableResult public func scrollUntil(_ element: AccessibilityElementInteraction, edge: ScrollEdge, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ ScrollActionInteraction(action: .scrollUntil(element: element, edge: edge), context: Context(file: file, line: line))
    }
}
