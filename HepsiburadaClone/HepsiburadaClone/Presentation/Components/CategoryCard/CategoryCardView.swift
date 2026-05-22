import SwiftUI

struct CategoryCardView: View {
    let category: Category
    
    var body: some View {
        VStack {
            Image(systemName: category.icon)
                .font(.largeTitle)
                .padding(.bottom, 3)
                .foregroundStyle(.gray.opacity(0.5))
            Text(category.name)
                .font(.footnote)
        }
        .frame(width: 60, height: 65)
        .padding()
        .background {
            RoundedRectangle(cornerRadius: 12) 
                .fill(.card)
        }
      
        
    }
}

#Preview {
    CategoryCardView(category: Category(id: "1", name: "Bilgisayar", icon: "iphone"))
}
