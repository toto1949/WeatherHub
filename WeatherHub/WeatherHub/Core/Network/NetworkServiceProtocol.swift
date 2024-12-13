//
//  NetworkServiceProtocol.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation
import Combine

protocol NetworkServiceProtocol {
    func fetch<T: Decodable>(_ urlString: String) -> AnyPublisher<T, Error>
}



