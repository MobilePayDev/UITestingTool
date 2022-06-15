// swiftlint:disable line_length
extension AccessibilityElementInteraction {

    @discardableResult public static func key(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .key, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func view(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .view, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func label(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .label, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func button(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .button, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func imageView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .imageView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func textView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .textView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func textField(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .textField, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func searchField(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .searchField, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func webView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .webView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func slider(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .slider, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func scrollView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .scrollView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func collectionView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .collectionView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func tableView(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .tableView, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func cell(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .cell, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func segmentedControl(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .segmentedControl, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func `switch`(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .switch, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }

    @discardableResult public static func navigationBarTitle(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .navigationBarTitle, accessibilityId: accessibilityId, index: nil, context: Context(file: file, line: line))
    }

    @discardableResult public static func datePicker(accessibilityId: String, atIndex index: Int? = nil, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .datePicker, accessibilityId: accessibilityId, index: index, context: Context(file: file, line: line))
    }
    
    @discardableResult public static func alert(accessibilityId: String, file: StaticString = #filePath, line: UInt = #line) -> AccessibilityElementInteraction {
        AccessibilityElementInteraction(type: .alert, accessibilityId: accessibilityId, index: nil, context: Context(file: file, line: line))
    }
}
