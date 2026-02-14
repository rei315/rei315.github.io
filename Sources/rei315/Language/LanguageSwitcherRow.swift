//
// LanguageSwitcherRow.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/03.
//

import Ignite
import SiteCore

struct LanguageSwitcherRow: HTML {
  @Environment(\.page) private var currentPage

  var body: some HTML {
    let currentLanguage = SupportedLanguage.from(path: currentPage.url.path)
    let basePath = SupportedLanguage.stripLanguagePrefix(from: currentPage.url.path)

    Section {
      LanguageSelector(currentLanguage: currentLanguage) { language in
        language.prefixedPath(basePath)
      }
    }
    .class("language-switcher-row")
  }
}
