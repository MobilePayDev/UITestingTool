import UITestingTool
import KIF

class KIFInteractionWorker: NSObject, InteractionWorker, KIFTestActorDelegate { // swiftlint:disable:this final_class
    let element: KIFUIViewTestActor!
    let driver: Driver

    required init(driver: Driver) {
        element = (driver as? KIFDriver)?.element
        self.driver = driver
    }

    func execute(_ interaction: Interaction) {}

    func fail(with exception: NSException!, stopTest stop: Bool) {}

    func fail(withExceptions exceptions: [Any]!, stopTest stop: Bool) {
        assertionFailure("Method not implemented")
    }
}
