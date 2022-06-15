final class VisibilityTests: TestCase {

    func test_WHEN_get_single_label_AND_assert_visibility_THEN_success() throws {
        AppConfiguration(self)
            <~ AccessibilityConfiguration(firstAccessibilityId: "demo_label", secondAccessibilityId: "")
            <~ Inject()

        UITesting(self)
            .label(accessibilityId: "demo_label")
            .assert(visibility: .sufficientlyVisible)
    }

    func test_WHEN_multiple_labels_AND_assert_visibility_THEN_success() throws {
        AppConfiguration(self)
            <~ AccessibilityConfiguration(firstAccessibilityId: "demo_label_1", secondAccessibilityId: "label_11")
            <~ Inject()

        UITesting(self)
            .label(accessibilityId: "demo_label_1")
            .assert(visibility: .sufficientlyVisible)

        UITesting(self)
            .label(accessibilityId: "label_11")
            .assert(visibility: .sufficientlyVisible)
    }
}
