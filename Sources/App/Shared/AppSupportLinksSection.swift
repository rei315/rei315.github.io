import Ignite

public struct AppSupportLinkItem: Identifiable, Sendable {
  public let id: String
  public let label: String
  public let target: String

  public init(id: String, label: String, target: String) {
    self.id = id
    self.label = label
    self.target = target
  }
}

public struct AppSupportLinksSection: HTML {
  public let items: [AppSupportLinkItem]

  public init(items: [AppSupportLinkItem]) {
    self.items = items
  }

  public var body: some HTML {
    Section {
      ForEach(items) { item in
        Link(item.label, target: item.target)
          .class("apps-detail-support-link")
      }
    }
    .class("apps-detail-support-links")
  }
}
