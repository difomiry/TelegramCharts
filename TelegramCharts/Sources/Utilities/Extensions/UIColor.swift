import Foundation
import UIKit

extension UIColor {

  convenience init?(hexString: String) {

    var normalized = hexString.trimmingCharacters(in: .whitespacesAndNewlines)

    if normalized.hasPrefix("#") {
      normalized = String(normalized.dropFirst())
    }

    var r, g, b: UInt32
    var a = UInt32(255)
    var rgb = UInt32()

    guard Scanner(string: normalized).scanHexInt32(&rgb) else {
      return nil
    }

    switch normalized.count {
    case 3:
      r = 17 * (rgb & 0xF00) >> 8
      g = 17 * (rgb & 0x0F0) >> 4
      b = 17 * (rgb & 0x00F)
    case 6:
      r = (rgb & 0xFF0000) >> 16
      g = (rgb & 0x00FF00) >> 8
      b = (rgb & 0x0000FF)
    case 8:
      r = (rgb & 0xFF000000) >> 24
      g = (rgb & 0x00FF0000) >> 16
      b = (rgb & 0x0000FF00) >> 8
      a = (rgb & 0x000000FF)
    default:
      return nil
    }

    self.init(red: CGFloat(r) / 255, green: CGFloat(g) / 255, blue: CGFloat(b) / 255, alpha: CGFloat(a) / 255)
  }

}
