import SwiftUI

struct LoginContent: View {
    
    @Bindable var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            TextField("E-posta adresi", text: $viewModel.email)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.opacity(0.4))
                )
                .keyboardType(.emailAddress)
                .textInputAutocapitalization(.never)
            
            SecureField("Şifre", text: $viewModel.password)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.opacity(0.4))
                )
            
            Button {} label: {
                Text("Şifremi unuttum")
                    .font(.headline)
                    .foregroundStyle(.hepsiburadaOrange)
            }
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
            
            Button {
                Task {
                    await viewModel.login()
                }
            } label: {
                Text(viewModel.isLoading ? "Giriş yapılıyor..." : "Giriş yap")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.white)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.hepsiburadaOrange)
                    )
            }
            .disabled(viewModel.isLoading)
            
            Button {} label: {
                Text("Telefon numarası ile giriş yap")
                    .font(.headline)
                    .padding(10)
                    .frame(maxWidth: .infinity)
                    .foregroundStyle(.black)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.white)
                            .stroke(.gray)
                    )
            }
            
            Text("veya")
                .frame(maxWidth: .infinity)
            
            VStack {
                Text("Sosyal hesabın ile giriş yap")
                    .padding(.bottom)
                HStack {
                    socialButton(icon: "applelogo")
                    socialButton(icon: "g.circle")
                    socialButton(icon: "f.circle")
                }
                .foregroundStyle(.gray)
            }
            .padding()
            .frame(maxWidth: .infinity)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.green.opacity(0.07))
                    .stroke(.green.opacity(0.6))
            )
            
            Button {} label: {
                HStack {
                    Text("Yardıma ihtiyacım var")
                    Image(systemName: "questionmark.circle")
                }
                .frame(maxWidth: .infinity)
                .font(.headline)
                .foregroundStyle(.hepsiburadaOrange)
            }
        }
        .padding()
    }
    
    private func socialButton(icon: String) -> some View {
        Button {} label: {
            Image(systemName: icon)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(.gray.opacity(0.5))
                )
        }
    }
}

#Preview {
    LoginContent(viewModel: AuthViewModel())
}
