//
//  ContentView.swift
//  SwiftUIRouter
//
//  Created by Tim Mitra on 2025-01-15.
//

import SwiftUI

struct ContentView: View {
    @StateObject private var routerManager = NavigationRouter()
    @StateObject private var favouritesManager = FavouritesManager()

    
    var body: some View {
        NavigationStack(path: $routerManager.routes) {
            List {
                Section("Issues") {
                    ForEach(Issue.sortedMocks) { issue in
                        NavigationLink(
                            value: Route.issue(issue: issue)
                        ) {
                            IssueRowView(issue: issue)
                        }
                    }
                }
            }
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        routerManager.push(to: .favourites)
                    } label: {
                        Image(systemName: "heart")
                    }
                }
            }
            .navigationTitle("☕ iOS Coffee Break")
            .navigationDestination(for: Route.self) { $0 }
        }
        .environmentObject(routerManager)
        .environmentObject(favouritesManager)
    }
}

#Preview {
    ContentView()
}
