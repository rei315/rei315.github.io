//
// Site.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
// Copyright © 2026 rei315. All rights reserved.
//

import App
import Develop
import Home
import Ignite
import Info
import SiteCore

struct MySite: Site {
  var name = "Rei Blog"
  var url = URL(static: "https://rei315.github.io")
  var author = "Rei315"
  var language = Language.english

  var homePage = Home(language: .en)
  var ambientSeason: AmbientSeason = .winter
  var layout: MainLayout {
    MainLayout(season: ambientSeason)
  }
  var lightTheme: (any Theme)? = MyTheme()
  var darkTheme: (any Theme)? = nil

  var staticPages: [any StaticPage] {
    var pages: [any StaticPage] = []

    for language in SupportedLanguage.allCases {
      if language != .en {
        pages.append(Home(language: language))
      }

      pages.append(Develop(language: language))
      pages.append(Apps(language: language))
      pages.append(Info(language: language))

      pages.append(contentsOf: DevelopModulePages.staticPages(language: language))
      pages.append(contentsOf: AppModulePages.staticPages(language: language))
    }

    return pages
  }
}

@main
struct Rei315Blog {
  static func main() async {
    var site = MySite()

    do {
      try await site.publish()
    } catch {
      print(error.localizedDescription)
    }
  }
}
