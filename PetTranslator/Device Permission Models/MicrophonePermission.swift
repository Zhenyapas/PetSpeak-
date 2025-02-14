import AVFoundation
import Foundation

@MainActor
class MicrophonePermissionManager: ObservableObject {
    @Published var permissionGranted = false
    
    init() {
        checkPermission()
    }
    
    func checkPermission() {
        let status = AVCaptureDevice.authorizationStatus(for: .audio)
        permissionGranted = (status == .authorized)
    }
    
    func requestMicrophonePermission(completion: @escaping (Bool) -> Void) {
        AVCaptureDevice.requestAccess(for: .audio) { granted in
            Task { @MainActor in
                print("Microphone permission granted: \(granted)")
                self.permissionGranted = granted
                completion(granted)
            }
        }
    }
}
