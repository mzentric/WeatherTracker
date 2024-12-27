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
    private let storageService = StorageService()
    
    init() {
        Task {
            await loadSavedCity()
        }
    }
    
    private func loadSavedCity() async {
        if let savedCity = storageService.getSelectedCity() {
            do {
                isLoading = true
                weather = try await weatherService.getCurrentWeather(for: savedCity)
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
    
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
        Task {
            do {
                isLoading = true
                weather = try await weatherService.getCurrentWeather(for: searchResult.cityName)
                storageService.saveSelectedCity(cityName: searchResult.cityName)
                searchResults = []
                searchText = ""
                isLoading = false
            } catch {
                self.error = error
                isLoading = false
            }
        }
    }
} 
