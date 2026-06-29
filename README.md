# IEC 80000-13

![Development Status](https://img.shields.io/badge/status-active--development-blue.svg)

IEC 80000-13 for Swift — the units of information (the bit and the byte) and the prefixes for binary multiples (kibi through yobi), encoded exactly as the standard defines them, plus opt-in byte-size formatting against the binary (IEC) or decimal (SI) prefix ladder. Foundation-free.

---

## Quick Start

### Units and prefixes

`1 KB` is ambiguous — 1000 bytes or 1024? IEC 80000-13 resolved that by defining a separate family of binary prefixes (`Ki`, `Mi`, `Gi`, …) for powers of two, alongside the units of information. This package encodes those prefixes and units with their exact symbols and exact values, rather than as ad-hoc constants scattered across a codebase.

```swift
import IEC_80000_13

IEC_80000_13.Unit.byte.symbol      // "B"
IEC_80000_13.Unit.byte.bits        // 8        (1 B = 8 bit)

IEC_80000_13.Prefix.kibi.symbol    // "Ki"
IEC_80000_13.Prefix.kibi.factor    // 1024.0   (2¹⁰)
IEC_80000_13.Prefix.gibi.exponent  // 30
```

Each binary prefix is modeled as a `(base: 2, exponent: Int)` pair plus its name and symbol. The numeric `factor` is derived on demand, never stored as a fixed-width integer: the largest prefix, yobi, is 2⁸⁰ ≈ 1.21 × 10²⁴, which overflows `UInt64`. Because every power of two is exactly representable in `Double`, `factor` stays exact for every defined prefix — including yobi.

### Byte-size formatting

The `IEC 80000-13 Formatting` product renders a byte count as a human-readable storage magnitude. `.bytes(.binary)` selects the IEC binary prefix ladder (1024 per rung); `.bytes(.decimal)` selects the ISO 80000-1 SI decimal ladder (1000 per rung). The same count renders differently under each system:

```swift
import IEC_80000_13_Formatting

1024.formatted(.bytes(.binary))                // "1.0 KiB"
1536.formatted(.bytes(.binary))                // "1.5 KiB"
(5 * 1024 * 1024).formatted(.bytes(.binary))   // "5.0 MiB"

1000.formatted(.bytes(.decimal))               // "1.0 kB"
(5 * 1024 * 1024).formatted(.bytes(.decimal))  // "5.2 MB"
```

The formatter itself is the generic byte-size rendering algorithm from `swift-byte-formatter-primitives`; this product supplies the two concrete prefix ladders the standard implies — the IEC binary prefixes from this package, the SI decimal prefixes from `swift-iso-80000-1` — and binds them behind the `.bytes(_:)` selector. The pure data-model product pulls no formatter dependency; reach for `IEC 80000-13 Formatting` only when you want the rendering.

---

## Installation

```swift
dependencies: [
    .package(url: "https://github.com/swift-iec/swift-iec-80000-13.git", branch: "main")
]
```

```swift
.target(
    name: "App",
    dependencies: [
        .product(name: "IEC 80000-13", package: "swift-iec-80000-13"),
        // Opt in to byte-size formatting:
        .product(name: "IEC 80000-13 Formatting", package: "swift-iec-80000-13"),
    ]
)
```

Requires Swift 6.2 or later, and macOS 26 / iOS 26 / tvOS 26 / watchOS 26 / visionOS 26 (or the matching Linux / Windows toolchain).

---

## Architecture

The data model and the byte-size formatting live in separate products, so a consumer that needs only the units and prefixes pulls no formatter dependency.

| Product | Target | Purpose |
|---------|--------|---------|
| `IEC 80000-13` | `Sources/IEC 80000-13/` | The data model — `IEC_80000_13.Unit` (bit, byte, octet, shannon) and `IEC_80000_13.Prefix` (kibi … yobi). No external dependency. |
| `IEC 80000-13 Shared` | `Sources/IEC 80000-13 Shared/` | The `IEC_80000_13` namespace enum, re-exported by the module above. |
| `IEC 80000-13 Formatting` | `Sources/IEC 80000-13 Formatting/` | Opt-in byte-size formatting — the `.bytes(.binary)` / `.bytes(.decimal)` selectors and the `Byte.Size.System` enum. Binds the generic byte-size rendering algorithm to the IEC and SI prefix ladders. |

Built on `swift-byte-formatter-primitives` (for the generic byte-size rendering algorithm) and `swift-iso-80000-1` (for the SI decimal prefixes the decimal ladder renders against). Foundation-free.

---

## Platform Support

| Platform | Status |
|----------|--------|
| macOS 26 | Full support |
| Linux | Full support |
| Windows | Full support |
| iOS / tvOS / watchOS / visionOS | Supported |

---

## Standard

This is an independent implementation of IEC 80000-13:2008, *Quantities and units — Part 13: Information science and technology*. The standard and its content are the work of the International Electrotechnical Commission; this package is neither affiliated with nor endorsed by the IEC.

---

## Community

<!-- BEGIN: discussion -->
<!-- Discussion thread created at publication. -->
<!-- END: discussion -->

## License

Apache 2.0. See [LICENSE.md](LICENSE.md).
