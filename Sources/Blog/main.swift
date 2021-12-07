import Foundation
import Publish
import Plot
import SplashPublishPlugin
import XCTest

// This type acts as the configuration for your website.
struct Blog: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case home
        case combine = "combine"
        case swiftUI = "SwiftUI"
        case dataStructures
        case algorithms = "Algorithms"
        case about = "About"
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
        var author: String?
        var tags: String?
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://your-website-url.com")!
    var name = "Blog"
    var description = "A description of A Blog"
    var language: Language { .english }
    var imagePath: Path? { nil }
}

extension Theme where Site == Blog {
    static var tutorial: Theme {
        Theme(htmlFactory: MyHTMLFactory(), resourcePaths: ["Resources/MyTheme/styles.css"])
    }
}

// This will generate your website using the built-in Foundation theme:
//try Blog().publish(withTheme: .tutorial)
try Blog().publish(withTheme: .tutorial,
                    deployedUsing: .gitHub("asteezy24/Blog"),
                   plugins: [.splash(withClassPrefix: "")])
