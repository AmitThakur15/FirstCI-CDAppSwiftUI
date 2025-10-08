//
//  APIEndpoint.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import Foundation
import Combine

final class APIServiceImpl: APIService {
    func request(from endpoint: ArticleAPI) -> AnyPublisher<ArticleResponseDTO, APIError> {
        let jsonDecoder = JSONDecoder()
        jsonDecoder.dateDecodingStrategy = .iso8601

        return URLSession.shared
            .dataTaskPublisher(for: endpoint.request)
            .mapError { error in APIError.unknown(underlying: error) }
            .flatMap { data, response -> AnyPublisher<ArticleResponseDTO, APIError> in
                guard let http = response as? HTTPURLResponse else {
                    return Fail(error: APIError.unknown(underlying: URLError(.badServerResponse))).eraseToAnyPublisher()
                }

                if (200...299).contains(http.statusCode) {
                    return Just(data)
                        .decode(type: ArticleResponseDTO.self, decoder: jsonDecoder)
                        .mapError { _ in APIError.decodingError }
                        .eraseToAnyPublisher()
                } else {
                    return Fail(error: APIError.httpStatusCode(code: http.statusCode)).eraseToAnyPublisher()
                }
            }
            // deliver on main queue (ViewModels often expect main thread)
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
    
}
