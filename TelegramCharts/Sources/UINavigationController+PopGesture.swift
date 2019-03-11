import UIKit

extension UINavigationController {

  open override func viewDidLoad() {
    super.viewDidLoad()

    interactivePopGestureRecognizer?.delegate = self as? UIGestureRecognizerDelegate
  }

}
