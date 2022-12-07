import UITestingTool
import UIKit

final class ScrollActionInteractionWorker: KIFInteractionWorker {
    override func execute(_ interaction: Interaction) {
        guard let interaction = interaction as? ScrollActionInteraction else {
            Assert.fail("Invalid interaction", in: interaction.context)
            return
        }
        
        switch interaction.action {
        case let .scroll(direction, times):
            for _ in 0..<times {
                element.gentleSwipe(direction)
            }
        case let .scrollToEdge(edge):
            guard let targetElement = furthestElement(for: edge) else { return }
            scroll(to: edge, of: targetElement)
        case let .scrollUntil(interaction, edge):
            let worker = AccessibilityElementInteractionWorker(driver: driver)
            guard let targetElement = (worker.element(for: interaction) as? KIFUIViewTestActor)?.view else {
                return
            }

            scroll(to: edge, of: targetElement)
        }
    }

    private func furthestElement(for edge: ScrollEdge) -> UIView? {
        guard let elementView = element.view, var furthestChild = elementView.subviews.first else { return nil }
        for child in elementView.subviews {
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
    
    private func scroll(to edge: ScrollEdge, of targetElement: UIView) {
        let contentView = targetElement
        
        let maxNumberOfSwipes = 100
        let elementView: UIView! = element.view
        for _ in 0..<maxNumberOfSwipes {
            switch edge {
            case .top:
                let scrollViewTopLeft = elementView.frame.origin
                guard let contentViewTopLeft = elementView.superview?.convert(contentView.bounds.origin, from: contentView) else { break }
                if contentViewTopLeft.y < scrollViewTopLeft.y {
                    element.gentleSwipe(.up)
                } else {
                    break
                }
            case .bottom:
                let scrollViewBottomLeft = CGPoint(x: elementView.frame.minX, y: elementView.frame.maxY)
                
                let contentViewBottomLeft = CGPoint(x: contentView.bounds.minX, y: contentView.bounds.maxY)
                guard let contentViewBottomLeftNormalised = elementView.superview?.convert(contentViewBottomLeft, from: contentView) else { break }
                if contentViewBottomLeftNormalised.y > scrollViewBottomLeft.y {
                    element.gentleSwipe(.down)
                } else {
                    break
                }
            case .left:
                let scrollViewTopLeft = elementView.frame.origin
                guard let contentViewTopLeft = elementView.superview?.convert(contentView.bounds.origin, from: contentView) else { break }
                if contentViewTopLeft.x < scrollViewTopLeft.x {
                    element.gentleSwipe(.right)
                } else {
                    break
                }
            case .right:
                let scrollViewTopRight = CGPoint(x: elementView.frame.maxX, y: elementView.frame.minY)
                let contentViewTopRight = CGPoint(x: contentView.bounds.maxX, y: contentView.bounds.minY)
                guard let contentViewTopRightNormalised = elementView.superview?.convert(contentViewTopRight, from: contentView) else { break }
                if contentViewTopRightNormalised.x > scrollViewTopRight.x {
                    element.gentleSwipe(.left)
                } else {
                    break
                }
            }
        }
    }
}

private extension KIFUIViewTestActor {
    func gentleSwipe(_ direction: ScrollDirection) {
        let adjustment: CGFloat = 0.25

        switch direction {
        case .up:
            scroll(byFractionOfSizeHorizontal: 0.0, vertical: adjustment)
        case .down:
            scroll(byFractionOfSizeHorizontal: 0.0, vertical: -adjustment)
        case .left:
            scroll(byFractionOfSizeHorizontal: 0.0, vertical: 0.0)
        case .right:
            scroll(byFractionOfSizeHorizontal: 0.0, vertical: 0.0)
        }
    }
}
