import UIKit

final class ChartViewController: ThemableController {

  private var chart: Chart!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.hidesBackButton = true

    title = "Statistics"
  }

}
