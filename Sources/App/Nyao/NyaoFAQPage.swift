import AppShared
import Ignite
import SiteCore

public struct NyaoFAQPage: StaticPage {
  public let language: SupportedLanguage

  public init(language: SupportedLanguage) {
    self.language = language
  }

  public var title: String {
    language.localized("nyao.faq.page.title", bundle: .module)
  }

  public var path: String {
    AppsEntry.faqPath(for: "nyao", language: language)
  }

  private var faqItems: [AppFAQItem] {
    [
      AppFAQItem(
        id: "what-is-app",
        question: language.localized("nyao.faq.q.1", bundle: .module),
        answerMarkdown: language.localized("nyao.faq.a.1", bundle: .module)
      ),
      AppFAQItem(
        id: "is-free",
        question: language.localized("nyao.faq.q.2", bundle: .module),
        answerMarkdown: language.localized("nyao.faq.a.2", bundle: .module)
      ),
      AppFAQItem(
        id: "supported-environment",
        question: language.localized("nyao.faq.q.3", bundle: .module),
        answerMarkdown: language.localized("nyao.faq.a.3", bundle: .module)
      ),
      AppFAQItem(
        id: "bug-report",
        question: language.localized("nyao.faq.q.4", bundle: .module),
        answerMarkdown: language.localized("nyao.faq.a.4", bundle: .module)
      ),
      AppFAQItem(
        id: "open-source",
        question: language.localized("nyao.faq.q.5", bundle: .module),
        answerMarkdown: language.localized("nyao.faq.a.5", bundle: .module)
      ),
    ]
  }

  public var body: some HTML {
    Section {
      Text(language.localized("nyao.faq.page.title", bundle: .module))
        .font(.title1)
      Text(language.localized("nyao.faq.page.subtitle", bundle: .module))
        .class("app-faq-subtitle")
    }
    .class("app-faq-header")
    .padding(.vertical, 32)

    AppFAQSection(
      title: language.localized("nyao.faq.section.title", bundle: .module),
      items: faqItems
    )

    Link(
      language.localized("nyao.faq.backToApp", bundle: .module),
      target: language.prefixedPath("apps/nyao")
    )
    .class("apps-detail-back")
  }
}
