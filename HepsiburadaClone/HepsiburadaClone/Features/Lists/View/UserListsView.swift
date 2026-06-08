import SwiftUI

struct UserListsView: View {
    
    @State private var viewModel = ListsViewModel()
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                
                if viewModel.userLists.isEmpty {
                    VStack(alignment: .center) {
                        Text("Henüz bir liste oluşturmadın.")
                            .font(.headline)
                            .fontWeight(.bold)
                            .padding()
                        
                        Text("Ekranın sağ altında yer alan Yeni liste butonuna ")
                        Text("dokunarak ilk listeni oluşturabilirsin")
                    }
                }
                else {
                    ForEach(viewModel.userLists) { list in
                        VStack(alignment: .leading) {
                            
                            Text(list.name)
                                .fontWeight(.bold)
                                .padding(.horizontal)
                            
                            let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
                            LazyVGrid(columns: columns, spacing: 12) {
                                ForEach(list.products) { product in
                                    NavigationLink(destination: ProductDetailView(product: product)) {
                                        ProductCardView(product: product)
                                    }
                                    .foregroundStyle(.black)
                                }
                            }
                            .padding(.horizontal)
                            
                        }
                    }
                    
                }
            }
        }
    }
}

#Preview {
    UserListsView()
}
