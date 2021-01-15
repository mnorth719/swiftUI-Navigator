//
//  ContentView.swift
//  Navigator
//
//  Created by Matt North on 1/5/21.
//

import SwiftUI

struct RootView: View {
    private var router: Router {
        SimpleDIContainer.shared.router
    }

    var body: some View {
        VStack {
            Text("RootView")
                .padding()
            Button(action: {
                router.route(to: .view1, presentationStyle: .push)
            }, label: {
                Text("Go to Child 1")
            })
        }

    }
}
