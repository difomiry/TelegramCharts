import UIKit

extension UINavigationController {

  open override var childForStatusBarStyle: UIViewController? {
    return topViewController
  }

  open override func viewDidLoad() {
    super.viewDidLoad()

    interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
  }

}
