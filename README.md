
# UITestingTool

Abstraction layer and tooling to write UI tests which enables to execute same tests on different frameworks such as XCTest and KIF.

- [Current Status](#current-status)
- [Features](#features)
- [Limitations](#limitations)
- [Getting Started](#getting-started)
- [Example](#example)
- [Mocking guidance](#mocking-guidance)
- [Override default behaviour](#override-default-behaviour)
- [For Contributors](#for-contributors)
- [License](#license)

## Current Status

Currently UITestingTool not reached major version and breaking API changes could be expected.

## Features

- [x] Write generic UI tests
- [x] Run same UI tests on different frameworks (XCUITest, KIF, etc)
    - [x] Run on XCUITest
    - [ ] Run on KIF
- [x] Override default behaviour of interactions (how to access views, how to assert, etc)
    - Enables to fix issues locally without branching out
    - Enables to use different implementation for default interactions 
- [x] Extend with custom interactions
    - Enables creating custom interactions that looks and feels like they are provided by tool itself
- [x] \*White-box mocking (with limitations)
    - Ability to create mocks that are executed on app process even if tests are runned in black-box fashion via XCUITest
    - Limitation: Mocking executed (via configurations) once per test in setUp stage

## Limitations

- No access of elements by index. It is intentional to simplify different implementation of execution frameworks.
- No access of elements by text. It is intentional to simplify different implementation of execution frameworks.
- Configuration executed only at the begining of a test run meaning there is no way to interact with app code (mocking, etc) during execution of a test. All mocking and setup should be done before a test is excuted (setUp stage).

## Getting Started

[Install and Run](https://github.com/MobilePayDev/UITestingTool/tree/main/docs/install-and-run.md)

## Example

Example of login with email and password test. 
This test is agnostic to which framework is executing it and don't have any references to any depenencies from test itself.

```swift
final class LoginUITests: TestCase {
    
    func test_login_existing_user_WHEN_email_provided_AND_password_provided_THEN_login_success_AND_home_screen_visible() {
        AppConfiguration(self)
            <~ LoginSceneConfiguration()
            <~ Inject()
        
        UITest(self)
            .label(accessibilityId: "login_view")
            .assert(visibility: .sufficientlyVisible)
            
        UITest(self)
            .textField(accessibilityId: "email_input_field")
            .assert(visibility: .sufficientlyVisible)
            .tap() // Focus on email text field
            .typeText("test@test.com")
            .typeReturn() // Jump to password field
            
        UITest(self)
            .textField(accessibilityId: "password_input_field")
            .assert(visibility: .sufficientlyVisible)
            .typeText("password123!")
            
        UITest(self)
            .button(accessibilityId: "login_button")
            .assert(visibility: .sufficientlyVisible)
            .tap()
            
        UITest(self)
            .view(accessibilityId: "home_view")
            .wait(for: .exist, timeout: .seconds(5)) // Extra timeout to accomodate for request time and animations
            .assert(visibility: .sufficientlyVisible)
    }
}
```

## Mocking guidance

### E2E testing approach

UI tests can be runned in E2E testing fashion with zero or minimal mocks. In this case, main thing that is very useful to mock is user that there won't be a need to do onboarding or reonboarding to try different user variant.

```swift
AppConfiguration(self)
    <~ UserConfiguration(variant: .userWithBasicLimits)
    <~ Inject()
```

### Integration testing approach

UI tests can be runned in Integration testing fashion when launching specific flow or screen and bottom part of app (backend, storage, etc) is mocked.

In this case you need to setup configuration (**what** to mock) and workers (**how** to mock) pairs. Conceptually, configuration must be independent of app code because tests target do not have visibility of app code. During tests execution configurations are passed to app and dedicated workers interprets them and executes them. Workers on other hand because they are executed on app target will have visibility of app code and functionality.

There are several ways how configurations and workers can be created:
 * Configuration & worker pair per test.
 * Configuration for flow/screen and configuration per service call.
 
For example, if you have onboarding flow and not that many variations you can have single `OnboardingFlowConfiguration` which would have some variations as input. Then `OnboardingFlowConfigurationWorker` will setup and launch onboarding flow and setup all the mocks needed for different onboarding variation.

Onboarding configuration example:

```swift
import UITestingConfiguration

struct OnboardingFlowConfiguration: Configuration {
    enum Variation: Codable {
        case existingUser
        case newUserPathV1
        case newUserPathV2
    }
    
    let variation: Variation
}
```

Onboarding configuration worker example:

```swift
import UITestingConfiguration

struct OnboardingFlowConfigurationWorker: ConfigurationWorker {
    
    func execute(_ configuration: Configuration) throws {
        let configuration = configuration as! OnboardingFlowConfiguration // swiftlint:disable:this force_cast
        
        // Launch onboarding flow HERE
        
        switch configuration.variation {
        case .existingUser:
            // Setup mocks
            break 
        case .newUserPathV1:
            // Setup mocks
            break
        case .newUserPathV2:
            // Setup mocks
            break
        }
    }
}
```

Example of injecting onboarding configuration:

```swift
AppConfiguration(self)
    <~ OnboardingFlowConfiguration(variant: .newUserPathV1)
    <~ Inject()
```

Also more granular approach is an option too. In that case there is more control on variation of service responses which is especially useful in error case scenarios.

Example of more granular configuration approach:

```swift
AppConfiguration(self)
    <~ PaymentFlowConfiguration()
    <~ PaymentCardsServiceConfiguration(variant: .singleValidCard)
    <~ PaymentConfirmationServiceConfiguration(response: .failureTimeout) // First time timeout error
    <~ PaymentConfirmationServiceConfiguration(response: .success)        // Success after retry
    <~ Inject()
```

## Override default behaviour

If default implementation do not suit your needs you can provide custom mapping and implementation how interactions should behave.

[Override default behaviour](https://github.com/MobilePayDev/UITestingTool/tree/main/docs/override-default-behaviour.md)

## For Contributors

- [ ] TODO: Add instruction for contributors

## License

UITestingTool is released under the MIT license. [See LICENSE](https://github.com/MobilePayDev/UITestingTool/tree/main/LICENSE) for details.
