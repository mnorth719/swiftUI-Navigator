//
//  Router.swift
//  Navigator
//
//  Created by Matt North on 1/13/21.
//

import Combine

typealias AnyDismissable = AnyHashable

enum Route: String, Hashable {
    enum Complex: String, Hashable {
        case view1
        case view2
        case view3
    }
    case view1
    case view2
    case view3
}

class Router: ObservableObject {
    @Published var currentRoute: Route? = nil
}
