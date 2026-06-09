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
                case .cart: CartView().frame(maxWidth: .infinity, maxHeight: .infinity)
                case .profile: ProfileView().frame(maxWidth: .infinity, maxHeight: .infinity)
                case .messages:  Text("MESSAGES").frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                
                TabBarView(selectedTab: $selectedTab)
                    .background(.white)
            }
        }
    }
}
