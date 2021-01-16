//
//  Router.swift
//  Navigator
//
//  Created by Matt North on 1/13/21.
//

import UIKit

enum Route: String {
    case view1
    case view2
    case view3
}

enum PresentationStyle {
    case push
    case modal
}

class Router {
    private let root: UINavigationController
    private(set) var currentRoute: Route?
    private let provider = UIHostingProvider()

    init(root: UINavigationController) {
        self.root = root
    }

    func route(to route: Route, presentationStyle: PresentationStyle) {
        guard route != currentRoute else { return }
        let controller = provider.controller(for: route)
        present(controller: controller, style: presentationStyle)
    }

    func goToRoot() {
        if root.presentedViewController != nil {
            root.presentedViewController?.dismiss(animated: true, completion: {
                self.root.popToRootViewController(animated: true)
            })
        } else {
            root.popToRootViewController(animated: true)
        }
    }

    private func present(controller: UIViewController, style: PresentationStyle) {
        switch style {
        case .modal:
            root.present(controller, animated: true, completion: nil)
        case .push:
            if root.presentedViewController != nil {
                root.presentedViewController?.dismiss(animated: true, completion: {
                    self.root.pushViewController(controller, animated: true)
                })
            } else {
                root.pushViewController(controller, animated: true)
            }
        }
    }
}
