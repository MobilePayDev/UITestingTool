import UITestingTool
import XCTest

final class AccessibilityElementInteractionWorker: InteractionElementWorker {

    private let parent: XCUIElement!

    init(driver: Driver) {
        let driver = driver as? XCUITestDriver
        if let element = driver?.element {
            parent = element
        } else {
            parent = driver?.app
        }
    }

    func element(for interaction: Interaction) -> Any? {
        guard let accessibilityInteraction = interaction as? AccessibilityElementInteraction else { return nil }

        let query: XCUIElementQuery
        switch accessibilityInteraction.type {
        case .key:
            query = parent.descendants(matching: .key).matching(identifier: accessibilityInteraction.accessibilityId)
        case .view:
            query = parent.descendants(matching: .other).matching(identifier: accessibilityInteraction.accessibilityId)
        case .label:
            query = parent.descendants(matching: .staticText).matching(identifier: accessibilityInteraction.accessibilityId)
        case .button:
            query = parent.descendants(matching: .button).matching(identifier: accessibilityInteraction.accessibilityId)
        case .imageView:
            query = parent.descendants(matching: .image).matching(identifier: accessibilityInteraction.accessibilityId)
        case .textView:
            query = parent.descendants(matching: .textView).matching(identifier: accessibilityInteraction.accessibilityId)
        case .textField:
            query = parent.descendants(matching: .textField).matching(identifier: accessibilityInteraction.accessibilityId)
        case .searchField:
            query = parent.descendants(matching: .searchField).matching(identifier: accessibilityInteraction.accessibilityId)
        case .webView:
            query = parent.descendants(matching: .webView).matching(identifier: accessibilityInteraction.accessibilityId)
        case .slider:
            query = parent.descendants(matching: .slider).matching(identifier: accessibilityInteraction.accessibilityId)
        case .scrollView:
            query = parent.descendants(matching: .scrollView).matching(identifier: accessibilityInteraction.accessibilityId)
        case .collectionView:
            query = parent.descendants(matching: .collectionView).matching(identifier: accessibilityInteraction.accessibilityId)
        case .tableView:
            query = parent.descendants(matching: .table).matching(identifier: accessibilityInteraction.accessibilityId)
        case .cell:
            query = parent.descendants(matching: .cell).matching(identifier: accessibilityInteraction.accessibilityId)
        case .segmentedControl:
            query = parent.descendants(matching: .segmentedControl).matching(identifier: accessibilityInteraction.accessibilityId)
        case .switch:
            query = parent.descendants(matching: .switch).matching(identifier: accessibilityInteraction.accessibilityId)
        case .navigationBar:
            query = parent.descendants(matching: .navigationBar).matching(identifier: accessibilityInteraction.accessibilityId)
        case .datePicker:
            query = parent.descendants(matching: .datePicker).matching(identifier: accessibilityInteraction.accessibilityId)
        case .alert:
            query = parent.descendants(matching: .alert).matching(identifier: accessibilityInteraction.accessibilityId)
        }

        let element: XCUIElement = query.firstMatch

        Assert.notNil(element, "No element with accessibility ID: \"\(accessibilityInteraction.accessibilityId)\"", in: interaction.context)
        return element
    }
}
