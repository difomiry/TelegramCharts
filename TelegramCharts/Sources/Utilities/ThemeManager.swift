import Foundation

class ThemeManager {

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

