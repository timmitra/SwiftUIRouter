//
//  ArticleView.swift
//  SwiftUIRouter
//
//  Created by Tim Mitra on 2025-01-15.
//

import SwiftUI

struct ArticlesView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    let articles: [Article]

    var body: some View {
        List {
            ForEach(articles) { article in
                Text(article.title)
            }

            Section {
                Button {
                    routerManager.reset()
                } label: {
                    Text("Go back to Issues")
                }
            }
        }
        .navigationTitle("Articles")
    }
}

#Preview {
    NavigationStack {
        ArticlesView(
            articles: Article.articlesFromIssue20
        )
        .environmentObject(NavigationRouter())
    }
}

#Preview {
    NavigationStack {
        ArticlesView(
            articles: Article.articlesFromIssue20
        )
        .environmentObject(NavigationRouter())
    }
}
