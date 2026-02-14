//
// LanguageSelector.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/03.
//

import Ignite
import SiteCore

struct LanguageSelector: InlineElement {
  let currentLanguage: SupportedLanguage
  let path: (SupportedLanguage) -> String

  var body: some InlineElement {
    Span {
      InlineForEach(SupportedLanguage.allCases) { language in
        let isActive = language == currentLanguage
        let className = [
          "language-switcher__link",
          isActive ? "language-switcher__link--active" : nil,
        ]
        .compactMap { $0 }
        .joined(separator: " ")

        Link(language.displayName, target: path(language))
          .class(className)
      }
    }
    .class("language-switcher")
  }
}
