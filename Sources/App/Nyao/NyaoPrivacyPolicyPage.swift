import AppShared
import Foundation
import Ignite
import SiteCore

public struct NyaoPrivacyPolicyPage: StaticPage {
  public let language: SupportedLanguage

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var title: String {
    language.localized("nyao.privacy.page.title", bundle: .module)
  }

  public var path: String {
    AppsEntry.privacyPolicyPath(for: "nyao", language: language)
  }

  private var privacyMarkdown: String {
    if let localized = loadPrivacyMarkdown(for: language) {
      return localized
    }

    if let fallback = loadPrivacyMarkdown(for: .en) {
      return fallback
    }

    return language.localized("nyao.privacy.error.unavailable", bundle: .module)
  }

  public var body: some HTML {
    Section {
      Text(language.localized("nyao.privacy.page.title", bundle: .module))
        .font(.title1)
      Text(language.localized("nyao.privacy.page.subtitle", bundle: .module))
        .class("app-faq-subtitle")
    }
    .class("app-faq-header")
    .padding(.vertical, 32)

    Text(markdown: privacyMarkdown)
      .class("app-privacy-content")

    Link(
      language.localized("nyao.faq.backToApp", bundle: .module),
      target: language.prefixedPath("apps/nyao")
    )
    .class("apps-detail-back")
  }

  private func loadPrivacyMarkdown(for language: SupportedLanguage) -> String? {
    guard let url = Bundle.module.url(
      forResource: markdownFilename(for: language),
      withExtension: nil,
      subdirectory: "privacy"
    ),
      let markdown = try? String(contentsOf: url, encoding: .utf8)
    else {
      return nil
    }

    return NyaoContactInfo.injectingSupportEmail(into: markdown)
  }

  private func markdownFilename(for language: SupportedLanguage) -> String {
    switch language {
    case .en:
      return "privacy-policy-en-US.md"
    case .ko:
      return "privacy-policy-ko-KR.md"
    case .ja:
      return "privacy-policy-ja-JP.md"
    }
  }
}
