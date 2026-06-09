import SwiftUI

struct MessageRowView: View {
    
    let message: Message
    
    var body: some View {
        HStack(alignment: .center) {
            RoundedRectangle(cornerRadius: 8)
                .fill(message.color)
                .frame(width: 50, height: 35)
                .overlay(
                    Image(systemName: message.icon)
                        .foregroundStyle(.white)
                )
            
            VStack(alignment: .leading) {
                Text(message.senderName)
                    .font(.headline)
                Text(message.lastMessage)
                    .foregroundStyle(.black.opacity(0.7))
            }
            .padding(.leading, 5)
            
            Spacer() // ← bunu ekle
            
            VStack(alignment: .trailing) {
                Text(message.time)
                    .font(.subheadline)
                    .foregroundStyle(.gray)
                Text("\(message.unreadCount)")
                    .padding(5)
                    .foregroundStyle(.white)
                    .font(.subheadline)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(.hepsiburadaOrange)
                    )
            }
        }
        .padding(.horizontal)
    }
}


#Preview {
    MessageRowView(message: MockData.messages[0])
}
