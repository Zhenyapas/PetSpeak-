import SwiftUI

struct AppBgGradient: View {
    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.green.opacity(0.1), Color.green.opacity(0.3)]),
            startPoint: .top,
            endPoint: .bottom
        )
        .edgesIgnoringSafeArea(.all)
    }
}
