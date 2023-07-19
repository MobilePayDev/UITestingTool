import UITestingTool
import Foundation

class KIFInteractionWorker: NSObject, InteractionWorker, KIFTestActorDelegateInterface { // swiftlint:disable:this final_class
    let element: KIFUIViewTestActor!
    var accessibilityIdentifier: String {
        return element.view?.accessibilityIdentifier ?? "ACCESSIBILITY ID NOT AVAILABLE"
    }
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
