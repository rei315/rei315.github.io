//
// Develop.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import SiteCore

public struct Develop: StaticPage {
  public let language: SupportedLanguage
  public var title = "Develop"

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var path: String {
    language.prefixedPath("develop")
  }

  public var body: some HTML {
    DevelopPageContent(page: 1, language: language)
  }
}
