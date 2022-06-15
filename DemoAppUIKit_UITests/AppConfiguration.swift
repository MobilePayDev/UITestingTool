import XCTest
import UITestingConfiguration

final class AppConfiguration {

    private let app: XCUIApplication
    private let encoder = ConfigurationEncoder()

    init(_ testCase: TestCase) {
        self.app = testCase.app
    }

    fileprivate func apply<T: Configuration>(_ configuration: T) {
        if configuration is Inject {
            app.launch()
            return
        }
        guard let config = encoder.launchEnvironment(for: configuration) else { return }
        app.launchEnvironment[config.key] = config.value
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
