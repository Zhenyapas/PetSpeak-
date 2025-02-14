import SwiftUI
import WebKit

struct MicrophoneButton: View {
    var isRecording: Bool
    var action: () -> Void
    
    var body: some View {
        Button(action: action) {
            VStack(spacing: 0) {
                Spacer()
                    .frame(height: 44)
                
                getIcon(isRecording: isRecording)
                
                Spacer()
                    .frame(height: 24)
                
                Text(isRecording ? "Recording ..." : "Start Speak")
                    .foregroundColor(.black)
                    .font(.system(size: 16))
                    .fontWeight(.bold)
                    .frame(width: 138, height: 22)
                
                Spacer()
                    .frame(height: 16)
            }
            .frame(width: 178, height: 176)
            .background(Color.white)
            .cornerRadius(20)
            .shadow(radius: 5)
        }
    }
    
    @ViewBuilder
    private func getIcon(isRecording: Bool) -> some View {
        if !isRecording {
            Image("microphone_icon")
                .frame(width: 70, height: 70)
        } else {
            AnimatedGifView(gifName: "recording")
                .frame(width: 163, height: 95)
            
        }
    }
}
