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
        
        return locations.map { location in
            WeatherSearchResult(
                cityName: "\(location.name)",
                temperature: 0.0, // We'll get this from a separate current weather call
                iconName: "sun.max.fill" // Default icon, will be updated with actual weather
            )
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
