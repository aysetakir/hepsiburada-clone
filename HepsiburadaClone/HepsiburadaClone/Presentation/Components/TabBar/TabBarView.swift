import SwiftUI

struct TabBarView: View {

    var body: some View {
        HStack {
            Spacer()
            TabBarItem(icon: "house", title: "Ana Sayfam")
            Spacer()
            TabBarItem(icon: "heart", title: "Listelerim")
            Spacer()
            TabBarItem(icon: "cart", title: "Sepetim")
            Spacer()
            TabBarItem(icon: "person", title: "Hesabım")
            Spacer()
            TabBarItem(icon: "message", title: "Mesajlarım")
            Spacer()
        } 
        .foregroundStyle(.gray.opacity(0.9))
    }
}

#Preview {
    TabBarView()
}
