//
// NyaoBuilder.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import AppShared
import Ignite
import SiteCore

extension AppsIndex {
  public static func nyao(language: SupportedLanguage) -> AppsEntry {
    AppsEntry(
      language: language,
      id: "nyao",
      title: language.localized("nyao.title", bundle: .module),
      summary: language.localized("nyao.summary", bundle: .module),
      tagline: language.localized("nyao.tagline", bundle: .module),
      iconPath: "/images/nyao_app_icon.png",
      features: [
        language.localized("nyao.feature.0", bundle: .module),
      ],
      stack: [
        "AppKit",
        "SwiftUI",
        "Metal",
        "CoreGraphics"
      ]
    ) { language in
      Text(language.localized("nyao.aboutapp.title", bundle: .module))
        .font(.title3)

      Text(markdown: language.localized("nyao.aboutapp.description", bundle: .module))

      Text(language.localized("nyao.description.feature.title", bundle: .module))
        .font(.title3)
        .margin(.top, .xLarge)
      List {
        Text(language.localized("nyao.description.feature.0", bundle: .module))
        Text(language.localized("nyao.description.feature.1", bundle: .module))
        Text(language.localized("nyao.description.feature.2", bundle: .module))
        Text(language.localized("nyao.description.feature.3", bundle: .module))
        Text(language.localized("nyao.description.feature.4", bundle: .module))
        Text(language.localized("nyao.description.feature.5", bundle: .module))
      }
      
      Text(language.localized("nyao.description.scene.title", bundle: .module))
        .font(.title3)
        .margin(.top, .xLarge)
      List {
        Text(language.localized("nyao.description.scene.0", bundle: .module))
        Text(language.localized("nyao.description.scene.1", bundle: .module))
        Text(language.localized("nyao.description.scene.2", bundle: .module))
      }

      AppSupportLinksSection(
        items: [
          AppSupportLinkItem(
            id: "faq",
            label: language.localized("nyao.faq.link.cta", bundle: .module),
            target: AppsEntry.faqPath(for: "nyao", language: language)
          ),
          AppSupportLinkItem(
            id: "privacy-policy",
            label: language.localized("nyao.privacy.link.cta", bundle: .module),
            target: AppsEntry.privacyPolicyPath(for: "nyao", language: language)
          ),
        ]
      )
      .margin(.top, .xLarge)
    }
  }
}
