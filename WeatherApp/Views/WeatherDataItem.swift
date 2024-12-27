import SwiftUI

struct WeatherDataItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.custom("Poppins-Medium", size: title == "Feels Like" ? 8 : 12))
                .foregroundColor(.gray)
            Text(value)
                .font(.custom("Poppins-Medium", size: 16))
                .foregroundColor(.gray)
        }
        .frame(minWidth: 80)
    }
} 
