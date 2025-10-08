//
//  APIBuilder.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import Foundation

protocol APIBuilder {
    var baseURL: URL { get }
    var path: String { get }
    var method: String { get }
    var headers: [String: String]? { get }
    var request: URLRequest { get }
}

extension APIBuilder {
    var baseURL : URL {
        URL(string: "https://newsapi.org")!
    }
    
    var headers: [String: String]? {
        ["Content-Type": "application/json"]
    }
    
    var request: URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var request = URLRequest(url: url)
        request.httpMethod = method
        request.allHTTPHeaderFields = headers
        return request
    }
}
