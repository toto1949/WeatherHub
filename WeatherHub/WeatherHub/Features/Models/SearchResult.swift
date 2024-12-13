//
//  SearchResult.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation

struct SearchResult: Identifiable {
    let id = UUID()
    let city: String
    let temperature: Double
    let condition: Condition
}
