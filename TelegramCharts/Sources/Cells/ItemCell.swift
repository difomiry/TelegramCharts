import UIKit

final class ItemCell: ThemeableCell {

  @IBOutlet private var titleLabel: UILabel!
  
  func configure(with title: String) {
    titleLabel.text = title
  }

  override func apply(for theme: Theme) {
    backgroundColor = theme.cellBackgroundColor
    titleLabel.textColor = theme.cellForegroundColor
  }

}
