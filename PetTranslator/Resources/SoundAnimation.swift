import SwiftUI
import UIKit

struct AnimatedGifView: UIViewRepresentable {
    let gifName: String
    
    func makeUIView(context: Context) -> UIImageView {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.loadGif(name: gifName)
        return imageView
    }
    
    func updateUIView(_ uiView: UIImageView, context: Context) {}
}

extension UIImageView {
    func loadGif(name: String) {
        guard let path = Bundle.main.path(forResource: name, ofType: "gif") else { return }
        guard let data = try? Data(contentsOf: URL(fileURLWithPath: path)) else { return }
        guard let source = CGImageSourceCreateWithData(data as CFData, nil) else { return }
        
        var images = [UIImage]()
        let count = CGImageSourceGetCount(source)
        
        for i in 0..<count {
            if let cgImage = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: cgImage))
            }
        }
        
        self.animationImages = images
        self.animationDuration = Double(count) * 0.1
        self.startAnimating()
    }
}
