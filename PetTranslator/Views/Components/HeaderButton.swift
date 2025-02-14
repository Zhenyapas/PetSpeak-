import SwiftUI

struct HeaderButton: View {
    var text: String
    var isButton: Bool
    var destination: AnyView
    
    var body: some View {
        HStack(spacing: 0) {
            
            if isButton {
                NavigationLink(destination: destination) {
                    Image("Close")
                        .resizable()
                        .frame(width: 28, height: 28)
                }
                .frame(width: 48, height: 48)
                .background(Color.white)
                .clipShape(Circle())
                .shadow(color: Color(red: 55/255, green: 62/255, blue: 125/255, opacity: 0.05),
                        radius: 30, x: 0, y: 20)
            }
            
            
            Spacer()
            
            
            Text(text)
                .font(.system(size: 32))
                .fontWeight(.bold)
                .frame(maxWidth: .infinity)
                .multilineTextAlignment(.center)
            
            
            if isButton {
                Spacer()
                    .frame(width: 48)
            }
        }
        .frame(width: 350, height: 58)
        
    }
}
