import SwiftUI

struct BannerSliderView: View {
    
    let banners = ["reklam1", "reklam2", "reklam3"]
    
    var body: some View {
        TabView {
            ForEach(banners, id: \.self) { imageName in
                Image(imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(height: 180)
                    .frame(maxWidth: .infinity)
                    .clipped()
                    .clipShape(RoundedRectangle(cornerRadius: 16))
            }
        }
        .frame(height: 180)
        .tabViewStyle(PageTabViewStyle(indexDisplayMode: .automatic))
    }
}

#Preview {
    BannerSliderView()
}
