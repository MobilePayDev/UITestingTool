import UITestingConfiguration

extension UITestingConfiguration {

    static var `default`: UITestingConfiguration {
        UITestingConfiguration(map: [
            (AccessibilityConfiguration.self, AccessibilityConfigurationWorker.self)
        ])
    }
}
