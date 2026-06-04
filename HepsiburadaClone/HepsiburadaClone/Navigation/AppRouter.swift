import SwiftUI

enum AppTab {
    case home, lists, cart, profile, messages
}
 

struct AppRouter: View {
    
    @State private var selectedTab: AppTab = .home
    
    var body: some View {
        ZStack(alignment: .bottom) {
            NavigationStack {
                switch selectedTab {
                case .home: HomeView().frame(maxWidth: .infinity, maxHeight: .infinity)
                case .lists: ListsView().frame(maxWidth: .infinity, maxHeight: .infinity)
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
}
