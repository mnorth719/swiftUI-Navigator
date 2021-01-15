//
//  ComplexChildView.swift
//  Navigator
//
//  Created by Matt North on 1/14/21.
//

import SwiftUI

struct ComplextChildView1: View {
    @Binding var routeComplex: Route.Complex?
    @Binding var route: Route?

    var body: some View {
        VStack {
            Text("Complex Child 1")
                .padding()
            Button("root") {
                $route.wrappedValue = nil
            }
                .padding()
            Button("Complex root") {
                $routeComplex.wrappedValue = nil
            }                
        }.onAppear(perform: {
            print("Child1 appeared")
        })
    }
}

struct ComplextChildView2: View {
    var body: some View {
        Text("View 2")
            .padding()
    }
}

struct ComplextChildView3: View {
    var body: some View {
        Text("View 3")
            .padding()
    }
}
