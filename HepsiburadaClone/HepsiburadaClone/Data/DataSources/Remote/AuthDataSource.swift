import FirebaseAuth

final class AuthDataSource {
    
    func signIn(email: String, password: String) async throws -> String {
        let result = try await Auth.auth().signIn(withEmail: email, password: password)
        return result.user.uid
    }
    
    func signUp(email: String, password: String) async throws -> String {
        let result = try await Auth.auth().createUser(withEmail: email, password: password)
        return result.user.uid
    }
    
    func signOut() throws {
        try Auth.auth().signOut()
    }
    
    var currentUserId: String? {
        Auth.auth().currentUser?.email
    }
}
