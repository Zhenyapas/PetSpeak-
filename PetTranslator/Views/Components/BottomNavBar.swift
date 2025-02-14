import SwiftUI

struct BottomNavigationBar: View {
    
    var activeTab: ActiveTab
    
    var body: some View {
        HStack(spacing: 0) {
            navigationButton(
                icon: "messages_icon",
                isMain: activeTab == .translator,
                isSystemImage: false,  // Додаємо цей аргумент
                text: "Translator",
                color: activeTab == .translator ? .black : .gray,
                destination: AnyView(TranslatorView())
            )
            
            Spacer().frame(width: 42)
            navigationButton(
                icon: "gearshape_icon",
                isMain: activeTab == .cliker,
                isSystemImage: false,
                text: "Clicker",
                color: activeTab == .cliker ? .black : .gray,
                destination: AnyView(SettingsView())
                
            )
        }
        .frame(width: 216, height: 82)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    enum ActiveTab: String {
        case cliker = "Clicker"
        case translator = "Translator"
    }
    
    private func navigationButton(
        icon: String, isMain: Bool, isSystemImage: Bool = false, text: String,
        color: Color, destination: AnyView
    ) -> some View {
        NavigationLink(destination: destination) {
            VStack {
                if isSystemImage {
                    Image(systemName: icon)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 24, height: 24)
                    
                } else {
                    Image(icon)
                        .resizable()
                        .frame(width: 24, height: 24)
                        .opacity(isMain ? 1 : 0.6)
                }
                Text(text)
                    .font(.system(size: 12))
                    .fontWeight(.semibold)
            }
            .foregroundColor(color)
        }
    }
}
