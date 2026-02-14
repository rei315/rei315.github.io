//
// AppsListSection.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import AppShared
import Ignite
import SiteCore

struct AppsPageContent: HTML {
  let page: Int
  let language: SupportedLanguage

  var body: some HTML {
    Section {
      Text("Apps")
        .font(.title1)
      Text("A curated list of small apps and experiments.")
    }
    .padding(.vertical, 48)

    AppsListSection(page: page, language: language)
  }
}

struct AppsListSection: HTML {
  let page: Int
  let language: SupportedLanguage

  var body: some HTML {
    let entries = AppsEntry.entries(for: page, language: language)

    Section {
      Text("Browse the lineup")
        .font(.title2)
      Text("Tap an app to open the detail page.")

      if entries.isEmpty {
        Text("No apps yet.")
          .class("apps-empty")
      } else {
        Section {
          ForEach(entries) { entry in
            Section {
              Link(
                Image(entry.iconPath, description: entry.title),
                target: entry.path
              )
              .class("apps-item-icon")

              Section {
                Link(entry.title, target: entry.path)
                  .class("apps-item-title")

                Text(entry.summary)
                  .class("apps-item-summary")

                Section {
                  ForEach(entry.stack) { item in
                    Span(item.text)
                      .class("apps-badge")
                  }
                }
                .class("apps-item-meta")
              }
              .class("apps-item-content")
            }
            .class("apps-item")
          }
        }
        .class("apps-list")
      }

      AppsPagination(current: page, total: AppsEntry.pageCount(language: language), language: language)
    }
    .padding(.bottom, 48)
  }
}

struct AppsPagination: HTML {
  let current: Int
  let total: Int
  let language: SupportedLanguage

  var body: some HTML {
    if total > 1 {
      Section {
        if current > 1 {
          Link("Prev", target: AppsEntry.pagePath(current - 1, language: language))
            .class("apps-pagination-link")
        } else {
          Span("Prev")
            .class("apps-pagination-disabled")
        }

        ForEach(1...total) { page in
          if page == current {
            Span("\(page)")
              .class("apps-pagination-current")
          } else {
            Link("\(page)", target: AppsEntry.pagePath(page, language: language))
              .class("apps-pagination-link")
          }
        }

        if current < total {
          Link("Next", target: AppsEntry.pagePath(current + 1, language: language))
            .class("apps-pagination-link")
        } else {
          Span("Next")
            .class("apps-pagination-disabled")
        }
      }
      .class("apps-pagination")
    }
  }
}
