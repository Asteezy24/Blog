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
        return
            .div(
                .class("nav-bar"),
                .forEach(
                    Blog.SectionID.allCases
                ) { item in
                        .a(
                            .href("/\(item.rawValue.camelized)"),
                            .text(String.convertSectionToProperFormat(from: item))
                        )
                }
            )
    }
}
