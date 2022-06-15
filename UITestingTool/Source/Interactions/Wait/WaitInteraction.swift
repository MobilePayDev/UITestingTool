public struct WaitInteraction: Interaction {

    public enum Event {
        case exist
        case existOrNot((Bool) -> Void)
    }
    public var event: Event
    public var timeout: Time
    public var context: Context
}
