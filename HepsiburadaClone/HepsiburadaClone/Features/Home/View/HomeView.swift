import SwiftUI

struct HomeView: View {
    
    @State private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack {
            ScrollView(.horizontal) {
                HStack(spacing: 0) {
                    ForEach(viewModel.banners) { banner in
                        BannerSliderView(banner: banner)
                            .scrollTransition { content, phase in
                                content.opacity(phase.isIdentity ? 1 : 0.8)
                            }
                    }
                }
                .scrollTargetLayout()
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
            .padding(.leading)
            .scrollIndicators(.hidden)
        }
    }
}

#Preview {
    HomeView()
}
