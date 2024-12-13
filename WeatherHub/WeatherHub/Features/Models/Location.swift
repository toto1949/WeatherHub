//
//  Location.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation

struct Location: Codable {
    let name: String
    let region: String
    let country: String
    let lat: Double
    let lon: Double
    let localtime: String
    
    enum CodingKeys: String, CodingKey {
        case name, region, country, lat, lon, localtime
    }
}
