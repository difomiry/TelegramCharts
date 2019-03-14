import UIKit

fileprivate protocol Themeable: class {
  func apply(for theme: Theme)
}

fileprivate class ThemeManager {

  static let shared = ThemeManager(default: Theme.day)

  private var observers: NSHashTable<AnyObject> = NSHashTable.weakObjects()

  var theme: Theme {
    didSet {
      for observer in observers.allObjects {
        if let observer = observer as? Themeable {
          observer.apply(for: theme)
        }
      }
    }
  }

  init(default theme: Theme) {
    self.theme = theme
  }

  func register(themeable: Themeable) {

    themeable.apply(for: theme)

    observers.add(themeable)
  }

}

class ThemeableController: UIViewController {

  fileprivate var themeManager = ThemeManager.shared

  fileprivate var themedStatusBarStyle: UIStatusBarStyle?

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
