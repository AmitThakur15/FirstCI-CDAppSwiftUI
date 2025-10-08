//
//  HomeViewModel.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI
import Combine

final class HomeViewModel: ObservableObject {
    
    @Published private(set) var state: ResultState = .loading

    private let fetchTopHeadlinesUseCase: LoadArticleUseCase
    private var cancellables = Set<AnyCancellable>()

    init(fetchTopHeadlinesUseCase: LoadArticleUseCase) {
        self.fetchTopHeadlinesUseCase = fetchTopHeadlinesUseCase
    }

    func getArticles() {
        state = .loading

        fetchTopHeadlinesUseCase.execute()
            .sink { completion in
                switch completion {
                case .failure(let error):
                    self.state = .failed(error: error)
                case .finished:
                    break
                }
            } receiveValue: { articles in
                self.state = .success(content: articles)
            }
            .store(in: &cancellables)
    }
}
