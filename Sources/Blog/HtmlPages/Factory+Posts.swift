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
    func makePostsHTML(for section: Section<Site>, context: PublishingContext<Site>) throws -> HTML {
        HTML(
            .head(for: context.index, on: context.site),
            .body(
                .myHeader(for: context),
                .postContent(for: section.items, on: context.site),
                .postsBy(author: "Albus Dumbledore", section: section, on: context.site),
                .myFooter(for: context.site)
            )
        )
    }
}
