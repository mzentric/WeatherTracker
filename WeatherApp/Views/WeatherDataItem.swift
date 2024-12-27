
import SwiftUI

struct WeatherDataItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack(spacing: 8) {
            Text(title)
                .font(.system(size: 12))
                .foregroundColor(.gray)
            Text(value)
                .font(.system(size: 16, weight: .medium))
        }
        .frame(minWidth: 80)
    }
} 
