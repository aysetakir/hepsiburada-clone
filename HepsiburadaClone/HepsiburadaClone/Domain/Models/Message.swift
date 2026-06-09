import SwiftUI

struct Message: Identifiable {
    let id: String
    let senderName: String
    let lastMessage: String
    let time: String
    let unreadCount: Int
    let color: Color
    let icon: String
}
