import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    @State private var userText = ""
    @State private var animateLines = false
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Image(systemName: "magnifyingglass")
                        TextField("Ürün, kategori veya marka ara", text: $userText)
                    }
                    .padding(5)
                    .padding(.top,5)
                    
                    HStack(spacing: 0){
                        Rectangle()
                            .fill(.hepsiburadaOrange)
                            .frame(width: animateLines ? screenWidth * 0.4 : 3 ,height: 3)
                            .animation(.easeInOut(duration: 1), value: animateLines)
                            .onAppear {
                                animateLines = true
                            }
                        Rectangle()
                            .fill(.red)
                            .frame(width: animateLines ? screenWidth * 0.2 : 3 ,height: 3)
                            .animation(.easeInOut(duration: 1), value: animateLines)
                            .onAppear {
                                animateLines = true
                            }
                        Rectangle()
                            .fill(.blue)
                            .frame(width: animateLines ? screenWidth * 0.2 : 3 ,height: 3)
                            .animation(.easeInOut(duration: 1), value: animateLines)
                            .onAppear {
                                animateLines = true
                            }
                        Rectangle()
                            .fill(.red)
                            .frame(width: animateLines ? screenWidth * 0.1 : 3 ,height: 3)
                            .animation(.easeInOut(duration: 1), value: animateLines)
                            .onAppear {
                                animateLines = true
                            }
                    }
                }
                .border(Color.gray.opacity(0.2), width: 2)
                .padding(.horizontal) 
               
                
                BannerSliderView()
                
                ScrollView(.horizontal) {
                    LazyHStack(spacing: 12) {
                        ForEach(viewModel.categories) { category in
                            CategoryCardView(category: category)
                        }
                    }
                    .padding(.horizontal)
                }
                .frame(height: 110)
                .scrollIndicators(.hidden)
                
                VStack(alignment: .leading, spacing: 0) {
                    Text("Sana özel kampanyalar")
                        .fontWeight(.bold)
                        .padding(.bottom)
                        .padding(.horizontal)
                    ScrollView(.horizontal) {
                        LazyHStack(alignment: .top) {
                            ForEach(viewModel.campaigns) { campaign in
                                CampaignCardView(campaign: campaign)
                            }
                        }
                        .padding(.horizontal)
                    }
                    .frame(height: 120)
                    .scrollIndicators(.hidden)
                }
                
                VStack(alignment: .leading) {
                    Text("Sana özel markalar")
                        .fontWeight(.bold)
                        .padding(.horizontal)
                    BrandSliderView()
                }
                
                BannerSliderView()
                
                
            }
        }
    }
}

#Preview {
    HomeView()
}
