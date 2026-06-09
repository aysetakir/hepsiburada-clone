import SwiftUI

struct MessagesView: View {
    @State private var viewModel = MessagesViewModel()
    var body: some View {
        VStack {
            Text("Mesajlarım")
                .font(.headline)
                .padding()
            
            ScrollView{
                ForEach(viewModel.message) { message in
                    MessageRowView(message: message)
                }
            }
        }
        Spacer()
    }
}

#Preview {
    MessagesView()
}
