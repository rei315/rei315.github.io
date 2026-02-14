import AppNyao
import AppShared
import Ignite
import SiteCore

@MainActor
public enum AppModulePages {
  public static func staticPages(language: SupportedLanguage) -> [any StaticPage] {
    var pages: [any StaticPage] = []
    pages.append(contentsOf: AppsEntry.all(language: language).map { $0 as any StaticPage })
    pages.append(contentsOf: AppsPage.all(language: language).map { $0 as any StaticPage })
    pages.append(NyaoFAQPage(language: language))
    return pages
  }
}
