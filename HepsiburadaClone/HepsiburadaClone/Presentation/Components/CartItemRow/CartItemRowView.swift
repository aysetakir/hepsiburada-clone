import SwiftUI

struct CartItemRowView: View {
    let cartItem: CartItem
    
    var body: some View {
        HStack(alignment: .top, spacing: 12) {
            Image(systemName: "checkmark.square.fill")
                .foregroundStyle(.hepsiburadaOrange)
                .font(.title2)
            
            AsyncImage(url: URL(string: cartItem.item.imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image.resizable().scaledToFit()
                case .empty:
                    ProgressView()
                default:
                    Image(systemName: "photo")
                }
            }
            .frame(width: 80, height: 80)
            .background(Color.gray.opacity(0.05))
            .clipShape(RoundedRectangle(cornerRadius: 8))
            
            VStack(alignment: .leading, spacing: 4) {
                Text(cartItem.item.name)
                    .font(.subheadline)
                    .lineLimit(2)
                Text("Bugün kargoda")
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text("\(cartItem.item.price.formatted()) TL")
                    .fontWeight(.bold)
                 
                HStack {
                    Image(systemName: "trash")
                        .foregroundStyle(.gray)
                    Text("\(cartItem.quantity)")
                        .padding(.horizontal, 12)
                    Image(systemName: "plus")
                        .foregroundStyle(.gray)
                }
                .padding(.vertical, 6)
                .padding(.horizontal, 8)
                .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color.gray.opacity(0.3)))
            }
        }
        .padding()
    }
}

#Preview {
    CartItemRowView(cartItem: MockData.cartItems[1]) 
}
