// UnitTests.swift

import IEC_80000_13
import Testing

@Suite("IEC 80000-13 Unit")
struct UnitTests {

  @Test("Bit is one bit")
  func bit() {
    #expect(IEC_80000_13.Unit.bit.symbol == "bit")
    #expect(IEC_80000_13.Unit.bit.bits == 1)
  }

  @Test("Byte is eight bits")
  func byte() {
    #expect(IEC_80000_13.Unit.byte.symbol == "B")
    #expect(IEC_80000_13.Unit.byte.bits == 8)
  }

  @Test("Octet equals a byte")
  func octet() {
    #expect(IEC_80000_13.Unit.octet.symbol == "o")
    #expect(IEC_80000_13.Unit.octet.bits == IEC_80000_13.Unit.byte.bits)
  }

  @Test("Shannon is numerically one bit")
  func shannon() {
    #expect(IEC_80000_13.Unit.shannon.symbol == "Sh")
    #expect(IEC_80000_13.Unit.shannon.bits == 1)
  }

  @Test("Four defined units")
  func count() {
    #expect(IEC_80000_13.Unit.all.count == 4)
  }

  @Test("Description is the symbol")
  func description() {
    #expect(String(describing: IEC_80000_13.Unit.byte) == "B")
  }
}
