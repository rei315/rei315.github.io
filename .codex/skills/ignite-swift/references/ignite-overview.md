# Ignite overview

## What Ignite is
Ignite is a static site builder for Swift that uses SwiftUI-like syntax to generate HTML.

## Typical project structure
- Assets: static assets (images, CSS, etc.)
- Build: generated output (do not edit; recreated each build)
- Content: Markdown content for articles/posts (optional)
- Includes: custom HTML includes (optional)
- Sources: Swift source for the site

## SwiftPM usage notes
- Ignite is imported with `import Ignite` in your site sources.
- The site is a Swift Package; confirm the dependency in `Package.swift`.
- If you need to inspect the exact API version, check `Package.resolved` and the `.build/checkouts/` folder after a build.

## Markdown rendering notes
- Files in Content are rendered to Build with the same subfolder structure and an index.html.
- Rendering Markdown requires at least one layout; otherwise Ignite warns that no layout exists.

## Minimal site sketch
```swift
import Ignite

struct ExampleSite: Site {
    var name = "Hello World"
    var url = URL(static: "https://www.example.com")

    var homePage = Home()
    var layout = MainLayout()
}
```

## Article layout sketch
```swift
import Ignite

struct CustomArticleLayout: ArticlePage {
    var body: some HTML {
        Text(article.title)
            .font(.title1)

        if let image = article.image {
            Image(image, description: article.imageDescription)
                .resizable()
                .cornerRadius(20)
                .frame(maxHeight: 300)
        }

        Text(article.text)
    }
}
```

## CLI quick usage
- `ignite new YourSite`
- `ignite build`
- `ignite run --preview`
