import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.banners) { banner in
                        BannerSliderView(banner: banner)
                    }
                }
            }
            .scrollIndicators(.hidden)
            .scrollTargetBehavior(.paging)
            
            ScrollView(.horizontal) {
                HStack {
                    ForEach(viewModel.categories) { category in
                        CategoryCardView(category: category)
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
        .padding(.leading)
    }
}

#Preview {
    HomeView()
}
