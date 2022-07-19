
# Install and run

This document shows you how to install UITestingTool and then how to set up and run your first
test.

## Install

You can add UITestingTool to Xcode projects in three ways: using [SPM](#swift-package-manager-installation), [Carthage](#carthage-installation) or [Manually](#github-installation) through the Xcode Project.

#### Step 0: Create "UI Testing Bundle" target

Creating UI tests excution target is needed for all instalation variants

<img src="images/template_ui_testing_bundle.png" width="500">

<img src="images/new_target_for_xcuitest.png" width="500">

### Swift Package Manager Installation

- [ ] TODO: Add support and instructions for SPM

### Carthage Installation

#### Step 1: Install dependencies via Carthage

- Add dependency entry to Cartfile `github "MobilePayDev/UITestingTool.git" "main"` which will point to latest version.
- Install dependencies via Carthage `carthage update --use-xcframeworks` it will create 3 frameworks: `UITestingConfiguration`, `UITestingTool` and `XCUITestDriver`.

#### Step 2: Add dependencies to the project

- Drag `UITestingConfiguration` to your project and link to:
    - `YourApp` target
    - `YourApp_UITests_XCUITest` target
- Drag `UITestingTool` to your project and link to:
    - `YourApp_UITests_XCUITest` target
- Drag `XCUITestDriver` to your project and link to:
    - `YourApp_UITests_XCUITest` target
    
In the end you should have:

<img src="images/app_target_dependencies.png" width="500">

<img src="images/xcuitest_target_dependencies.png" width="500">

### GitHub Installation

- [ ] TODO: Add support and instructions for SPM

## Set Up and run your first test

- [ ] TODO: Add instructions for frist test
