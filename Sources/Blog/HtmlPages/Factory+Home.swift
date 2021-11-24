//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/11/21.
//

import Foundation
import Publish
import Plot

extension MyHTMLFactory {
    func makeHomeHTML<T: Website>(for index: Index, section: Section<T>, context: PublishingContext<T>) throws -> HTML {        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .topBanner(),
                    .latestPost(for: section.items, on: context.site),
                    .myHeader(for: context),
                    //.homeBody(for: section.items, on: context.site),
                    //.postsBy(author: "Albus Dumbledore", section: section, on: context.site),
                    .myFooter(for: context.site)
                )
        )
    }
}
