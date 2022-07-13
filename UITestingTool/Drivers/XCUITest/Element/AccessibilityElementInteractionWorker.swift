import UITestingTool
import XCTest

final class AccessibilityElementInteractionWorker: InteractionElementWorker {

    private let app: XCUIApplication!

    init(driver: Driver) {
        self.app = (driver as? XCUITestDriver)?.app
    }

    func element(for interaction: Interaction) -> Any? {
        guard let accessibilityInteraction = interaction as? AccessibilityElementInteraction else { return nil }

        let query: XCUIElementQuery
        switch accessibilityInteraction.type {
        case .key:
            query = app.keys.matching(identifier: accessibilityInteraction.accessibilityId)
        case .view:
            query = app.otherElements.matching(identifier: accessibilityInteraction.accessibilityId)
        case .label:
            query = app.staticTexts.matching(identifier: accessibilityInteraction.accessibilityId)
        case .button:
            query = app.buttons.matching(identifier: accessibilityInteraction.accessibilityId)
        case .imageView:
            query = app.images.matching(identifier: accessibilityInteraction.accessibilityId)
        case .textView:
            query = app.textViews.matching(identifier: accessibilityInteraction.accessibilityId)
        case .textField:
            query = app.textFields.matching(identifier: accessibilityInteraction.accessibilityId)
        case .searchField:
            query = app.searchFields.matching(identifier: accessibilityInteraction.accessibilityId)
        case .webView:
            query = app.webViews.matching(identifier: accessibilityInteraction.accessibilityId)
        case .slider:
            query = app.sliders.matching(identifier: accessibilityInteraction.accessibilityId)
        case .scrollView:
            query = app.scrollViews.matching(identifier: accessibilityInteraction.accessibilityId)
        case .collectionView:
            query = app.collectionViews.matching(identifier: accessibilityInteraction.accessibilityId)
        case .tableView:
            query = app.tables.matching(identifier: accessibilityInteraction.accessibilityId)
        case .cell:
            query = app.cells.matching(identifier: accessibilityInteraction.accessibilityId)
        case .segmentedControl:
            query = app.segmentedControls.matching(identifier: accessibilityInteraction.accessibilityId)
        case .switch:
            query = app.switches.matching(identifier: accessibilityInteraction.accessibilityId)
        case .navigationBar:
            query = app.navigationBars.matching(identifier: accessibilityInteraction.accessibilityId)
        case .datePicker:
            query = app.datePickers.matching(identifier: accessibilityInteraction.accessibilityId)
        case .alert:
            query = app.alerts.matching(identifier: accessibilityInteraction.accessibilityId)
        }

        let element: XCUIElement = query.firstMatch

        Assert.notNil(element, "No element with accessibility ID: \"\(accessibilityInteraction.accessibilityId)\"", in: interaction.context)
        return element
    }
}
