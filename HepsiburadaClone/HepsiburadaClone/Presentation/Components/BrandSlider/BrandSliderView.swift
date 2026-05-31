import SwiftUI

struct BrandSliderView: View {
    let brands = MockData.brands
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack {
                ForEach(brands, id: \.self) { brand in
                    ZStack {
                        Circle()
                            .fill(.gray.opacity(0.1))
                            .frame(width: screenWidth * 0.2)
                        Text(brand)
                    }
                }
            }
            .padding(.horizontal)
        }
        .scrollIndicators(.hidden)
    }
}

#Preview {
    BrandSliderView()
}
