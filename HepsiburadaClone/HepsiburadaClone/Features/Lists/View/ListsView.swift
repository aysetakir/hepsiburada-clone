import SwiftUI

struct ListsView: View {
    @State private var selectedTab = 0
    
    var body: some View {
        ZStack(alignment: .bottomTrailing) {
            VStack(spacing: 0) {
                
                HStack {
                    Image(systemName: "person")
                        .padding(10)
                        .background(.gray.opacity(0.2))
                        .clipShape(Circle())
                    
                    VStack(alignment: .leading){
                        Text("Ayşegül Takır")
                            .fontWeight(.bold)
                        HStack {
                            Text("0 Takipçi")
                            Text("0 Takip edilen")
                        }
                        .font(.footnote)
                        .foregroundStyle(.gray)
                    }
                    .padding(.leading)
                    Spacer()
                }
                .padding(.leading)
                .padding(.bottom)
                
                
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
            
            HStack {
                Image(systemName: "plus")
                Button{} label: {
                    Text("Yeni Liste")
                    
                }
            }
            .padding(5)
            .foregroundStyle(.white)
            .font(.footnote)
            .fontWeight(.bold)
            .background(
                RoundedRectangle(cornerRadius: 8)
                    .fill(.hepsiburadaOrange)
            )
            .padding(.horizontal)
            .padding(.bottom)
        }
    }
}

#Preview {
    ListsView()
}
