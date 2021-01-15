//
//  UIHostingProvider.swift
//  Navigator
//
//  Created by Matt North on 1/15/21.
//

import SwiftUI
import UIKit

struct UIHostingProvider {
    func controller(for route: Route) -> UIViewController {
        switch route {
        case .view1:
            return UIHostingController(rootView: ChildView1())
        case .view2:
            return UIHostingController(rootView: ChildView2())
        case .view3:
            return UIHostingController(rootView: ChildView3())
        }
    }
}
