import SwiftUI

@Observable
class MessagesViewModel {
    var message: [Message] = []
    
    init() {
        fetchMessages()
    }
    
    func fetchMessages() {
        message = MockData.messages
    }
}
