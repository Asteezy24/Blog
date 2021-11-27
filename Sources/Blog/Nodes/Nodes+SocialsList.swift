//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/23/21.
//

import Foundation
import Plot
import Publish

enum Socials: String, CaseIterable {
    case twitter = "Twitter"
    case instagram = "Instagram"
    case linkedin = "LinkedIn"
}

extension Node where Context == HTML.BodyContext {
    static func socialsList() -> Node {
        return
            .div(
                .class("socials-div"),
                .h3("Follow me"),
                .ul(
                    .class("socials-list"),
                    .forEach(Socials.allCases, { socialMedia in
                    .li (.h5("\(socialMedia.rawValue)"))
                    })
                )
            )
    }
}

