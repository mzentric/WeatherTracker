import Foundation

class StorageService {
    private let defaults = UserDefaults.standard
    private let selectedCityKey = "selectedCity"
    
    func saveSelectedCity(cityName: String) {
        defaults.set(cityName, forKey: selectedCityKey)
    }
    
    func getSelectedCity() -> String? {
        return defaults.string(forKey: selectedCityKey)
    }
} 