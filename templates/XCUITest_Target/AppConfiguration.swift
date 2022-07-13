import XCTest
import UITestingConfiguration

final class AppConfiguration {

    private let app: XCUIApplication
    private let encoder = ConfigurationEncoder()

    init(_ testCase: TestCase) {
        self.app = testCase.app

        applyDefaultConfigurations()
    }

    private func applyDefaultConfigurations() {
        // Place to apply default configurations:
        // - Analytics, Crash reporting disabling
        // - Permissions
        // - Other
        
        // Example
        // self <~ FirebaseConfiguration()
        //     <~ SiriPermissionConfiguration(authorizationStatus: .authorized)
        //     <~ NotificationPermissionConfiguration(authorizationStatus: .authorized)
        //     <~ ContactsPermissionConfiguration(authorizationStatus: .authorized)
        //     <~ LocationPermissionConfiguration(authorizationStatus: .authorizedAlways)
        
        // NOTE: Configurations are implemented in a way that they run in the order they are set.
        // This means that if for example default contact permission is .authorized then it can be overrided in a test to .denied or other status
    }

    fileprivate func apply<T: Configuration>(_ configuration: T) {
        if configuration is Inject {
            app.launchArguments = ["-UI_TESTING"]
            app.launch()
            return
        }
        if let environment = encoder.launchEnvironment(for: configuration) {
            app.launchEnvironment[environment.key] = environment.value
        }
    }
}

struct Inject: Configuration {}

precedencegroup ApplyOperatorPrecedence {
    associativity: left
}

infix operator <~: ApplyOperatorPrecedence
@discardableResult func <~<T: Configuration>(appConfiguration: AppConfiguration, configuration: T) -> AppConfiguration { // swiftlint:disable:this static_operator
    appConfiguration.apply(configuration)
    return appConfiguration
}
