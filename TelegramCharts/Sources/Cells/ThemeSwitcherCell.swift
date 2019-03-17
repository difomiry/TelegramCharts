import UIKit

final class ThemeSwitcherCell: ThemeableCell {

  @IBOutlet private var titleLabel: UILabel!

  override func apply(for theme: Theme) {
    backgroundColor = theme.themeSwitcherCellBackgroundColor
    titleLabel.textColor = theme.themeSwitcherCellForegroundColor
    titleLabel.text = theme == Theme.day ? "Switch to Night Mode" : "Switch to Day Mode"
  }

}
