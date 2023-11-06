//
//  NewsViewModel.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import Foundation
import Combine

protocol NewsViewModel {
    func getArticles()
}

class NewsViewModelCall: ObservableObject, NewsViewModel {
    private let service: NewsService
    private(set) var articles = [Article]()
    private var cancellables = Set<AnyCancellable>()
    @Published private(set) var state: ResultState = .loading
    init(service: NewsService) {
        self.service = service
    }
    func getArticles() {
        self.state = .loading
        if let value = service.request(from: .getNews) {
            let cancellable = value
                .sink { res in
                    switch res {
                    case .finished:
                        self.state = .success(content: self.articles)
                            // get the articles
                    case .failure(let error):
                        self.state = .failed(error: error)
                            // get the error
                    }
                } receiveValue: { response in
                    self.articles = response.articles
                }
            self.cancellables.insert(cancellable)
        }
    }
}
