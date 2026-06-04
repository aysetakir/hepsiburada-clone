import SwiftUI

struct ListsView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Button {
                    selectedTab = 0
                } label: {
                    VStack(spacing: 4) {
                        Text("Beğendiklerim")
                            .foregroundStyle(selectedTab == 0 ? .black : .gray)
                        Rectangle()
                            .fill(selectedTab == 0 ? Color.hepsiburadaOrange : Color.clear)
                            .frame(height: 2)
                    }
                }
                .frame(maxWidth: .infinity)
                
                Button {
                    selectedTab = 1
                } label: {
                    VStack(spacing: 4) {
                        Text("Listelerim")
                            .foregroundStyle(selectedTab == 1 ? .black : .gray)
                        Rectangle()
                            .fill(selectedTab == 1 ? Color.hepsiburadaOrange : Color.clear)
                            .frame(height: 2)
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.horizontal)
            
            Divider()
            
            if selectedTab == 0 {
                FavoritesView()
            } else {
                UserListsView()
            }
        }
    }
}

#Preview {
    ListsView()
}
