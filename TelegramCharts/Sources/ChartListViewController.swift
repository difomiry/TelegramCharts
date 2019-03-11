import UIKit

final class ChartListViewController: UIViewController {

  @IBOutlet private var tableView: UITableView!

  private var charts: [TelegramChart]?

  override func viewDidLoad() {
    super.viewDidLoad()

    title = "Charts"

    tableView.delegate = self
    tableView.dataSource = self

    DataManager.shared.fetchCharts(success: handleCharts, failure: handleError)
  }

  fileprivate func handleCharts(charts: [TelegramChart]) {
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
