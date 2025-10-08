//
//  Article.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI
struct Article: Identifiable {
    let id = UUID()
    let sourceName: String
    let author: String
    let title: String
    let description: String
    let url: String
    let imageUrl: String?
//    let publishedAt: String
//    let content: String
}
