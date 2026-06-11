import SwiftUI

enum AuthTab {
    case login, register
}

struct AuthView: View {
    @Bindable var viewModel: AuthViewModel
    @State private var selectedTab: AuthTab = .login
    
    var body: some View {
        VStack(spacing: 0) {
            
            HStack(spacing: 0) {
                tabButton(title: "Giriş yap", tab: .login)
                tabButton(title: "Üye ol", tab: .register)
            }
            .padding(.top, 24)
            
            
            ScrollView {
                if selectedTab == .login {
                    LoginContent(viewModel: viewModel)
                } else {
                    RegisterContent(viewModel: viewModel)
                }
            }
            .scrollIndicators(.hidden)
        }
    }
    
    private func tabButton(title: String, tab: AuthTab) -> some View {
        Button {
            withAnimation { selectedTab = tab }
        } label: {
            VStack(spacing: 8) {
                Text(title)
                    .fontWeight(selectedTab == tab ? .bold : .regular)
                    .foregroundStyle(selectedTab == tab ? .black : .gray)
                
                Rectangle()
                    .fill(selectedTab == tab ? Color.hepsiburadaOrange : Color.gray.opacity(0.2))
                    .frame(height: selectedTab == tab ? 3 : 1)
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    AuthView(viewModel: AuthViewModel())
}
