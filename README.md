# IEC 80000-13

A faithful, dependency-free Swift encoding of **IEC 80000-13** — *Quantities and
units — Part 13: Information science and technology*.

The standard defines two things this package models exactly:

- **Units of information** — the bit (`bit`) and the byte (`B`, where 1 B = 8 bit).
- **Prefixes for binary multiples** — kibi (`Ki` = 2¹⁰) through yobi (`Yi` = 2⁸⁰),
  the prefixes IEC 80000-13 introduced to disambiguate binary multiples from the
  SI decimal prefixes.

## Why

`1 KB` is ambiguous — is it 1000 or 1024 bytes? IEC 80000-13 resolved this by
defining a separate family of binary prefixes (`Ki`, `Mi`, `Gi`, …) for powers
of two. This package encodes those prefixes and the units of information *as the
standard defines them* — exact symbols, exact values — rather than as ad-hoc
constants scattered across a codebase.

```swift
import IEC_80000_13

IEC_80000_13.Unit.byte.symbol      // "B"
IEC_80000_13.Unit.byte.bits        // 8        (1 B = 8 bit)

IEC_80000_13.Prefix.kibi.symbol    // "Ki"
IEC_80000_13.Prefix.kibi.factor    // 1024.0   (2¹⁰)
IEC_80000_13.Prefix.gibi.exponent  // 30
```

## Modeling notes

Each binary prefix is modeled as a `(base: 2, exponent: Int)` pair plus its name
and symbol. The numeric `factor` is **derived on demand**, never stored as a
fixed-width integer: the largest prefix, yobi, is 2⁸⁰ ≈ 1.21 × 10²⁴, which
overflows `UInt64`. Because every power of two is exactly representable in
`Double`, `factor` is exact for all defined prefixes — including yobi.

The package imports nothing outside the Swift standard library (no Foundation),
in keeping with the layered architecture of the Swift Institute ecosystem.

## Installation

```swift
.package(url: "https://github.com/swift-iec/swift-iec-80000-13.git", branch: "main")
```

```swift
.product(name: "IEC 80000-13", package: "swift-iec-80000-13")
```

## Standard

This is an independent implementation of IEC 80000-13:2008. "IEC 80000-13" and
the standard's content are the work of the International Electrotechnical
Commission; this package is not affiliated with or endorsed by the IEC.

## License

Licensed under the Apache License, Version 2.0. See [LICENSE.md](./LICENSE.md).
