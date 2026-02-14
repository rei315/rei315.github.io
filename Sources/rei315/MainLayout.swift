//
// MainLayout.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite

struct MainLayout: Layout {
  let season: AmbientSeason
  
  var body: some Document {
    Head {
      MetaLink(href: "/css/site.css", rel: .stylesheet)
      MetaLink(href: "/css/ambient.css", rel: .stylesheet)
    }
    
    Body {
      Tag("canvas")
        .id("ambient-canvas")
        .class("ambient-canvas")
        .attribute("data-ambient-season", season.rawValue)
        .attribute("aria-hidden", "true")
      
      Section {
        LanguageSwitcherRow()
        MainNavigationBar()
        content
      }
      .class("page-frame")
      
      Script(file: "/js/ambient.js")
    }
    .ignorePageGutters()
  }
}
