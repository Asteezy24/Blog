//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/11/21.
//

import Foundation
import Plot
import Publish

extension Node where Context == HTML.BodyContext {
    static func homeBody<T: Website>(for items: [Item<T>], on site: T) -> Node {
        
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        
        let sortedItems = items.sorted {
            $0.date > $1.date
        }
        
        let homeImage: Path = "Images/apple.png"

        
        return
            .div(
                .class("row home-body-container"),
                .style("margin-left: 10%;margin-right: 10%;"),
                .div(
                    .class("column"),
                    .style("width: 70%;"),
                    .ul(
                        .class("item-list"),
                        .forEach(
                            sortedItems
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
                                        .p(.text("\(formatter.string(from: item.lastModified))"))
                                        //.p(.text(item.description))
                                    )
                                )
                        }
                    )
                    
                ),
                .div(
                    .class("column"),
                    .style("width: 30%;"),
                    .newsletter(),
                    .br(),
                    .socialsList()
                )
            )
    }
}
