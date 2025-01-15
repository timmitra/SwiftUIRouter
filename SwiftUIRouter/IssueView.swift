//
//  IssueView.swift
//  SwiftUIRouter
//
//  Created by Tim Mitra on 2025-01-15.
//

import SwiftUI

struct IssueView: View {
    @EnvironmentObject private var routerManager: NavigationRouter
    @EnvironmentObject private var favouritesManager: FavouritesManager

    let issue: Issue

    var body: some View {
        List {
            Section {
                LabeledContent("Number", value: "\(issue.number)")
                LabeledContent("Date", value: issue.date.formatted(date: .numeric, time: .omitted))
            }

            Section("Description") {
                Text(issue.description)
            }

            if !issue.articles.isEmpty {
                Section("Articles") {
                    NavigationLink(
                        value: Route.articles(articles: issue.articles)
                    ) {
                        Text("\(issue.articles.count) Articles")
                    }
                }
            }

            Link(
                destination: URL(string: issue.url)!
            ) {
                Text("Check issue")
            }

            if favouritesManager.contains(issue) {
                Section {
                    Button {
                        favouritesManager.remove(id: issue.id)
                    } label: {
                        Label("Remove From Favourites", systemImage: "heart.slash.fill")
                            .symbolVariant(.fill)
                    }
                }

            } else {
                Section {
                    Button {
                        favouritesManager.add(issue)
                    } label: {
                        Label("Add to Favourites", systemImage: "heart")
                            .symbolVariant(.fill)
                    }
                }
            }
        }
        .navigationTitle(issue.title)
    }
}

#Preview {
    NavigationStack {
        IssueView(issue: Issue.mocks.last!)
            .environmentObject(NavigationRouter())
            .environmentObject(FavouritesManager())
    }
}
