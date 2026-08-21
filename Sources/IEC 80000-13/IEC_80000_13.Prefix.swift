public import IEC_80000_13_Shared

extension IEC_80000_13 {

    public struct Prefix {

        public let name: String

        public let symbol: String

        public let base: Int

        public let exponent: Int

        public init(name: String, symbol: String, base: Int, exponent: Int) {
            self.name = name
            self.symbol = symbol
            self.base = base
            self.exponent = exponent
        }
    }
}

extension IEC_80000_13.Prefix: Sendable {}
extension IEC_80000_13.Prefix: Hashable {}

extension IEC_80000_13.Prefix {

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

extension IEC_80000_13.Prefix {

    public static let kibi = Self(name: "kibi", symbol: "Ki", base: 2, exponent: 10)

    public static let mebi = Self(name: "mebi", symbol: "Mi", base: 2, exponent: 20)

    public static let gibi = Self(name: "gibi", symbol: "Gi", base: 2, exponent: 30)

    public static let tebi = Self(name: "tebi", symbol: "Ti", base: 2, exponent: 40)

    public static let pebi = Self(name: "pebi", symbol: "Pi", base: 2, exponent: 50)

    public static let exbi = Self(name: "exbi", symbol: "Ei", base: 2, exponent: 60)

    public static let zebi = Self(name: "zebi", symbol: "Zi", base: 2, exponent: 70)

    public static let yobi = Self(name: "yobi", symbol: "Yi", base: 2, exponent: 80)

    public static let all: [Self] = [kibi, mebi, gibi, tebi, pebi, exbi, zebi, yobi]
}
