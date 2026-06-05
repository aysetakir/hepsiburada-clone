import SwiftUI

struct UserListsView: View {
    
    @State private var viewModel = ListsViewModel()
    
    var body: some View {
        
        VStack(alignment: .leading){
            
            
            
            Text("Beğendiklerim")
                .font(.headline)
                .underline(color: .orange)
            
            
            let columns = [GridItem(.flexible(), spacing: 25), GridItem(.flexible(), spacing: 25)]
            LazyVGrid(columns: columns, spacing: 12) {
                ForEach(viewModel.favoriteProducts) { product in
                    NavigationLink(destination: ProductDetailView(product: product)) {
                        ProductCardView(product: product)
                    }
                }
                .foregroundStyle(.black)
            }
            
        }
    }
}

#Preview {
    UserListsView()
}
