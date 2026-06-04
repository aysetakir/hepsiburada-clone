import SwiftUI

struct FavoritesView: View {
    
    @State private var viewModel = ListsViewModel()
    @State var userText = ""
    
    var body: some View {
        
        ScrollView {
            HStack {
                HStack {
                    Image(systemName: "star")
                    Text("0")
                }
                HStack {
                    Image(systemName: "eye")
                    Text("0")
                }
                Spacer()
                HStack {
                    Text("\(viewModel.favoriteProducts.count)")
                    Text("Ürün")
                }
            }
            .font(.caption)
            .padding()
            
            VStack {
                
                HStack {
                    Image(systemName: "magnifyingglass")
                    TextField("Beğendiklerimde ara", text: $userText)
                }
                
                
                
                
                let columns = [GridItem(.flexible(), spacing: 25), GridItem(.flexible(), spacing: 25)]
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.favoriteProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCardView(product: product)
                        }
                    }
                    .foregroundStyle(.black)
                    .padding(.horizontal)
                }
            }
            .background(.gray.opacity(0.1))
        }
    }
}

#Preview {
    FavoritesView()
}
