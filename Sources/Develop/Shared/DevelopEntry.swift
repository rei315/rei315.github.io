//
// DevelopEntry.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import SiteCore

public struct DevelopEntry: StaticPage, Identifiable {
  public let language: SupportedLanguage
  public let id: String
  public let title: String
  public let summary: String
  public let imagePath: String
  public let content: AnyHTML

  public init(
    language: SupportedLanguage,
    id: String,
    title: String,
    summary: String,
    imagePath: String,
    @HTMLBuilder content: @MainActor (SupportedLanguage) -> some HTML
  ) {
    self.language = language
    self.id = id
    self.title = title
    self.summary = summary
    self.imagePath = imagePath
    self.content = AnyHTML(content(language))
  }

  public init(
    id: String,
    title: String,
    summary: String,
    imagePath: String,
    @HTMLBuilder content: @MainActor () -> some HTML
  ) {
    self.init(
      language: .en,
      id: id,
      title: title,
      summary: summary,
      imagePath: imagePath,
      content: { _ in content() }
    )
  }

  public var path: String {
    language.prefixedPath("develop/\(id)")
  }

  public var body: some HTML {
    Section {
      Text(title)
        .font(.title1)
      Text(summary)
        .font(.lead)
    }
    .padding(.vertical, 32)

    Section {
      Image(imagePath, description: "\(title) cover")
        .resizable()
        .class("develop-detail-hero")

      content

      Link("Back to Develop", target: language.prefixedPath("develop"))
        .class("develop-detail-back")
    }
  }

  public static let pageSize = 10

  public static func pagePath(_ page: Int, language: SupportedLanguage) -> String {
    let base = page <= 1 ? "develop" : "develop/page/\(page)"
    return language.prefixedPath(base)
  }
}
