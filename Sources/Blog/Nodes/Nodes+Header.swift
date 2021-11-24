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
    
    static func myHeader<T: Website>(for context: PublishingContext<T>) -> Node {
        // Create a list of navigation items
        
        return .header(
            // Begin the wrapper class
//            .wrapper(
//                // Create your main title,
//                .h3("Alex's Swift Blog")
//                // Creates another container for link to John Sundell's publish repo
////                // Create the nav node
//
//            ),
            .nav(
                // Create and undordered list and loop through your navItems yuou created above
                .ul(
                    .forEach(
                        Blog.SectionID.allCases
                    ) { item in
                        .li(
                            // Create an anchor tag to make linkes
                            .a(
                                // Redirect the user to a new webpage on your site when they click each item
                                .href("/\(item.rawValue.camelized)"),
                                .text(Self.getTitle(item: item))
                            )
                        )
                    }
                )
            )
        )
    }
    
    static func getTitle(item: Blog.SectionID) -> String {
        if item == .home {
            return "Home"
        }
        if item == .dataStructures {
            return "Data Structures"
        }
        
        return item.rawValue
    }
}
