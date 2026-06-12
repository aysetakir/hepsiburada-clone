import FirebaseFirestore

final class FirestoreDataSource {
    private let db = Firestore.firestore()
    
    func saveUser(user: AppUser) async throws {
        try db.collection("users")
            .document(user.id)
            .setData(from: user)
    }
    
    func fetchUser(uid: String) async throws -> AppUser {
        let snapshot = try await db.collection("users")
            .document(uid)
            .getDocument()
        
        return try snapshot.data(as: AppUser.self)
    }
}
