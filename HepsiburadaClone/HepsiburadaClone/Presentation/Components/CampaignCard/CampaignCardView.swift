import SwiftUI

struct CampaignCardView: View {
    let campaign: Campaign
    
    var body: some View {
        VStack(spacing: 6) { 
            
                AsyncImage(url: URL(string: campaign.imageURL)) { phase in
                    if let image = phase.image {
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 80)
                    } else if phase.error != nil {
                        Color.red
                    }
                }
                .padding(.top, 3)
                VStack {
                    Text(campaign.title)
                        .foregroundStyle(.gray)
                        .fontWeight(.bold)
                    Text(campaign.subtitle)
                } 
                .font(.footnote)
                .frame(maxWidth: .infinity)
                .background(.card)
                
                
            }
        .frame(width: 100, height: 100)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(.hepsiburadaOrange))
    }
}


#Preview {
    CampaignCardView(campaign: Campaign(id: "1", imageURL: "https://picsum.photos/200/200?random=20", title: "adidas", subtitle: "%19 Net İndirim"))
}
