//
// DevelopPage.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import DevelopShared
import Ignite
import SiteCore

public struct DevelopPage: StaticPage {
  public let language: SupportedLanguage
  public let page: Int

  public init(language: SupportedLanguage, page: Int) {
    self.language = language
    self.page = page
  }

  public var title: String {
    page <= 1 ? "Develop" : "Develop · Page \(page)"
  }

  public var path: String {
    DevelopEntry.pagePath(page, language: language)
  }

  public var body: some HTML {
    DevelopPageContent(page: page, language: language)
  }

  public static func all(language: SupportedLanguage) -> [DevelopPage] {
    let total = DevelopEntry.pageCount(language: language)
    guard total > 1 else { return [] }
    return Array(2...total).map { DevelopPage(language: language, page: $0) }
  }
}
