extension Driver { // swiftlint:disable:this file_name
    
    @discardableResult public func tap(file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ TapActionInteraction(context: Context(file: file, line: line))
    }

    @discardableResult public func longPress(for duration: Double, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ LongPressInteraction(context: Context(file: file, line: line), duration: duration)
    }

    @discardableResult public func typeText(_ text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ KeyboardInteraction(action: .text(text), context: Context(file: file, line: line))
    }

    @discardableResult public func typeDelete(_ times: Int = 1, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        for _ in 0..<times {
            let interaction = KeyboardInteraction(action: .delete, context: Context(file: file, line: line))
            execute(interaction)
        }
        return self
    }

    @discardableResult public func typeReturn(file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ KeyboardInteraction(action: .return, context: Context(file: file, line: line))
    }

    @discardableResult public func slide(to value: Float, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ SlideActionInteraction(value: value, context: Context(file: file, line: line))
    }

    @discardableResult public func scrollPickerWheel(position index: Int, to action: PickerWheelInteraction.Action, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ PickerWheelInteraction(context: Context(file: file, line: line), index: index, action: action)
    }
}
