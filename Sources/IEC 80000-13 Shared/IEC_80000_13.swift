// IEC_80000_13.swift
// IEC 80000-13: Quantities and units — Part 13: Information science and technology

/// IEC 80000-13 namespace.
///
/// IEC 80000-13:2008, "Quantities and units — Part 13: Information science and
/// technology", defines the units of information — the bit and the byte — and
/// the prefixes for binary multiples (kibi, mebi, gibi, …, yobi).
///
/// ## Topics
///
/// - ``Unit`` — units of information (bit, byte, octet, shannon)
/// - ``Prefix`` — prefixes for binary multiples (Ki, Mi, Gi, …, Yi)
///
/// ## Usage
///
/// ```swift
/// import IEC_80000_13
///
/// IEC_80000_13.Unit.byte.bits        // 8   (1 B = 8 bit)
/// IEC_80000_13.Prefix.kibi.factor    // 1024.0  (2¹⁰)
/// ```
///
/// ## Reference
///
/// IEC 80000-13:2008 — Quantities and units — Part 13: Information science and
/// technology.
public enum IEC_80000_13 {}
