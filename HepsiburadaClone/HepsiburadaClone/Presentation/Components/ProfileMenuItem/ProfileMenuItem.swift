import SwiftUI

struct ProfileMenuItem: View {
    let icon: String
    let title: String
    
    var body: some View {
        HStack {
            Image(systemName: icon)
                .foregroundStyle(.black)
                .frame(width: 30)
            Text(title)
            Spacer()
            Image(systemName: "chevron.right")
                .foregroundStyle(.gray)
                .font(.footnote)
        }
        .padding(.vertical, 12)
        .padding(.horizontal)
    }
}
