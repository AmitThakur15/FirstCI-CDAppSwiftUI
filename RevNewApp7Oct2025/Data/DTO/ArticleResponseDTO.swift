//
//  ArticleResponseDTO.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import SwiftUI
struct ArticleResponseDTO: Codable {
    let status: String
    let totalResults: Int
    let articles: [ArticleDTO]
}

struct ArticleDTO: Codable {
    let source: SourceDTO?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
//    let publishedAt: String
//    let content: String
}

struct SourceDTO: Codable {
    let id: String?
    let name: String?
}


extension ArticleDTO {
    func toDomain() -> Article {
        return Article(
            sourceName: source?.name ?? "Unknown",
            author: author ?? "N/A",
            title: title ?? "No Title",
            description: description ?? "",
            url: url ?? "",
            imageUrl: urlToImage ?? ""
//            publishedAt: publishedAt,
//            content: content
        )
    }
}

extension ArticleResponseDTO {
    func toDomain() -> [Article] {
        return articles.map { $0.toDomain() }
    }
}








/*
 
 {
   "status": "ok",
   "totalResults": 66,
   "articles": [
     {
       "source": {
         "id": "associated-press",
         "name": "Associated Press"
       },
       "author": "Stan Choe",
       "title": "DC’s shutdown hasn’t stopped the stock market. Here’s what may - AP News",
       "description": "The U.S. stock market continues to rise despite the government's latest shutdown. The S&P 500 and Dow Jones Industrial Average hit all-time highs on Friday. It's not just big tech driving the market; the Russell 2000 index of smaller stocks and gold also reac…",
       "url": "https://apnews.com/article/stock-market-rates-records-shutdown-earnings-ai-251fefd075ac658ce498c9d1953efc70",
       "urlToImage": "https://dims.apnews.com/dims4/default/3a71e0e/2147483647/strip/true/crop/7680x4320+0+400/resize/1440x810!/quality/90/?url=https%3A%2F%2Fassets.apnews.com%2F09%2F6e%2F82d51664765ae2b03c6bcc20df68%2F4edc6f608d604541806293ef6b76cd0f",
       "publishedAt": "2025-10-04T22:47:00Z",
       "content": "NEW YORK (AP) If the U.S. governments latest shutdown cant stop the stock market, what can? \r\nStock prices keep rising, even as the shutdown delays important economic reports that usually steer tradi… [+5350 chars]"
     }
 ]
 }
 */
