public struct KeyboardInteraction: Interaction {
    public enum Action {
        case text(String)
        case delete
        case `return`
    }
    public let action: Action
    public let context: Context
}
