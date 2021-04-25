
import Foundation

struct Section: Codable {
    let heading: String
    let items: [Item]
}

struct Item: Codable {
    let image: String
    let price: String
    let name: String
}
