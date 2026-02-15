// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "rei315.github.io",
  defaultLocalization: "en",
  platforms: [.macOS(.v26)],
  dependencies: [
    .package(url: "https://github.com/twostraws/Ignite.git", branch: "main"),
  ],
  targets: [
    .target(
      name: "SiteCore",
      path: "Sources/SiteCore",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "AppShared",
      dependencies: [
        "Ignite",
        "SiteCore",
      ],
      path: "Sources/App/Shared",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "AppNyao",
      dependencies: [
        "Ignite",
        "SiteCore",
        "AppShared",
      ],
      path: "Sources/App/Nyao",
      resources: [
        .process("Resources"),
        .copy("privacy"),
      ]
    ),
    .target(
      name: "App",
      dependencies: [
        "Ignite",
        "SiteCore",
        "AppShared",
        "AppNyao",
      ],
      path: "Sources/App",
      exclude: [
        "Shared",
        "Nyao",
      ],
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "DevelopShared",
      dependencies: [
        "Ignite",
        "SiteCore",
      ],
      path: "Sources/Develop/Shared",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "DevelopBlogEntry",
      dependencies: [
        "Ignite",
        "SiteCore",
        "DevelopShared",
      ],
      path: "Sources/Develop/BlogEntry",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "Develop",
      dependencies: [
        "Ignite",
        "SiteCore",
        "DevelopShared",
        "DevelopBlogEntry",
      ],
      path: "Sources/Develop",
      exclude: [
        "Shared",
        "BlogEntry",
      ],
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "HomeMain",
      dependencies: [
        "Ignite",
      ],
      path: "Sources/Home/Main",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "Home",
      dependencies: [
        "Ignite",
        "SiteCore",
        "HomeMain",
      ],
      path: "Sources/Home",
      exclude: [
        "Main",
      ],
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "InfoProfile",
      dependencies: [
        "Ignite",
      ],
      path: "Sources/Info/Profile",
      resources: [
        .process("Resources"),
      ]
    ),
    .target(
      name: "Info",
      dependencies: [
        "Ignite",
        "SiteCore",
        "InfoProfile",
      ],
      path: "Sources/Info",
      exclude: [
        "Profile",
      ],
      resources: [
        .process("Resources"),
      ]
    ),
    .executableTarget(
      name: "rei315",
      dependencies: [
        "Ignite",
        "SiteCore",
        "App",
        "Develop",
        "Home",
        "Info",
      ],
      resources: [
        .process("Resources"),
      ]
    ),
  ]
)
