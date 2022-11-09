import UITestingConfiguration
//@testable import MY_APP

final class AppConfiguration {

    private let encoder = ConfigurationEncoder()
    private var testingEnvironment: [String: String] = [:]

    init(_ testCase: TestCase) {
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
             UITestingConfiguration.MAPPING_LIST.apply(testingEnvironment)
            
            // Example of configuration mapping list (configuration + configuration worker)
            // `UITestingConfiguration.default.apply(testingEnvironment)`
            /*
             import UITestingConfiguration

             extension UITestingConfiguration {

                 static var `default`: UITestingConfiguration {
                     UITestingConfiguration(map: [
                         (LoginConfiguration.self, LoginConfigurationWorker.self),
                         (HomeScreenConfiguration.self, HomeScreenConfigurationWorker.self)
                     ])
                 }
             }

             */
        }
        if let environment = encoder.launchEnvironment(for: configuration) {
            testingEnvironment[environment.key] = environment.value
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
