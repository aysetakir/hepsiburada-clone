import SwiftUI

struct ProductCardView: View {
    let product: Product
    var body: some View {
        ZStack(alignment: .topTrailing){
            VStack(alignment: .leading){
                VStack(alignment: .leading) {
                    AsyncImage(url: URL(string: product.imageURL)) { phase in
                        switch phase {
                        case .empty:
                            ProgressView()
                        case .success(let image):
                            image
                                .resizable()
                                .scaledToFit()
                                .clipShape(RoundedRectangle(cornerRadius: 10))
                            
                        case .failure(_):
                            Image(systemName: "photo")
                                .foregroundColor(.gray)
                        @unknown default:
                            EmptyView()
                        }
                    }
                    
                    Text(product.name)
                        .font(.subheadline)
                        .fontWeight(.bold)
                    HStack {
                        Image(systemName: "star.fill")
                            .foregroundStyle(.hepsiburadaOrange)
                        Text("\(product.rating, specifier: "%.1f")")
                            .font(.subheadline)
                            .fontWeight(.bold)
                        Text("(\(product.reviewCount))")
                            .font(.footnote)
                            .foregroundStyle(.gray.opacity(0.8))
                    }
                }
                
                Spacer()
                
                HStack {
                    Text(product.price.formatted(.number.grouping(.automatic).precision(.fractionLength(0))))
                        .fontWeight(.bold)
                    + Text(" TL")
                        .font(.caption)
                    Spacer()
                    Image(systemName: "cart")
                }
                .padding()
                .background(Color.gray.opacity(0.1))
                .clipShape(RoundedRectangle(cornerRadius: 5))
                .padding(.bottom, 5)
                
                
            }
            .frame(width: screenWidth * 0.45 ,height: screenHeight * 0.4)
            .padding(.horizontal, 5)
            .padding(.top, 5)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(Color.gray.opacity(0.2), lineWidth: 2)
            )
            
            
            Button {
                    print("favorilendi")
                } label: {
                    Image(systemName: "heart")
                        .foregroundStyle(Color.gray)
                        .padding(6)
                        .background(.white)
                        .clipShape(Circle())
                }
                .padding(8)
            }
    }
}

#Preview {
    ProductCardView(product: MockData.products[0])
}
