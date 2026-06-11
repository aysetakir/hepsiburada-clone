import SwiftUI
import FirebaseCore

@main
struct HepsiburadaCloneApp: App {
    
    @State private var authViewModel: AuthViewModel
    
    init() {
        FirebaseApp.configure()
        _authViewModel = State(initialValue: AuthViewModel())
    }
    
    var body: some Scene {
        WindowGroup {
            RootView(authViewModel: authViewModel)
        }
    }
}
