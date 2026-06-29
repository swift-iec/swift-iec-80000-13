// exports.swift
// Re-exports the byte-size formatting surface this package's public API builds on,
// so a consumer importing this module gets `.formatted(_:)` and `Byte.Size.Formatter`
// alongside the `.bytes(_:)` factory and the `Byte.Size.System` selector.

@_exported public import Byte_Size_Formatter_Primitives
