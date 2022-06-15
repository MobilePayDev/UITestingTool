public struct VisibilityAssertInteraction: Interaction {
    
    public enum Visibility {
        case sufficientlyVisible
        case notVisible
    }
    public let visibility: Visibility
    public let context: Context
}
