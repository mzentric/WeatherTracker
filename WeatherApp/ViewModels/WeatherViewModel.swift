import Foundation
import SwiftUI

class WeatherViewModel: ObservableObject {
    @Published var searchText = ""
    @Published var weather: WeatherModel?
    @Published var isLoading = false
    
    // This is a mock implementation. You'll want to replace this with actual API calls
    func searchCity() {
        isLoading = true
        
        // Simulate network delay
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            if !self.searchText.isEmpty {
                // Mock data - replace with actual API call
                self.weather = WeatherModel(
                    cityName: self.searchText,
                    temperature: 20.0,
                    iconName: "sun.max.fill",
                    humidity: 84,
                    uvIndex: 3,
                    feelsLike: 22.0
                )
            } else {
                self.weather = nil
            }
            self.isLoading = false
        }
    }
} 