//
//  StorageService.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation
enum StorageError: Error {
    case saveError
    case readError
    case deleteError
    case notFound
}

protocol StorageServiceProtocol {
    func save<T: Codable>(_ item: T, for key: String) throws
    func load<T: Codable>(for key: String) throws -> T
    func delete(for key: String) throws
    func exists(for key: String) -> Bool
}
