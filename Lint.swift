// swift-linter-tools-version: 0.1
// ===----------------------------------------------------------------------===//
//
// This source file is part of the swift-iec-80000-13 open source project
//
// Copyright (c) 2026 Coen ten Thije Boonkkamp and the swift-iec-80000-13 project authors
// Licensed under Apache License v2.0
//
// See LICENSE for license information
//
// ===----------------------------------------------------------------------===//

import Linter
import Linter_Institute_Rules

Lint.run(dependencies: [
    .package(
        path: "../../swift-foundations/swift-institute-linter-rules",
        products: ["Linter Institute Rules"]
    ),
]) {
    Lint.Rule.Bundle.institute
}
