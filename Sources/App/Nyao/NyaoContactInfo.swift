import Foundation

enum NyaoContactInfo {
  static let supportEmail = "nekodoko315@gmail.com"
  static let supportEmailPlaceholder = "{{NYAO_SUPPORT_EMAIL}}"

  static func injectingSupportEmail(into text: String) -> String {
    text.replacingOccurrences(of: supportEmailPlaceholder, with: supportEmail)
  }
}
