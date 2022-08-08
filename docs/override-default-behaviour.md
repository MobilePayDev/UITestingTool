
# Override default behaviour

There are 2 steps to override default behaviour:
1. Provide custom interaction and worker mapping
2. Implement custom worker

Example of setting custom mapping for text assertion.

```swift
import UITestingTool
import XCUITestDriver
import XCTest

final class UITesting: UITestingTool {

    init(_ testCase: TestCase) {
        let driver = XCUITestDriver(
            app: testCase.app,
            interactionWorkers: [(TextAssertInteraction.self, CustomTextAssertInteractionWorker.self)]
        )
        super.init(driver: driver)
    }
}
```

Example of custom text assertion implementation:

```swift
import UITestingTool
import XCUITestDriver
import XCTest

struct CustomTextAssertInteractionWorker: InteractionWorker {
    private let element: XCUIElement!

    init(driver: Driver) {
        self.element = (driver as? XCUITestDriver)?.element
    }
    
    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? TextAssertInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element does not exist", in: interaction.context)
            return
        }

        let elementText: String?
        if element.elementType == .webView {
            let label = element.staticTexts.firstMatch
            elementText = label.value as? String
        } else if element.elementType == .navigationBar {
            let label = element.staticTexts.firstMatch
            elementText = label.label
        } else if !element.label.isEmpty {
            elementText = element.label
        } else if let text = element.value as? String {
            elementText = text
        } else {
            elementText = nil
        }
        let expectedText = interaction.text
        
        switch interaction.assertion {
        case .equal:
            Assert.equal(elementText, expectedText, "Expected text: \"\(expectedText)\", got text: \"\(elementText ?? "")\"", in: interaction.context)
        case .notEqual:
            Assert.notEqual(elementText, expectedText, "Expected text: \"\(expectedText)\" to be different from text: \"\(elementText ?? "")\"", in: interaction.context)
        }
    }
}
```
