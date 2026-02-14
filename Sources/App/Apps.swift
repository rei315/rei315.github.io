//
// Apps.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import SiteCore

public struct Apps: StaticPage {
  public let language: SupportedLanguage
  public var title = "Apps"

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var path: String {
    language.prefixedPath("apps")
  }

  public var body: some HTML {
    AppsPageContent(page: 1, language: language)
  }
}
