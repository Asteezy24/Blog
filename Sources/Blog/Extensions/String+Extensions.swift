//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/23/21.
//

import Foundation

fileprivate let badChars = CharacterSet.alphanumerics.inverted

extension String {
    var uppercasingFirst: String {
        return prefix(1).uppercased() + dropFirst()
    }

    var lowercasingFirst: String {
        return prefix(1).lowercased() + dropFirst()
    }

    var camelized: String {
        guard !isEmpty else {
            return ""
        }

        let parts = self.components(separatedBy: badChars)

        let first = String(describing: parts.first!).lowercasingFirst
        let rest = parts.dropFirst().map({String($0).uppercasingFirst})

        return ([first] + rest).joined(separator: "")
    }
    
    
    static func convertSectionToProperFormat(from item: Blog.SectionID) -> Self {
        switch item {
        case .home :
            return "Home"
        case .combine:
            return "Combine"
        case .algorithms:
            return "Algorithms"
        case .dataStructures:
            return "Data Structures"
        case .swiftUI:
            return "SwiftUI"
        case .about:
            return "About"
        }
    }
}
