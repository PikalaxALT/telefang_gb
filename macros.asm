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

callba_norst: MACRO
	ld a, BANK(\1)
	ld hl, \1
	call FarCall_HL
ENDM

jpba: MACRO
	ld a, BANK(\1)
	ld hl, \1
	jp FarJump_HL
ENDM

palettes EQUS "* 8"
tiles EQUS "* $10"
tile EQUS "+ $10 *"

lb: MACRO
	ld \1, ((\2 & $ff) << 8) | (\3 & $ff)
ENDM

dbw: MACRO
	db \1
	dw \2
ENDM

dba: MACRO
	dbw BANK(\1), \1
ENDM

homecall: MACRO
	ld a, [wROMBank]
	push af
	ld a, BANK(\1)
	rst Bankswitch
REPT _NARG
	call \1
	shift
ENDR
	pop af
	rst Bankswitch
ENDM
