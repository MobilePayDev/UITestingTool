extension UITestingTool {

    @discardableResult public func key(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .key, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func view(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .view, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func label(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .label, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func button(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .button, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func imageView(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .imageView, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func textView(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .textView, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func textField(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .textField, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func searchField(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .searchField, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func webView(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .webView, text: text, context: Context(file: file, line: line))
    }

    @discardableResult public func slider(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .slider, text: text, context: Context(file: file, line: line))
    }
    
    @discardableResult public func navigationBarTitle(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .navigationBarTitle, text: text, context: Context(file: file, line: line))
    }
    
    @discardableResult public func datePicker(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .datePicker, text: text, context: Context(file: file, line: line))
    }
    
    @discardableResult public func alert(text: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ TextElementInteraction(type: .alert, text: text, context: Context(file: file, line: line))
    }
}
