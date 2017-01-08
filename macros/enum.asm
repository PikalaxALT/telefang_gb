enum_start: macro
if _NARG >= 1
__enum__ = \1
else
__enum__ = 0
endc
if _NARG >= 2
__enumdir__ = \2
else
__enumdir__ = +1
endc
endm

enum: macro
\1 = __enum__
__enum__ = __enum__ + __enumdir__
endm

enum_set: macro
__enum__ = \1
endm

const_def: MACRO
IF _NARG == 0
const_value SET 0
ELSE
const_value SET \1
ENDC
ENDM

const: MACRO
\1 EQU const_value
const_value SET const_value + 1
ENDM
