import UIKit

final class ChartViewController: ThemeableController {

  @IBOutlet private var tableView: UITableView!

  private var chart: Chart!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.hidesBackButton = true

    title = "Statistics"

    tableView.tableFooterView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 1))
    tableView.tableFooterView?.backgroundColor = tableView.separatorColor

    tableView.delegate = self
    tableView.dataSource = self
  }

  override func apply(for theme: Theme) {
    super.apply(for: theme)

    tableView.separatorColor = theme.separatorColor
    tableView.tableFooterView?.backgroundColor = theme.separatorColor
  }

}

extension ChartViewController: UITableViewDelegate {}

extension ChartViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    return UITableViewCell()
  }

}
