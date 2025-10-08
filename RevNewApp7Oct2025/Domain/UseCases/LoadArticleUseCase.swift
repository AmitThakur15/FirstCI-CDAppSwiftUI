//
//  LoadArticleUseCase.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//
import Combine

protocol ArticleUseCase {
    func execute() -> AnyPublisher<[Article], APIError>
}

final class LoadArticleUseCase: ArticleUseCase {
    private var articleRepo: ArticleRepository
    
    init(articleRepo: ArticleRepository) {
        self.articleRepo = articleRepo
    }
    
    func execute() -> AnyPublisher<[Article], APIError> {
        articleRepo.fetchArticles()
    }
    
}
