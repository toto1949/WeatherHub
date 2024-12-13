//
//  NoResultsView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

struct NoResultsView: View {
    let searchTerm: String
    
    var body: some View {
        VStack(spacing: 12) {
            Text("\(UIString.noResultFound) '\(searchTerm)'")
                .font(.headline)
                .multilineTextAlignment(.center)
            
            Text(UIString.tryAgain.rawValue)
                .font(.subheadline)
                .foregroundColor(.secondary)
        }
        .padding()
    }
}
