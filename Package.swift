// swift-tools-version: 6.3

import PackageDescription

// IEC 80000-13: Quantities and units — Part 13: Information science and technology
let package = Package(
    name: "swift-iec-80000-13",
    platforms: [
        .macOS(.v26),
        .iOS(.v26),
        .tvOS(.v26),
        .watchOS(.v26),
        .visionOS(.v26)
    ],
    products: [
        .library(name: "IEC 80000-13", targets: ["IEC 80000-13"]),
        .library(name: "IEC 80000-13 Shared", targets: ["IEC 80000-13 Shared"]),
        .library(name: "IEC 80000-13 Formatting", targets: ["IEC 80000-13 Formatting"])
    ],
    dependencies: [
        .package(url: "https://github.com/swift-primitives/swift-byte-formatter-primitives.git", branch: "main"),
        .package(url: "https://github.com/swift-iso/swift-iso-80000-1.git", branch: "main")
    ],
    targets: [
        // MARK: - Shared
        .target(name: "IEC 80000-13 Shared"),

        // MARK: - Part 13: Information science and technology
        .target(
            name: "IEC 80000-13",
            dependencies: [
                "IEC 80000-13 Shared"
            ]
        ),

        // MARK: - Formatting (opt-in: byte-size formatting)
        //
        // Binds the Layer-1 byte-size rendering algorithm
        // (`Byte.Size.Formatter`/`Scale`, from swift-byte-formatter-primitives) to
        // concrete prefix ladders: the IEC 80000-13 binary prefixes (this
        // package) and the ISO 80000-1 SI decimal prefixes (lateral L2 dep).
        // Isolated from the pure data-model targets so they pull no formatter
        // dependency.
        .target(
            name: "IEC 80000-13 Formatting",
            dependencies: [
                "IEC 80000-13",
                .product(name: "Byte Size Formatter Primitives", package: "swift-byte-formatter-primitives"),
                .product(name: "ISO 80000-1", package: "swift-iso-80000-1")
            ]
        ),

        // MARK: - Tests
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
        .enableExperimentalFeature("SuppressedAssociatedTypes"),
    ]

    let package: [SwiftSetting] = []

    target.swiftSettings = (target.swiftSettings ?? []) + ecosystem + package
}
