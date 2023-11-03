//
//  File.swift
//  BBCNews
//
//  Created by Saravanan R on 02/11/23.
//

import Foundation
import Combine

protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError>?
}
