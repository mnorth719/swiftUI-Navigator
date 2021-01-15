//
//  NavigatorApp.swift
//  Navigator
//
//  Created by Matt North on 1/5/21.
//

import SwiftUI

@main
struct NavigatorApp: App {
    @State var route: Route?
    private let deepLinkHandler = DeepLinkHandler()

    var body: some Scene {
        WindowGroup {
            NavigationView {
                RootView(route: $route)
                    .navigationTitle("Navigator!")
                    .onOpenURL(perform: { url in
                        guard
                            let linkedRoute = deepLinkHandler.handle(url)
                        else {
                            return
                        }
                        // If something is being presented, pop to root before routing.
                        if route != nil {
                            route = nil
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
                                route = linkedRoute
                            }
                        } else {
                            route = linkedRoute
                        }
                    })
            }
        }
    }
}

struct SimpleContainer {
    static let shared = SimpleContainer()
    let router = Router()
}
