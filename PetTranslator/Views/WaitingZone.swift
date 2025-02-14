import SwiftUI

struct WaitingZone: View {
    
    var selectedPet:Pet
    var isReversed:Bool
    @State var isOver = false
    @State var finalStage = false
    
    
    
    
    var body: some View {
        NavigationView {
            ZStack {
                
                AppBgGradient()
                
                VStack(spacing: 0) {
                    
                    if (isOver) {
                        HeaderButton(text:"Result", isButton:true, destination:AnyView(TranslatorView()))
                    }
                    
                    messageSection(get: getPetPhrase(for: selectedPet,isReversed:isReversed))
                    
                    
                    decorativePetImage()
                        .padding(.top, 63)
                    
                    BottomNavigationBar(activeTab:.translator)
                        .padding(.top, 36)
                        .padding(.bottom, 16)
                    
                }
            }
            
        }
        .onAppear {
            DispatchQueue.main.asyncAfter(deadline: .now() + 4.0) {
                isOver = true
            }
            DispatchQueue.main.asyncAfter(deadline: .now() + 12.0) {
                finalStage = true
            }
            
            
        }
        .navigationBarHidden(true)
    }
    
    

    private func menuItemView(title: String) -> some View {
        HStack {
            Text(title)
                .foregroundColor(.black)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 20)
            
            
        }
        .frame(height: 55)
        .background(Color(red: 0.88, green: 0.88, blue: 0.97))
        .cornerRadius(16)
    }
    
    // Title Section
    @ViewBuilder
    private func messageSection(get text:String) -> some View {
        
        if isOver {
            
            StyledTextView(text: text)
                .padding(.top, 161)
            
        } else {
            
            Text("Process translation...")
                .font(.system(size: 16))
                .fontWeight(.bold)
                .frame(width: 350, height: 58)
                .padding(.top, 343)
            
        }
    }
    
    // Pet image
    
    private func decorativePetImage() -> some View {
        Image(selectedPet.imageName)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
    }
    
    
}

// Preview
struct TranslatorView_Previews4: PreviewProvider {
    static var previews: some View {
        WaitingZone(selectedPet: .cat, isReversed: false)
    }
}
