public protocol InteractionWorker {
    init(driver: Driver)
    func execute(_ interaction: Interaction)
}
