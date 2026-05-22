import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    @State private var userText = ""
    
    var body: some View {
        VStack(spacing: 10) {
            
            HStack {
                Image(systemName: "magnifyingglass")
                TextField("Ürün, kategori veya marka ara", text: $userText)
                
            }
           // Spacer()
            
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
                ScrollView(.horizontal) {
                    LazyHStack(alignment: .top) {
                        ForEach(viewModel.campaigns) { campaign in
                            CampaignCardView(campaign: campaign)
                        }
                    }
                }
                .frame(height: 120)
                .scrollIndicators(.hidden)
            }
           
            
            BannerSliderView()
         
            
        }
            
    }
}

#Preview {
    HomeView()
}
