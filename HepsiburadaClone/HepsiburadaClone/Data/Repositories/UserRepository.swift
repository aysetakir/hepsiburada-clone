final class UserRepository {
    
    private let authDataSource = AuthDataSource()
    private let firestoreDataSource = FirestoreDataSource()
    
    func login(email: String, password: String) async throws -> String {
        try await authDataSource.signIn(email: email, password: password)
    }
    
    func register(email: String, password: String, fullName: String) async throws {
        let uid = try await authDataSource.signUp(email: email, password: password)
        
        let user = AppUser(id: uid, email: email, fullName: fullName)
        try await firestoreDataSource.saveUser(user: user)
    }
    
    func fetchCurrentUser() async throws -> AppUser? {
        guard let uid = authDataSource.currentUserId else { return nil }
        
        return try await firestoreDataSource.fetchUser(uid: uid)
    }
    
    func logout() throws {
        try authDataSource.signOut()
    }
    
    var currentUserId: String? {
        authDataSource.currentUserId
    }
}
