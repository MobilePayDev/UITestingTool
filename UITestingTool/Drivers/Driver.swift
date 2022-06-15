public protocol Driver {
    init(interactionElementWorkers: [(Interaction.Type, InteractionElementWorker.Type)], interactionWorkers: [(Interaction.Type, InteractionWorker.Type)])
    func execute(_ interaction: Interaction)
}

precedencegroup ApplyOperatorPrecedence {
    associativity: left
}

infix operator <~: ApplyOperatorPrecedence
func <~ (driver: Driver, interaction: Interaction) -> Driver { // swiftlint:disable:this static_operator
    driver.execute(interaction)
    return driver
}
