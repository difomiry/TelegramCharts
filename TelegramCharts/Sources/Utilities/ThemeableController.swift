import UIKit

class ThemeableController: UIViewController {

  private var themeManager = ThemeManager.shared

  private var themedStatusBarStyle: UIStatusBarStyle?

  override var preferredStatusBarStyle: UIStatusBarStyle {
    return themedStatusBarStyle ?? super.preferredStatusBarStyle
  }

  var theme: Theme {
    get {
      return themeManager.theme
    }
    set {
      themeManager.theme = newValue
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    themeManager.register(themeable: self)
  }

}


extension ThemeableController: Themeable {

  func apply(for theme: Theme) {

    themedStatusBarStyle = theme.statusBarStyle
    setNeedsStatusBarAppearanceUpdate()

    navigationController?.navigationBar.barTintColor = theme.navigationBarBackgroundColor
    navigationController?.navigationBar.tintColor = theme.navigationBarForegroundColor
    navigationController?.navigationBar.titleTextAttributes = [
      NSAttributedString.Key.foregroundColor: theme.navigationBarForegroundColor
    ]
  }

}
