//
// MainNavigationBar.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite
import SiteCore

struct MainNavigationBar: HTML {
  @Environment(\.page) private var currentPage

  var body: some HTML {
    let currentLanguage = SupportedLanguage.from(path: currentPage.url.path)

    NavigationBar {
      Link("Develop", target: currentLanguage.prefixedPath("develop"))
      Link("Apps", target: currentLanguage.prefixedPath("apps"))
      Link("Info", target: currentLanguage.prefixedPath("info"))
    } logo: {
      Span {
        Link("Rei Blog", target: currentLanguage.homePath)
          .class("navbar-brand")
      }
      .class("navbar-brand-group")
    }
  }
}
