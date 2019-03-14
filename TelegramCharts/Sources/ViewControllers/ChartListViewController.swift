import UIKit

final class ChartListViewController: ThemableController {

  @IBOutlet private var tableView: UITableView!

  private let dataProvider: DataProviderType = DataProvider()

  private var charts: [Chart]?

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Charts"

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

}

extension ChartListViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    if let viewController = storyboard?.instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController {
      navigationController?.pushViewController(viewController, animated: true)
    }
  }

}

extension ChartListViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return charts?.count ?? 0
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") ?? UITableViewCell(style: .default, reuseIdentifier: "Cell")

    cell.textLabel?.text = "\(indexPath.row)"

    return cell
  }

}
