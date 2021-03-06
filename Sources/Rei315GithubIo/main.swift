import Foundation
import Publish
import Plot

// This type acts as the configuration for your website.
struct Rei315GithubIo: Website {
    enum SectionID: String, WebsiteSectionID {
        // Add the sections that you want your website to contain here:
        case posts
    }

    struct ItemMetadata: WebsiteItemMetadata {
        // Add any site-specific metadata that you want to use here.
    }

    // Update these properties to configure your website:
    var url = URL(string: "https://rei315.github.io")!
    var name = "猫が好きなエンジニアさん"
    var description = """
Appleプラットフォーム、Metal開発が好きです。
最近はNLPに興味があります。
"""
    var language: Language { .japanese }
    var imagePath: Path? { nil }
}

try Rei315GithubIo().publish(using: [
    .addMarkdownFiles(),
    .copyResources(),
    .generateHTML(withTheme: .foundation),
    .generateRSSFeed(including: [.posts]),
    .generateSiteMap(),
    .deploy(using: .gitHub("rei315/rei315.github.io", useSSH: true))
])
