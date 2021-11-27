//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/23/21.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func newsletter() -> Node {
        return
            .div(
                .class("newsletter-div"),
                // Create your main title,
                .h3("Newsletter"),
                .div(
                    .class("newsletter-input"),
                    .input(.type(.text))
                )
            )
    }
}

