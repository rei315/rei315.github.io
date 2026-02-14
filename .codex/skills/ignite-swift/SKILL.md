---
name: ignite-swift
description: Build or modify Ignite static sites in Swift. Use when working with Ignite APIs (Site, Layout, StaticPage, ArticlePage, Theme), editing Swift source in Ignite site projects, or troubleshooting Ignite build/publish behavior and project structure.
---

# Ignite Swift

## Overview
Use this skill to edit Ignite Swift code and site structure for SwiftPM-based Ignite sites. Load reference files when you need API details, samples, or element lists.

## Quick workflow
1. Identify the site root (look for `Package.swift` and `Sources/`).
2. Find the type that conforms to Site and the main layout; update name/url/homePage/layout first.
3. Choose the task: add/modify StaticPage, add/modify ArticlePage (Markdown), update Layout or Theme, adjust assets/content.
4. Build or preview via the Ignite CLI; if the request is CLI-focused, use the ignite-cli skill.

## Common tasks
### Add a static page
- Create a type conforming to StaticPage with title and body.
- Register it in Site.staticPages if it is not the home page.

### Add a Markdown article layout
- Create an ArticlePage and use the article properties.
- Register it in Site.articlePages.
- Ensure at least one layout exists so Content Markdown renders.

### Customize layout
- Create a Layout with a Document body and place content where page HTML should render.

### Theme changes
- Implement Theme and assign it to lightTheme, darkTheme, or alternateThemes.

## References
- Open references/ignite-overview.md for project structure and quick usage.
- Open references/core-protocols.md for core protocol details.
- Open references/elements-modifiers.md for the element and modifier list.
- Open references/samples-and-patterns.md for sample usage guidance and patterns.
