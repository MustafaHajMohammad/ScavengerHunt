import SwiftUI

struct HuntDetailView: View {
    let item: HuntItem
    @State private var showCamera = false
    @State private var photo: UIImage?
    
    var body: some View {
        VStack(spacing: 20) {
            Text(item.name)
                .font(.largeTitle)
                .bold()
                .padding(.top, 20)
            
            Text(item.clue)
                .font(.title3)
                .foregroundColor(.gray)
                .padding()
            
            if let photo = photo {
                Image(uiImage: photo)
                    .resizable()
                    .scaledToFit()
                    .frame(height: 250)
                    .cornerRadius(12)
                    .shadow(radius: 5)
            }
            
            Button(action: {
                showCamera = true
            }) {
                Label("Take Photo", systemImage: "camera.fill")
                    .font(.headline)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding(.horizontal)
            }
            .sheet(isPresented: $showCamera) {
                CameraPicker { image in
                    photo = image
                }
            }
            
            Spacer()
        }
        .navigationTitle(item.name)
    }
}

#Preview {
    HuntDetailView(item: HuntItem(name: "Coffee Shop", clue: "Find the best latte ☕"))
}

