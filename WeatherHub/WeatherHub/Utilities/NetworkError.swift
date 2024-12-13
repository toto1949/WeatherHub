//
//  NetworkError.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation

enum WeatherError: Error {
    case invalidCity
    case serverError
    case networkError
    case decodingError
    
    var message: String {
        switch self {
        case .invalidCity:
            return "City not found. Please check the spelling and try again."
        case .serverError:
            return "Unable to fetch weather data. Please try again later."
        case .networkError:
            return "No internet connection. Please check your connection and try again."
        case .decodingError:
            return "Error processing weather data. Please try again."
        }
    }
}
