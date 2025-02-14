
import SwiftUI

struct ToggleView: View {
    @Binding var isReversed: Bool
    let text1: String
    let text2: String
    
    var body: some View {
        
        if !isReversed {
            Text(text1)
                .fontWeight(.semibold)
                .frame(width: 135, height: 61)
                .font(.system(size: 16))
        } else {
            Text(text2)
                .fontWeight(.semibold)
                .frame(width: 135, height: 61)
                .font(.system(size: 16))
        }
        
        Button(action: {
            isReversed.toggle()
        }) {
            Image("arrow-swap")
                .font(.system(size: 20))
        }
        .frame(width: 24, height: 24)
        
        if !isReversed {
            Text(text2)
                .fontWeight(.semibold)
                .frame(width: 135, height: 61)
                .font(.system(size: 16))
        } else {
            Text(text1)
                .fontWeight(.semibold)
                .frame(width: 135, height: 61)
                .font(.system(size: 16))
        }
    }
    
}




//#Preview {
//    ToggleView()
//}
