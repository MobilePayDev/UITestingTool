extension UITestingTool {

    @discardableResult public func key(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.key(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func view(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.view(accessibilityId: accessibilityId, file: file, line: line)
    }
    
    @discardableResult public func label(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.label(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func button(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.button(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func imageView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.imageView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func textView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.textView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func textField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.textField(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func searchField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.searchField(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func webView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.webView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func slider(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.slider(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func scrollView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.scrollView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func collectionView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.collectionView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func tableView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.tableView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func cell(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.cell(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func segmentedControl(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.segmentedControl(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func `switch`(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.switch(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func navigationBar(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.navigationBar(accessibilityId: accessibilityId, file: file, line: line)
    }
    
    @discardableResult public func datePicker(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.datePicker(accessibilityId: accessibilityId, file: file, line: line)
    }
    
    @discardableResult public func alert(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        driver <~ AccessibilityElementInteraction.alert(accessibilityId: accessibilityId, file: file, line: line)
    }
}

extension Driver {

    @discardableResult public func key(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.key(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func view(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.view(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func label(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.label(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func button(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.button(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func imageView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.imageView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func textView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.textView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func textField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.textField(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func searchField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.searchField(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func webView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.webView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func slider(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.slider(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func scrollView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.scrollView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func collectionView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.collectionView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func tableView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.tableView(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func cell(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.cell(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func segmentedControl(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.segmentedControl(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func `switch`(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.switch(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func navigationBar(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.navigationBar(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func datePicker(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.datePicker(accessibilityId: accessibilityId, file: file, line: line)
    }

    @discardableResult public func alert(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> Driver {
        self <~ AccessibilityElementInteraction.alert(accessibilityId: accessibilityId, file: file, line: line)
    }
}
