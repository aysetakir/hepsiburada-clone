import SwiftUI

@Observable
class HomeViewModel {
    var products: [Product] = []
    var categories: [Category] = []
    var banners: [Banner] = []
    var campaigns: [Campaign] = []
    
    init() {
        fetchProducts()
        fetchCategories()
        fetchBanners()
        fetchCampaigns()
    }
    
    func fetchProducts() { self.products = MockData.products }
    func fetchCategories() { self.categories = MockData.categories }
    func fetchBanners() { self.banners = MockData.banners }
    func fetchCampaigns() { self.campaigns = MockData.campaigns }
}
