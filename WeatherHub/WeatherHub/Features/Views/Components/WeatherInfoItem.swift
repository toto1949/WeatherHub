//
//  WeatherInfoItem.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//
import SwiftUI

struct WeatherInfoItem: View {
    let title: String
    let value: String
    
    var body: some View {
        VStack {
            Text(title)
                .font(.caption)
                .foregroundColor(.gray)
            Text(value)
                .font(.system(.body, design: .rounded))
                .fontWeight(.medium)
                .foregroundColor(.gray)

        }
        .frame(height: 20)
        .padding(.vertical, 4)
    }
}
