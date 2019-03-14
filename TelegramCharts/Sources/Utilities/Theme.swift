import UIKit

struct Theme {

  let identifier: String

  let statusBarStyle: UIStatusBarStyle
  let navigationBarBackgroundColor: UIColor
  let navigationBarForegroundColor: UIColor

  static let day = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.day",
    statusBarStyle: .default,
    navigationBarBackgroundColor: UIColor(hexString: "#F7F7F7") ?? .white,
    navigationBarForegroundColor: .black)

  static let night = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.night",
    statusBarStyle: .lightContent,
    navigationBarBackgroundColor: UIColor(hexString: "#213040") ?? .black,
    navigationBarForegroundColor: .white)

}

extension Theme: Equatable {

  static func ==(lhs: Theme, rhs: Theme) -> Bool {
    return lhs.identifier == rhs.identifier
  }

}
