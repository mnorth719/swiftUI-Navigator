//
//  ChildView.swift
//  Navigator
//
//  Created by Matt North on 1/5/21.
//

import SwiftUI

struct ChildView1: View {
    @Binding var route: Route?
    @State var presentingChild2 = false

    var body: some View {
        VStack {
            Text("Child 1")
                .padding()
            NavigationLink("Complex", destination: ComplexView(rootRoute: $route), isActive: $presentingChild2)
                .padding()
            Button("root") {
                $route.wrappedValue = nil
            }
        }
    }
}

struct ChildView2: View {
    var body: some View {
        Text("View 2")
            .padding()
    }
}

struct ChildView3: View {
    var body: some View {
        Text("View 3")
            .padding()
    }
}
