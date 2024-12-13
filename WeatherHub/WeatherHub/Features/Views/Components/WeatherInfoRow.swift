//
//  WeatherInfoRow.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

import SwiftUI

struct WeatherInfoRow: View {
    let humidity: Int
    let uv: Double
    let feelsLike: Double
    
    var body: some View {
        HStack(spacing: 56) {
            WeatherInfoItem(title: UIString.humidity.rawValue, value: "\(humidity)%")
            WeatherInfoItem(title: UIString.uV.rawValue, value: String(format: "%.0f", uv))
            WeatherInfoItem(title: UIString.feels_Like.rawValue, value: "\(Int(feelsLike))°")
        }
        .frame(width: 274, height: 75)
        .padding(.horizontal, 4)
        .background(Color(.systemGray6))
        .cornerRadius(8)
    }
}
