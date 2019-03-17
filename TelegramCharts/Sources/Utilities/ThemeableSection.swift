import UIKit

class ThemeableSection: UITableViewHeaderFooterView, Themeable {

    private var themeManager = ThemeManager.shared

    override func awakeFromNib() {
        super.awakeFromNib()

        themeManager.register(themeable: self)
    }

    func apply(for theme: Theme) {}

}
