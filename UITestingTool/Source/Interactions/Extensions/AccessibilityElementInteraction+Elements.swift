// swiftlint:disable line_length
extension AccessibilityElementInteraction {

    @discardableResult public static func key(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .key, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func view(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .view, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func label(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .label, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func button(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .button, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func imageView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .imageView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func textView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .textView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func textField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .textField, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func searchField(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .searchField, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func webView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .webView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func slider(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .slider, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func scrollView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .scrollView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func collectionView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .collectionView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func tableView(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .tableView, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func cell(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .cell, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func segmentedControl(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .segmentedControl, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func `switch`(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .switch, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }
    
    @discardableResult public static func navigationBar(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .navigationBar, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }

    @discardableResult public static func datePicker(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .datePicker, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }
    
    @discardableResult public static func alert(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .alert, accessibilityId: accessibilityId, context: Context(file: file, line: line))
    }
}
