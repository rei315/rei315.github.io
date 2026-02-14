//
// AppsEntry.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import SiteCore

public struct AppsDetailItem: Identifiable {
  public let id: String
  public let text: String

  public init(_ text: String) {
    self.id = text
    self.text = text
  }
}

public struct AppsEntry: StaticPage, Identifiable {
  public let language: SupportedLanguage
  public let id: String
  public let title: String
  public let summary: String
  public let tagline: String
  public let iconPath: String
  public let features: [AppsDetailItem]
  public let stack: [AppsDetailItem]
  public let content: AnyHTML

  public init(
    language: SupportedLanguage,
    id: String,
    title: String,
    summary: String,
    tagline: String,
    iconPath: String,
    features: [String],
    stack: [String],
    @HTMLBuilder content: @MainActor (SupportedLanguage) -> some HTML
  ) {
    self.language = language
    self.id = id
    self.title = title
    self.summary = summary
    self.tagline = tagline
    self.iconPath = iconPath
    self.features = features.map { AppsDetailItem($0) }
    self.stack = stack.map { AppsDetailItem($0) }
    self.content = AnyHTML(content(language))
  }

  public init(
    id: String,
    title: String,
    summary: String,
    tagline: String,
    iconPath: String,
    features: [String],
    stack: [String],
    @HTMLBuilder content: @MainActor () -> some HTML
  ) {
    self.init(
      language: .en,
      id: id,
      title: title,
      summary: summary,
      tagline: tagline,
      iconPath: iconPath,
      features: features,
      stack: stack,
      content: { _ in content() }
    )
  }

  public var path: String {
    language.prefixedPath("apps/\(id)")
  }

  public var body: some HTML {
    Section {
      Section {
        Image(iconPath, description: "\(title) icon")
          .class("apps-detail-icon")

        Section {
          Text(title)
            .font(.title1)
          Text(tagline)
            .class("apps-detail-tagline")
        }
        .class("apps-detail-heading")
      }
      .class("apps-detail-hero")

      Text(summary)
        .font(.lead)
        .margin(.top, .medium)
    }
    .padding(.vertical, 32)

    Section {
      Section {
        Text("Key features")
          .font(.title3)

        List {
          ForEach(features) { feature in
            Text(feature.text)
          }
        }
      }
      .class("apps-detail-card")

      Section {
        Text("Tech stack")
          .font(.title3)

        Section {
          ForEach(stack) { item in
            Span(item.text)
              .class("apps-badge")
          }
        }
        .class("apps-detail-stack")
      }
      .class("apps-detail-card")
    }
    .class("apps-detail-grid")

    content

    Link("Back to Apps", target: language.prefixedPath("apps"))
      .class("apps-detail-back")
  }

  public static let pageSize = 6

  public static func pagePath(_ page: Int, language: SupportedLanguage) -> String {
    let base = page <= 1 ? "apps" : "apps/page/\(page)"
    return language.prefixedPath(base)
  }

  public static func faqPath(for appID: String, language: SupportedLanguage) -> String {
    language.prefixedPath("apps/\(appID)/faq")
  }
}
