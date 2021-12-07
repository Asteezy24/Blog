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
        return try makeHomeHTML(latestItem: section.items.first!, for: index, section: section, context: context)
    }
    
    func makeSectionHTML(for section: Section<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        let latest = context.sections.first(where: { $0.id == .home})!.items.first!
        switch section.id {
        case .home:
            return try makeHomeHTML(latestItem: latest, for: context.index, section: section, context: context)
        case .combine, .dataStructures, .algorithms, .swiftUI:
            let tag = String.convertSectionToProperFormat(from: section.id)
            let items = context.items(taggedWith: .init(tag))
            return try makePageByCategory(title: section.id.rawValue, latestPost: latest, items: items, for: section, context: context)
        case .about:
            return try makeAboutHTML(for: context.index, context: context)
        }
    }
    
    func makeItemHTML(for item: Item<Blog>, context: PublishingContext<Blog>) throws -> HTML {
        return HTML(
            .head(for: item, on: context.site),
            .body(
                .topBanner(),
                .navigationBar(for: context),
                .br(),
                .img(.src(item.imagePath ?? "")),
                .br(),
                .div (
                    .class("item-article-body"),
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
                .topBanner(),
//                .latestPost(for: latestItem, on: context.site),
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
