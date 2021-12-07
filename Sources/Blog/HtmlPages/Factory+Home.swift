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
    func makeHomeHTML<T: Website>(latestItem: Item<T>, for index: Index, section: Section<T>, context: PublishingContext<T>) throws -> HTML {
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .topBanner(),
                    .latestPost(for: latestItem, on: context.site),
                    .navigationBar(for: context),
                    .homeBody(for: section.items, on: context.site),
                    .myFooter(for: context.site)
                )
        )
    }
}
