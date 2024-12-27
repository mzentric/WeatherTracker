import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var weather: WeatherModel?
    @Published var isLoading = false
    @Published var searchResults: [WeatherSearchResult] = []
    
    // This is a mock implementation. You'll want to replace this with actual API calls
    func searchCity() {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !self.searchText.isEmpty {
                // Mock search results - replace with actual API call
                self.searchResults = [
                    WeatherSearchResult(cityName: "\(self.searchText) City", temperature: 20.0, iconName: "sun.max.fill"),
                    WeatherSearchResult(cityName: "\(self.searchText) Town", temperature: 18.5, iconName: "cloud.sun.fill"),
                    WeatherSearchResult(cityName: "\(self.searchText) Village", temperature: 22.3, iconName: "cloud.fill")
                ]
            } else {
                self.searchResults = []
            }
            self.isLoading = false
        }
    }
    
    func selectCity(_ searchResult: WeatherSearchResult) {
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