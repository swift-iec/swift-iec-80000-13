# swift-iec-80000-13

Use this package when you need the units of information and the binary prefixes of IEC 80000-13, or want to show a byte count as a size such as `1.5 KiB` or `5.2 MB`. Start from `IEC_80000_13.Unit` and `IEC_80000_13.Prefix`. For formatting, add the `IEC 80000-13 Formatting` product and start from `Byte.Size.System`. For the SI decimal prefixes on their own, use swift-iso-80000-1.

## Laws

- Each binary prefix is a power of two, from kibi (2^10) to yobi (2^80). `IEC_80000_13.Prefix.factor` is exact for all of them, including yobi, which doesn't fit in a 64-bit integer.
- A prefix and a unit print as their symbol, such as `Ki` or `B`.
- A byte and an octet are both 8 bits. A shannon is numerically 1 bit.
- `Byte.Size.System.binary` steps by 1024 through the binary prefixes, giving `KiB`, `MiB` and so on. `Byte.Size.System.decimal` steps by 1000 through the SI prefixes, giving `kB` with a lowercase `k`, then `MB`, `GB`.
- The same count differs between the two: 5,242,880 bytes is `5.0 MiB` but `5.2 MB`.
- A size is always shown with one decimal place, including counts below the first step, which stay in plain bytes as `512.0 B`.
