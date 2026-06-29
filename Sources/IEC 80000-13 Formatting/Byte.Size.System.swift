// Byte.Size.System.swift
// The byte-size unit system: binary (IEC) or decimal (SI).

public import Byte_Size_Format_Primitives
internal import IEC_80000_13
internal import ISO_80000_1

extension Byte.Size {
    /// The unit system a byte count is rendered against: binary or decimal.
    ///
    /// A byte-size unit system fixes two things at once — the radix of the
    /// prefix ladder, and the prefix symbols that name its rungs:
    ///
    /// - ``binary`` uses the IEC 80000-13 prefixes for binary multiples
    ///   (`Ki`, `Mi`, `Gi`, …), where each rung is `1024` (2¹⁰) times the one
    ///   below. `1024` bytes renders as `"1.0 KiB"`.
    /// - ``decimal`` uses the ISO 80000-1 SI decimal prefixes (`k`, `M`, `G`, …),
    ///   where each rung is `1000` (10³) times the one below. `1000` bytes
    ///   renders as `"1.0 kB"`.
    ///
    /// The system is the selector handed to ``Byte/Size/Format/bytes(_:)``:
    ///
    /// ```swift
    /// (5 * 1024 * 1024).formatted(.bytes(.binary))   // "5.0 MiB"
    /// (5 * 1024 * 1024).formatted(.bytes(.decimal))  // "5.2 MB"
    /// ```
    ///
    /// The unit symbol is `"B"` (the byte) in both systems, sourced from
    /// ``IEC_80000_13/Unit/byte``.
    public enum System: Sendable, Hashable {
        /// Binary multiples — the IEC 80000-13 prefix ladder (`KiB`, `MiB`, …),
        /// `1024` per rung.
        case binary

        /// Decimal multiples — the ISO 80000-1 SI prefix ladder (`kB`, `MB`, …),
        /// `1000` per rung.
        case decimal
    }
}

extension Byte.Size.System {
    /// The prefix ladder this system renders against, expressed as the injected
    /// ``Byte/Size/Scale`` the Layer-1 formatter consumes.
    ///
    /// The binary ladder is built from ``IEC_80000_13/Prefix/all`` (the IEC
    /// binary prefixes); the decimal ladder from the kilo-and-up SI multiples in
    /// ``ISO_80000_1/Prefix/multiples`` (exponents that are positive multiples of
    /// three — `kilo`, `mega`, … — never the sub-kilo `deca`/`hecto`). Each
    /// prefix's own exponent is divided down to the scale's per-rung tier index
    /// (`base = 1024` for binary, `1000` for decimal). The unit symbol is the
    /// byte symbol `"B"` from ``IEC_80000_13/Unit/byte``.
    internal var scale: Byte.Size.Scale {
        switch self {
        case .binary:
            // IEC prefixes: 2^(10·n). Scale radix 1024 = 2¹⁰; tier index = exponent / 10.
            Byte.Size.Scale(
                base: 1024,
                unitSymbol: IEC_80000_13.Unit.byte.symbol,
                tiers: IEC_80000_13.Prefix.all.map { prefix in
                    Byte.Size.Scale.Tier(exponent: prefix.exponent / 10, symbol: prefix.symbol)
                }
            )
        case .decimal:
            // SI multiples kilo-and-up: 10^(3·n). Scale radix 1000 = 10³; tier index = exponent / 3.
            Byte.Size.Scale(
                base: 1000,
                unitSymbol: IEC_80000_13.Unit.byte.symbol,
                tiers: ISO_80000_1.Prefix.multiples
                    .filter { $0.exponent % 3 == 0 }
                    .map { Byte.Size.Scale.Tier(exponent: $0.exponent / 3, symbol: $0.symbol) }
            )
        }
    }
}
