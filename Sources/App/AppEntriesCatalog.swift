import AppNyao
import AppShared
import SiteCore

extension AppsEntry {
  static func all(language: SupportedLanguage) -> [AppsEntry] {
    let base = [
      AppsIndex.nyao(language: language),
    ]
//    return base + AppsIndex.paginationSamples
    return base
  }

  static func pageCount(language: SupportedLanguage) -> Int {
    let entries = all(language: language)
    guard !entries.isEmpty else { return 1 }
    return (entries.count + pageSize - 1) / pageSize
  }

  static func entries(for page: Int, language: SupportedLanguage) -> [AppsEntry] {
    guard page > 0 else { return [] }
    let entries = all(language: language)
    let startIndex = (page - 1) * pageSize
    guard startIndex < entries.count else { return [] }
    let endIndex = min(startIndex + pageSize, entries.count)
    return Array(entries[startIndex..<endIndex])
  }
}
