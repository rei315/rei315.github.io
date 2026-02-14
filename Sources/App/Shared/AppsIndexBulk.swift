//
// AppsIndexBulk.swift
// rei315.github.io
//
// Created by rei315 on 2026/02/02.
//

import Ignite

extension AppsIndex {
  static var paginationSamples: [AppsEntry] {
    [
      AppsEntry(
        id: "sample-01",
        title: "Sample App 01",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pulsenotes.svg",
        features: ["Feature 01-A", "Feature 01-B", "Feature 01-C"],
        stack: ["SwiftUI", "TestKit 01", "Prototype 01"]
      ) {
        Text("Placeholder detail page for pagination test entry 01.")
      },
      AppsEntry(
        id: "sample-02",
        title: "Sample App 02",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-orbit-tasks.svg",
        features: ["Feature 02-A", "Feature 02-B", "Feature 02-C"],
        stack: ["SwiftUI", "TestKit 02", "Prototype 02"]
      ) {
        Text("Placeholder detail page for pagination test entry 02.")
      },
      AppsEntry(
        id: "sample-03",
        title: "Sample App 03",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-wavecast.svg",
        features: ["Feature 03-A", "Feature 03-B", "Feature 03-C"],
        stack: ["SwiftUI", "TestKit 03", "Prototype 03"]
      ) {
        Text("Placeholder detail page for pagination test entry 03.")
      },
      AppsEntry(
        id: "sample-04",
        title: "Sample App 04",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pocket-studio.svg",
        features: ["Feature 04-A", "Feature 04-B", "Feature 04-C"],
        stack: ["SwiftUI", "TestKit 04", "Prototype 04"]
      ) {
        Text("Placeholder detail page for pagination test entry 04.")
      },
      AppsEntry(
        id: "sample-05",
        title: "Sample App 05",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-maple-trails.svg",
        features: ["Feature 05-A", "Feature 05-B", "Feature 05-C"],
        stack: ["SwiftUI", "TestKit 05", "Prototype 05"]
      ) {
        Text("Placeholder detail page for pagination test entry 05.")
      },
      AppsEntry(
        id: "sample-06",
        title: "Sample App 06",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-framestack.svg",
        features: ["Feature 06-A", "Feature 06-B", "Feature 06-C"],
        stack: ["SwiftUI", "TestKit 06", "Prototype 06"]
      ) {
        Text("Placeholder detail page for pagination test entry 06.")
      },
      AppsEntry(
        id: "sample-07",
        title: "Sample App 07",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pulsenotes.svg",
        features: ["Feature 07-A", "Feature 07-B", "Feature 07-C"],
        stack: ["SwiftUI", "TestKit 07", "Prototype 07"]
      ) {
        Text("Placeholder detail page for pagination test entry 07.")
      },
      AppsEntry(
        id: "sample-08",
        title: "Sample App 08",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-orbit-tasks.svg",
        features: ["Feature 08-A", "Feature 08-B", "Feature 08-C"],
        stack: ["SwiftUI", "TestKit 08", "Prototype 08"]
      ) {
        Text("Placeholder detail page for pagination test entry 08.")
      },
      AppsEntry(
        id: "sample-09",
        title: "Sample App 09",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-wavecast.svg",
        features: ["Feature 09-A", "Feature 09-B", "Feature 09-C"],
        stack: ["SwiftUI", "TestKit 09", "Prototype 09"]
      ) {
        Text("Placeholder detail page for pagination test entry 09.")
      },
      AppsEntry(
        id: "sample-10",
        title: "Sample App 10",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pocket-studio.svg",
        features: ["Feature 10-A", "Feature 10-B", "Feature 10-C"],
        stack: ["SwiftUI", "TestKit 10", "Prototype 10"]
      ) {
        Text("Placeholder detail page for pagination test entry 10.")
      },
      AppsEntry(
        id: "sample-11",
        title: "Sample App 11",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-maple-trails.svg",
        features: ["Feature 11-A", "Feature 11-B", "Feature 11-C"],
        stack: ["SwiftUI", "TestKit 11", "Prototype 11"]
      ) {
        Text("Placeholder detail page for pagination test entry 11.")
      },
      AppsEntry(
        id: "sample-12",
        title: "Sample App 12",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-framestack.svg",
        features: ["Feature 12-A", "Feature 12-B", "Feature 12-C"],
        stack: ["SwiftUI", "TestKit 12", "Prototype 12"]
      ) {
        Text("Placeholder detail page for pagination test entry 12.")
      },
      AppsEntry(
        id: "sample-13",
        title: "Sample App 13",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pulsenotes.svg",
        features: ["Feature 13-A", "Feature 13-B", "Feature 13-C"],
        stack: ["SwiftUI", "TestKit 13", "Prototype 13"]
      ) {
        Text("Placeholder detail page for pagination test entry 13.")
      },
      AppsEntry(
        id: "sample-14",
        title: "Sample App 14",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-orbit-tasks.svg",
        features: ["Feature 14-A", "Feature 14-B", "Feature 14-C"],
        stack: ["SwiftUI", "TestKit 14", "Prototype 14"]
      ) {
        Text("Placeholder detail page for pagination test entry 14.")
      },
      AppsEntry(
        id: "sample-15",
        title: "Sample App 15",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-wavecast.svg",
        features: ["Feature 15-A", "Feature 15-B", "Feature 15-C"],
        stack: ["SwiftUI", "TestKit 15", "Prototype 15"]
      ) {
        Text("Placeholder detail page for pagination test entry 15.")
      },
      AppsEntry(
        id: "sample-16",
        title: "Sample App 16",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pocket-studio.svg",
        features: ["Feature 16-A", "Feature 16-B", "Feature 16-C"],
        stack: ["SwiftUI", "TestKit 16", "Prototype 16"]
      ) {
        Text("Placeholder detail page for pagination test entry 16.")
      },
      AppsEntry(
        id: "sample-17",
        title: "Sample App 17",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-maple-trails.svg",
        features: ["Feature 17-A", "Feature 17-B", "Feature 17-C"],
        stack: ["SwiftUI", "TestKit 17", "Prototype 17"]
      ) {
        Text("Placeholder detail page for pagination test entry 17.")
      },
      AppsEntry(
        id: "sample-18",
        title: "Sample App 18",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-framestack.svg",
        features: ["Feature 18-A", "Feature 18-B", "Feature 18-C"],
        stack: ["SwiftUI", "TestKit 18", "Prototype 18"]
      ) {
        Text("Placeholder detail page for pagination test entry 18.")
      },
      AppsEntry(
        id: "sample-19",
        title: "Sample App 19",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-pulsenotes.svg",
        features: ["Feature 19-A", "Feature 19-B", "Feature 19-C"],
        stack: ["SwiftUI", "TestKit 19", "Prototype 19"]
      ) {
        Text("Placeholder detail page for pagination test entry 19.")
      },
      AppsEntry(
        id: "sample-20",
        title: "Sample App 20",
        summary: "Pagination test entry for the Apps list.",
        tagline: "Placeholder build for paging.",
        iconPath: "/images/app-orbit-tasks.svg",
        features: ["Feature 20-A", "Feature 20-B", "Feature 20-C"],
        stack: ["SwiftUI", "TestKit 20", "Prototype 20"]
      ) {
        Text("Placeholder detail page for pagination test entry 20.")
    }
    ]
  }
}
