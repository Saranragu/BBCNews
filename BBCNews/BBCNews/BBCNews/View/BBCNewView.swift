//
//  HomeView.swift
//  iOSTaskApp
//
//  Created by Saravanan R on 03/11/2023.
//

import SwiftUI

struct BBCNewView: View {

   @StateObject var viewModel =
    NewsViewModelCall(service: (CommandLine.arguments.contains("IsUITestRunning")
                                ? UITestMockService() : NewsServiceCall()))
    var body: some View {
        Group {
            switch viewModel.state {
            case .loading:
                ProgressView()
            case .failed(let error):
                ErrorView(error: error) {
                    self.viewModel.getArticles()
                }
            case .success(let content):
                NavigationView {
                    List(content) { article in
                        NavigationLink {
                            NewsDetailView(article: article)
                        } label: {
                            BBCNewsRow(article: article)
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationBarTitle("News")
                }
            }
        }.onAppear(perform: viewModel.getArticles)
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        BBCNewView()
    }
}
