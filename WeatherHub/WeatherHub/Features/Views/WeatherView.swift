//
//  WeatherView.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import SwiftUI
import Foundation

struct WeatherView: View {
    @StateObject var viewModel: WeatherViewModel
    @State private var searchText = ""
    
    var body: some View {
        ScrollView {
            VStack(spacing: 12) {
                SearchBarView(searchText: $searchText)
                    .onChange(of: searchText) { newValue in
                        viewModel.updateSearchText(newValue)
                    }
                    .padding(.top, 20)
                if viewModel.isLoading {
                    ProgressView(UIString.loading.rawValue)
                        .padding(.top, 8)
                } else if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .foregroundColor(.red)
                        .multilineTextAlignment(.center)
                        .padding(4)
                } else if let weather = viewModel.weather {
                    WeatherInfoView(
                        locationName: weather.location.name,
                        locationCountry: weather.location.country,
                        temperature: weather.current.tempC,
                        conditionIcon: weather.current.condition.icon
                    )
                    .padding(.horizontal, 16)
                    .padding(.top, 10)
                    
                    WeatherInfoRow(
                        humidity: weather.current.humidity,
                        uv: weather.current.uv,
                        feelsLike: weather.current.feelslikeC
                    )
                    .padding(.top, 6)
                } else {
                    EmptyStateView()
                        .padding(.top, 8)
                }
            }
            .padding(.horizontal, 12)
            .safeAreaInset(edge: .top, spacing: 0) {
                Color.clear.frame(height: 20)
            }
            .frame(maxWidth: .infinity, alignment: .top)
            .onAppear {
                if let cachedWeather = try? viewModel.weatherStorageManager.getCachedWeatherData() {
                    viewModel.weather = cachedWeather
                }
            }
        }
    }
}
