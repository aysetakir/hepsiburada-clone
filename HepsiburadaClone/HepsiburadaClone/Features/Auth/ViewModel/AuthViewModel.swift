import SwiftUI

@Observable
class AuthViewModel {
    var currentUser: AppUser?
    
    var email = ""
    var password = ""
    var fullName = ""
    
    var errorMessage = ""
    var isLoading = false
    var isLoggedIn = false
      
    private let userRepository = UserRepository()
    
    init() {
        isLoggedIn = userRepository.currentUserId != nil
    }
    
    func loadCurrentUser() async {
        do {
            currentUser = try await userRepository.fetchCurrentUser()
        } catch {
            print("kullanıcı yüklenemedi", error)
        }
    }
    
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
    
    func register() async {
        isLoading = true
        errorMessage = ""
        
        do {
            try await userRepository.register(email: email, password: password, fullName: fullName)
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
