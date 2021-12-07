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
                    .h1("Posts About \(String.convertSectionToProperFormat(from: section))"),
                    .div(
                        .ul(
                            .class("item-list"),
                            .forEach(
                                items
                            ) { item in
                                    .li (
                                        .img(.class("category-image"), .src(homeImage)),
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
}
