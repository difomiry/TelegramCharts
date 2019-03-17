import UIKit

final class ChartViewController: ThemeableController {

  enum Cell {

    /// A cell with the chart.
    case chart(chart: Chart)

    /// A cell with a chart selector.
    case selector(name: String, color: UIColor)

    /// A cell with the theme switcher.
    case switcher

  }

  struct Section {

    /// The section title. If equals nil then section is untitled.
    let title: String?

    /// The setion cells.
    let cells: [Cell]

  }

  private var sections = [Section]()

  @IBOutlet private var tableView: UITableView!

  private var chart: Chart!

  override func viewDidLoad() {
    super.viewDidLoad()

    navigationItem.hidesBackButton = true

    title = "Statistics"

    tableView.register(UINib(nibName: "SectionHeader", bundle: nil), forHeaderFooterViewReuseIdentifier: "SectionHeader")
    tableView.register(UINib(nibName: "ChartSelectorCell", bundle: nil), forCellReuseIdentifier: "ChartSelectorCell")
    tableView.register(UINib(nibName: "ThemeSwitcherCell", bundle: nil), forCellReuseIdentifier: "ThemeSwitcherCell")

    tableView.tableFooterView = UIView(frame: .init(x: 0, y: 0, width: tableView.frame.width, height: 1))
    tableView.tableFooterView?.backgroundColor = tableView.separatorColor

    tableView.delegate = self
    tableView.dataSource = self

    tableView.layoutMargins = .zero
    tableView.contentInset = .zero

    var cells = [Cell]()

    cells.append(.chart(chart: chart))

    chart.names.forEach { name in
      if name.key != "x" {
        if let color = chart.colors.first(where: { color in name.key == color.key }) {
          cells.append(.selector(name: name.value, color: UIColor(hexString: color.value)!))
        }
      }
    }

    sections.append(.init(title: "Followers", cells: cells))
    sections.append(.init(title: nil, cells: [.switcher]))
  }

  override func apply(for theme: Theme) {
    super.apply(for: theme)

    tableView.separatorColor = theme.separatorColor
    tableView.tableFooterView?.backgroundColor = theme.separatorColor
  }

  static func initialize(from storyboard: UIStoryboard?, with chart: Chart) -> ChartViewController? {
    if let viewController = storyboard?.instantiateViewController(withIdentifier: "ChartViewController") as? ChartViewController {
      viewController.chart = chart
      return viewController
    }
    return nil
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
    switch sections[indexPath.section].cells[indexPath.row] {
    case .chart:
      return 300
    case .selector:
      return 50
    case .switcher:
      return 50
    }
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    if sections[section].title == nil {
      return 40
    } else  {
      return 60
    }
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {

    let view = tableView.dequeueReusableHeaderFooterView(withIdentifier: "SectionHeader") as! SectionHeader

    if let title = sections[section].title {
      view.configure(with: title)
    }

    return view
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return sections[section].cells.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    switch sections[indexPath.section].cells[indexPath.row] {
    case .chart:
      return UITableViewCell()
    case let .selector(name, color):
      let cell = tableView.dequeueReusableCell(withIdentifier: "ChartSelectorCell") as! ChartSelectorCell
      cell.configure(with: name, and: color)
      return cell
    case .switcher:
      return tableView.dequeueReusableCell(withIdentifier: "ThemeSwitcherCell") as! ThemeSwitcherCell
    }
  }

}
