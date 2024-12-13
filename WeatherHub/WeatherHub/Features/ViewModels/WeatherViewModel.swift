//
//  WeatherViewModel.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Combine
import Foundation

class WeatherViewModel: ObservableObject {
    @Published var weather: Weather?
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    private var cancellables = Set<AnyCancellable>()
    private let networkService: NetworkServiceProtocol
    let weatherStorageManager: WeatherStorageManager
    
    private let searchSubject = PassthroughSubject<String, Never>()
    
    init(
        networkService: NetworkServiceProtocol = NetworkService(),
        weatherStorageManager: WeatherStorageManager = WeatherStorageManager()
    ) {
        self.networkService = networkService
        self.weatherStorageManager = weatherStorageManager
        
        searchSubject
            .debounce(for: .seconds(0.5), scheduler: DispatchQueue.main)
            .sink { [weak self] query in
                self?.fetchWeather(for: query)
            }
            .store(in: &cancellables)
    }
    
    func updateSearchText(_ text: String) {
        searchSubject.send(text)
    }
    
    private func fetchWeather(for city: String) {
        guard !city.isEmpty else {
            self.weather = nil
            self.errorMessage = nil
            return
        }
        
        if let cachedWeather = try? weatherStorageManager.getCachedWeatherData(), cachedWeather.location.name == city {
            self.weather = cachedWeather
            self.errorMessage = nil
            return
        }
        
        isLoading = true
        errorMessage = nil
        
        let urlString = "https://api.weatherapi.com/v1/current.json?key=\(Constants.apiKey)&q=\(city)"
        
        networkService.fetch(urlString)
            .receive(on: DispatchQueue.main)
            .sink { [weak self] completion in
                switch completion {
                case .failure(_):
                    self?.errorMessage = WeatherError.networkError.message
                case .finished:
                    break
                }
                self?.isLoading = false
            } receiveValue: { [weak self] (fetchedWeather: Weather) in
                self?.weather = fetchedWeather
                try? self?.weatherStorageManager.cacheWeatherData(fetchedWeather)
            }
            .store(in: &cancellables)
        
    }
}

