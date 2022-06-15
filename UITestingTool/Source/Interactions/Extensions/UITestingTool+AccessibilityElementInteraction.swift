extension UITestingTool {

    @discardableResult public func key(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.key(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func view(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.view(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }
    
    @discardableResult public func label(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.label(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func button(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.button(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func imageView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.imageView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func textView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.textView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func textField(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.textField(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func searchField(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.searchField(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func webView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.webView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func slider(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.slider(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func scrollView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.scrollView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func collectionView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.collectionView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func tableView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.tableView(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func cell(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.cell(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func segmentedControl(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.segmentedControl(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }

    @discardableResult public func `switch`(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.switch(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }
    
    @discardableResult public func navigationBarTitle(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.navigationBarTitle(accessibilityId: accessibilityId, file: file, line: line)
    }
    
    @discardableResult public func datePicker(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.datePicker(accessibilityId: accessibilityId, atIndex: index, file: file, line: line)
    }
    
    @discardableResult public func alert(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.alert(accessibilityId: accessibilityId, file: file, line: line)
    }
}
