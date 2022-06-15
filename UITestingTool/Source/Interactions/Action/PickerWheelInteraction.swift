public struct PickerWheelInteraction: Interaction {
    public enum Action {
        case index(_ index: Int)
        case value(_ value: String)
    }
    public let context: Context
    public let index: Int
    public let action: Action
}
