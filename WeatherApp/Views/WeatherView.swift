import SwiftUI

struct WeatherView: View {
    let weather: WeatherModel
    
    var body: some View {
        VStack(spacing: 16) {
            Image(systemName: weather.iconName)
                .font(.system(size: 120))
                .symbolRenderingMode(.multicolor)
            
            HStack(spacing: 8) {
                Text(weather.cityName)
                    .font(.custom("Poppins-SemiBold", size: 30))
                    .foregroundColor(.blackMountain)

                Image(systemName: "location.fill")
                    .foregroundColor(.blackMountain)
                    .font(.system(size: 20))
            }
            
            HStack(alignment: .top, spacing: 0) {
                Text("\(Int(round(weather.temperature)))")
                    .font(.custom("Poppins-Medium", size: 70))
                Text("°")
                    .font(.custom("Poppins-Medium", size: 30))
            }
            .padding(.bottom, 24)
            
            // Weather details section
            HStack(spacing: 20) {
                WeatherDataItem(title: "Humidity", value: "\(weather.humidity)%")
                
                WeatherDataItem(title: "UV Index", value: "\(weather.uvIndex)")
                
                WeatherDataItem(title: "Feels Like", value: "\(Int(round(weather.feelsLike)))°")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(Color(.systemGray6))
            .cornerRadius(15)
        }
    }
} 
