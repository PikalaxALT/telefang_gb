INCLUDE "macros/enum.asm"
INCLUDE "macros/wram.asm"

Bankswitch    EQU $10
MemBankswitch EQU $18
FarCall       EQU $20

text EQUS "db $00,"
line EQUS "db $fe,"
done EQUS "db $ff"

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

bigdw: MACRO
REPT _NARG
	db (\1 >> 8), (\1 & $ff)
	shift
ENDR
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

battle_struct: MACRO
\1Species:: ds 1
\1Level:: ds 1
\1CurHP:: ds 1
\1MaxHP:: ds 1
\1Speed:: ds 1
\1Field0x05:: ds 1
\1Field0x06:: ds 1
\1ArrivedStatus:: ds 1
\1Field0x08:: ds 1
\1Field0x09:: ds 1
\1Autonomy:: ds 1
\1Field0x0b:: ds 1
\1Field0x0c:: ds 1
\1Field0x0d:: ds 1
\1Attack:: ds 1
\1Defense:: ds 1
\1SpAtk:: ds 1
\1SpDef:: ds 1
\1Field0x12:: ds 1
\1SpeedCopy1:: ds 1
\1SpeedCopy2:: ds 1
\1Field0x15:: ds 1
ENDM

flag_array: MACRO
IF (\1 & $7) > 0
	ds (\1 >> 3) + 1
ELSE
	ds (\1 >> 3)
ENDC
ENDR
