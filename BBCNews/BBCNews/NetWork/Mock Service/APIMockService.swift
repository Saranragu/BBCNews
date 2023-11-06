//
//  MockAPIClient.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//
import Foundation
import Combine

class APIMockService: NewsService {
   private var success = false
   private var error: APIError?
   func request(from endpoint: NewsAPI) -> AnyPublisher<NewsModel, APIError>? {
       if success {
           return Just(NewsModel(articles: [Article(author: "author",
                                                    url: "url",
                                                    source: "source",
                                                    title: "title",
                                                    welcomeDescription: "welcomeDescription",
                                                    image: "image",
                                                    date: Date())]))
           .setFailureType(to: APIError.self).eraseToAnyPublisher()

       }
       if let error = error {
           return Fail(error: error).eraseToAnyPublisher()
       }
       return nil
   }
   func mockSuccess() {
       success = true
   }
   func mockFailure(_ error: APIError) {
       self.error = error
   }
}
