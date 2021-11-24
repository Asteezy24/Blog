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
    static func topBanner() -> Node {
        return
            .wrapper(
                // Create your main title,
                .h3("Alex's Swift Blog")
                // Creates another container for link to John Sundell's publish repo
                //                // Create the nav node
                
            )
    }
}
