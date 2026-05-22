import SwiftUI

@Observable
class HomeViewModel {
    var products: [Product] = []
    var categories: [Category] = []
    var banners: [Banner] = []
    var campaigns: [Campaign] = []
    var brands: [String] = []
    
    init() {
        fetchProducts()
        fetchCategories()
        fetchBanners()
        fetchCampaigns()
        fetchBrands()
    }
    
    func fetchProducts() { self.products = MockData.products }
    func fetchCategories() { self.categories = MockData.categories }
    func fetchBanners() { self.banners = MockData.banners }
    func fetchCampaigns() { self.campaigns = MockData.campaigns }
    func fetchBrands() { self.brands = MockData.brands }
}
