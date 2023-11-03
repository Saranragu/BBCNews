//
//  APIError.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 02/11/23.
//

import Foundation

enum APIError: Error {
    case decodingError
    case errorCode(Int)
    case unknown
}
