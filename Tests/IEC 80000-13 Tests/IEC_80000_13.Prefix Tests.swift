import IEC_80000_13
import Testing

enum `IEC.80000.13.Prefix Tests` {}

extension `IEC.80000.13.Prefix Tests` {
    @Suite
    struct Tests {

        @Test func `symbols and exponents`() {
            #expect(IEC.`80000`.`13`.Prefix.kibi.symbol == "Ki")
            #expect(IEC.`80000`.`13`.Prefix.kibi.exponent == 10)
            #expect(IEC.`80000`.`13`.Prefix.mebi.symbol == "Mi")
            #expect(IEC.`80000`.`13`.Prefix.gibi.symbol == "Gi")
            #expect(IEC.`80000`.`13`.Prefix.tebi.symbol == "Ti")
            #expect(IEC.`80000`.`13`.Prefix.pebi.symbol == "Pi")
            #expect(IEC.`80000`.`13`.Prefix.exbi.symbol == "Ei")
            #expect(IEC.`80000`.`13`.Prefix.zebi.symbol == "Zi")
            #expect(IEC.`80000`.`13`.Prefix.yobi.symbol == "Yi")
            #expect(IEC.`80000`.`13`.Prefix.yobi.exponent == 80)
        }

        @Test func `base is always two`() {
            for prefix in IEC.`80000`.`13`.Prefix.all {
                #expect(prefix.base == 2)
            }
        }

        @Test func `factor is the exact power of two`() {
            #expect(IEC.`80000`.`13`.Prefix.kibi.factor == 1024)
            #expect(IEC.`80000`.`13`.Prefix.mebi.factor == 1024 * 1024)
            #expect(IEC.`80000`.`13`.Prefix.gibi.factor == 1_073_741_824)

            #expect(IEC.`80000`.`13`.Prefix.yobi.factor == 1_208_925_819_614_629_174_706_176.0)
        }

        @Test func `exponents ascend by ten`() {
            let exponents = IEC.`80000`.`13`.Prefix.all.map(\.exponent)
            #expect(exponents == [10, 20, 30, 40, 50, 60, 70, 80])
        }

        @Test func `eight defined prefixes`() {
            #expect(IEC.`80000`.`13`.Prefix.all.count == 8)
        }

        @Test func `description is the symbol`() {
            #expect(String(describing: IEC.`80000`.`13`.Prefix.tebi) == "Ti")
        }
    }
}
