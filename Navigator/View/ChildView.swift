//
//  ChildView.swift
//  Navigator
//
//  Created by Matt North on 1/5/21.
//

import SwiftUI

struct ChildView1: View {
    private var router: Router {
        SimpleDIContainer.shared.router
    }
    @State var presentingChild2 = false

    var body: some View {
        VStack {
            Text("Child 1")
                .padding()
            NavigationLink("Complex", destination: ComplexView(), isActive: $presentingChild2)
                .padding()
            Button("root") {
                router.goToRoot()
            }
        }
    }
}

struct ChildView2: View {
    private var router: Router {
        SimpleDIContainer.shared.router
    }
    var body: some View {
        Text("View 2")
            .padding()
        Button("Modal child 3") {
            router.route(to: .view3, presentationStyle: .modal)
        }
        Button("root") {
            router.goToRoot()
        }
    }
}

struct ChildView3: View {
    var body: some View {
        Text("View 3")
            .padding()
    }
}
