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
    theme = theme == Theme.day ? Theme.night : Theme.day
  }

}

extension ChartViewController: UITableViewDataSource {

  func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
    return indexPath.section == 0 ? 300 : 44
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return section == 0 ? 60 : 40
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return 2
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as! SectionHeader
    if section == 0 {
      view.configure(with: "Followers")
    }
    return view
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return 1
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    if indexPath.section == 0 {
      return UITableViewCell()
    } else {
      return tableView.dequeueReusableCell(withIdentifier: "ThemeSwitcherCell") as! ThemeSwitcherCell
    }
  }

}
