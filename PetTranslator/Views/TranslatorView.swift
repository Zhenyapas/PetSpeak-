import SwiftUI
struct TranslatorView: View {
    @State private var selectedPet: Pet = .dog
    @State private var isRecording = false
    @State private var isRedirect = false
    @State private var isReversed = false
    @State private var showMicrophoneAlert = false
    @ObservedObject var permissionManager = MicrophonePermissionManager()
    
    var body: some View {
        
        NavigationView {
            
            ZStack {
                AppBgGradient()
                
                VStack(spacing: 0) {
                    // Title section
                    titleSection()
                        .padding(.top, 12)
                    
                    // Toggle section
                    toggleSection()
                        .padding(.top, 12)
                    
                    // Main Content Area
                    mainContentArea()
                        .padding(.top, 58)
                    
                    // Decorative Pet Image
                    decorativePetImage()
                        .padding(.top, 51)
                    
                    // Bottom Navigation
                    BottomNavigationBar(activeTab: .translator)
                        .padding(.top, 36)
                    
                    
                    Spacer()
                        .frame(height:16)
                    
                        .navigationDestination(isPresented: $isRedirect) {
                            WaitingZone(selectedPet: selectedPet, isReversed: isReversed)
                        }
                    
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Alert overlay
                if showMicrophoneAlert {
                    AlertEnableMicrophoneView(showMicrophoneAlert: $showMicrophoneAlert)
                }
                
            }
            
            
        }
        .navigationBarHidden(true)
        
    }
    
    
    // Title Section
    private func titleSection() -> some View {
        Text("Translator")
            .font(.system(size: 32))
            .fontWeight(.bold)
            .frame(width: 350, height: 58)
    }
    
    // Toggle Section
    private func toggleSection() -> some View {
        HStack(spacing: 8) {
            ToggleView(isReversed: $isReversed, text1: "HUMAN", text2: "PET")
        }
        .frame(width: 310, height: 61)
    }
    
    // Main Content Area
    private func mainContentArea() -> some View {
        HStack(spacing: 20) {
            // Microphone Button
            MicrophoneButton(isRecording:isRecording) {
                handleMicrophoneTap()
            }
            
            // Pet Selection Grid
            petSelectionGrid()
        }
    }
    
    
    private func handleMicrophoneTap() {
        Task { @MainActor in
            permissionManager.checkPermission()
            
            if permissionManager.permissionGranted {
                isRecording.toggle()
                showMicrophoneAlert = false
                
                if isRecording {
                    DispatchQueue.main.asyncAfter(deadline: .now() + 4.5) {
                        isRedirect = true
                    }
                }
                
            } else {
                showMicrophoneAlert = true
            }
        }
    }
    
    // Pet Selection Grid
    private func petSelectionGrid() -> some View {
        VStack(spacing: 12) {
            petButton(for: .cat)
            petButton(for: .dog)
        }
        .frame(width: 107, height: 176)
        .background(Color.white)
        .cornerRadius(20)
        .shadow(radius: 5)
    }
    
    // Pet Button
    private func petButton(for pet: Pet) -> some View {
        Button(action: {
            selectedPet = pet
        }) {
            Image(pet.imageName)
                .resizable()
                .scaledToFit()
                .frame(width: 40, height: 40)
                .padding(10)
                .opacity((selectedPet == pet) ? 1 : 0.5)
                .frame(width: 70, height: 70)
                .background(backgroundForPet(pet))
                .cornerRadius(15)
        }
    }
    
    // Background for Pet Button
    private func backgroundForPet(_ pet: Pet) -> Color {
        switch pet {
        case .cat: return Color.blue.opacity((selectedPet == pet) ? 0.2 : 0.1)
        case .dog: return Color.yellow.opacity((selectedPet == pet) ? 0.2 : 0.1)
        }
    }
    
    // Decorative Pet Image
    private func decorativePetImage() -> some View {
        Image(selectedPet.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
    }
    
    
}

// Pet Model
enum Pet: String, CaseIterable {
    case cat, dog
    
    var imageName: String {
        switch self {
        case .cat: return "cat"
        case .dog: return "dog"
        }
    }
}




// Preview
struct TranslatorView_Previews2: PreviewProvider {
    static var previews: some View {
        TranslatorView()
    }
}
