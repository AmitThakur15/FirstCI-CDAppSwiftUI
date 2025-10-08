//
//  ArticleRepoImpl.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI
import Combine
final class ArticleRepoImpl: ArticleRepository {
    
    
    private let service: APIService
    
    init(service: APIService) {
        self.service = service
    }
    
    func fetchArticles() -> AnyPublisher<[Article], APIError> {
        service.request(from:ArticleAPI.getTopHeadlines(
            country: "us",
            category: "business",
            apiKey: APIConstants.apiKey)
        )
        .map { dto in
            dto.toDomain() // map DTO -> [Domain Article]
        }
        .eraseToAnyPublisher()
    }
    
    
}
