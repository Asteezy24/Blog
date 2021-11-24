//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/11/21.
//

import Foundation
import Publish
import Plot

extension Node where Context == HTML.BodyContext {
    
    static func postsBy(author: String, section: Section<Blog>, on site: Blog) -> Node {
        
        let items = section.items.filter {
            $0.metadata.author == author
        }
        
        return
            .wrapper(
                .div(
                    .h1("Posts by \(author)"),
                    .homeBody(for: items, on: site)
                )
        )
    }
    
}
