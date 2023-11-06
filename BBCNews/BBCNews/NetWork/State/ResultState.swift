//
//  ResultState.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import Foundation
enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
