//
//  NewsModel.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import Foundation

// MARK: - NewsModel
struct NewsModel: Codable {
    let articles: [Article]
}

// MARK: - Article
struct Article: Codable, Identifiable, Equatable {

    let id: UUID = UUID()
    var author: String?
    var url: String?
    var source: String?
    var title: String?
    var welcomeDescription: String?
    var image: String?
    var date: Date?

    init(
        author: String?,
        url: String?,
        source: String?,
        title: String?,
        welcomeDescription: String?,
        image: String?,
        date: Date?) {
        self.author = author
        self.url = url
        self.source = source
        self.title = title
        self.welcomeDescription = welcomeDescription
        self.image = image
        self.date = date
    }
    enum CodingKeys: String, CodingKey {
        case author, url, source, title, image, date
        case welcomeDescription = "description"
    }
}
