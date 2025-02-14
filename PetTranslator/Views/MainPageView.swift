import SwiftUI

struct MainPageView: View {
    @StateObject private var permissionManager = MicrophonePermissionManager()
    @State private var showAlert = true // Стан для відображення AlertMicrophoneView
    @State private var navigateToTranslatorView = false // Стан для переходу на TranslatorView
    
    var body: some View {
        NavigationStack { // Додайте NavigationStack
            VStack(spacing: 0) {
                // Ваш існуючий вміст...
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(
                LinearGradient(
                    gradient: Gradient(colors: [Color.green.opacity(0.1), Color.green.opacity(0.3)]),
                    startPoint: .top,
                    endPoint: .bottom
                )
            )
            .onAppear {
                permissionManager.requestMicrophonePermission { granted in
                    navigateToTranslatorView = granted
                }
            }
            .overlay(
                Group {
                    if showAlert {
                        PermissionMicrophone(
                            permissionManager: permissionManager,
                            showAlert: $showAlert,
                            navigateToTranslatorView: $navigateToTranslatorView
                        )
                    }
                }
            )
            .navigationDestination(isPresented: $navigateToTranslatorView) {
                TranslatorView() // Перехід на TranslatorView
            }
        }
    }
}

//
struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPageView()
    }
}
