import SwiftUI

struct BannerSliderView: View {
     let banner: Banner
    
    var body: some View {
        ZStack {
            AsyncImage(url: URL(string: banner.imageURL))
            Text(banner.title)
        }
    }
}

#Preview {
    BannerSliderView(banner: Banner(id: "1", imageURL: "https://picsum.photos/400/200?random=20", title: "kampanya"))
}
