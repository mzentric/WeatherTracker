import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let iconName: String
    let humidity: Int
    let uvIndex: Int
    let feelsLike: Double
    
    init(cityName: String, temperature: Double, iconName: String, humidity: Int, uvIndex: Int, feelsLike: Double) {
        self.cityName = cityName
        self.temperature = temperature.isNaN ? 0 : temperature
        self.iconName = iconName
        self.humidity = humidity
        self.uvIndex = uvIndex
        self.feelsLike = feelsLike.isNaN ? 0 : feelsLike
    }
    
    var searchPreview: WeatherSearchResult {
        WeatherSearchResult(
            cityName: cityName,
            temperature: temperature,
            iconName: iconName
        )
    }
}

struct WeatherSearchResult: Identifiable {
    let id = UUID()
    let cityName: String
    let temperature: Double
    let iconName: String
} 
