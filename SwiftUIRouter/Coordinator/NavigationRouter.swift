//
//  NavigationRouter.swift
//  SwiftUIRouter
//
//  Created by Tim Mitra on 2025-01-15.
//

import SwiftUI

final class NavigationRouter: ObservableObject {
    @Published var routes = [Route]()

    func push(to screen: Route) {
        routes.append(screen)
    }

    func reset() {
        routes = []
    }

    func navigateBack() {
        _ = routes.popLast()
    }
}
