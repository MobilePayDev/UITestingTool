import UIKit
import UITestingConfiguration

final class ViewController: UIViewController {

    @IBOutlet private(set) weak var demoLabel: UILabel!
    @IBOutlet private(set) weak var labelA: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        UITestingConfiguration.default.apply()
        // Do any additional setup after loading the view.
    }
}
