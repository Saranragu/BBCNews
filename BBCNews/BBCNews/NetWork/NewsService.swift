//
//  File.swift
//  BBCNews
//
//  Created by Sukumar on 03/11/2023.
//

import Foundation
import Combine
protocol NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError>?
}
