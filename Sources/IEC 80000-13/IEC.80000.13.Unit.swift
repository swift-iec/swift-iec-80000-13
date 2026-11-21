public import IEC_80000_13_Shared

extension IEC.`80000`.`13` {

    public struct Unit {

        public let name: String

        public let symbol: String

        public let bits: Int

        public init(name: String, symbol: String, bits: Int) {
            self.name = name
            self.symbol = symbol
            self.bits = bits
        }
    }
}

extension IEC.`80000`.`13`.Unit: Sendable {}
extension IEC.`80000`.`13`.Unit: Hashable {}

extension IEC.`80000`.`13`.Unit: CustomStringConvertible {
    public var description: String { symbol }
}

extension IEC.`80000`.`13`.Unit {

    public static let bit = Self(name: "bit", symbol: "bit", bits: 1)

    public static let byte = Self(name: "byte", symbol: "B", bits: 8)

    public static let octet = Self(name: "octet", symbol: "o", bits: 8)

    public static let shannon = Self(name: "shannon", symbol: "Sh", bits: 1)

    public static let all: [Self] = [bit, byte, octet, shannon]
}
