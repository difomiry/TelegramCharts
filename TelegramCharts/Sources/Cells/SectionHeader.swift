import UIKit

final class SectionHeader: ThemeableSection {

  @IBOutlet private var titleLabel: UILabel!

  func configure(with title: String) {
    titleLabel.text = title.uppercased()
  }

  override func apply(for theme: Theme) {
    backgroundColor = theme.sectionBackgroundColor
    titleLabel.textColor = theme.sectionForegroundColor
  }

}
