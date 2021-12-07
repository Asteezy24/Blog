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
                .h3("The Swift Refresher")
            )
    }
}

