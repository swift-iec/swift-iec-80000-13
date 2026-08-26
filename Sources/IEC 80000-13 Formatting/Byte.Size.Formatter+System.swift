public import Byte_Size_Formatter

extension Byte.Size.Formatter {

    public static func bytes(_ system: Byte.Size.System) -> Byte.Size.Formatter<Count> {
        Byte.Size.Formatter<Count>(scale: system.scale)
    }
}
