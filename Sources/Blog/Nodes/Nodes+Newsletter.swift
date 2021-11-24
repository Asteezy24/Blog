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
                // Create your main title,
                .h3("Newsletter"),
                    .input()
                // Creates another container for link to John Sundell's publish repo
                //                // Create the nav node
                
            )
    }
}

