import Foundation
import UIKit

protocol DataProviderType: class {
  func fetchCharts(success: ([Chart]) -> Void, failure: (Error) -> Void)
}

final class DataProvider: DataProviderType {

  func fetchCharts(success: ([Chart]) -> Void, failure: (Error) -> Void) {
    do {
      success(try JSONDecoder().decode([Chart].self, from: NSDataAsset(name: "Data")?.data ?? Data()))
    } catch {
      failure(error)
    }
  }

}
