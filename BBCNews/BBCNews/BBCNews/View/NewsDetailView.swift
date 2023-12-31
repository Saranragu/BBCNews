//
//  NewsDetailView.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import SwiftUI
import UIKit
import URLImage

struct NewsDetailView: View {
    let article: Article?
    var body: some View {
        HStack {
            if let image = article?.image,
               let url = URL(string: image) {
                URLImage(url, identifier: url.absoluteString) {
                    // This view is displayed before download starts
                    EmptyView()
                } inProgress: { _ in
                    // Display progress
                    ProgressView()
                } failure: { _, _ in
                    // Display error and retry button
                    Image(systemName: "photo.fill")
                        .foregroundColor(.white)
                        .background(Color.gray)
                        .frame(width: 100, height: 100)
                        .cornerRadius(10)
                } content: { image in
                    // Downloaded image
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 300, height: 300)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                }
                .environment(\.urlImageOptions,
                              .init(fetchPolicy: .returnStoreElseLoad(downloadDelay: nil)))
            } else {
                Image(systemName: "photo.fill")
                    .foregroundColor(.white)
                    .background(Color.gray)
                    .frame(width: 100, height: 100)
                    .cornerRadius(10)
            }
        }
        VStack(alignment: .leading, spacing: 15) {
            Text(article?.title ?? "")
                .foregroundColor(.black)
                .font(.system(size: 18, weight: .semibold))
                .accessibilityIdentifier("DetailsScreenTitle")
            Text(article?.source ?? "")
                .foregroundColor(.gray)
                .font(.system(size: 12, weight: .regular))
                .accessibilityIdentifier("DetailsScreenDescription")
            Spacer()
        }.padding()
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct NewsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        NewsDetailView(article: Article.dummyData)
    }
}
