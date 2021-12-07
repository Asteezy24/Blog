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
    
    static func postsBy<T: Website>(section: Blog.SectionID, items: [Item<T>], on site: T) -> Node {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        let homeImage: Path = "Images/apple.png"

        
        return
            .wrapper(
                .div(
                    .h1("Posts About \(Self.getPageTitle(item: section))"),
                    .div(
                        .ul(
                            .class("item-list"),
                            .forEach(
                                items
                            ) { item in
                                    .li (
                                        .img(.src(homeImage)),
                                        .br(),
                                        .tagList(for: item.tags, on: site),
                                        .br(),
                                        .article(
                                            .h1(
                                                .a(
                                                    .href(item.path),
                                                    .text(item.title)
                                                )
                                            ),
                                            .p(.text(item.description)),
                                            .p(.text("\(formatter.string(from: item.lastModified))"))
                                        )
                                    )
                            }
                        )
                        
                    )
                )
        )
    }
    
    static func getPageTitle(item: Blog.SectionID) -> String {
        if item == .home {
            return "Home"
        }
        if item == .combine {
            return "Combine"
        }
        if item == .dataStructures {
            return "Data Structures"
        }
        
        return item.rawValue
    }
    
}
