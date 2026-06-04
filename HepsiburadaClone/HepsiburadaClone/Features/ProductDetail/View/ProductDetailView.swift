import SwiftUI

struct ProductDetailView: View {
    @State private var viewModel = HomeViewModel()
    @State private var showToolbar = true
    let product: Product
    var body: some View {
        ScrollView {
            VStack(alignment: .leading) {
                GeometryReader { geo in
                    Color.clear
                        .onChange(of: geo.frame(in: .named("scroll")).minY) { oldVal, newVal in
                            if newVal < oldVal {
                                showToolbar = false
                            } else {
                                showToolbar = true
                            }
                        }
                }
                .frame(height: 0)
                AsyncImage(url: URL(string: product.imageURL)) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                        
                    case .failure(_):
                        Image(systemName: "photo")
                            .foregroundColor(.gray)
                    @unknown default:
                        EmptyView()
                    }
                }
                
                HStack {
                    Text(product.category)
                        .foregroundStyle(.hepsiburadaOrange)
                    Text(product.name)
                    Spacer()
                    VStack(spacing: 0) {
                        HStack {
                            Image(systemName: "star.fill")
                                .font(.footnote)
                                .foregroundStyle(.hepsiburadaOrange)
                            Text("\(product.rating, specifier: "%.1f")")
                                .font(.footnote)
                                .fontWeight(.bold)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        
                        HStack {
                            Text("603")
                                .font(.footnote)
                            Image(systemName: "camera")
                                .font(.footnote)
                                .foregroundStyle(.gray)
                        }
                        .padding(.vertical, 6)
                        .padding(.horizontal, 10)
                        .background(Color.gray.opacity(0.1))
                        .clipShape(
                            .rect(bottomLeadingRadius: 12, bottomTrailingRadius: 12)
                        )
                    }
                    .fixedSize()
                    .overlay(
                        RoundedRectangle(cornerRadius: 12)
                            .stroke(Color.gray.opacity(0.2))
                    )
                }
                .padding(.horizontal)
                
                //INFO CONTAINER
                Text("300 TL üzeri kargo bedava")
                    .foregroundStyle(Color.green)
                    .fontWeight(.bold)
                    .padding(12)
                    .frame(maxWidth: .infinity)
                    .background(Color.green.opacity(0.3))
                    .clipShape(RoundedRectangle(cornerRadius: 12))
                    .padding(.horizontal)
                
                Divider()
                
                VStack {
                    HStack {
                        Text(product.brand)
                            .textCase(.uppercase)
                            .foregroundStyle(.hepsiburadaOrange)
                            .fontWeight(.bold)
                        
                        Spacer()
                        
                        Button {
                            //SORU&CEVAP
                        } label: {
                            Text("Soru & Cevap")
                                .font(.footnote)
                                .foregroundStyle(.orange)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 4)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 3)
                                        .stroke(Color.orange, lineWidth: 1)
                                )
                        }
                        
                        Button {
                            //SEPET
                        } label: {
                            Text("Sepete ekle")
                                .font(.footnote)
                                .foregroundStyle(.white)
                                .padding(.vertical, 6)
                                .padding(.horizontal, 4)
                                .background(
                                    RoundedRectangle(cornerRadius: 3)
                                        .fill(Color.hepsiburadaOrange)
                                )
                        }
                        
                    }
                    HStack {
                        Text("Yarın kargoda")
                            .font(.footnote)
                            .fontWeight(.bold)
                        Spacer()
                        Image(systemName: "star")
                    }
                }
                .padding(.horizontal)
                Divider()
                
                VStack(alignment: .leading){
                    Text("Bunlar da ilgini çekebilir")
                        .fontWeight(.semibold)
                        .padding()
                    
                    let columns = [GridItem(.flexible(), spacing: 12), GridItem(.flexible(), spacing: 12)]
                    
                    LazyVGrid(columns: columns, spacing: 12) {
                        ForEach(viewModel.products) { product in
                            ProductCardView(product: product)
                        }
                    }
                }
            }
        }
        .scrollIndicators(.hidden)
        .coordinateSpace(name: "scroll")
        .toolbar(showToolbar ? .visible : .hidden, for: .navigationBar)
        .animation(.easeInOut(duration: 0.3), value: showToolbar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundStyle(.gray)
                    Text("Ürün, kategori veya marka...")
                        .foregroundStyle(.gray)
                        .font(.footnote)
                    Spacer()
                }
                .padding(.horizontal, 5)
                .padding(.vertical, 2)
                .overlay {
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.gray.opacity(0.1))
                }
                .frame(width: screenWidth * 0.45)
            }
            
            ToolbarItem(placement: .topBarTrailing) {
                HStack {
                    Button { } label: { Image(systemName: "cart") }
                    Button { } label: { Image(systemName: "square.and.arrow.up") }
                    Button { } label: { Image(systemName: "heart") }
                }
                .foregroundStyle(.black)
            }
        }
        .safeAreaInset(edge: .bottom) {
            HStack {
                VStack(alignment: .leading, spacing: 2) {
                    Text("32.999 TL")
                        .font(.title2)
                        .fontWeight(.bold)
                    Text("300 TL üzeri kargo bedava")
                        .font(.caption)
                        .foregroundStyle(.green)
                }
                
                Spacer()
                
                Button {
                    // sepete ekle
                } label: {
                    Text("Sepete Ekle")
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
    ProductDetailView(product: MockData.products[0])
}
