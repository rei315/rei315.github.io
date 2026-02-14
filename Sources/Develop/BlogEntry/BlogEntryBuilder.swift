//
// BlogEntryBuilder.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import DevelopShared
import Ignite
import SiteCore

extension DevelopIndex {
  public static func blogEntry(language: SupportedLanguage) -> DevelopEntry {
    DevelopEntry(
      language: language,
      id: "blogEntry",
      title: language.localized("blogentry.title", bundle: .module),
      summary: language.localized("blogentry.summary", bundle: .module),
      imagePath: "/images/profile_icon.png"
    ) { language in
      Text(language.localized("blogentry.entry.title", bundle: .module))
        .font(.title2)
      
      Text(markdown: language.localized("blogentry.entry.description", bundle: .module))
    }
  }
}
