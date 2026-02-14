import DevelopShared
import Ignite
import SiteCore

@MainActor
public enum DevelopModulePages {
  public static func staticPages(language: SupportedLanguage) -> [any StaticPage] {
    var pages: [any StaticPage] = []
    pages.append(contentsOf: DevelopEntry.all(language: language).map { $0 as any StaticPage })
    pages.append(contentsOf: DevelopPage.all(language: language).map { $0 as any StaticPage })
    return pages
  }
}
