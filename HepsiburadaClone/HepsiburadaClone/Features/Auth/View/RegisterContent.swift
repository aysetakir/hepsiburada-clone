import SwiftUI

struct RegisterContent: View {
    @Bindable var viewModel: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            TextField("Ad Soyad", text: $viewModel.fullName)
                .padding()
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .fill(.gray.opacity(0.4))
                )
                .textInputAutocapitalization(.words)
            
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
            
            if !viewModel.errorMessage.isEmpty {
                Text(viewModel.errorMessage)
                    .font(.footnote)
                    .foregroundStyle(.red)
            }
            
            Button {
                Task {
                  await viewModel.register()
                }
            } label: {
                Text(viewModel.isLoading ? "Üye olunuyor..." : "Üye ol")
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
            
            Text("veya")
                .frame(maxWidth: .infinity)
            
            VStack {
                Text("Sosyal hesabın ile üye ol")
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
            
            Text("Kişisel verileriniz, Aydınlatma Metni kapsamında işlenmektedir. \"Devam et\" veya \"Sosyal Hesap\" butonlarından birine basarak Üyelik Sözleşmesi'ni ve Gizlilik Politikası'nı okuduğunuzu ve kabul ettiğinizi onaylıyorsunuz")
                .font(.footnote)
                .foregroundStyle(.gray)
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
    RegisterContent(viewModel: AuthViewModel())
}
