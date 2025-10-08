//
//  AppContainer.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import Foundation

final class AppContainer {
    static let shared = AppContainer()

    private init() {}

    func makeArticleViewModel() -> HomeViewModel {
        let service = APIServiceImpl()
        let repo = ArticleRepoImpl(service: service)
        let useCase = LoadArticleUseCase(articleRepo: repo)
        return HomeViewModel(fetchTopHeadlinesUseCase: useCase)
    }
}
