import SwiftUI

struct WeatherView: View {
    let weather: WeatherModel
    
    var body: some View {
        VStack(spacing: 16) {
            Image(weather.iconName)
                .resizable()
                .scaledToFit()
                .frame(width: 120, height: 120)
            
            HStack(spacing: 8) {
                Text(weather.cityName)
                    .font(.custom("Poppins-SemiBold", size: 30))
                    .foregroundColor(.blackMountain)

                Image(systemName: "location.fill")
                    .foregroundColor(.blackMountain)
                    .font(.system(size: 20))
            }
            
            HStack(alignment: .top, spacing: 0) {
                Text("\(Int(weather.temperature.isNaN ? 0 : round(weather.temperature)))")
                    .font(.custom("Poppins-Medium", size: 70))
                Text("°")
                    .font(.custom("Poppins-Medium", size: 30))
            }
            .padding(.bottom, 24)
            
            // Weather details section
            HStack(spacing: 20) {
                WeatherDataItem(title: "Humidity", value: "\(weather.humidity)%")
                
                WeatherDataItem(title: "UV Index", value: "\(weather.uvIndex)")
                
                WeatherDataItem(title: "Feels Like", value: "\(Int(weather.feelsLike.isNaN ? 0 : round(weather.feelsLike)))°")
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(Color(.systemGray6))
            .cornerRadius(15)
        }
    }
} 
