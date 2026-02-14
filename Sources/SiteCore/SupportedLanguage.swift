//
// SupportedLanguage.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/03.
//

import Foundation

public enum SupportedLanguage: String, CaseIterable, Identifiable {
  case en
  case ko
  case ja

  public var id: String { rawValue }

  public var locale: Locale {
    Locale(identifier: rawValue)
  }

  public var displayName: String {
    switch self {
    case .en: return "English"
    case .ko: return "한국어"
    case .ja: return "日本語"
    }
  }

  public var pathPrefix: String {
    self == .en ? "" : "/\(rawValue)"
  }

  public var homePath: String {
    pathPrefix.isEmpty ? "/" : pathPrefix
  }

  public func prefixedPath(_ path: String) -> String {
    let trimmed = SupportedLanguage.normalizedPath(path)
    guard !trimmed.isEmpty else { return homePath }
    return pathPrefix.isEmpty ? "/\(trimmed)" : "\(pathPrefix)/\(trimmed)"
  }

  public func localized(_ key: String, bundle: Bundle) -> String {
    let resolved = String(localized: String.LocalizationValue(key), bundle: bundle, locale: locale)
    guard resolved == key else { return resolved }
    return XCStringsLocalizationCache.shared.localizedValue(for: key, locale: locale, bundle: bundle) ?? resolved
  }

  public static func from(path: String) -> SupportedLanguage {
    let trimmed = normalizedPath(path)
    guard let first = trimmed.split(separator: "/").first else { return .en }
    switch first {
    case "ko": return .ko
    case "ja": return .ja
    default: return .en
    }
  }

  public static func stripLanguagePrefix(from path: String) -> String {
    let trimmed = normalizedPath(path)
    let parts = trimmed.split(separator: "/").map(String.init)
    guard let first = parts.first else { return "" }
    if first == "ko" || first == "ja" {
      return parts.dropFirst().joined(separator: "/")
    }
    return trimmed
  }

  private static func normalizedPath(_ path: String) -> String {
    path.trimmingCharacters(in: CharacterSet(charactersIn: "/"))
  }
}

private struct XCStringsCatalog: Decodable {
  let sourceLanguage: String
  let strings: [String: XCStringsEntry]
}

private struct XCStringsEntry: Decodable {
  let localizations: [String: XCStringsLanguageUnit]?
}

private struct XCStringsLanguageUnit: Decodable {
  let stringUnit: XCStringsStringUnit?
}

private struct XCStringsStringUnit: Decodable {
  let value: String?
}

private final class XCStringsLocalizationCache: @unchecked Sendable {
  static let shared = XCStringsLocalizationCache()

  private enum CachedCatalog {
    case loaded(XCStringsCatalog)
    case missing
  }

  private var catalogsByBundlePath: [String: CachedCatalog] = [:]
  private let lock = NSLock()

  func localizedValue(for key: String, locale: Locale, bundle: Bundle) -> String? {
    guard let catalog = catalog(for: bundle),
          let entry = catalog.strings[key],
          let localizations = entry.localizations
    else {
      return nil
    }

    for candidate in localizationCandidates(locale: locale, sourceLanguage: catalog.sourceLanguage) {
      if let value = localizations[candidate]?.stringUnit?.value, !value.isEmpty {
        return value
      }
    }

    return nil
  }

  private func catalog(for bundle: Bundle) -> XCStringsCatalog? {
    let path = bundle.bundlePath

    lock.lock()
    defer { lock.unlock() }

    if let cached = catalogsByBundlePath[path] {
      switch cached {
      case .loaded(let catalog):
        return catalog
      case .missing:
        return nil
      }
    }

    guard let url = bundle.url(forResource: "Localizable", withExtension: "xcstrings"),
          let data = try? Data(contentsOf: url),
          let catalog = try? JSONDecoder().decode(XCStringsCatalog.self, from: data)
    else {
      catalogsByBundlePath[path] = .missing
      return nil
    }

    catalogsByBundlePath[path] = .loaded(catalog)
    return catalog
  }

  private func localizationCandidates(locale: Locale, sourceLanguage: String) -> [String] {
    var candidates: [String] = []

    func append(_ candidate: String?) {
      guard let candidate, !candidate.isEmpty, !candidates.contains(candidate) else { return }
      candidates.append(candidate)
    }

    let identifier = locale.identifier.replacingOccurrences(of: "_", with: "-")
    append(identifier)
    append(identifier.lowercased())

    if let languageCode = identifier.split(separator: "-").first {
      let normalizedLanguageCode = String(languageCode)
      append(normalizedLanguageCode)
      append(normalizedLanguageCode.lowercased())
    }

    append(sourceLanguage)
    append(sourceLanguage.lowercased())

    return candidates
  }
}
