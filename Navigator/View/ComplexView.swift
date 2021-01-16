//
//  ComplexView.swift
//  Navigator
//
//  Created by Matt North on 1/14/21.
//

import SwiftUI

struct ComplexView: View {
    private var router: Router {
        SimpleDIContainer.shared.router
    }
    @State var isPresenting = false

    var body: some View {
        ZStack {
            VStack {
                Text("Complex View")
                    .padding()
                Button(action: {
                    router.route(to: .view2, presentationStyle: .push)
                }, label: {
                    Text("Go to  Child 2")
                })
                Button(action: {
                    router.goToRoot()
                }, label: {
                    Text("Go to Root")
                })
                NavigationLink(destination: ChildView2()) {
                    Text("Go to  Child 2 via Nav link")
                }                
            }
        }
    }
}
