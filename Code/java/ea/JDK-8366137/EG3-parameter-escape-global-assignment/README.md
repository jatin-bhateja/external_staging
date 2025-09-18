Valhalla gets benefit from scalarized calling convention.
CompiledEntrySignature computes domain and range for both scalarized and non-scalarized CC.

On disabling inlining, we save allocation on caller side but due to escaping assignment in callee side we incur
materialization penalty, thus performance is at par with jdk mainline.
