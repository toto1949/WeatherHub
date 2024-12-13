//
//  ViewExtensions.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

extension View {
    func cardStyle() -> some View {
        self.modifier(CardViewModifier())
    }
}

struct CardViewModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(10)
            .shadow(radius: 2)
    }
}

