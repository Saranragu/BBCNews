//
//  ResultState.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 02/11/23.
//

import Foundation

enum ResultState {
    case loading
    case success(content: [Article])
    case failed(error: Error)
}
