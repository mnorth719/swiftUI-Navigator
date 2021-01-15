//
//  ComplexView.swift
//  Navigator
//
//  Created by Matt North on 1/14/21.
//

import SwiftUI

struct ComplexView: View {
    @Binding var rootRoute: Route?
    @State var route: Route.Complex?

    var body: some View {
        ZStack {
            if let destination = destinationView, let route = route {
                NavigationLink(destination: destination, tag: route, selection: $route, label: {})
            }
            VStack {
                Text("Complex View")
                    .padding()
                Button(action: {
                    route = .view1
                }, label: {
                    Text("Go to Complex Child 1")
                })
            }
        }.onChange(of: route, perform: { value in
            guard let value = value else { return }
            route = value
        })
        .onAppear(perform: {
            $route.wrappedValue = nil
        })
    }

    var destinationView: some View {
        DynamicView<AnyView?>() {
            switch route {
            case .view1:
                return AnyView(ComplextChildView1(routeComplex: $route, route: $rootRoute))
            case .view2:
                return AnyView(ComplextChildView2())
            case .view3:
                return AnyView(ComplextChildView3())
            default:
                return nil
            }
        }
    }
}
