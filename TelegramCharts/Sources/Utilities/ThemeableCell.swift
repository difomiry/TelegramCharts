import UIKit

class ThemeableCell: UITableViewCell {

  private var themeManager = ThemeManager.shared

  override func awakeFromNib() {
    super.awakeFromNib()

    themeManager.register(themeable: self)
  }

}

extension ThemeableCell: Themeable {

  func apply(for theme: Theme) {}

}
