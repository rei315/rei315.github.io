import Ignite

public struct AppFAQItem: Identifiable, Sendable {
  public let id: String
  public let question: String
  public let answerMarkdown: String

  public init(id: String, question: String, answerMarkdown: String) {
    self.id = id
    self.question = question
    self.answerMarkdown = answerMarkdown
  }
}

public struct AppFAQSection: HTML {
  public let title: String
  public let items: [AppFAQItem]

  public init(title: String, items: [AppFAQItem]) {
    self.title = title
    self.items = items
  }

  public var body: some HTML {
    Section {
      Text(title)
        .font(.title3)

      Accordion(items) { item in
        Item(item.question) {
          Text(markdown: item.answerMarkdown)
        }
      }
      .openMode(.all)
      .class("app-faq-accordion")
    }
    .class("app-faq-section")
  }
}
