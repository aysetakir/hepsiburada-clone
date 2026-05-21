import SwiftUI

enum AppTab {
    case home, favorites, cart, profile, messages
}
 

struct AppRouter: View {
    
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            switch selectedTab {
            case .home:      Text("HOME").frame(maxWidth: .infinity, maxHeight: .infinity)
            case .favorites: Text("FAVORITES").frame(maxWidth: .infinity, maxHeight: .infinity)
            case .cart:      Text("CART").frame(maxWidth: .infinity, maxHeight: .infinity)
            case .profile:   Text("PROFILE").frame(maxWidth: .infinity, maxHeight: .infinity)
            case .messages:  Text("MESSAGES").frame(maxWidth: .infinity, maxHeight: .infinity)
            }
            
            TabBarView(selectedTab: $selectedTab)
                .background(.white)
                .shadow(color: .black.opacity(0.1), radius: 10, y: -5)
        }
    } 
    
}
