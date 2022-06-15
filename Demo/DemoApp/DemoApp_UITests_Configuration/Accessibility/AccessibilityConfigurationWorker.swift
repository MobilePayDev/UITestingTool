import UIKit
import UITestingConfiguration

struct AccessibilityConfigurationWorker: ConfigurationWorker {

    func execute(_ configuration: Configuration) throws {
        guard let configuration = configuration as? AccessibilityConfiguration else { throw ConfigurationWorkerError.invalidConfiguration }

        let scene = UIApplication.shared.connectedScenes.first
        guard let sceneDelegate = scene?.delegate as? SceneDelegate else { fatalError() }
        guard let viewController = (sceneDelegate.window?.rootViewController as? UINavigationController)?.topViewController as? ViewController else { fatalError() }
        
        viewController.demoLabel.accessibilityIdentifier = configuration.firstAccessibilityId
        viewController.labelA.accessibilityIdentifier = configuration.secondAccessibilityId
    }
}
