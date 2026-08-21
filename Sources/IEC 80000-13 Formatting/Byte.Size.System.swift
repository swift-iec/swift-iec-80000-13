public import Byte_Size_Formatter_Primitives
internal import IEC_80000_13
internal import ISO_80000_1

extension Byte.Size {

    public enum System: Sendable, Hashable {

        case binary

        case decimal
    }
}

extension Byte.Size.System {

    internal var scale: Byte.Size.Scale {
        switch self {
        case .binary:

            Byte.Size.Scale(
                base: 1024,
                unitSymbol: IEC_80000_13.Unit.byte.symbol,
                tiers: IEC_80000_13.Prefix.all.map { prefix in
                    Byte.Size.Scale.Tier(exponent: prefix.exponent / 10, symbol: prefix.symbol)
                }
            )

        case .decimal:

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
