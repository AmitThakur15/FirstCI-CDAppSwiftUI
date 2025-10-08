//
//  ArticleRepository.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//
import Combine
protocol ArticleRepository {
    func fetchArticles() -> AnyPublisher<[Article], APIError>
}
