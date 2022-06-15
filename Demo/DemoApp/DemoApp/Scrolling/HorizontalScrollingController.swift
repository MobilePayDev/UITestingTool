import UIKit

final class HorizontalScrollingController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        let scrollView = UIScrollView(frame: view.bounds)
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.accessibilityIdentifier = "scrollview"
        view.addSubview(scrollView)

        let stackView = UIStackView(frame: view.bounds)
        stackView.translatesAutoresizingMaskIntoConstraints = false
        stackView.axis = .horizontal
        scrollView.addSubview(stackView)

        NSLayoutConstraint.activate([
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.topAnchor.constraint(equalTo: view.topAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),

            stackView.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            stackView.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor)
        ])

        let view1 = UIView()
        view1.translatesAutoresizingMaskIntoConstraints = false
        view1.backgroundColor = .red
        NSLayoutConstraint.activate([
            view1.widthAnchor.constraint(equalToConstant: 500),
            view1.heightAnchor.constraint(equalToConstant: view.bounds.height)
        ])

        let view2 = UIView()
        view2.translatesAutoresizingMaskIntoConstraints = false
        view2.backgroundColor = .green
        NSLayoutConstraint.activate([
            view2.widthAnchor.constraint(equalToConstant: 500),
            view2.heightAnchor.constraint(equalToConstant: view.bounds.height)
        ])

        stackView.addArrangedSubview(view1)
        stackView.addArrangedSubview(view2)
    }
}
