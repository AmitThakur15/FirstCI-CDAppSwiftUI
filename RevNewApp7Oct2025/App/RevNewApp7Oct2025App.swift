//
//  RevNewApp7Oct2025App.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI

@main
struct RevNewApp7Oct2025App: App {
    var body: some Scene {
        WindowGroup {
            let container = AppContainer.shared
            HomeView(viewModel: container.makeArticleViewModel())
        }
    }
}
