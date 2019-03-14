import UIKit

struct Theme {

  let identifier: String

  let statusBarStyle: UIStatusBarStyle
  let navigationBarBackgroundColor: UIColor
  let navigationBarForegroundColor: UIColor

  static let day = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.day",
    statusBarStyle: .default,
    navigationBarBackgroundColor: .white,
    navigationBarForegroundColor: .black)

  static let night = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.night",
    statusBarStyle: .lightContent,
    navigationBarBackgroundColor: .black,
    navigationBarForegroundColor: .white)

}

extension Theme: Equatable {

  static func ==(lhs: Theme, rhs: Theme) -> Bool {
    return lhs.identifier == rhs.identifier
  }

}
