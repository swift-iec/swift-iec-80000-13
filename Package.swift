// swift-tools-version: 6.4

import PackageDescription

let package = Package(
    name: "swift-iec-80000-13",
    platforms: [
        .macOS(.v27),
        .iOS(.v27),
        .tvOS(.v27),
        .watchOS(.v27),
        .visionOS(.v27),
    ],
    products: [
        .library(name: "IEC 80000-13", targets: ["IEC 80000-13"]),
        .library(name: "IEC 80000-13 Shared", targets: ["IEC 80000-13 Shared"]),
        .library(name: "IEC 80000-13 Formatting", targets: ["IEC 80000-13 Formatting"]),
    ],
    dependencies: [
        .package(
            url: "https://github.com/swift-primitives/swift-byte-formatter-primitives.git",
            branch: "main"
        ),
        .package(url: "https://github.com/swift-iso/swift-iso-80000-1.git", branch: "main"),
    ],
    targets: [

        .target(name: "IEC 80000-13 Shared"),

        .target(
            name: "IEC 80000-13",
            dependencies: [
                "IEC 80000-13 Shared"
            ]
        ),

        .target(
            name: "IEC 80000-13 Formatting",
            dependencies: [
                "IEC 80000-13",
                .product(
                    name: "Byte Size Formatter Primitives",
                    package: "swift-byte-formatter-primitives"
                ),
                .product(name: "ISO 80000-1", package: "swift-iso-80000-1"),
            ]
        ),

        .testTarget(
            name: "IEC 80000-13 Tests",
            dependencies: [
                "IEC 80000-13"
            ]
        ),
        .testTarget(
            name: "IEC 80000-13 Formatting Tests",
            dependencies: [
                "IEC 80000-13 Formatting"
            ]
        ),
    ],
    swiftLanguageModes: [.v6]
)

for target in package.targets where ![.system, .binary, .plugin, .macro].contains(target.type) {
    let ecosystem: [SwiftSetting] = [
        .strictMemorySafety(),
        .enableUpcomingFeature("ExistentialAny"),
        .enableUpcomingFeature("InternalImportsByDefault"),
        .enableUpcomingFeature("MemberImportVisibility"),
        .enableUpcomingFeature("NonisolatedNonsendingByDefault"),
        .enableExperimentalFeature("Lifetimes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
