import SwiftUI

struct CartView: View {
    @State private var viewModel = CartViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ForEach(viewModel.cartProduct) { cartItem in
                    CartItemRowView(cartItem: cartItem)
                    Divider()
                }
            }
        }
        .navigationTitle("Sepetim (\(viewModel.cartProduct.count) Ürün)")
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("\(viewModel.totalPrice.formatted()) TL")
                        .font(.title2)
                        .fontWeight(.bold)
                }
                Spacer()
                Button {
                } label: {
                    Text("Ödemeye Geç")
                        .fontWeight(.bold)
                        .foregroundStyle(.white)
                        .padding(.horizontal, 32)
                        .padding(.vertical, 14)
                        .background(Color.hepsiburadaOrange)
                        .clipShape(RoundedRectangle(cornerRadius: 8))
                }
            }
            .padding()
            .background(.white)
            .shadow(color: .black.opacity(0.1), radius: 10, y: -5)
        }
    }
}
#Preview {
    CartView()
}
