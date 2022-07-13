
# UITestingTool

UI tests abstraction tool which born from strugle of migrating many UI tests from deprecated 3rd party framework when there was no other way just to rewrite all tests.

- [Current Status](#current-status)
- [Features](#features)
- [Limitations](#limitations)
- [Getting Started](#getting-started)

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

## Getting Started

[Install and Run](https://github.com/MobilePayDev/UITestingTool/tree/main/docs/install-and-run.md)

## For Contributors

TBD
