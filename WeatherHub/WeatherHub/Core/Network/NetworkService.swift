//
//  NetworkService.swift
//  WeatherHub
//
//  Created by Taooufiq El moutaoouakil on 12/13/24.
//

import Foundation
import Combine

class NetworkService: NetworkServiceProtocol {
    func fetch<T: Decodable>(_ urlString: String) -> AnyPublisher<T, Error> {
        guard let url = URL(string: urlString) else {
            return Fail(error: WeatherError.networkError).eraseToAnyPublisher()
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                (error as? URLError).map { _ in WeatherError.networkError } ?? WeatherError.invalidCity
            }
            .eraseToAnyPublisher()
    }
}
