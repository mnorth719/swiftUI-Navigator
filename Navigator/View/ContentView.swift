//
//  ContentView.swift
//  Navigator
//
//  Created by Matt North on 1/5/21.
//

import SwiftUI

struct RootView: View {
    // obtained from main route defined in App class
    @Binding var route: Route?

    var body: some View {
        VStack {
            if let destination = destinationView, let route = route {
                NavigationLink(destination: destination, tag: route, selection: $route, label: {})
            }
            Text("RootView")
                .padding()
            Button(action: {
                route = .view1
            }, label: {
                Text("Go to Child 1")
            })
        }
        .onAppear(perform: {
            $route.wrappedValue = nil
        })
        // reset route once we have appeared
    }

    var destinationView: some View {
        DynamicView<AnyView?>() {
            switch route {
            case .view1:
                return AnyView(ChildView1(route: $route))
            case .view2:
                return AnyView(ChildView2())
            case .view3:
                return AnyView(ChildView3())
            default:
                return nil
            }
        }
    }
}

struct DynamicView<Content>: View where Content : View {
    let contentProvider: () -> Content

    var body: some View {
        contentProvider()
    }
}
