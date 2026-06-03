import SwiftUI

struct TabBarView: View {
    
    @Binding var selectedTab: AppTab
    
    var body: some View {
        
        HStack {
            Spacer()
            TabBarItem(icon: "house", title: "Ana Sayfam", isSelected: selectedTab == .home) {
                selectedTab = .home
            }
            Spacer()
            TabBarItem(icon: "heart", title: "Listelerim", isSelected: selectedTab == .lists) {
                selectedTab = .lists
            }
            Spacer()
            TabBarItem(icon: "cart", title: "Sepetim", isSelected: selectedTab == .cart) {
                selectedTab = .cart
            }
            Spacer()
            TabBarItem(icon: "person", title: "Hesabım", isSelected: selectedTab == .profile) {
                selectedTab = .profile
            }
            Spacer()
            TabBarItem(icon: "message", title: "Mesajlarım", isSelected: selectedTab == .messages) {
                selectedTab = .messages
            }
            Spacer()
        }
        .foregroundStyle(.gray.opacity(0.9))
        .padding(.top, 12)
    }
}

