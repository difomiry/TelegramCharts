import UIKit

final class ChartSelectorCell: ThemeableCell {
  @IBOutlet private var chartColorView: UIView! {
    didSet {
      chartColorView.layer.cornerRadius = 3
    }
  }

  @IBOutlet var titleLabel: UILabel!
  override func awakeFromNib() {
    super.awakeFromNib()

    layoutMargins = .zero
  }

  func configure(with title: String, and color: UIColor) {
    chartColorView.backgroundColor = color
    titleLabel.text = title
  }

}
