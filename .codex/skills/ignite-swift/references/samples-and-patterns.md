# Samples and patterns (Ignite)

## IgniteSamples usage
Use the IgniteSamples repository for concrete, working examples of elements, layouts, themes, and modifiers.

Suggested flow:
1. Clone IgniteSamples in a sibling folder to your project.
2. Open Package.swift in Xcode or search using rg for element names.
3. Copy and adapt patterns (layouts, pages, components) into your site.

When searching, start with:
- Element names from references/elements-modifiers.md
- Protocols from references/core-protocols.md

## Pattern snippets
These snippets are minimal patterns that align with the Ignite APIs captured in this skill. Treat them as starting points and adjust as needed.

### Minimal Home page
```swift
import Ignite

struct Home: StaticPage {
    var title = "Home"

    var body: some HTML {
        Section {
            Text("Welcome")
            Text("This site is built with Ignite.")
        }
    }
}
```

### Register pages in Site
```swift
import Ignite

struct MySite: Site {
    var name = "My Site"
    var url = URL(static: "https://example.com")

    var homePage = Home()
    var layout = MainLayout()

    var staticPages: [any StaticPage] {
        About()
        Contact()
    }
}
```

### Basic layout
```swift
import Ignite

struct MainLayout: Layout {
    var body: some Document {
        Body {
            content
        }
    }
}
```

### Markdown article layout
```swift
import Ignite

struct BlogLayout: ArticlePage {
    var body: some HTML {
        Text(article.title)
            .font(.title1)
        Text(article.text)
    }
}
```
