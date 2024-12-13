//
//  UserDefaultsService.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//


import Foundation

final class UserDefaultsService: StorageServiceProtocol {
    private let defaults: UserDefaults
    
    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
    }
    
    func save<T: Codable>(_ item: T, for key: String) throws {
        do {
            let data = try JSONEncoder().encode(item)
            defaults.set(data, forKey: key)
        } catch {
            throw StorageError.saveError
        }
    }
    
    func load<T: Codable>(for key: String) throws -> T {
        guard let data = defaults.data(forKey: key) else {
            throw StorageError.notFound
        }
        
        do {
            let item = try JSONDecoder().decode(T.self, from: data)
            return item
        } catch {
            throw StorageError.readError
        }
    }
    
    func delete(for key: String) throws {
        guard defaults.object(forKey: key) != nil else {
            throw StorageError.notFound
        }
        
        defaults.removeObject(forKey: key)
        
        if defaults.object(forKey: key) != nil {
            throw StorageError.deleteError
        }
    }
    
    func exists(for key: String) -> Bool {
        defaults.object(forKey: key) != nil
    }
}

final class WeatherStorageManager {
    private let storageService: StorageServiceProtocol
    
    init(storageService: StorageServiceProtocol = UserDefaultsService()) {
        self.storageService = storageService
    }
    
    func cacheWeatherData(_ weather: Weather) throws {
        try storageService.save(weather, for: StorageKeys.weatherCache)
    }
    
    func getCachedWeatherData() throws -> Weather {
        try storageService.load(for: StorageKeys.weatherCache)
    }
    
    func clearAllData() {
        try? storageService.delete(for: StorageKeys.weatherCache)
    }
}
