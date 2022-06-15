final class DemoAppUIKit_UITests: TestCase {

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

    func test_vertical_scroll_WHEN_scrolling_up_2_times_THEN_success() throws {
        AppConfiguration(self)
            <~ Inject()

        UITesting(self)
            .button(accessibilityId: "v_scroll_button")
            .assert(visibility: .sufficientlyVisible)
            .tap()

        UITesting(self)
            .scrollView(accessibilityId: "scrollview")
            .scroll(.up, times: 2)
    }

    func test_vertical_scroll_WHEN_scrolling_to_the_bottom_AND_back_to_the_top_THEN_success() throws {
        AppConfiguration(self)
            <~ Inject()

        UITesting(self)
            .button(accessibilityId: "v_scroll_button")
            .assert(visibility: .sufficientlyVisible)
            .tap()

        UITesting(self)
            .scrollView(accessibilityId: "scrollview")
            .scrollToEdge(.bottom)
            .scrollToEdge(.top)
    }

    func test_horizontal_scroll_WHEN_scrolling_left_2_times_THEN_success() throws {
        AppConfiguration(self)
            <~ Inject()

        UITesting(self)
            .button(accessibilityId: "h_scroll_button")
            .assert(visibility: .sufficientlyVisible)
            .tap()

        UITesting(self)
            .scrollView(accessibilityId: "scrollview")
            .scroll(.left, times: 2)
    }

    func test_horizontal_scroll_WHEN_scrolling_to_the_bottom_AND_back_to_the_top_THEN_success() throws {
        AppConfiguration(self)
            <~ Inject()

        UITesting(self)
            .button(accessibilityId: "h_scroll_button")
            .assert(visibility: .sufficientlyVisible)
            .tap()

        UITesting(self)
            .scrollView(accessibilityId: "scrollview")
            .scrollToEdge(.right)
            .scrollToEdge(.left)
    }
}
