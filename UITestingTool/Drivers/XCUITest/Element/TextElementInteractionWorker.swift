import UITestingTool
import XCTest

final class TextElementInteractionWorker: InteractionElementWorker {

    private let app: XCUIApplication!

    init(driver: Driver) {
        self.app = (driver as? XCUITestDriver)?.app
    }

    func element(for interaction: Interaction) -> Any? {
        guard let interaction = interaction as? TextElementInteraction else { return nil }

        let element: XCUIElement
        switch interaction.type {
        case .key:
            element = app.keys[interaction.text].firstMatch
        case .view:
            element = app.otherElements[interaction.text].firstMatch
        case .label:
            element = app.staticTexts[interaction.text].firstMatch
        case .button:
            element = app.buttons[interaction.text].firstMatch
        case .imageView:
            element = app.images[interaction.text].firstMatch
        case .textView:
            element = app.textViews[interaction.text].firstMatch
        case .textField:
            element = app.textFields[interaction.text].firstMatch
        case .searchField:
            element = app.searchFields[interaction.text].firstMatch
        case .webView:
            element = app.webViews[interaction.text].firstMatch
        case .slider:
            element = app.sliders[interaction.text].firstMatch
        case .scrollView:
            element = app.scrollViews[interaction.text].firstMatch
        case .collectionView:
            element = app.collectionViews[interaction.text].firstMatch
        case .tableView:
            element = app.tables[interaction.text].firstMatch
        case .cell:
            element = app.cells[interaction.text].firstMatch
        case .segmentedControl:
            element = app.segmentedControls[interaction.text].firstMatch
        case .switch:
            element = app.switches[interaction.text].firstMatch
        case .navigationBarTitle:
            element = app.navigationBars.staticTexts[interaction.text]
        case .datePicker:
            element = app.datePickers[interaction.text].firstMatch
        case .alert:
            element = app.alerts[interaction.text].firstMatch
        }

        Assert.notNil(element, "No element with text: \"\(interaction.text)\"", in: interaction.context)
        return element
    }
}
