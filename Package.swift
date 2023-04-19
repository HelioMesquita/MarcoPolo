// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(name: "Marcopolo",
                      platforms: [.macOS(.v10_13),
                                  .iOS(.v11),
                                  .tvOS(.v11),
                                  .watchOS(.v4)],
                      products: [.library(name: "Marcopolo",
                                          targets: ["Marcopolo"])],
                      targets: [.target(name: "Marcopolo",
                                        path: "Source")
                                ],
                      swiftLanguageVersions: [.v5])
