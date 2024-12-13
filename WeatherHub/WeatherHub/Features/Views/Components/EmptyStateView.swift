//
//  EmptyStateView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View {
        VStack(spacing: 12) {
            Text(UIString.noCity.rawValue)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(UIString.emptyquery.rawValue)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
    }
}
