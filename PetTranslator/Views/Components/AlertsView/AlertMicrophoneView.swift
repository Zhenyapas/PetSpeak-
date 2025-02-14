import SwiftUI

struct PermissionMicrophone: View {
    var permissionManager: MicrophonePermissionManager
    @Binding var showAlert: Bool
    @Binding var navigateToTranslatorView: Bool
    
    var body: some View {
        Group {
            if !permissionManager.permissionGranted {
                Color.black.opacity(0.3)
                    .ignoresSafeArea()
                    .overlay(
                        VStack(spacing: 16) {
                            Text("\"App Name\" is asking for permission to access your microphone")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            
                            Text("Allow access to your microphone to use the app's features")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .padding(.horizontal, 12)
                            
                            Divider()
                            
                            // Кнопка "Allow Access"
                            Button(action: {
                                permissionManager.requestMicrophonePermission { granted in
                                    DispatchQueue.main.async {
                                        if granted {
                                            showAlert = false
                                            navigateToTranslatorView = true
                                        } else {
                                            showAlert = false
                                            if let settingsURL = URL(string: UIApplication.openSettingsURLString) {
                                                UIApplication.shared.open(settingsURL)}
                                        }
                                    }
                                }
                            }) {
                                Text("Allow Access")
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: 17))
                            }
                            .foregroundColor(.blue)
                            
                            Divider()
                            
                            // Кнопка "Don't Allow"
                            Button(action: {
                                showAlert = false
                                navigateToTranslatorView = true
                            }) {
                                Text("Don't Allow")
                                    .frame(maxWidth: .infinity)
                                    .font(.system(size: 17))
                            }
                            .foregroundColor(.blue)
                        }
                            .padding(.vertical, 16)
                            .frame(width: 273)
                            .background(Color.white)
                            .cornerRadius(14)
                            .padding()
                    )
            }
        }
    }
}





struct AlertEnableMicrophoneView: View {
    @Binding var showMicrophoneAlert:Bool
    
    var body: some View {
        Group {
            Color.black.opacity(0.3)
                .ignoresSafeArea()
                .overlay(
                    VStack(spacing: 0) {
                        VStack {
                            Text("Enable Microphone Access")
                                .font(.headline)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 13))
                                .padding(.top, 19)
                            
                            Text("Please allow access to your microphone to use the app’s feature")
                                .font(.subheadline)
                                .multilineTextAlignment(.center)
                                .font(.system(size: 13))
                                .padding(.bottom, 15)
                                .frame(width: 213)
                        }
                        
                        Divider()
                            .padding(.vertical, 0)
                        
                        HStack(spacing: 0) {
                            Button(action: {
                                
                                showMicrophoneAlert = false
                                
                            }) {
                                Text("Cancel")
                                    .frame(width: 134.83, height: 44)
                                    .font(.system(size: 17))
                                    .foregroundColor(.blue)
                            }
                            
                            NavigationLink(destination: MainPageView()) {
                                Text("Settings")
                                    .frame(width: 134.83, height: 44)
                                    .font(.system(size: 17))
                                    .foregroundColor(.blue)
                            }
                        }
                    }
                        .frame(width: 273)
                        .background(Color.white)
                        .cornerRadius(14)
                )
        }
    }
}


