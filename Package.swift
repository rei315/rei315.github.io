// swift-tools-version:5.7

import PackageDescription

let package = Package(
    name: "Rei315GithubIo",
    platforms: [.macOS(.v12)],
    products: [
        .executable(
            name: "Rei315GithubIo",
            targets: ["Rei315GithubIo"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/JohnSundell/Publish.git", from: "0.9.0")
    ],
    targets: [
        .executableTarget(
            name: "Rei315GithubIo",
            dependencies: ["Publish"]
        )
    ]
)
