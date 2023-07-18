import UITestingTool
import XCTest

struct ScrollActionInteractionWorker: InteractionWorker {

    private let element: XCUIElement!
    private let driver: Driver

    init(driver: Driver) {
        element = (driver as? XCUITestDriver)?.element
        self.driver = driver
    }

    func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? ScrollActionInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }

        guard element.exists else {
            Assert.fail("Element '\(element.identifier)' does not exist", in: interaction.context)
            return
        }

        switch interaction.action {
        case let .scroll(direction, times):
            for _ in 0..<times {
                element.gentleSwipe(direction)
            }
        case let .scrollToEdge(edge):
            let targetElement = furthestElement(for: edge)
            scroll(to: edge, of: targetElement)
        case let .scrollUntil(interaction, edge):
            let worker = AccessibilityElementInteractionWorker(driver: driver)
            guard let targetElement = worker.element(for: interaction) as? XCUIElement else { return }

            scroll(to: edge, of: targetElement)
        }
    }

    private func furthestElement(for edge: ScrollEdge) -> XCUIElement {
        var furthestChild: XCUIElement = element.children(matching: .other).firstMatch
        for child in element.children(matching: .other).allElementsBoundByIndex {
            switch edge {
            case .top:
                if child.frame.minY < furthestChild.frame.minY {
                    furthestChild = child
                }
            case .bottom:
                if child.frame.maxY > furthestChild.frame.maxY {
                    furthestChild = child
                }
            case .left:
                if child.frame.minX < furthestChild.frame.minX {
                    furthestChild = child
                }
            case .right:
                if child.frame.maxX > furthestChild.frame.maxX {
                    furthestChild = child
                }
            }
        }
        return furthestChild
    }

    private func scroll(to edge: ScrollEdge, of targetElement: XCUIElement) {
        let contentView = targetElement
        
        let maxNumberOfSwipes = 100
        for _ in 0..<maxNumberOfSwipes {
            switch edge {
            case .top:
                let contentViewTopLeftCorner = contentView.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).screenPoint
                let scrollViewTopLeftCorner = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).screenPoint

                if contentViewTopLeftCorner.y < scrollViewTopLeftCorner.y {
                    element.gentleSwipe(.down)
                } else {
                    return
                }
            case .bottom:
                let contentViewBottomLeftCorner = contentView.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 1)).screenPoint
                let scrollViewBottomLeftCorner = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 1)).screenPoint

                if contentViewBottomLeftCorner.y > scrollViewBottomLeftCorner.y {
                    element.gentleSwipe(.up)
                } else {
                    return
                }
            case .left:
                let contentViewTopLeftCorner = contentView.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).screenPoint
                let scrollViewTopLeftCorner = element.coordinate(withNormalizedOffset: CGVector(dx: 0, dy: 0)).screenPoint

                if contentViewTopLeftCorner.x < scrollViewTopLeftCorner.x {
                    element.gentleSwipe(.right)
                } else {
                    return
                }
            case .right:
                let contentViewTopRightCorner = contentView.coordinate(withNormalizedOffset: CGVector(dx: 1, dy: 0)).screenPoint
                let scrollViewTopRightCorner = element.coordinate(withNormalizedOffset: CGVector(dx: 1, dy: 0)).screenPoint

                if contentViewTopRightCorner.x > scrollViewTopRightCorner.x {
                    element.gentleSwipe(.left)
                } else {
                    return
                }
            }
        }
    }
}

private extension XCUIElement {

    func gentleSwipe(_ direction: ScrollDirection) {
        let half: CGFloat = 0.5
        let adjustment: CGFloat = 0.25
        let pressDuration: TimeInterval = 0.05

        let lessThanHalf = half - adjustment
        let moreThanHalf = half + adjustment

        let centre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: half))
        let aboveCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: lessThanHalf))
        let belowCentre = self.coordinate(withNormalizedOffset: CGVector(dx: half, dy: moreThanHalf))
        let leftOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: lessThanHalf, dy: half))
        let rightOfCentre = self.coordinate(withNormalizedOffset: CGVector(dx: moreThanHalf, dy: half))

        switch direction {
        case .up:
            centre.press(forDuration: pressDuration, thenDragTo: aboveCentre)
        case .down:
            centre.press(forDuration: pressDuration, thenDragTo: belowCentre)
        case .left:
            centre.press(forDuration: pressDuration, thenDragTo: leftOfCentre)
        case .right:
            centre.press(forDuration: pressDuration, thenDragTo: rightOfCentre)
        }
    }
}
