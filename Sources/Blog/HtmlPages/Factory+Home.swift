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
        var homeImage: Path { "Images/swift.png" }
        
        return
            HTML(
                .head(for: index, on: context.site),
                .body(
                    .myHeader(for: context),
                    .class("logo-image"),
                    .img(.class("post-image"), .src(homeImage)),
                    .myFooter(for: context.site)
                )
        )
    }
}
