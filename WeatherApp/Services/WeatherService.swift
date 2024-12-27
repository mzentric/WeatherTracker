import Foundation

class WeatherService {
    private let apiKey = "ef7a8eb96a27496abc9194843242712"
    private let baseURL = "https://api.weatherapi.com/v1"
    
    func searchCities(query: String) async throws -> [WeatherSearchResult] {
        let endpoint = "\(baseURL)/search.json?key=\(apiKey)&q=\(query)"
        
        guard let url = URL(string: endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            throw WeatherError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let locations = try JSONDecoder().decode([Location].self, from: data)
        
        var results: [WeatherSearchResult] = []
        for location in locations {
            let weather = try await getCurrentWeather(for: location.name)
            results.append(WeatherSearchResult(
                cityName: location.name,
                temperature: weather.temperature,
                iconName: weather.iconName
            ))
        }
        
        return results
    }
    
    func getCurrentWeather(for city: String) async throws -> WeatherModel {
        let endpoint = "\(baseURL)/current.json?key=\(apiKey)&q=\(city)"
        
        guard let url = URL(string: endpoint.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) ?? "") else {
            throw WeatherError.invalidURL
        }
        
        let (data, _) = try await URLSession.shared.data(from: url)
        let response = try JSONDecoder().decode(WeatherResponse.self, from: data)
        
        return WeatherModel(
            cityName: response.location.name,
            temperature: response.current.temp_c,
            iconName: mapConditionToIcon(code: response.current.condition.code),
            humidity: response.current.humidity,
            uvIndex: Int(round(response.current.uv)),
            feelsLike: response.current.feelslike_c
        )
    }
    
    private func mapConditionToIcon(code: Int) -> String {
        switch code {
        case 1000: return "sunny"
        case 1003: return "partlyCloudy"
        case 1006, 1009: return "cloudy"
        default: return "cloudy"
        }
    }
}

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
}

enum WeatherError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
}

// Response models for the current weather API
struct WeatherResponse: Codable {
    let location: LocationResponse
    let current: CurrentWeather
}

struct LocationResponse: Codable {
    let name: String
    let region: String
    let country: String
}

struct CurrentWeather: Codable {
    let temp_c: Double
    let feelslike_c: Double
    let condition: WeatherCondition
    let humidity: Int
    let uv: Double
}

struct WeatherCondition: Codable {
    let text: String
    let code: Int
} 
