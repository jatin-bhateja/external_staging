Valhalla gets benefit from scalarized calling convention.
CompiledEntrySignature computes domain and range for both scalarized and non-scalarized CC.

On disabling inlining, we still see 22% performance uplift with valhalla on account of argument scalarization
thereby saving allocation penalty.
