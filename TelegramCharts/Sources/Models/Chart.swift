import Foundation

typealias Points = [Int]
typealias Strings = [String: String]
typealias Columns = [String: Points]

struct Chart {
  let colors: Strings
  let columns: Columns
  let names: Strings
  let types: Strings
}

extension Chart: Codable {

  init(from decoder: Decoder) throws {

    let container = try decoder.container(keyedBy: CodingKeys.self)

    colors = try container.decode(Strings.self, forKey: .colors)
    names = try container.decode(Strings.self, forKey: .names)
    types = try container.decode(Strings.self, forKey: .types)

    var columnsContainer = try container.nestedUnkeyedContainer(forKey: .columns)

    var columns = Columns()

    while !columnsContainer.isAtEnd {

      var columnContainer = try columnsContainer.nestedUnkeyedContainer()

      let name = try columnContainer.decode(String.self)
      columns[name] = Points()

      while !columnContainer.isAtEnd {
        columns[name]?.append(try columnContainer.decode(Int.self))
      }
    }

    self.columns = columns
  }

}
