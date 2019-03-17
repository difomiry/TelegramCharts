import UIKit

final class ChartListViewController: ThemeableController {

  @IBOutlet private var tableView: UITableView!

  private let dataProvider: DataProviderType = DataProvider()

  private var charts: [Chart]?

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Charts"

    tableView.tableFooterView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 1))
    tableView.tableFooterView?.backgroundColor = theme.separatorColor

    tableView.register(UINib(nibName: "ItemCell", bundle: nil), forCellReuseIdentifier: "ItemCell")

    tableView.delegate = self
    tableView.dataSource = self

    dataProvider.fetchCharts(success: handleCharts, failure: handleError)
  }

  fileprivate func handleCharts(charts: [Chart]) {
    self.charts = charts
  }

  fileprivate func handleError(error: Error) {
    print(error.localizedDescription)
  }

  override func apply(for theme: Theme) {
    super.apply(for: theme)

    tableView.separatorColor = theme.separatorColor
    tableView.tableFooterView?.backgroundColor = theme.separatorColor
  }

}

extension ChartListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let viewController = ChartViewController.initialize(from: storyboard, with: charts![indexPath.row]) {
      navigationController?.pushViewController(viewController, animated: true)
    }
  }

}

extension ChartListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return charts?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell

    cell.configure(with: charts?[indexPath.row].names.map { $0.key }.joined(separator: " ") ?? "")

    return cell
  }

}
