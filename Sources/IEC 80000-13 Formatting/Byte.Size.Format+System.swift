// Byte.Size.Format+System.swift
// The `.bytes(_:)` call-site factory: a byte-size formatter for a unit system.

public import Byte_Size_Format_Primitives

extension Byte.Size.Format {
    /// A byte-size formatter for the given unit system.
    ///
    /// This is the call-site factory behind `count.formatted(.bytes(.binary))`
    /// and `count.formatted(.bytes(.decimal))`. It constructs a
    /// ``Byte/Size/Format`` whose injected ``Byte/Size/Scale`` is the system's
    /// prefix ladder — the IEC binary prefixes for ``Byte/Size/System/binary``,
    /// the SI decimal prefixes for ``Byte/Size/System/decimal``.
    ///
    /// ```swift
    /// (5 * 1024 * 1024).formatted(.bytes(.binary))   // "5.0 MiB"
    /// (5 * 1024 * 1024).formatted(.bytes(.decimal))  // "5.2 MB"
    /// ```
    ///
    /// - Parameter system: The unit system to render against.
    /// - Returns: A byte-size formatter bound to that system's prefix ladder.
    public static func bytes(_ system: Byte.Size.System) -> Byte.Size.Format<Count> {
        Byte.Size.Format<Count>(scale: system.scale)
    }
}
