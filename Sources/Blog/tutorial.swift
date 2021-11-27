//
//  File.swift
//  
//
//  Created by Alex Stevens on 11/11/21.
//

import Foundation
import Publish
import Plot

struct MyHTMLFactory: HTMLFactory {
    func makeIndexHTML(for index: Index, context: PublishingContext<Blog>) throws -> HTML {
        let sections = context.sections
        let section = sections.first(where: { $0.id == .home})!
        return try makeHomeHTML(for: index, section: section, context: context)
    }
    
    func makeSectionHTML(for section: Section<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        switch section.id {
        case .home:
            return try makeHomeHTML(for: context.index, section: section, context: context)
        case .combine:
            return try makePostsHTML(for: section, context: context)
            //        case "posts":
            //            return try makePostsHTML(for: section, context: context)
            //        case "home":
            //            return try makeHomeHTML(for: context.index, section: section, context: context)
            //        case "about":
            //            return HTML(.text("Hello about!"))
        default:
            return HTML(
                .head(for: context.index, on: context.site),
                .body(
                    .navigationBar(for: context),
                    .myFooter(for: context.site)
                )
            )
        }
    }
    
    func makeItemHTML(for item: Item<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        HTML(
            .head(for: item, on: context.site),
            .body(
                .navigationBar(for: context),
                .wrapper(
                    .article(
                        .contentBody(item.body)
                    )
                ),
                .myFooter(for: context.site)
            )
        )
    }
    
    func makePageHTML(for page: Page, context: PublishingContext<Blog>) throws -> HTML {
        HTML(.text("Hello, page"))
    }
    
    func makeTagListHTML(for page: TagListPage, context: PublishingContext<Blog>) throws -> HTML? {
        HTML(.text("Hello, tag list"))
    }
    
    func makeTagDetailsHTML(for page: TagDetailsPage, context: PublishingContext<Blog>) throws -> HTML? {
        HTML(
            .head(for: context.index, on: context.site),
            .body(
                .navigationBar(for: context),
                .h1(
                    .text("All posts with the tag \(page.tag.string)")
                ),
                .homeBody(for: context.items(taggedWith: page.tag), on: context.site),
                .myFooter(for: context.site)
            )
        )
    }
}
