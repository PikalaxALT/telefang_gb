INCLUDE "macros/enum.asm"
INCLUDE "macros/wram.asm"
INCLUDE "macros/sound.asm"

Bankswitch    EQU $10
MemBankswitch EQU $18
FarCall       EQU $20

text EQUS "db $00,"
txfn EQUS "db $e1,"
line EQUS "db $e2,"
done EQUS "db $e0"

TX_SPEED: MACRO
	db "<DELAY>"
	db \1
	ENDM

TX_CALL: MACRO
	db "<CALL>"
	dw \1
	ENDM

TX_DENJUU: MACRO
	db "<DENJUU>"
	db \1
	ENDM

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

ddb: MACRO
rept _NARG
	db \1, \1
	shift
endr
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
	jp FarCall_HL
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
REPT _NARG / 2
	db ((\1 & $f) << 4) | (\2 & $f)
	shift
	shift
ENDR
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

dwb: MACRO
	dw \1
	db \2
ENDM

dab: MACRO
	dwb \1, BANK(\1)
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

coord: MACRO
	ld \1, (\3 * (SCREEN_WIDTH / 2) + \2) + wOverworldMap
ENDM

hlcoord EQUS "coord hl,"
decoord EQUS "coord de,"
bccoord EQUS "coord bc,"

dwcoord: MACRO
	dw (\2 * (SCREEN_WIDTH / 2) + \1) + wOverworldMap
ENDM

check_cgb: MACRO
	ld a, [wCGB]
	cp $11
ENDM

inchlntimes: MACRO
	cp $0
	jr z, .skip\@
.loop\@
	inc hl
	dec a
	jr nz, .loop\@
.skip\@
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

flag_array: MACRO
IF (\1 & $7) > 0
	ds (\1 >> 3) + 1
ELSE
	ds (\1 >> 3)
ENDC
ENDM

jump_table: MACRO
IF _NARG >= 1
	ld hl, \1
ELSE
	ld hl, @ + 6
ENDC
	call GetWordFromTable
	jp [hl]
ENDM

overcoord: MACRO
	ld \1, (\3 * SCREEN_WIDTH / 2) + \2 + wOverworldMap
ENDM

hlovercoord EQUS "overcoord hl,"
deovercoord EQUS "overcoord de,"
bcovercoord EQUS "overcoord bc,"

Aovercoord: MACRO
	ld a, [(\2 * SCREEN_WIDTH / 2) + \1 + wOverworldMap]
ENDM

overcoordA: MACRO
	ld [(\2 * SCREEN_WIDTH / 2) + \1 + wOverworldMap], a
ENDM

enable_sram: MACRO
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
IF _NARG > 0
	ld a, BANK(\1)
	ld [MBC3SRamBank], a
ENDC
ENDM

disable_sram: MACRO
	ld a, SRAM_DISABLE
	ld [MBC3SRamEnable], a
ENDM
