//
//  HomeView.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI

struct HomeView: View {
    @Environment(\.openURL) var openURL
    @StateObject var viewModel: HomeViewModel
    
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    viewModel.getArticles()
                }
            case .success(let content):
                NavigationView {
                    List(content) { article in
                        ArticleView(article: article)
                            .onTapGesture {
                                load(url: article.url)
                            }
                    }
                    .navigationBarTitle("News")
                }
            }
        }
        .onAppear { viewModel.getArticles() }
    }
    
    private func load(url: String?) {
        guard let url = url,
              let linkUrl = URL(string: url) else { return }
        openURL(linkUrl)
    }
}
