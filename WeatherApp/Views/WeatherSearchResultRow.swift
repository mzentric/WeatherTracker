import SwiftUI

struct WeatherSearchResultRow: View {
    let result: WeatherSearchResult
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(result.cityName)
                    .font(.custom("Poppins-SemiBold", size: 20))
                    .foregroundColor(.blackMountain)
                HStack(alignment: .top, spacing: 0) {
                    Text("\(Int(round(result.temperature)))")
                        .font(.custom("Poppins-Medium", size: 60))
                        .foregroundColor(.blackMountain)
                    Text("°")
                        .font(.custom("Poppins-Light", size: 24))
                        .foregroundColor(.blackMountain)
                }
            }
            .padding(.leading, 16)
            
            Spacer()
            
            Image(systemName: result.iconName)
                .font(.system(size: 80))
                .symbolRenderingMode(.multicolor)
        }
        .padding(.vertical, 8)
        .padding(.horizontal, 12)
        .background(Color(.systemGray6))
        .cornerRadius(16)
    }
} 
