import UITestingTool

class KIFInteractionWorker: NSObject, InteractionWorker, KIFTestActorDelegateInterface { // swiftlint:disable:this final_class
    let element: KIFUIViewTestActor!
    let driver: Driver

    required init(driver: Driver) {
        element = (driver as? KIFDriver)?.element
        self.driver = driver
    }

    func execute(_ interaction: Interaction) {}

    // MARK: - KIFTestActorDelegate
    
    func fail(with exception: NSException!, stopTest stop: Bool) {}

    func fail(withExceptions exceptions: [Any]!, stopTest stop: Bool) {
        assertionFailure("Method not implemented")
    }
}
