//
// Home.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
// Copyright © 2026 rei315. All rights reserved.
//

import HomeMain
import Ignite
import SiteCore

public struct Home: StaticPage {
  public let language: SupportedLanguage
  public var title = "Rei Blog"

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var path: String {
    language.homePath
  }

  public var body: some HTML {
    HomeMainSection()
  }
}
