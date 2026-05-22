import SwiftUI

struct BrandSliderView: View {
    let brands = MockData.brands
    
    var body: some View {
        ScrollView(.horizontal){
            LazyHStack {
                ForEach(brands, id: \.self) { brand in
                    Text(brand)
                        .font(.caption)
                       // .padding(24)
                        .padding()
                        .background(.card)
                        .clipShape(Circle())
                }
            }
        }
        
    }
}

#Preview {
    BrandSliderView()
}
