//
// AppsPage.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import AppShared
import Ignite
import SiteCore

public struct AppsPage: StaticPage {
  public let language: SupportedLanguage
  public let page: Int

  public init(language: SupportedLanguage, page: Int) {
    self.language = language
    self.page = page
  }

  public var title: String {
    page <= 1 ? "Apps" : "Apps · Page \(page)"
  }

  public var path: String {
    AppsEntry.pagePath(page, language: language)
  }

  public var body: some HTML {
    AppsPageContent(page: page, language: language)
  }

  public static func all(language: SupportedLanguage) -> [AppsPage] {
    let total = AppsEntry.pageCount(language: language)
    guard total > 1 else { return [] }
    return Array(2...total).map { AppsPage(language: language, page: $0) }
  }
}
