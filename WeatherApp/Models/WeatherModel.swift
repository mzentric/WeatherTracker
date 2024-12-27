import Foundation

struct WeatherModel {
    let cityName: String
    let temperature: Double
    let iconName: String
    let humidity: Int
    let uvIndex: Int
    let feelsLike: Double
    
    // Preview version for search results
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
