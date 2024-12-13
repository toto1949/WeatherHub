//
//  ContentView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var weatherViewModel = WeatherViewModel()

    var body: some View {
        NavigationView {
            WeatherView(viewModel: weatherViewModel)
                .navigationTitle("WeatherHub")
        }
    }
}

#Preview {
    ContentView()
}
