// swift-tools-version:5.0

import PackageDescription

let package = Package(
    name: "SwiftGraph",
    products: [
        .library(
            name: "SwiftGraph",
            targets: ["SwiftGraph"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections", from: "1.0.4"),
    ],
    targets: [
        .target(
            name: "SwiftGraph",
            dependencies: [
                .product(name: "DequeModule", package: "swift-collections")
            ]
        ),
        .testTarget(
            name: "SwiftGraphTests",
            dependencies: ["SwiftGraph"]
        ),
        .testTarget(
            name: "SwiftGraphPerformanceTests",
            dependencies: ["SwiftGraph"]
        ),
    ]
)
