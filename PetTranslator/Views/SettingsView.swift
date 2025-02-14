import SwiftUI

struct SettingsView: View {
    
    struct MenuItem: Identifiable {
        let id = UUID()
        let title: String
        let destination: AnyView
    }
    
    let menuItems = [
        MenuItem(title: "Rate Us", destination: AnyView(RateUsView())),
        MenuItem(title: "Share App", destination: AnyView(ShareAppView())),
        MenuItem(title: "Contact Us", destination: AnyView(ContactUsView())),
        MenuItem(title: "Restore Purchases", destination: AnyView(RestorePurchasesView())),
        MenuItem(title: "Privacy Policy", destination: AnyView(PrivacyPolicyView())),
        MenuItem(title: "Terms of Use", destination: AnyView(TermsOfUseView()))
    ]
    
    var body: some View {
        NavigationView {
            ZStack {
                
                AppBgGradient()
                
                VStack(spacing: 0) {
                    titleSection()
                        .padding(.top, 12)
                    
                    // Основний список
                    ScrollView {
                        VStack(spacing: 12) {
                            ForEach(menuItems) { item in
                                NavigationLink(destination: item.destination) {
                                    menuItemView(title: item.title)
                                }
                                .buttonStyle(PlainButtonStyle())
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.top, 20)
                    }
                    
                    Spacer()
                    
                    BottomNavigationBar(activeTab:.cliker)
                        .padding(.bottom, 16)
                }
            }
            
        }
        .navigationBarHidden(true)
    }
    
    // Функція для створення елемента меню
    private func menuItemView(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .fontWeight(.semibold)
                .padding(.leading, 20)
            
            Image(systemName: "chevron.right")
                .foregroundColor(.gray)
                .padding(.trailing, 20)
        }
        .frame(height: 55)
        .background(Color(red: 0.88, green: 0.88, blue: 0.97))
        .cornerRadius(16)
    }
    
    // Title Section
    private func titleSection() -> some View {
        Text("Settings")
            .font(.system(size: 32))
            .fontWeight(.bold)
            .frame(width: 350, height: 58)
    }
    
    
}


struct RateUsView: View {
    var body: some View {
        Text("Rate Us Screen")
    }
}

struct ShareAppView: View {
    var body: some View {
        Text("Share App Screen")
    }
}

struct ContactUsView: View {
    var body: some View {
        Text("Contact Us Screen")
    }
}

struct RestorePurchasesView: View {
    var body: some View {
        Text("Restore Purchases Screen")
    }
}

struct PrivacyPolicyView: View {
    var body: some View {
        Text("Privacy Policy Screen")
    }
}

struct TermsOfUseView: View {
    var body: some View {
        Text("Terms of Use Screen")
    }
}

struct TranslatorView1: View {
    var body: some View {
        Text("Translator Screen")
    }
}

struct ClickerView: View {
    var body: some View {
        Text("Clicker Screen")
    }
}

// Попередній перегляд
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
