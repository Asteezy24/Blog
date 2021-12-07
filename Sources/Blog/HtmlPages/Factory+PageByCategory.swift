//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/26/21.
//

import Foundation
import Plot
import Publish

extension MyHTMLFactory {
    func makePageByCategory<T: Website>(title: String, latestPost: Item<T>, for section: Section<Site>, context: PublishingContext<T>) throws -> HTML {
        HTML(
            .head(for: context.index, on: context.site),
            .body(
                .topBanner(),
                .latestPost(for: latestPost, on: context.site),
                .navigationBar(for: context),
                .postsBy(section: section.id, items: section.items, on: context.site as! Blog),
                .myFooter(for: context.site)
            )
        )
    }
}
