//
//  ArticleAPI.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import Foundation
enum ArticleAPI: APIBuilder {
    case getTopHeadlines(country: String, category: String, apiKey: String)
    
    var path: String {
        switch self {
        case .getTopHeadlines:
            return "/v2/top-headlines"
        }
    }
    
    var method: String {
        "GET"
    }
    
    var request: URLRequest {
        switch self {
        case .getTopHeadlines(let country, let category,  let apiKey):
            var components = URLComponents(
                url: baseURL.appendingPathComponent(path),
                resolvingAgainstBaseURL: false
            )!
            components.queryItems = [
                URLQueryItem(name: "country", value: country),
                URLQueryItem(name: "category", value: category),
                URLQueryItem(name: "apiKey", value: apiKey)
            ]
            var request = URLRequest(url: components.url!)
            request.httpMethod = method
            return request
        }
    }
    
    
}
