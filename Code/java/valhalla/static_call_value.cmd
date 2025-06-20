
A) Pass non-scalarized fields.

java -Xbatch -XX:-TieredCompilation -XX:-PauseAtStartup  -XX:CompileCommand=Print,static_call_value::test -XX:CompileCommand=DontInline,static_call_value::micro  -XX:-InlineTypePassFieldsAsArgs -XX:+InlineTypeReturnedAsFields -XX:-UseOnStackReplacement -XX:-WizardMode -XX:+TraceCallFixup -XX:-PrintCompilation -XX:+TraceDeoptimization -cp . static_call_value

B) Pass scalarized fields

java -Xbatch -XX:-TieredCompilation -XX:-PauseAtStartup  -XX:CompileCommand=Print,static_call_value::test -XX:CompileCommand=DontInline,static_call_value::micro  -XX:+InlineTypePassFieldsAsArgs -XX:+InlineTypeReturnedAsFields -XX:-UseOnStackReplacement -XX:-WizardMode -XX:+TraceCallFixup -XX:-PrintCompilation -XX:+TraceDeoptimization -cp . static_call_value

C) Return non-scalarized fields.

java -Xbatch -XX:-TieredCompilation -XX:-PauseAtStartup  -XX:CompileCommand=Print,static_call_value::test -XX:CompileCommand=DontInline,static_call_value::micro  -XX:+InlineTypePassFieldsAsArgs -XX:-InlineTypeReturnedAsFields -XX:-UseOnStackReplacement -XX:-WizardMode -XX:+TraceCallFixup -XX:-PrintCompilation -XX:+TraceDeoptimization -cp . static_call_value

D) Return scalarized fields.

java -Xbatch -XX:-TieredCompilation -XX:-PauseAtStartup  -XX:CompileCommand=Print,static_call_value::test -XX:CompileCommand=DontInline,static_call_value::micro  -XX:+InlineTypePassFieldsAsArgs -XX:+InlineTypeReturnedAsFields -XX:-UseOnStackReplacement -XX:-WizardMode -XX:+TraceCallFixup -XX:-PrintCompilation -XX:+TraceDeoptimization -cp . static_call_value

E) Dont Inline any call. Disable inlining of value factory constructor also. Its effect can be seen in increased stack size.

