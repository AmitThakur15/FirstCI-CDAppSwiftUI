//
//  ResultState.swift
//  RevNewApp7Oct2025
//
//  Created by Shristi on 07/10/25.
//

import Foundation
enum ResultState {
    case loading
    case failed(error: Error)
    case success(content: [Article])
}
