# Core Ignite protocols and types

## Site
- Central configuration for an Ignite site.
- Required properties typically include `name`, `url`, `homePage`, and `layout`.
- Provides defaults for many properties (themes, feed configuration, robots, etc.).
- Exposes `staticPages` and `articlePages` builders to register pages.
- Rendering uses `publish(...)` methods on the `Site` type.

## Layout
- Defines the document structure for pages.
- `body` returns a `Document` using `@DocumentBuilder`.
- Default `content` uses `PublishingContext.shared.environment.pageContent`.

## LayoutContent
- Protocol for types that can render in a layout.
- `body` returns `BodyElement` via `@HTMLBuilder`.
- `layout` defaults to `DefaultLayout`.

## StaticPage
- For standalone pages not tied to Markdown files.
- Has `title`, optional `image`, and `description`.
- `path` defaults to a slug based on the type name.

## ArticlePage
- For rendering Markdown content.
- `article` is available via `PublishingContext.shared.environment.article`.

## Theme
- Defines colors, fonts, and responsive values for styling.
- Assign via `Site.lightTheme`, `Site.darkTheme`, and `Site.alternateThemes`.
