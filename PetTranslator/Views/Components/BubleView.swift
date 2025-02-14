import SwiftUI

struct StyledTextView: View {
    var text:String
    var body: some View {
        ZStack {
            Image("polygon")  
                .resizable()
                .frame(width: 130, height: 170)
                .offset(x: 90, y: 100)
                .shadow(color: Color.black.opacity(0.1), radius: 1, x: 0, y: 1)
            
            RoundedRectangle(cornerRadius: 16)
                .fill(Color(red: 214/255, green: 220/255, blue: 255/255))
                .frame(width: 291, height: 142)
                .shadow(color: Color.black.opacity(0.15), radius: 2, x: 0, y: 4)
            Image("polygon")
                .resizable()
                .frame(width: 130, height: 170) // Вкажи
                .offset(x: 90, y: 100)
            
            Text(text)
                .font(.system(size: 16, weight: .bold))
                .foregroundColor(.black)
                .padding(16)
            
            
        }
    }
}

struct StyledTextView_Previews: PreviewProvider {
    static var previews: some View {
        StyledTextView(text: "Working")
    }
}
