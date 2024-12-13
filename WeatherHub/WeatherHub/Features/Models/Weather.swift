//
//  Weather.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//
import Foundation

struct Weather: Codable {
    let location: Location
    let current: Current
    
    init(location: Location, current: Current) {
        self.location = location
        self.current = current
    }
}
