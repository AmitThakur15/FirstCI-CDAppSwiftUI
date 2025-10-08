//
//  NewsAPIService.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//
import Combine
protocol APIService {
    func request(from endpoint: ArticleAPI) -> AnyPublisher<ArticleResponseDTO, APIError>
}
