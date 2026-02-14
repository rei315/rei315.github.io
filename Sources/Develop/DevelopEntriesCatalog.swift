import DevelopBlogEntry
import DevelopShared
import SiteCore

extension DevelopEntry {
  static func all(language: SupportedLanguage) -> [DevelopEntry] {
    let base = [
      DevelopIndex.blogEntry(language: language),
    ]
//    return base + DevelopIndex.paginationSamples
    return base
  }

  static func pageCount(language: SupportedLanguage) -> Int {
    let entries = all(language: language)
    guard !entries.isEmpty else { return 1 }
    return (entries.count + pageSize - 1) / pageSize
  }

  static func entries(for page: Int, language: SupportedLanguage) -> [DevelopEntry] {
    guard page > 0 else { return [] }
    let entries = all(language: language)
    let startIndex = (page - 1) * pageSize
    guard startIndex < entries.count else { return [] }
    let endIndex = min(startIndex + pageSize, entries.count)
    return Array(entries[startIndex..<endIndex])
  }
}
