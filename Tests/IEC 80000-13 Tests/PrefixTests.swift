// PrefixTests.swift

import IEC_80000_13
import Testing

@Suite("IEC 80000-13 Prefix")
struct PrefixTests {

  @Test("Symbols and exponents")
  func symbolsAndExponents() {
    #expect(IEC_80000_13.Prefix.kibi.symbol == "Ki")
    #expect(IEC_80000_13.Prefix.kibi.exponent == 10)
    #expect(IEC_80000_13.Prefix.mebi.symbol == "Mi")
    #expect(IEC_80000_13.Prefix.gibi.symbol == "Gi")
    #expect(IEC_80000_13.Prefix.tebi.symbol == "Ti")
    #expect(IEC_80000_13.Prefix.pebi.symbol == "Pi")
    #expect(IEC_80000_13.Prefix.exbi.symbol == "Ei")
    #expect(IEC_80000_13.Prefix.zebi.symbol == "Zi")
    #expect(IEC_80000_13.Prefix.yobi.symbol == "Yi")
    #expect(IEC_80000_13.Prefix.yobi.exponent == 80)
  }

  @Test("Base is always two")
  func baseIsTwo() {
    for prefix in IEC_80000_13.Prefix.all {
      #expect(prefix.base == 2)
    }
  }

  @Test("Factor is the exact power of two")
  func factor() {
    #expect(IEC_80000_13.Prefix.kibi.factor == 1024)
    #expect(IEC_80000_13.Prefix.mebi.factor == 1024 * 1024)
    #expect(IEC_80000_13.Prefix.gibi.factor == 1_073_741_824)
    // yobi = 2⁸⁰ — overflows UInt64 but is exact in Double.
    #expect(IEC_80000_13.Prefix.yobi.factor == 1_208_925_819_614_629_174_706_176.0)
  }

  @Test("Exponents ascend by ten")
  func exponentsAscend() {
    let exponents = IEC_80000_13.Prefix.all.map(\.exponent)
    #expect(exponents == [10, 20, 30, 40, 50, 60, 70, 80])
  }

  @Test("Eight defined prefixes")
  func count() {
    #expect(IEC_80000_13.Prefix.all.count == 8)
  }

  @Test("Description is the symbol")
  func description() {
    #expect(String(describing: IEC_80000_13.Prefix.tebi) == "Ti")
  }
}
