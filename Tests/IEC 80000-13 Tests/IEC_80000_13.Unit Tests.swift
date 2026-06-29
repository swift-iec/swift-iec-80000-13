// IEC_80000_13.Unit Tests.swift

import IEC_80000_13
import Testing

extension IEC_80000_13.Unit {
    @Suite("IEC 80000-13 Unit")
    struct Tests {

        @Test func `bit is one bit`() {
            #expect(IEC_80000_13.Unit.bit.symbol == "bit")
            #expect(IEC_80000_13.Unit.bit.bits == 1)
        }

        @Test func `byte is eight bits`() {
            #expect(IEC_80000_13.Unit.byte.symbol == "B")
            #expect(IEC_80000_13.Unit.byte.bits == 8)
        }

        @Test func `octet equals a byte`() {
            #expect(IEC_80000_13.Unit.octet.symbol == "o")
            #expect(IEC_80000_13.Unit.octet.bits == IEC_80000_13.Unit.byte.bits)
        }

        @Test func `shannon is numerically one bit`() {
            #expect(IEC_80000_13.Unit.shannon.symbol == "Sh")
            #expect(IEC_80000_13.Unit.shannon.bits == 1)
        }

        @Test func `four defined units`() {
            #expect(IEC_80000_13.Unit.all.count == 4)
        }

        @Test func `description is the symbol`() {
            #expect(String(describing: IEC_80000_13.Unit.byte) == "B")
        }
    }
}
