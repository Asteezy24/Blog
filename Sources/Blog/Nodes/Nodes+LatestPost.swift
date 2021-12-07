//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/23/21.
//

import Foundation
import Publish
import Plot


extension Node where Context == HTML.BodyContext {
    static func latestPost<T: Website>(for item: Item<T>, on site: T) -> Node {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        let homeImage: Path = "Images/apple.png"
        
        return
            .div(
                .class("latest-post"),
                .h3("Latest post"),
                .br(),
                .div (
                    .style("display: inline-block;"),
                    .div(
                        .class("column latest-post-image"),
                        .img(.class("post-image"), .src(homeImage))
                    ),
                    .div(
                        .class("column latest-post-text"),
                        .article(
                            .tagList(for: item.tags, on: site),
                            .h2(
                                .a(
                                    .href(item.path),
                                    .text(item.title)
                                )
                            ),
                            .p(.text(item.description)),
                            .div (
                                .p(.text("\(formatter.string(from: item.lastModified))"))
                            )
                        )
                    )
                )
            )
    }
}
