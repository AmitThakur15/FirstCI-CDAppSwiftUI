//
//  APIError.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//
import Foundation

enum APIError: Error {
    case decodingError
    case httpStatusCode(code: Int)
    case networkError(underlying: Error)
    case unknown(underlying: Error)
}

extension APIError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .decodingError:
            return "Some thing happen while decoding"
        case .httpStatusCode(let code):
            return "\(code) something went wrong"
        case .networkError(let underlyingError):
            return "Some network erro \(underlyingError.localizedDescription)"
        case .unknown(let underlyingError):
            return "Some unknown error happened \(underlyingError.localizedDescription)"
        }
    }
}
