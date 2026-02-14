//
// DevelopListSection.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import DevelopShared
import Ignite
import SiteCore

struct DevelopPageContent: HTML {
  let page: Int
  let language: SupportedLanguage

  var body: some HTML {
    Section {
      Text("Develop")
        .font(.title1)
      Text("Notes, experiments, and build logs.")
    }
    .padding(.vertical, 48)

    DevelopListSection(page: page, language: language)
  }
}

struct DevelopListSection: HTML {
  let page: Int
  let language: SupportedLanguage

  var body: some HTML {
    let entries = DevelopEntry.entries(for: page, language: language)

    Section {
      Text("Explore the logs")
        .font(.title2)
      Text("Pick an entry to open the detail page.")

      if entries.isEmpty {
        Text("No entries yet.")
          .class("develop-empty")
      } else {
        Section {
          ForEach(entries) { entry in
            Section {
              Link(
                Image(entry.imagePath, description: entry.title),
                target: entry.path
              )
              .class("develop-card-media")

              Link(entry.title, target: entry.path)
                .class("develop-card-title")

              Text(entry.summary)
                .class("develop-card-summary")
            }
            .class("develop-card")
          }
        }
        .class("develop-grid")
      }

      DevelopPagination(current: page, total: DevelopEntry.pageCount(language: language), language: language)
    }
    .padding(.bottom, 48)
  }
}

struct DevelopPagination: HTML {
  let current: Int
  let total: Int
  let language: SupportedLanguage

  var body: some HTML {
    if total > 1 {
      Section {
        if current > 1 {
          Link("Prev", target: DevelopEntry.pagePath(current - 1, language: language))
            .class("develop-pagination-link")
        } else {
          Span("Prev")
            .class("develop-pagination-disabled")
        }

        ForEach(1...total) { page in
          if page == current {
            Span("\(page)")
              .class("develop-pagination-current")
          } else {
            Link("\(page)", target: DevelopEntry.pagePath(page, language: language))
              .class("develop-pagination-link")
          }
        }

        if current < total {
          Link("Next", target: DevelopEntry.pagePath(current + 1, language: language))
            .class("develop-pagination-link")
        } else {
          Span("Next")
            .class("develop-pagination-disabled")
        }
      }
      .class("develop-pagination")
    }
  }
}
