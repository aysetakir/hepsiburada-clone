import SwiftUI

struct TabBarItem: View {
    
    let icon: String
    let title: String
    let isSelected: Bool
    let action: () -> Void
    
    var body: some View {
        Button {
            action()
        } label: {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                    .fontWeight(.bold)
                Text(title)
                    .font(.footnote)
            }
        }
        .foregroundStyle(isSelected ? .orange : .gray.opacity(0.9))
    }
}


