import SwiftUI

struct ProfileView: View {
    @Bindable var viewModel : AuthViewModel
    
    var body: some View {
        VStack(spacing: 0){
            VStack(alignment: .leading){
                Text("Hesabım")
                    .font(.headline)
                    .frame(maxWidth: .infinity, alignment: .center)
                HStack {
                    Text(initials)
                        .padding()
                        .background(.white)
                        .clipShape(Circle())
                        .foregroundStyle(.gray)
                    VStack(alignment: .leading){
                        Text("Merhaba,")
                            .font(.callout)
                        Text(viewModel.currentUser?.fullName ?? "Misafir")
                            .font(.headline)
                    }
                    Spacer()
                }
                .padding()
            }
            .padding(.bottom)
            .foregroundStyle(.white)
            .background(.hepsiburadaOrange)
            
            ScrollView {
                ProfileMenuItem(icon: "shippingbox", title: "Siparişlerim")
                    .padding(.top)
                Divider()
                
                ProfileMenuItem(icon: "ticket", title: "Kuponlarım")
                Divider()
                
                ProfileMenuItem(icon: "creditcard", title: "Premium Worldcard")
                Divider()
                
                ProfileMenuItem(icon: "wallet.pass", title: "HepsiPay")
                Divider()
                
                ProfileMenuItem(icon: "heart", title: "Beğendiklerim")
                Divider()
                
                ProfileMenuItem(icon: "questionmark.bubble", title: "Soru ve Taleplerim")
                Divider()
                
                ProfileMenuItem(icon: "star.bubble", title: "Değerlendirmelerim")
                Divider()
                
                ProfileMenuItem(icon: "gearshape", title: "Ayarlarım")
                Divider()
                
                ProfileMenuItem(icon: "globe", title: "Dil Seçimi (Beta)")
                Divider()
                
                ProfileMenuItem(icon: "mappin.and.ellipse", title: "Adreslerim")
                Divider()
                
                ProfileMenuItem(icon: "bubble.left.and.bubble.right", title: "Uygulama geri bildirimi")
                Divider()
                
                ProfileMenuItem(icon: "headset", title: "Müşteri Hizmetleri")
                Button{
                    viewModel.logout()
                } label: {
                    Text("Çıkış yap")
                        .font(.headline)
                        .foregroundStyle(.black.opacity(0.8))
                        .frame(maxWidth: .infinity)
                        .padding(10)
                        .background(
                            RoundedRectangle(cornerRadius: 7)
                                .fill(.white)
                                .stroke(.gray)
                        )
                }
            }
            .background(.white)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .offset(y: -14)
            Spacer()
        }
        .task {
            await viewModel.loadCurrentUser()
        }
    }
    
    private var initials: String {
        let name = viewModel.currentUser?.fullName ?? ""
        let parts = name.split(separator: " ")
        let firstLetters = parts.prefix(2).compactMap { $0.first }
        return String(firstLetters).uppercased()
    }
}


