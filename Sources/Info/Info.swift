//
// Info.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import InfoProfile
import SiteCore

public struct Info: StaticPage {
  public let language: SupportedLanguage
  public var title = "Info"

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var path: String {
    language.prefixedPath("info")
  }

  public var body: some HTML {
    InfoProfileSection()
  }
}
