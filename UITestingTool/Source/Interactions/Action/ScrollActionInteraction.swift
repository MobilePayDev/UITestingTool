public struct ScrollActionInteraction: Interaction {
    public enum Action {
        case scroll(direction: ScrollDirection, times: Int)
        case scrollToEdge(edge: ScrollEdge)
        case scrollUntil(element: ElementInteraction, edge: ScrollEdge)
    }
    public let action: Action
    public let context: Context
}

public enum ScrollDirection {
    case left
    case right
    case up // swiftlint:disable:this identifier_name
    case down
}

public enum ScrollEdge {
    case left
    case right
    case top
    case bottom
}
