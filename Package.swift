// swift-tools-version: 6.2

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
        .library(name: "IEC 80000-13 Shared", targets: ["IEC 80000-13 Shared"])
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

        // MARK: - Tests
        .testTarget(
            name: "IEC 80000-13 Tests",
            dependencies: [
                "IEC 80000-13"
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
