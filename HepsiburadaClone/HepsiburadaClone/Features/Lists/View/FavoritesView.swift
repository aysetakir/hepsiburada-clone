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
                        .fontWeight(.bold)
                    Text("Ürün")
                }
            }
            .font(.caption)
            .padding()
            
            VStack {
                
                HStack {
                    HStack {
                        Image(systemName: "magnifyingglass")
                        TextField("Beğendiklerimde ara", text: $userText)
                            .font(.callout)
                        
                    }
                    .padding(8)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray.opacity(0.5))
                    )
                    
                    HStack {
                        Image(systemName: "square.and.arrow.up")
                        Image(systemName: "square.and.pencil")
                    }
                    .padding(8)
                    .background(.white)
                    .overlay(
                        RoundedRectangle(cornerRadius: 6)
                            .stroke(.gray.opacity(0.5))
                    )
                }
                .padding(.horizontal)
                .padding(.top)
                
                HStack {
                    Button{} label: {
                        Image(systemName: "arrow.up.arrow.down")
                            .foregroundColor(.gray)
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .stroke(.gray.opacity(0.2))
                            )
                            
                    }
                    Button{} label: {
                        Text("Kategoriler")
                            .foregroundColor(.gray)
                                  .lineLimit(1)
                                  .fixedSize()
                                  .padding(5)
                                  .background(
                                      RoundedRectangle(cornerRadius: 8)
                                          .fill(.white)
                                          .stroke(.gray.opacity(0.2))
                                  )
                           
                    }
                    Button{} label: {
                        Text("Stoktakiler")
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .fixedSize()
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .stroke(.gray.opacity(0.2))
                            )
                    }
                    Button{} label: {
                        Text("Fiyatı Düşenler")
                            .foregroundColor(.gray)
                            .lineLimit(1)
                            .fixedSize()
                            .padding(5)
                            .background(
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(.white)
                                    .stroke(.gray.opacity(0.2))
                            )
                    }
                    Spacer()
                }
                .padding(.horizontal)
                .font(.footnote)
                .fontWeight(.bold)
                
                let columns = [GridItem(.flexible(), spacing: 25), GridItem(.flexible(), spacing: 25)]
                LazyVGrid(columns: columns, spacing: 12) {
                    ForEach(viewModel.favoriteProducts) { product in
                        NavigationLink(destination: ProductDetailView(product: product)) {
                            ProductCardView(product: product)
                        }
                    }
                    .foregroundStyle(.black)
                }
                .padding(.horizontal)
                
                BannerSliderView()
            }
            
            .background(.gray.opacity(0.1))
        }
      
    }
}

#Preview {
    FavoritesView()
}
