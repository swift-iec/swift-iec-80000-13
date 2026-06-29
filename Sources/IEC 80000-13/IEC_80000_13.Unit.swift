// IEC_80000_13.Unit.swift
// IEC 80000-13 — Units of information

public import IEC_80000_13_Shared

extension IEC_80000_13 {
  /// A unit of information, as defined by IEC 80000-13.
  ///
  /// The ``bits`` property records the unit's size as a number of bits, which
  /// makes the standard's defining relation `1 B = 8 bit` explicit.
  ///
  /// ```swift
  /// IEC_80000_13.Unit.byte.symbol  // "B"
  /// IEC_80000_13.Unit.byte.bits    // 8
  /// ```
  ///
  /// ## Reference
  ///
  /// IEC 80000-13:2008 — item 13-9 (bit) and item 13-10 (byte); the octet and
  /// shannon are the related named units.
  public struct Unit: Sendable, Hashable {
    /// The full name of the unit (e.g. "byte").
    public let name: String

    /// The unit symbol (e.g. "B").
    public let symbol: String

    /// The size of the unit expressed in bits (e.g. 8 for the byte).
    public let bits: Int

    /// Creates a unit of information.
    ///
    /// - Parameters:
    ///   - name: The full name of the unit.
    ///   - symbol: The unit symbol.
    ///   - bits: The size of the unit expressed in bits.
    public init(name: String, symbol: String, bits: Int) {
      self.name = name
      self.symbol = symbol
      self.bits = bits
    }
  }
}

extension IEC_80000_13.Unit: CustomStringConvertible {
  public var description: String { symbol }
}

// MARK: - Defined Units (IEC 80000-13)

extension IEC_80000_13.Unit {
  /// bit — the bit, unit of information (symbol "bit"). 1 bit.
  public static let bit = Self(name: "bit", symbol: "bit", bits: 1)

  /// byte — eight bits (symbol "B"). 1 B = 8 bit.
  public static let byte = Self(name: "byte", symbol: "B", bits: 8)

  /// octet — eight bits (symbol "o"); the unambiguous synonym for an 8-bit byte.
  public static let octet = Self(name: "octet", symbol: "o", bits: 8)

  /// shannon — the unit of information content (symbol "Sh"); numerically one bit.
  public static let shannon = Self(name: "shannon", symbol: "Sh", bits: 1)

  /// All units of information defined by IEC 80000-13.
  public static let all: [Self] = [bit, byte, octet, shannon]
}
