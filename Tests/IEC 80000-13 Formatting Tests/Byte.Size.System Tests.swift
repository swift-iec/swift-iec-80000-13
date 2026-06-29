// Byte.Size.System Tests.swift

import IEC_80000_13_Formatting
import Testing

extension Byte.Size.System {
    @Suite("IEC 80000-13 byte-size formatting")
    struct Tests {

        // MARK: - Binary (IEC, 1024 per rung)

        @Test func `binary renders bytes below a kibibyte as bare B`() {
            #expect(512.formatted(.bytes(.binary)) == "512.0 B")
        }

        @Test func `binary renders an exact kibibyte`() {
            #expect(1024.formatted(.bytes(.binary)) == "1.0 KiB")
        }

        @Test func `binary renders a fractional kibibyte truncated`() {
            #expect(1536.formatted(.bytes(.binary)) == "1.5 KiB")
        }

        @Test func `binary renders mebibytes`() {
            // 5 MiB = 5 · 1024 · 1024 — the locked exemplar.
            #expect(5_242_880.formatted(.bytes(.binary)) == "5.0 MiB")
        }

        @Test func `binary renders an exact power-of-1024 mebibyte`() {
            #expect(1_048_576.formatted(.bytes(.binary)) == "1.0 MiB")
        }

        @Test func `binary renders gibibytes`() {
            #expect(1_073_741_824.formatted(.bytes(.binary)) == "1.0 GiB")
        }

        // MARK: - Decimal (SI, 1000 per rung)

        @Test func `decimal renders bytes below a kilobyte as bare B`() {
            #expect(512.formatted(.bytes(.decimal)) == "512.0 B")
        }

        @Test func `decimal renders an exact kilobyte`() {
            #expect(1000.formatted(.bytes(.decimal)) == "1.0 kB")
        }

        @Test func `decimal renders a fractional kilobyte truncated`() {
            #expect(1500.formatted(.bytes(.decimal)) == "1.5 kB")
        }

        @Test func `decimal renders megabytes`() {
            // Same 5 MiB byte count, decimal ladder: 5_242_880 / 1000² = 5.24…, truncated to 5.2.
            #expect(5_242_880.formatted(.bytes(.decimal)) == "5.2 MB")
        }

        @Test func `decimal renders an exact power-of-1000 megabyte`() {
            #expect(1_000_000.formatted(.bytes(.decimal)) == "1.0 MB")
        }

        @Test func `decimal renders gigabytes`() {
            #expect(1_000_000_000.formatted(.bytes(.decimal)) == "1.0 GB")
        }
    }
}
