import SwiftUI

@Observable
class CartViewModel {
    var cartProduct: [CartItem] = []
    
    var totalPrice: Double {
        cartProduct.reduce(0) { $0 + ($1.item.price * Double($1.quantity)) }
    }
    
    init() {
        self.fetchCartProdudts()
    }
    
    func fetchCartProdudts() {
        cartProduct = MockData.cartItems
    }
    
}
