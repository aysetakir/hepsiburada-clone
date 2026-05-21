import SwiftUI

struct BannerSliderView: View {
     let banner: Banner
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: banner.imageURL)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                case .failure:
                    Color.gray.opacity(0.3)
                case .empty:
                    Color.gray.opacity(0.1)
                @unknown default:
                    EmptyView()
                }
            }
            .frame(width: screenWidth, height: 180)
            .clipped()
            Text(banner.title)
                .font(.headline)
        }
           
       }
}

#Preview {
    BannerSliderView(banner: Banner(id: "1", imageURL: "https://picsum.photos/400/200?random=2", title: "kampanya"))
}
