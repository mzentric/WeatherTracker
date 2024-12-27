import Foundation
import SwiftUI

@MainActor
class WeatherViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var weather: WeatherModel?
    @Published var isLoading = false
    @Published var searchResults: [WeatherSearchResult] = []
    @Published var error: Error?
    
    private let weatherService = WeatherService()
    
    func searchCity() {
        guard !searchText.isEmpty else {
            searchResults = []
            return
        }
        
        Task {
            do {
                isLoading = true
                searchResults = try await weatherService.searchCities(query: searchText)
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
    
    func selectCity(_ searchResult: WeatherSearchResult) {
        // We'll implement this next with the current weather API
        weather = WeatherModel(
            cityName: searchResult.cityName,
            temperature: searchResult.temperature,
            iconName: searchResult.iconName,
            humidity: 84,
            uvIndex: 3,
            feelsLike: searchResult.temperature + 2
        )
        searchResults = []
        searchText = ""
    }
} 