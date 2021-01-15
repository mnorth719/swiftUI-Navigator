//
//  DeepLinkHandler.swift
//  Navigator
//
//  Created by Matt North on 1/14/21.
//

import Foundation

struct DeepLinkHandler {
    enum Constants {
        static let appURLScheme = "navi"
        static let dest = "dest"
    }

    func handle(_ url: URL) -> Route? {
        guard isNaviURL(url) else { return nil }
        return extractDestination(from: url)
    }

    func isNaviURL(_ url: URL) -> Bool {
        guard let scheme = url.scheme else { return false }
        return scheme == Constants.appURLScheme
    }

    private func extractDestination(from url: URL) -> Route? {
        let destination = url.queryItems.first { $0.name == Constants.dest }
        guard let unwrappedQueryItem = destination?.value else { return nil }
        return Route(rawValue: unwrappedQueryItem)
    }
}

extension URL {
    var queryItems: [URLQueryItem] {
        let components = URLComponents(url: self, resolvingAgainstBaseURL: true)
        return components?.queryItems ?? []
    }
}
