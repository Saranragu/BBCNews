//
//  APIError.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}
