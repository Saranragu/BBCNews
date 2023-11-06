//
//  UITestMockService.swift
//  BBCNews
//
//  Created by Saravanan R on 03/11/2023.
//

import Foundation
import Combine

class UITestMockService: NewsService {
    func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError>? {
        return Just(NewsModel(articles: [Article(
            author: "Elahe Izadi, Jeremy Barr",
            url: "https://www.washingtonpost.com/style/media/2023/11/04/william-lewis-publisher-ceo-washington-post/",
            source: "The Washington Post",
            title: "William Lewis named publisher and CEO of The Washington Post - The Washington Post",
        welcomeDescription: "William Lewis, previously publisher of the Wall Street Journal, was tapped by Washington.",
    image: "https://picsum.photos/id/237/200/300",
            date: Date())])).setFailureType(to: APIError.self).eraseToAnyPublisher()
    }
}
