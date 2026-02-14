import Ignite

public struct InfoProfileSection: HTML {
  public init() {}

  public var body: some HTML {
    Section {
      Section {
        Section {
          Text("Rei (MinGuk Kim)")
            .font(.title1)
          Text("iOS/macOS App Developer")
            .class("info-hero-role")
          Text("Building calm, graphics-forward apps and tools.")
            .class("info-hero-summary")
        }
        .class("info-hero-copy")

        Section {
          Image("/images/profile_icon.PNG", description: "Cat icon")
            .class("info-avatar")
        }
        .class("info-hero-badge")
      }
      .class("info-hero")
      .padding(.vertical, 48)

      Section {
        Section {
          Text("Profile")
            .class("info-card-title")
          Text("iOS/macOS App Developer")
            .class("info-card-body")
        }
        .class("info-card")

        Section {
          Text("Likes")
            .class("info-card-title")

          Section {
            Span("graphics programming")
              .class("info-badge")
            Span("cats")
              .class("info-badge")
          }
          .class("info-badges")
        }
        .class("info-card")

        Section {
          Text("SNS")
            .class("info-card-title")
          Link("X / @nekodoko315", target: "https://x.com/nekodoko315")
            .class("info-link")
        }
        .class("info-card")
      }
      .class("info-grid")
      .padding(.bottom, 48)
    }
  }
}
