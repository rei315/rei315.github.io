import Ignite

public struct HomeMainSection: HTML {
  public init() {}

  public var body: some HTML {
    Section {
      Text("Hello, world!")
        .font(.title1)
      Text("Develop log and apps in progress.")
        .font(.lead)
    }
    .padding(.vertical, 48)
  }
}
