public protocol InteractionElementWorker {
    init(driver: Driver)
    func element(for interaction: Interaction) -> Any?
}
