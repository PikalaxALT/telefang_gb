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
