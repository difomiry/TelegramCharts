import UIKit

final class ChartViewController: ThemeableController {

  @IBOutlet private var tableView: UITableView!

  private var chart: Chart!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.hidesBackButton = true

    title = "Statistics"

    tableView.register(UINib(nibName: "SectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "SectionHeader")
    tableView.register(UINib(nibName: "ThemeSwitcherCell", bundle: nil), forCellReuseIdentifier: "ThemeSwitcherCell")

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

extension ChartViewController: UITableViewDelegate {

  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    switch (indexPath.section, indexPath.row) {
    case (1, 0):
      theme = theme == Theme.day ? Theme.night : Theme.day
    default:
      break
    }
  }

}

extension ChartViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      return 300 // chart
    default:
      return 44 // others
    }
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    switch section {
    case 0:
      return 60 // 'Followers' section header
    case 1:
      return 40 // Empty section header for theme switcher
    default:
      return 60
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2 // 'Followers' and theme switcher
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as! SectionHeader

    switch section {
    case 0:
      view.configure(with: "Followers")
    default:
      break
    }

    return view
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    switch section {
    case 0:
      return 1 // chart in 'Followers' section
    case 1:
      return 1 // theme switcher
    default:
      return 0
    }
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch (indexPath.section, indexPath.row) {
    case (0, 0):
      return UITableViewCell() // chart
    case (1, 0):
      return tableView.dequeueReusableCell(withIdentifier: "ThemeSwitcherCell") as! ThemeSwitcherCell
    default:
      return UITableViewCell()
    }
  }

}
