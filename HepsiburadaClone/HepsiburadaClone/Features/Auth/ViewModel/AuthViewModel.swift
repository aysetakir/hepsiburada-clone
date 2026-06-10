import SwiftUI

@Observable
class AuthViewModel {
    
    var email = ""
    var password = ""
    var fullName = ""
    
    var errorMessage = ""
    var isLoading = false
    var isLoggedIn = false
    
    private let userRepository = UserRepository()
    
    func login() async {
        isLoading = true
        errorMessage = ""
        
        do {
            let _ = try await userRepository.login(email: email, password: password)
            isLoggedIn = true
        } catch {
            errorMessage = error.localizedDescription
        }
        
        isLoading = false
    }
    
    func logout() {
        do {
            try userRepository.logout()
            isLoggedIn = false
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
