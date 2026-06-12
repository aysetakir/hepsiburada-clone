import SwiftUI

struct RootView: View {
    @Bindable var authViewModel: AuthViewModel
    
    var body: some View {
        if authViewModel.isLoggedIn {
            AppRouter(authViewModel: authViewModel)
        } else {
            AuthView(viewModel: authViewModel)
        }
    }
}

