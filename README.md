
# UITestingTool

UI tests abstraction tool which born from strugle of migrating many UI tests from deprecated 3rd party framework when there was no other way just to rewrite all tests.

- [Current Status](#current-status)
- [Features](#features)
- [Limitations](#limitations)
- [Getting Started](#getting-started)
- [Example](#example)
- [For Contributors](#for-contributors)
- [License](#license)

## Current Status

Currently UITestingTool not reached major version and breaking API changes are expected.

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
- [x] White-box mocking
    - Ability to create mocks that are executed on app process even if tests are runned in black-box fashion via XCUITest

## Limitations

- No access of elements by index. It is intentional to simplify different implementation of execution frameworks.
- No access of elements by text. It is intentional to simplify different implementation of execution frameworks.
- Configuration executed only at the begining of a test run meaning there is no way to interact with app code (mocking, etc) during execution of a test. All mocking and setup should be done before a test is excuted.

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

## For Contributors

- [ ] TODO: Add instruction for contributors

## License

UITestingTool is released under the MIT license. [See LICENSE](https://github.com/MobilePayDev/UITestingTool/tree/main/LICENSE) for details.
