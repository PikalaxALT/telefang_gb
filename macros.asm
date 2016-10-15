INCLUDE "macros/enum.asm"

Bankswitch    EQU $10
MemBankswitch EQU $18
FarCall       EQU $20

dr: MACRO
IF DEF(POWER)
INCBIN "baserom-power.gbc", \1, \2 - \1
ELSE
INCBIN "baserom-speed.gbc", \1, \2 - \1
ENDC
ENDM

callba: MACRO
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

jpba: MACRO
	ld a, BANK(\1)
	ld hl, \1
	jp FarJump_HL
ENDM

palettes EQUS "* 8"
