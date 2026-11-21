import IEC_80000_13
import Testing

enum `IEC.80000.13.Unit Tests` {}

extension `IEC.80000.13.Unit Tests` {
    @Suite
    struct Tests {

        @Test func `bit is one bit`() {
            #expect(IEC.`80000`.`13`.Unit.bit.symbol == "bit")
            #expect(IEC.`80000`.`13`.Unit.bit.bits == 1)
        }

        @Test func `byte is eight bits`() {
            #expect(IEC.`80000`.`13`.Unit.byte.symbol == "B")
            #expect(IEC.`80000`.`13`.Unit.byte.bits == 8)
        }

        @Test func `octet equals a byte`() {
            #expect(IEC.`80000`.`13`.Unit.octet.symbol == "o")
            #expect(IEC.`80000`.`13`.Unit.octet.bits == IEC.`80000`.`13`.Unit.byte.bits)
        }

        @Test func `shannon is numerically one bit`() {
            #expect(IEC.`80000`.`13`.Unit.shannon.symbol == "Sh")
            #expect(IEC.`80000`.`13`.Unit.shannon.bits == 1)
        }

        @Test func `four defined units`() {
            #expect(IEC.`80000`.`13`.Unit.all.count == 4)
        }

        @Test func `description is the symbol`() {
            #expect(String(describing: IEC.`80000`.`13`.Unit.byte) == "B")
        }
    }
}
