import FirebaseFirestore

final class ProductRepository {
    private let db = Firestore.firestore()
    
    
    func fetchProducts() async throws -> [Product] {
           let snapshot = try await db.collection("products").getDocuments()
           return try snapshot.documents.map { try $0.data(as: Product.self) }
       }
    
    func seedProducts() async throws {
           for product in MockData.products {
               try db.collection("products")
                   .document(product.id)
                   .setData(from: product)
           }
           print("\(MockData.products.count) ürün Firestorea yüklendi")
       }
}
