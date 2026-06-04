import SwiftUI

@Observable
class ListsViewModel {
    var favoriteProducts: [Product] = []
    var userLists: [UserList] = []
    
    init() {
        fetchLists()
        fetchFavorites()
    }
    
    func fetchFavorites() {
        self.favoriteProducts = MockData.favoriteProducts
    }
    
    func fetchLists() {
        self.userLists = MockData.userLists
    }
}
