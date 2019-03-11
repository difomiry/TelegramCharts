import Foundation
import UIKit

final class DataManager {

  static let shared = DataManager()

  func fetchCharts(success: ([TelegramChart]) -> Void, failure: (Error) -> Void) {
    do {
      success(try JSONDecoder().decode([TelegramChart].self, from: NSDataAsset(name: "Data")?.data ?? Data()))
    } catch {
      failure(error)
    }
  }

}
