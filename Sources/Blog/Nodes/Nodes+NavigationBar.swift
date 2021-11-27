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
    
    static func navigationBar<T: Website>(for context: PublishingContext<T>) -> Node {
       
        return //.header(
            .div(
                .class("nav-bar"),
                //.a(
                    .forEach(
                        Blog.SectionID.allCases
                    ) { item in
                            //.li(
                                .a(
                                    .href("/\(item.rawValue.camelized)"),
                                    .text(Self.getTitle(item: item))
                                )
                            //)
                    }
                //)
            //)
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
