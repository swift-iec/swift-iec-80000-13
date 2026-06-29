// IEC_80000_13.Prefix.swift
// IEC 80000-13 — Prefixes for binary multiples (Clause 13)

public import IEC_80000_13_Shared

extension IEC_80000_13 {
  /// A prefix for binary multiples, as defined by IEC 80000-13.
  ///
  /// Each prefix denotes a power of two: its multiplicative ``factor`` is
  /// ``base`` (always 2) raised to ``exponent``. The factor is *derived* rather
  /// than stored, because the largest prefix (`yobi`, 2⁸⁰ ≈ 1.21 × 10²⁴)
  /// overflows every fixed-width integer up to `UInt64`. Every power of two is
  /// represented exactly by `Double`, so ``factor`` is exact for all defined
  /// prefixes.
  ///
  /// ```swift
  /// IEC_80000_13.Prefix.kibi.symbol   // "Ki"
  /// IEC_80000_13.Prefix.kibi.factor   // 1024.0  (2¹⁰)
  /// IEC_80000_13.Prefix.gibi.exponent // 30
  /// ```
  ///
  /// ## Reference
  ///
  /// IEC 80000-13:2008, Clause 13 — Prefixes for binary multiples.
  public struct Prefix: Sendable, Hashable {
    /// The full name of the prefix (e.g. "kibi").
    public let name: String

    /// The prefix symbol (e.g. "Ki").
    public let symbol: String

    /// The base of the power. Always 2 for IEC 80000-13 binary prefixes.
    public let base: Int

    /// The exponent applied to ``base`` (e.g. 10 for kibi).
    public let exponent: Int

    /// Creates a binary prefix.
    ///
    /// - Parameters:
    ///   - name: The full name of the prefix.
    ///   - symbol: The prefix symbol.
    ///   - base: The base of the power (2 for IEC 80000-13).
    ///   - exponent: The exponent applied to `base`.
    public init(name: String, symbol: String, base: Int, exponent: Int) {
      self.name = name
      self.symbol = symbol
      self.base = base
      self.exponent = exponent
    }
  }
}

extension IEC_80000_13.Prefix {
  /// The multiplicative factor — ``base`` raised to ``exponent`` — derived on demand.
  ///
  /// Computed by repeated multiplication so the type stays free of any platform
  /// math library. Powers of two are exact in `Double`, so no precision is lost
  /// even for `yobi` (2⁸⁰), which overflows `UInt64`.
  public var factor: Double {
    var result = 1.0
    let multiplier = Double(base)
    for _ in 0..<exponent { result *= multiplier }
    return result
  }
}

extension IEC_80000_13.Prefix: CustomStringConvertible {
  public var description: String { symbol }
}

// MARK: - Defined Prefixes (IEC 80000-13, Clause 13)

extension IEC_80000_13.Prefix {
  /// kibi — 2¹⁰ (Ki)
  public static let kibi = Self(name: "kibi", symbol: "Ki", base: 2, exponent: 10)

  /// mebi — 2²⁰ (Mi)
  public static let mebi = Self(name: "mebi", symbol: "Mi", base: 2, exponent: 20)

  /// gibi — 2³⁰ (Gi)
  public static let gibi = Self(name: "gibi", symbol: "Gi", base: 2, exponent: 30)

  /// tebi — 2⁴⁰ (Ti)
  public static let tebi = Self(name: "tebi", symbol: "Ti", base: 2, exponent: 40)

  /// pebi — 2⁵⁰ (Pi)
  public static let pebi = Self(name: "pebi", symbol: "Pi", base: 2, exponent: 50)

  /// exbi — 2⁶⁰ (Ei)
  public static let exbi = Self(name: "exbi", symbol: "Ei", base: 2, exponent: 60)

  /// zebi — 2⁷⁰ (Zi)
  public static let zebi = Self(name: "zebi", symbol: "Zi", base: 2, exponent: 70)

  /// yobi — 2⁸⁰ (Yi)
  public static let yobi = Self(name: "yobi", symbol: "Yi", base: 2, exponent: 80)

  /// All binary prefixes defined by IEC 80000-13, in ascending order.
  public static let all: [Self] = [kibi, mebi, gibi, tebi, pebi, exbi, zebi, yobi]
}
