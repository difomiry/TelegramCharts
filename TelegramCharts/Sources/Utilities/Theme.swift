import UIKit

struct Theme {

  let identifier: String

  let statusBarStyle: UIStatusBarStyle
  let navigationBarBackgroundColor: UIColor
  let navigationBarForegroundColor: UIColor
  let backgroundColor: UIColor
  let separatorColor: UIColor
  let cellBackgroundColor: UIColor
  let cellForegroundColor: UIColor

  static let day = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.day",
    statusBarStyle: .default,
    navigationBarBackgroundColor: UIColor(hexString: "#F7F7F7") ?? .white,
    navigationBarForegroundColor: .black,
    backgroundColor: UIColor(hexString: "#EFEFF4") ?? .white,
    separatorColor: UIColor(hexString: "#C8C7CC") ?? .black,
    cellBackgroundColor: .white,
    cellForegroundColor: .black)

  static let night = Theme(
    identifier: "com.difomiry.TelegramCharts.themes.night",
    statusBarStyle: .lightContent,
    navigationBarBackgroundColor: UIColor(hexString: "#213040") ?? .black,
    navigationBarForegroundColor: .white,
    backgroundColor: UIColor(hexString: "#18222D") ?? .black,
    separatorColor: UIColor(hexString: "#1C1A23") ?? .black,
    cellBackgroundColor: UIColor(hexString: "#212F3F") ?? .black,
    cellForegroundColor: .white)

}

extension Theme: Equatable {

  static func ==(lhs: Theme, rhs: Theme) -> Bool {
    return lhs.identifier == rhs.identifier
  }

}
