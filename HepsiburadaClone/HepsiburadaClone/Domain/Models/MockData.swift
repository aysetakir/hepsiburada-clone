struct MockData {
    
    static let products: [Product] = [
        Product(
            id: "1",
            name: "Apple iPhone 15 128GB",
            price: 32999,
            originalPrice: 36999,
            imageURL: "https://picsum.photos/400/400?random=1",
            category: "Telefon",
            brand: "Apple",
            rating: 4.8,
            reviewCount: 1243,
            isFavorite: false
        ),
        Product(
            id: "2",
            name: "Samsung 65\" 4K Smart TV",
            price: 18499,
            originalPrice: 21999,
            imageURL: "https://picsum.photos/400/400?random=2",
            category: "Televizyon",
            brand: "Samsung",
            rating: 4.6,
            reviewCount: 876,
            isFavorite: true
        ),
        Product(
            id: "3",
            name: "Nike Air Max 270",
            price: 2899,
            originalPrice: 3499,
            imageURL: "https://picsum.photos/400/400?random=3",
            category: "Spor",
            brand: "Nike",
            rating: 4.5,
            reviewCount: 432,
            isFavorite: false
        ),
        Product(
            id: "4",
            name: "Dyson V15 Detect Süpürge",
            price: 14999,
            originalPrice: 17999,
            imageURL: "https://picsum.photos/400/400?random=4",
            category: "Ev Aletleri",
            brand: "Dyson",
            rating: 4.9,
            reviewCount: 654,
            isFavorite: false
        ),
        Product(
            id: "5",
            name: "MacBook Air M2 256GB",
            price: 42999,
            originalPrice: 45999,
            imageURL: "https://picsum.photos/400/400?random=5",
            category: "Bilgisayar",
            brand: "Apple",
            rating: 4.9,
            reviewCount: 2341,
            isFavorite: true
        ),
        Product(
            id: "6",
            name: "Sony WH-1000XM5 Kulaklık",
            price: 8499,
            originalPrice: 9999,
            imageURL: "https://picsum.photos/400/400?random=6",
            category: "Kulaklık",
            brand: "Sony",
            rating: 4.7,
            reviewCount: 987,
            isFavorite: false
        ),
    ]
    
    static let categories: [Category] = [
        Category(id: "1", name: "Telefon", icon: "iphone"),
        Category(id: "2", name: "Bilgisayar", icon: "laptopcomputer"),
        Category(id: "3", name: "TV", icon: "tv"),
        Category(id: "4", name: "Spor", icon: "sportscourt"),
        Category(id: "5", name: "Moda", icon: "tshirt"),
        Category(id: "6", name: "Ev", icon: "house"),
        Category(id: "7", name: "Kozmetik", icon: "sparkles"),
        Category(id: "8", name: "Kitap", icon: "book"),
    ]
    
    static let banners: [Banner] = [
        Banner(id: "1", imageURL: "https://picsum.photos/200/300?random=10", title: "Bayram İndirimleri"),
        Banner(id: "2", imageURL: "https://picsum.photos/200/300?random=11", title: "Efsane Fırsatlar"),
        Banner(id: "3", imageURL: "https://picsum.photos/200/300?random=12", title: "Süper Kampanya"),
    ]
    
    static let campaigns: [Campaign] = [
        Campaign(id: "1", imageURL: "https://picsum.photos/200/200?random=20", title: "Adidas", subtitle: "%19 Net İndirim"),
        Campaign(id: "2", imageURL: "https://picsum.photos/200/200?random=21", title: "Anne & Çocuk", subtitle: "%10 Net İndirim"),
        Campaign(id: "3", imageURL: "https://picsum.photos/200/200?random=22", title: "U.S. Polo", subtitle: "%60'a Varan İndirim"),
        Campaign(id: "4", imageURL: "https://picsum.photos/200/200?random=23", title: "Flaş Teklif", subtitle: "Alışverişe Özel"),
    ]
}
