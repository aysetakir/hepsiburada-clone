import Foundation

struct UserList: Identifiable {
    let id: String
    let name: String
    let products: [Product]
    let createdAt: Date
}
