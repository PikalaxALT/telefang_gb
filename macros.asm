INCLUDE "macros/enum.asm"
INCLUDE "macros/wram.asm"

Bankswitch    EQU $10
MemBankswitch EQU $18
FarCall       EQU $20

RGB: MACRO
	dw ((\3) << 10) + ((\2) << 5) + (\1)
	ENDM


percent EQUS "* $ff / 100"

dr: MACRO
IF DEF(POWER)
INCBIN "baserom-power.gbc", \1, \2 - \1
ELSE
INCBIN "baserom-speed.gbc", \1, \2 - \1
ENDC
ENDM

callba_rst: MACRO
	ld a, BANK(\1)
	ld hl, \1
	rst FarCall
ENDM

callba: MACRO
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

dn: MACRO
	db ((\1 & $f) << 4) | (\2 & $f)
ENDM

ln: MACRO
	ld \1, ((\2 & $f) << 4) | (\3 & $f)
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

homecall_memret: MACRO
	ld a, BANK(\1)
	rst Bankswitch
REPT _NARG
	call \1
	shift
ENDR
	rst MemBankswitch
ENDM

homecall_memret_passa: MACRO
	push af
	ld a, BANK(\1)
	rst Bankswitch
	pop af
REPT _NARG
	call \1
	shift
ENDR
	rst MemBankswitch
ENDM

bgcoord: MACRO
IF _NARG >= 4
	ld \1, (\3 * BG_MAP_WIDTH) + \2 + \4
ELSE
	ld \1, (\3 * BG_MAP_WIDTH) + \2 + VBGMap
ENDC
ENDM

hlbgcoord EQUS "bgcoord hl,"
debgcoord EQUS "bgcoord de,"
bcbgcoord EQUS "bgcoord bc,"

dwbgcoord: MACRO
IF _NARG >= 3
	dw (\2 * BG_MAP_WIDTH) + \1 + \3
ELSE
	dw (\2 * BG_MAP_WIDTH) + \1 + VBGMap
ENDC
ENDM

check_cgb: MACRO
	ld a, [wCGB]
	cp $11
ENDM

addntimes_hl_de: MACRO
	cp $0
	jr z, .skip\@
.loop\@
	add hl, de
	dec a
	jr nz, .loop\@
.skip\@
ENDM

char_def: MACRO
cur_char = 0
ENDM

defchar: MACRO
	charmap \1, cur_char
cur_char = cur_char + 1
ENDM
