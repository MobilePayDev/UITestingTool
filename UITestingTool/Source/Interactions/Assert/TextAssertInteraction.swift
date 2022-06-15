public struct TextAssertInteraction: Interaction {
    public enum Assertion { case equal, notEqual }
    
    public let text: String
    public let assertion: Assertion
    public let context: Context
}
