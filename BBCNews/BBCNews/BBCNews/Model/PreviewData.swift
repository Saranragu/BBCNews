//
//  PreviewModel.swift
//  BBCNews
//
//  Created by Saravanan R on 02/11/23.
//

import Foundation
extension Article {
    static var dummyData: Article {
        .init(
            author: "Adam Edelman, Monica Alba, Frank Thorp V, Alex Moe",
    url: "https://www.nbcnews.com/politics/donald-trump/trump-impeachment-trial-day-2-kicks-case-against-him-n1257246",
            source: "NBC News",
            title: "Never-seen-before security video of Capitol riot to open Trump impeachment trial Day 2 - NBC News",
        welcomeDescription: "Dems to open Day 2 trial arguments against Trump with 'never-seen-before\" riot footage",
            image: "https://picsum.photos/id/237/200/300",
            date: Date())
    }
}
