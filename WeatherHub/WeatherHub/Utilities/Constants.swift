//
//  Constants.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation

// MARK: - API
enum Constants {
    static let apiKey = "YOUR_API_KEY"
    static let baseURL = "https://api.weatherapi.com/v1"
    
    
    enum UserDefaults {
        static let lastCity = "LastSearchedCity"
    }
}


// MARK: - Storage Keys
enum StorageKeys {
    static let lastCity = "lastSearchedCity"
    static let favoriteCity = "favoriteCity"
    static let recentSearches = "recentSearches"
    static let weatherCache = "weatherCache"
}
// MARK: UIStrings
enum UIString : String {
    case loading  = "Fetching Weather..."
    case searching = "Search Location"
    case humidity = "Humidity"
    case uV = "UV"
    case feels_Like = "Feels Like"
    case noCity = "No City Selected"
    case emptyquery = "Please Search For A City"
    case noResultFound = "No results found for"
    case tryAgain  = "Please try another search"
}
