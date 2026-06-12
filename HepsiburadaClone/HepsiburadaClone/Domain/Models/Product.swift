import Foundation

struct Product: Identifiable, Codable {
    let id: String
    let name: String
    let price: Double
    let originalPrice: Double
    let imageURL: String
    let category: String
    let brand: String
    let rating: Double
    let reviewCount: Int
    var isFavorite: Bool
    
    var discountPercent: Int {
        Int(((originalPrice - price) / originalPrice) * 100)
    }
}
