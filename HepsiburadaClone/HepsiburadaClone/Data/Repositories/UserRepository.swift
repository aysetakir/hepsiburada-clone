final class UserRepository {
    
    private let authDataSource = AuthDataSource()
    
    func login(email: String, password: String) async throws -> String {
        try await authDataSource.signIn(email: email, password: password)
    }
    
    func register(email: String, password: String) async throws -> String {
        try await authDataSource.signUp(email: email, password: password)
    }
    
    func logout() throws {
        try authDataSource.signOut()
    }
    
    var currentUserId: String? {
        authDataSource.currentUserId
    }
}
