INCLUDE "includes.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

INCLUDE "home.asm"

SECTION "bank 02", ROMX, BANK [$2]
Func_8000::
	ld a, [wSubroutine]
	jump_table
	dw Func_801a
	dw Func_8032
	dw Func_8061
	dw Func_8069
	dw Func_807c
	dw Func_808e
	dw Func_80a0
	dw Func_80b5

Func_801a::
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $7
	call DecompressGFXByIndex_
	ld bc, $8
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_8032::
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $f
	call GetCGB_BGLayout_
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	jp IncrementSubroutine

Func_8061::
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_8069::
	ld a, $2
	call PaletteFade_
	or a
	ret z
	ld c, $2
	ld b, $0
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine

Func_807c::
	ld a, [hJoyNew]
	and START
	jr nz, .start
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
.start
	jp IncrementSubroutine

Func_808e::
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	jp IncrementSubroutine

Func_80a0::
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_80b5::
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

INCLUDE "engine/intro_movie.asm"

Func_84cf: ; 84cf (2:44cf)
	ld a, [wSubroutine]
	jump_table
	dw Func_84e9
	dw Func_8501
	dw Func_8530
	dw Func_8538
	dw Func_854b
	dw Func_855d
	dw Func_856f
	dw Func_8584

Func_84e9::
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $7
	call DecompressGFXByIndex_
	ld bc, $8
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_8501::
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $f
	call GetCGB_BGLayout_
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	jp IncrementSubroutine

Func_8530::
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_8538::
	ld a, $2
	call PaletteFade_
	or a
	ret z
	ld c, $2
	ld b, $0
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine

Func_854b::
	ld a, [hJoyNew]
	and START
	jr nz, .asm_855a
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
.asm_855a
	jp IncrementSubroutine

Func_855d::
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	jp IncrementSubroutine

Func_856f::
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_8584::
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

INCLUDE "engine/game_over.asm"

Func_8630::
	ld hl, $0
	add hl, de
	inc hl
	jp Func_863f

Func_8638: ; 8638 (2:4638)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hli], a
Func_863f: ; 863f (2:463f)
	ld a, $0
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Func_8648: ; 8648 (2:4648)
	ld a, [wSubroutine]
	cp $1c
	ret z
	cp $22
	ret z
	cp $10
	jr nz, .asm_8663
	ld a, [wSubroutine2]
	cp $e
	ret z
	cp $f
	ret z
	cp $15
	ret z
	jr .asm_867d

.asm_8663
	ld a, [wSubroutine]
	cp $16
	jr nz, .asm_8670
	ld a, [wSubroutine2]
	cp $9
	ret z
.asm_8670
	ld a, [wSubroutine]
	cp $18
	jr nz, .asm_867d
	ld a, [wSubroutine2]
	cp $6
	ret z
.asm_867d
	ld a, [wc3df]
	or a
	ret nz
	ld a, [hJoyNew]
	and ($FF ^ (START | SELECT))
	jr z, .load_gray_hue
	xor a
	ld [wcb74], a
	ld a, [wcb75]
	or a
	ret z
	ld hl, sBGPalsBackup
	ld de, wCGB_BGPalsBuffer
	ld bc, sBGPalsBackupEnd - sBGPalsBackup
	call CopyBGPalBufferToOrFromBackup
	ld a, $1
	ld [wBGPalUpdate], a
	xor a
	ld [wcb75], a
	ret

.load_gray_hue
	ld a, [wcb75]
	or a
	ret nz
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wcb74]
	inc a
	ld [wcb74], a
	cp $c8
	ret nz
	ld hl, wCGB_BGPalsBuffer
	ld de, sBGPalsBackup
	ld bc, sBGPalsBackupEnd - sBGPalsBackup
	call CopyBGPalBufferToOrFromBackup
	call LoadGrayHue
	ld bc, $348
	ld a, $7
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $1
	ld [wcb75], a
	xor a
	ld [wcb74], a
	ret

Dummy_CopyBGPalBufferToOrFromBackup:
	enable_sram sBGPalsBackup
.asm_86ec
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_86ec
	xor a
	ld [MBC3SRamEnable], a
	ret

CopyBGPalBufferToOrFromBackup: ; 86f9 (2:46f9)
	enable_sram sBGPalsBackup
.asm_8703
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_8703
	xor a
	ld [MBC3SRamEnable], a
	ret

LoadGrayHue: ; 8710 (2:4710)
	ld hl, wCGB_BGPalsBuffer + 1 palettes + 4
	ld b, $6
.loop
	ld de, .Palette
	ld a, b
	cp $5
	jr z, .next
	push hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	pop hl
.next
	ld de, 1 palettes
	add hl, de
	dec b
	jr nz, .loop
	ret

.Palette RGB 20, 21, 14

Func_872e: ; 872e (2:472e)
	ld c, $10
	ld b, $0
Func_8732: ; 8732 (2:4732)
	push bc
	push bc
	ld a, [wDMeloPage]
	swap a
	and $f0
	add b
	ld hl, wDMeloBuffer + 2
	call Func_881b
	ld a, [hli]
	cp $fe
	jp z, Func_87ba
	ld [wcb20], a
	ld a, [hl]
	ld [wcb21], a
	pop bc
	ld a, b
	ld hl, Pointers_47e2
	call Func_881b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	push hl
	ld a, [wcb20]
	swap a
	and $f
	ld hl, Data_8802
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	call WaitStatAndLoad
	push hl
	ld a, [wcb20]
	swap a
	and $f
	cp $4
	jr z, .asm_878c
	cp $b
	jr z, .asm_878c
	cp $c
	jr nz, .asm_8787
	ld a, $52
	jr .asm_879b

.asm_8787
	ld hl, Data_880f
	jr .asm_878f

.asm_878c
	ld hl, Data_8815
.asm_878f
	ld a, [wcb21]
	swap a
	and $f
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
.asm_879b
	pop hl
	call WaitStatAndLoad
	pop hl
	ld de, $20
	add hl, de
	ld a, [wcb21]
	and $7
	adc $4d
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
Func_87b3: ; 87b3 (2:47b3)
	pop bc
	inc b
	dec c
	jp nz, Func_8732
	ret

Func_87ba: ; 87ba (2:47ba)
	pop bc
	ld a, b
	ld hl, Pointers_47e2
	call Func_881b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, $52
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
	ld a, $52
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
	jp Func_87b3

Pointers_47e2:
	dwbgcoord  1,  6
	dwbgcoord  3,  6
	dwbgcoord  5,  6
	dwbgcoord  7,  6
	dwbgcoord  1,  8
	dwbgcoord  3,  8
	dwbgcoord  5,  8
	dwbgcoord  7,  8
	dwbgcoord  1, 10
	dwbgcoord  3, 10
	dwbgcoord  5, 10
	dwbgcoord  7, 10
	dwbgcoord  1, 12
	dwbgcoord  3, 12
	dwbgcoord  5, 12
	dwbgcoord  7, 12

Data_8802:
	db $40, $40, $41, $41, $42, $43, $43, $44, $44, $45, $45, $46, $47
Data_880f:
	db $52, $4c, $49, $4b, $48, $4a
Data_8815:
	db $52, $49, $48, $52, $49, $48

Func_881b: ; 881b (2:481b)
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ret

Func_8824: ; 8824 (2:4824)
	ld a, [wSubroutine]
	jump_table
	dw Func_883e
	dw Func_885b
	dw Func_8883
	dw Func_8890
	dw Func_889f
	dw Func_88a7
	dw Func_88b6
	dw Func_88c3

Func_883e:
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_885b:
	ld a, [wSCX]
	ld [wc3f0], a
	ld a, [wSCY]
	ld [wc3f1], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	call Func_88fb
	ld hl, VTilesOB
	ld de, VTilesShared
	ld bc, $80 tiles
	call SwapVideoData
	call Func_88da
	jp IncrementSubroutine

Func_8883:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	jp IncrementSubroutine

Func_8890:
	ld hl, VTilesShared
	ld de, VTilesOB
	ld bc, $80 tiles
	call SwapVideoData
	jp IncrementSubroutine

Func_889f:
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	jp IncrementSubroutine

Func_88a7:
	ld hl, VTilesShared
	ld de, VTilesBG
	ld bc, $80 tiles
	call SwapVideoData
	jp IncrementSubroutine

Func_88b6:
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_88c3:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wGameRoutine], a
	ld [wSubroutine], a
	ret

Func_88d2:
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_88da: ; 88da (2:48da)
	ld hl, VBGMap
	ld c, $8
	ld d, $80
Func_88e1: ; 88e1 (2:48e1)
	push hl
	ld b, $10
.asm_88e4
	ld a, d
	di
	call WaitStat
	ld [hli], a
	ei
	inc d
	dec b
	jr nz, .asm_88e4
	pop hl
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	dec c
	jp nz, Func_88e1
	ret

Func_88fb: ; 88fb (2:48fb)
	ld hl, VBGMap
	ld c, $12
Func_8900: ; 8900 (2:4900)
	push hl
	ld b, $14
.asm_8903
	xor a
	di
	call WaitStat
	ld [hli], a
	ei
	dec b
	jr nz, .asm_8903
	pop hl
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	dec c
	jp nz, Func_8900
	ret

SwapVideoData: ; 8919 (2:4919)
.loop
	di
	call WaitStat
	ld a, [de]
	ei
	ld [wFontSourceBank], a
	di
	call WaitStat
	ld a, [hl]
	ei
	di
	call WaitStat
	ld [de], a
	ei
	ld a, [wFontSourceBank]
	di
	call WaitStat
	ld [hl], a
	ei
	inc de
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

INCLUDE "engine/title_screen.asm"
INCLUDE "engine/stats_screen.asm"
INCLUDE "engine/opening_logos.asm"

SECTION "bank 03", ROMX, BANK [$3]

INCLUDE "engine/sgb.asm"
INCLUDE "engine/color.asm"

Func_f9b6:
	push hl
	push de
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wNumCGBPalettesToFade]
	and $f0
	or a
	jr z, .asm_f9cf
	swap a
	add "0"
	call WaitStatAndLoad
	jr .asm_f9d3

.asm_f9cf
	xor a
	call WaitStatAndLoad
.asm_f9d3
	ld a, [wNumCGBPalettesToFade]
	and $f
	add "0"
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_f9e1:
	call Random
	ld a, [wRandomSample]
	ld h, $0
	ld l, a
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wc452], a
	ld a, [wc441]
	ld h, $0
	ld l, a
	ld d, $a
	call Func_15b0
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wc453], a
	ld a, [wc441]
	ld h, $0
	ld l, a
	ld d, $a
	call Func_15b0
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wCGBPalFadeBufferPointer], a
	ld h, $0
	ld a, [wc452]
	ld l, a
	ld d, $64
	call Func_15b0
	push hl
	ld h, $0
	ld a, [wc453]
	ld l, a
	ld d, $a
	call Func_15b0
	ld b, h
	ld c, l
	pop hl
	add hl, bc
	ld b, $0
	ld a, [wCGBPalFadeBufferPointer]
	ld c, a
	add hl, bc
	ld a, l
	ld [wFontSourceBank], a
	ret

Func_fa4b:
	push hl
	push de
	push bc
	xor a
	ld [wc452], a
	ld a, b
	ld [wc442], a
	ld a, c
	ld [wc443], a
	ld bc, $3e8
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fa77
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fa8e

.asm_fa77
	add $bb
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc452], a
.asm_fa8e
	ld a, [wCGBFade_PalLimit]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $64
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fac0
	ld a, [wc452]
	or a
	jr z, .asm_faab
	xor a
	jr .asm_fac0

.asm_faab
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fadb

.asm_fac0
	add "0"
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc452], a
.asm_fadb
	ld a, [wCGBFade_PalLimit]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $a
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fb0d
	ld a, [wc452]
	or a
	jr z, .asm_faf8
	xor a
	jr .asm_fb0d

.asm_faf8
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $2
	add hl, bc
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fb23

.asm_fb0d
	add "0"
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $2
	add hl, bc
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
.asm_fb23
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $3
	add hl, bc
	ld a, [wc441]
	add "0"
	di
	call WaitStat
	ld [hl], a
	ei
	pop bc
	pop de
	pop hl
	ret

SaveGame: ; fb3e (3:7b3e)
	enable_sram
	xor a
	ld [MBC3SRamBank], a
	ld hl, wOverworldData
	ld de, sOverworldData
	ld bc, wOverworldDataEnd - wOverworldData
	call CopyData
	ld hl, wScriptData
	ld de, sScriptData
	ld bc, wScriptDataEnd - wScriptData
	call CopyData
	ld hl, wEventFlags
	ld de, sEventFlags
IF (NUM_EVENTS & 7) > 0
	ld bc, (NUM_EVENTS >> 3) + 1
ELSE
	ld bc, (NUM_EVENTS >> 3)
ENDC
	call CopyData
	ld hl, sAddressBook
	ld de, sBackupAddressBook
	ld bc, $1900
	ld a, BANK(sAddressBook)
	ld [wFontSourceBank], a
	xor a
	ld [wFontSourceAddr], a
	call SaveAndLoadGame_FarCopySRAMDouble
	call CalculateChecksum
	ld a, $1
	ld [sSaveFileExists], a
	xor a
	ld [MBC3SRamEnable], a
	ret

LoadGame: ; fb8d (3:7b8d)
	enable_sram
	xor a
	ld [MBC3SRamBank], a
	ld hl, sOverworldData
	ld de, wPhoneCallSubroutine
	ld bc, $80
	call CopyData
	ld hl, sScriptData
	ld de, wcd00
	ld bc, $100
	call CopyData
	ld hl, sEventFlags
	ld de, wEventFlags
IF (NUM_EVENTS & 7) > 0
	ld bc, (NUM_EVENTS >> 3) + 1
ELSE
	ld bc, (NUM_EVENTS >> 3)
ENDC
	call CopyData
	ld hl, sBackupAddressBook
	ld de, sAddressBook
	ld bc, $1900
	xor a
	ld [wFontSourceBank], a
	ld a, BANK(sAddressBook)
	ld [wFontSourceAddr], a
	call SaveAndLoadGame_FarCopySRAMDouble
	xor a
	ld [MBC3SRamEnable], a
	ld a, [wc926]
	ld [wMapGroup], a
	ld a, [wc927]
	ld [wMapNumber], a
	ld a, [wc928]
	ld [wc901], a
	ld a, [wc929]
	ld [wc902], a
	ret

SaveAndLoadGame_FarCopySRAMDouble:
.loop
	ld a, [wFontSourceBank]
	ld [MBC3SRamBank], a
	ld a, [hli]
	push af
	ld a, [wFontSourceAddr]
	ld [MBC3SRamBank], a
	pop af
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

SECTION "bank 04", ROMX, BANK [$4]
INCLUDE "engine/phone_menu.asm"

SECTION "bank 05", ROMX, BANK [$5]
INCLUDE "battle/core.asm"

SECTION "bank 06", ROMX, BANK [$6]
macro_18000: MACRO
	dbw \1, \2 ; bank, VRAM dest
	db 0
ENDM

CompressedGFXBanksAndDests::
	macro_18000 $00,                   VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile01), VTilesOB tile $10
	macro_18000 BANK(UnknownTZFile02), VTilesShared tile $4d
	macro_18000 BANK(UnknownTZFile03), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile04), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile05), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile06), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile07), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile08), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile09), VTilesShared tile $38
	macro_18000 BANK(UnknownTZFile10), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile11), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile12), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile13), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile14), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile15), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile16), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile17), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile18), VTilesShared tile $70
	macro_18000 BANK(UnknownTZFile19), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile20), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile21), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile22), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile23), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile24), VTilesBG tile $60
	macro_18000 BANK(UnknownTZFile25), VTilesShared tile $38
	macro_18000 BANK(UnknownTZFile26), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile27), VTilesShared tile $60
	macro_18000 $36,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile29), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile30), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile31), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile32), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile33), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile34), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile35), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile36), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile37), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile38), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile39), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile40), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile41), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile42), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile43), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile44), VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile48), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile49), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile50), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile51), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile52), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile53), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile54), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile55), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile56), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile57), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile58), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile59), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile60), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile61), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile62), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile63), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile64), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile65), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile66), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile67), VTilesShared tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile72), VTilesShared tile $70
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile80), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile81), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile82), VTilesBG tile $00
	macro_18000 $37,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile84), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile85), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile86), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile87), VTilesShared tile $70
	macro_18000 BANK(UnknownTZFile88), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile89), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile90), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile91), VTilesShared tile $70
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00

INCLUDE "data/map_data_18180.asm"
INCLUDE "data/map_data_18ba1.asm"

SECTION "bank 07", ROMX, BANK [$7]
PalPackets_1c000:: INCLUDE "data/pal_packets.asm"

SECTION "bank 08", ROMX, BANK [$8]
IF DEF(POWER)
INCLUDE "data/unknown_20000.power.asm"
ELSE
INCLUDE "data/unknown_20000.speed.asm"
ENDC

SECTION "bank 09", ROMX, BANK [$9]
IF DEF(POWER)
INCLUDE "data/unknown_24000.power.asm"
ELSE
INCLUDE "data/unknown_24000.speed.asm"
ENDC

SECTION "bank 0A", ROMX, BANK [$a]
INCLUDE "data/oam_templates_0.asm"

SECTION "bank 0B", ROMX, BANK [$b]
LinkBattleRNs::
INCLUDE "data/pseudo_rng.asm"
INCLUDE "engine/text.asm"

OverworldRandom8: ; 2d8c1 (b:58c1)
; Return as signed char a
	push hl
	ld a, [wOverworldRandomCounter]
	inc a
	and $3f
	ld [wOverworldRandomCounter], a
	ld hl, Data_2d8eb
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld hl, wOverworldRandomSeed
	add [hl]
	cpl
	swap a
	ld [hl], a
	pop hl
	ret

OverworldRandom16: ; 2d8df (b:58df)
; Return as signed short bc
	call OverworldRandom8
	ld b, $0
	bit 7, a
	jr z, .positive
	dec b
.positive
	ld c, a
	ret

Data_2d8eb:
	db $1d, $a0, $63, $e5, $03, $3b, $4d, $f4
	db $ec, $46, $5b, $37, $93, $53, $85, $fe
	db $da, $9d, $27, $85, $f5, $10, $7b, $15
	db $e5, $94, $55, $ab, $6c, $b4, $3f, $b6
	db $5a, $1d, $a9, $30, $56, $c0, $49, $92
	db $20, $e7, $d0, $c3, $85, $01, $25, $55
	db $a4, $cf, $a8, $18, $2c, $f4, $55, $f3
	db $d5, $33, $a4, $cd, $80, $84, $e3, $74

Func_2d92b: ; 2d92b (b:592b)
	push bc
	push de
	ld d, b
	ld a, $10
	sub d
	ld e, a
	call Multiply_C_by_E
	ld a, e
	ld [wCustomSpriteDest], a
	ld a, d
	ld [wCustomSpriteDest + 1], a
	pop de
	pop af
	ld c, a
	call Multiply_C_by_E
	ld h, d
	ld l, e
	ld a, [wCustomSpriteDest]
	ld e, a
	ld a, [wCustomSpriteDest + 1]
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ret

Func_2d95f: ; 2d95f (b:595f)
; (c * ($40 - b) + b * e) >> 6
	push bc
	push de
	ld d, b
	ld a, $40
	sub d
	ld e, a
	call Multiply_C_by_E
	ld a, e
	ld [wCustomSpriteDest], a
	ld a, d
	ld [wCustomSpriteDest + 1], a
	pop de
	pop af
	ld c, a
	call Multiply_C_by_E
	ld h, d
	ld l, e
	ld a, [wCustomSpriteDest]
	ld e, a
	ld a, [wCustomSpriteDest + 1]
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ret

INCLUDE "engine/divide.asm"

CalcL1Distance: ; 2da27 (b:5a27)
; a = abs(b - d) + abs(c - e)
	push hl
	ld a, b
	sub d
	jr nc, .asm_2da2e
	cpl
	inc a
.asm_2da2e
	push af
	ld a, c
	sub e
	jr nc, .asm_2da35
	cpl
	inc a
.asm_2da35
	ld l, a
	pop af
	add l
	pop hl
	ret

Sine8: ; 2da3a (b:5a3a)
; signed char a_ret = Sine((a & 0x7F) * pi / 0x40)
	ld de, SineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Cosine8: ; 2da47 (b:5a47)
; signed char a_ret = Cosine((a & 0x7F) * pi / 0x40)
	ld de, CosineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Sine16: ; 2da54 (b:5a54)
; signed short de = Sine((a & 0x7F) * pi / 0x40)
	ld de, SineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld e, a
	ld d, $0
	bit 7, a
	jr z, .asm_2da68
	dec d
.asm_2da68
	ret

Cosine16: ; 2da69 (b:5a69)
; signed short de = Cosine((a & 0x7F) * pi / 0x40)
	ld de, CosineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld e, a
	ld d, $0
	bit 7, a
	jr z, .asm_2da7d
	dec d
.asm_2da7d
	ret

Func_2da7e: ; 2da7e (b:5a7e)
	ld a, b
	ld [wca06], a
	ld a, [hli]
	ld [wMapHeader], a
	ld a, [hli]
	ld [wca01], a
	push hl
	ld a, [wca06]
	call Sine8
	ld [wca02], a
	ld a, [wca06]
	call Cosine8
	ld [wca03], a
	ld a, [wMapHeader]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2daa8
	dec b
.asm_2daa8
	ld a, [wca03]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2dab3
	dec d
.asm_2dab3
	call Multiply_DE_by_BC
	push de
	ld a, [wca01]
	cpl
	inc a
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2dac4
	dec b
.asm_2dac4
	ld a, [wca02]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2dacf
	dec d
.asm_2dacf
	call Multiply_DE_by_BC
	ld h, d
	ld l, e
	pop de
	add hl, de
	ld a, h
	ld [wca04], a
	ld a, [wMapHeader]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2dae5
	dec b
.asm_2dae5
	ld a, [wca02]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2daf0
	dec d
.asm_2daf0
	call Multiply_DE_by_BC
	push de
	ld a, [wca01]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2daff
	dec b
.asm_2daff
	ld a, [wca03]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2db0a
	dec d
.asm_2db0a
	call Multiply_DE_by_BC
	ld h, d
	ld l, e
	pop de
	add hl, de
	ld a, h
	ld [wca05], a
	ld a, [wca04]
	ld b, a
	ld c, h
	pop hl
	ret

AddVector: ; 2db1c (b:5b1c)
; b += ((e * Cosine(d)) >> 8)
; c += ((e * Sine(d)) >> 8)
	push bc
	push de
	ld a, d
	ld l, e
	call Cosine8
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db2e
	dec b
.asm_2db2e
	call Multiply_DE_by_BC
	ld a, d
	ld [wScriptCount], a
	pop de
	pop bc
	ld a, [wScriptCount]
	add b
	ld b, a
	push bc
	ld a, d
	ld l, e
	call Sine8
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db4d
	dec b
.asm_2db4d
	call Multiply_DE_by_BC
	ld a, d
	pop bc
	add c
	ld c, a
	ret

Func_2db55: ; 2db55 (b:5b55)
	push de
	ld a, d
	ld l, e
	call Cosine8
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .positive
	dec b
.positive
	call Multiply_DE_by_BC
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .positive2
	dec b
.positive2
	pop de
	push bc
	ld a, d
	ld l, e
	call Sine8
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .positive3
	dec b
.positive3
	call Multiply_DE_by_BC
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .positive4
	dec d
.positive4
	pop bc
	ret

Func_2db90: ; 2db90 (b:5b90)
	srl b
	srl c
	srl d
	srl e
Func_2db98: ; 2db98 (b:5b98)
	xor a
	ld hl, wca67
	ld [hl], a
	ld a, c
	sub e
	ld e, a
	bit 7, a
	jr z, .asm_2dba8
	xor a
	sub e
	ld e, a
	inc [hl]
.asm_2dba8
	ld a, b
	sub d
	ld c, a
	bit 7, a
	jr z, .asm_2dbb4
	xor a
	sub c
	ld c, a
	set 1, [hl]
.asm_2dbb4
	xor a
	or e
	jr nz, .do_division
	ld a, $10
	jr .asm_2dbd6

.do_division
	ld d, $0
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Divide_BC_by_DE
	call Func_2dbfb
.asm_2dbd6
	sla a
	push af
	ld a, [wca67]
	or a
	jr nz, .asm_2dbe5
	pop af
	cpl
	inc a
	add $20
	ret

.asm_2dbe5
	cp $2
	jr nz, .asm_2dbed
	pop af
	add $20
	ret

.asm_2dbed
	cp $3
	jr nz, .asm_2dbf7
	pop af
	cpl
	inc a
	add $60
	ret

.asm_2dbf7
	pop af
	add $60
	ret

Func_2dbfb: ; 2dbfb (b:5bfb)
	xor a
	or b
	jr nz, .asm_2dc04
	ld a, c
	cp $a2
	jr c, .asm_2dc07
.asm_2dc04
	ld a, $10
	ret

.asm_2dc07
	or a
	jr nz, .asm_2dc0c
	xor a
	ret

.asm_2dc0c
	cp $50
	jr nc, .asm_2dc43
	cp $34
	jr nc, .asm_2dc46
	cp $26
	jr nc, .asm_2dc49
	cp $1d
	jr nc, .asm_2dc4c
	cp $17
	jr nc, .asm_2dc4f
	cp $13
	jr nc, .asm_2dc52
	cp $10
	jr nc, .asm_2dc55
	cp $d
	jr nc, .asm_2dc58
	cp $a
	jr nc, .asm_2dc5b
	cp $8
	jr nc, .asm_2dc5e
	cp $6
	jr nc, .asm_2dc61
	cp $4
	jr nc, .asm_2dc64
	cp $3
	jr nc, .asm_2dc67
	ld a, $1
	ret

.asm_2dc43
	ld a, $f
	ret

.asm_2dc46
	ld a, $e
	ret

.asm_2dc49
	ld a, $d
	ret

.asm_2dc4c
	ld a, $c
	ret

.asm_2dc4f
	ld a, $b
	ret

.asm_2dc52
	ld a, $a
	ret

.asm_2dc55
	ld a, $9
	ret

.asm_2dc58
	ld a, $8
	ret

.asm_2dc5b
	ld a, $7
	ret

.asm_2dc5e
	ld a, $6
	ret

.asm_2dc61
	ld a, $5
	ret

.asm_2dc64
	ld a, $4
	ret

.asm_2dc67
	ld a, $3
	ret

.asm_2dc6a
	ld a, $2
	ret

Func_2dc6d: ; 2dc6d (b:5c6d)
	ld a, $10
	add b
	ld b, a
	ld a, $10
	add c
	ld c, a
	ld a, $10
	add d
	ld d, a
	ld a, $10
	add e
	ld e, a
	srl b
	srl c
	srl d
	srl e
	jp Func_2db98

SineWave: ; 2dc88
	db  $00,  $06,  $0c,  $12,  $18,  $1f,  $25,  $2b,  $30,  $36,  $3c,  $41,  $47,  $4c,  $51,  $55
	db  $5a,  $5e,  $62,  $66,  $6a,  $6d,  $70,  $73,  $76,  $78,  $7a,  $7c,  $7d,  $7e,  $7f,  $7f
CosineWave: ; 2dca8
	db  $7f,  $7f,  $7f,  $7e,  $7d,  $7c,  $7a,  $78,  $76,  $73,  $70,  $6d,  $6a,  $66,  $62,  $5e
	db  $5a,  $55,  $51,  $4c,  $47,  $41,  $3c,  $36,  $30,  $2b,  $25,  $1f,  $18,  $12,  $0c,  $06
	db  $00, -$06, -$0c, -$12, -$18, -$1f, -$25, -$2b, -$30, -$36, -$3c, -$41, -$47, -$4c, -$51, -$55
	db -$5a, -$5e, -$62, -$66, -$6a, -$6d, -$70, -$73, -$76, -$78, -$7a, -$7c, -$7d, -$7e, -$7f, -$7f
	db -$7f, -$7f, -$7f, -$7e, -$7d, -$7c, -$7a, -$78, -$76, -$73, -$70, -$6d, -$6a, -$66, -$62, -$5e
	db -$5a, -$55, -$51, -$4c, -$47, -$41, -$3c, -$36, -$30, -$2b, -$25, -$1f, -$18, -$12, -$0c, -$06
	db  $00,  $06,  $0c,  $12,  $18,  $1f,  $25,  $2b,  $30,  $36,  $3c,  $41,  $47,  $4c,  $51,  $55
	db  $5a,  $5e,  $62,  $66,  $6a,  $6d,  $70,  $73,  $76,  $78,  $7a,  $7c,  $7d,  $7e,  $7f,  $7f

ApplyXStepVector: ; 2dd28 (b:5d28)
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

ApplyYStepVector: ; 2dd41 (b:5d41)
	push hl
	ld a, $c
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

Func_2dd5a: ; 2dd5a (b:5d5a)
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	ld de, $3
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

Func_2dd89: ; 2dd89 (b:5d89)
	push hl
	ld a, $a
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2dd9d: ; 2dd9d (b:5d9d)
	push hl
	ld a, $e
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2ddb1: ; 2ddb1 (b:5db1)
	push hl
	ld a, $c
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2ddc5: ; 2ddc5 (b:5dc5)
	push hl
	ld a, $8
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

HandleScreenShake: ; 2ddd9 (b:5dd9)
	ld a, [wScreenShakeMagnitude]
	or a
	ret z
	sub $3
	jr nc, .no_carry
	xor a
.no_carry
	ld [wScreenShakeMagnitude], a
	ld c, a
	ld a, [wScreenShakePhase]
	add $18
	ld [wScreenShakePhase], a
	call Sine8
	ld e, a
	call Multiply_C_by_E_signed
	ld a, [wScreenShakeDirection]
	or a
	jr nz, .x
	ld a, [wScreenShakeYOffset]
	sra d
	sra d
	sra d
	add d
	ld [wSCY], a
	ret

.x
	ld a, [wScreenShakeXOffset]
	sra d
	sra d
	sra d
	add d
	ld [wSCX], a
	ret

SetUpScreenShake: ; 2de18 (b:5e18)
; b = magnitude
; c = 1 if x, 0 if y
	ld a, [wScreenShakeMagnitude]
	or a
	jr z, .no_copy
	ld a, [wScreenShakeXOffset]
	ld [wSCX], a
	ld a, [wScreenShakeYOffset]
	ld [wSCY], a
.no_copy
	ld a, b
	ld [wScreenShakeMagnitude], a
	ld a, [wSCX]
	ld [wScreenShakeXOffset], a
	ld a, [wSCY]
	ld [wScreenShakeYOffset], a
	ld a, c
	ld [wScreenShakeDirection], a
	ret

Func_2de3f:
	call Func_2dec1
	ld bc, EVENT_08A
	call ResetEventFlag
	ld bc, EVENT_08B
	call ResetEventFlag
	ld hl, wcdf6
	ld a, [wc912]
	cp $6e
	jr c, .asm_2de75
	cp $9b
	jr c, .asm_2dea0
	ld a, [wcdf8]
	or a
	jr z, .asm_2de68
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2de68
	ld a, [wcdfb]
	or a
	jr z, .asm_2de74
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2de74
	ret

.asm_2de75
	ld a, [wcdf6]
	ld c, a
	ld a, [wcdf7]
	ld b, a
	ld a, [wcdf8]
	or b
	or c
	jr z, .asm_2de8a
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2de8a
	ld a, [wcdf9]
	ld c, a
	ld a, [wcdfa]
	ld b, a
	ld a, [wcdfb]
	or b
	or c
	jr z, .asm_2de9f
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2de9f
	ret

.asm_2dea0
	ld a, [wcdf7]
	ld b, a
	ld a, [wcdf8]
	or b
	jr z, .asm_2deb0
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2deb0
	ld a, [wcdfa]
	ld b, a
	ld a, [wcdfb]
	or b
	jr z, .asm_2dec0
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2dec0
	ret

Func_2dec1: ; 2dec1 (b:5ec1)
	ld hl, wcdf6
	ld b, $6
.asm_2dec6
	ld a, [hli]
	or a
	jr nz, .asm_2ded3
	dec b
	jr nz, .asm_2dec6
	ld bc, EVENT_088
	jp ResetEventFlag

.asm_2ded3
	ld bc, EVENT_088
	jp SetEventFlag

AddOrSubtractMoney: ; 2ded9 (b:5ed9)
	push hl
	ld a, [wMoney + 1]
	ld h, a
	ld a, [wMoney]
	ld l, a
	add hl, bc
	jr c, .overflow_or_underflow
	bit 7, b
	jr nz, .overflow_or_underflow
.underflowed
	push hl
	ld bc, (-MAX_MONEY) & $ffff
	add hl, bc
	jr nc, .no_overflow
	add sp, $2
	ld hl, MAX_MONEY
	jr .return_money

.no_overflow
	pop hl
.return_money
	ld a, h
	ld [wMoney + 1], a
	ld a, l
	ld [wMoney], a
	pop hl
	ret

.overflow_or_underflow
	bit 7, b
	jr nz, .underflowed
	ld hl, wMoney
	ld a, MAX_MONEY % $100
	ld [hli], a
	ld a, MAX_MONEY / $100
	ld [hl], a
	pop hl
	ret

Func_2df11:
	ld a, [wcadc]
	cpl
	ld c, a
	ld a, [wcadd]
	cpl
	ld b, a
	inc bc
	jr AddOrSubtractMoney

BackupMapObjects: ; 2df1e (b:5f1e)
	enable_sram sOAMAnimationsBackup
	ld hl, wPlayerObjectStruct
	ld de, wOAMAnimation15
	ld b, $20
	call CopyData_Under256Bytes
	ld hl, wPartnerDenjuuObjectStruct
	ld de, wOAMAnimation16
	ld b, $20
	call CopyData_Under256Bytes
	ld de, wOAMAnimations
	ld hl, sOAMAnimationsBackup
	ld bc, wOAMAnimationsEnd - wOAMAnimations
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	disable_sram
	ret

RestoreMapAnimationsAfterSpecial: ; 2df55 (b:5f55)
	enable_sram sOAMAnimationsBackup
	ld de, wOAMAnimations
	ld hl, sOAMAnimationsBackup
	ld bc, wOAMAnimationsEnd - wOAMAnimations
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	disable_sram
	ld hl, wOAMAnimation15
	ld de, wPlayerObjectStruct
	ld b, $20
	call CopyData_Under256Bytes
	ld hl, wOAMAnimation16
	ld de, wPartnerDenjuuObjectStruct
	ld b, $20
	call CopyData_Under256Bytes
	ld de, $20
	ld hl, wOAMAnimation01
	ld b, $18
	xor a
.asm_2df94
	push hl
	ld a, [hl]
	and $2
	jr nz, .asm_2df9d
	ld [hl], a
	jr .asm_2dfa9

.asm_2df9d
	ld a, $19
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	or $8
	ld [hl], a
.asm_2dfa9
	pop hl
	add hl, de
	dec b
	jr nz, .asm_2df94
	ret

Func_2dfaf:
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_2dfc8
	ld a, [wMapGroup]
	inc a
	ld [wMapGroup], a
	cp $35
	jr c, .asm_2dff7
	ld a, $0
	ld [wMapGroup], a
	jr .asm_2dff7

.asm_2dfc8
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_2dfe1
	ld a, [wMapGroup]
	dec a
	ld [wMapGroup], a
	cp $2
	jr nc, .asm_2dff7
	ld a, $34
	ld [wMapGroup], a
	jr .asm_2dff7

.asm_2dfe1
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_2dfed
	call Func_2e050
	jr .asm_2dff7

.asm_2dfed
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_2dff7
	call Func_2e03c
.asm_2dff7
	push af
	push hl
	push bc
	ld a, [wMapGroup]
	hlbgcoord 1, 0, VWindow
	call Func_353b
	pop bc
	pop hl
	pop af
	push af
	push hl
	push bc
	ld a, [wMapNumber]
	hlbgcoord 4, 0, VWindow
	call Func_353b
	pop bc
	pop hl
	pop af
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $50
	ld [wc902], a
	ld a, $40
	ld [wc901], a
	ld a, $2
	ld [wPhoneCallSubroutine], a
	ld a, $7
	ld [wSubroutine], a
	ld a, $4
	jp StartFade

Func_2e033:
	ld a, $8
	ld [wSubroutine], a
	call Func_35a3
	ret

Func_2e03c: ; 2e03c (b:603c)
	ld a, [wMapNumber]
	inc a
	and $3f
	ld [wMapNumber], a
	call LoadTilesetRegisters
	ld a, [wMapNumber3]
	cp $ff
	ret nz
	jr Func_2e03c

Func_2e050: ; 2e050 (b:6050)
	ld a, [wMapNumber]
	dec a
	and $3f
	ld [wMapNumber], a
	call LoadTilesetRegisters
	ld a, [wMapNumber3]
	cp $ff
	ret nz
	jr Func_2e050

Func_2e064: ; 2e064 (b:6064)
	ld a, [wSubroutine]
	cp $6
	ret z
	ld hl, wPlayerObjectStruct
	ld de, wOAMAnimation15
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $14
	jr nz, .asm_2e080
	ld a, [wOAMAnimation16 + $1f]
	ld b, a
	ld a, [wOAMAnimation16 + $1e]
	jr .asm_2e087

.asm_2e080
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
.asm_2e087
	sub b
	ld b, a
	bit 7, b
	jr z, .asm_2e090
	ld de, wOAMAnimation16
.asm_2e090
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld hl, wPartnerDenjuuObjectStruct
	ld de, wOAMAnimation16
	bit 7, b
	jr z, .asm_2e0ae
	ld de, wOAMAnimation15
.asm_2e0ae
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $14
	jr z, .asm_2e0d1
	ld hl, wOAMAnimation16 + $1e
	ld a, [wPlayerObjectStruct_YCoord]
	ld [hli], a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	ld [hl], a
.asm_2e0d1
	ret

SetVisitedMapSectionFlag: ; 2e0d2 (b:60d2)
	ld a, [wScriptBank]
	cp $1
	jr z, .script_mode_okay
	ld a, [wcd00]
	or a
	ret nz
.script_mode_okay
	ld a, [wMapGroup]
	cp $2
	ret c
	cp $32
	jr nc, .map_group_okay
	cp $2b
	ret nc
.map_group_okay
	ld a, [wMapGroup]
	cp $a
	jr nc, .indoor_map_group
	call Func_2e179
	ld a, [wMapNumber]
	ld [wMapNumber2], a
	ld a, [wMapGroup]
	ld [wMapGroup2], a
	cp $6
	jr c, .okay3
	sub $4
.okay3
	sub $2
	sla a
	sla a
	sla a
	ld hl, wMiniMapClearedSections
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wMapNumber]
	ld b, a
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
.get_bit
	and $7
	ld c, $1
	or a
	jr z, .set
.shift
	sla c
	dec a
	jr nz, .shift
.set
	enable_sram sIndoorVisitedMapSectionFlags
	ld a, [hl]
	or c
	ld [hl], a
	disable_sram
	ret

.indoor_map_group
	sub $a
	cp $28
	jr c, .map_group_okay2
	sub $7
.map_group_okay2
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, sIndoorVisitedMapSectionFlags
	add hl, bc
	ld a, [wMapNumber]
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wMapNumber]
	and $7
	jr .get_bit

Func_2e179: ; 2e179 (b:6179)
	ld a, [wMapNumber]
	ld b, a
	ld a, [wMapGroup]
	ld c, a
	cp $2
	jr nz, .not_2_8
	ld a, b
	cp $8
	jr nz, .not_2_8
	ld b, $1e
	ld a, [wMiniMapClearedSections]
	or b
	ld [wMiniMapClearedSections], a
	ld b, $a
	ld a, [wc961]
	or b
	ld [wc961], a
	ld b, $9
	ld a, [wc962]
	or b
	ld [wc962], a
	ld b, $3
	ld a, [wc963]
	or b
	ld [wc963], a
	ld b, $5
	ld a, [wc964]
	or b
	ld [wc964], a
	ret

.not_2_8
	ld a, c
	cp $2
	jr nz, .not_2_f
	ld a, b
	cp $f
	jr nz, .not_2_f
	ld b, $80
	ld a, [wMiniMapClearedSections]
	or b
	ld [wMiniMapClearedSections], a
	ld b, $1
	ld a, [wc968]
	or b
	ld [wc968], a
	ret

.not_2_f
	ld a, c
	cp $3
	jr nz, .not_3_f
	ld a, b
	cp $f
	jr nz, .not_3_f
	ld b, $c0
	ld a, [wc968]
	or b
	ld [wc968], a
	ret

.not_3_f
	ld a, c
	cp $5
	jr nz, .not_5_27
	ld a, b
	cp $27
	jr nz, .not_5_27
	ld b, $80
	ld a, [wc97d]
	or b
	ld [wc97d], a
.not_5_27
	ret

Func_2e1fd:
	ld a, b
	call Func_2e204
	jp SetVisitedMapSectionFlag

Func_2e204: ; 2e204 (b:6204)
	call Func_2e2f1
	ld b, a
	and $1
	jr nz, .asm_2e217
	ld a, [wMapNumber]
	add b
	and $3f
	ld [wMapNumber], a
	jr .asm_2e227

.asm_2e217
	ld a, [wMapNumber]
	and $f8
	ld c, a
	ld a, [wMapNumber]
	add b
	and $7
	or c
	ld [wMapNumber], a
.asm_2e227
	ld a, [wMapGroup]
	cp $2
	jr z, .asm_2e23c
	cp $3
	jr z, .asm_2e268
	cp $4
	jr z, asm_2e297
	cp $5
	jp z, Func_2e2c3
	ret

.asm_2e23c
	ld a, $8
	cp b
	jr nz, .asm_2e252
	ld a, [wMapNumber]
	cp $8
	jr nc, asm_2e296
	ld a, [wMapGroup]
	add $2
	ld [wMapGroup], a
	jr asm_2e296

.asm_2e252
	ld a, $1
	cp b
	jr nz, asm_2e296
	ld a, [wMapNumber]
	and $7
	jr nz, asm_2e296
	ld a, [wMapGroup]
	add $1
	ld [wMapGroup], a
	jr asm_2e296

.asm_2e268
	ld a, $8
	cp b
	jr nz, .asm_2e27e
	ld a, [wMapNumber]
	cp $7
	jr nc, asm_2e296
	ld a, [wMapGroup]
	add $2
	ld [wMapGroup], a
	jr asm_2e296

.asm_2e27e
	ld a, $ff
	cp b
	jr nz, asm_2e296
	ld a, [wMapNumber]
	and $7
	cp $7
	jr nz, asm_2e296
	ld a, [wMapGroup]
	sub $1
	ld [wMapGroup], a
	jr asm_2e296

asm_2e296
	ret

asm_2e297
	ld a, $f8
	cp b
	jr nz, .asm_2e2ad
	ld a, [wMapNumber]
	cp $38
	jr c, asm_2e296
	ld a, [wMapGroup]
	sub $2
	ld [wMapGroup], a
	jr asm_2e296

.asm_2e2ad
	ld a, $1
	cp b
	jr nz, asm_2e296
	ld a, [wMapNumber]
	and $7
	jr nz, asm_2e296
	ld a, [wMapGroup]
	add $1
	ld [wMapGroup], a
	jr asm_2e296

Func_2e2c3: ; 2e2c3 (b:62c3)
	ld a, $f8
	cp b
	jr nz, .asm_2e2d9
	ld a, [wMapNumber]
	cp $38
	jr c, asm_2e296
	ld a, [wMapGroup]
	sub $2
	ld [wMapGroup], a
	jr asm_2e296

.asm_2e2d9
	ld a, $ff
	cp b
	jr nz, asm_2e296
	ld a, [wMapNumber]
	and $7
	cp $7
	jr nz, asm_2e296
	ld a, [wMapGroup]
	sub $1
	ld [wMapGroup], a
	jr asm_2e296

Func_2e2f1: ; 2e2f1 (b:62f1)
	ld a, [wMapGroup]
	cp $3
	jr nz, .asm_2e337
	ld a, [wMapNumber]
	cp $23
	jr nz, .asm_2e337
	ld a, [wc954]
	ld c, a
	ld a, b
	cp $ff
	jr z, .asm_2e312
	cp $f8
	jr z, .asm_2e32e
	cp $8
	jr z, .asm_2e320
	jr .asm_2e337

IF DEF(POWER)
x = 0
ELSE
x = 1
ENDC

.asm_2e312
	ld a, c
	cp x
	jr nz, .asm_2e335
	ld a, x + 1
	ld [wc954], a
	ld a, $0
	ld b, a
	ret
x = x ^ 1

.asm_2e320
	ld a, c
	cp x
	jr nz, .asm_2e335
	ld a, x + 1
	ld [wc954], a
	ld a, $0
	ld b, a
	ret

.asm_2e32e
	ld a, c
	cp $2
	jr nz, .asm_2e335
	jr .asm_2e337

.asm_2e335
	ld b, $0
.asm_2e337
	ld a, $0
	ld [wc954], a
	ld a, b
	ret

PlayMapMusic: ; 2e33e (b:633e)
	ld a, [wc958]
	or a
	ret nz
	ld bc, EVENT_210
	call CheckEventFlag
	ret nz
	ld a, [wMapMusic]
	ld b, a
	ld a, [wMapGroup]
	cp $2e
	jr nz, .not_house
	ld a, MUSIC_HOUSE
	jr .compare

.not_house
	ld hl, Data_2e3c8
	ld a, [wCurTilesetIdx]
	cp $6
	jr nz, .not_shop
	ld c, a
	ld a, [wMapNumber]
	cp $10
	jr nc, .not_shop2
	ld a, MUSIC_SHOP
	jr .compare

.not_shop2
	ld a, c
.not_shop
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp MUSIC_OVERWORLD
	jr nz, .compare
	push bc
	callba Func_a8539
	ld a, c
	cp $5
	jr nz, .not_barran
	ld a, MUSIC_BARRAN_DESERT
	jr .pop_cp

.not_barran
	cp $6
	jr nz, .not_ion
	ld a, MUSIC_ION_ISLAND
	jr .pop_cp

.not_ion
	cp $3
	jr nz, .not_palm
	ld a, MUSIC_PALM_SEA
	jr .pop_cp

.not_palm
	cp $b
	jr nz, .not_pepperi
	ld a, MUSIC_PEPPERI_MOUNTAIN
	jr .pop_cp

.not_pepperi
	cp $e
	jr nz, .default_overworld_music
	ld a, [wMapGroup]
	cp $6
	jr z, .not_burion
	ld a, MUSIC_BURION_RUINS
	jr .pop_cp

.not_burion
	ld a, MUSIC_2A
	jr .pop_cp

.default_overworld_music
	ld a, MUSIC_OVERWORLD
.pop_cp
	pop bc
.compare
	cp b
	jr z, .dont_play
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
.dont_play
	ret

Data_2e3c8:
	db MUSIC_OVERWORLD
	db MUSIC_OVERWORLD
	db MUSIC_OVERWORLD
	db MUSIC_CRAFT_RESEARCH_CENTER
	db MUSIC_OVERWORLD
	db MUSIC_CAVES
	db MUSIC_HOUSE
	db MUSIC_CAVES
	db MUSIC_PEPPERI_MOUNTAIN
	db MUSIC_CACTOS_RUINS
	db MUSIC_BURION_RUINS
	db MUSIC_BURION_RUINS
	db MUSIC_HOUSE
	db MUSIC_HOUSE
	db MUSIC_MIYO
	db MUSIC_CRAFT_RESEARCH_CENTER
	db MUSIC_CRAFT_RESEARCH_CENTER
	db MUSIC_ION_ISLAND
	db MUSIC_BARRAN_DESERT
	db MUSIC_PALM_SEA

LoadTilesetGFX: ; 2e3dc (b:63dc)
	ld hl, Data_2e3ee
	ld a, [wCurTilesetIdx]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld b, $0
	jp DecompressGFXByIndex_

Data_2e3ee:
	db $20
	db $20
	db $21
	db $22
	db $21
	db $23
	db $24
	db $25
	db $26
	db $27
	db $28
	db $28
	db $29
	db $2a
	db $2b
	db $2c
	db $22

Func_2e3ff: ; 2e3ff (b:63ff)
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	ld hl, Data_2e455
	ld a, [wCurTilesetIdx]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld b, $0
	call GetCGB_OBLayout_
	callba Func_30741
	ld a, [wCurTilesetIdx]
	cp $6
	jr z, .asm_2e437
	ld a, [wcdba]
	ld c, a
	ld a, [wcdbb]
	ld b, a
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	ld a, $3
	call LoadNthStdOBPalette
.asm_2e437
	ld a, [wCurTilesetIdx]
	cp $2
	ret nc
	ld a, [wRTC_Hrs]
	ld hl, $280
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, h
	ld c, l
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	xor a
	call LoadNthStdOBPalette
	ret

Data_2e455:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Func_2e466: ; 2e466 (b:6466)
	ld hl, Data_2e49e
	ld a, [wCurTilesetIdx]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld c, a
	cp $40
	jr nz, .asm_2e47e
	ld a, [wRTC_Hrs]
	add $50
	ld c, a
.asm_2e47e
	ld a, BANK(Func_2e466)
	ld [wPrevROMBank], a
	ld b, $0
	call GetCGB_BGLayout_
	jp LoadTextBoxPaletteBG7

LoadTextBoxPaletteBG7: ; 2e48b (b:648b)
	ld b, $7
LoadTextBoxPalette: ; 2e48d (b:648d)
	push bc
	ld a, [wUIColor]
	ld c, a
	ld b, $0
	ld hl, $328
	add hl, bc
	ld b, h
	ld c, l
	pop af
	jp LoadNthStdBGPalette

Data_2e49e:
	db $40, $40, $40, $43
	db $40, $42, $47, $44
	db $45, $46, $48, $48
	db $49, $4a, $4b, $45
	db $43, $4d, $4e, $4f

Func_2e4b2: ; 2e4b2 (b:64b2)
	ld a, [wSubroutine]
	cp $4
	jr c, .asm_2e4ec
	cp $16
	jr nc, .asm_2e4ec
	ld a, [hJoyLast]
	and ($FF ^ (START | SELECT))
	jr z, .asm_2e4d3
	ld a, [wc91a]
	cp $c7
	jr c, .asm_2e4cd
	call Func_2e526
.asm_2e4cd
	ld a, $0
	ld [wc91a], a
	ret

.asm_2e4d3
	ld a, [wOverworldFrameCounter]
	and $3
	jr nz, .asm_2e4ec
	ld a, [wc91a]
	inc a
	cp $c8
	jr c, .asm_2e4e9
	jr nz, .asm_2e4ec
	call Func_2e4ed
	ld a, $c8
.asm_2e4e9
	ld [wc91a], a
.asm_2e4ec
	ret

Func_2e4ed: ; 2e4ed (b:64ed)
	ld a, BANK(Func_2e4ed)
	ld [wPrevROMBank], a
	ld bc, $1da
	ld d, $7
	ld a, [wSubroutine]
	cp $24
	jr c, .asm_2e504
	cp $28
	jr nc, .asm_2e504
	ld d, $5
.asm_2e504
	cp $19
	jr c, .asm_2e50c
	cp $24
	jr c, .asm_2e516
.asm_2e50c
	ld a, d
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e516
	ld a, $0
	call LoadNthStdBGPalette
	ld a, $1
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_2e526: ; 2e526 (b:6526)
	ld a, BANK(Func_2e526)
	ld [wPrevROMBank], a
	ld a, [wSubroutine]
	cp $24
	jr c, .asm_2e536
	cp $29
	jr c, .asm_2e557
.asm_2e536
	cp $19
	jr c, .asm_2e53e
	cp $24
	jr c, .asm_2e547
.asm_2e53e
	call LoadTextBoxPaletteBG7
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e547
	ld b, $0
	call LoadTextBoxPalette
	ld b, $1
	call LoadTextBoxPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e557
	ld b, $5
	call LoadTextBoxPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ret

ret_2e562: ; 2e562 (b:6562)
	ret

Func_2e563:
	check_cgb
	ret nz
	push hl
	ld hl, rKEY1
	ld a, b
	or a
	jr nz, .asm_2e57d
	di
	bit 7, [hl]
	jr z, .asm_2e57a
	set 0, [hl]
	stop
.asm_2e57a
	ei
	pop hl
	ret

.asm_2e57d
	di
	bit 7, [hl]
	jr nz, .asm_2e586
	set 0, [hl]
	stop
.asm_2e586
	ei
	pop hl
	ret

OverworldSubroutine: ; 2e589 (b:6589)
	ld a, [wSubroutine]
	ld b, a
	ld hl, Pointers_2e5a1
	add a
	add b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wPrevROMBank], a
	ld b, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

Pointers_2e5a1:
	dbw $0e, Func_2134                       ; 00
	dbw $0e, Func_231e                       ; 01
	dbw $0e, Func_2329                       ; 02
	dbw $0e, Func_2353                       ; 03
	dbw $0e, Func_236c                       ; 04
	dbw $0e, Func_242b                       ; 05
	dbw $0e, Func_2465                       ; 06
	dbw $0e, Func_24ad                       ; 07
	dba Func_2dfaf                           ; 08
	dbw $0e, Func_2503                       ; 09
	dbw $0e, Func_21db                       ; 0a
	dbw $0e, Func_2122                       ; 0b

	dba FadeOutOverworldForMinimap           ; 0c
	dba LoadMinimapGFX                       ; 0d
	dba FadeToMinimap                        ; 0e
	dba RunMinimap                           ; 0f
	dba RunMinimap                           ; 10
	dba FadeOutMinimapForOverworld           ; 11

	dba FadeOutOverworldForMinimap_____      ; 12
	dba Func_a87e7                           ; 13
	dba Func_a8981                           ; 14
	dba Func_a8991                           ; 15
	dba Func_a89cb                           ; 16
	dbw $0e, Func_24c9                       ; 17
	dbw $0e, Func_24d8                       ; 18

	dba FadeOutOverworldForMinimap______     ; 19
	dba Func_a89e5                           ; 1a
	dba Func_a8e7e                           ; 1b
	dba Func_a8ea3                           ; 1c
	dba Func_a91a3                           ; 1d
	dba Func_a9223                           ; 1e
	dba Func_a91dc                           ; 1f
	dba Func_a9377                           ; 20
	dba Func_a93cf                           ; 21
	dba Func_a98bf                           ; 22
	dba Func_a99f5                           ; 23

	dba FadeOutOverworldForMinimap__         ; 24
	dba LoadPhoneCallLayout                  ; 25
	dba FadeIntoPhoneCall                    ; 26
	dba HandlePhoneCall                      ; 27
	dba FadeOutFromPhoneCall                 ; 28

	dba FadeOutOverworldForMinimap___        ; 29
	dba LoadSpecialGFX                       ; 2a
	dba StartFadeInToSpecial                           ; 2b
	dba DoFadeInToSpecial                           ; 2c
	dba Func_a5d17                           ; 2d
	dba Func_c9b17                           ; 2e
	dba Func_c9b01                           ; 2f

	dba FadeOutOverworldForMinimap_          ; 30
	dba Func_3a0fd                           ; 31
	dba Func_3a175                           ; 32
	dba Func_3a1bc                           ; 33
	dba Func_3a696                           ; 34
	dba Func_a837a                           ; 35

	dba FadeOutOverworldForMinimap____       ; 36
	dba Func_a5f06                           ; 37
	dba Func_a5f78                           ; 38
	dba Func_a5f82                           ; 39
	dba Func_a5f9b                           ; 3a

ItemNames:
	db "ファイアーガン$"
	db "ガン$$$$$$"
	db "リボルバーガン$"
	db "バズーカ$$$$"
	db "マシンガン$$$"
	db "ミサイル$$$$"
	db "ボム$$$$$$"
	db "ガトリングガン$"
	db "サーベル$$$$"
	db "ドリル$$$$$"
	db "ジェットエンジン"
	db "プロぺラエンジン"
	db "シュリケン$$$"
	db "でんち$$$$$"
	db "アーチェリー$$"
	db "レンジ$$$$$"
	db "アイロン$$$$"
	db "ミキサー$$$$"
	db "でんわ$$$$$"
	db "アンテナ$$$$"
	db "スパナ$$$$$"
	db "ノコギリ$$$$"
	db "チェーンソー$$"
	db "ビームガン$$$"
	db "アックス$$$$"
	db "ドライバー$$$"
	db "ネジ$$$$$$"
	db "ゼンマイ$$$$"
	db "ギア$$$$$$"
	db "テレカ$$$$$"
	db "ランス$$$$$"
	db "クレーン$$$$"
	db "アーミーナイフ$"
	db "カマ$$$$$$"
	db "コンピュータ$$"
	db "モバイル$$$$"
	db "ハンマー$$$$"
	db "ちゅうしゃき$$"
	db "カメラ$$$$$"
	db "ビデオ$$$$$"
	db "フライパン$$$"
	db "えんぴつ$$$$"
	db "タイヤ$$$$$"
	db "ボンベ$$$$$"
	db "じゃぐち$$$$"
	db "バケツ$$$$$"
	db "そうじき$$$$"
	db "マウス$$$$$"
	db "カギ$$$$$$"
	db "ゲームマシン$$"
	db "ぬいぐるみ$$$"
	db "ボンボン$$$$"
	db "キックボード$$"
	db "チタリウム$$$"
	db "ルナチウム$$$"
	db "ガイアモンド$$"
	db "ラウンドメタル$"
	db "タイタニュウム$"
	db "かいぞうしよう1"
	db "かいぞうしよう2"
	db "かいぞうしよう3"
	db "じっけんしよう1"
	db "じっけんしよう2"
	db "じっけんしよう3"
	db "バイオレント3$"
	db "グラップライト9"
	db "ギガイア00$$"
	db "アイテム し$$"

ItemPrices:
	dw 130
	dw 80
	dw 100
	dw 140
	dw 120
	dw 500
	dw 50
	dw 180
	dw 35
	dw 30
	dw 700
	dw 480
	dw 10
	dw 15
	dw 65
	dw 90
	dw 50
	dw 55
	dw 60
	dw 80
	dw 20
	dw 60
	dw 110
	dw 350
	dw 90
	dw 5
	dw 3
	dw 8
	dw 13
	dw 50
	dw 100
	dw 400
	dw 120
	dw 50
	dw 200
	dw 220
	dw 34
	dw 50
	dw 250
	dw 140
	dw 30
	dw 5
	dw 100
	dw 120
	dw 30
	dw 30
	dw 60
	dw 20
	dw 10
	dw 40
	dw 30
	dw 10
	dw 5000
	dw 800
	dw 900
	dw 1000
	dw 1200
	dw 1200
	dw 150
	dw 200
	dw 500
	dw 200
	dw 300
	dw 800
	dw 1000
	dw 2000
	dw 3000
	dw 500

INCLUDE "text/unknown_2e8fa.asm"

SECTION "bank 0C", ROMX, BANK [$c]

INCLUDE "engine/partner_denjuu_object.asm"
INCLUDE "engine/sprite_animations.asm"
INCLUDE "data/objects.asm"

SECTION "bank 0D", ROMX, BANK [$d]
Palettes_34000:
INCLUDE "data/palettes_34000.asm"

DenjuuPalettes:
INCLUDE "data/denjuu_palettes.asm"

TFangerPalettes:
INCLUDE "data/tfanger_palettes.asm"

Palettes_34f08:
IF DEF(POWER)
INCLUDE "data/palettes_34f08.power.asm"
ELSE
INCLUDE "data/palettes_34f08.speed.asm"
ENDC

Palettes_35d80:
INCLUDE "data/palettes_35d80.asm"

SECTION "bank 0E", ROMX, BANK [$e]
PalPackets_38000::
INCLUDE "data/pal_packets2.asm"

INCLUDE "data/oam_templates_1.asm"

INCLUDE "engine/overworld_input.asm"

FadeOutOverworldForMinimap_: ; 3a0f4 (e:60f4)
	callba FadeOutOverworldForMinimap
	ret

Func_3a0fd: ; 3a0fd (e:60fd)
	ld a, BANK(Func_3a0fd)
	ld [wPrevROMBank], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $0
	ld [wOAMAnimation24_Palette + 1], a
	ld a, $0
	ld [wOAMAnimation24_Duration + 3], a
	ld a, $3
	ld [wOAMAnimation24_TemplateBank], a
	ld a, $5
	ld [wOAMAnimation24_TemplateIdx], a
	ld a, [Pointers_3a2dd]
	ld [wOAMAnimation24_Palette + 2], a
	ld a, [Pointers_3a2dd + 1]
	ld [wOAMAnimation24_Duration], a
	ld a, $0
	ld [wFontPaletteMode], a
	ld bc, $1
	callba Func_ce601
	ld a, $0
	ld [wOAMAnimation24_Duration + 2], a
	call Func_3a286
	call Func_3a145
	jp IncrementSubroutine

Func_3a145: ; 3a145 (e:6145)
	ld a, BANK(Func_3a145)
	ld [wPrevROMBank], a
	ld bc, $0
	ld a, $4
	call StartFade_
	ld a, $20
	ld [wOAMAnimation24_Duration + 1], a
	ld a, $0
	ld [wOAMAnimation24_Palette + 1], a
	ret

Func_3a15d: ; 3a15d (e:615d)
	ld a, BANK(Func_3a15d)
	ld [wPrevROMBank], a
	ld bc, $0
	ld a, $4
	call StartFade_
	ld a, $0
	ld [wOAMAnimation24_Duration + 1], a
	ld a, $0
	ld [wOAMAnimation24_Palette + 1], a
	ret

Func_3a175: ; 3a175 (e:6175)
	call Func_3a184
	ld a, [wOAMAnimation24_Palette + 1]
	cp $b4
	ret nz
	call Func_3a15d
	jp IncrementSubroutine

Func_3a184: ; 3a184 (e:6184)
	ld a, [wOAMAnimation24_Duration + 1]
	or a
	jr nz, .asm_3a192
	ld a, [wOAMAnimation24_Palette + 1]
	inc a
	ld [wOAMAnimation24_Palette + 1], a
	ret

.asm_3a192
	check_cgb
	jr z, .asm_3a1a6
	ld a, $0
	call PaletteFade_
	ld a, [wOAMAnimation24_Duration + 1]
	dec a
	ld [wOAMAnimation24_Duration + 1], a
	ret

.asm_3a1a6
	ld de, Data_cef38
	ld b, $1
	ld a, [wOAMAnimation24_Duration + 1]
	dec a
	ld [wOAMAnimation24_Duration + 1], a
	ld c, a
	callba Func_cef86
	ret

Func_3a1bc: ; 3a1bc (e:61bc)
	call Func_3a1f4
	ld a, [wOAMAnimation24_Palette + 1]
	cp $10
	ret nz
	ld a, [wOAMAnimation24_Duration + 3]
	or a
	jr nz, .asm_3a1e9
	call ClearBGMapAndAttrs
	call Func_3a286
	ld a, b
	ld [wOAMAnimation24_Duration + 3], a
	call Func_3a145
	ld a, $32
	ld [wSubroutine], a
	ld a, [wOAMAnimation24_Duration + 3]
	or a
	jr z, .asm_3a1e8
	ld a, $40
	ld [wMusicFade], a
.asm_3a1e8
	ret

.asm_3a1e9
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

Func_3a1f4: ; 3a1f4 (e:61f4)
	ld a, [wOAMAnimation24_Duration + 1]
	cp $20
	jr nz, .asm_3a203
	ld a, [wOAMAnimation24_Palette + 1]
	inc a
	ld [wOAMAnimation24_Palette + 1], a
	ret

.asm_3a203
	check_cgb
	jr z, .asm_3a217
	ld a, $1
	call PaletteFade_
	ld a, [wOAMAnimation24_Duration + 1]
	inc a
	ld [wOAMAnimation24_Duration + 1], a
	ret

.asm_3a217
	ld de, Data_cef38
	ld b, $1
	ld a, [wOAMAnimation24_Duration + 1]
	inc a
	ld [wOAMAnimation24_Duration + 1], a
	ld c, a
	callba Func_cef86
	ret

Func_3a22d:
	ld hl, VTilesBG tile $00
	ld a, [wOAMAnimation24_Palette]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	add hl, de
	ld a, c
	call LoadCharacter_
	hlbgcoord 0, 0
	ld a, [wOAMAnimation24_TemplateBank]
	ld e, a
	ld a, [wOAMAnimation24_XCoord]
	add e
	ld e, a
	ld d, $0
	add hl, de
	ld a, [wOAMAnimation24_TemplateIdx]
	ld e, a
	ld a, [wOAMAnimation24_YCoord]
	add e
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	add hl, de
	ld a, [wOAMAnimation24_Palette]
	ld b, a
.asm_3a27e
	ld a, [rSTAT]
	and $2
	jr nz, .asm_3a27e
	ld [hl], b
	ret

Func_3a286: ; 3a286 (e:6286)
	ld a, $0
	ld [wOAMAnimation24_XCoord], a
	ld a, $0
	ld [wOAMAnimation24_YCoord], a
	ld a, $1
	ld [wOAMAnimation24_Palette], a
.asm_3a295
	ld a, [wOAMAnimation24_Duration]
	ld h, a
	ld a, [wOAMAnimation24_Palette + 2]
	ld l, a
.asm_3a29d
	ld a, [hli]
	ld c, a
	cp $e1
	jr z, .asm_3a2d1
	cp $e2
	jr z, .asm_3a2c2
	ld a, h
	ld [wOAMAnimation24_Duration], a
	ld a, l
	ld [wOAMAnimation24_Palette + 2], a
	call Func_3a22d
	ld a, [wOAMAnimation24_XCoord]
	inc a
	ld [wOAMAnimation24_XCoord], a
	ld a, [wOAMAnimation24_Palette]
	inc a
	ld [wOAMAnimation24_Palette], a
	jr .asm_3a295

.asm_3a2c2
	ld a, [wOAMAnimation24_YCoord]
	inc a
	ld [wOAMAnimation24_YCoord], a
	ld a, $0
	ld [wOAMAnimation24_XCoord], a
	inc hl
	jr .asm_3a29d

.asm_3a2d1
	ld b, [hl]
	inc hl
	ld a, h
	ld [wOAMAnimation24_Duration], a
	ld a, l
	ld [wOAMAnimation24_Palette + 2], a
	xor a
	ret

Pointers_3a2dd:
	dw Data_3a30b
	dw Data_3a320
	dw Data_3a33d
	dw Data_3a360
	dw Data_3a375
	dw Data_3a3a0
	dw Data_3a3e0
	dw Data_3a3f6
	dw Data_3a41d
	dw Data_3a43d
	dw Data_3a46e
	dw Data_3a482
	dw Data_3a4a8
	dw Data_3a4ca
	dw Data_3a4ec
	dw Data_3a50c
	dw Data_3a545
	dw Data_3a566
	dw Data_3a5a5
	dw Data_3a5c6
	dw Data_3a617
	dw Data_3a658
	dw Data_3a66b

Data_3a30b:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  テレファング スタッフ"
	db $e1, 0

Data_3a320:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  げんさく"
	db $e2, " "
	db $e2, "      きの こずえ"
	db $e1, 0

Data_3a33d:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  でんじゅうデザイン"
	db $e2, " "
	db $e2, "      たかき さいこ"
	db $e1, 0

Data_3a360:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  こうだんしゃ スタッフ"
	db $e1, 0

Data_3a375:
	db      " "
	db $e2, " "
	db $e2, " コミックボンボン"
	db $e2, "  へんしゅうちょう"
	db $e2, " "
	db $e2, "    いけだ しんぱちろう"
	db $e1, 0

Data_3a3a0:
	db      " コミックボンボン"
	db $e2, "  へんしゅうぶ"
	db $e2, " "
	db $e2, "    かみぞの こういち"
	db $e2, " "
	db $e2, "    さとう かよ"
	db $e2, " "
	db $e2, "    よしだ もリよし"
	db $e1, 0

Data_3a3e0:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  スマイルソフト スタッフ"
	db $e1, 0

Data_3a3f6:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, " エグゼクティブプロデューサー"
	db $e2, " "
	db $e2, "    いいだ しゅうへい"
	db $e1, 0

Data_3a41d:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, " ディレクター"
	db $e2, " "
	db $e2, "     こばやし こういち"
	db $e1, 0

Data_3a43d:
	db      " "
	db $e2, " "
	db $e2, "  スぺシャルサンクス"
	db $e2, " "
	db $e2, "      ほしの さとみ"
	db $e2, " "
	db $e2, "      おがわ ゆきこ"
	db $e1, 0

Data_3a46e:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "    ナツメ スタッフ"
	db $e1, 0

Data_3a482:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, " エグゼクティブプロデューサー"
	db $e2, " "
	db $e2, "    まつもと たかし"
	db $e1, 0

Data_3a4a8:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  スーパーバイザー"
	db $e2, " "
	db $e2, "      ひろた きみお"
	db $e1, 0

Data_3a4ca:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  プロデューサー"
	db $e2, " "
	db $e2, "      いわさ としかず"
	db $e1, 0

Data_3a4ec:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, " ディレクター"
	db $e2, " "
	db $e2, "     たかおか しゅうや"
	db $e1, 0

Data_3a50c:
	db      "  プログラム"
	db $e2, " "
	db $e2, "     たなか ひろゆき"
	db $e2, " "
	db $e2, "     さいとう ひろし"
	db $e2, " "
	db $e2, "     いわさ としかず"
	db $e1, 0

Data_3a545:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, " グラフィック"
	db $e2, " "
	db $e2, "     かじはら しゅういち"
	db $e1, 0

Data_3a566:
	db      " "
	db $e2, "  サウンドデザイン"
	db $e2, " "
	db $e2, "      みずたに いく"
	db $e2, " "
	db $e2, "      うえだ きぬよ"
	db $e2, " "
	db $e2, "      みずたに ひさこ"
	db $e1, 0

Data_3a5a5:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "  イベントデータ"
	db $e2, " "
	db $e2, "      ひらい せいじ"
	db $e1, 0

Data_3a5c6:
	db      "  スぺシャルサンクス"
	db $e2, " "
	db $e2, "      かなめ としあき"
	db $e2, " "
	db $e2, "      きたむら わたる"
	db $e2, " "
	db $e2, "      さがら なおみ"
	db $e2, " "
	db $e2, "      しらかわ てるゆき"
	db $e1, 0

Data_3a617:
	db      " "
	db $e2, "      ひらの かな"
	db $e2, " "
	db $e2, "      とやま めぐみ"
	db $e2, " "
	db $e2, "      ピュアサウンド"
	db $e2, " "
	db $e2, "      いわさ しょうご"
	db $e1, 0

Data_3a658:
	db      " "
	db $e2, " "
	db $e2, " "
	db $e2, "    AND YOU"
	db $e1, 0

Data_3a66b:
	db      " "
	db $e2, " "
	db $e2, "   THANK YOU"
	db $e2, "      FOR"
	db $e2, " YOUR PLAYING!"
	db $e1, 3

Func_3a696: ; 3a696 (e:6696)
	ld a, [wd401]
	jump_table
	dw Func_3a6ac
	dw Func_3a6b9
	dw Func_3a705
	dw Func_3a7c3
	dw Func_3a7d2
	dw Func_3a7e9

Func_3a6ac:
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_3a6b9:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wc46c], a
	ld a, $7
	ld [wWX], a
	ld a, $90
	ld [wWY], a
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wSCY], a
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_3a705:
	ld bc, $16
	call DecompressGFXByIndex_
	ld bc, $9
	call DecompressGFXByIndex_
	ld bc, $e
	call GetCGB_BGLayout_
	ld a, $28
	call LoadBackgroundPalette
	lb bc, 0, 0
	ld e, $70
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $70
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, 4
	ld e, $ad
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 6, 5
	ld e, $91
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 6, 5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wRecruitedDenjuuSpecies]
	ld de, VTilesBG tile $10
	call GetCurDenjuuKanjiDescription
	ld a, [wRecruitedDenjuuSpecies]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal7
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
	ld a, [wRecruitedDenjuuSpecies]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $58
	call GetAndPrintName75CenterAlign
	ld a, [wRecruitedDenjuuLevel]
	hlbgcoord 10, 2
	ld c, $1
	call Print2DigitBCD_2
	ld bc, $20e
	ld e, $ab
	ld a, $0
	call LoadStdBGMapLayout_
	call OpenSRAMBank2
	ld hl, sAddressBook + $a
	ld a, [wFirstEmptySlotInAddressBook]
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	hlbgcoord 3, 14
	call PrintPhoneNumber_
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ld a, $28
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ret

Func_3a7c3:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_3a7d2:
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_3a7e9:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wd401], a
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

Func_3a7fd: ; 3a7fd (e:67fd)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3a816
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_3a816:
	dw Func_3a81a
	dw Func_3a887

Func_3a81a:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $90
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $14
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $14
	ld [hl], a
	call Func_3a86e
	ret

Func_3a863: ; 3a863 (e:6863)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, asm_3a886
Func_3a86e: ; 3a86e (e:686e)
	push hl
	ld a, BANK(GFX_e3514)
	ld hl, VTilesOB tile $40
	ld de, GFX_e3514
	ld bc, $16 tiles
	call FarCopy2bpp_2
	ld a, $5
	ld bc, $6
	call LoadNthStdOBPalette
	pop hl
asm_3a886
	ret

Func_3a887:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3a863
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld de, Data_3a97e
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	and $7f
	cp $40
	jr c, .asm_3a8aa
	ld de, Data_3a98a
.asm_3a8aa
	ld a, [wVBlankCounter]
	and $0
	jr nz, .asm_3a8ba
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_3a8ba
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	cp $c
	jr c, .asm_3a8c7
	xor a
	ld [hl], a
.asm_3a8c7
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_3a8e7
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_3a8e7
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	sra d
	ld a, $50
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	sra d
	sra d
	sra d
	ld a, $40
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	add $7
	ld e, a
	ld c, $80
	call Multiply_C_by_E
	ld b, d
	ld c, e
	ld de, $c
	call Divide_BC_by_DE_signed_
	ld d, c
	call Sine8_
	sra d
	sra d
	sra d
	sra d
	sra d
	sra d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	sub d
	ld [hl], a
	ld a, [wVBlankCounter]
	and $f
	ret nz
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_2e76
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add $12
	call Func_2e67
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [wCurObjectStruct]
	ld e, a
	callba Func_32228
	ret

Data_3a97e:
	db $90, $91, $92, $93
	db $94, $95, $96, $95
	db $94, $93, $92, $91

Data_3a98a:
	db $97, $98, $99, $9a
	db $9b, $9c, $9d, $9c
	db $9b, $9a, $99, $98

Func_3a996: ; 3a996 (e:6996)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3a9af
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_3a9af:
	dw Func_3a9b7
	dw Func_3aa01
	dw Func_3abf6
	dw Func_3ac38

Func_3a9b7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $10
	ld [hl], a
	callba Func_32294
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $26
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	call Func_3a9f0
	ld b, $25
	callba Func_33870
	ret

Func_3a9f0: ; 3a9f0 (e:69f0)
	call OverworldRandom8_
	and $1f
	add $14
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_3aa01:
	call Func_3ab20
	callba Func_30a09
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_3aa29
	dec a
	ld [hl], a
	or a
	jr nz, .asm_3aa28
	ld a, [wCurObjectStruct]
	add $16
.asm_3aa23
	ld l, a
	ld a, $78
	ld [hl], a
.asm_3aa28
	ret

.asm_3aa29
	ld a, $40
	call Func_3ab4b
	call Func_3aac7
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	jr nz, .asm_3aa60
	call Func_3aac7
	call Func_3a9f0
	call OverworldRandom8_
	and $3
	jr nz, .asm_3aa60
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $fb
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, SFX_10
	ld [H_SFX_ID], a
.asm_3aa60
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	ld c, a
	call CalcL1Distance_
	cp $1e
	jr nc, .asm_3aac2
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_3aac2
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $3c
	ld [hl], a
	call Func_2cb7
	ld a, b
	ld de, Data_3aac3
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	call Func_3aad6
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $44
	ld [wPlayerObjectStruct_Duration + 11], a
.asm_3aac2
	ret

Data_3aac3:
	db 1, 3, 2, 0

Func_3aac7: ; 3aac7 (e:6ac7)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add $10
	swap a
	and $7
	srl a
Func_3aad6: ; 3aad6 (e:6ad6)
	cp $0
	jr z, .asm_3aae7
	cp $1
	jr z, .asm_3aaec
	cp $2
	jr z, .asm_3aaf1
	ld de, Data_3ab18
	jr .asm_3aaf4

.asm_3aae7
	ld de, Data_3ab10
	jr .asm_3aaf4

.asm_3aaec
	ld de, Data_3ab1c
	jr .asm_3aaf4

.asm_3aaf1
	ld de, Data_3ab14
.asm_3aaf4
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	srl a
	srl a
	and $3
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [de]
	ld [hl], a
	ret

Data_3ab10:
	db $59, $5a, $59, $5b

Data_3ab14:
	db $56, $57, $56, $58

Data_3ab18:
	db $53, $54, $53, $55

Data_3ab1c:
	db $50, $51, $50, $52

Func_3ab20: ; 3ab20 (e:6b20)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [wCurObjectStruct]
	ld e, a
	callba Func_323e4
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $26
	ld [hl], a
	ret

Func_3ab4b: ; 3ab4b (e:6b4b)
	push af
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $9
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [hl]
	ld e, a
	pop af
	push de
	push bc
	push af
	ld a, [wOAMAnimation12_XCoord]
	ld b, a
	ld a, [wOAMAnimation12_YCoord]
	add $18
	ld c, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3049
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, d
	ld [hl], a
	pop af
	ld e, a
	call Func_302d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, c
	ld [hli], a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	callba Func_308aa
	callba Func_31334
	ld a, c
	pop bc
	pop de
	or a
	jr z, .asm_3abed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	inc hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
.asm_3abed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ret

Func_3abf6:
	call Func_3ab20
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add b
	jr nz, .asm_3ac25
	push hl
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, h
	ld c, l
	callba Func_31565
	pop hl
	xor a
.asm_3ac25
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, $64
	call Func_3ab4b
	call Func_3ab4b
	ret

Func_3ac38:
	call Func_3ab20
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ret nz
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurMapScripts + 1]
	ld [wScriptNumber + 1], a
	ld b, a
	ld a, [wCurMapScripts]
	ld [wScriptNumber], a
	cp $ff
	jr nz, .asm_3ac6d
	ld a, b
	cp $ff
	jr z, .asm_3ac85
.asm_3ac6d
	ld a, $1
	ld [wcd00], a
	ld a, $0
	ld [wScriptDelay], a
	ld a, $0
	ld [wScriptBank], a
	ld hl, wScriptOffset
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_3ac85
	ret

Func_3ac86: ; 3ac86 (e:6c86)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3ac9f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_3ac9f:
	dw Func_3aca3
	dw Func_3acc9

Func_3aca3:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $23
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_3acc9:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $8
	jr c, .asm_3acf6
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $26
	jr c, .asm_3acf6
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3acf6
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	sub $2
	jr nc, .asm_3ad08
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3ad08
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	ret

SECTION "bank 0F", ROMX, BANK [$f]
INCLUDE "engine/scripting.asm"

INCLUDE "data/unknown_3d027.asm"

MapEncounterTableIndices:
INCLUDE "data/wild_data_tables_by_map.asm"

SECTION "bank 10", ROMX, BANK [$10]
INCLUDE "text/std_text_11.asm"

SECTION "bank 13", ROMX, BANK [$13]
INCLUDE "data/oam_templates_2.asm"

SECTION "bank 14", ROMX, BANK [$14]
INCLUDE "data/oam_templates_3.asm"

SECTION "bank 15", ROMX, BANK [$15]
INCLUDE "data/oam_templates_4.asm"

SECTION "bank 16", ROMX, BANK [$16]
INCLUDE "data/oam_templates_5.asm"

SECTION "bank 17", ROMX, BANK [$17]
INCLUDE "data/oam_templates_6.asm"

SECTION "bank 18", ROMX, BANK [$18]
INCLUDE "data/oam_templates_7.asm"

SECTION "bank 19", ROMX, BANK [$19]
INCLUDE "data/oam_templates_8.asm"

SECTION "bank 1A", ROMX, BANK [$1a]
INCLUDE "battle/anims.asm"

SECTION "bank 1B", ROMX, BANK [$1b]
INCLUDE "battle/anims2.asm"

SECTION "bank 1C", ROMX, BANK [$1c]
INCLUDE "battle/start.asm"

SECTION "bank 1D", ROMX, BANK [$1d]
INCLUDE "battle/result.asm"

SECTION "bank 1F", ROMX, BANK [$1f]
INCLUDE "engine/bank_1f.asm"

SECTION "bank 26", ROMX, BANK [$26]
Data_98000:
INCLUDE "data/unknown_98000.asm"

INCLUDE "text/std_text_10.asm"

SECTION "bank 27", ROMX, BANK [$27]
GrowthRates::
rept 6
x = 1
y = 0
rept 99
y = x + y
x = x + 1
if y < 1998
	dw y
else
	dw 1998
endc
endr
endr

Data_9c4a4::
INCLUDE "data/unknown_9c4a4.asm"

StatOffsetMultipliers::
INCLUDE "data/base_stat_offsets.asm"

Data_9cb29::
INCLUDE "data/move_powers.asm"

Data_9cbb2::
	ddb 6, 5, 4, 3, 2, 1
	ddb 5, 6, 5, 4, 3, 2
	ddb 4, 5, 6, 5, 4, 3
	ddb 3, 4, 5, 6, 5, 4
	ddb 2, 3, 4, 5, 6, 5
	ddb 1, 2, 3, 4, 5, 6

ScriptedEnemyDenjuu::
INCLUDE "data/scripted_denjuu.asm"

EnemyTFangerParties::
INCLUDE "data/tfanger_parties.asm"

SECTION "bank 29", ROMX, BANK [$29]

INCLUDE "engine/print_phone_number.asm"
INCLUDE "engine/phone_call.asm"

GetDenjuuNicknameC: ; a4e02 (29:4e02)
; Gets nickname of owned denjuu in slot C
	ld h, $0
	ld l, c
	sla l
	rl h
	ld b, h
	ld c, l
	sla l
	rl h
	add hl, bc
	jr get_denjuu_nickname_hl_offset

GetDenjuuNicknameFromAdddressBookOffset: ; a4e12 (29:4e12)
; Gets nickname of owned denjuu given sAddressBook + 6 offset
	ld hl, $10000 - (sAddressBook + 6)
	add hl, de
	srl h
	rr l
	srl h
	rr l
	ld b, h
	ld c, l
	srl h
	rr l
	add hl, bc
get_denjuu_nickname_hl_offset
	ld de, sOwnedDenjuuNicknames
	add hl, de
	enable_sram sOwnedDenjuuNicknames
	ld de, wBattlePlayerDenjuuName
	ld c, $6
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld a, "$"
	ld [de], a
	disable_sram
	ret

OverworldSamplePhonecall: ; a4e47 (29:4e47)
	ld a, [wc93f]
	or a
	ret z
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wcd28]
	or a
	jr z, .asm_a4e5c
	dec a
	ld [wcd28], a
	ret

.asm_a4e5c
	ld a, [wDShotReceptionLevel]
	cp $2
	ret c
	ld a, [wc9de]
	or a
	ret nz
	call CheckInOverworld
	ret nz
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	ret nz
	ld a, [wMapGroup]
	cp $b
	ret z
	ld a, $0
	ld [wc93f], a
	ld a, [wPhoneIsRinging]
	cp $1
	ret z
	ld a, [wOverworldPhoneCallCooldown]
	or a
	jr z, .asm_a4e8d
	dec a
	ld [wOverworldPhoneCallCooldown], a
	ret nz
.asm_a4e8d
	call OverworldRandom8_
	and $1
	add $4
	ld [wOverworldPhoneCallCooldown], a
	call .SampleRandomDenjuuToCall
	jr z, .no_denjuu_to_call
	ld a, b
	ld [wCallerID], a
	call GetAddressBookPointerB
	ld a, l
	ld [wPhoneCallDenjuuAddressBookPointer], a
	ld a, h
	ld [wPhoneCallDenjuuAddressBookPointer + 1], a
	ld a, 240
	ld [wPhoneCallRingtoneTimer], a
	ld a, $1
	ld [wPhoneIsRinging], a
	ld a, $1
	ld [wOverworldRingtoneSubroutine], a
	ld a, [wCallerID]
	ld c, a
	call AddDenjuuToRecentCalls
.no_denjuu_to_call
	ret

.SampleRandomDenjuuToCall: ; a4ec2 (29:4ec2)
	call .CountDenjuuAvailableForCall
	ld a, [wCGBPalFadeProgram]
	or a
	ret z
	call OverworldRandom8_
	ld c, a
	ld a, [wCGBPalFadeProgram]
	ld e, a
	call Multiply_C_by_E
	ld a, d
	ld hl, sIdxsOfDenjuuWhoCanCallPlayer
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	enable_sram sIdxsOfDenjuuWhoCanCallPlayer
	ld a, [hl]
	ld b, a
	disable_sram
	or $1
	ret

.CountDenjuuAvailableForCall: ; a4ef3 (29:4ef3)
	enable_sram
	ld de, sIdxsOfDenjuuWhoCanCallPlayer
	ld hl, sAddressBook + 1
	ld b, $0
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld c, a
	ld a, $0
	ld [wCGBPalFadeProgram], a
.loop
	ld a, b
	cp c
	jr z, .next
	ld a, BANK(sAddressBook)
	ld [MBC3SRamBank], a
	ld a, [hl]
	or a
	jr z, .next
	ld a, BANK(sIdxsOfDenjuuWhoCanCallPlayer)
	ld [MBC3SRamBank], a
	ld a, b
	ld [de], a
	inc de
	ld a, [wCGBPalFadeProgram]
	inc a
	ld [wCGBPalFadeProgram], a
.next
	push bc
	ld bc, $10
	add hl, bc
	pop bc
	inc b
	ld a, b
	cp ADDRESS_BOOK_SIZE
	jr nz, .loop
	disable_sram
	ret

AddDenjuuToRecentCalls: ; a4f37 (29:4f37)
; c = Address book index of the Denjuu who's calling
; Append the time they called
; 4 bytes allocated per entry, 3 bytes used; 8 entries total
	ld d, $8
	ld hl, wRecentCalls
.loop
	ld a, [hl]
	or a
	jr nz, .next
.finish
	inc c
	ld a, c
	ld [hli], a
	ld a, [wRTC_Hrs]
	ld [hli], a
	ld a, [wRTC_Mins]
	ld [hl], a
	ret

.next
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec d
	jr nz, .loop
	push bc
	ld hl, wRecentCalls
	ld de, wRecentCalls + 4 * 1
	ld bc, $1c
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	pop bc
	ld hl, wRecentCalls + 4 * 7
	jr .finish

Func_a4f6f: ; a4f6f (29:4f6f)
	di
	xor a
	ld [rIF], a
	ld a, $3
	ld [rIE], a
	ei
	ret

Func_a4f79:
	di
	xor a
	ld [rIF], a
	ld a, $b
	ld [rIE], a
	ei
	ret

Func_a4f83:
	ld a, [wc938]
	inc a
	ld [wc938], a
	ld b, a
	and $7c
	jr nz, Func_a4fcd
	ld a, b
	srl a
	and $1
	ld hl, Data_a4fcb
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, $ff
.asm_a4f9f
	dec c
	jr z, .asm_a4fa8
	ld a, [rSC]
	bit 7, a
	jr nz, .asm_a4f9f
.asm_a4fa8
	ld a, [hl]
	bit 0, b
	jr z, .asm_a4fc4
	ld c, a
	ld a, [rSB]
	cp c
	jr nz, .asm_a4fbe
	ld a, b
	cp $3
	jr nz, .asm_a4fbd
	ld a, $1
	ld [wc936], a
.asm_a4fbd
	ret

.asm_a4fbe
	ld a, $0
	ld [wc936], a
	ret

.asm_a4fc4
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

Data_a4fcb:
	db 0, 0

Func_a4fcd: ; a4fcd (29:4fcd)
	ld a, [wPhoneIsRinging]
	or a
	ret nz
	ld a, $ff
	ld [wPhoneIsRinging], a
	ld a, [wc936]
	or a
	ret z
	ld a, $0
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

Func_a4fe5: ; a4fe5 (29:4fe5)
	ld a, [wc936]
	or a
	ret z
	ld a, [wPhoneIsRinging]
	or a
	ret z
	cp $ff
	ret z
	cp $2
	jr nz, .asm_a5002
	ld b, $0
	ld a, [wc938]
	and $1
	jr z, .asm_a5016
	dec b
	jr .asm_a5016

.asm_a5002
	ld b, $0
	ld a, [wc938]
	inc a
	and $60
	jr z, .asm_a5016
	ld a, [wc938]
	inc a
	bit 1, a
	jr z, .asm_a5016
	ld b, $ff
.asm_a5016
	ld a, b
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

Func_a501e: ; a501e (29:501e)
	ld a, [wc937]
	ld b, a
	ld a, [wc936]
	cp b
	ret z
	ld [wc937], a
Func_a502a: ; a502a (29:502a)
	ld a, [wc95b]
	or a
	ret z
	callba Func_a8608
	ld a, b
	ld [wDShotReceptionLevel], a
Func_a503b: ; a503b (29:503b)
	ld a, [wDShotReceptionLevel]
	swap a
	ld c, a
	ld b, $0
	sla c
	rl b
	ld d, b
	ld e, c
	sla c
	rl b
	ld hl, ReceptionBarsGFX
	add hl, bc
	add hl, de
	ld d, h
	ld e, l
	ld hl, VTilesShared tile $1a
	ld bc, $60
	ld a, BANK(ReceptionBarsGFX)
	call FarCopy2bpp_2
	ret

OverworldGetRTCEveryFourFrames: ; a5060 (29:5060)
	ld a, [wVBlankCounter]
	and $3
	ret nz
OverworldGetRTC:
	enable_sram
	ld a, $0
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	ld a, RTC_S
	ld [MBC3SRamBank], a
	nop
	nop
	ld a, [MBC3RTC]
	ld [wRTC_Secs], a
	ld a, RTC_M
	ld [MBC3SRamBank], a
	nop
	nop
	ld a, [MBC3RTC]
	ld [wRTC_Mins], a
	ld a, RTC_H
	ld [MBC3SRamBank], a
	nop
	nop
	ld a, [MBC3RTC]
	ld [wRTC_Hrs], a
	ld a, RTC_DL
	ld [MBC3SRamBank], a
	nop
	nop
	ld a, [MBC3RTC]
	ld [wRTC_DayLo], a
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	nop
	nop
	ld a, [MBC3RTC]
	and $1
	ld [wRTC_DayHi], a
	disable_sram
	ret

Func_a50be: ; a50be (29:50be)
	ld a, [wc95b]
	or a
	ret z
	ld a, [wSubroutine]
	cp $4
	jr z, Func_a50cd
	cp $5
	ret nz
Func_a50cd: ; a50cd (29:50cd)
	call Func_a51ee
Func_a50d0: ; a50d0 (29:50d0)
	ld a, [wShowClockInOverworld]
	or a
	jr z, .asm_a5126
	ld a, [wc9eb]
	ld b, a
	ld a, [wRTC_Hrs]
	cp b
	jr z, .asm_a5126
	ld [wc9eb], a
	call Func_a51d6
	ld hl, VTilesShared tile $2c
	ld de, GFX_e2d54
	push bc
	ld a, c
	swap a
	ld c, a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $20
	ld a, BANK(GFX_e2d54)
	call FarCopy2bpp_2
	pop bc
	ld hl, VTilesShared tile $2e
	ld de, GFX_e2d54
	ld a, b
	swap a
	ld b, a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $20
	ld a, BANK(GFX_e2d54)
	call FarCopy2bpp_2
.asm_a5126
	ld a, [wc9ed]
	ld b, a
	ld a, [wRTC_Secs]
	cp b
	jr z, .asm_a514e
	ld [wc9ed], a
	ld de, GFX_e2e94
	and $1
	jr nz, .asm_a513d
	ld de, GFX_e2eb4
.asm_a513d
	ld a, [wShowClockInOverworld]
	or a
	jr z, .asm_a514e
	ld hl, VTilesShared tile $30
	ld bc, $20
	ld a, BANK(GFX_e2e94)
	call FarCopy2bpp_2
.asm_a514e
	ld a, $0
	ld [wcad2], a
	ld a, [wc9ea]
	ld b, a
	ld a, [wRTC_Mins]
	cp b
	jr z, .asm_a51d5
	push af
	push bc
	ld a, b
	cp $ff
	jr z, .asm_a5187
	ld a, [wc95c]
	inc a
	ld [wc95c], a
	cp $f
	jr c, .asm_a517a
	ld a, $0
	ld [wc95c], a
	ld bc, EVENT_211
	call ToggleEventFlag
.asm_a517a
	ld a, $1
	ld [wcad2], a
	ld [wc93f], a
	ld a, $78
	ld [wcd28], a
.asm_a5187
	pop bc
	pop af
	ld [wc9ea], a
	call Func_a51d6
	ld a, [wShowClockInOverworld]
	or a
	jr z, .asm_a51d5
	ld hl, VTilesShared tile $32
	ld de, GFX_e2d54
	push bc
	ld a, c
	swap a
	ld c, a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $20
	ld a, BANK(GFX_e2d54)
	call FarCopy2bpp_2
	pop bc
	ld hl, VTilesShared tile $34
	ld de, GFX_e2d54
	ld a, b
	swap a
	ld b, a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld bc, $20
	ld a, BANK(GFX_e2d54)
	call FarCopy2bpp_2
.asm_a51d5
	ret

Func_a51d6: ; a51d6 (29:51d6)
	ld c, $ff
.asm_a51d8
	inc c
	sub $a
	jr nc, .asm_a51d8
	add $a
	ld b, a
	ret

Func_a51e1:
	di
.asm_a51e2
	ld a, [rSTAT]
	and $2
	jr nz, .asm_a51e2
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ei
	ret

Func_a51ee: ; a51ee (29:51ee)
	ld a, [wcad1]
	ld b, a
	ld a, [wPhoneIsRinging]
	cp b
	jr nz, .asm_a5224
	cp $1
	ret nz
	ld a, [wc90b]
	push af
	ld a, [wc938]
	inc a
	and $60
	jr z, .asm_a5215
	ld a, [wc938]
	bit 2, a
	jr nz, .asm_a5215
	ld a, $0
	ld [wc90b], a
	jr .asm_a521a

.asm_a5215
	ld a, $1
	ld [wc90b], a
.asm_a521a
	call Func_36f3
	pop af
	ld [wc90b], a
	add sp, $2
	ret

.asm_a5224
	ld [wcad1], a
	cp $1
	jr nz, .asm_a5231
	call Func_36cf
	jp Func_367b

.asm_a5231
	call Func_36f3
	ld a, $ff
	ld [wc9ea], a
	ld [wc9eb], a
	ld [wc9ed], a
	call Func_a50d0
	jp Func_3672

HandleOverworldRingtone: ; a5245 (29:5245)
	ld a, [wPhoneSilentMode]
	or a
	ret nz
	ld a, [wOverworldRingtoneSubroutine]
	or a
	ret z
	cp $1
	jr z, .stop_music
	cp $2
	jr z, .play_ringtone
	cp $3
	jr z, .stop_ringtone
	cp $4
	jr z, .restart_map_music
	ret

.stop_music
	inc a
	ld [wOverworldRingtoneSubroutine], a
	ld a, $0
	ld [wMapMusic], a
	ld a, $1
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ret

.play_ringtone
	ld a, $0
	ld [wMapMusic], a
	ld a, $5
	ld [wOverworldRingtoneSubroutine], a
	ld a, [wCallerID]
	ld hl, sAddressBookRingtones
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	enable_sram sAddressBookRingtones
	ld a, [hl]
	ld [H_Ringtone], a
	disable_sram
	ld a, $4
	ld [wMusicBank], a
	ret

.stop_ringtone
	inc a
	ld [wOverworldRingtoneSubroutine], a
	jp StopRingtone

.restart_map_music
	xor a
	ld [wOverworldRingtoneSubroutine], a
	jp PlayMapMusic_

Func_a52b2: ; a52b2 (29:52b2)
	ld a, $0
	ld [wcdb6], a
	call ComputeHowManyUnreadMailMessagesToGenerate
	or a
	ret z
	ld [wCustomSpriteDest], a
	call CountDenjuuWhoCouldHaveSentAMailMessage
	ld a, [wOAMAnimation01_PriorityFlags]
	or a
	ret z
	ld a, $2
	ld [wc90b], a
	ld a, [wRTC_Hrs]
.loop
	sub 1
	jr nc, .same_day
	ld a, 23
.same_day
	ld [wOAMAnimation01_TemplateIdx], a
	call OverworldRandom8_
	ld e, a
	ld c, 60
	call Multiply_C_by_E
	ld a, d
	ld [wOAMAnimation01_TemplateBank], a
	call OverworldRandom8_
	ld e, a
	ld a, [wOAMAnimation01_PriorityFlags]
	ld c, a
	call Multiply_C_by_E
	ld hl, wOAMAnimation01_YCoord
	ld c, d
	ld b, $0
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld [wOAMAnimation01_XCoord], a
	ld a, [hli]
	ld b, a
	call InsertMailMessageIntoQueue
	ld a, [wcdb6]
	inc a
	ld [wcdb6], a
	ld a, [wCustomSpriteDest]
	dec a
	ld [wCustomSpriteDest], a
	ld a, [wOAMAnimation01_TemplateIdx]
	jr nz, .loop
	ret

InsertMailMessageIntoQueue: ; a5315 (29:5315)
	ld hl, wMailMessages
	ld e, $8
.loop
	ld a, [hl]
	or a
	jr nz, .next
.finish
	inc b
	ld a, b
	ld [hli], a
	ld a, [wOAMAnimation01_TemplateIdx]
	ld [hli], a
	ld a, [wOAMAnimation01_TemplateBank]
	ld [hli], a
	push hl
	push bc
	push de
	call OverworldRandom8_
	ld c, a
	ld e, $60
	call Multiply_C_by_E
	ld a, d
	pop de
	pop bc
	pop hl
	ld [hl], a
	ret

.next
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec e
	jr nz, .loop
	push bc
	ld hl, wMailMessages
	ld de, wMailMessages + $4
	ld bc, $1c
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .copy
	pop bc
	ld hl, wMailMessages + $1c
	jr .finish

CountDenjuuWhoCouldHaveSentAMailMessage: ; a535e (29:535e)
	enable_sram sAddressBook
	ld de, wOAMAnimation01_YCoord
	ld hl, sAddressBook + 1
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld c, a
	ld b, $0
.loop
	ld a, c
	cp b
	jr z, .next
	ld a, [hl]
	or a
	jr z, .next
	push hl
	ld a, 3 - 1
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	and $f
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, [wOAMAnimation01_PriorityFlags]
	inc a
	ld [wOAMAnimation01_PriorityFlags], a
	pop hl
.next
	push de
	ld de, $10
	add hl, de
	pop de
	inc b
	ld a, b
	cp ADDRESS_BOOK_SIZE
	jr c, .loop
	push af
	disable_sram
	pop af
	ret

ComputeHowManyUnreadMailMessagesToGenerate: ; a53ae (29:53ae)
	ld a, [wRTC_DayHi]
	ld b, a
	ld a, [wRTC_DayLo]
	ld c, a
	ld de, 24
	call Multiply_DE_by_BC
	ld a, [wRTC_Hrs]
	ld l, a
	ld h, $0
	add hl, de
	push hl
	call OverworldGetRTC
	ld a, [wRTC_DayHi]
	ld b, a
	ld a, [wRTC_DayLo]
	ld c, a
	ld de, 24
	call Multiply_DE_by_BC
	ld a, [wRTC_Hrs]
	ld l, a
	ld h, $0
	add hl, de
	pop bc
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	add hl, bc
	ld b, h
	ld c, l
	ld de, 6
	ld a, BANK(ComputeHowManyUnreadMailMessagesToGenerate)
	ld [wPrevROMBank], a
	call Divide_BC_by_DE_signed_
	ld a, b
	or a
	jr z, .eight_bits
	ld c, $7f
.eight_bits
	ld a, c
	cp $80
	jr c, .seven_bits
	ld a, $7f
.seven_bits
	ld c, a
	call OverworldRandom8_
	ld e, a
	call Multiply_C_by_E
	ld a, $80
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	inc de
	ld a, d
	cp $5
	jr c, .okay_finish
	ld a, $4
.okay_finish
	ret

Func_a5418: ; a5418 (29:5418)
	inc c
	push bc
	call .DeleteAllRecentCallsFromDenjuu
	pop bc
	jp Func_a5461

.DeleteAllRecentCallsFromDenjuu: ; a5421 (29:5421)
.outer_loop
	ld d, $8
	ld hl, wRecentCalls
	ld b, $0
.loop
	ld a, [hl]
	cp c
	jr nz, .next
	ld [hl], $0
	ld a, b
	cp $7
	ret z
	push bc
	ld a, $7
	sub b
	add a
	add a
	ld c, a
	ld d, h
	ld e, l
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy
	ld hl, wRecentCalls + 4 * 7
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop bc
	jr .outer_loop

.next
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	inc b
	dec d
	jr nz, .loop
	ret

Func_a5461: ; a5461 (29:5461)
.outer_loop2
	ld d, $8
	ld hl, wMailMessages
	ld b, $0
.loop2
	ld a, [hl]
	cp c
	jr nz, .next2
	ld [hl], $0
	ld a, b
	cp $7
	ret z
	push bc
	ld a, $7
	sub b
	add a
	add a
	ld c, a
	ld d, h
	ld e, l
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.copy2
	ld a, [hli]
	ld [de], a
	inc de
	dec c
	jr nz, .copy2
	ld hl, wMailMessages + $1c
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	pop bc
	jr .outer_loop2

.next2
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	inc b
	dec d
	jr nz, .loop2
	ret

Func_a54a1:
	ret

HealPartnerDenjuuInOverworld: ; a54a2 (29:54a2)
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .pressing_b
	ld a, [wOverworldFrameCounter]
	and $1f
	ret nz
.pressing_b
	call GetPartnerDenjuuMaxHP
	ld a, [wPartnerDenjuuHPRemaining]
	cp c
	ret z
	jr nc, .max_hp
	inc a
	ld [wPartnerDenjuuHPRemaining], a
	jr .check_hud

.max_hp
	ld a, c
	ld [wPartnerDenjuuHPRemaining], a
.check_hud
	ld a, [wNumIdleFrames]
	cp $5a
	jr c, .no_hud
	ld a, [wIdleHUDVisible]
	or a
	jr z, .no_hud
	callba DrawOverworldIdleHUD
.no_hud
	ret

Func_a54d8:
	ld a, [wPartnerDenjuuHPRemaining]
	add b
	jr nc, .asm_a54e0
	ld a, $ff
.asm_a54e0
	ld [wPartnerDenjuuHPRemaining], a
	call GetPartnerDenjuuMaxHP
	ld a, [wPartnerDenjuuHPRemaining]
	cp c
	ret z
	ret c
	ld a, c
	ld [wPartnerDenjuuHPRemaining], a
	ret

Func_a54f1: ; a54f1 (29:54f1)
	enable_sram sAddressBook
	call GetPartnerDenjuuAddressBookPointer
	inc hl
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	disable_sram
	ret

Func_a5509:
	enable_sram sAddressBook
	call GetPartnerDenjuuAddressBookPointer
	inc hl
	ld a, [hli]
	ld d, a
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	disable_sram
	ret

GetPartnerDenjuuMaxHP: ; a5525 (29:5525)
	enable_sram sAddressBook
	call GetPartnerDenjuuAddressBookPointer
	ld a, BANK(GetPartnerDenjuuMaxHP)
	ld [wPrevROMBank], a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld b, a
	ld a, d
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld c, a
	disable_sram
	ret

GetAddressBookPointerB: ; a554b (29:554b)
	ld a, b
	jr get_address_book_pointer

GetPartnerDenjuuAddressBookPointer: ; a554e (29:554e)
	ld a, [wAddressBookIndexOfPartnerDenjuu]
get_address_book_pointer
	ld hl, sAddressBook
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ret

FadeOutOverworldForMinimap__: ; a5569 (29:5569)
	callba FadeOutOverworldForMinimap
	ret

LoadPhoneCallLayout: ; a5572 (29:5572)
	ld a, BANK(LoadPhoneCallLayout)
	ld [wPrevROMBank], a
	call Func_20f6
	enable_sram sAddressBook
	ld hl, sAddressBook
	ld a, [wCallerID]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld [wOAMAnimation12_Duration + 3], a
	disable_sram
	ld a, b
	call PhoneCall_LoadGFX
	ld a, $0
	ld [wOAMAnimation12_Duration + 6], a
	ld a, $0
	ld [wOAMAnimation12_Duration + 7], a
	ld a, $0
	ld [wOAMAnimation12_Duration + 14], a
	ld a, BANK(PhoneCallTextBoxFrame)
	ld hl, VTilesShared tile $70
	ld de, PhoneCallTextBoxFrame
	ld bc, $f0
	call FarCopy2bpp_2
	ld a, BANK(LoadPhoneCallLayout)
	ld [wPrevROMBank], a
	callba PhoneCall_PrintText ; same bank
	call LoadSpecialFontTiles
	ld d, $6
	ld bc, $14
	hlbgcoord 0, 12
	ld a, $5
	call FillAttrMapBoxWithByte
	ld d, $1
	ld bc, $8
	hlbgcoord 6, 11
	ld a, $1
	call FillAttrMapBoxWithByte
	ld de, GFX_a5d29
	ld hl, VTilesShared tile $20
	ld bc, $e0
	call Copy2bpp_2
	call PhoneCall_PrintFDAndDeltaFD
	call .PrintCallerID
	jp IncrementSubroutine

.PrintCallerID: ; a560a (29:560a)
	ld a, [wCallerID]
	ld c, a
	callba GetDenjuuNicknameC
	ld hl, wBattlePlayerDenjuuName
	ld de, wOAMAnimation12_Duration + 8
	call CenterAlignDenjuuName_
	ld b, $8
	ld c, $b0
	hlbgcoord 6, 3
.loop
	di
	call TextWaitStat
	ld a, c
	ld [hli], a
	ei
	inc c
	dec b
	jr nz, .loop
	ld b, $8
	ld hl, VTilesShared tile $30
	ld de, wOAMAnimation12_Duration + 8
.loop2
	ld a, [de]
	cp "$"
	jr nz, .good
	ld a, $0
.good
	inc de
	push bc
	push de
	call LoadCharacter_
	pop de
	pop bc
	dec b
	jr nz, .loop2
	ld d, $1
	ld bc, $8
	hlbgcoord 6, 3
	ld a, $1
	call FillAttrMapBoxWithByte
	ret

PhoneCall_PrintFDAndDeltaFD: ; a5659 (29:5659)
	di
	call TextWaitStat
	ld a, $aa
	bgcoord_a 6, 11
	call TextWaitStat
	ld a, $ab
	bgcoord_a 7, 11
	ei
	ld a, [wOAMAnimation12_Duration + 3]
	call Get2DigitBCD
	hlbgcoord 8, 11
	di
	call .Print3DigitNumber
	ei
	ld c, $ac ; +
	ld a, [wOAMAnimation12_Duration + 6]
	bit 7, a
	jr z, .positive
	ld c, $ad ; -
	cpl
	inc a
.positive
	ld b, a
	di
	call TextWaitStat
	ld a, c
	ld [hli], a
	ei
	ld a, b
	call Get2DigitBCD
	di
	call .Print2DigitNumber
	ei
	ret

.Print3DigitNumber: ; a5698 (29:5698)
	ld a, [wCGBPalFadeProgram]
	and $f
	add $a0
	ld c, a
	call TextWaitStat
	ld a, c
	ld [hli], a
.Print2DigitNumber: ; a56a5 (29:56a5)
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $a0
	ld c, a
	call TextWaitStat
	ld a, c
	ld [hli], a
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $a0
	ld c, a
	call TextWaitStat
	ld a, c
	ld [hli], a
	ret

FadeIntoPhoneCall: ; a56c2 (29:56c2)
	ld bc, $0
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

HandlePhoneCall: ; a56cd (29:56cd)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .wait_text
	ld a, [wOAMAnimation12_Duration + 6]
	push af
	callba PhoneCall_PrintText ; same bank
	call LoadSpecialFontTiles
	ld a, [wOAMAnimation12_Duration + 6]
	add $40
	ld b, a
	pop af
	add $40
	cp b
	jr z, .reset_and_refresh
	jr nc, .wrong_answer
	ld a, SFX_4A ; plus
	ld [H_SFX_ID], a
	jr .reset_and_refresh

.wrong_answer
	ld a, SFX_5B ; minus
	ld [H_SFX_ID], a
.reset_and_refresh
	call PhoneCall_PrintFDAndDeltaFD
	ld bc, EVENT_SAID_YES
	call ResetEventFlag
	ld bc, EVENT_SAID_NO
	call ResetEventFlag
	ld a, [wPhoneCallSubroutine]
	cp $1
	jr z, .fade_out
	ret

.fade_out
	ld a, $0
	ld [wPhoneIsRinging], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

.wait_text
	ret

FadeOutFromPhoneCall: ; a572c (29:572c)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

Func_a573e:
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $6
	ld [wca65], a
	ld d, $c
	ld b, $0
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wcada], a
	callba DrawTextboxInterior
	callba Func_a8c68
	jp PrintText_

PhoneCall_LoadGFX: ; a576c (29:576c)
	push af
	call LoadPhoneGFX_BGTile00_
	ld a, [wCurBackground]
	call LoadPhoneBackground_BGTile20_
	pop af
	push af
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld hl, GFX_de95f
	ld de, VTilesShared tile $00
	ld bc, $100
	ld a, BANK(GFX_de95f)
	call Copy2bpp
	ld a, [wCurBackground]
	add $50
	ld e, a
	push de
	ld bc, $0
	ld a, $0
	call LoadStdBGMapLayout_
	pop de
	ld bc, $0
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $c
	ld e, $1a
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $c
	ld e, $1a
	ld a, $0
	call LoadStdBGMapAttrLayout_
	pop af
	call GetDenjuuPalette_Pal6
	ld hl, $60
	ld a, [wRTC_Hrs]
	cp 20
	jr nc, .night
	cp 4
	jr nc, .day
.night
	ld hl, $380
.day
	ld a, [wCurBackground]
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	push hl
	pop bc
	push bc
	ld a, $3
	call LoadNthStdBGPalette
	pop bc
	inc bc
	ld a, $4
	call LoadNthStdBGPalette
	ld bc, $36
	ld a, $1
	call LoadNthStdBGPalette
	ld bc, $55
	ld a, $5
	call LoadNthStdBGPalette
	ld a, [wDShotLevel]
	ld e, a
	ld d, $0
	ld hl, $390
	add hl, de
	push hl
	pop bc
	xor a
	call LoadNthStdBGPalette
	ld a, $1
	ld [wdd06], a
	ld b, $5
	call LoadTextBoxPalette_
	ret

FadeOutOverworldForMinimap___: ; a5814 (29:5814)
	callba FadeOutOverworldForMinimap
	ld a, $0
	ld [wOAMAnimation11_Duration + 14], a
	ret

LoadSpecialGFX: ; a5822 (29:5822)
	ld a, [wSpecialID]
	add $3
	cp $14
	jr c, .load_gfx
	cp $32
	jr nc, .load_gfx
	sub $14
	jp .WaitGFX_Between14and32

.load_gfx
	ld a, BANK(LoadSpecialGFX)
	ld [wPrevROMBank], a
	ld a, $0
	ld [wOAMAnimation12_Duration + 2], a
	ld a, [wSpecialID]
	cp $7
	jr nz, .other_gfx
	call .SummonedIntoDenjuuWorld
	jr .finish_special_loading

.other_gfx
	ld c, $30
	add c
	ld c, a
	ld b, $0
	call GetCGB_BGLayout_
	ld a, [wSpecialID]
	ld c, $50
	add c
	ld c, a
	ld b, $0
	call DecompressGFXByIndex_
	ld a, [wSpecialID]
	ld e, $c0
	add e
	ld e, a
	ld bc, $0
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wSpecialID]
	ld e, $c0
	add e
	ld e, a
	ld bc, $0
	ld a, $0
	call LoadStdBGMapAttrLayout_
.finish_special_loading
	ld a, $0
	ld [wTextSubroutine], a
	ld a, [wSpecialID]
	cp $0
	jr z, .special0
	cp $1
	jr z, .special1
	cp $2
	jr z, .special2
	jr .special2

.special0
	ld a, $40
	ld [wSCY], a
	ld a, $0
	ld [wCustomSpriteDest], a
	ld a, $0
	ld [wCustomSpriteDest + 1], a
	ld a, $10
	ld [wSpriteDestIsCustom], a
	jp IncrementSubroutine

.special1
	ld a, $0
	ld [wCustomSpriteDest], a
	ld a, $14
	ld [wCustomSpriteDest + 1], a
	ld a, $1e
	ld [wSpriteDestIsCustom], a
	jp IncrementSubroutine

.special2
	ld a, $0
	ld [wCustomSpriteDest], a
	jp IncrementSubroutine

.SummonedIntoDenjuuWorld: ; a58c4 (29:58c4)
	ld bc, $7
	call DecompressGFXByIndex_
	ld bc, $8
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $f
	call GetCGB_BGLayout_
	hlbgcoord 0, 18
	ld a, $1
	ld bc, $80
	call FillVRAMWithByte_
	hlbgcoord 0, 28
	ld a, $1
	ld bc, $80
	call FillVRAMWithByte_
	ld d, $4
	ld bc, $14
	hlbgcoord 0, 18
	ld a, $1
	call FillAttrMapBoxWithByte
	ld d, $4
	ld bc, $14
	hlbgcoord 0, 28
	ld a, $1
	call FillAttrMapBoxWithByte
	ret

.WaitGFX_Between14and32: ; a591b (29:591b)
	ld b, a
	ld a, [wOAMAnimation11_Duration + 14]
	cp $2
	jr c, .update_oam
	call LoadFlickeringGFX
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

.update_oam
	inc a
	ld [wOAMAnimation11_Duration + 14], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

StartFadeInToSpecial: ; a593b (29:593b)
	ld bc, $0
	ld a, $4
	call StartFade_
	ld a, $0
	ld [wOAMAnimation11_Duration + 14], a
	jp IncrementSubroutine

DoFadeInToSpecial: ; a594b (29:594b)
	ld a, [wSpecialID]
	cp $7
	jp z, .summoned_into_denjuu_world
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wSpriteDestIsCustom]
	or a
	jr z, .get_text_id
	dec a
	ld [wSpriteDestIsCustom], a
	ret

.get_text_id
	ld a, [wSpecialID]
	cp $0
	jr z, .zero_default
	cp $1
	jr z, .one
	cp $2
	jp z, .two
.zero_default
	ld a, [wSCY]
	cp $20
	jr c, .less_than_20
	ld a, [wCustomSpriteDest + 1]
	add $1
	ld [wCustomSpriteDest + 1], a
	jr .okay

.less_than_20
	ld a, [wCustomSpriteDest + 1]
	sub $1
	ld [wCustomSpriteDest + 1], a
.okay
	ld b, a
	ld a, [wCustomSpriteDest]
	add b
	ld [wCustomSpriteDest], a
	jr nc, .no_carry
	ld a, [wSCY]
	or a
	jr z, .no_carry
	dec a
	ld [wSCY], a
.no_carry
	ld a, [wSCY]
	or a
	ret nz
	jp Func_a5a31

.one
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .dont_decrease
	dec a
.dont_decrease
	ld [wCustomSpriteDest + 1], a
	ld b, a
	ld a, [wCustomSpriteDest]
	add b
	ld [wCustomSpriteDest], a
	srl a
	ld [wSCX], a
	ld a, [wCustomSpriteDest + 1]
	or a
	jr nz, .wait_text
	ld b, $0
	ld c, $a1
	ld hl, wBGMapAnchor
	ld a, $c
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, [wTextSubroutine]
	or a
	jr nz, .print
	ld a, $2
	ld [wFontPaletteMode], a
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld d, $d
	callba LoadTextPointer
.print
	call PrintText_
.wait_text
	ld a, [wTextSubroutine]
	cp $9
	jr nz, asm_a5a4a
	ld a, $0
	ld [wFontPaletteMode], a
	jr Func_a5a31

.summoned_into_denjuu_world
	jp AnimateSummonsIntoDenjuuWorld

.two
	ld a, [wTextSubroutine]
	or a
	jr nz, .print
	ld b, $0
	ld c, $a1
	ld a, $2
	ld [wFontPaletteMode], a
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld d, $d
	callba AnchorMapAndLoadTextPointer
	ret

Func_a5a31: ; a5a31 (29:5a31)
	ld a, [wOAMAnimation12_Duration + 2]
	inc a
	ld [wOAMAnimation12_Duration + 2], a
	cp $78
	jr nc, .asm_a5a42
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	jr z, asm_a5a4a
.asm_a5a42
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

asm_a5a4a
	ret

AnimateSummonsIntoDenjuuWorld: ; a5a4b (29:5a4b)
	ld a, [wOAMAnimation11_Duration + 14]
	cp $0
	jr z, .fade_in
	cp $1
	jr z, .wait_text
	cp $2
	jr z, .player_fall
	cp $3
	jp z, .friend_fall
	cp $4
	jp z, .fade_out
.fade_in
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wc95b], a
	ld b, $0
	ld c, $a0
	call Func_a5b8a
	ld a, [wOAMAnimation11_Duration + 14]
	inc a
	ld [wOAMAnimation11_Duration + 14], a
	ret

.wait_text
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wOAMAnimation12_Duration + 2]
	inc a
	ld [wOAMAnimation12_Duration + 2], a
	cp $3c
	jr nc, .waited_60_frames
	ret

.waited_60_frames
	ld a, $0
	ld [wOAMAnimation12_Duration + 2], a
	ld a, [wOAMAnimation11_Duration + 14]
	inc a
	ld [wOAMAnimation11_Duration + 14], a
	ld a, $4
	call StartFade_
	ld a, SFX_71
	ld [H_SFX_ID], a
	ret

.player_fall
	ld a, [wOAMAnimation12_Duration + 2]
	inc a
	ld [wOAMAnimation12_Duration + 2], a
	push af
	cp $78
	jr c, .skip_fade_check
	ld a, $3
	call PaletteFade_
	or a
	jr nz, .load_palettes
.skip_fade_check
	pop af
	and $1
	jr z, .quit
	ld a, [wOAMAnimation12_Duration + 2]
	and $1
	jr z, .skip_inc
	ld a, [wOAMAnimation11_Duration + 13]
	inc a
	ld [wOAMAnimation11_Duration + 13], a
.skip_inc
	ld a, [wOAMAnimation11_Duration + 13]
	ld b, a
	ld a, [wOAMAnimation11_Duration + 12]
	add b
	ld [wOAMAnimation11_Duration + 12], a
	ld d, a
	call Sine8_
	sra d
	sra d
	sra d
	sra d
	ld a, d
	ld [wSCY], a
.quit
	ret

.load_palettes
	add sp, $2
	ld a, $0
	ld [wSCY], a
	ld a, [wOAMAnimation11_Duration + 14]
	inc a
	ld [wOAMAnimation11_Duration + 14], a
	hlbgcoord 0, 0
	ld a, $1
	ld bc, $240
	call FillVRAMWithByte_
	ld d, $12
	ld bc, $14
	hlbgcoord 0, 0
	ld a, $1
	call FillAttrMapBoxWithByte
	ld b, $0
	ld c, $98
	call Func_a5b8a
	ld a, $29
	ld [wPrevROMBank], a
	ld bc, $f
	call GetCGB_BGLayout_
	ld bc, $14
	ld a, $4
	call LoadNthStdOBPalette
	ld bc, $2e5
	ld a, $5
	call LoadNthStdOBPalette
	ld a, $4
	call StartFade_
	call Func_a5bb5
	ret

.friend_fall: ; a5b3f (29:5b3f)
	call Func_a5c2b
	call Func_a5ca7
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, BANK(AnimateSummonsIntoDenjuuWorld)
	ld [wPrevROMBank], a
	ld a, $2
	call PaletteFade_
	or a
	ret z
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wOAMAnimation01_Duration + 13]
	cp $4
	ret nc
	ld a, $0
	ld [wOAMAnimation12_Duration + 2], a
	ld a, [wOAMAnimation11_Duration + 14]
	inc a
	ld [wOAMAnimation11_Duration + 14], a
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ret

.fade_out: ; a5b77 (29:5b77)
	ld a, [wOAMAnimation12_Duration + 2]
	inc a
	ld [wOAMAnimation12_Duration + 2], a
	cp $1e
	ret c
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_a5b89:
	ret

Func_a5b8a: ; a5b8a (29:5b8a)
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $2
	ld [wFontPaletteMode], a
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, BANK(Func_a5b8a)
	ld [wPrevROMBank], a
	ld d, $d
	callba LoadTextPointer
	ret

Func_a5bb5: ; a5bb5 (29:5bb5)
	ld a, $3
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $10
	ld [wOAMAnimation01_TemplateBank], a
	ld a, $f0
	ld [wOAMAnimation01_XCoord], a
	ld a, $f0
	ld [wOAMAnimation01_YCoord], a
	ld a, $4
	ld [wOAMAnimation01_TemplateIdx], a
	ld a, $e8
	ld [wOAMAnimation01_Duration + 15], a
	ld a, $fa
	ld [wOAMAnimation01_Duration + 13], a
	ld a, $3
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $10
	ld [wOAMAnimation02_TemplateBank], a
	ld a, $34
	ld [wOAMAnimation02_XCoord], a
	ld a, $44
	ld [wOAMAnimation02_YCoord], a
	ld a, $e0
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $98
	ld [wOAMAnimation02_Duration + 15], a
	ld a, $b4
	ld [wOAMAnimation02_Duration + 13], a
	call Func_a5c0a
	call Func_a5c2b
	call Func_a5ca7
	ld a, SFX_70
	ld [H_SFX_ID], a
	ret

Func_a5c0a: ; a5c0a (29:5c0a)
	ld a, $b
	call Func_31eb
	push hl
	pop de
	ld a, BANK(SpecialSprite1)
	ld hl, VTilesOB tile $00
	ld bc, $400
	call FarCopy2bpp_2
	ld de, SpecialSprite7
	ld a, BANK(SpecialSprite7)
	ld hl, VTilesOB tile $40
	ld bc, $400
	call FarCopy2bpp_2
	ret

Func_a5c2b: ; a5c2b (29:5c2b)
	ld hl, wCurObjectStruct
	ld a, $a0
	ld [hli], a
	ld a, $c0
	ld [hl], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $c8
	jr c, .asm_a5c55
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	cp $c8
	ret nz
	ld a, SFX_70
	ld [H_SFX_ID], a
	ret

.asm_a5c55
	cp $78
	jr nc, .asm_a5c6d
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_a5c6d
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	cp $13
	jr nc, .asm_a5c6d
	ld [hl], a
.asm_a5c6d
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld [hl], a
	ld d, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld [hl], a
	ld e, a
	lb bc, $50, $44
	call AddVector_
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_a5ca7: ; a5ca7 (29:5ca7)
	ld hl, wCurObjectStruct
	ld a, $c0
	ld [hli], a
	ld a, $c0
	ld [hl], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $2
	jr nc, .asm_a5cc5
	ld a, $0
	ld [wOAMAnimation02_PriorityFlags], a
	ret

.asm_a5cc5
	cp $78
	jr nc, .asm_a5cdd
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_a5cdd
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	cp $ee
	jr nc, .asm_a5cdd
	ld [hl], a
.asm_a5cdd
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld [hl], a
	ld d, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld [hl], a
	ld e, a
	lb bc, $50, $44
	call AddVector_
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_a5d17: ; a5d17 (29:5d17)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

GFX_a5d29: INCBIN "gfx/misc/a5d29.2bpp"

Data_a5e09:
macro_a5e09: MACRO
	dw \1
	dw \2
	dw \3
	dw \4
	db BANK(\1)
	db BANK(\2)
	ENDM

	macro_a5e09 GFX_180000, Tilemap_17c000, Tilemap_17c438, Palettes_17c870
	macro_a5e09 GFX_181540, Tilemap_17c168, Tilemap_17c5a0, Palettes_17da71
	macro_a5e09 GFX_182a80, Tilemap_17c2d0, Tilemap_17c708, Palettes_17ec72

LoadFlickeringGFX: ; a5e27 (29:5e27)
	ld a, b
	sla a
	ld b, a
	sla a
	sla a
	add b
	ld hl, Data_a5e09
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld de, wcadf
	ld b, $a
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy
	ld a, $0
	ld [wLCDC], a
	ld [rLCDC], a
	call FillBottomRowOfBGMapForSpecialFlickeringGFX
	call LoadGFXForSpecialFlickeringGFX
	ld a, $c3
	ld [wLCDC], a
	ld [rLCDC], a

	di
.loop
	call FlickeringGFX_PushPalettes
	call UpdateSound
	call ReadJoypad
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .loop
	xor a
	ld [rVBK], a
	ld a, $80
	ld hl, rBGPI
	ld [hl], a
	ld hl, rLY
	xor a
.wait_ly
	cp [hl]
	jr nz, .wait_ly
	ld l, $69
	ld a, $ff
	ld b, $4
.white_palettes
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	ld [hl], a
	dec b
	jr nz, .white_palettes
	di
	ei
	nop
	ret

LoadGFXForSpecialFlickeringGFX: ; a5e95 (29:5e95)
	xor a
	ld [rVBK], a
	ld hl, VTilesShared tile $00
	ld bc, $1000
	ld a, [wcadf]
	ld e, a
	ld a, [wcae0]
	ld d, a
	ld a, [wcae7]
	call Special_LoadGFX_NoWaitStat
	ld a, $1
	ld [rVBK], a
	ld hl, VTilesShared tile $00
	ld bc, $540
	ld a, [wcae7]
	call Special_LoadGFX_NoWaitStat
	hlbgcoord 0, 0
	ld a, [wcae1]
	ld c, a
	ld a, [wcae2]
	ld b, a
	ld a, [wcae8]
	call Special_LoadTilemap_NoWaitStat
	xor a
	ld [rVBK], a
	hlbgcoord 0, 0
	ld a, [wcae3]
	ld c, a
	ld a, [wcae4]
	ld b, a
	ld a, [wcae8]
	call Special_LoadTilemap_NoWaitStat
	ret

FillBottomRowOfBGMapForSpecialFlickeringGFX: ; a5ee2 (29:5ee2)
	ld a, $1
	ld [rVBK], a
	ld d, $7
	call .LoadToBGMap
	ld d, $ff
	ld a, $0
	ld [rVBK], a
.LoadToBGMap
	hlbgcoord 0, 31
	ld e, $a
.load
	ld a, d
	ld [hli], a
	ld [hli], a
	dec e
	jr nz, .load
	ret

FadeOutOverworldForMinimap____: ; a5efd (29:5efd)
	callba FadeOutOverworldForMinimap
	ret

Func_a5f06: ; a5f06 (29:5f06)
	ld a, MUSIC_EVOLUTION
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $0
	ld [wOAMAnimation12_Duration + 2], a
	ld a, BANK(Func_a5f06)
	ld [wPrevROMBank], a
	ld bc, $34
	call GetCGB_BGLayout_
	ld de, GFX_fcceb
	ld a, BANK(GFX_fcceb)
	ld hl, VTilesShared tile $00
	ld bc, $6e0
	call FarCopy2bpp_2
	ld de, GFX_fc4eb
	ld a, $3f
	ld hl, VTilesBG tile $00
	ld bc, $800
	call FarCopy2bpp_2
	ld a, BANK(Func_a5f06)
	ld [wPrevROMBank], a
	ld a, $0
	ld [rVBK], a
	ld de, Tilemap_e3784
	hlbgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld c, SCREEN_WIDTH
	call Func_3410
	ld a, $1
	ld [rVBK], a
	ld de, Tilemap_e38ec
	hlbgcoord 0, 0
	ld b, SCREEN_HEIGHT
	ld c, SCREEN_WIDTH
	call Func_3410
	ld a, $0
	ld [rVBK], a
	ld a, BANK(Func_a5f06)
	ld [wPrevROMBank], a
	ld bc, $0
	ld a, $4
	call StartFade
	jp IncrementSubroutine

Func_a5f78: ; a5f78 (29:5f78)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

Func_a5f82: ; a5f82 (29:5f82)
	ld a, [wOAMAnimation12_Duration + 2]
	cp $3c
	jr nc, .asm_a5f8e
	inc a
	ld [wOAMAnimation12_Duration + 2], a
	ret

.asm_a5f8e
	ld a, [hJoyLast]
	and A_BUTTON | B_BUTTON
	ret z
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_a5f9b: ; a5f9b (29:5f9b)
	call FadeOutFromPhoneCall
	ret

Data_a5f9f:
	dw GFX_a0000
	dw GFX_a0100
	dw GFX_a0130
	dw GFX_a0250
	dw GFX_a02d0
	dw GFX_a0480
	dw GFX_a0600
	dw GFX_a0760
	dw GFX_a08d0
	dw GFX_a0a00
	dw GFX_a0b60
	dw GFX_a0bf0
	dw GFX_a0dd0
	dw GFX_a0f70
	dw GFX_a11b0
	dw GFX_a12f0
	dw GFX_a1330
	dw GFX_a13e0
	dw GFX_a14f0
	dw GFX_a15e0
	dw GFX_a16a0
	dw GFX_a17e0
	dw GFX_a18f0
	dw GFX_a19d0
	dw GFX_a1ad0
	dw GFX_a1b10
	dw GFX_a1c50
	dw GFX_a1e70
	dw GFX_a2180
	dw GFX_a2300
	dw GFX_a23b0
	dw GFX_a24e0
	dw GFX_a2590
	dw GFX_a2760
	dw GFX_a2900
	dw GFX_a2ac0
	dw GFX_a3320

Data_a5fe9: INCBIN "data/unknown_a5fe9.bin"

StoryPhoneNumbers:
	db $60, $6a, $78, $7a, $64, $7c, $70, $64, $7a, $78, $6e, $62, $6a, $68 ; 05#-2*82-#7154
	db $60, $6a, $7c, $7a, $62, $66, $78, $64, $7a, $72, $66, $68, $78, $64 ; 05*-13#2-934#2
	db $60, $78, $6a, $7a, $6e, $78, $60, $66, $7a, $68, $6e, $78, $60, $6a ; 0#5-7#03-47#05
	db $60, $6a, $7c, $7a, $70, $78, $6c, $6c, $7a, $7c, $72, $6a, $68, $66 ; 05*-8#66-*9543
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $66, $7c, $62, $62, $7a, $6a, $7c, $70, $6c, $6c ; 05#-3*11-5*866
	db $60, $6a, $78, $7a, $60, $78, $6e, $64, $7a, $60, $6a, $68, $7c, $66 ; 05#-0#72-054*3
	db $60, $7c, $6a, $7a, $7c, $62, $62, $62, $7a, $64, $64, $7c, $6e, $6e ; 0*5-*111-22*77
	db $60, $6a, $78, $7a, $68, $7c, $68, $62, $7a, $66, $60, $78, $66, $66 ; 05#-4*41-30#33
	db $60, $6a, $7c, $7a, $7c, $6a, $68, $72, $7a, $68, $66, $70, $78, $62 ; 05*-*549-438#1
	db $60, $7c, $6a, $7a, $62, $78, $64, $66, $7a, $72, $70, $78, $6e, $6c ; 0*5-1#23-98#76
	db $60, $7c, $6a, $7a, $6c, $62, $78, $6c, $7a, $68, $6a, $7c, $62, $6a ; 0*5-61#6-45*15
	db $60, $6a, $7c, $7a, $7c, $6c, $68, $66, $7a, $70, $68, $70, $62, $7c ; 05*-*643-8481*
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398
	db $60, $6a, $78, $7a, $72, $72, $6a, $78, $7a, $7c, $6a, $66, $72, $70 ; 05#-995#-*5398

SpecialPhoneNumbers::
	db $60, $6a, $7c, $7a, $78, $68, $72, $64, $7a, $6c, $66, $68, $7c, $62 ; 05*-#492-634*1
	db $60, $6a, $7c, $7a, $60, $6e, $68, $7c, $7a, $70, $72, $78, $62, $66 ; 05*-074*-89#13
	db $60, $6a, $7c, $7a, $68, $66, $64, $7c, $7a, $72, $6e, $6a, $78, $64 ; 05*-432*-975#2
	db $60, $6a, $7c, $7a, $6c, $78, $64, $68, $7a, $6e, $64, $62, $72, $7c ; 05*-6#24-7219*
	db $60, $6a, $7c, $7a, $62, $64, $7c, $72, $7a, $66, $70, $6c, $70, $7c ; 05*-12*9-3868*
	db $60, $6a, $7c, $7a, $6a, $6e, $78, $64, $7a, $7c, $68, $62, $60, $70 ; 05*-57#2-*4108
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $66, $72, $78, $6c, $7a, $68, $72, $7c, $64, $62 ; 05#-39#6-49*21
	db $60, $6a, $78, $7a, $68, $70, $7c, $6c, $7a, $66, $70, $78, $64, $60 ; 05#-48*6-38#20
	db $60, $6a, $7c, $7a, $7c, $72, $70, $68, $7a, $6c, $66, $7c, $6a, $64 ; 05*-*984-63*52
	db $60, $6a, $7c, $7a, $72, $60, $7c, $6c, $7a, $6e, $64, $6c, $7c, $66 ; 05*-90*6-726*3
	db $60, $6a, $78, $7a, $7c, $64, $6c, $62, $7a, $62, $7c, $70, $60, $6c ; 05#-*261-1*806
	db $60, $6a, $78, $7a, $66, $6c, $7c, $62, $7a, $6e, $64, $66, $64, $7c ; 05#-36*1-7232*
	db $60, $6a, $78, $7a, $6a, $68, $6c, $7c, $7a, $6c, $72, $7c, $64, $66 ; 05#-546*-69*23
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200
	db $60, $6a, $78, $7a, $62, $78, $60, $66, $7a, $78, $6e, $64, $60, $60 ; 05#-1#03-#7200

UnknownTZFile43:: INCBIN "gfx/tzfiles/tz_43.2bpp.tz"
UnknownTZFile44:: INCBIN "gfx/tzfiles/tz_44.2bpp.tz"

SECTION "bank 2A", ROMX, BANK [$2a]
INCLUDE "engine/minimap.asm"

Func_a837a: ; a837a (2a:437a)
	ld a, [hJoyNew]
	and START
	jr z, .asm_a838a
	ld a, $11
	ld [wSubroutine], a
	ld a, $4
	jp StartFade_

.asm_a838a
	ld a, [wTextSubroutine]
	cp $9
	jp nz, Func_a840a
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_a83a9
	ld a, [wOAMAnimation01_TemplateBank]
	dec a
	ld [wOAMAnimation01_TemplateBank], a
	cp $ff
	jr nz, .asm_a83a9
	ld a, $c
	ld [wOAMAnimation01_TemplateBank], a
.asm_a83a9
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_a83c0
	ld a, [wOAMAnimation01_TemplateBank]
	inc a
	ld [wOAMAnimation01_TemplateBank], a
	cp $d
	jr nz, .asm_a83c0
	ld a, $0
	ld [wOAMAnimation01_TemplateBank], a
.asm_a83c0
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_a83ce
	ld a, [wOAMAnimation01_PriorityFlags]
	dec a
	ld [wOAMAnimation01_PriorityFlags], a
.asm_a83ce
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_a83dc
	ld a, [wOAMAnimation01_PriorityFlags]
	inc a
	ld [wOAMAnimation01_PriorityFlags], a
.asm_a83dc
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_a83f7
	ld a, [wOAMAnimation01_TemplateBank]
	ld b, a
	ld a, [wOAMAnimation01_PriorityFlags]
	ld c, a
	ld a, $2
	ld [wTextSubfunction], a
	call PrintMapObjectText_
	ld a, $35
	ld [wSubroutine], a
.asm_a83f7
	hlbgcoord 3, 0
	ld a, [wOAMAnimation01_TemplateBank]
	call Func_a842e
	hlbgcoord 7, 0
	ld a, [wOAMAnimation01_PriorityFlags]
	call Func_a842e
	ret

Func_a840a: ; a840a (2a:440a)
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .asm_a8425
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .asm_a8424
	call ClearBGMapAndAttrs
	ld a, [wOAMAnimation01_PriorityFlags]
	inc a
	ld [wOAMAnimation01_PriorityFlags], a
.asm_a8424
	ret

.asm_a8425
	call ClearBGMapAndAttrs
	ld a, $9
	ld [wTextSubroutine], a
	ret

Func_a842e: ; a842e (2a:442e)
	ld b, a
	swap a
	and $f
	add $b0
	di
	ld c, a
.asm_a8437
	ld a, [rSTAT]
	and $2
	jr nz, .asm_a8437
	ld a, c
	ld [hli], a
	ld a, b
	and $f
	add $b0
	ld [hl], a
.asm_a8445
	ld a, [rSTAT]
	and $2
	jr nz, .asm_a8445
	ld a, $1
	ld [rVBK], a
	ld [hl], $4
	dec hl
	ld [hl], $4
	xor a
	ld [rVBK], a
	ei
	ret

Func_a8459: ; a8459 (2a:4459)
	call Func_a847a
	push hl
	push bc
	call Func_a84a3
	pop bc
	pop hl
	check_cgb
	ret nz
	ld a, $1
	ld [rVBK], a
	call Func_a84a3
	ld a, $0
	ld [rVBK], a
	disable_sram
	ret

Func_a847a: ; a847a (2a:447a)
	ld e, b
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	hlbgcoord 1, 0
	add hl, de
	ld de, sIdxsOfDenjuuWhoCanCallPlayer
	enable_sram sIdxsOfDenjuuWhoCanCallPlayer
	ret

Func_a84a3: ; a84a3 (2a:44a3)
	push bc
	push hl
	ld b, $9
.asm_a84a7
	di
.asm_a84a8
	ld a, [rSTAT]
	and $2
	jr nz, .asm_a84a8
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_a84a7
	pop hl
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop bc
	dec c
	jr nz, Func_a84a3
	ret

Func_a84c5: ; a84c5 (2a:44c5)
	call Func_a847a
	push hl
	push bc
	call Func_a84e6
	pop bc
	pop hl
	check_cgb
	ret nz
	ld a, $1
	ld [rVBK], a
	call Func_a84e6
	ld a, $0
	ld [rVBK], a
	disable_sram
	ret

Func_a84e6: ; a84e6 (2a:44e6)
	push bc
	push hl
	ld b, $9
.asm_a84ea
	di
.asm_a84eb
	ld a, [rSTAT]
	and $2
	jr nz, .asm_a84eb
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_a84ea
	pop hl
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop bc
	dec c
	jr nz, Func_a84e6
	ret

GetLandmarkName: ; a8508 (2a:4508)
	ld a, b
	ld hl, OutdoorLandmarkNames
GetLandmarkName_:
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, wMapHeader
	push hl
	ld c, $10
.find_end
	dec c
	ld a, [hli]
	cp "$"
	jr nz, .find_end
	srl c
	ld a, c
	or a
	jr z, .skip
	ld a, $0
.clear
	ld [de], a
	inc de
	dec c
	jr nz, .clear
.skip
	pop hl
.copy
	ld a, [hli]
	ld [de], a
	inc de
	cp "$"
	jr nz, .copy
	ret

Func_a8539: ; a8539 (2a:4539)
	ld a, [wMapGroup]
	cp $a
	jr c, .group_0_to_9
	cp $b
	jr nz, .ten_or_greater_equal_twelve
	ld a, [wMapNumber]
	cp $38
	jr nz, .not_b_38
	ld c, $5
	ret

.not_b_38
	ld c, $0
	ret

.ten_or_greater_equal_twelve
	ld hl, Pointers_aa6e5
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld c, a
	ret

.group_0_to_9
	call GetCurrentLandmark
	ld hl, Pointers_aa4d5
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	ld c, a
	ret

GetCurrentLandmark: ; a8576 (2a:4576)
; e = ([wMapNumber] >> 3)
	ld a, [wMapNumber]
	srl a
	srl a
	srl a
	ld e, a
; d = ([wMapNumber] & $7)
	ld a, [wMapNumber]
	and $7
	ld d, a
; b = (d << 3)
	sla a
	sla a
	sla a
	ld b, a
	ld a, [wMapGroup]
	cp $6
	jr c, .under_6
	sub $4
.under_6
	ld c, a
	and $1
	jr z, .not_bit_0
	ld a, $8
	add d
	ld d, a
.not_bit_0
	ld a, c
	and $4
	jr z, .not_bit_3
	ld a, $8
	add e
	ld e, a
.not_bit_3
	swap e
	ld a, d
	add e
	ld b, a
	ret

CenterAlignDenjuuName: ; a85ae (2a:45ae)
	push hl
	push de
	ld c, $8
	ld a, $0
.byte_fill
	ld [de], a
	inc de
	dec c
	jr nz, .byte_fill
	pop de
	ld c, $9
.get_size
	dec c
	jr z, .size_done
	ld a, [hli]
	cp "$"
	jr nz, .get_size
	srl c
	ld a, c
	or a
	jr z, .size_done
	ld a, $0
.left_pad
	ld [de], a
	inc de
	dec c
	jr nz, .left_pad
.size_done
	pop hl
	ld c, $8
.copy
	ld a, [hli]
	ld [de], a
	dec c
	ret z
	inc de
	cp "$"
	jr nz, .copy
	ld a, $0
.right_pad
	ld [de], a
	inc de
	dec c
	jr nz, .right_pad
	ret

GetMapEncounterTableIndex: ; a85e5 (2a:45e5)
	push hl
	ld hl, MapEncounterTableIndices
	ld a, [wMapGroup]
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld a, [wMapNumber]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(MapEncounterTableIndices)
	call GetFarByte
	pop hl
	ret

Func_a8608: ; a8608 (2a:4608)
	push hl
	ld a, [wDShotLevel]
	cp $3
	jr c, .okay
	sub $3
.okay
	ld hl, Data_3d027
	cp $0
	jr z, .got_phone_level
	ld hl, Data_3d6c7
	cp $1
	jr z, .got_phone_level
	ld hl, Data_3dd67
.got_phone_level
	ld a, [wMapGroup]
	ld e, a
	call PointToServiceDataTable
	ld b, BANK(Data_3d027)
	call GetServiceByte
	pop hl
	ret

GetServiceByte:
	call GetFarByte
	ld a, b
	bit 0, c
	jr nz, .no_swap
	swap a
.no_swap
	and $f
	ld b, a
	ret

PointToServiceDataTable:
	ld d, $0
REPT 5
	sla e
	rl d
ENDR
	add hl, de
	ld a, [wMapNumber]
	ld c, a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ret

Func_a8663: ; a8663 (2a:4663)
	ld hl, Data_aa417
	ld a, [wMapGroup]
	cp $2
	jr c, .asm_a867d
	cp $6
	jr nc, .asm_a867d
	sub $2
	ld e, a
	call PointToServiceDataTable
	ld b, BANK(Data_aa417)
	call GetServiceByte
	ret

.asm_a867d
	ld hl, Data_aa497
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ret

Data_a8688:
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5

CheckCanGenerateEncounters: ; a8788 (2a:4788)
; b = 0: generates encounters
; b = 1: suppresses encounters
	ld b, $0
	ld a, [wMapGroup]
	cp $16
	jr z, .check_c906_1
	cp $17
	jr z, .check_c906_2
	cp $18
	jr z, .check_c906_3
	sub $2
	cp $4
	jr nc, .yup
	ld hl, OverworldEncounterFlags
	or a
	jr z, .skip_addntimes
	ld de, $40
.addntimes
	add hl, de
	dec a
	jr nz, .addntimes
.skip_addntimes
	ld a, [wMapNumber]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(OverworldEncounterFlags)
	call GetFarByte
	ld a, b
	or a
	ret z
	ld a, [wOAMAnimation13_PriorityFlags]
	and $1
	ret z
.yup
	ld b, $0
	ret

.check_c906_1
	ld a, [wMapNumber]
	cp $19
	jr z, .nope
	cp $1b
	jr z, .nope
	ret

.nope
	inc b
	ret

.check_c906_2
	ld a, [wMapNumber]
	cp $35
	jr z, .nope
	ret

.check_c906_3
	ld a, [wMapNumber]
	cp $34
	jr z, .nope
	ret

FadeOutOverworldForMinimap_____:
	jp FadeOutOverworldForMinimap

Func_a87e7: ; a87e7 (2a:47e7)
	ld hl, Data_a5f9f
	ld a, [wMapGroup]
	sub $a
	cp $28
	jr c, .asm_a87f5
	sub $7
.asm_a87f5
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2fe4
	ld h, b
	ld l, c
	ld a, d
	cpl
	inc a
	ld b, a
	ld a, e
	cpl
	inc a
	ld c, a
	add hl, bc
	ld b, h
	ld c, l
	ld a, BANK(GFX_a0000)
	ld hl, VTilesBG tile $00
	call FarCopy2bpp_2
	ld a, BANK(GFX_e27c4)
	ld hl, VTilesOB tile $00
	ld de, GFX_e27c4
	ld bc, $490
	call FarCopy2bpp_2
	ld a, BANK(GFX_e2ed4)
	ld hl, VTilesBG tile $40
	ld de, GFX_e2ed4
	ld bc, $c0
	call FarCopy2bpp_2
	ld de, Tilemap_e2fa4
	hlbgcoord 0, 0
	ld b, $12
	ld c, $14
	ld a, $2
	call Func_33fd
	ld hl, IndoorLandmarkNames
	ld a, [wMapGroup]
	call GetLandmarkName_
	ld d, $2
	ld b, $0
	ld c, $bb
	callba Func_2c7b9
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	call PrintText_
	ld a, $3
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $10
	ld [wOAMAnimation01_TemplateBank], a
	ld a, $41
	ld [wOAMAnimation01_TemplateIdx], a
	ld a, $0
	ld [wOAMAnimation01_Palette], a
	ld a, [wMapNumber]
	ld b, a
	and $7
	swap a
	srl a
	add $34
	ld [wOAMAnimation01_XCoord], a
	ld a, b
	and $f8
	add $44
	ld [wOAMAnimation01_YCoord], a
	ld a, [wMapGroup]
	sub $a
	cp $28
	jr c, .asm_a889d
	sub $7
.asm_a889d
	ld c, $40
	ld e, a
	call Multiply_C_by_E
	ld hl, Data_a5fe9
	add hl, de
	ld d, h
	ld e, l
	call Func_a88dd
	ld a, BANK(Func_a87e7)
	ld [wPrevROMBank], a
	ld bc, $9
	call GetCGB_BGLayout_
	ld bc, $10
	call GetCGB_OBLayout_
	ld b, $7
	call LoadTextBoxPalette_
	ld bc, $225
	ld a, [wMapGroup]
	sub $a
	cp $28
	jr c, .asm_a88d0
	sub $7
.asm_a88d0
	add c
	ld c, a
	jr nc, .asm_a88d5
	inc b
.asm_a88d5
	ld a, $1
	call LoadNthStdBGPalette
	jp IncrementSubroutine

Func_a88dd: ; a88dd (2a:48dd)
	ld b, $0
.asm_a88df
	ld c, $0
.asm_a88e1
	push bc
	call Func_a893b
	pop bc
	jr z, .asm_a892e
	push de
	push bc
	ld a, c
	swap a
	srl a
	add b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	pop bc
	push bc
	hlbgcoord 6, 8
	ld a, c
	swap a
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, $29
	ld bc, $1
	push hl
	call FarCopy2bpp_2
	pop hl
	check_cgb
	jr nz, .asm_a892c
	ld a, $1
	ld [rVBK], a
	call TextWaitStat
	ld a, $1
	ld [hl], a
	ld a, $0
	ld [rVBK], a
.asm_a892c
	pop bc
	pop de
.asm_a892e
	inc c
	ld a, $8
	cp c
	jr nz, .asm_a88e1
	inc b
	ld a, $8
	cp b
	jr nz, .asm_a88df
	ret

Func_a893b: ; a893b (2a:493b)
	push de
	ld a, c
	ld hl, sIndoorVisitedMapSectionFlags
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld d, $1
	ld a, b
	or a
	jr z, .asm_a8951
.asm_a894c
	sla d
	dec a
	jr nz, .asm_a894c
.asm_a8951
	ld a, [wMapGroup]
	sub $a
	cp $28
	jr c, .asm_a895c
	sub $7
.asm_a895c
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	enable_sram sIndoorVisitedMapSectionFlags
	ld a, [hl]
	and d
	pop de
	push af
	disable_sram
	pop af
	ret

Func_a8981: ; a8981 (2a:4981)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld bc, $0
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_a8991: ; a8991 (2a:4991)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call PrintText_
	ld b, $3
	ld a, [wOverworldFrameCounter]
	and $8
	jr z, .asm_a89ab
	ld b, $2
.asm_a89ab
	ld a, b
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_a89bc
	ld hl, VTilesBG tile $40
	call Func_17ef
.asm_a89bc
	ld a, [hJoyNew]
	and $e
	jr z, .asm_a89ca
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

.asm_a89ca
	ret

Func_a89cb: ; a89cb (2a:49cb)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

FadeOutOverworldForMinimap______: ; a89dd (2a:49dd)
	jpba FadeOutOverworldForMinimap ; same bank

Func_a89e5: ; a89e5 (2a:49e5)
	ld a, $2
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ld a, BANK(Func_a89e5)
	ld [wPrevROMBank], a
	ld a, [wc912]
	ld [wcaed], a
	ld a, [wcdec]
	ld [wc908], a
	ld a, $0
	ld [wcdec], a
	ld a, [wcdee]
	ld [wOAMAnimation18_Duration + 21], a
	ld a, $0
	ld [wcdee], a
	ld a, [wcde1]
	ld [wOAMAnimation19_Duration + 21], a
	ld a, $0
	ld [wcde1], a
	ld bc, EVENT_089
	call CheckEventFlag
	jr z, .asm_a8a31
	ld a, $1
	ld [wcaee], a
	ld a, [wc90c]
	ld [wOAMAnimation17_Duration + 9], a
	jr .asm_a8a3c

.asm_a8a31
	ld a, $0
	ld [wcaee], a
	ld a, [wc90e]
	ld [wOAMAnimation17_Duration + 9], a
.asm_a8a3c
	ld a, [wcaee]
	or a
	jr z, .asm_a8a5a
	ld hl, wOAMAnimation17_Duration + 6
	ld a, $fc
	ld [hli], a
	ld a, $cd
	ld [hl], a
	ld a, $4
	ld [wOAMAnimation17_Duration + 12], a
	ld a, $40
	ld [wOAMAnimation17_Duration + 13], a
	ld de, GFX_e1288
	jr .asm_a8a70

.asm_a8a5a
	ld hl, wOAMAnimation17_Duration + 6
	ld a, $bc
	ld [hli], a
	ld a, $cd
	ld [hl], a
	ld a, $3a
	ld [wOAMAnimation17_Duration + 12], a
	ld a, $0
	ld [wOAMAnimation17_Duration + 13], a
	ld de, GFX_e1208
.asm_a8a70
	ld a, BANK(GFX_e1208)
	ld hl, VTilesShared tile $00
	ld bc, $80
	call FarCopy2bpp_2
	ld a, $0
	ld [wcae4], a
	ld [wcae5], a
	ld [wcae7], a
	ld [wcaeb], a
	ld [wcaec], a
	ld a, $3
	ld [wcae6], a
	ld a, BANK(PhoneCallTextBoxFrame)
	ld hl, VTilesShared tile $70
	ld de, PhoneCallTextBoxFrame
	ld bc, $f0
	call FarCopy2bpp_2
	ld a, BANK(GFX_e11f8)
	ld hl, VTilesOB tile $1f
	ld de, GFX_e11f8
	ld bc, $10
	call FarCopy2bpp_2
	ld a, BANK(GFX_e1560)
	ld hl, VTilesOB tile $40
	ld de, GFX_e1560
	ld bc, $100
	call FarCopy2bpp_2
	ld a, BANK(GFX_e1650)
	ld hl, VTilesShared tile $08
	ld de, GFX_e1650
	ld bc, $40
	call FarCopy2bpp_2
	ld a, $10
	ld [wOAMAnimation17_TemplateBank], a
	ld a, $43
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, $0
	ld [wOAMAnimation17_Palette], a
	ld a, $34
	ld [wOAMAnimation17_XCoord], a
	ld a, $44
	ld [wOAMAnimation17_YCoord], a
	ld a, $10
	ld [wOAMAnimation18_TemplateBank], a
	ld a, $42
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, $0
	ld [wOAMAnimation18_Palette], a
	ld a, $6c
	ld [wOAMAnimation18_XCoord], a
	ld a, $44
	ld [wOAMAnimation18_YCoord], a
	ld a, $10
	ld [wOAMAnimation19_TemplateBank], a
	ld a, $44
	ld [wOAMAnimation19_TemplateIdx], a
	ld a, $1
	ld [wOAMAnimation19_Palette], a
	ld a, $80
	ld [wOAMAnimation19_XCoord], a
	ld a, $44
	ld [wOAMAnimation19_YCoord], a
	call Func_a8c30
	ld a, $b0
	ld [wTextBoxStartTile], a
	callba DrawTextboxInteriorTopRow
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $1
	ld [wca65], a
	callba DrawTextboxInterior
	ld a, BANK(Func_a89e5)
	ld [wPrevROMBank], a
	ld bc, $a
	call GetCGB_BGLayout_
	ld a, $0
	ld [wcae3], a
	call Func_a8e0b
	jr z, .asm_a8b6f
	call Func_a8e1f
	ld d, $c
	ld b, $0
	ld c, $b9
	call LoadAndStartStdTextPointer_
	call Func_a8c9b
	call Func_a8d82
	ld a, $2
	ld [wcada], a
	call PrintText_
	call PrintText_
	jr .asm_a8b82

.asm_a8b6f
	ld a, $1
	ld [wcae3], a
	ld d, $c
	ld b, $0
	ld c, $b8
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wcada], a
.asm_a8b82
	ld a, BANK(Func_a89e5)
	ld [wPrevROMBank], a
	ld bc, $11
	call GetCGB_OBLayout_
	call Func_a8bad
	callba Func_a5509
	ld a, b
	ld [wOAMAnimation18_Duration + 23], a
	ld a, c
	ld [wOAMAnimation18_Duration + 22], a
	ld a, $0
	ld [wBGPalUpdate], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

Func_a8bad: ; a8bad (2a:4bad)
	ld a, [wc91a]
	cp $c7
	jr c, .asm_a8bc2
	callba Func_2e4ed
	ld a, BANK(Func_a89e5)
	ld [wPrevROMBank], a
	ret

.asm_a8bc2
	callba Func_2e526
	ld a, BANK(Func_a89e5)
	ld [wPrevROMBank], a
	ret

Func_a8bd0:
	ld a, $1
	ld [wc46c], a
	ld a, $1
	ld [wc46d], a
	ld hl, wc460
	ld a, $21
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld a, $5f
	ld [hli], a
	ld a, $0
	ld [wcae4], a
	ld [hl], a
	ret

Func_a8bed:
	ld a, $0
	ld [wcae7], a
	ld a, $0
	ld [wc46c], a
	ld [wc46d], a
	hlbgcoord 0, 4
	ld a, $0
	ld bc, $100
	call FillVRAMWithByte_
	ld b, $0
	ld a, $0
	ld c, a
	call Func_a8cc6
	ld b, $1
	ld a, $0
	ld c, a
	call Func_a8cc6
	ld b, $2
	ld a, $0
	ld c, a
	call Func_a8cc6
	ld b, $3
	ld a, $0
	ld c, a
	call Func_a8cc6
	ld a, $0
	ld [wOAMAnimation17_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation18_PriorityFlags], a
	ret

Func_a8c30: ; a8c30 (2a:4c30)
	ld de, Tilemap_e0c38
	hlbgcoord 0, 0
	ld b, $4
	ld c, $14
	ld a, $0
	call Func_a8c50
	call Func_a8c68
	ld d, $8
	ld bc, $20
	hlbgcoord 0, 4
	ld a, $3
	call FillAttrMapBoxWithByte
	ret

Func_a8c50: ; a8c50 (2a:4c50)
.loop
	push bc
	push hl
	push af
	ld b, $0
	call FillAttrMapWithByte
	ld a, BANK(Tilemap_e0cb0)
	call FarCopy2bpp_2
	pop af
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

Func_a8c68: ; a8c68 (2a:4c68)
	ld de, Tilemap_e0cb0
	hlbgcoord 0, 12
	ld b, $6
	ld c, $14
	ld a, $1
	jp Func_a8c50

DrawPhoneTextbox: ; a8c77 (2a:4c77)
	ld de, Tilemap_e0cb0
	hlbgcoord 0, 12
	ld b, $6
	ld c, $14
	ld a, $5
	jp Func_a8c50

Func_a8c86: ; a8c86 (2a:4c86)
.loop
	push bc
	push hl
	push af
	ld b, $0
	ld a, BANK(Tilemap_e3784)
	call FarCopy2bpp_2
	pop af
	pop hl
	ld bc, $20
	add hl, bc
	pop bc
	dec b
	jr nz, .loop
	ret

Func_a8c9b: ; a8c9b (2a:4c9b)
	ld a, BANK(GFX_e0e18)
	hlbgcoord 0, 6
	ld de, GFX_e0e18
	ld bc, $a0
	call FarCopy2bpp_2
	check_cgb
	ret nz
	ld a, $1
	ld [rVBK], a
	ld a, BANK(GFX_e0eb8)
	hlbgcoord 0, 6
	ld de, GFX_e0eb8
	ld bc, $a0
	call FarCopy2bpp_2
	ld a, $0
	ld [rVBK], a
	ret

Func_a8cc6: ; a8cc6 (2a:4cc6)
	call Func_a8d48
	ld d, $2b
	ld a, [wOAMAnimation17_Duration + 13]
	add c
	dec a
	cp $22
	jr c, .asm_a8cd7
	inc d
	sub $22
.asm_a8cd7
	ld e, a
	ld a, d
	ld [wCustomSpriteDest], a
	push bc
	ld d, $0
	ld bc, $1e0
	call Multiply_DE_by_BC
	ld hl, GFX_ac000
	add hl, de
	ld d, h
	ld e, l
	pop bc
	ld a, b
	add a
	ld hl, Pointers_a8d07
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	or a
	jr z, asm_a8d0f
	ld a, [wCustomSpriteDest]
	ld bc, $1e0
	jp FarCopy2bpp_2

Pointers_a8d07:
	dw VTilesBG tile $01
	dw VTilesBG tile $21
	dw VTilesBG tile $41
	dw VTilesBG tile $61

asm_a8d0f
	ld b, $f0
Func_a8d11:
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	xor a
	ld [hli], a
	ld [hli], a
	ei
	dec b
	jr nz, .loop
	ret

Func_a8d20: ; a8d20 (2a:4d20)
	push hl
	ld d, $2b
	ld a, c
	cp $22
	jr c, .asm_a8d2b
	inc d
	sub $22
.asm_a8d2b
	ld e, a
	ld a, d
	ld [wCustomSpriteDest], a
	ld d, $0
	ld bc, $1e0
	call Multiply_DE_by_BC
	ld hl, GFX_ac000
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld a, [wCustomSpriteDest]
	ld bc, $1e0
	jp FarCopy2bpp_2

Func_a8d48: ; a8d48 (2a:4d48)
	ld a, c
	or a
	ret z
	push bc
	ld a, BANK(Func_a8d48)
	ld [wPrevROMBank], a
	ld a, [wOAMAnimation17_Duration + 13]
	dec c
	add c
	ld c, a
	ld d, b
	ld b, $0
	ld hl, $1e0
	add hl, bc
	ld b, h
	ld c, l
	ld a, d
	add $3
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	pop bc
	ret

Func_a8d6d:
	ld a, [wOAMAnimation17_Duration + 13]
	dec c
	add c
	ld c, a
	ld d, b
	ld b, $0
	ld hl, $200
	add hl, bc
	ld b, h
	ld c, l
	ld a, $1
	call LoadNthStdOBPalette
	ret

Func_a8d82: ; a8d82 (2a:4d82)
	call Func_a8daa
	ld b, $0
	ld a, [wcadf]
	ld c, a
	call Func_a8cc6
	ld b, $1
	ld a, [wcae0]
	ld c, a
	call Func_a8cc6
	ld b, $2
	ld a, [wcae1]
	ld c, a
	call Func_a8cc6
	ld b, $3
	ld a, [wcae2]
	ld c, a
	call Func_a8cc6
	ret

Func_a8daa: ; a8daa (2a:4daa)
	ld a, $0
	ld [wcadf], a
	ld [wcae0], a
	ld [wcae1], a
	ld [wcae2], a
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 9]
	or a
	jr z, .asm_a8dd5
	ld b, a
	dec a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.asm_a8dce
	ld a, [hld]
	or a
	jr nz, .asm_a8dd7
	dec b
	jr nz, .asm_a8dce
.asm_a8dd5
	jr .asm_a8ddb

.asm_a8dd7
	ld a, b
	ld [wcadf], a
.asm_a8ddb
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 9]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wOAMAnimation17_Duration + 9]
	ld b, a
	ld de, wcae0
	ld c, $0
.asm_a8df5
	ld a, [hli]
	or a
	jr z, .asm_a8e03
	ld a, b
	inc a
	ld [de], a
	inc de
	inc c
	ld a, c
	cp $3
	jr z, .asm_a8e0a
.asm_a8e03
	inc b
	ld a, [wOAMAnimation17_Duration + 12]
	cp b
	jr nz, .asm_a8df5
.asm_a8e0a
	ret

Func_a8e0b: ; a8e0b (2a:4e0b)
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 12]
	ld b, a
.asm_a8e17
	ld a, [hli]
	or a
	jr nz, .asm_a8e1e
	dec b
	jr nz, .asm_a8e17
.asm_a8e1e
	ret

Func_a8e1f: ; a8e1f (2a:4e1f)
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 9]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	or a
	ret nz
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 9]
	or a
	jr z, .asm_a8e53
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wOAMAnimation17_Duration + 9]
	ld b, a
	inc b
.asm_a8e4c
	ld a, [hld]
	or a
	jr nz, .asm_a8e78
	dec b
	jr nz, .asm_a8e4c
.asm_a8e53
	ld a, [wOAMAnimation17_Duration + 7]
	ld h, a
	ld a, [wOAMAnimation17_Duration + 6]
	ld l, a
	ld a, [wOAMAnimation17_Duration + 9]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wOAMAnimation17_Duration + 9]
	ld b, a
.asm_a8e68
	ld a, [hli]
	or a
	jr nz, .asm_a8e73
	inc b
	ld a, [wOAMAnimation17_Duration + 12]
	cp b
	jr nz, .asm_a8e68
.asm_a8e73
	ld a, b
	ld [wOAMAnimation17_Duration + 9], a
	ret

.asm_a8e78
	dec b
	ld a, b
	ld [wOAMAnimation17_Duration + 9], a
	ret

Func_a8e7e: ; a8e7e (2a:4e7e)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld bc, $0
	ld a, $4
	call StartFade_
	ld a, [wcae3]
	or a
	jp z, Func_a8e9d
	ld a, $1d
	ld [wSubroutine], a
	ld a, SFX_05
	ld [H_SFX_ID], a
	ret

Func_a8e9d: ; a8e9d (2a:4e9d)
	call Func_a8bd0
	jp IncrementSubroutine

Func_a8ea3: ; a8ea3 (2a:4ea3)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wcaec]
	or a
	jr nz, .asm_a8eba
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wcaec], a
.asm_a8eba
	call Func_a8f26
	call Func_a910f
	call PrintText_
	call Func_a8fca
	call Func_a8fe4
	call Func_a9075
	ld hl, wc463
	ld a, [wcae4]
	ld [hli], a
	ld a, [wcae5]
	or a
	jr nz, .asm_a8f11
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_a8f11
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $1
	ld [wca65], a
	callba DrawTextboxInterior
	ld d, $c
	ld b, $0
	ld c, $b7
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wcada], a
	ld a, $1e
	ld [wSubroutine], a
	call Func_a8c68
.asm_a8f11
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, Func_a8f25
	ld a, SFX_04
	ld [H_SFX_ID], a
	call Func_a91b4
	ld a, $0
	ld [wcae7], a
Func_a8f25: ; a8f25 (2a:4f25)
	ret

Func_a8f26: ; a8f26 (2a:4f26)
	ld b, $1
	ld c, $1
	ld a, [wcadf]
	or a
	jr nz, .asm_a8f32
	ld b, $0
.asm_a8f32
	ld a, [wcae1]
	or a
	jr nz, .asm_a8f3a
	ld c, $0
.asm_a8f3a
	ld a, b
	ld [wOAMAnimation17_PriorityFlags], a
	ld a, c
	ld [wOAMAnimation18_PriorityFlags], a
	ld a, [wSubroutine]
	cp $1e
	jr z, .asm_a8f7a
	ld a, $43
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, $42
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, [wcae7]
	inc a
	ld [wcae7], a
	call Func_a8fb5
	add $34
	ld [wOAMAnimation17_XCoord], a
	ld a, [wcae7]
	cpl
	inc a
	call Func_a8fb5
	add $6c
	ld [wOAMAnimation18_XCoord], a
	ld a, $44
	ld [wOAMAnimation17_YCoord], a
	ld a, $44
	ld [wOAMAnimation18_YCoord], a
	ret

.asm_a8f7a
	ld a, $1
	ld [wOAMAnimation17_PriorityFlags], a
	ld a, $1
	ld [wOAMAnimation18_PriorityFlags], a
	ld a, $34
	ld [wOAMAnimation17_XCoord], a
	ld a, $6c
	ld [wOAMAnimation18_XCoord], a
	ld a, $42
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, $43
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, [wcae7]
	inc a
	ld [wcae7], a
	call Func_a8fb5
	add $44
	ld [wOAMAnimation17_YCoord], a
	ld a, [wcae7]
	cpl
	inc a
	call Func_a8fb5
	add $44
	ld [wOAMAnimation18_YCoord], a
	ret

Func_a8fb5: ; a8fb5 (2a:4fb5)
	ld d, a
	sla d
	sla d
	sla d
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	ret

Func_a8fca: ; a8fca (2a:4fca)
	ld c, $c
	ld a, [wcae7]
	bit 4, a
	jr nz, .asm_a8fd5
	ld c, $d
.asm_a8fd5
	ld a, [wTileWhere0IsLoaded]
	add c
	ld c, a
	di
	call TextWaitStat
	ld a, c
	bgcoord_a 17, 16
	ei
	ret

Func_a8fe4: ; a8fe4 (2a:4fe4)
	call Func_a9095
	ld a, [wcae5]
	or a
	ret nz
	ld a, [hJoyNew]
	ld b, a
	ld a, [wcaea]
	or b
	and $10
	jr z, .asm_a9031
	ld a, [wcae1]
	or a
	ret z
	dec a
	ld [wOAMAnimation17_Duration + 9], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wcae2]
	push af
	call Func_a8daa
	ld a, [wcae6]
	ld b, a
	pop af
	ld c, a
	call Func_a8cc6
	ld a, $0
	ld [wcaeb], a
	ld a, $12
	ld [wcae5], a
	ld a, [wcae4]
	add $1
	ld [wcae4], a
	ld a, [wcae6]
	inc a
	and $3
	ld [wcae6], a
	ret

.asm_a9031
	ld a, [hJoyNew]
	ld b, a
	ld a, [wcaea]
	or b
	and $20
	jr z, .asm_a9074
	ld a, [wcadf]
	or a
	ret z
	dec a
	ld [wOAMAnimation17_Duration + 9], a
	call Func_a8daa
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wcae6]
	ld b, a
	ld a, [wcadf]
	ld c, a
	call Func_a8cc6
	ld a, $0
	ld [wcaeb], a
	ld a, $ee
	ld [wcae5], a
	ld a, [wcae4]
	sub $1
	ld [wcae4], a
	ld a, [wcae6]
	dec a
	and $3
	ld [wcae6], a
	ret

.asm_a9074
	ret

Func_a9075: ; a9075 (2a:5075)
	ld a, [wcae5]
	or a
	ret z
	ld b, a
	ld a, [wcae4]
	add b
	ld [wcae4], a
	ld a, [wcae5]
	bit 7, a
	jr z, .asm_a908f
	add $3
	ld [wcae5], a
	ret

.asm_a908f
	sub $3
	ld [wcae5], a
	ret

Func_a9095: ; a9095 (2a:5095)
	ld a, [hJoyLast]
	and $30
	jr nz, .asm_a90ac
	ld a, [wcaeb]
	or a
	jr nz, .asm_a90ac
	ld a, [wcae5]
	or a
	jr nz, .asm_a90ac
	ld a, $1
	ld [wcaeb], a
.asm_a90ac
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .asm_a90b7
	ld a, $18
	ld [wcae8], a
.asm_a90b7
	ld a, [wcae8]
	or a
	jr z, .asm_a90c1
	dec a
	ld [wcae8], a
.asm_a90c1
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .asm_a90cc
	ld a, $18
	ld [wcae9], a
.asm_a90cc
	ld a, [wcae9]
	or a
	jr z, .asm_a90d6
	dec a
	ld [wcae9], a
.asm_a90d6
	ld a, [hJoyLast]
	and D_LEFT
	jr nz, .asm_a90e4
	ld a, [wcaea]
	and $df
	ld [wcaea], a
.asm_a90e4
	ld a, [wcae8]
	or a
	jr nz, .asm_a90f2
	ld a, [wcaea]
	or $20
	ld [wcaea], a
.asm_a90f2
	ld a, [hJoyLast]
	and D_RIGHT
	jr nz, .asm_a9100
	ld a, [wcaea]
	and $ef
	ld [wcaea], a
.asm_a9100
	ld a, [wcae9]
	or a
	jr nz, .asm_a910e
	ld a, [wcaea]
	or $10
	ld [wcaea], a
.asm_a910e
	ret

Func_a910f: ; a910f (2a:510f)
	ld a, [wcaeb]
	cp $1
	ret nz
	ld a, $2
	ld [wcaeb], a
	ld a, [wcae0]
	ld b, a
	dec b
	ld a, [wOAMAnimation17_Duration + 13]
	add b
	ld b, a
	callba GetItemName
Func_a912c:
	ld a, $b0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $0
	ld [wca65], a
	ld d, $0
	ld b, $0
	ld c, $ba
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wcada], a
	callba DrawTextboxInteriorTopRow
	ld a, BANK(Tilemap_e0c38)
	hlbgcoord 2, 1
	ld de, Tilemap_e0c38 + $16
	ld bc, $8
	call FarCopy2bpp_2
	call PrintText_
	ld a, [wcae0]
	ld b, a
	ld a, [wcaee]
	or a
	jr z, .asm_a9170
	ld a, b
	add $40
	ld b, a
.asm_a9170
	ld a, b
	ld hl, wcdbb
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	call Get2DigitBCD
	ld a, $c7
	ld hl, VTilesShared tile $38
	call LoadCharacter_
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $bb
	ld hl, VTilesShared tile $39
	call LoadCharacter_
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $bb
	ld hl, VTilesShared tile $3a
	call LoadCharacter_
	ret

Func_a91a3: ; a91a3 (2a:51a3)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	jr nz, asm_a91db
Func_a91b4: ; a91b4 (2a:51b4)
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $2a
	ld [wPrevROMBank], a
	ld a, $1f
	ld [wSubroutine], a
	ld a, $4
	call StartFade_
	call Func_a8bed
	ld a, $c
	ld [wcae7], a
	ld a, $2
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
asm_a91db
	ret

Func_a91dc: ; a91dc (2a:51dc)
	ld a, [wcae7]
	inc a
	ld [wcae7], a
	cp $c
	ret c
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ld a, [wc908]
	ld [wcdec], a
	ld a, [wOAMAnimation18_Duration + 21]
	ld [wcdee], a
	ld a, [wOAMAnimation19_Duration + 21]
	ld [wcde1], a
	call Func_a920d
	ret

Func_a920d: ; a920d (2a:520d)
	ld bc, EVENT_089
	call CheckEventFlag
	jr z, .asm_a921c
	ld a, [wOAMAnimation17_Duration + 9]
	ld [wc90c], a
	ret

.asm_a921c
	ld a, [wOAMAnimation17_Duration + 9]
	ld [wc90e], a
	ret

Func_a9223: ; a9223 (2a:5223)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_a8f26
	call PrintText_
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .asm_a9243
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .asm_a9278
	ld bc, EVENT_SAID_YES
	call CheckEventFlag
	jr nz, .asm_a9253
.asm_a9243
	ld c, $b9
	call Func_a9279
	ld a, $1c
	ld [wSubroutine], a
	ld a, SFX_04
	ld [H_SFX_ID], a
	ret

.asm_a9253
	ld a, [wcae0]
	ld c, a
	dec c
	ld a, [wOAMAnimation17_Duration + 13]
	add c
	ld c, a
	ld hl, VTilesOB tile $00
	call Func_a8d20
	ld a, $0
	ld [wcae7], a
	ld [wOAMAnimation17_PriorityFlags], a
	ld [wOAMAnimation18_PriorityFlags], a
	ld a, $20
	ld [wSubroutine], a
	ld a, SFX_03
	ld [H_SFX_ID], a
.asm_a9278
	ret

Func_a9279: ; a9279 (2a:5279)
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $1
	ld [wca65], a
	ld d, $c
	ld b, $0
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wcada], a
	callba DrawTextboxInterior
	call Func_a8c68
	jp PrintText_

CopySpeciesNameBToCA53: ; a92a2 (2a:52a2)
	ld de, wca53
	ld a, b
	jr asm_a92b3

Func_a92a8:
	ld de, wMapHeader
	jr asm_a92b3

Func_a92ad:
	ld de, wca53
	ld a, [wcaed]
asm_a92b3
	ld hl, DenjuuNames
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld c, BANK(DenjuuNames)
	ld b, $8
	call FarCopyData_Under256Bytes
	ld a, "$"
	ld [de], a
	ret

Func_a92d1:
	callba Func_a5509
	push bc
	push de
	ld a, d
	call Get2DigitBCD
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $bb
	ld hl, VTilesShared tile $10
	call LoadCharacter_
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $bb
	ld hl, VTilesShared tile $11
	call LoadCharacter_
	pop de
	ld a, d
	cp $63
	jr nz, .asm_a9323
	add sp, $2
	ld hl, VTilesShared tile $12
	ld a, $0
	call LoadCharacter_
	ld hl, VTilesShared tile $13
	ld a, $aa
	call LoadCharacter_
	ld hl, VTilesShared tile $14
	ld a, $9e
	call LoadCharacter_
	ld hl, VTilesShared tile $15
	ld a, $b5
	jp LoadCharacter_

.asm_a9323
	pop hl
	srl h
	rr l
	call Func_a9354
	ld hl, VTilesShared tile $12
	ld a, [wCGBPalFadeProgram]
	add $bb
	call LoadCharacter_
	ld hl, VTilesShared tile $13
	ld a, [wNumCGBPalettesToFade]
	add $bb
	call LoadCharacter_
	ld hl, VTilesShared tile $14
	ld a, [wFontSourceAddr]
	add $bb
	call LoadCharacter_
	ld hl, VTilesShared tile $15
	ld a, $0
	jp LoadCharacter_

Func_a9354: ; a9354 (2a:5354)
	ld bc, -100
	ld a, $ff
.asm_a9359
	inc a
	ld d, h
	ld e, l
	add hl, bc
	jr c, .asm_a9359
	ld h, d
	ld l, e
	ld [wCGBPalFadeProgram], a
	ld bc, -10
	ld a, $ff
.asm_a9369
	inc a
	ld d, h
	ld e, l
	add hl, bc
	jr c, .asm_a9369
	ld [wNumCGBPalettesToFade], a
	ld a, e
	ld [wFontSourceAddr], a
	ret

Func_a9377: ; a9377 (2a:5377)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wcae7]
	cp $2
	jp c, Func_a93c7
	cp $14
	jp c, Func_a93c7
	cp $14
	jr nz, .asm_a9390
	jp Func_a93c7

.asm_a9390
	cp $15
	jr nz, .asm_a939f
	call Func_a8bed
	ld a, $15
	ld [wcae7], a
	jp Func_a93c7

.asm_a939f
	cp $16
	jr nz, .asm_a93c6
	ld b, $70
	hlbgcoord 0, 5
	call Func_a8d11
	call Func_a8bed
	ld a, [wcaed]
	ld c, $0
	ld de, VTilesBG tile $01
	call LoadDenjuuPic_
	ld a, $4
	call StartFade_
	ld a, $0
	ld [wcae7], a
	jp IncrementSubroutine

.asm_a93c6
	ret

Func_a93c7: ; a93c7 (2a:53c7)
	ld a, [wcae7]
	inc a
	ld [wcae7], a
	ret

Func_a93cf: ; a93cf (2a:53cf)
	ld a, [wcae7]
	cp $0
	jp nz, Func_a946f
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, BANK(GFX_e0f58)
	hlbgcoord 0, 5
	ld de, GFX_e0f58
	ld bc, $e0
	call FarCopy2bpp_2
	ld bc, $a
	call GetCGB_BGLayout_
	call Func_a8bad
	ld a, $0
	ld [wBGPalUpdate], a
	ld a, $2a
	ld [wPrevROMBank], a
	ld a, [wcaed]
	call GetDenjuuPalette_Pal7
	ld a, [wcae0]
	ld c, a
	call Func_a8d6d
	ld a, $2
	ld bc, $1fe
	call LoadNthStdOBPalette
	ld bc, $e0
	hlbgcoord 0, 5
	ld a, $7
	call FillAttrMapWithByte
	ld bc, $0
	ld a, $1
	call StartFade_
	ld a, $1
	ld [wOAMAnimation19_PriorityFlags], a
	call Func_a92ad
	call Func_a912c
	call PrintText_
	ld de, Tilemap_e0c88
	hlbgcoord 0, 1
	ld b, $2
	ld c, $14
	ld a, $0
	call Func_a8c50
	call Func_a92d1
	ld a, $0
	ld hl, VTilesShared tile $38
	call LoadCharacter_
	ld a, $0
	ld hl, VTilesShared tile $39
	call LoadCharacter_
	ld a, $0
	ld hl, VTilesShared tile $3a
	call LoadCharacter_
	ld c, $b3
	ld a, [wcaee]
	or a
	jr z, .asm_a9469
	ld c, $b4
.asm_a9469
	call Func_a9279
	jp Func_a93c7

Func_a946f: ; a946f (2a:546f)
	cp $1
	jr nz, .asm_a948e
	call PrintText_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wOAMAnimation19_XCoord]
	ld [wOAMAnimation19_Duration + 1], a
	call Func_a8bd0
	jp Func_a93c7

.asm_a948e
	cp $2
	jp nz, Func_a9595
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation19_Duration + 13]
	or a
	jp nz, Func_a9585
	ld a, [wOAMAnimation19_Duration + 11]
	or a
	jp nz, Func_a9551
	ld a, [wOverworldFrameCounter]
	and $7
	jr nz, .asm_a94b5
	callba Func_3311f
.asm_a94b5
	call Func_a97aa
	call PrintText_
	ld a, [wOAMAnimation19_Duration + 3]
	ld d, a
	ld a, [wOAMAnimation19_Duration + 2]
	ld e, a
	ld a, [wOAMAnimation19_Duration + 1]
	ld h, a
	ld a, [wOAMAnimation19_Duration]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation19_Duration + 1], a
	ld a, l
	ld [wOAMAnimation19_Duration], a
	ld a, [wOAMAnimation19_Duration + 5]
	ld h, a
	ld a, [wOAMAnimation19_Duration + 4]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation19_Duration + 5], a
	ld a, l
	ld [wOAMAnimation19_Duration + 4], a
	ld hl, rIE
	add hl, de
	ld hl, wOAMAnimation19_Duration + 2
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [hJoyLast]
	and B_BUTTON
	jr z, .asm_a9501
	ld hl, wOAMAnimation19_Duration + 2
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_a9501
	ld c, $3
	ld a, [wOAMAnimation19_Duration + 15]
	ld b, a
	bit 7, a
	jr nz, .asm_a950d
	ld c, $7
.asm_a950d
	call OverworldRandom8_
	and c
	add c
	add b
	ld [wOAMAnimation19_Duration + 15], a
	ld d, a
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	ld b, a
	ld a, [wOAMAnimation19_Duration + 5]
	add b
	ld [wcae4], a
	ld a, [wOAMAnimation19_Duration + 1]
	ld [wOAMAnimation19_XCoord], a
	ld hl, wc463
	ld a, [wcae4]
	ld [hl], a
	ld a, [wOAMAnimation19_Duration + 5]
	cp $d0
	ret nz
	ld a, $d0
	ld [wcae4], a
	ld hl, wc463
	ld a, [wcae4]
	ld [hl], a
	ld a, $1
	ld [wOAMAnimation19_Duration + 11], a
	ret

Func_a9551: ; a9551 (2a:5551)
	call Func_a97aa
	ld a, [wOAMAnimation19_Duration + 11]
	inc a
	ld [wOAMAnimation19_Duration + 11], a
	cp $28
	ret c
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1
	ld [wc9d9], a
	ld a, $1
	ld [wOAMAnimation19_Duration + 13], a
	ld a, $0
	ld [wOAMAnimation19_PriorityFlags], a
	ld b, $8
.asm_a9574
	ld a, BANK(Func_3322a)
	ld hl, Func_3322a
	push bc
	ld d, b
	swap d
	call FarCall_HL
	pop bc
	dec b
	jr nz, .asm_a9574
	ret

Func_a9585: ; a9585 (2a:5585)
	call Func_a97aa
	ld a, [wOAMAnimation19_Duration + 13]
	inc a
	ld [wOAMAnimation19_Duration + 13], a
	cp $50
	jp nc, Func_a93c7
	ret

Func_a9595: ; a9595 (2a:5595)
	cp $3
	jr nz, .asm_a95c0
	call Func_a97c0
	call Func_a97cf
	ld a, [wcae0]
	ld b, a
	ld a, [wOAMAnimation17_Duration + 13]
	dec a
	add b
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec [hl]
	ld a, [wOAMAnimation17_Duration + 15]
	or a
	jr z, .asm_a95dc
	ld a, $4
	call StartFade_
	jp Func_a93c7

.asm_a95c0
	cp $4
	jp nz, Func_a96b8
	ld a, BANK(Func_a9595)
	ld [wPrevROMBank], a
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation17_Duration + 15]
	or a
	jr nz, .asm_a961e
.asm_a95dc
	ld a, BANK(Func_a9595)
	ld [wPrevROMBank], a
	ld a, [wOAMAnimation17_Duration + 14]
	call GetDenjuuPalette_Pal6
	ld a, $0
	ld [wOAMAnimation19_PriorityFlags], a
	ld a, $0
	ld [wcae4], a
	call Func_a8bd0
	ld a, [wOAMAnimation17_Duration + 14]
	ld c, $0
	ld de, VTilesBG tile $41
	call LoadDenjuuPic_
	ld d, $7
	ld bc, $8
	hlbgcoord 22, 5
	ld a, $6
	call FillAttrMapBoxWithByte
	ld a, $0
	ld [wOAMAnimation18_Duration + 7], a
	ld a, $0
	ld [wOAMAnimation18_Duration + 6], a
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

.asm_a961e
	ld a, BANK(GFX_e1308)
	ld hl, VTilesOB tile $00
	ld de, GFX_e1308
	ld bc, $40
	call FarCopy2bpp_2
	ld bc, $1f
	call DecompressGFXByIndex_
	hlbgcoord 0, 4
	ld a, $40
	ld bc, $100
	call FillVRAMWithByte_
	ld de, Tilemap_e1548
	hlbgcoord 7, 7
	ld b, $4
	ld c, $6
	ld a, $6
	call Func_a8c50
	ld d, $8
	ld bc, $20
	hlbgcoord 0, 4
	ld a, $6
	call FillAttrMapBoxWithByte
	ld bc, $a
	call GetCGB_BGLayout_
	ld bc, $11
	call GetCGB_OBLayout_
	call Func_a8bad
	ld a, BANK(Func_a9595)
	ld [wPrevROMBank], a
	ld a, $6
	ld bc, $1db
	call LoadNthStdBGPalette
	call LoadSpecialFontTiles
	call Func_a9858
	call Func_a96e4
	add $af
	ld c, a
	call Func_a9279
	ld a, $0
	ld [wOAMAnimation19_PriorityFlags], a
	ld [wc46c], a
	ld [wc46d], a
	ld a, $0
	ld [wBGPalUpdate], a
	ld a, $6f
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, $6f
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, $30
	ld [wOAMAnimation17_XCoord], a
	ld a, $70
	ld [wOAMAnimation18_XCoord], a
	ld a, $2a
	ld [wPrevROMBank], a
	ld bc, $0
	ld a, $1
	call StartFade_
	jp Func_a93c7

Func_a96b8: ; a96b8 (2a:56b8)
	cp $5
	jr nz, .asm_a96e3
	ld a, BANK(Func_a96b8)
	ld [wPrevROMBank], a
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wcae7], a
	ld a, [wOAMAnimation17_Duration + 15]
	or a
	jp z, IncrementSubroutine
	ld a, $20
	ld [wcae7], a
	ld a, $23
	ld [wSubroutine], a
	ld a, SFX_05
	ld [H_SFX_ID], a
.asm_a96e3
	ret

Func_a96e4: ; a96e4 (2a:56e4)
	or a
	ret z
	push hl
	push bc
	push af
	ld a, BANK(Func_a96e4)
	ld [wPrevROMBank], a
	enable_sram sAddressBook
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, sAddressBook
	add hl, bc
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, d
	inc hl
	inc hl
	push hl
	push bc
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	pop bc
	call GetExpToNextLevel
	pop hl
	ld a, b
	ld [wOAMAnimation18_Duration + 2], a
	ld a, c
	ld [wOAMAnimation18_Duration + 3], a
	pop af
	push af
	push hl
	ld hl, Data_a9787
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld e, a
	ld d, $0
	call Multiply_DE_by_BC
	srl d
	rr e
	srl d
	rr e
	srl d
	rr e
	pop bc
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld h, a
	dec bc
	add hl, de
	ld d, h
	ld e, l
	push bc
	ld bc, -1998
	add hl, bc
	jr nc, .asm_a9763
	ld de, 1998
.asm_a9763
	pop bc
	enable_sram sAddressBook
	ld a, e
	ld [bc], a
	inc bc
	ld a, d
	ld [bc], a
	disable_sram
	call Func_a92d1
	ld a, b
	ld [wOAMAnimation18_Duration + 23], a
	ld a, c
	ld [wOAMAnimation18_Duration + 22], a
	pop af
	pop bc
	pop hl
	ret

Data_a9787:
	db 0, 2, 4, 7

Func_a978b:
	ld b, a
	ld a, BANK(Func_a978b)
	ld [wPrevROMBank], a
	ld a, [wcaed]
	call GetExpToNextLevel
	push bc
	callba Func_a5509
	pop hl
	ld a, b
	cp h
	jr nz, .asm_a97a9
	ld a, c
	cp l
	jr nz, .asm_a97a9
.asm_a97a9
	ret

Func_a97aa: ; a97aa (2a:57aa)
	ld a, [wSubroutine]
	push af
	ld a, $4
	ld [wSubroutine], a
	callba Func_3079c
	pop af
	ld [wSubroutine], a
	ret

Func_a97c0: ; a97c0 (2a:57c0)
	ld b, $c
	ld hl, wOAMAnimation01
	ld de, $20
	xor a
.asm_a97c9
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_a97c9
	ret

Func_a97cf: ; a97cf (2a:57cf)
	ld hl, Data_aa0b1
	ld a, [wcaed]
	ld b, $0
	ld c, a
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld a, [wcae0]
	ld b, a
	dec b
	ld a, [wcaee]
	or a
	jr z, .zero
	ld a, b
	add $40
	ld b, a
.zero
	ld c, $0
	ld a, [hli]
	cp b
	jr z, .okay
	inc c
	ld a, [hli]
	cp b
	jr z, .okay
	ld a, $1
	ld [wOAMAnimation17_Duration + 15], a
	ret

.okay
	inc hl
	ld a, [hl]
	dec a
	ld [wOAMAnimation17_Duration + 14], a
	ld [wc912], a
	ld c, a
	ld b, $0
	ld hl, DENJUU_DEX_CAUGHT_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld bc, DENJUU_DEX_SEEN_FLAGS - DENJUU_DEX_CAUGHT_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	enable_sram sAddressBook
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld c, a
	ld hl, sAddressBook
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld a, [wc912]
	ld [hl], a
	disable_sram
	ld a, [wc912]
	call Func_a92a8
	ld a, $0
	ld [wOAMAnimation17_Duration + 15], a
	ret

Func_a9858: ; a9858 (2a:5858)
	ld hl, Data_a9a93
	ld a, [wcaed]
	ld c, a
	ld b, $0
	add hl, bc
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	push hl
	ld bc, $8
	add hl, bc
	ld a, [hl]
	ld b, a
	ld a, [wcae0]
	dec a
	cp b
	jr nz, .new
	pop hl
	ld a, $3
	or a
	ret

.new
	pop hl
	ld a, [wcae0]
	dec a
	ld b, a
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	ld c, $1
	and $7
	jr z, .skip_shift
.bit_shift
	sla c
	dec a
	jr nz, .bit_shift
.skip_shift
	ld a, [hl]
	and c
	ret z
	cp $12
	jr z, .useless
	cp $1d
	jr z, .useless
	cp $31
	jr z, .useless
	cp $32
	jr z, .useless
	cp $33
	jr nz, .asm_a98bb
.useless
	ld a, $1
	or a
	ret

.asm_a98bb
	ld a, $2
	or a
	ret

Func_a98bf: ; a98bf (2a:58bf)
	call PrintText_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation18_Duration + 6]
	cp $e6
	jr nc, .asm_a9915
	ld a, $1
	ld [wc46c], a
	ld a, $1
	ld [wc46d], a
	call Func_a99cf
	ld b, $0
	ld a, c
	or a
	jr z, .asm_a98e3
	ld b, $80
.asm_a98e3
	ld hl, wc463
	ld [hl], b
	ld a, [wOAMAnimation18_Duration + 6]
	cp $e6
	jr nz, .asm_a9914
	ld a, SFX_15
	ld [H_SFX_ID], a
	call Func_a9942
	ld a, [wcaee]
	or a
	jr z, .asm_a9909
	ld a, $2d
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	jr .asm_a9914

.asm_a9909
	ld a, $2c
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
.asm_a9914
	ret

.asm_a9915
	ld a, [wOverworldFrameCounter]
	and $3
	jr nz, .asm_a9924
	callba Func_33303
.asm_a9924
	call Func_a97aa
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .asm_a9941
	ld a, $0
	ld [wOAMAnimation17_Duration + 15], a
	call Func_a91b4
	ld a, $0
	ld [wcae7], a
	ld [wcd00], a
	call Func_a97c0
.asm_a9941
	ret

Func_a9942: ; a9942 (2a:5942)
	call LoadSpecialFontTiles
	ld bc, $1d
	ld a, [wcaee]
	or a
	jr z, .asm_a9951
	ld bc, $1e
.asm_a9951
	call DecompressGFXByIndex_
	ld a, BANK(GFX_e1118)
	hlbgcoord 0, 5
	ld de, GFX_e1118
	ld bc, $e0
	call FarCopy2bpp_2
	ld bc, $1dd
	ld a, [wcaee]
	or a
	jr z, .asm_a996e
	ld bc, $1dc
.asm_a996e
	ld a, $5
	call LoadNthStdBGPalette
	ld a, $0
	ld [wOAMAnimation19_PriorityFlags], a
	ld [wc46c], a
	ld [wc46d], a
	ld d, $7
	ld bc, $8
	hlbgcoord 6, 5
	ld a, $6
	call FillAttrMapBoxWithByte
	ld d, $8
	ld bc, $6
	hlbgcoord 0, 4
	ld a, $5
	call FillAttrMapBoxWithByte
	ld d, $8
	ld bc, $6
	hlbgcoord 14, 4
	ld a, $5
	call FillAttrMapBoxWithByte
	ld c, $b5
	ld a, [wcaee]
	or a
	jr z, .asm_a99af
	ld c, $b6
.asm_a99af
	call Func_a9279
	ld a, $1
	ld [wBGPalUpdate], a
	ld de, GFX_e1448
	ld a, [wcaee]
	or a
	jr z, .asm_a99c3
	ld de, GFX_e1348
.asm_a99c3
	ld a, BANK(GFX_e1348)
	hlbgcoord 0, 4
	ld bc, $100
	call FarCopy2bpp_2
	ret

Func_a99cf: ; a99cf (2a:59cf)
	ld c, $0
	ld a, [wOAMAnimation18_Duration + 6]
	inc a
	ld [wOAMAnimation18_Duration + 6], a
	cp $55
	jr nc, .asm_a99e1
	and $e
	jr z, .asm_a99f3
	ret

.asm_a99e1
	cp $96
	jr nc, .asm_a99ea
	and $6
	jr z, .asm_a99f3
	ret

.asm_a99ea
	cp $e6
	jr nc, .asm_a99f3
	and $2
	jr z, .asm_a99f3
	ret

.asm_a99f3
	inc c
	ret

Func_a99f5: ; a99f5 (2a:59f5)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_a9a57
	call PrintText_
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .pressed_b
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .still_printing
	ld bc, EVENT_SAID_YES
	call CheckEventFlag
	jr nz, .said_yes
.pressed_b
	ld a, $0
	ld [wOAMAnimation17_Duration + 15], a
	call Func_a91b4
	ld a, $0
	ld [wcae7], a
	ld [wcd00], a
	ld a, SFX_04
	ld [H_SFX_ID], a
	ret

.said_yes
	call Func_a91b4
	ld a, $19
	ld [wSubroutine], a
	ld a, $0
	ld [wcae7], a
	ld [wcd00], a
	ld a, [wc908]
	ld [wcdec], a
	ld a, [wOAMAnimation18_Duration + 21]
	ld [wcdee], a
	ld a, [wOAMAnimation19_Duration + 21]
	ld [wcde1], a
	call Func_a920d
	ld a, SFX_03
	ld [H_SFX_ID], a
	ret

.still_printing
	ret

Func_a9a57: ; a9a57 (2a:5a57)
	ld a, $1
	ld [wOAMAnimation17_PriorityFlags], a
	ld [wOAMAnimation18_PriorityFlags], a
	ld a, [wcae7]
	or a
	jr z, .asm_a9a66
	dec a
.asm_a9a66
	ld [wcae7], a
	ld a, [wOverworldFrameCounter]
	ld d, a
	sla d
	sla d
	sla d
	sla d
	call Sine8_
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_a9a80
	dec b
.asm_a9a80
	ld a, [wcae7]
	ld e, a
	ld d, $0
	call Multiply_DE_by_BC
	ld a, $45
	add d
	ld [wOAMAnimation17_YCoord], a
	ld [wOAMAnimation18_YCoord], a
	ret

Data_a9a93:
	db $40, $60, $04, $20, $04, $41, $0e, $00, $0d
	db $02, $01, $0e, $22, $04, $00, $0e, $00, $13
	db $00, $08, $44, $a0, $04, $08, $0f, $00, $1f
	db $00, $80, $04, $32, $04, $00, $0e, $00, $0f
	db $02, $00, $04, $20, $84, $20, $0e, $00, $01
	db $04, $00, $04, $28, $04, $51, $0e, $00, $02
	db $00, $00, $0c, $24, $46, $04, $0f, $00, $13
	db $00, $00, $14, $a0, $94, $00, $0e, $00, $14
	db $00, $00, $14, $30, $0c, $a8, $0e, $00, $2d
	db $00, $00, $24, $20, $84, $04, $0f, $00, $27
	db $00, $00, $04, $a4, $04, $a0, $0e, $00, $2f
	db $00, $00, $14, $22, $85, $81, $0e, $00, $28
	db $00, $00, $64, $30, $0c, $01, $0e, $00, $15
	db $00, $00, $24, $38, $04, $02, $0e, $00, $1c
	db $00, $40, $04, $a1, $14, $40, $0f, $00, $0e
	db $00, $00, $25, $20, $04, $00, $0e, $00, $10
	db $00, $08, $04, $2a, $04, $00, $0e, $00, $0b
	db $00, $02, $04, $30, $04, $22, $0f, $00, $09
	db $00, $00, $06, $2a, $44, $00, $0e, $00, $11
	db $08, $00, $04, $24, $15, $00, $0f, $00, $03
	db $01, $00, $04, $11, $4e, $00, $0f, $00, $00
	db $20, $00, $44, $88, $08, $10, $0e, $00, $05
	db $04, $00, $24, $00, $0a, $20, $0e, $00, $02
	db $00, $01, $04, $10, $08, $82, $0e, $00, $08
	db $00, $10, $04, $11, $08, $00, $0e, $00, $0c
	db $10, $00, $04, $82, $18, $04, $0f, $00, $04
	db $40, $00, $24, $00, $4a, $10, $0e, $00, $06
	db $80, $00, $84, $40, $08, $20, $0e, $00, $07
	db $00, $00, $46, $08, $08, $81, $0e, $00, $11
	db $00, $00, $84, $40, $0e, $00, $0e, $00, $22
	db $00, $00, $04, $84, $88, $02, $0e, $00, $27
	db $00, $00, $24, $90, $08, $10, $0e, $00, $15
	db $00, $00, $44, $c2, $09, $02, $0e, $00, $1f
	db $00, $40, $84, $00, $08, $14, $0f, $00, $0e
	db $00, $04, $04, $00, $88, $40, $0e, $00, $2e
	db $00, $40, $44, $20, $00, $08, $4e, $03, $2b
	db $00, $00, $04, $20, $00, $10, $0e, $00, $2c
	db $04, $00, $85, $20, $00, $00, $0e, $03, $02
	db $10, $10, $04, $20, $00, $00, $ee, $00, $04
	db $08, $00, $04, $24, $00, $00, $0e, $00, $03
	db $00, $04, $46, $20, $00, $00, $2e, $01, $0a
	db $80, $80, $84, $20, $00, $00, $4e, $01, $07
	db $20, $20, $05, $20, $00, $00, $8e, $02, $05
	db $00, $00, $94, $60, $00, $00, $4e, $00, $1e
	db $00, $90, $24, $20, $00, $00, $2e, $00, $0c
	db $02, $40, $04, $20, $00, $00, $8e, $02, $01
	db $00, $40, $0d, $20, $00, $00, $ae, $00, $0e
	db $00, $28, $84, $20, $00, $00, $4e, $03, $0b
	db $00, $01, $54, $20, $00, $00, $2e, $03, $08
	db $40, $40, $0c, $20, $00, $00, $ce, $00, $06
	db $00, $02, $26, $20, $00, $00, $0e, $00, $09
	db $00, $00, $94, $20, $00, $00, $0e, $00, $17
	db $02, $00, $25, $22, $00, $00, $0e, $03, $01
	db $00, $08, $04, $28, $00, $00, $ee, $00, $0b
	db $00, $40, $94, $20, $00, $00, $4e, $01, $17
	db $00, $00, $0c, $20, $81, $00, $8e, $02, $20
	db $02, $00, $06, $20, $04, $00, $4e, $01, $22
	db $00, $80, $0c, $20, $80, $02, $0e, $00, $29
	db $90, $00, $45, $20, $80, $00, $8e, $02, $04
	db $00, $00, $26, $20, $88, $00, $0e, $01, $23
	db $00, $40, $04, $20, $80, $10, $8e, $00, $2c
	db $02, $10, $44, $20, $81, $00, $4e, $00, $20
	db $80, $00, $05, $22, $80, $00, $8e, $02, $19
	db $00, $00, $84, $24, $80, $00, $ce, $00, $1a
	db $00, $40, $0c, $20, $84, $00, $4e, $02, $22
	db $00, $10, $44, $21, $80, $00, $0e, $01, $16
	db $00, $00, $85, $20, $80, $00, $8e, $02, $10
	db $80, $00, $24, $20, $c0, $00, $ce, $00, $26
	db $00, $40, $0c, $20, $80, $40, $4e, $02, $2e
	db $00, $00, $04, $a1, $80, $00, $0e, $01, $1f
	db $40, $00, $26, $28, $80, $00, $8e, $00, $1b
	db $00, $00, $0c, $21, $80, $00, $0e, $01, $18
	db $02, $00, $24, $24, $80, $00, $4e, $02, $1a
	db $00, $00, $8d, $20, $80, $00, $0e, $01, $13
	db $20, $80, $0c, $20, $80, $80, $8e, $02, $2f
	db $00, $10, $45, $00, $40, $20, $0e, $00, $10
	db $01, $08, $0c, $40, $40, $10, $4e, $00, $13
	db $00, $02, $05, $42, $40, $04, $0e, $02, $19
	db $40, $00, $04, $80, $40, $20, $0e, $00, $06
	db $01, $02, $05, $40, $40, $10, $4e, $00, $09
	db $00, $00, $44, $88, $40, $20, $0e, $00, $1b
	db $00, $00, $85, $40, $40, $50, $4e, $00, $17
	db $00, $42, $05, $00, $40, $04, $0e, $02, $0e
	db $00, $13, $44, $80, $40, $08, $0e, $01, $09
	db $00, $00, $06, $80, $40, $20, $0e, $00, $11
	db $00, $00, $25, $60, $40, $40, $4e, $00, $15
	db $00, $81, $04, $22, $40, $08, $0e, $01, $19
	db $01, $10, $44, $b0, $40, $40, $4e, $01, $1c
	db $00, $02, $04, $64, $40, $10, $0e, $02, $1a
	db $00, $14, $05, $60, $40, $00, $4e, $02, $0c
	db $02, $20, $04, $20, $00, $00, $0e, $00, $0d
	db $01, $00, $04, $a0, $00, $00, $0e, $00, $1f
	db $80, $00, $04, $60, $00, $00, $0e, $00, $1e
	db $02, $00, $04, $20, $08, $00, $0e, $00, $23
	db $04, $01, $0c, $20, $00, $00, $0e, $00, $13
	db $40, $00, $04, $20, $02, $00, $0e, $00, $21
	db $00, $08, $04, $20, $01, $00, $0e, $00, $20
	db $00, $90, $04, $20, $00, $00, $0e, $00, $0f
	db $52, $04, $04, $20, $04, $00, $0e, $00, $22
	db $09, $01, $04, $20, $10, $00, $0e, $00, $24
	db $80, $20, $04, $20, $00, $00, $0e, $00, $0d
	db $00, $20, $04, $20, $80, $00, $0e, $00, $27
	db $40, $00, $04, $20, $00, $04, $0e, $00, $2a
	db $20, $00, $04, $20, $00, $20, $0e, $00, $2d
	db $00, $22, $04, $20, $00, $08, $0e, $00, $2b
	db $00, $04, $04, $20, $00, $80, $0e, $00, $2f
	db $04, $00, $04, $20, $00, $01, $0e, $00, $28
	db $08, $00, $04, $20, $10, $00, $0e, $00, $24
	db $04, $00, $14, $20, $00, $00, $0e, $00, $14
	db $10, $02, $04, $60, $00, $00, $0e, $00, $1e
	db $00, $08, $04, $28, $08, $00, $4e, $01, $23
	db $00, $40, $44, $20, $00, $00, $4e, $00, $16
	db $00, $20, $24, $a0, $00, $00, $0e, $02, $15
	db $00, $80, $04, $30, $02, $00, $0e, $00, $1c
	db $00, $08, $07, $20, $04, $00, $4e, $01, $10
	db $00, $20, $14, $a0, $00, $00, $0e, $02, $14
	db $00, $00, $04, $28, $12, $00, $0e, $03, $24
	db $00, $40, $04, $a1, $00, $00, $4e, $02, $18
	db $00, $00, $04, $68, $00, $00, $4e, $02, $1e
	db $00, $02, $06, $20, $02, $00, $0e, $01, $09
	db $00, $10, $04, $24, $00, $80, $8e, $01, $2f
	db $10, $00, $04, $22, $01, $04, $4e, $02, $2a
	db $04, $40, $04, $30, $04, $00, $4e, $00, $22
	db $00, $00, $04, $a4, $08, $00, $0e, $00, $23
	db $10, $80, $04, $60, $00, $00, $4e, $02, $0f
	db $00, $00, $0c, $a0, $00, $00, $0e, $00, $13
	db $00, $00, $06, $22, $01, $00, $4e, $02, $11
	db $00, $10, $84, $24, $00, $00, $4e, $00, $17
	db $40, $00, $04, $28, $00, $10, $2e, $00, $2c
	db $00, $00, $04, $a4, $40, $00, $0e, $00, $26
	db $04, $00, $04, $26, $04, $00, $4e, $02, $1a
	db $40, $20, $04, $68, $00, $00, $2e, $00, $1e
	db $10, $00, $04, $32, $01, $00, $0e, $02, $1c
	db $04, $10, $04, $24, $02, $00, $6e, $00, $21
	db $10, $40, $04, $60, $01, $00, $6e, $02, $20
	db $00, $88, $14, $00, $00, $08, $0f, $00, $0b
	db $00, $00, $a4, $00, $00, $80, $0e, $02, $17
	db $08, $80, $2c, $00, $00, $20, $0e, $00, $15
	db $01, $02, $14, $00, $00, $00, $0e, $00, $00
	db $00, $00, $26, $20, $80, $00, $0e, $02, $11
	db $08, $a0, $04, $20, $08, $00, $0e, $00, $0d
	db $00, $11, $04, $20, $00, $01, $0e, $02, $0c
	db $08, $00, $0e, $22, $00, $08, $0e, $01, $19
	db $00, $00, $05, $a0, $00, $40, $0e, $00, $1f
	db $00, $82, $14, $21, $00, $00, $0e, $00, $18
	db $00, $00, $2c, $28, $80, $80, $0e, $02, $1b
	db $08, $00, $25, $20, $00, $10, $0e, $00, $15
	db $00, $42, $24, $20, $10, $00, $0e, $02, $0e
	db $40, $04, $06, $20, $08, $00, $0e, $00, $0a
	db $00, $01, $88, $20, $40, $00, $0e, $02, $17
	db $04, $00, $64, $20, $00, $00, $0e, $02, $16
	db $01, $04, $04, $21, $00, $00, $0e, $00, $18
	db $40, $80, $24, $20, $01, $00, $0e, $00, $20
	db $00, $00, $04, $20, $08, $00, $0e, $02, $23
	db $04, $00, $04, $20, $00, $40, $0e, $00, $2e
	db $10, $00, $0c, $20, $02, $00, $8e, $00, $21
	db $00, $04, $04, $20, $40, $00, $0e, $00, $26
	db $00, $01, $0c, $28, $00, $00, $0e, $01, $1b
	db $00, $00, $05, $20, $00, $00, $8e, $00, $10
	db $00, $00, $04, $00, $00, $00, $0e, $00, $00
	db $20, $08, $14, $21, $00, $00, $0e, $00, $14
	db $21, $00, $44, $24, $00, $00, $0e, $00, $1a
	db $20, $08, $84, $20, $44, $00, $2e, $00, $22
	db $20, $02, $05, $20, $04, $44, $0e, $02, $2e
	db $24, $00, $04, $21, $40, $00, $2e, $00, $00
	db $20, $00, $84, $20, $10, $00, $0e, $00, $24
	db $20, $08, $04, $20, $00, $01, $0e, $00, $28
	db $20, $04, $06, $20, $00, $00, $0e, $00, $11
	db $20, $00, $0c, $21, $00, $00, $0e, $00, $13
	db $00, $00, $24, $a1, $00, $10, $2e, $00, $18
	db $00, $10, $04, $30, $02, $00, $0e, $00, $1c
	db $01, $20, $0c, $20, $00, $20, $8e, $00, $0d
	db $00, $00, $04, $20, $00, $00, $0e, $00, $00
	db $00, $00, $04, $20, $00, $00, $0e, $00, $00

Data_aa0b1:
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $40, $ff, GYMRACE, $00
	db $40, $ff, LIRIONPU, $00
	db $40, $ff, WHITAH, $00
	db $40, $ff, POTZAL, $00
	db $40, $ff, ARANEIDA, $00
	db $40, $ff, GADHORO, $00
	db $40, $ff, CLIOGERA, $00
	db $40, $ff, GUST, $00
	db $40, $ff, REIGE, $00
	db $40, $ff, TOGERUKA, $00
	db $40, $ff, RAIGALEON, $00
	db $40, $ff, GADORKUMA, $00
	db $40, $ff, ABIRAS, $00
	db $40, $ff, ALPHAGOS, $00
	db $40, $ff, KIYORUKA, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $19, $ff, DRILARMOR, $00
	db $09, $ff, CHAMELAN, $00
	db $36, $ff, CRYPTOARM, $00
	db $03, $ff, SHELLSTERA, $00
	db $2e, $ff, FUNGEIST, $00
	db $03, $ff, BALLTAMUS, $00
	db $16, $ff, BURENICA, $00
	db $0b, $ff, GERON, $00
	db $2c, $ff, BERZELIA, $00
	db $ff, $ff, $00, $00
	db $00, $ff, RAYGOTEN, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $08, $41, EASYDOG, GYMGANON
	db $05, $41, BAIONPU, SAIOPE
	db $1b, $41, WARUTAH, WATTAH
	db $04, $41, GUNTZATL, QUETZAKING
	db $02, $41, ARAKUIDA, ARAKUDABARAN
	db $15, $41, BADHORO, PUNKHORO
	db $05, $41, LAMPGERA, VIKINGURIN
	db $22, $41, TEMPEST, STORM
	db $1a, $41, ZUDOON, MUTOOM
	db $06, $41, HIYU, GYPSOPHI
	db $14, $ff, GYMGARTH, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $01, $ff, CRYPTOSNIPE, $00
	db $17, $ff, FUNGBOOST, $00
	db $07, $ff, VEENICA, $00
	db $29, $ff, SAIGULIGER, $00
	db $18, $ff, ARMEDURUS, $00
	db $37, $ff, OCTORIFLE, $00
	db $0e, $ff, ERASERBOAR, $00
	db $28, $ff, SPEARNEEDLE, $00
	db $1e, $ff, GILGIERTH, $00
	db $2a, $ff, TRICERARMOR, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $05, $42, GYMZYRUS, GYMBARON
	db $0a, $42, CANONOPE, LIRIMONARCH
	db $1f, $42, CALM, ENTEIOH
	db $42, $ff, GOLAKING, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $21, $ff, RYUUGUU, $00
	db $ff, $ff, $00, $00
	db $42, $ff, KANZOU, $00
	db $38, $ff, GIGAGIGERTH, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $07, $ff, GYMZATAN, $00
	db $1e, $ff, DOOMSDAY, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $39, $ff, DENDEL, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00
	db $ff, $ff, $00, $00

Data_aa369:
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $40, $40, $40, $40, $40
	db $40, $40, $40, $40, $40, $40
	db $00, $40, $40, $40, $00, $40
	db $00, $40, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $41, $41, $41, $41, $00, $41
	db $41, $41, $41, $00, $00, $00
	db $00, $41, $41, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $42
	db $42, $42, $42, $42, $00, $00
	db $00, $00, $00, $00, $00, $00
	db $00, $00, $00, $00, $00, $00

Data_aa417:
; 2
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 1, 4, 4, 4
	dn 0, 0, 1, 1, 1, 1, 1, 1
	dn 0, 5, 1, 1, 0, 6, 6, 1
	dn 5, 5, 0, 0, 0, 1, 6, 6
	dn 5, 5, 0, 0, 0, 1, 6, 6
; 3
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 6, 1, 1, 1, 1, 1, 1, 1
	dn 6, 0, 6, 6, 6, 1, 1, 1
; 4
	dn 5, 5, 0, 0, 0, 0, 0, 6
	dn 0, 0, 0, 0, 0, 5, 5, 5
	dn 0, 0, 0, 0, 0, 5, 1, 1
	dn 0, 0, 0, 5, 5, 5, 1, 1
	dn 0, 0, 0, 5, 1, 1, 1, 1
	dn 0, 0, 0, 5, 1, 1, 1, 1
	dn 0, 0, 0, 5, 0, 0, 0, 1
	dn 0, 0, 0, 5, 0, 0, 0, 0
	dn 0, 6, 6, 6, 6, 6, 0, 1
; 5
	dn 5, 1, 0, 6, 6, 6, 0, 1
	dn 5, 1, 0, 6, 6, 0, 0, 0
	dn 5, 1, 0, 6, 6, 0, 0, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5

Data_aa497:
	db 0, 0, 0, 0, 0, 0
	db 1, 1, 1, 1, 4, 0
	db 4, 4, 3, 3, 4, 4
	db 4, 4, 4, 4, 4, 4
	db 4, 4, 3, 3, 3, 3
	db 3, 3, 3, 3, 3, 3
	db 3, 3, 3, 3, 3, 3
	db 3, 0, 0, 0, 0, 0
	db 0, 0, 3, 3, 3, 0
	db 0, 0, 0, 0, 0, 0
	db 0, 0

Pointers_aa4d5:
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6e4
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6e4
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8

Data_aa6d5: db $00
Data_aa6d6: db $01
Data_aa6d7: db $02
Data_aa6d8: db $03
Data_aa6d9: db $04
Data_aa6da: db $05
Data_aa6db: db $06
Data_aa6dc: db $07
Data_aa6dd: db $08
Data_aa6de: db $09
Data_aa6df: db $0a
Data_aa6e0: db $0b
Data_aa6e1: db $0c
Data_aa6e2: db $0d
Data_aa6e3: db $15
Data_aa6e4: db $0e

Pointers_aa6e5:
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa750
	dw Data_aa751
	dw Data_aa752
	dw Data_aa753
	dw Data_aa754
	dw Data_aa755
	dw Data_aa756
	dw Data_aa757
	dw Data_aa758
	dw Data_aa759
	dw Data_aa75a
	dw Data_aa75b
	dw Data_aa75c
	dw Data_aa75d
	dw Data_aa75e
	dw Data_aa75f
	dw Data_aa760
	dw Data_aa761
	dw Data_aa762
	dw Data_aa763
	dw Data_aa764
	dw Data_aa765
	dw Data_aa766
	dw Data_aa767
	dw Data_aa768
	dw Data_aa769
	dw Data_aa76a
	dw Data_aa76b
	dw Data_aa76c
	dw Data_aa76d
	dw Data_aa76e
	dw Data_aa76f
	dw Data_aa770
	dw Data_aa770
	dw Data_aa770
	dw Data_aa770
	dw Data_aa771
	dw Data_aa772
	dw Data_aa773
	dw Data_aa774
	dw Data_aa774
	dw Data_aa774

Data_aa74f: db $0f
Data_aa750: db $00
Data_aa751: db $10
Data_aa752: db $10
Data_aa753: db $11
Data_aa754: db $12
Data_aa755: db $13
Data_aa756: db $13
Data_aa757: db $13
Data_aa758: db $13
Data_aa759: db $13
Data_aa75a: db $14
Data_aa75b: db $14
Data_aa75c: db $14
Data_aa75d: db $14
Data_aa75e: db $14
Data_aa75f: db $0d
Data_aa760: db $0d
Data_aa761: db $0d
Data_aa762: db $0d
Data_aa763: db $0d
Data_aa764: db $0d
Data_aa765: db $0d
Data_aa766: db $0d
Data_aa767: db $0e
Data_aa768: db $0e
Data_aa769: db $0e
Data_aa76a: db $0e
Data_aa76b: db $0e
Data_aa76c: db $0e
Data_aa76d: db $0e
Data_aa76e: db $0e
Data_aa76f: db $0e
Data_aa770: db $00
Data_aa771: db $00
Data_aa772: db $04
Data_aa773: db $00
Data_aa774: db $06

OverworldEncounterFlags: ; 4 rows of 64
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1
	db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0
	db 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0

OutdoorLandmarkNames:
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Cactos
	dw .Cactos
	dw .Cactos
	dw .Cactos
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Cactos
	dw .Cactos
	dw .Cactos
	dw .Cactos
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Brion
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Mikesu
	dw .Mikesu
	dw .Brion
	dw .Toronko
	dw .Toronko
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Peperi
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Mikesu
	dw .Mikesu
	dw .Brion
	dw .Toronko
	dw .Toronko
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Paparuna
	dw .Paparuna
	dw .Paparuna
	dw .Mikesu
	dw .Mikesu
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Ikusosu
	dw .Toripa
	dw .Toripa
	dw .Toripa
	dw .Mikesu
	dw .Mikesu
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Toripa
	dw .Toripa
	dw .Toripa
	dw .Mikesu
	dw .Mikesu
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Flaura
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Iris
	dw .Iris
	dw .Kurinon
	dw .Kurinon
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Iris
	dw .Iris
	dw .Kurinon
	dw .Kurinon
	dw .Toronko
	dw .Toronko
	dw .Toronko
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Barran
	dw .Barran
	dw .Iris
	dw .Iris
	dw .Iris
	dw .Kurinon
	dw .Kurinon
	dw .Kurinon
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Barran
	dw .Barran
	dw .Iris
	dw .Iris
	dw .Iris
	dw .Kurinon
	dw .Kurinon
	dw .Kurinon
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .Barran
	dw .Barran
	dw .Barran
	dw .Iris
	dw .PalmSea
	dw .Pansesu
	dw .Pansesu
	dw .Pansesu
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea
	dw .Pansesu
	dw .Pansesu
	dw .Pansesu
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea
	dw .Pansesu
	dw .Pansesu
	dw .Pansesu
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Ion
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .Frijia
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea
	dw .PalmSea

.Toronko:
	db "トロンコむら$"

.Kurinon:
	db "クリノンむら$"

.Iris:
	db "うみのみえるまち イーリス$"

.PalmSea:
	db "パームかい$"

.Frijia:
	db "キカイのまち フリジア$"

.Barran:
	db "すなのまち バーラン$"

.Ion:
	db "イオンとう$"

.Paparuna:
	db "パパルナこ$"

.Pansesu:
	db "パンセスむら$"

.Toripa:
	db "トリパむら$"

.Flaura:
	db "フラウラむら$"

.Peperi:
	db "あくまのやま ぺぺリやま$"

.Ikusosu:
	db "イクソスのもリ$"

.Cactos:
	db "カクトスいせき$"

.Mikesu:
	db "どくのみずうみ ミケス$"

.Brion:
	db "ブリオンいせき$"

IndoorLandmarkNames:
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab69
	dw String_aab75
	dw String_aab83
	dw String_aab90
	dw String_aab9d
	dw String_aaba9
	dw String_aabb3
	dw String_aabbe
	dw String_aabc9
	dw String_aabd4
	dw String_aabdf
	dw String_aabea
	dw String_aabf4
	dw String_aabfe
	dw String_aac0a
	dw String_aac16
	dw String_aac22
	dw String_aac2a
	dw String_aac32
	dw String_aac3a
	dw String_aac42
	dw String_aac4a
	dw String_aac52
	dw String_aac5a
	dw String_aac62
	dw String_aac69
	dw String_aac70
	dw String_aac77
	dw String_aac7e
	dw String_aac85
	dw String_aac8c
	dw String_aac93
	dw String_aac9a
	dw String_aaca1
	dw String_aaca8
	dw String_aacaf
	dw String_aacb6
	dw String_aacb6
	dw String_aacb6
	dw String_aacb6
	dw String_aacb6
	dw String_aacba
	dw String_aacc0

String_aab69:
	db "トロンコむら すいげん$"

String_aab75:
	db "オーキッドなかのしま4かい$"

String_aab83:
	db "クリノンむら ちか1かい$"

String_aab90:
	db "クリノンむら ちか2かい$"

String_aab9d:
	db "クラフトけんきゅうじょ$"

String_aaba9:
	db "ディメンザのやしき$"

String_aabb3:
	db "アンテナのき 1かい$"

String_aabbe:
	db "アンテナのき 2かい$"

String_aabc9:
	db "アンテナのき 3かい$"

String_aabd4:
	db "アンテナのき 4かい$"

String_aabdf:
	db "アンテナのき 5かい$"

String_aabea:
	db "ぺぺリやま ふもと$"

String_aabf4:
	db "ぺぺリやま ふもと$"

String_aabfe:
	db "ぺぺリやま ちゅうふく$"

String_aac0a:
	db "ぺぺリやま ちゅうふく$"

String_aac16:
	db "ぺぺリやま さんちょう$"

String_aac22:
	db "カクトスいせき$"

String_aac2a:
	db "カクトスいせき$"

String_aac32:
	db "カクトスいせき$"

String_aac3a:
	db "カクトスいせき$"

String_aac42:
	db "カクトスいせき$"

String_aac4a:
	db "カクトスいせき$"

String_aac52:
	db "カクトスいせき$"

String_aac5a:
	db "カクトスいせき$"

String_aac62:
	db "ブリオン 1$"

String_aac69:
	db "ブリオン 2$"

String_aac70:
	db "ブリオン 3$"

String_aac77:
	db "ブリオン 4$"

String_aac7e:
	db "ブリオン 5$"

String_aac85:
	db "ブリオン 6$"

String_aac8c:
	db "ブリオン 7$"

String_aac93:
	db "ブリオン 8$"

String_aac9a:
	db "ブリオン 9$"

String_aaca1:
	db "みずのほこら$"

String_aaca8:
	db "もリのほこら$"

String_aacaf:
	db "すなのほこら$"

String_aacb6:
	db "1かい$"

String_aacba:
	db "ちか1かい$"

String_aacc0:
	db "ちか2かい$"

ItemSpriteGFX:
INCBIN "gfx/sprites/items/000.w16.2bpp"
INCBIN "gfx/sprites/items/001.w16.2bpp"
INCBIN "gfx/sprites/items/002.w16.2bpp"
INCBIN "gfx/sprites/items/003.w16.2bpp"
INCBIN "gfx/sprites/items/004.w16.2bpp"
INCBIN "gfx/sprites/items/005.w16.2bpp"
INCBIN "gfx/sprites/items/006.w16.2bpp"
INCBIN "gfx/sprites/items/007.w16.2bpp"
INCBIN "gfx/sprites/items/008.w16.2bpp"
INCBIN "gfx/sprites/items/009.w16.2bpp"
INCBIN "gfx/sprites/items/010.w16.2bpp"
INCBIN "gfx/sprites/items/011.w16.2bpp"
INCBIN "gfx/sprites/items/012.w16.2bpp"
INCBIN "gfx/sprites/items/013.w16.2bpp"
INCBIN "gfx/sprites/items/014.w16.2bpp"
INCBIN "gfx/sprites/items/015.w16.2bpp"
INCBIN "gfx/sprites/items/016.w16.2bpp"
INCBIN "gfx/sprites/items/017.w16.2bpp"
INCBIN "gfx/sprites/items/018.w16.2bpp"
INCBIN "gfx/sprites/items/019.w16.2bpp"
INCBIN "gfx/sprites/items/020.w16.2bpp"
INCBIN "gfx/sprites/items/021.w16.2bpp"
INCBIN "gfx/sprites/items/022.w16.2bpp"
INCBIN "gfx/sprites/items/023.w16.2bpp"
INCBIN "gfx/sprites/items/024.w16.2bpp"
INCBIN "gfx/sprites/items/025.w16.2bpp"
INCBIN "gfx/sprites/items/026.w16.2bpp"
INCBIN "gfx/sprites/items/027.w16.2bpp"
INCBIN "gfx/sprites/items/028.w16.2bpp"
INCBIN "gfx/sprites/items/029.w16.2bpp"
INCBIN "gfx/sprites/items/030.w16.2bpp"
INCBIN "gfx/sprites/items/031.w16.2bpp"
INCBIN "gfx/sprites/items/032.w16.2bpp"
INCBIN "gfx/sprites/items/033.w16.2bpp"
INCBIN "gfx/sprites/items/034.w16.2bpp"
INCBIN "gfx/sprites/items/035.w16.2bpp"
INCBIN "gfx/sprites/items/036.w16.2bpp"
INCBIN "gfx/sprites/items/037.w16.2bpp"
INCBIN "gfx/sprites/items/038.w16.2bpp"
INCBIN "gfx/sprites/items/039.w16.2bpp"
INCBIN "gfx/sprites/items/040.w16.2bpp"
INCBIN "gfx/sprites/items/041.w16.2bpp"
INCBIN "gfx/sprites/items/042.w16.2bpp"
INCBIN "gfx/sprites/items/043.w16.2bpp"
INCBIN "gfx/sprites/items/044.w16.2bpp"
INCBIN "gfx/sprites/items/045.w16.2bpp"
INCBIN "gfx/sprites/items/046.w16.2bpp"
INCBIN "gfx/sprites/items/047.w16.2bpp"
INCBIN "gfx/sprites/items/048.w16.2bpp"
INCBIN "gfx/sprites/items/049.w16.2bpp"
INCBIN "gfx/sprites/items/050.w16.2bpp"
INCBIN "gfx/sprites/items/051.w16.2bpp"
INCBIN "gfx/sprites/items/052.w16.2bpp"
INCBIN "gfx/sprites/items/053.w16.2bpp"
INCBIN "gfx/sprites/items/054.w16.2bpp"
INCBIN "gfx/sprites/items/055.w16.2bpp"
INCBIN "gfx/sprites/items/056.w16.2bpp"
INCBIN "gfx/sprites/items/057.w16.2bpp"
INCBIN "gfx/sprites/items/058.w16.2bpp"
INCBIN "gfx/sprites/items/059.w16.2bpp"
INCBIN "gfx/sprites/items/060.w16.2bpp"
INCBIN "gfx/sprites/items/061.w16.2bpp"
INCBIN "gfx/sprites/items/062.w16.2bpp"
INCBIN "gfx/sprites/items/063.w16.2bpp"
INCBIN "gfx/sprites/items/064.w16.2bpp"
INCBIN "gfx/sprites/items/065.w16.2bpp"
INCBIN "gfx/sprites/items/066.w16.2bpp"

SECTION "bank 32", ROMX, BANK [$32]
Func_c8000::
	ld a, [wc98e]
	or a
	ret nz
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 20], a
	call Func_c81bf
	ld a, [wCurStandingTile]
	cp $4
	jr z, .asm_c8018
	cp $9
	jr nz, .asm_c806b
.asm_c8018
	ld d, a
	ld a, [wPlayerIsRunning]
	or a
	jp z, Func_c81bd
	ld a, [wTakingAStep]
	or a
	jp z, Func_c81bd
	ld a, [wPlayerXTile]
	ld b, a
	ld a, [wPlayerYTile]
	ld c, a
	ld a, d
	cp $9
	jr nz, .asm_c803e
	push hl
	call Func_28a9
	pop hl
	jr z, .asm_c803e
	call Func_264f
.asm_c803e
	push de
	call Func_c8222
	ld a, d
	ld [hl], a
	push af
	push bc
	call OverworldRandom8_
	cp $20
	jr nc, .asm_c8055
	callba Func_320e1
.asm_c8055
	pop bc
	pop af
	call Func_252a
	callba Func_31a31
	ld a, SFX_0B
	ld [H_SFX_ID], a
	pop de
	jp Func_c81bd

.asm_c806b
	cp $5
	jr nz, .asm_c8077
	ld a, $fe
	ld [wPlayerObjectStruct_Duration + 20], a
	jp Func_c81bd

.asm_c8077
	cp $6
	jr nz, .asm_c8083
	ld a, $fc
	ld [wPlayerObjectStruct_Duration + 20], a
	jp Func_c81bd

.asm_c8083
	cp $3
	jr nz, .asm_c80b1
	ld a, [wca6e]
	cp $1
	jr z, .asm_c8095
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 1, a
	jr z, .asm_c80a9
.asm_c8095
	ld a, [wSubroutine]
	cp $4
	jr nz, .asm_c80a9
	callba Func_31d12
	ld a, SFX_0C
	ld [H_SFX_ID], a
.asm_c80a9
	ld a, $2
	ld [wPlayerObjectStruct_Duration + 20], a
	jp Func_c81bd

.asm_c80b1
	cp $a
	jr z, .asm_c80f0
	cp $7
	jr nz, .asm_c811f
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $d
	jr z, .asm_c811f
	ld a, [wCurTilesetIdx]
	cp $8
	jr z, .asm_c80f0
	cp $10
	jr z, .asm_c80f0
	ld a, [wPlayerXTile]
	ld b, a
	ld [wc9df], a
	ld a, [wPlayerYTile]
	ld c, a
	ld [wc9e0], a
	ld a, $30
	call Func_252a
	ld a, $d
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $c
	ld [wPlayerObjectStruct_Duration + 12], a
	ld a, SFX_5E
	ld [H_SFX_ID], a
	jp Func_c81bd

.asm_c80f0
	ld a, [wPlayerXTile]
	ld [wc9df], a
	ld a, [wPlayerYTile]
	ld [wc9e0], a
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wPlayerObjectStruct_Duration + 2], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wPlayerObjectStruct_Duration + 6], a
	ld a, $e
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 13], a
	ld a, $b
	ld [wCurPlayerFacing], a
	ld a, SFX_11
	ld [H_SFX_ID], a
	jp Func_c81bd

.asm_c811f
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 1, a
	jr z, .asm_c8146
	ld a, [wCurStandingTile]
	cp $1
	jr z, .asm_c8139
	cp $2
	jr nz, .asm_c8146
	ld a, $1
	ld [wPhoneCallSubroutine], a
	jp Func_29ed

.asm_c8139
	ld a, $2
	ld [wPhoneCallSubroutine], a
	ld a, SFX_11
	ld [H_SFX_ID], a
	jp Func_29ed

.asm_c8146
	ld b, a
	ld a, [wCurTilesetIdx]
	cp $7
	jr nz, .asm_c816c
	ld a, b
	cp $c
	jr z, .asm_c815f
	cp $d
	jr z, .asm_c815f
	cp $f
	jr z, .asm_c815f
	cp $e
	jr nz, Func_c81bd
.asm_c815f
	ld [wPlayerObjectStruct_Duration + 12], a
	ld a, $f
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $10
	ld [wPlayerObjectStruct_Duration + 13], a
.asm_c816c
	ld a, [wCurStandingTile]
	cp $b
	jr nz, Func_c81bd
	ld a, $fd
	ld [wPlayerObjectStruct_Duration + 20], a
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 1, a
	jr nz, .asm_c81b9
	ld a, [wMapGroup]
	cp $e
	jr z, Func_c81bd
	cp $31
	jr nz, .asm_c8192
	ld bc, EVENT_20C
	call CheckEventFlag
	jr nz, Func_c81bd
.asm_c8192
	ld a, [wc9ff]
	inc a
	ld [wc9ff], a
	cp $16
	jr c, Func_c81bd
	push de
	ld a, [wPlayerXTile]
	ld b, a
	ld a, [wPlayerYTile]
	ld c, a
	ld a, $9d
	ld [hl], a
	push bc
	call Func_252a
	pop de
	call Func_c830a
	pop de
	ld a, SFX_5F
	ld [H_SFX_ID], a
	jr Func_c81bd

.asm_c81b9
	xor a
	ld [wc9ff], a
Func_c81bd: ; c81bd (32:41bd)
	ld a, [de]
	ret

Func_c81bf: ; c81bf (32:41bf)
	ld a, [wPlayerObjectStruct_XCoord]
	add $ff
	swap a
	and $f
	ld [wPlayerXTile], a
	ld a, [wPlayerObjectStruct_YCoord]
	add $fa
	swap a
	and $f
	ld [wPlayerYTile], a
	ld hl, Data_2516
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 0, 0
	add hl, de
	ld a, [wPlayerXTile]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wCurTilesetCollisionPointer + 1]
	ld d, a
	ld a, [wCurTilesetCollisionPointer]
	ld e, a
	ld a, [hl]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Func_2c05
	ld c, a
	ld a, [wCurStandingTile]
	ld b, a
	ld a, c
	ld [wCurStandingTile], a
	cp b
	jr z, .asm_c8219
	ld a, [wPlayerObjectStruct_Duration + 17]
	or $2
	ld [wPlayerObjectStruct_Duration + 17], a
	jr .asm_c8221

.asm_c8219
	ld a, [wPlayerObjectStruct_Duration + 17]
	and $fd
	ld [wPlayerObjectStruct_Duration + 17], a
.asm_c8221
	ret

Func_c8222: ; c8222 (32:4222)
	ld a, [wCurTilesetIdx]
	push hl
	ld hl, Data_c8232
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld d, [hl]
	pop hl
	ret

Data_c8232:
	db $11
	db $11
	db $11
	db $07
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $11
	db $07

Func_c8243: ; c8243 (32:4243)
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	ld a, l
	ld [wBGMapAnchor], a
	ld a, h
	cp $98
	jr nc, .asm_c8259
	add $4
	jr .asm_c825f

.asm_c8259
	cp $9c
	jr c, .asm_c825f
	sub $4
.asm_c825f
	and $f
	or $90
	ld h, a
	ld [wBGMapAnchor + 1], a
	ret

Func_c8268: ; c8268 (32:4268)
	ld a, [wBGMapAnchor]
	and $1f
	add c
	cp $20
	jr c, .asm_c8286
	bit 7, a
	jr z, .asm_c827e
	ld a, [wBGMapAnchor]
	add c
	add $20
	jr .asm_c828a

.asm_c827e
	ld a, [wBGMapAnchor]
	add c
	sub $20
	jr .asm_c828a

.asm_c8286
	ld a, [wBGMapAnchor]
	add c
.asm_c828a
	ld [wBGMapAnchor], a
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ret

Func_c8293: ; c8293 (32:4293)
	push hl
	ld hl, Data_2516
	ld a, e
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 0, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
Func_c82a9: ; c82a9 (32:42a9)
	ld c, $a
	ld a, l
	and $1f
	ld [wc981], a
.asm_c82b1
	push bc
	push hl
	ld a, [de]
	inc de
	push de
	call LoadMetatile
	pop de
	pop hl
	pop bc
	ld a, [wc981]
	inc a
	inc a
	cp $20
	jr c, .asm_c82cf
	ld a, l
	and $e0
	ld l, a
	xor a
	ld [wc981], a
	jr .asm_c82d4

.asm_c82cf
	ld [wc981], a
	inc hl
	inc hl
.asm_c82d4
	ld a, h
	cp $9c
	jr c, .asm_c82db
	ld h, $98
.asm_c82db
	dec c
	jr nz, .asm_c82b1
	ret

Func_c82df: ; c82df (32:42df)
	push hl
	ld d, $0
	hlcoord 0, 0
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld c, $8
.asm_c82eb
	push bc
	push hl
	ld a, [de]
	push de
	call LoadMetatile
	pop de
	ld hl, $a
	add hl, de
	ld d, h
	ld e, l
	pop hl
	ld bc, $40
	add hl, bc
	ld a, h
	cp $9c
	jr c, .asm_c8305
	ld h, $98
.asm_c8305
	pop bc
	dec c
	jr nz, .asm_c82eb
	ret

Func_c830a: ; c830a (32:430a)
	ld bc, EVENT_C02
	call ToggleEventFlag
	ld a, [wMapGroup]
	cp $16
	jr z, .asm_c8321
	cp $e
	jr z, .asm_c832e
	cp $31
	jp z, Func_c83b1
	ret

.asm_c8321
	ld a, [wMapNumber3]
	cp $7c
	ret nz
	ld bc, EVENT_C04
	call SetEventFlag
	ret

.asm_c832e
	ld a, [wMapNumber]
	cp $21
	jr nz, .asm_c836c
	ld a, d
	cp $1
	jr nz, .asm_c8345
	ld a, e
	cp $6
	jr nz, .asm_c8345
	ld bc, EVENT_C05
	call SetEventFlag
.asm_c8345
	ld a, d
	cp $8
	jr nz, .asm_c8355
	ld a, e
	cp $6
	jr nz, .asm_c8355
	ld bc, EVENT_C06
	call SetEventFlag
.asm_c8355
	ld bc, EVENT_C05
	call CheckEventFlag
	jr z, .asm_c836b
	ld bc, EVENT_C06
	call CheckEventFlag
	jr z, .asm_c836b
	ld bc, EVENT_07C
	call SetEventFlag
.asm_c836b
	ret

.asm_c836c
	cp $13
	jr nz, .asm_c83a6
	ld a, d
	cp $1
	jr nz, .asm_c8380
	ld a, e
	cp $6
	jr nz, .asm_c8380
	ld bc, EVENT_C07
	call SetEventFlag
.asm_c8380
	ld a, d
	cp $8
	jr nz, .asm_c8390
	ld a, e
	cp $6
	jr nz, .asm_c8390
	ld bc, EVENT_C08
	call SetEventFlag
.asm_c8390
	ld bc, EVENT_C07
	call CheckEventFlag
	jr z, .asm_c836b
	ld bc, EVENT_C08
	call CheckEventFlag
	jr z, .asm_c836b
	ld bc, EVENT_07D
	jp SetEventFlag

.asm_c83a6
	cp $32
	jr nz, .asm_c83b0
	ld bc, EVENT_07E
	jp SetEventFlag

.asm_c83b0
	ret

Func_c83b1: ; c83b1 (32:43b1)
	ld a, $17
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $60
	ld [wPlayerObjectStruct_Duration + 11], a
	ret

Func_c83bc: ; c83bc (32:43bc)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c83d5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c83d5:
	dw Func_c83dd
	dw Func_c8417
	dw Func_c8455
	dw Func_c858d

Func_c83dd:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $17
	ld [hl], a
	ld bc, EVENT_C02
	call ResetEventFlag
	call Func_c864d
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
Func_c8417:
	call Func_c8602
	call Func_c8642
	ld bc, EVENT_C02
	call CheckEventFlag
	ret z
	ld bc, EVENT_C04
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_c8437
	call CheckEventFlag
	jr z, .asm_c843d
	ret

.asm_c8437
	call CheckEventFlag
	jr nz, .asm_c843d
	ret

.asm_c843d
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, SFX_60
	ld [H_SFX_ID], a
	ret

Func_c8455:
	call Func_c8602
	call Func_c8642
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_c846c
	cp $1
	jr z, .asm_c848c
	jr .asm_c84e7

.asm_c846c
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $18
	jr c, .asm_c848b
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_c848b
	ret

.asm_c848c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, hFFFD
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $18
	jr c, .asm_c84e6
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $20
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, SFX_61
	ld [H_SFX_ID], a
.asm_c84e6
	ret

.asm_c84e7
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cpl
	inc a
	ld d, a
	sla d
	sla d
	call Sine8_
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_c850b
	dec b
.asm_c850b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld e, a
	ld d, $0
	call Multiply_DE_by_BC
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, b
	ld [hl], a
	ld b, d
	ld c, e
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	callba Func_308aa
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ret nz
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	xor $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ret

Func_c858d:
	call Func_c8602
	call Func_c8642
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_c85a0
	jr .asm_c85bf

.asm_c85a0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $b4
	ret c
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ret

.asm_c85bf
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $4
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $f0
	jr nz, .asm_c8601
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld bc, EVENT_C02
	call ResetEventFlag
	ret

.asm_c8601
	ret

Func_c8602: ; c8602 (32:4602)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wPlayerObjectStruct_YCoord]
	cp $48
	jr c, .asm_c861c
	ld a, [wIdleHUDVisible]
	or a
	jr z, .asm_c861c
	ld a, [hl]
	and $fe
	ld [hl], a
	ret

.asm_c861c
	ld a, [hl]
	or $1
	ld [hl], a
	ret

Func_c8621: ; c8621 (32:4621)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c863a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c863a:
	dw Func_c866c
	dw Func_c86cd
	dw Func_c874e
	dw Func_c87e8

Func_c8642: ; c8642 (32:4642)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, asm_c866b
Func_c864d: ; c864d (32:464d)
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld de, GFX_e0320
	cp $0
	jr asm_c865e

Func_c865b:
	ld de, GFX_e0320
asm_c865e
	push hl
	ld a, BANK(GFX_e0320)
	ld hl, VTilesOB tile $7c
	ld bc, $40
	call FarCopy2bpp_2
	pop hl
asm_c866b
	ret

Func_c866c:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $1b
	jr nz, .asm_c868b
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ret

.asm_c868b
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $17
	ld [hl], a
	ld bc, EVENT_C02
	call ResetEventFlag
	ld bc, EVENT_C03
	call ResetEventFlag
	call Func_c864d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
Func_c86cd:
	call Func_c8602
	ld bc, EVENT_C02
	call CheckEventFlag
	jr z, .asm_c86e7
	ld bc, EVENT_C02
	call ResetEventFlag
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $2
	ld [hl], a
.asm_c86e7
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_c874a
	dec a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$40
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr nz, .asm_c8710
	ld bc, EVENT_C03
	call SetEventFlag
.asm_c8710
	cp $11
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $40
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld bc, EVENT_C03
	call ResetEventFlag
.asm_c874a
	call Func_c8642
	ret

Func_c874e:
	call Func_c8602
	ld bc, $8
	call Func_2ae7
	call ApplyYStepVector_
	callba Func_308aa
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $10
	jr c, .asm_c87d0
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	cpl
	ld c, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	cpl
	ld b, a
	inc bc
	sra b
	rr c
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1
	jr z, .asm_c87d4
	cp $3
	jr c, .asm_c87d0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
.asm_c87d0
	call Func_c8642
	ret

.asm_c87d4
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, h
	ld c, l
	callba Func_31565
	ld a, SFX_61
	ld [H_SFX_ID], a
	ret

Func_c87e8:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, EVENT_C03
	call CheckEventFlag
	jr z, .asm_c87fd
	ld a, [hl]
	or $4
	ld [hl], a
	ret

.asm_c87fd
	ld a, [hl]
	and $fb
	ld [hl], a
	ret

Func_c8802: ; c8802 (32:4802)
	ld a, $2
	ld [wPhoneCallSubroutine], a
	ld e, $a
	ld a, [wc90f]
	ld d, a
	ld [wMapNumber], a
	ld hl, Data_c883e
.asm_c8813
	ld a, [hli]
	cp d
	jr z, .asm_c881c
	inc hl
	inc hl
	dec e
	jr nz, .asm_c8813
.asm_c881c
	ld a, [hli]
	swap a
	and $f0
	add $8
	ld [wc901], a
	ld a, [hl]
	inc a
	and $f
	swap a
	ld [wc902], a
	ld a, $e
	ld [wPrevROMBank], a
	ld a, $7
	ld [wSubroutine], a
	ld a, $4
	jp StartFade_

Data_c883e:
	db $2a, $04, $01
	db $1a, $05, $06
	db $21, $04, $01
	db $11, $04, $06
	db $13, $05, $06
	db $23, $04, $01
	db $36, $01, $04
	db $2d, $04, $06
	db $35, $01, $04
	db $2c, $04, $06
	db $2c, $04, $06

Func_c885f: ; c885f (32:485f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c8878
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c8878:
	dw Func_c887e
	dw Func_c8898
	dw Func_c88ec

Func_c887e:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $6
	ld bc, EVENT_C02
	call ResetEventFlag
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_c8898:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld bc, EVENT_C02
	call CheckEventFlag
	jr z, .asm_c88df
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [wMapNumber3]
	cp $7b
	jr z, .asm_c88e0
	cp $7d
	jr z, .asm_c88e3
	cp $c0
	jr z, .asm_c88e6
	jr .asm_c88e9

.asm_c88df
	ret

.asm_c88e0
	ld [hl], $0
	ret

.asm_c88e3
	ld [hl], $1
	ret

.asm_c88e6
	ld [hl], $2
	ret

.asm_c88e9
	ld [hl], $3
	ret

Func_c88ec:
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $e
	ret z
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	and $1f
	jr nz, .finish
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld e, a
	ld c, a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, a
	add a
	add b
	ld hl, Pointers_c89bf
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push de
	push bc
	push hl
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	add hl, de
	ld a, c
	cp b
	jr nc, .skip
	push af
	call Func_c897f
	pop af
.skip
	pop hl
	pop bc
	pop de
	sub $4
	jr c, .skip2
	cp b
	jr nc, .skip2
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	add hl, de
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_c897f
.skip2
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.finish
	ret

Func_c897f: ; c897f (32:497f)
	ld a, SFX_62
	ld [H_SFX_ID], a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, d
	or a
	jr z, .skip3
	call Func_c89a5
	push hl
	call Func_252a
	pop hl
.skip3
	ld a, [hli]
	ld d, a
	or a
	ret z
	ld a, [hli]
	ld b, a
	ld c, [hl]
	ld a, d
	call Func_c89a5
	call Func_252a
	ret

Func_c89a5: ; c89a5 (32:49a5)
	push hl
	push de
	push af
	push bc
	ld e, $a
	call Multiply_C_by_E
	hlcoord 0, 0
	add hl, de
	pop bc
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	ld [hl], a
	pop de
	pop hl
	ret

Pointers_c89bf:
	dbw $07, Data_c89cb
	dbw $0b, Data_c8a3b
	dbw $16, Data_c8aeb
	dbw $15, Data_c8c4b

Data_c89cb:
	db $35, $01, $03, $24, $01, $04,  $33, $01, $03, $33, $01, $04,  $00, $00, $00, $00
	db $35, $02, $03, $24, $02, $04,  $33, $02, $03, $33, $02, $04,  $00, $00, $00, $00
	db $35, $03, $03, $00, $00, $00,  $33, $03, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $04, $03, $00, $00, $00,  $24, $04, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $05, $03, $00, $00, $00,  $33, $05, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $06, $03, $24, $06, $04,  $33, $06, $03, $33, $06, $04,  $00, $00, $00, $00
	db $35, $07, $03, $24, $07, $04,  $33, $07, $03, $33, $07, $04,  $00, $00, $00, $00

Data_c8a3b:
	db $35, $07, $02, $24, $07, $03,  $24, $07, $02, $00, $00, $00,  $00, $00, $00, $00
	db $35, $07, $03, $24, $07, $04,  $33, $07, $03, $33, $07, $04,  $00, $00, $00, $00
	db $35, $06, $03, $24, $06, $04,  $33, $06, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $06, $04, $24, $06, $05,  $33, $06, $04, $33, $06, $05,  $00, $00, $00, $00
	db $35, $05, $04, $24, $05, $05,  $33, $05, $04, $33, $05, $05,  $00, $00, $00, $00
	db $35, $04, $04, $24, $04, $05,  $24, $04, $04, $33, $04, $05,  $00, $00, $00, $00
	db $35, $04, $03, $00, $00, $00,  $33, $04, $03, $33, $04, $04,  $00, $00, $00, $00
	db $35, $03, $03, $24, $03, $04,  $33, $03, $03, $33, $03, $04,  $00, $00, $00, $00
	db $35, $02, $03, $24, $02, $04,  $33, $02, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $04, $24, $02, $05,  $33, $02, $04, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $05, $00, $00, $00,  $33, $02, $05, $00, $00, $00,  $00, $00, $00, $00

Data_c8aeb:
	db $35, $03, $05, $24, $03, $06,  $24, $03, $05, $33, $03, $06,  $00, $00, $00, $00
	db $35, $04, $05, $24, $04, $06,  $24, $04, $05, $33, $04, $06,  $00, $00, $00, $00
	db $35, $05, $05, $24, $05, $06,  $24, $05, $05, $33, $05, $06,  $00, $00, $00, $00
	db $35, $06, $05, $24, $06, $06,  $24, $06, $05, $00, $06, $05,  $00, $00, $00, $00
	db $35, $07, $05, $24, $07, $06,  $24, $07, $05, $00, $05, $05,  $00, $00, $00, $00
	db $35, $07, $06, $00, $00, $00,  $33, $07, $06, $00, $04, $05,  $00, $00, $00, $00
	db $35, $06, $06, $00, $00, $00,  $33, $06, $06, $00, $04, $04,  $00, $00, $00, $00
	db $35, $05, $06, $00, $00, $00,  $33, $05, $06, $00, $03, $04,  $00, $00, $00, $00
	db $35, $04, $06, $00, $00, $00,  $33, $04, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $03, $06, $00, $00, $00,  $33, $03, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $06, $00, $00, $00,  $33, $02, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $01, $06, $00, $00, $00,  $24, $01, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $01, $05, $00, $00, $00,  $24, $01, $05, $33, $01, $06,  $00, $00, $00, $00
	db $35, $01, $04, $00, $00, $00,  $24, $01, $04, $33, $01, $05,  $00, $00, $00, $00
	db $35, $01, $03, $00, $00, $00,  $33, $01, $03, $33, $01, $04,  $00, $00, $00, $00
	db $35, $02, $03, $24, $02, $04,  $33, $02, $03, $33, $02, $04,  $00, $00, $00, $00
	db $35, $03, $03, $00, $00, $00,  $33, $03, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $04, $03, $00, $00, $00,  $33, $04, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $05, $03, $00, $00, $00,  $33, $05, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $06, $03, $00, $00, $00,  $33, $06, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $07, $03, $00, $00, $00,  $24, $07, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $07, $02, $00, $00, $00,  $24, $07, $02, $33, $07, $03,  $00, $00, $00, $00

Data_c8c4b:
	db $35, $04, $03, $00, $00, $00,  $33, $04, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $03, $03, $00, $00, $00,  $33, $03, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $03, $24, $02, $04,  $33, $02, $03, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $04, $24, $02, $05,  $33, $02, $04, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $05, $24, $02, $06,  $33, $02, $05, $33, $02, $06,  $00, $00, $00, $00
	db $35, $03, $05, $24, $03, $06,  $24, $03, $05, $33, $03, $06,  $00, $00, $00, $00
	db $35, $04, $05, $24, $04, $06,  $24, $04, $05, $33, $04, $06,  $00, $00, $00, $00
	db $35, $05, $05, $24, $05, $06,  $24, $05, $05, $33, $05, $06,  $00, $00, $00, $00
	db $35, $06, $05, $24, $06, $06,  $24, $06, $05, $00, $06, $05,  $00, $00, $00, $00
	db $35, $07, $05, $24, $07, $06,  $24, $07, $05, $00, $05, $05,  $00, $00, $00, $00
	db $35, $07, $06, $00, $00, $00,  $33, $07, $06, $00, $04, $05,  $00, $00, $00, $00
	db $35, $06, $06, $00, $00, $00,  $33, $06, $06, $00, $04, $04,  $00, $00, $00, $00
	db $35, $05, $06, $00, $00, $00,  $33, $05, $06, $00, $03, $04,  $00, $00, $00, $00
	db $35, $04, $06, $00, $00, $00,  $33, $04, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $03, $06, $00, $00, $00,  $33, $03, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $02, $06, $00, $00, $00,  $33, $02, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $01, $06, $00, $00, $00,  $24, $01, $06, $00, $00, $00,  $00, $00, $00, $00
	db $35, $01, $05, $00, $00, $00,  $24, $01, $05, $33, $01, $06,  $00, $00, $00, $00
	db $35, $01, $04, $00, $00, $00,  $24, $01, $04, $33, $01, $05,  $00, $00, $00, $00
	db $35, $01, $03, $00, $00, $00,  $24, $01, $03, $33, $01, $04,  $00, $00, $00, $00
	db $35, $01, $02, $00, $00, $00,  $24, $01, $02, $33, $01, $03,  $00, $00, $00, $00

Func_c8d9b: ; c8d9b (32:4d9b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c8db4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c8db4:
	dw Func_c8dba
	dw Func_c8def
	dw Func_c8e7d

Func_c8dba:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $0
	ld [wcadc], a
	ld [wcadd], a
	ld [wcade], a
	ld [wc946], a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	call PrintMoneyInShop_
	ld a, $0
	ld [wc9d8], a
Func_c8def:
	ld bc, EVENT_1D7
	ld a, [wPlayerObjectStruct_YCoord]
	cp $4e
	push af
	call c, ResetEventFlag
	pop af
	call nc, SetEventFlag
	call Func_c8e9e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_c8e2a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	call PrintMoneyInShop_
	call Func_c8ebb
	ld a, $0
	ld [wc9d8], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
.asm_c8e2a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	ld bc, EVENT_C3C
	call CheckEventFlag
	ret z
	ld a, [wMapNumber]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	ld bc, EVENT_C3B
	call CheckEventFlag
	jr nz, .asm_c8e68
	callba Func_2df11
.asm_c8e68
	ld a, $0
	ld [wcadc], a
	ld [wcadd], a
	ld [wcade], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ret

Func_c8e7d:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	ld bc, EVENT_C3C
	call CheckEventFlag
	ret nz
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	call Func_c8e9e
	ret

Func_c8e9e: ; c8e9e (32:4e9e)
	ld a, [wc9d8]
	cp $2
	jr z, .asm_c8eb0
	ld a, [wPlayerObjectStruct_YCoord]
	cp $48
	ret c
	ld a, [wc9d8]
	or a
	ret z
.asm_c8eb0
	ld a, $0
	ld [wc9d8], a
	call PrintMoneyInShop_
	jp Func_c8ebb

Func_c8ebb: ; c8ebb (32:4ebb)
	hlbgcoord 12, 0
	Aovercoord 6, 0
	call LoadMetatile
	hlbgcoord 14, 0
	Aovercoord 7, 0
	call LoadMetatile
	hlbgcoord 16, 0
	Aovercoord 8, 0
	call LoadMetatile
	hlbgcoord 18, 0
	Aovercoord 9, 0
	call LoadMetatile
	hlbgcoord 12, 2
	Aovercoord 6, 1
	call LoadMetatile
	hlbgcoord 14, 2
	Aovercoord 7, 1
	call LoadMetatile
	hlbgcoord 16, 2
	Aovercoord 8, 1
	call LoadMetatile
	hlbgcoord 18, 2
	Aovercoord 9, 1
	call LoadMetatile
	ret

Func_c8f04: ; c8f04 (32:4f04)
	ld a, $2
	ld [wc9d8], a
	ld b, $a
	hlbgcoord 0, 0
	decoord 0, 0
	call Func_c8f1c
	ld b, $a
	hlbgcoord 0, 2
	decoord 0, 1
Func_c8f1c: ; c8f1c (32:4f1c)
	push de
	push hl
	push bc
	ld a, [de]
	call LoadMetatile
	pop bc
	pop hl
	pop de
	inc de
	inc hl
	inc hl
	dec b
	jr nz, Func_c8f1c
	ret

Func_c8f2d: ; c8f2d (32:4f2d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c8f46
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c8f46:
	dw Func_c8f4c
	dw Func_c8fca
	dw Func_c903c

Func_c8f4c:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $35
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fe
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $60
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, BANK(GFX_e318c)
	ld hl, VTilesOB tile $7b
	ld de, GFX_e318c
	ld bc, $10
	call FarCopy2bpp_2
	ld a, $6
	ld bc, $6
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_6E
	ld [H_SFX_ID], a
	ret

Func_c8fca:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $2
	call Func_2ae7
	call Func_2acd
	callba Func_308b0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_c903b
	ld a, $50
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hld]
	cpl
	ld d, a
	inc de
	sra d
	rr e
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hli]
	ld e, a
	ld a, [hld]
	ld d, a
	sra d
	rr e
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	jr nc, .asm_c902e
	ld a, SFX_6F
	ld [H_SFX_ID], a
.asm_c902e
	ld a, d
	or e
	jr nz, .asm_c903b
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_c903b
	ret

Func_c903c:
	ret

Func_c903d: ; c903d (32:503d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c9056
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c9056:
	dw Func_c905c
	dw Func_c90ad
	dw Func_c91a9

Func_c905c:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom8_
	and $f
	cp $3
	jr z, .asm_c90a3
	cp $b
	jr nc, .asm_c9098
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $35
	ld [hl], a
	jr .asm_c90ac

.asm_c9098
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $46
	ld [hl], a
	jr .asm_c90ac

.asm_c90a3
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $45
	ld [hl], a
.asm_c90ac
	ret

Func_c90ad:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp b
	jr nc, .asm_c90e3
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hld]
	cpl
	ld d, a
	inc de
	sra d
	rr e
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_c90e3
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $3
	jr nc, .asm_c9102
	push af
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	pop af
	cp $1
	jr nc, .asm_c9120
	ret

.asm_c9102
	inc a
	cp $fa
	jr c, .asm_c910e
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_c910e
	ld [hl], a
	cp $d2
	jr c, .asm_c9120
	ld b, $3
	and $1
	jr z, .asm_c911b
	ld b, $2
.asm_c911b
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
.asm_c9120
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_c9130
	cpl
	inc a
.asm_c9130
	cp $10
	ret nc
	ld a, [wPlayerObjectStruct_YCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add $8
	sub b
	jr nc, .asm_c9145
	cpl
	inc a
.asm_c9145
	cp $10
	ret nc
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $b0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	callba Func_3215d
	ld bc, $5
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	cp $46
	jr z, .asm_c9199
	cp $35
	jr z, .asm_c9182
	ld bc, $50
.asm_c9182
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	callba AddOrSubtractMoney
	ld a, SFX_12
	ld [H_SFX_ID], a
	ret

.asm_c9199
	ld b, $14
	callba Func_a54d8
	ld a, SFX_40
	ld [H_SFX_ID], a
	ret

Func_c91a9:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $12
	jr c, .asm_c91c1
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_c91c1
	cp $a
	jr c, .asm_c91d2
	ld b, $3
	and $1
	jr z, .asm_c91cd
	ld b, $2
.asm_c91cd
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
.asm_c91d2
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $6
	call Func_2ae7
	jp Func_2acd

Func_c91df: ; c91df (32:51df)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c91f8
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c91f8:
	dw Func_c91fe
	dw Func_c9238
	dw Func_c91a9

Func_c91fe:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $45
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $ff
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ret

Func_c9238:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_c9278
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hli]
	cpl
	ld e, a
	ld a, [hld]
	cpl
	ld d, a
	inc de
	sra d
	rr e
	ld a, e
	ld [hli], a
	ld [hl], d
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $ff
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_c9278
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $3
	jr nc, .asm_c92fc
	push af
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $2
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ada
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_c92b5
	dec b
.asm_c92b5
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	add $3
.asm_c92be
	sra b
	rr c
	dec a
	jr nz, .asm_c92be
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_c92df
	dec b
.asm_c92df
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	add $3
.asm_c92e8
	sra b
	rr c
	dec a
	jr nz, .asm_c92e8
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	pop af
	cp $1
	jr nc, .asm_c931a
	ret

.asm_c92fc
	inc a
	cp $fa
	jr c, .asm_c9308
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_c9308
	ld [hl], a
	cp $d2
	jr c, .asm_c931a
	ld b, $3
	and $1
	jr z, .asm_c9315
	ld b, $2
.asm_c9315
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
.asm_c931a
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_c932a
	cpl
	inc a
.asm_c932a
	cp $8
	ret nc
	ld a, [wPlayerObjectStruct_YCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_c933d
	cpl
	inc a
.asm_c933d
	cp $8
	ret nc
	ld a, SFX_12
	ld [H_SFX_ID], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $b0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	callba Func_3215d
	ret

Func_c9374: ; c9374 (32:5374)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_c938d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_c938d:
	dw Func_c9391
	dw Func_c93fa

Func_c9391:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $80
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
Func_c93fa:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	inc a
	cp $fe
	jr c, .asm_c9430
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $e6
	jr c, .asm_c9460
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_c9430
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld a, d
	sra a
	sra a
	sra a
	add $20
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
.asm_c9460
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	srl a
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	sla e
	rl d
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	srl a
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	sla e
	rl d
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	cpl
	add $5
	and $3f
	ld de, Data_c94f8
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	add $80
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Data_c94f8:
	db $0, $0, $0, $0, $0
	db $1, $1, $1, $1, $1
	db $2, $2, $2, $2, $3
	db $3, $3, $3, $3, $4
	db $4, $4, $4, $5, $5
	db $5, $5, $5, $6, $6
	db $6, $6, $7, $7, $7
	db $7, $7, $8, $8, $8
	db $8, $8, $9, $9, $9
	db $9, $a, $a, $a, $a
	db $a, $b, $b, $b, $b
	db $c, $c, $c, $c, $c
	db $d, $d, $d, $d

Func_c9538: ; c9538 (32:5538)
	ld a, [wPhoneCallSubroutine]
	or a
	jp nz, Func_c96b3
	ld a, [wOverworldRandomCounter]
	ld c, a
	ld a, [wOverworldRandomSeed]
	ld b, a
	ld a, [wc92a]
	ld d, a
	ld a, [wc92b]
	ld e, a
	push de
	push bc
	xor a
	ld hl, wEventFlags
	ld b, $0
	call Func_2f76
	call Func_2f76
	ld hl, wPlayerName
	ld de, wcd00
	ld b, $9
	call CopyData_Under256Bytes
	xor a
	ld hl, wPhoneCallSubroutine
	ld b, $80
	call Func_2f76
	ld hl, wcd00
	ld de, wPlayerName
	ld b, $9
	call CopyData_Under256Bytes
	ld a, [wDShotLevel]
	push af
	xor a
	ld hl, wcd00
	ld b, $0
	call Func_2f76
	pop af
	ld [wDShotLevel], a
	pop bc
	pop de
	ld a, b
	add d
	ld [wOverworldRandomCounter], a
	ld a, c
	add e
	ld a, a
	ld [wOverworldRandomSeed], a
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ld a, $40
	ld [wc901], a
	ld a, $40
	ld [wc928], a
	ld a, $70
	ld [wc902], a
	ld a, $70
	ld [wc929], a
	ld a, $2b
	ld [wMapGroup], a
	ld a, $2b
	ld [wc926], a
	ld a, $9
	ld [wMapNumber], a
	ld a, $9
	ld [wc927], a
	ld a, $0
	ld [wMapMusic], a
	ld a, [wOverworldRandomCounter]
	ld c, a
	ld a, [wVBlankCounter]
	add c
	ld [wOverworldRandomCounter], a
	ld a, [wOverworldRandomSeed]
	ld c, a
	ld a, [wVBlankCounter]
	add c
	ld [wOverworldRandomSeed], a
	call OverworldRandom8_
	ld [wc920], a
	call OverworldRandom8_
	ld [wc921], a
	enable_sram sAddressBook
	ld a, $0
	ld [wAddressBookIndexOfPartnerDenjuu], a
	ld a, $5
	ld [sAddressBook + 1], a
	ld a, $32
	ld [sAddressBook + 2], a
	ld a, $0
	ld [sAddressBook + 8], a
	ld a, [wMapNumber]
	push af
	call OverworldRandom8_
	ld [wMapNumber], a
	ld [sAddressBook + 9], a
	enable_sram sAddressBook
IF DEF(POWER)
	ld a, CRYPTO
	ld [sAddressBook], a
	ld a, $8
	ld [sAddressBook + 3], a
	ld a, CRYPTO
	ld [wc912], a
	ld hl, sAddressBook + 6
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	lb de, 4, 0
	ld c, $0
ELSE
	ld a, FUNGUS
	ld [sAddressBook], a
	ld a, $a
	ld [sAddressBook + 3], a
	ld a, FUNGUS
	ld [wc912], a
	ld hl, sAddressBook + 6
	ld a, $1
	ld [hli], a
	ld a, $4
	ld [hl], a
	lb de, 4, 1
	ld c, $1
ENDC
	push de
	callba CompressStandardPhoneNumber
	ld hl, sAddressBook + 10
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [wWhichPhoneNumberSymbolCode]
	ld [hl], a
	pop de
	ld c, $0
	callba Func_a40ef
	disable_sram
	pop af
	ld [wMapNumber], a
	callba GetPartnerDenjuuMaxHP
	ld a, c
	ld [wPartnerDenjuuHPRemaining], a
	ld bc, EVENT_C00
	call SetEventFlag
	ld bc, EVENT_1DD
	call SetEventFlag
	ld a, $1
	ld [wShowClockInOverworld], a
	ld hl, wMoney
	ld a, 500 % $100
	ld [hli], a
	ld a, 500 / $100
	ld [hl], a
	ld a, $0
	ld [wPhoneSilentMode], a
	ld a, $1
	ld [wBattleAnimations], a
	ld a, $e
	ld [wPrevROMBank], a
	ld a, $4
	ld [wOverworldPhoneCallCooldown], a
	call OverworldRandom8_
	ld e, a
	ld c, 199
	call Multiply_C_by_E
	ld a, d
	ld [wc943], a
Func_c96b3: ; c96b3 (32:56b3)
	ld a, [wc912]
	ld [wcdb9], a
	ret

Func_c96ba: ; c96ba (32:56ba)
	ld a, BANK(Func_c96ba)
	ld [wPrevROMBank], a
	ld a, [wc901]
	ld [wPlayerObjectStruct_XCoord], a
	ld hl, Func_39be6
	call Func_c97cd
	ld a, [wc902]
	ld [wPlayerObjectStruct_YCoord], a
	ld hl, Func_39bd2
	call Func_c97cd
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 19], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 20], a
	ld a, $3
	ld [wPlayerObjectStruct_PriorityFlags], a
	ld a, $10
	ld [wPlayerObjectStruct_TemplateBank], a
	ld a, $3
	ld [wPlayerObjectStruct_Palette], a
	ld a, $0
	ld [wc9c1], a
	ld a, $0
	ld [wCurStandingTile], a
	ld a, $0
	ld [wTakingAStep], a
	ld a, $0
	ld [wca6e], a
	ld a, $0
	ld [wCurPlayerFacing], a
	ld a, $ff
	ld [wc9f5], a
	call Func_c81bf
	ld a, [wMapGroup]
	cp $6
	jr c, .asm_c972b
	ld a, [wCurTilesetIdx]
	cp $0
	jr z, .asm_c972b
	ld a, [wPlayerYTile]
	cp $5
	jr c, .asm_c972b
	ld a, $3
	ld [wCurPlayerFacing], a
.asm_c972b
	ld a, [wc947]
	or a
	jr z, .asm_c9745
	ld a, [wc94b]
	and $7f
	ld [wCurPlayerFacing], a
	ld a, [wc94b]
	and $80
	jr z, .asm_c9745
	ld a, $1
	ld [wPlayerObjectStruct_TemplateIdx], a
.asm_c9745
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wSCY], a
	ld a, $0
	ld [wc98c], a
	ld a, $0
	ld [wc98d], a
	ld a, $0
	ld [wc98e], a
	callba Func_31bb3
	ld a, $0
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 14], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 13], a
	ld a, [wPhoneCallSubroutine]
	cp $2
	jr z, .asm_c978d
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	jp Func_c97bf

.asm_c978d
	ld a, $a
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $9
	ld [wCurPlayerFacing], a
	ld hl, wPlayerObjectStruct_Duration + 4
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld a, $20
	ld [wPlayerObjectStruct_Duration + 6], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wPlayerObjectStruct_Duration + 2], a
	ld hl, Func_39c2f
	call Func_c97cd
	ld a, $1
	ld [wTakingAStep], a
	call Func_c97bf
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ret

Func_c97bf: ; c97bf (32:57bf)
	ld a, $1
	ld [wTakingAStep], a
	callba Func_30009
	ret

Func_c97cd: ; c97cd (32:57cd)
	ld a, BANK(Func_39c2f)
	jp FarCall_HL

Func_c97d2: ; c97d2 (32:57d2)
	ld a, [wc953]
	or a
	jr nz, .asm_c9814
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wc928], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wc929], a
	ld b, $80
	ld a, [wPlayerObjectStruct_TemplateIdx]
	cp $1
	jr z, .asm_c97ef
	ld b, $0
.asm_c97ef
	ld a, [wCurPlayerFacing]
	or b
	ld [wc94b], a
	ld a, [wPartnerDenjuuObjectStruct_XCoord]
	ld [wc948], a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	ld [wc949], a
	ld b, $80
	ld a, [wPartnerDenjuuObjectStruct_TemplateIdx]
	cp $3
	jr z, .asm_c980d
	ld b, $0
.asm_c980d
	ld a, [wca50]
	or b
	ld [wc94a], a
.asm_c9814
	ld a, $1
	ld [wc947], a
	ret

Func_c981a: ; c981a (32:581a)
	ld a, [wcd00]
	or a
	jr nz, .asm_c9867
	ld a, [wCurTilesetIdx]
	cp $2
	jr z, .asm_c982b
	cp $4
	jr nz, .asm_c9867
.asm_c982b
	ld a, [wPlayerYTile]
	cp $4
	jr nz, .asm_c9867
	ld a, [wPlayerXTile]
	cp $4
	jr z, .asm_c983e
	cp $5
	jr z, .asm_c9845
	ret

.asm_c983e
	ld a, $1
	ld [wScriptNumber], a
	jr .asm_c984a

.asm_c9845
	ld a, $0
	ld [wScriptNumber], a
.asm_c984a
	ld a, $0
	ld [wScriptNumber + 1], a
	ld a, $1
	ld [wcd00], a
	ld a, $0
	ld [wScriptDelay], a
	ld a, $1
	ld [wScriptBank], a
	ld hl, wScriptOffset
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_c9867
	ret

Func_c9868: ; c9868 (32:5868)
	ld a, $0
	ld [wCustomSpriteDest], a
	ld [wWhichPhoneNumberSymbolCode], a
	ld a, b
	ld [wCustomSpriteDest + 1], a
	ret

Func_c9875: ; c9875 (32:5875)
	ld hl, Pointers_ca3c6
	ld a, [wCustomSpriteDest + 1]
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCustomSpriteDest]
	cp $ff
	ret z
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	or h
	jr nz, .go
	ld a, $ff
	ld [wCustomSpriteDest], a
	ret

.go
	call .PlaceBGTiles
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	ret

.PlaceBGTiles: ; c98a9 (32:58a9)
	ld a, [wBGMapAnchor]
	and $1f
	ld [wSpriteDestIsCustom], a
	ld a, [wBGMapAnchor + 1]
	ld b, a
	ld a, [wBGMapAnchor]
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	srl b
	rr a
	and $1f
	ld [wMathBuffer3], a
.loop
	ld a, [hli]
	ld b, a
	cp $ff
	ret z
	ld a, [hli]
	ld c, a
	call .HideObjects
	call .GetBGMapAddress
	di
.wait_stat1
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat1
	ld a, $90
	ld [de], a
	ei
	check_cgb
	jr nz, .loop
	di
.wait_stat2
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat2
	ld a, $1
	ld [rVBK], a
	xor a
	ld [de], a
	ld a, a
	ld [rVBK], a
	ei
	jr .loop

.GetBGMapAddress: ; c9903 (32:5903)
	ld d, $98
	ld a, c
	cp $10
	jr nc, .window
	ld a, [wMathBuffer3]
	add c
	and $1f
	ld e, a
	xor a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	add $98
	ld d, a
	ld a, [wSpriteDestIsCustom]
	add b
	and $1f
	or e
	ld e, a
	ret

.window
	ld a, c
	sub $10
	and $1f
	ld e, a
	xor a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	sla e
	rl a
	add $9c
	ld d, a
	ld a, b
	and $1f
	or e
	ld e, a
	ret

.HideObjects
	push hl
	push bc
	inc c
	sla b
	sla b
	sla b
	sla c
	sla c
	sla c
	ld hl, wOAMAnimation01
	ld e, $18
.hide_loop
	ld a, [hli]
	or a
	jr z, .next
	inc hl
	inc hl
	ld a, [hli]
	and $f8
	cp b
	jr nz, .next2
	ld a, [hl]
	and $f8
	cp c
	jr nz, .next2
	ld a, l
	and $e0
	ld l, a
	xor a
	ld [hl], a
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec e
	jr nz, .hide_loop
	pop bc
	pop hl
	ret

.next2
	ld a, $1c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec e
	jr nz, .hide_loop
	pop bc
	pop hl
	ret

.next
	ld a, $1f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec e
	jr nz, .hide_loop
	pop bc
	pop hl
	ret

Func_c99ac: ; c99ac (32:59ac)
	ld a, $2e
	ld [wSubroutine], a
	ld hl, wcadf
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, $0
	ld [wcae1], a
	call Func_c9a73
	ld a, [wSCY]
	or a
	jr nz, .asm_c99d9
	hlbgcoord 0, 16
	ld de, wcae3
	call Func_c9a60
	hlbgcoord 0, 18
	call Func_c9a60
	jr .asm_c99ea

.asm_c99d9
	hlbgcoord 0, 0
	ld de, wcae3
	call Func_c9a60
	hlbgcoord 0, 2
	call Func_c9a60
	jr .asm_c99ea

.asm_c99ea
	enable_sram sOAMAnimationsBackup
	ld de, wOAMAnimation01
	ld hl, sOAMAnimationsBackup
	ld bc, $140
.asm_c99fd
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_c99fd
	disable_sram
	ld hl, wOAMAnimation01
	xor a
.asm_c9a0e
	ld [hli], a
	inc a
	jr nz, .asm_c9a0e
	ld a, $f
	ld [wcae2], a
	ld a, [wc958]
	or a
	jr nz, .asm_c9a22
	ld a, $0
	ld [wcae2], a
.asm_c9a22
	ld a, $0
	ld [wc957], a
	call Func_c9b82
	ld a, $1
	ld [wc957], a
	call Func_c9b82
	ld a, $0
	ld [wc957], a
	ld a, $0
	ld [wWhichPhoneNumberSymbolCode], a
	ld a, $2
	ld [wc46d], a
	ld a, $8
	ld [rSTAT], a
	ld a, BANK(Func_c99ac)
	ld [wPrevROMBank], a
	ld a, $10
	call StartFade
	ld a, [wc958]
	or a
	jr z, .asm_c9a5a
	xor a
	ld [wc958], a
	ret

.asm_c9a5a
	ld a, $1
	ld [wc958], a
	ret

Func_c9a60: ; c9a60 (32:5a60)
	ld b, $a
.asm_c9a62
	push bc
	push hl
	push de
	ld a, [de]
	call LoadMetatile
	pop de
	inc de
	pop hl
	inc hl
	inc hl
	pop bc
	dec b
	jr nz, .asm_c9a62
	ret

Func_c9a73: ; c9a73 (32:5a73)
	ld a, [wWhichPhoneNumberSymbolCode]
	cp $b
	jr z, .set_b
	cp $7
	jr z, .set_7
	ld a, [wcd20]
	; and a
	jr nz, .load_data
	; begin unused block
	ld a, [wCurTilesetIdx]
	cp $7
	jr z, .set_7
	; end unused block
.load_data
	ld b,  8
	callba Func_2e1fd
	call LoadTilesetRegisters
	call GetBlockdataPointer
	ld b, 20
	ld de, wcae3
	ld a, [wBlockDataBank]
	ld c, a
	call FarCopyData_Under256Bytes
	ld b, -8
	callba Func_2e1fd
	call LoadTilesetRegisters
	call GetBlockdataPointer
	ret

.set_b
	ld b, 10
	ld hl, wcae3
.load_19_1a
	ld a, $19
	ld [hli], a
	ld a, $1a
	ld [hli], a
	dec b
	jr nz, .load_19_1a
	ret

.set_7
	ld b, 10
	ld hl, wcae3
.load_09_09
	ld a, $9
	ld [hli], a
	ld a, $9
	ld [hli], a
	dec b
	jr nz, .load_09_09
	ret

Func_c9ad5:
	ld a, $0
	ld [wc46c], a
	ld a, $40
	ld [rSTAT], a
	enable_sram sOAMAnimationsBackup
	ld de, wOAMAnimations
	ld hl, sOAMAnimationsBackup
	ld bc, $140
.asm_c9af1
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_c9af1
	disable_sram
	jp IncrementSubroutine

Func_c9b01: ; c9b01 (32:5b01)
	ld a, $0
	ld [wSubroutine], a
	ld a, $0
	ld [wc46d], a
	ld a, [wc958]
	or a
	jr nz, .asm_c9b16
	ld a, $4
	ld [wSubroutine], a
.asm_c9b16
	ret

Func_c9b17: ; c9b17 (32:5b17)
	ld a, $1
	ld [wc46c], a
	ld a, [wcae1]
	inc a
	ld [wcae1], a
	ld a, [wc958]
	or a
	jr z, .asm_c9b52
	ld a, [wcae2]
	cp $e
	jr c, .asm_c9b3e
	ld a, BANK(Func_c9b17)
	ld [wPrevROMBank], a
	ld a, $1
	call PaletteFade_
	or a
	jp nz, Func_c9ad5
.asm_c9b3e
	ld a, [wcae1]
	and $f
	jr nz, .asm_c9b50
	ld a, [wcae2]
	cp $f
	jr nc, .asm_c9b50
	inc a
	ld [wcae2], a
.asm_c9b50
	jr .asm_c9b6e

.asm_c9b52
	ld a, BANK(Func_c9b17)
	ld [wPrevROMBank], a
	ld a, $0
	call PaletteFade_
	ld a, [wcae1]
	and $f
	jr nz, .asm_c9b50
	ld a, [wcae2]
	or a
	jp z, Func_c9ad5
	dec a
	ld [wcae2], a
.asm_c9b6e
	ld a, [wcadf]
	ld l, a
	ld a, [wcae0]
	ld h, a
	ld bc, $8
	add hl, bc
	ld a, l
	ld [wcadf], a
	ld a, h
	ld [wcae0], a
Func_c9b82: ; c9b82 (32:5b82)
	ld a, [wcadf]
	ld l, a
	ld a, [wcae0]
	ld h, a
	srl h
	rr l
	srl h
	rr l
	ld b, l
	ld hl, wOAMAnimation06
	ld a, [wc957]
	or a
	jr z, .asm_c9b9f
	ld hl, wOAMBufferEnd
.asm_c9b9f
	ld c, $82
.asm_c9ba1
	push hl
	ld a, b
	and $7f
	ld hl, Data_c9bc6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wcae2]
	ld d, a
	ld e, $0
	srl d
	rr e
	add hl, de
	ld a, [hl]
	pop hl
	ld d, a
	ld a, [wSCY]
	add d
	ld [hli], a
	inc b
	dec c
	jr nz, .asm_c9ba1
	ret

Data_c9bc6: INCLUDE "data/unknown_c9bc6.asm"

INCLUDE "data/unknown_ca3c6.asm"

SECTION "bank 33", ROMX, BANK [$33]
Func_cc000:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld b, $12
	ld hl, wOAMAnimation07
.asm_cc00a
	ld a, [hl]
	and $2
	jr z, .asm_cc035
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	push bc
	push hl
	add $10
	ld l, a
	ld a, [hl]
	ld hl, Pointers_cc03e
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call Func_cc03d
	pop hl
	push hl
	ld a, [hl]
	call Func_cc086
	pop hl
	pop bc
.asm_cc035
	ld de, $20
	add hl, de
	dec b
	jr nz, .asm_cc00a
	ret

Func_cc03d: ; cc03d (33:403d)
	jp [hl]

Pointers_cc03e:
	dw Func_cc151
	dw Func_cc152
	dw Func_cc22a
	dw Func_cc2f9
	dw Func_cc3b8
	dw Func_cc4af
	dw Func_cc573
	dw Func_cc642
	dw Func_cc78e
	dw Func_cc8be
	dw Func_cc9a5
	dw Func_ccb12
	dw Func_ccbd4
	dw Func_ccc9a
	dw Func_ccdef
	dw Func_ccc9a
	dw Func_cd008
	dw Func_cd12f
	dw Func_cd2dc
	dw Func_cd3bc
	dw Func_cd496
	dw Func_cd5d8
	dw Func_cd6c1
	dw Func_cd7ee
	dw Func_cd93d
	dw Func_cda72
	dw Func_cdb80
	dw Func_cdc6d
	dw Func_cddd4
	dw Func_cdebc
	dw Func_ce053
	dw Func_ce11f
	dw Func_ce21b
	dw Func_ce322
	dw Func_ce3d4
	dw Func_ce3d4

Func_cc086: ; cc086 (33:4086)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 6, a
	jr nz, asm_cc0c4
Func_cc095: ; cc095 (33:4095)
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
	inc de
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
asm_cc0c4
	ret

Func_cc0c5: ; cc0c5 (33:40c5)
	ld b, $12
	ld hl, wOAMAnimation07
	ld de, $20
.asm_cc0cd
	ld a, [hl]
	and $2
	jr z, .asm_cc0d8
	add hl, de
	dec b
	jr nz, .asm_cc0cd
	xor a
	ret

.asm_cc0d8
	ld a, b
	or a
	ret

Func_cc0db: ; cc0db (33:40db)
	ld b, $12
	ld hl, wOAMAnimation24
	ld de, hFFE0
.asm_cc0e3
	ld a, [hl]
	and $2
	jr z, .asm_cc0ee
	add hl, de
	dec b
	jr nz, .asm_cc0e3
	xor a
	ret

.asm_cc0ee
	ld a, b
	or a
	ret

Func_cc0f1: ; cc0f1 (33:40f1)
	ld hl, wOAMAnimation01
	push bc
	call Func_cc0c5
	pop bc
	ld de, wOAMAnimation01
	jr z, .asm_cc100
	jr asm_cc111

.asm_cc100
	ret

Func_cc101:
	ld hl, wOAMBufferEnd
	push bc
	call Func_cc0db
	pop bc
	ld de, wOAMAnimations
	jr z, .asm_cc110
	jr asm_cc111

.asm_cc110
	ret

asm_cc111
	push de
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $8
	add e
	ld e, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc de
	inc de
	inc hl
	inc hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	pop de
	or $1
	ret

Func_cc151:
	ret

Func_cc152:
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc16b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc16b:
	dw Func_cc16f
	dw Func_cc1b9

Func_cc16f:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $a9
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_cc1b9:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $30
	jr c, .asm_cc1d1
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc1d1
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $2
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cc1f8
	ld b, $2
.asm_cc1f8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cc1ff:
	ld b, $1
	call Func_cc0f1
	jr z, .asm_cc211
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_cc212
.asm_cc211
	ret

Func_cc212: ; cc212 (33:4212)
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	jp Func_2af4

Func_cc22a:
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc243
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc243:
	dw Func_cc247
	dw Func_cc2a5

Func_cc247:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cc284
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $10
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $f8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_cc29c

.asm_cc284
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $f0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $8
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_cc29c
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_cc2a5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_cc2c2
	ld a, $1f
	ld [wcac2], a
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc2c2
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cc2db
	ld bc, -3
	call Func_2ae7
	ld bc, 6
	call Func_2ada
	jr .asm_cc2e7

.asm_cc2db
	ld bc, 3
	call Func_2ae7
	ld bc, -6
	call Func_2ada
.asm_cc2e7
	call Func_2acd
	ret

Func_cc2eb: ; cc2eb (33:42eb)
	ld b, $2
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc2f9: ; cc2f9 (33:42f9)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc312
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc312:
	dw Func_cc316
	dw Func_cc34e

Func_cc316:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cc34e:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .asm_cc36f
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc36f
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	cp $25
	jr nz, .asm_cc37e
	ld a, b
	cpl
	ld b, a
.asm_cc37e
	ld a, b
	sla a
	sla a
	sla a
	sla a
	and $7f
	ld d, a
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cc3aa: ; cc3aa (33:43aa)
	ld b, $3
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc3b8: ; cc3b8 (33:43b8)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc3d1
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc3d1: ; cc3d1 (33:43d1)
	dw Func_cc3d5
	dw Func_cc41d

Func_cc3d5: ; cc3d5 (33:43d5)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cc41d: ; cc41d (33:441d)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .asm_cc43e
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc43e
	call OverworldRandom8_
	and $f
	add $8
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld d, a
	call Cosine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	call OverworldRandom8_
	and $f
	add $8
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld d, a
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cc4a1: ; cc4a1 (33:44a1)
	ld b, $4
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc4af: ; cc4af (33:44af)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc4c8
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc4c8: ; cc4c8 (33:44c8)
	dw Func_cc4cc
	dw Func_cc50c

Func_cc4cc: ; cc4cc (33:44cc)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	sla c
	rl b
	call Func_2b01
	ret

Func_cc50c: ; cc50c (33:450c)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	jr c, .asm_cc533
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc533
	ld bc, -8
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	ld bc, -8
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_cc54d
	ld bc, $6
.asm_cc54d
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	call Func_cc095
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wd45d]
	ld b, a
	ld a, [hl]
	add b
	ld [hl], a
	ret

Func_cc565: ; cc565 (33:4565)
	ld b, $5
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc573: ; cc573 (33:4573)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc58c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc58c: ; cc58c (33:458c)
	dw Func_cc590
	dw Func_cc5d2

Func_cc590: ; cc590 (33:4590)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_cc5d2: ; cc5d2 (33:45d2)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	srl a
	cp $7
	jr nc, .asm_cc5f9
	ld de, Data_cc635
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [de]
	ld [hl], a
	ret

.asm_cc5f9
	cp $20
	jr c, .asm_cc604
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc604
	cp $10
	ret c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -1
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cc62e
	ld b, $2
.asm_cc62e
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Data_cc635:
	db $36
	db $36
	db $36
	db $36
	db $37
	db $38
	db $39
	db $3a

Func_cc63d: ; cc63d (33:463d)
	ld b, $6
	jp Func_cc0f1

Func_cc642: ; cc642 (33:4642)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc65b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc65b: ; cc65b (33:465b)
	dw Func_cc65f
	dw Func_cc6c9

Func_cc65f: ; cc65f (33:465f)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ret

Func_cc6c9: ; cc6c9 (33:46c9)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	srl a
	cp $7
	jr nc, .asm_cc6f0
	ld de, Data_cc778
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [de]
	ld [hl], a
	ret

.asm_cc6f0
	cp $1a
	jr c, .asm_cc726
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cc70e
	ld b, $2
.asm_cc70e
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	cp $f8
	jr c, .asm_cc729
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_cc726
	cp $10
	ret c
.asm_cc729
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $30
	jr nc, .asm_cc740
	inc a
	ld [hl], a
.asm_cc740
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld e, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call AddVector_
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ret

Data_cc778:
	db $36
	db $36
	db $36
	db $36
	db $37
	db $38
	db $39
	db $3a

Func_cc780: ; cc780 (33:4780)
	ld b, $7
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc78e: ; cc78e (33:478e)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc7a7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc7a7: ; cc7a7 (33:47a7)
	dw Func_cc7ab
	dw Func_cc845

Func_cc7ab: ; cc7ab (33:47ab)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cc7e8
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_cc800

.asm_cc7e8
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_cc800
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_cc845: ; cc845 (33:4845)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1a
	jr c, .asm_cc87f
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $7
	jr c, .asm_cc8a8
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3f
	jr c, .asm_cc8a8
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc87f
	cp $10
	jr nc, .asm_cc8a8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cc89c
	ld bc, 6
	call Func_2ae7
	ld bc, -12
	call Func_2ada
	jr .asm_cc8a8

.asm_cc89c
	ld bc, -6
	call Func_2ae7
	ld bc, 12
	call Func_2ada
.asm_cc8a8
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ret

Func_cc8b0: ; cc8b0 (33:48b0)
	ld b, $8
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cc8be: ; cc8be (33:48be)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc8d7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc8d7: ; cc8d7 (33:48d7)
	dw Func_cc8db
	dw Func_cc965

Func_cc8db: ; cc8db (33:48db)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_cc965: ; cc965 (33:4965)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $7
	jr c, .asm_cc992
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $40
	jr c, .asm_cc992
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cc992
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -6
	call Func_2ae7
	call Func_2acd
	ret

Func_cc9a0: ; cc9a0 (33:49a0)
	ld b, $9
	jp Func_cc0f1

Func_cc9a5: ; cc9a5 (33:49a5)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cc9be
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cc9be: ; cc9be (33:49be)
	dw Func_cc9c4
	dw Func_cca33
	dw Func_ccae6

Func_cc9c4: ; cc9c4 (33:49c4)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cca0a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $40
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $40
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_cca22

.asm_cca0a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_cca22
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ret

Func_cca33: ; cca33 (33:4a33)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	call Func_cc086
	ld de, Data_ccb07
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cca54
	ld de, Data_ccb0a
.asm_cca54
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_ccac0
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_ccac0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hli]
	cpl
	ld c, a
	ld a, [hld]
	cpl
	ld b, a
	inc bc
	sra b
	rr c
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hld]
	ld b, a
	sra b
	rr c
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3
	jr c, .asm_ccac0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_ccac0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld de, wOAMAnimation01_Duration
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld de, wOAMAnimation01_Duration + 4
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wVBlankCounter]
	and $3
	ret nz
	call Func_ccbcf
	ret

Func_ccae6: ; ccae6 (33:4ae6)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $32
	jr c, .asm_ccafd
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
.asm_ccafd
	ld a, [wVBlankCounter]
	and $3
	ret nz
	call Func_ccbcf
	ret

Data_ccb07:
	db $50, $54, $56

Data_ccb0a:
	db $38, $35, $34

Func_ccb0d: ; ccb0d (33:4b0d)
	ld b, $a
	jp Func_cc101

Func_ccb12: ; ccb12 (33:4b12)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ccb2b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ccb2b: ; ccb2b (33:4b2b)
	dw Func_ccb2f
	dw Func_ccb9d

Func_ccb2f: ; ccb2f (33:4b2f)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_ccb9d: ; ccb9d (33:4b9d)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_ccbb5
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_ccbb5
	cp $8
	jr c, .asm_ccbc1
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
.asm_ccbc1
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, rIE
	call Func_2ae7
	call Func_2acd
	ret

Func_ccbcf: ; ccbcf (33:4bcf)
	ld b, $b
	jp Func_cc0f1

Func_ccbd4: ; ccbd4 (33:4bd4)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ccbed
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ccbed: ; ccbed (33:4bed)
	dw Func_ccbf1
	dw Func_ccc63

Func_ccbf1: ; ccbf1 (33:4bf1)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $4d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_ccc63: ; ccc63 (33:4c63)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_ccc7b
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_ccc7b
	cp $10
	jr c, .asm_ccc87
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
.asm_ccc87
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_ccc95: ; ccc95 (33:4c95)
	ld b, $c
	jp Func_cc0f1

Func_ccc9a: ; ccc9a (33:4c9a)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cccb3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cccb3: ; cccb3 (33:4cb3)
	dw Func_cccb7
	dw Func_ccd56

Func_cccb7: ; cccb7 (33:4cb7)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $4e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $f
	jr nz, .asm_ccce7
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3b
	ld [hl], a
.asm_ccce7
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $8
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $30
	ld [hli], a
	ld a, $0
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	bit 7, b
	jr z, .asm_ccd37
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $f8
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_ccd37
	call OverworldRandom16_
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_ccd56: ; ccd56 (33:4d56)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_ccd6e
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_ccd6e
	cp $16
	jr c, .asm_ccd7a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
.asm_ccd7a
	ld bc, -1
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_ccd8b
	ld bc, -4
.asm_ccd8b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $8
	jr c, .asm_ccdb5
	ld bc, $4
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_ccdae
	ld bc, -4
.asm_ccdae
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ada
.asm_ccdb5
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $12
	jr nz, .asm_ccde4
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $f
	jr nz, .asm_ccde4
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3e
	ld [hl], a
.asm_ccde4
	ret

Func_ccde5: ; ccde5 (33:4de5)
	ld b, $d
	jp Func_cc0f1

Func_ccdea: ; ccdea (33:4dea)
	ld b, $f
	jp Func_cc0f1

Func_ccdef: ; ccdef (33:4def)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cce08
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cce08: ; cce08 (33:4e08)
	dw Func_cce14
	dw Func_cce8c
	dw Func_cced1
	dw Func_cce8c
	dw Func_ccf7a
	dw Func_ccfce

Func_cce14: ; cce14 (33:4e14)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $53
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_cce43
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_cce43
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cce62
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $40
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_cce62
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ret

Func_cce8c: ; cce8c (33:4e8c)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_cced0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $85
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_cced0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $38
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_cced0
	ret

Func_cced1: ; cced1 (33:4ed1)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld bc, 13
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_ccee5
	ld bc, -13
.asm_ccee5
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ae7
	ld bc, 2
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ccef9
	ld bc, -2
.asm_ccef9
	call Func_2ada
	call Func_2ae7
	call Func_2acd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $14
	jr c, .asm_ccf79
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ccf4f
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMAnimation01_Duration + 4
	ld a, $80
	ld [hli], a
	ld a, $6
	ld [hl], a
	ld c, $58
	call Func_cc4a1
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMBufferEnd
	ld bc, $1000
	call Func_2af4
	ld c, $59
	call Func_cc4a1
	jr .asm_ccf74

.asm_ccf4f
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $11
	ld [hl], a
	ld hl, wOAMAnimation01_Duration + 4
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	ld c, $56
	call Func_cc4a1
	ld hl, wOAMBufferEnd
	ld bc, $1000
	call Func_2af4
	ld c, $57
	call Func_cc4a1
.asm_ccf74
	ld a, SFX_2C
	ld [H_SFX_ID], a
.asm_ccf79
	ret

Func_ccf7a: ; ccf7a (33:4f7a)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	and $3
	ret nz
	ld d, $0
	ld a, [wVBlankCounter]
	and $4
	jr nz, .asm_ccf94
	inc d
.asm_ccf94
	ld bc, $180
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	xor d
	jr z, .asm_ccfa4
	ld bc, $fe80
.asm_ccfa4
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $3c
	jr c, .asm_ccfcd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
.asm_ccfcd
	ret

Func_ccfce: ; ccfce (33:4fce)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_ccff9
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ld a, $20
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wd45b], a
	ld a, SFX_4B
	ld [H_SFX_ID], a
.asm_ccff9
	ret

Func_ccffa: ; ccffa (33:4ffa)
	ld b, $e
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cd008: ; cd008 (33:5008)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd021
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd021: ; cd021 (33:5021)
	dw Func_cd025
	dw Func_cd0ba

Func_cd025: ; cd025 (33:5025)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $3d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd06b
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $40
	ld [hli], a
	ld a, $0
	ld [hl], a
	jr .asm_cd083

.asm_cd06b
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_cd083
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_cd0ba: ; cd0ba (33:50ba)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1a
	jr c, .asm_cd0f9
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $7
	jr c, .asm_cd122
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, $8
	ld [wca60], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3f
	jr c, .asm_cd122
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd0f9
	cp $10
	jr nc, .asm_cd122
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd116
	ld bc, -13
	call Func_2ae7
	ld bc, -8
	call Func_2ada
	jr .asm_cd122

.asm_cd116
	ld bc, -12
	call Func_2ae7
	ld bc, $8
	call Func_2ada
.asm_cd122
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ret

Func_cd12a: ; cd12a (33:512a)
	ld b, $10
	jp Func_cc0f1

Func_cd12f: ; cd12f (33:512f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd148
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd148: ; cd148 (33:5148)
	dw Func_cd14e
	dw Func_cd1c0
	dw Func_cd295

Func_cd14e: ; cd14e (33:514e)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $5f
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_cd1bf
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $80
	ld [hl], a
.asm_cd1bf
	ret

Func_cd1c0: ; cd1c0 (33:51c0)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wcac2]
	cp $ff
	jr z, .asm_cd210
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_cd209
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $63
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ret

.asm_cd209
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd210
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_cd21c
	dec a
	ld [hl], a
.asm_cd21c
	call OverworldRandom8_
	and $f
	add $6
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld d, a
	call Cosine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	sra d
	sra d
	sra d
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	call OverworldRandom8_
	and $f
	add $6
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld d, a
	call Sine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	sra d
	sra d
	sra d
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ret

Func_cd295: ; cd295 (33:5295)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $40
	jr c, .asm_cd2ad
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd2ad
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cd2c7
	ld b, $2
.asm_cd2c7
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cd2ce: ; cd2ce (33:52ce)
	ld b, $11
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cd2dc: ; cd2dc (33:52dc)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd2f5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd2f5: ; cd2f5 (33:52f5)
	dw Func_cd2f9
	dw Func_cd33b

Func_cd2f9: ; cd2f9 (33:52f9)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $73
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_cd33b: ; cd33b (33:533b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_cd39f
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	cp $8
	jr nc, .asm_cd363
	ld de, Data_cd3af
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [de]
	ld [hl], a
	ret

.asm_cd363
	cp $20
	jr c, .asm_cd36e
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd36e
	cp $10
	ret c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -1
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cd398
	ld b, $2
.asm_cd398
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cd39f: ; cd39f (33:539f)
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $a
	ret nz
	ld a, SFX_45
	ld [H_SFX_ID], a
	ret

Data_cd3af:
	db $73
	db $73
	db $73
	db $73
	db $73
	db $74
	db $75
	db $76

Func_cd3b7: ; cd3b7 (33:53b7)
	ld b, $12
	jp Func_cc0f1

Func_cd3bc: ; cd3bc (33:53bc)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd3d5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd3d5: ; cd3d5 (33:53d5)
	dw Func_cd3db
	dw Func_cd429
	dw Func_cd455

Func_cd3db: ; cd3db (33:53db)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $63
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_cd428
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $80
	ld [hl], a
.asm_cd428
	ret

Func_cd429: ; cd429 (33:5429)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wd45d]
	cp $ff
	jr nz, .asm_cd454
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ret

.asm_cd454
	ret

Func_cd455: ; cd455 (33:5455)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	ret c
	cp $60
	jr c, .asm_cd470
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd470
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cd48a
	ld b, $2
.asm_cd48a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cd491: ; cd491 (33:5491)
	ld b, $13
	jp Func_cc101

Func_cd496: ; cd496 (33:5496)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd4af
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd4af: ; cd4af (33:54af)
	dw Func_cd4b3
	dw Func_cd53f

Func_cd4b3: ; cd4b3 (33:54b3)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd4f0
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $64
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $ce
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_cd508

.asm_cd4f0
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $9c
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $32
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_cd508
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wVBlankCounter]
	sla a
	ld d, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ret

Func_cd53f: ; cd53f (33:553f)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_cd557
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd557
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	sra d
	rr e
	sra d
	rr e
	sra d
	rr e
	sra d
	rr e
	sra d
	rr e
	ld b, d
	ld c, e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd5a4
	ld bc, -3
	call Func_2ae7
	ld bc, $6
	call Func_2ada
	jr .asm_cd5b0

.asm_cd5a4
	ld bc, $3
	call Func_2ae7
	ld bc, -6
	call Func_2ada
.asm_cd5b0
	call Func_2acd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $20
	jr nc, .asm_cd5c9
	inc a
	ld [hl], a
.asm_cd5c9
	ret

Func_cd5ca: ; cd5ca (33:55ca)
	ld b, $14
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cd5d8: ; cd5d8 (33:55d8)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd5f1
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd5f1: ; cd5f1 (33:55f1)
	dw Func_cd5f5
	dw Func_cd67f

Func_cd5f5: ; cd5f5 (33:55f5)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $38
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	call Func_2af4
	call OverworldRandom16_
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	call Func_2ae7
	call OverworldRandom8_
	ld a, d
	and $3
	add $7b
	ld c, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ret

Func_cd67f: ; cd67f (33:567f)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $40
	jr c, .asm_cd697
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cd697
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $d0
	ret nc
	cp $60
	ret c
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

Func_cd6bc: ; cd6bc (33:56bc)
	ld b, $15
	jp Func_cc0f1

Func_cd6c1: ; cd6c1 (33:56c1)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd6da
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd6da: ; cd6da (33:56da)
	dw Func_cd6de
	dw Func_cd75d

Func_cd6de: ; cd6de (33:56de)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd71e
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $40
	ld [hl], a
	jr .asm_cd730

.asm_cd71e
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $68
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $28
	ld [hl], a
.asm_cd730
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $9f
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $78
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ret

Func_cd75d: ; cd75d (33:575d)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	sra d
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add $10
	ld d, a
	call Sine8_
	ld e, d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	call Multiply_C_by_E_signed
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	or a
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

Func_cd7e0: ; cd7e0 (33:57e0)
	ld b, $16
	call Func_cc0f1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_cd7ee: ; cd7ee (33:57ee)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd807
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd807: ; cd807 (33:5807)
	dw Func_cd80b
	dw Func_cd8a2

Func_cd80b: ; cd80b (33:580b)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd84d
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $40
	ld [hl], a
	ld b, $67
	jr .asm_cd861

.asm_cd84d
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $68
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $28
	ld [hl], a
	ld b, $27
.asm_cd861
	call OverworldRandom8_
	and $1f
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, b
	ld [hl], a
	call OverworldRandom8_
	and $3
	add $a5
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom8_
	and $1f
	add $64
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ret

Func_cd8a2: ; cd8a2 (33:58a2)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .asm_cd8b9
	dec d
.asm_cd8b9
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	call Multiply_DE_by_BC
	sra d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .asm_cd8f0
	dec d
.asm_cd8f0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	call Multiply_DE_by_BC
	sra d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_cd92d
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_cd92d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ret

Func_cd938: ; cd938 (33:5938)
	ld b, $17
	jp Func_cc0f1

Func_cd93d: ; cd93d (33:593d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cd956
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cd956: ; cd956 (33:5956)
	dw Func_cd95a
	dw Func_cda03

Func_cd95a: ; cd95a (33:595a)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cd9b8
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	jr .asm_cd9f1

.asm_cd9b8
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $80
	ld [hl], a
.asm_cd9f1
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $a0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_cda03: ; cda03 (33:5a03)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cda23
	ld bc, -8
	call Func_2ada
	ld bc, $4
	call Func_2ae7
	jr .asm_cda2f

.asm_cda23
	ld bc, $8
	call Func_2ada
	ld bc, hFFFC
	call Func_2ae7
.asm_cda2f
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1a
	jr c, .asm_cda43
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_cda43
	ld a, [wVBlankCounter]
	and $1
	ret nz
	call Func_cda50
	call Func_cdb7b
	ret

Func_cda50: ; cda50 (33:5a50)
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld de, wOAMAnimation01_Duration
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld de, wOAMAnimation01_Duration + 4
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ret

Func_cda6d: ; cda6d (33:5a6d)
	ld b, $18
	jp Func_cc101

Func_cda72: ; cda72 (33:5a72)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cda8b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cda8b: ; cda8b (33:5a8b)
	dw Func_cda8f
	dw Func_cdb3b

Func_cda8f: ; cda8f (33:5a8f)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cdad5
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $20
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	jr .asm_cdaf6

.asm_cdad5
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $40
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $80
	ld [hl], a
.asm_cdaf6
	call OverworldRandom8_
	and $3
	add $a5
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	call OverworldRandom16_
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	call Func_2ae7
	ret

Func_cdb3b: ; cdb3b (33:5b3b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cdb5b
	ld bc, $2
	call Func_2ada
	ld bc, rIE
	call Func_2ae7
	jr .asm_cdb67

.asm_cdb5b
	ld bc, hFFFE
	call Func_2ada
	ld bc, $1
	call Func_2ae7
.asm_cdb67
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_cdb7a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
.asm_cdb7a
	ret

Func_cdb7b: ; cdb7b (33:5b7b)
	ld b, $19
	jp Func_cc0f1

Func_cdb80: ; cdb80 (33:5b80)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cdb99
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cdb99: ; cdb99 (33:5b99)
	dw Func_cdb9d
	dw Func_cdc26

Func_cdb9d: ; cdb9d (33:5b9d)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $76
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cdc26: ; cdc26 (33:5c26)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	cp b
	jr nc, .asm_cdc5a
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	call Func_cda50
	ld c, $0
	call Func_cddc4
	ld c, $1
	call Func_cddc4
	ld c, $2
	call Func_cddc4
	ld c, $3
	call Func_cddc4
	ret

.asm_cdc5a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_cdc68: ; cdc68 (33:5c68)
	ld b, $1a
	jp Func_cc0f1

Func_cdc6d: ; cdc6d (33:5c6d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cdc86
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cdc86: ; cdc86 (33:5c86)
	dw Func_cdc8a
	dw Func_cdd99

Func_cdc8a: ; cdc8a (33:5c8a)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	call OverworldRandom8_
	and $3
	add $78
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	call Func_cc086
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_cdd40
	cp $1
	jr z, .asm_cdd52
	cp $2
	jr z, .asm_cdd64
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $140
	call Func_2b01
	ld bc, $10
	call Func_2ada
	ld bc, -$200
	call Func_2af4
	jr .asm_cdd7a

.asm_cdd40
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$140
	call Func_2b01
	ld bc, -$10
	call Func_2ada
	jr .asm_cdd7a

.asm_cdd52
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $140
	call Func_2b01
	ld bc, $10
	call Func_2ada
	jr .asm_cdd7a

.asm_cdd64
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$140
	call Func_2b01
	ld bc, -$10
	call Func_2ada
	ld bc, -$200
	call Func_2af4
.asm_cdd7a
	call OverworldRandom16_
	call Func_2b01
	call OverworldRandom16_
	sra b
	rr c
	ld hl, -$100
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2af4
	ret

Func_cdd99: ; cdd99 (33:5d99)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	cp b
	jr nc, .asm_cddb6
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cddb6
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_cddc4: ; cddc4 (33:5dc4)
	ld b, $1b
	call Func_cc0f1
	jr z, .asm_cddd3
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
.asm_cddd3
	ret

Func_cddd4: ; cddd4 (33:5dd4)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cdded
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cdded: ; cdded (33:5ded)
	dw Func_cddf1
	dw Func_cde48

Func_cddf1: ; cddf1 (33:5df1)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	ret

Func_cde48: ; cde48 (33:5e48)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $32
	jr c, .asm_cde60
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_cde60
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -2
	call Func_2ae7
	call ApplyYStepVector_
	ld a, l
	swap a
	srl a
	ld b, a
	ld a, [wVBlankCounter]
	add b
	and $7
	jr nz, .asm_cde81
	call Func_cda50
	call Func_cc1ff
.asm_cde81
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $10
	ret c
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_cdea5
	ld b, $2
.asm_cdea5
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_cdeac: ; cdeac (33:5eac)
	ld b, $1c
	call Func_cc101
	jr z, .asm_cdebb
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
.asm_cdebb
	ret

Func_cdebc: ; cdebc (33:5ebc)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_cded5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_cded5: ; cded5 (33:5ed5)
	dw Func_cdedb
	dw Func_cdf7a
	dw Func_ce01f

Func_cdedb: ; cdedb (33:5edb)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $a0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cdf0f
	ld bc, $1e
	ld de, -$f
	jr .asm_cdf15

.asm_cdf0f
	ld bc, -$1e
	ld de, $f
.asm_cdf15
	push de
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add $8
	cp $30
	jr c, .asm_cdf25
	ld a, $30
.asm_cdf25
	ld e, a
	ld d, $0
	call Multiply_DE_by_BC
	ld a, [wCurObjectStruct + 1]
	ld h, a
	sra d
	rr e
	sra d
	rr e
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, e
	ld [hl], a
	pop de
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	call Multiply_DE_by_BC
	ld a, [wCurObjectStruct + 1]
	ld h, a
	sra d
	rr e
	sra d
	rr e
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_cdf7a: ; cdf7a (33:5f7a)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_cdfed
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $74
	jr c, .asm_ce006
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $40
	jr nc, .asm_ce006
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e4
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_cdfa7
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sra b
	rr c
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	call OverworldRandom8_
	and $1
	add $a2
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

.asm_cdfed
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $30
	jr nc, .asm_ce006
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $1c
	ld [hli], a
	ld a, $0
	ld [hl], a
	jr .asm_cdfa7

.asm_ce006
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $5d
	jr nc, asm_ce02e
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $4
	call Func_2ae7
	call Func_2acd
	ret

Func_ce01f: ; ce01f (33:601f)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $5d
	jr c, asm_ce035
asm_ce02e
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

asm_ce035
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	ret

Func_ce043: ; ce043 (33:6043)
	ld b, $1d
	call Func_cc0f1
	jr z, .asm_ce052
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, c
	ld [hl], a
.asm_ce052
	ret

Func_ce053: ; ce053 (33:6053)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ce06c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ce06c: ; ce06c (33:606c)
	dw Func_ce070
	dw Func_ce0f6

Func_ce070: ; ce070 (33:6070)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $aa
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ce0aa
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $20
	ld [hli], a
	ld a, $0
	ld [hl], a
	jr .asm_ce0b6

.asm_ce0aa
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
.asm_ce0b6
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call OverworldRandom16_
	ld a, [wCurObjectStruct]
	ld l, a
	sra b
	rr c
	call Func_2ada
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom8_
	and $1
	ret z
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $ac
	ld [hl], a
	ret

Func_ce0f6: ; ce0f6 (33:60f6)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $5a
	jr c, .asm_ce10c
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_ce10c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	ret

Func_ce11a: ; ce11a (33:611a)
	ld b, $1e
	jp Func_cc0f1

Func_ce11f: ; ce11f (33:611f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ce138
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ce138: ; ce138 (33:6138)
	dw Func_ce13e
	dw Func_ce1a5
	dw Func_ce1e7

Func_ce13e: ; ce13e (33:613e)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $ad
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ce184
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_ce19c

.asm_ce184
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $70
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_ce19c
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_ce1a5: ; ce1a5 (33:61a5)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_ce1d9
	call Func_cda50
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call Func_ce2e5
	call Func_ce2e5
	call Func_ce2e5
	call Func_ce2e5
	jp Func_ce2e5

.asm_ce1d9
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $4
	call Func_2ae7
	call Func_2acd
	ret

Func_ce1e7: ; ce1e7 (33:61e7)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_ce1ff
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_ce1ff
	cp $6
	jr nz, .asm_ce20f
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, SFX_29
	ld [H_SFX_ID], a
	ret

.asm_ce20f
	and $1
	ret nz
	call Func_ce2e5
	ret

Func_ce216: ; ce216 (33:6216)
	ld b, $1f
	jp Func_cc0f1

Func_ce21b: ; ce21b (33:621b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ce234
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ce234: ; ce234 (33:6234)
	dw Func_ce238
	dw Func_ce2c1

Func_ce238: ; ce238 (33:6238)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $aa
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $8
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	call Func_2ae7
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sra b
	rr c
	call Func_2af4
	ld bc, -$200
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	call OverworldRandom8_
	and $1
	ret z
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $ac
	ld [hl], a
	ret

Func_ce2c1: ; ce2c1 (33:62c1)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $5a
	jr c, .asm_ce2d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_ce2d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	ret

Func_ce2e5: ; ce2e5 (33:62e5)
	ld b, $20
	jp Func_cc0f1

Func_ce2ea: ; ce2ea (33:62ea)
	ld d, $12
	jr asm_ce2f0

Func_ce2ee: ; ce2ee (33:62ee)
	ld d, $10
asm_ce2f0
	push de
	ld b, $0
	call Func_cc0f1
	pop de
	jr z, .asm_ce321
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $50
	ld [hl], a
	dec d
	jr nz, asm_ce2f0
.asm_ce321
	ret

Func_ce322: ; ce322 (33:6322)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ce33b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ce33b: ; ce33b (33:633b)
	dw Func_ce33f
	dw Func_ce3a2

Func_ce33f: ; ce33f (33:633f)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $d3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ce38f
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $70
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $26
	ld [hl], a
	ret

.asm_ce38f
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $2a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $3a
	ld [hl], a
	ret

Func_ce3a2: ; ce3a2 (33:63a2)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $6
	jr c, .asm_ce3ce
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $d6
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, $0
	ld [hl], a
.asm_ce3ce
	ret

Func_ce3cf: ; ce3cf (33:63cf)
	ld b, $21
	jp Func_cc0f1

Func_ce3d4: ; ce3d4 (33:63d4)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_ce3ed
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_ce3ed: ; ce3ed (33:63ed)
	dw Func_ce3f3
	dw Func_ce4c6
	dw Func_ce597

Func_ce3f3: ; ce3f3 (33:63f3)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_ce437
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $40
	ld [hl], a
	ld b, $67
	ld e, $77
	jr .asm_ce44d

.asm_ce437
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, $68
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $28
	ld [hl], a
	ld b, $27
	ld e, $37
.asm_ce44d
	call OverworldRandom8_
	and $1f
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, b
	ld [hl], a
	call OverworldRandom8_
	push af
	and $3
	add $78
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $19
	ld [hl], a
	pop af
	swap a
	and $7
	add $a
	ld b, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $8
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $23
	ret nz
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $76
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $9
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $1c
	ld [hl], a
	ret

Func_ce4c6: ; ce4c6 (33:64c6)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .asm_ce4dd
	dec d
.asm_ce4dd
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	call Multiply_DE_by_BC
	sra d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .asm_ce514
	dec d
.asm_ce514
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	call Multiply_DE_by_BC
	sra d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $23
	jr z, .asm_ce583
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	jr nz, .asm_ce570
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
.asm_ce570
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	jr nz, .asm_ce582
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_ce582
	ret

.asm_ce583
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ret nz
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ret

Func_ce597: ; ce597 (33:6597)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $2
	ret c
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_2e76
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	call Func_cda50
	ld c, $0
	call Func_cddc4
	ld c, $1
	call Func_cddc4
	ld c, $2
	call Func_cddc4
	ld c, $3
	call Func_cddc4
	ld a, SFX_61
	ld [H_SFX_ID], a
	ret

Func_ce5de: ; ce5de (33:65de)
	ld b, $22
	call Func_cc0f1
	ld b, $22
	call Func_cc0f1
	ld b, $22
	call Func_cc0f1
	ld b, $22
	call Func_cc0f1
	ld b, $22
	call Func_cc0f1
	ld b, $22
	call Func_cc0f1
	ld b, $23
	jp Func_cc0f1

Func_ce601: ; ce601 (33:6601)
	ld hl, Palettes_34000
	jr asm_ce60b

Func_ce606: ; ce606 (33:6606)
	ld hl, DenjuuPalettes
	ld b, $0
asm_ce60b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld c, $4
	ld de, wcd38
	jp Func_373e

Func_ce620: ; ce620 (33:6620)
	ld a, c
	ld [wcac3], a
	ld a, [hli]
	ld [wcac5], a
	ld a, [hli]
	ld [wcac6], a
	ld a, [hl]
	ld [wcac7], a
	ld de, wcd38
	ld a, $4
	ld [wcac4], a
.loop
	ld a, [de]
	ld b, a
	ld a, [wcac3]
	ld c, a
	ld a, $20
	sub c
	ld c, a
	call Func_ce70b
	push bc
	ld a, [wcac5]
	ld b, a
	ld a, [wcac3]
	ld c, a
	call Func_ce70b
	pop hl
	add hl, bc
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, $c
	push de
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, h
	ld [de], a
	pop de
	inc de
	ld a, [de]
	ld b, a
	ld a, [wcac3]
	ld c, a
	ld a, $20
	sub c
	ld c, a
	call Func_ce70b
	push bc
	ld a, [wcac6]
	ld b, a
	ld a, [wcac3]
	ld c, a
	call Func_ce70b
	pop hl
	add hl, bc
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, $c
	push de
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, h
	ld [de], a
	pop de
	inc de
	ld a, [de]
	ld b, a
	ld a, [wcac3]
	ld c, a
	ld a, $20
	sub c
	ld c, a
	call Func_ce70b
	push bc
	ld a, [wcac7]
	ld b, a
	ld a, [wcac3]
	ld c, a
	call Func_ce70b
	pop hl
	add hl, bc
	sla l
	rl h
	sla l
	rl h
	sla l
	rl h
	ld a, $c
	push de
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, h
	ld [de], a
	pop de
	inc de
	ld a, [wcac4]
	dec a
	ld [wcac4], a
	jp nz, .loop
	ld de, wcac8
	ld hl, wcd44
	ld a, $4
	ld [wcac4], a
.asm_ce6e9
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	rrca
	rrca
	rrca
	and $e0
	or b
	ld [de], a
	inc de
	srl c
	srl c
	srl c
	ld a, [hli]
	rlca
	rlca
	or c
	ld [de], a
	inc de
	ld a, [wcac4]
	dec a
	ld [wcac4], a
	jr nz, .asm_ce6e9
	ret

Func_ce70b: ; ce70b (33:670b)
	ld hl, Data_ce738
	ld a, b
	or a
	jr z, .asm_ce734
	ld a, c
	or a
	jr z, .asm_ce734
	dec b
	dec c
	sla b
	sla c
	ld a, b
	ld b, $0
	add hl, bc
	ld b, a
	ld c, $0
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld a, [hli]
	ld c, a
	ld b, [hl]
	ret

.asm_ce734
	xor a
	ld b, a
	ld c, a
	ret

Data_ce738:
x = 1
rept 32
y = 0
rept 32
y = y + x
	dw y
endr
x = x + 1
endr

Data_cef38:	db $1f, $1f, $1f
Data_cef3b: db $1f, $00, $00
            db $00, $00, $1f
Data_cef41: db $00, $1f, $00
            db $1f, $1f, $00
Data_cef47: db $1f, $00, $1f
            db $00, $1f, $1f
Data_cef4d: db $00, $0a, $10
Data_cef50: db $00, $00, $00
Data_cef53: db $1f, $14, $1f
Data_cef56: db $14, $14, $14
Data_cef59:	db $12, $1f, $1f

Func_cef5c: ; cef5c (33:6f5c)
	check_cgb
	ret nz
	ld a, [wcac2]
	ld c, a
	ld h, d
	ld l, e
	call Func_ce620
	ld a, [wBattleTurn]
	or a
	jr nz, .asm_cef75
	ld b, $8
	jr .asm_cef77

.asm_cef75
	ld b, $7
.asm_cef77
	ld a, $ff
	ld [wcac8], a
	ld a, $7f
	ld [wcac9], a
	ld a, b
	ld [wca61], a
	ret

Func_cef86: ; cef86 (33:6f86)
	ld a, b
	ld [wca61], a
	ld h, d
	ld l, e
	call Func_ce620
	ld a, $ff
	ld [wcac8], a
	ld a, $7f
	ld [wcac9], a
	ret

SECTION "bank 35", ROMX, BANK [$35]
UnknownTZFile90:: INCBIN "gfx/tzfiles/tz_90.2bpp.tz"
UnknownTZFile89:: INCBIN "gfx/tzfiles/tz_89.2bpp.tz"
UnknownTZFile84:: INCBIN "gfx/tzfiles/tz_84.2bpp.tz"
UnknownTZFile85:: INCBIN "gfx/tzfiles/tz_85.2bpp.tz"
UnknownTZFile86:: INCBIN "gfx/tzfiles/tz_86.2bpp.tz"
UnknownTZFile87:: INCBIN "gfx/tzfiles/tz_87.2bpp.tz"
UnknownTZFile88:: INCBIN "gfx/tzfiles/tz_88.2bpp.tz"
UnknownTZFile91:: INCBIN "gfx/tzfiles/tz_91.2bpp.tz"

SECTION "bank 36", ROMX, BANK [$36]
UnknownTZFile03:: INCBIN "gfx/tzfiles/tz_3.2bpp.tz"
UnknownTZFile04:: INCBIN "gfx/tzfiles/tz_4.2bpp.tz"
UnknownTZFile15:: INCBIN "gfx/tzfiles/tz_15.2bpp.tz"
UnknownTZFile16:: INCBIN "gfx/tzfiles/tz_16.2bpp.tz"
IF DEF(POWER)
UnknownTZFile10:: INCBIN "gfx/tzfiles/tz_10_power.2bpp.tz"
UnknownTZFile11:: INCBIN "gfx/tzfiles/tz_11_power.2bpp.tz"
ELSE
UnknownTZFile10:: INCBIN "gfx/tzfiles/tz_10_speed.2bpp.tz"
UnknownTZFile11:: INCBIN "gfx/tzfiles/tz_11_speed.2bpp.tz"
ENDC
UnknownTZFile06:: INCBIN "gfx/tzfiles/tz_6.2bpp.tz"
UnknownTZFile14:: INCBIN "gfx/tzfiles/tz_14.2bpp.tz"
UnknownTZFile02:: INCBIN "gfx/tzfiles/tz_2.2bpp.tz"
UnknownTZFile20:: INCBIN "gfx/tzfiles/tz_20.2bpp.tz"
UnknownTZFile21:: INCBIN "gfx/tzfiles/tz_21.2bpp.tz"
UnknownTZFile24:: INCBIN "gfx/tzfiles/tz_24.2bpp.tz"

Data_da4f9:: INCBIN "data/unknown_da4f9.bin"

SECTION "bank 37", ROMX, BANK [$37]
UnknownTZFile17:: INCBIN "gfx/tzfiles/tz_17.2bpp.tz"
UnknownTZFile01:: INCBIN "gfx/tzfiles/tz_1.2bpp.tz"
UnknownTZFile12:: INCBIN "gfx/tzfiles/tz_12.2bpp.tz"
UnknownTZFile07:: INCBIN "gfx/tzfiles/tz_7.2bpp.tz"
UnknownTZFile08:: INCBIN "gfx/tzfiles/tz_8.2bpp.tz"
UnknownTZFile09:: INCBIN "gfx/tzfiles/tz_9.2bpp.tz"
UnknownTZFile22:: INCBIN "gfx/tzfiles/tz_22.2bpp.tz"
UnknownTZFile19:: INCBIN "gfx/tzfiles/tz_19.2bpp.tz"
UnknownTZFile05:: INCBIN "gfx/tzfiles/tz_5.2bpp.tz"
UnknownTZFile25:: INCBIN "gfx/tzfiles/tz_25.2bpp.tz"
UnknownTZFile26:: INCBIN "gfx/tzfiles/tz_26.2bpp.tz"
UnknownTZFile27:: INCBIN "gfx/tzfiles/tz_27.2bpp.tz"
UnknownTZFile13:: INCBIN "gfx/tzfiles/tz_13.2bpp.tz"
UnknownTZFile18:: INCBIN "gfx/tzfiles/tz_18.2bpp.tz"
UnknownTZFile23:: INCBIN "gfx/tzfiles/tz_23.2bpp.tz"
UnknownTZFile72:: INCBIN "gfx/tzfiles/tz_72.2bpp.tz"

Phone1GFX:: INCBIN "gfx/phone/phone1.2bpp"
Phone2GFX:: INCBIN "gfx/phone/phone2.2bpp"
Phone3GFX:: INCBIN "gfx/phone/phone3.2bpp"

GFX_de95f: INCBIN "gfx/phone/de95f.2bpp"
GFX_dea5f: INCBIN "gfx/phone/dea5f.w64.2bpp"

GFX_dee5f: INCBIN "gfx/phone/dee5f.w24.2bpp"
GFX_dee8f: INCBIN "gfx/phone/dee8f.w24.2bpp"
GFX_deebf: INCBIN "gfx/phone/deebf.w24.2bpp"
GFX_deeef: INCBIN "gfx/phone/deeef.w24.2bpp"
GFX_def1f: INCBIN "gfx/phone/def1f.w24.2bpp"
GFX_def4f: INCBIN "gfx/phone/def4f.w24.2bpp"
GFX_def7f: INCBIN "gfx/phone/def7f.w24.2bpp"
GFX_defaf: INCBIN "gfx/phone/defaf.w24.2bpp"
GFX_defdf: INCBIN "gfx/phone/defdf.w24.2bpp"

GFX_df00f: INCBIN "gfx/phone/df00f.w64.2bpp"
GFX_df08f: INCBIN "gfx/phone/df08f.w64.2bpp"

SECTION "bank 38", ROMX, BANK [$38]
GFX_e0000:: INCBIN "gfx/misc/e0000.2bpp"
GFX_e00c0:: INCBIN "gfx/misc/e00c0.2bpp"
GFX_e01f0:: INCBIN "gfx/misc/e01f0.2bpp"
GFX_e0320:: INCBIN "gfx/misc/e0320.2bpp"

TileMap_e03a0:: INCBIN "gfx/misc/e03a0.tilemap"
TileMap_e03c8:: INCBIN "gfx/misc/e03c8.tilemap"
TileMap_e03f0:: INCBIN "gfx/misc/e03f0.tilemap"

GFX_e0418:: INCBIN "gfx/misc/e0418.w24.2bpp"
GFX_e0478:: INCBIN "gfx/misc/e0478.w24.2bpp"

ReceptionBarsGFX:: INCBIN "gfx/misc/reception_bars.w24.2bpp"

GFX_e06b8:: INCBIN "gfx/misc/e06b8.2bpp"
GFX_e0778:: INCBIN "gfx/misc/e0778.w24.2bpp"
GFX_e0898:: INCBIN "gfx/misc/e0898.w16.2bpp"
GFX_e0918:: INCBIN "gfx/misc/e0918.w24.2bpp"
GFX_e0978:: INCBIN "gfx/misc/e0978.w24.2bpp"

GFX_e09d8:: INCBIN "gfx/misc/e09d8.2bpp"
GFX_e0b08:: INCBIN "gfx/misc/cursor.2bpp"
GFX_e0b38:: INCBIN "gfx/misc/e0b38.1bpp"
GFX_e0bb8:: INCBIN "gfx/misc/e0bb8.1bpp"

Tilemap_e0c38: INCBIN "gfx/misc/e0c38.tilemap"
Tilemap_e0c88: INCBIN "gfx/misc/e0c88.tilemap"
Tilemap_e0cb0: INCBIN "gfx/misc/e0cb0.tilemap"

PhoneCallTextBoxFrame: INCBIN "gfx/misc/e0d28.2bpp"
GFX_e0e18: INCBIN "gfx/misc/e0e18.2bpp"
GFX_e0eb8: INCBIN "gfx/misc/e0eb8.2bpp"
GFX_e0f58: INCBIN "gfx/misc/e0f58.2bpp"
TileMap_e1038:: INCBIN "data/e1038.tilemap"
GFX_e1118: INCBIN "gfx/misc/e1118.2bpp"
GFX_e11f8: INCBIN "gfx/misc/e11f8.2bpp"
GFX_e1208: INCBIN "gfx/misc/e1208.w32.2bpp"
GFX_e1288: INCBIN "gfx/misc/e1288.w32.2bpp"
GFX_e1308: INCBIN "gfx/misc/e1308.2bpp"
GFX_e1348: INCBIN "gfx/misc/e1348.2bpp"
GFX_e1448: INCBIN "gfx/misc/e1448.2bpp"

Tilemap_e1548: INCBIN "gfx/misc/e1548.tilemap"

GFX_e1560: INCBIN "gfx/misc/e1560.2bpp"
GFX_e1650: INCBIN "gfx/misc/e1650.2bpp"

Pointers_e1690:
	dw Data_e16c0
	dw Data_e16c0
	dw Data_e16f1
	dw Data_e1722
	dw Data_e16f1
	dw Data_e1723
	dw Data_e172a
	dw Data_e172b
	dw Data_e172c
	dw Data_e172d
	dw Data_e172e
	dw Data_e172f
	dw Data_e1730
	dw Data_e1731
	dw Data_e1732
	dw Data_e1733
	dw Data_e1734
	dw Data_e1735
	dw Data_e1736
	dw Data_e1737
	dw Data_e1738
	dw Data_e1739
	dw Data_e173a
	dw Data_e173b

Data_e16c0:
	db 8
	db $0f, 0
	dw GFX_e17bc, VTilesBG tile $1b

	db $0f, 0
	dw GFX_e17fc, VTilesBG tile $1e

	db $0f, 1
	dw GFX_e183c, VTilesBG tile $24

	db $0f, 1
	dw GFX_e187c, VTilesBG tile $44

	db $1f, 2
	dw GFX_e18bc, VTilesBG tile $40

	db $1f, 2
	dw GFX_e191c, VTilesBG tile $6a

	db $1f, 2
	dw GFX_e18dc, VTilesBG tile $1a

	db $1f, 2
	dw GFX_e193c, VTilesBG tile $6b

Data_e16f1:
	db 8
	db $0f, 0
	dw GFX_e17bc, VTilesBG tile $16

	db $0f, 0
	dw GFX_e17fc, VTilesBG tile $19

	db $0f, 1
	dw GFX_e183c, VTilesBG tile $17

	db $0f, 1
	dw GFX_e187c, VTilesBG tile $1a

	db $1f, 2
	dw GFX_e18bc, VTilesBG tile $1b

	db $1f, 2
	dw GFX_e191c, VTilesBG tile $1d

	db $1f, 2
	dw GFX_e18dc, VTilesBG tile $1c

	db $1f, 2
	dw GFX_e193c, VTilesBG tile $1e

Data_e1722:
	db 0

Data_e1723:
	db 1
	db $1f, 0
	dw GFX_e177c, VTilesBG tile $27

Data_e172a:
	db 0

Data_e172b:
	db 0

Data_e172c:
	db 0

Data_e172d:
	db 0

Data_e172e:
	db 0

Data_e172f:
	db 0

Data_e1730:
	db 0

Data_e1731:
	db 0

Data_e1732:
	db 0

Data_e1733:
	db 0

Data_e1734:
	db 0

Data_e1735:
	db 0

Data_e1736:
	db 0

Data_e1737:
	db 0

Data_e1738:
	db 0

Data_e1739:
	db 0

Data_e173a:
	db 0

Data_e173b:
	db 0

GFX_e173c: INCBIN "gfx/overworld/e173c.2bpp"
GFX_e175c: INCBIN "gfx/overworld/e175c.2bpp"
GFX_e177c: INCBIN "gfx/overworld/e177c.2bpp"
GFX_e179c: INCBIN "gfx/overworld/e179c.2bpp"
GFX_e17bc: INCBIN "gfx/overworld/e17bc.2bpp"
GFX_e17dc: INCBIN "gfx/overworld/e17dc.2bpp"
GFX_e17fc: INCBIN "gfx/overworld/e17fc.2bpp"
GFX_e181c: INCBIN "gfx/overworld/e181c.2bpp"
GFX_e183c: INCBIN "gfx/overworld/e183c.2bpp"
GFX_e185c: INCBIN "gfx/overworld/e185c.2bpp"
GFX_e187c: INCBIN "gfx/overworld/e187c.2bpp"
GFX_e189c: INCBIN "gfx/overworld/e189c.2bpp"
GFX_e18bc: INCBIN "gfx/overworld/e18bc.2bpp"
GFX_e18dc: INCBIN "gfx/overworld/e18dc.2bpp"
GFX_e18fc: INCBIN "gfx/overworld/e18fc.2bpp"
GFX_e191c: INCBIN "gfx/overworld/e191c.2bpp"
GFX_e193c: INCBIN "gfx/overworld/e193c.2bpp"
GFX_e195c: INCBIN "gfx/overworld/e195c.2bpp"

GFX_e197c: INCBIN "gfx/misc/e197c.2bpp"
GFX_e19fc: INCBIN "gfx/misc/e19fc.tilemap"
GFX_e1b64: INCBIN "gfx/misc/minimap.tilemap"
GFX_e1d64: INCBIN "gfx/misc/e1d64.2bpp"
GFX_e2564: INCBIN "gfx/misc/e2564.2bpp"
GFX_e27c4: INCBIN "gfx/misc/e27c4.w64.t7.2bpp"

Data_e2c54::
	db $00, $01, $02, $03, $04, $05, $06, $07, $08, $09, $0a, $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b, $1c, $1d, $1e, $1f
	db $20, $21, $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e, $2f
	db $30, $31, $32, $33, $34, $35, $36, $37, $38, $39, $3a, $3b, $3c, $3d, $3e, $3f
	db $40, $41, $42, $43, $44, $45, $46, $47, $48, $49, $4a, $4b, $4c, $4d, $4e, $4f
	db $50, $51, $52, $53, $54, $55, $56, $57, $58, $59, $5a, $5b, $5c, $5d, $5e, $5f
	db $60, $61, $62, $63, $64, $65, $66, $67, $68, $69, $6a, $6b, $6c, $6d, $6e, $6f
	db $70, $71, $72, $73, $74, $75, $76, $77, $78, $79, $7a, $7b, $7c, $7d, $7e, $7f
	db $80, $81, $82, $83, $84, $85, $86, $87, $90, $91, $92, $93, $94, $95, $96, $97
	db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7, $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7
	db $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7
	db $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $f0, $f1, $f2, $f3, $f4, $f5, $f6, $f7

Data_e2d14::
	db $88, $89, $8a, $8b, $8c, $8d, $8e, $8f, $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
	db $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af, $b8, $b9, $ba, $bb, $bc, $bd, $be, $bf
	db $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf, $d8, $d9, $da, $db, $dc, $dd, $de, $df
	db $e8, $e9, $ea, $eb, $ec, $ed, $ee, $ef, $f8, $f9, $fa, $fb, $fc, $fd, $fe, $ff

GFX_e2d54: INCBIN "gfx/misc/e2d54.w40.interleave.2bpp"
GFX_e2e94: INCBIN "gfx/misc/e2e94.2bpp"
GFX_e2eb4: INCBIN "gfx/misc/e2eb4.2bpp"
GFX_e2ed4: INCBIN "gfx/misc/e2ed4.w16.2bpp"
GFX_e2f94: INCBIN "gfx/misc/e2f94.2bpp"
Tilemap_e2fa4: INCBIN "gfx/misc/e2fa4.tilemap"
GFX_e310c: INCBIN "gfx/misc/e310c.2bpp"
GFX_e318c: INCBIN "gfx/misc/e318c.2bpp"
IdleHUDFrameGFX: INCBIN "gfx/misc/e319c.2bpp"
Tilemap_e345c: INCBIN "gfx/misc/e345c.tilemap"
GFX_e3494: INCBIN "gfx/misc/e3494.2bpp"
GFX_e3514: INCBIN "gfx/misc/e3514.t2.2bpp"
GFX_e3674: INCBIN "gfx/misc/e3674.2bpp"
Tilemap_e3784: INCBIN "gfx/misc/e3784.tilemap"
Tilemap_e38ec: INCBIN "gfx/misc/e38ec.tilemap"

SECTION "bank 39", ROMX, BANK [$39]
IF DEF(POWER)
UnknownTZFile48:: INCBIN "gfx/tzfiles/tz_48_power.2bpp.tz"
UnknownTZFile49:: INCBIN "gfx/tzfiles/tz_49_power.2bpp.tz"
ELSE
UnknownTZFile48:: INCBIN "gfx/tzfiles/tz_48_speed.2bpp.tz"
UnknownTZFile49:: INCBIN "gfx/tzfiles/tz_49_speed.2bpp.tz"
ENDC
UnknownTZFile50:: INCBIN "gfx/tzfiles/tz_50.2bpp.tz"
UnknownTZFile51:: INCBIN "gfx/tzfiles/tz_51.2bpp.tz"
IF DEF(POWER)
UnknownTZFile52:: INCBIN "gfx/tzfiles/tz_52_power.2bpp.tz"
UnknownTZFile53:: INCBIN "gfx/tzfiles/tz_53_power.2bpp.tz"
UnknownTZFile54:: INCBIN "gfx/tzfiles/tz_54_power.2bpp.tz"
UnknownTZFile55:: INCBIN "gfx/tzfiles/tz_55_power.2bpp.tz"
UnknownTZFile56:: INCBIN "gfx/tzfiles/tz_56_power.2bpp.tz"
UnknownTZFile57:: INCBIN "gfx/tzfiles/tz_57_power.2bpp.tz"
ELSE
UnknownTZFile52:: INCBIN "gfx/tzfiles/tz_52_speed.2bpp.tz"
UnknownTZFile53:: INCBIN "gfx/tzfiles/tz_53_speed.2bpp.tz"
UnknownTZFile54:: INCBIN "gfx/tzfiles/tz_54_speed.2bpp.tz"
UnknownTZFile55:: INCBIN "gfx/tzfiles/tz_55_speed.2bpp.tz"
UnknownTZFile56:: INCBIN "gfx/tzfiles/tz_56_speed.2bpp.tz"
UnknownTZFile57:: INCBIN "gfx/tzfiles/tz_57_speed.2bpp.tz"
ENDC
UnknownTZFile80:: INCBIN "gfx/tzfiles/tz_80.2bpp.tz"
UnknownTZFile81:: INCBIN "gfx/tzfiles/tz_81.2bpp.tz"
UnknownTZFile82:: INCBIN "gfx/tzfiles/tz_82.2bpp.tz"

SECTION "bank 3A", ROMX, BANK [$3a]
UnknownTZFile58:: INCBIN "gfx/tzfiles/tz_58.2bpp.tz"
UnknownTZFile59:: INCBIN "gfx/tzfiles/tz_59.2bpp.tz"
UnknownTZFile60:: INCBIN "gfx/tzfiles/tz_60.2bpp.tz"
IF DEF(POWER)
UnknownTZFile61:: INCBIN "gfx/tzfiles/tz_61_power.2bpp.tz"
ELSE
UnknownTZFile61:: INCBIN "gfx/tzfiles/tz_61_speed.2bpp.tz"
ENDC
UnknownTZFile62:: INCBIN "gfx/tzfiles/tz_62.2bpp.tz"
UnknownTZFile63:: INCBIN "gfx/tzfiles/tz_63.2bpp.tz"
UnknownTZFile64:: INCBIN "gfx/tzfiles/tz_64.2bpp.tz"
UnknownTZFile65:: INCBIN "gfx/tzfiles/tz_65.2bpp.tz"
IF DEF(POWER)
UnknownTZFile66:: INCBIN "gfx/tzfiles/tz_66_power.2bpp.tz"
UnknownTZFile67:: INCBIN "gfx/tzfiles/tz_67_power.2bpp.tz"
ELSE
UnknownTZFile66:: INCBIN "gfx/tzfiles/tz_66_speed.2bpp.tz"
UnknownTZFile67:: INCBIN "gfx/tzfiles/tz_67_speed.2bpp.tz"
ENDC

SECTION "bank 3f", ROMX, BANK [$3f]
GFX_fc4eb:: INCBIN "gfx/misc/fc4eb.2bpp"
GFX_fcceb:: INCBIN "gfx/misc/fcceb.2bpp"

SECTION "bank 40", ROMX, BANK [$40]
INCLUDE "text/std_text_06.asm"

SECTION "bank 45", ROMX, BANK [$45]
INCLUDE "text/std_text_00.asm"
INCLUDE "text/std_text_0D.asm"

SECTION "bank 46", ROMX, BANK [$46]
INCLUDE "text/std_text_01.asm"

SECTION "bank 47", ROMX, BANK [$47]
INCLUDE "text/std_text_02.asm"

SECTION "bank 48", ROMX, BANK [$48]
INCLUDE "text/std_text_03.asm"

SECTION "bank 49", ROMX, BANK [$49]
INCLUDE "text/std_text_04.asm"

SECTION "bank 4A", ROMX, BANK [$4a]
INCLUDE "text/std_text_05.asm"
INCLUDE "text/std_text_14.asm"

SECTION "bank 4B", ROMX, BANK [$4b]
INCLUDE "text/std_text_09.asm"

SECTION "bank 4C", ROMX, BANK [$4c]
INCLUDE "text/std_text_07.asm"

SECTION "bank 4D", ROMX, BANK [$4d]
INCLUDE "text/std_text_08.asm"

UnknownTZFile30:: INCBIN "gfx/tzfiles/tz_30.2bpp.tz"
UnknownTZFile31:: INCBIN "gfx/tzfiles/tz_31.2bpp.tz"
UnknownTZFile29:: INCBIN "gfx/tzfiles/tz_29.2bpp.tz"

SECTION "bank 4E", ROMX, BANK [$4e]
INCLUDE "text/std_text_0A.asm"

SECTION "bank 4F", ROMX, BANK [$4f]
INCLUDE "text/std_text_0B.asm"

SECTION "bank 50", ROMX, BANK [$50]
INCLUDE "text/std_text_0C.asm"

SECTION "bank 51", ROMX, BANK [$51]
INCLUDE "text/std_text_0E.asm"
INCLUDE "text/std_text_0F.asm"

SECTION "bank 52", ROMX, BANK [$52]
INCLUDE "data/map_data_148000.asm"
INCLUDE "data/map_data_14956e.asm"
INCLUDE "data/map_data_149dfc.asm"
INCLUDE "data/map_data_14a97c.asm"
INCLUDE "data/map_data_14b0f8.asm"

SECTION "bank 53", ROMX, BANK [$53]
MapObjectHeaders:: INCLUDE "data/unknown_14c000.asm"
INCLUDE "data/map_data_14c668.asm"
INCLUDE "data/map_data_14d472.asm"

SECTION "bank 54", ROMX, BANK [$54]
Pointers_150000: INCLUDE "data/scripts_150000.asm"

SECTION "bank 55", ROMX, BANK [$55]
Pointers_154000: INCLUDE "data/scripts_154000.asm"

SECTION "bank 56", ROMX, BANK [$56]
INCLUDE "text/std_text_12.asm"

SECTION "bank 57", ROMX, BANK [$57]
INCLUDE "text/std_text_13.asm"

SECTION "bank 59", ROMX, BANK [$59]
UnknownTZFile32:: INCBIN "gfx/tzfiles/tz_32.2bpp.tz"
UnknownTZFile33:: INCBIN "gfx/tzfiles/tz_33.2bpp.tz"
UnknownTZFile34:: INCBIN "gfx/tzfiles/tz_34.2bpp.tz"
UnknownTZFile35:: INCBIN "gfx/tzfiles/tz_35.2bpp.tz"
UnknownTZFile36:: INCBIN "gfx/tzfiles/tz_36.2bpp.tz"
UnknownTZFile37:: INCBIN "gfx/tzfiles/tz_37.2bpp.tz"
UnknownTZFile38:: INCBIN "gfx/tzfiles/tz_38.2bpp.tz"
UnknownTZFile39:: INCBIN "gfx/tzfiles/tz_39.2bpp.tz"
UnknownTZFile40:: INCBIN "gfx/tzfiles/tz_40.2bpp.tz"
UnknownTZFile41:: INCBIN "gfx/tzfiles/tz_41.2bpp.tz"
UnknownTZFile42:: INCBIN "gfx/tzfiles/tz_42.2bpp.tz"

SECTION "bank 5E", ROMX, BANK [$5e]
INCLUDE "tilesets/data.asm"

SECTION "bank 5F", ROMX, BANK [$5f]
Tilemap_17c000: INCBIN "gfx/misc/17c000.tilemap"
Tilemap_17c168: INCBIN "gfx/misc/17c168.tilemap"
Tilemap_17c2d0: INCBIN "gfx/misc/17c2d0.tilemap"
Tilemap_17c438: INCBIN "gfx/misc/17c438.tilemap"
Tilemap_17c5a0: INCBIN "gfx/misc/17c5a0.tilemap"
Tilemap_17c708: INCBIN "gfx/misc/17c708.tilemap"

INCLUDE "data/palettes_17c870.asm"

SECTION "bank 60", ROMX, BANK [$60]
GFX_180000: INCBIN "gfx/misc/180000.w160.2bpp"
GFX_181540: INCBIN "gfx/misc/181540.w160.2bpp"
GFX_182a80: INCBIN "gfx/misc/182a80.w160.2bpp"

SECTION "bank 63", ROMX, BANK [$63]
Data_18c000:
INCBIN "maps/18c000.blk"
INCBIN "maps/18c050.blk"
INCBIN "maps/18c0a0.blk"
INCBIN "maps/18c0f0.blk"
INCBIN "maps/18c140.blk"
INCBIN "maps/18c190.blk"
INCBIN "maps/18c1e0.blk"
INCBIN "maps/18c230.blk"
INCBIN "maps/18c280.blk"
INCBIN "maps/18c2d0.blk"
INCBIN "maps/18c320.blk"
INCBIN "maps/18c370.blk"
INCBIN "maps/18c3c0.blk"
INCBIN "maps/18c410.blk"
INCBIN "maps/18c460.blk"
INCBIN "maps/18c4b0.blk"
INCBIN "maps/18c500.blk"
INCBIN "maps/18c550.blk"
INCBIN "maps/18c5a0.blk"
INCBIN "maps/18c5f0.blk"
INCBIN "maps/18c640.blk"
INCBIN "maps/18c690.blk"
INCBIN "maps/18c6e0.blk"
INCBIN "maps/18c730.blk"
INCBIN "maps/18c780.blk"
INCBIN "maps/18c7d0.blk"
INCBIN "maps/18c820.blk"
INCBIN "maps/18c870.blk"
INCBIN "maps/18c8c0.blk"
INCBIN "maps/18c910.blk"
INCBIN "maps/18c960.blk"
INCBIN "maps/18c9b0.blk"
INCBIN "maps/18ca00.blk"
INCBIN "maps/18ca50.blk"
INCBIN "maps/18caa0.blk"
INCBIN "maps/18caf0.blk"
INCBIN "maps/18cb40.blk"
INCBIN "maps/18cb90.blk"
INCBIN "maps/18cbe0.blk"
INCBIN "maps/18cc30.blk"
INCBIN "maps/18cc80.blk"
INCBIN "maps/18ccd0.blk"
INCBIN "maps/18cd20.blk"
INCBIN "maps/18cd70.blk"
INCBIN "maps/18cdc0.blk"
INCBIN "maps/18ce10.blk"
INCBIN "maps/18ce60.blk"
INCBIN "maps/18ceb0.blk"
INCBIN "maps/18cf00.blk"
INCBIN "maps/18cf50.blk"
INCBIN "maps/18cfa0.blk"
INCBIN "maps/18cff0.blk"
INCBIN "maps/18d040.blk"
INCBIN "maps/18d090.blk"
INCBIN "maps/18d0e0.blk"
INCBIN "maps/18d130.blk"
INCBIN "maps/18d180.blk"
INCBIN "maps/18d1d0.blk"
INCBIN "maps/18d220.blk"
INCBIN "maps/18d270.blk"
INCBIN "maps/18d2c0.blk"
INCBIN "maps/18d310.blk"
INCBIN "maps/18d360.blk"
INCBIN "maps/18d3b0.blk"
INCBIN "maps/18d400.blk"
INCBIN "maps/18d450.blk"
INCBIN "maps/18d4a0.blk"
INCBIN "maps/18d4f0.blk"
INCBIN "maps/18d540.blk"
INCBIN "maps/18d590.blk"
INCBIN "maps/18d5e0.blk"
INCBIN "maps/18d630.blk"
INCBIN "maps/18d680.blk"
INCBIN "maps/18d6d0.blk"
INCBIN "maps/18d720.blk"
INCBIN "maps/18d770.blk"
INCBIN "maps/18d7c0.blk"
INCBIN "maps/18d810.blk"
INCBIN "maps/18d860.blk"
INCBIN "maps/18d8b0.blk"
INCBIN "maps/18d900.blk"
INCBIN "maps/18d950.blk"
INCBIN "maps/18d9a0.blk"
INCBIN "maps/18d9f0.blk"
INCBIN "maps/18da40.blk"
INCBIN "maps/18da90.blk"
INCBIN "maps/18dae0.blk"
INCBIN "maps/18db30.blk"
INCBIN "maps/18db80.blk"
INCBIN "maps/18dbd0.blk"
INCBIN "maps/18dc20.blk"
INCBIN "maps/18dc70.blk"

SECTION "bank 64", ROMX, BANK [$64]
Data_190000:
INCBIN "maps/190000.blk"
INCBIN "maps/190050.blk"
INCBIN "maps/1900a0.blk"
INCBIN "maps/1900f0.blk"
INCBIN "maps/190140.blk"
INCBIN "maps/190190.blk"
INCBIN "maps/1901e0.blk"
INCBIN "maps/190230.blk"
INCBIN "maps/190280.blk"
INCBIN "maps/1902d0.blk"
INCBIN "maps/190320.blk"
INCBIN "maps/190370.blk"
INCBIN "maps/1903c0.blk"
INCBIN "maps/190410.blk"
INCBIN "maps/190460.blk"
INCBIN "maps/1904b0.blk"
INCBIN "maps/190500.blk"
INCBIN "maps/190550.blk"
INCBIN "maps/1905a0.blk"
INCBIN "maps/1905f0.blk"
INCBIN "maps/190640.blk"
INCBIN "maps/190690.blk"
INCBIN "maps/1906e0.blk"
INCBIN "maps/190730.blk"
INCBIN "maps/190780.blk"
INCBIN "maps/1907d0.blk"
INCBIN "maps/190820.blk"
INCBIN "maps/190870.blk"
INCBIN "maps/1908c0.blk"
INCBIN "maps/190910.blk"
INCBIN "maps/190960.blk"
INCBIN "maps/1909b0.blk"
INCBIN "maps/190a00.blk"
INCBIN "maps/190a50.blk"
INCBIN "maps/190aa0.blk"
INCBIN "maps/190af0.blk"
INCBIN "maps/190b40.blk"
INCBIN "maps/190b90.blk"
INCBIN "maps/190be0.blk"
INCBIN "maps/190c30.blk"
INCBIN "maps/190c80.blk"
INCBIN "maps/190cd0.blk"
INCBIN "maps/190d20.blk"
INCBIN "maps/190d70.blk"
INCBIN "maps/190dc0.blk"
INCBIN "maps/190e10.blk"
INCBIN "maps/190e60.blk"
INCBIN "maps/190eb0.blk"
INCBIN "maps/190f00.blk"
INCBIN "maps/190f50.blk"
INCBIN "maps/190fa0.blk"
INCBIN "maps/190ff0.blk"
INCBIN "maps/191040.blk"
INCBIN "maps/191090.blk"
INCBIN "maps/1910e0.blk"
INCBIN "maps/191130.blk"
INCBIN "maps/191180.blk"
INCBIN "maps/1911d0.blk"
INCBIN "maps/191220.blk"
INCBIN "maps/191270.blk"
INCBIN "maps/1912c0.blk"
INCBIN "maps/191310.blk"
INCBIN "maps/191360.blk"
INCBIN "maps/1913b0.blk"
INCBIN "maps/191400.blk"
INCBIN "maps/191450.blk"
INCBIN "maps/1914a0.blk"
INCBIN "maps/1914f0.blk"
INCBIN "maps/191540.blk"
INCBIN "maps/191590.blk"
INCBIN "maps/1915e0.blk"
INCBIN "maps/191630.blk"
INCBIN "maps/191680.blk"
INCBIN "maps/1916d0.blk"
INCBIN "maps/191720.blk"
INCBIN "maps/191770.blk"
INCBIN "maps/1917c0.blk"
INCBIN "maps/191810.blk"
INCBIN "maps/191860.blk"
INCBIN "maps/1918b0.blk"
INCBIN "maps/191900.blk"
INCBIN "maps/191950.blk"
INCBIN "maps/1919a0.blk"
INCBIN "maps/1919f0.blk"
INCBIN "maps/191a40.blk"
INCBIN "maps/191a90.blk"
INCBIN "maps/191ae0.blk"
INCBIN "maps/191b30.blk"
INCBIN "maps/191b80.blk"
INCBIN "maps/191bd0.blk"
INCBIN "maps/191c20.blk"
INCBIN "maps/191c70.blk"
INCBIN "maps/191cc0.blk"
INCBIN "maps/191d10.blk"
INCBIN "maps/191d60.blk"
INCBIN "maps/191db0.blk"
INCBIN "maps/191e00.blk"
INCBIN "maps/191e50.blk"
INCBIN "maps/191ea0.blk"
INCBIN "maps/191ef0.blk"
INCBIN "maps/191f40.blk"
INCBIN "maps/191f90.blk"
INCBIN "maps/191fe0.blk"
INCBIN "maps/192030.blk"
INCBIN "maps/192080.blk"
INCBIN "maps/1920d0.blk"
INCBIN "maps/192120.blk"
INCBIN "maps/192170.blk"
INCBIN "maps/1921c0.blk"
INCBIN "maps/192210.blk"
INCBIN "maps/192260.blk"
INCBIN "maps/1922b0.blk"
INCBIN "maps/192300.blk"
INCBIN "maps/192350.blk"
INCBIN "maps/1923a0.blk"
INCBIN "maps/1923f0.blk"
INCBIN "maps/192440.blk"
INCBIN "maps/192490.blk"
INCBIN "maps/1924e0.blk"
INCBIN "maps/192530.blk"
INCBIN "maps/192580.blk"
INCBIN "maps/1925d0.blk"
INCBIN "maps/192620.blk"
INCBIN "maps/192670.blk"
INCBIN "maps/1926c0.blk"
INCBIN "maps/192710.blk"
INCBIN "maps/192760.blk"
INCBIN "maps/1927b0.blk"
INCBIN "maps/192800.blk"
INCBIN "maps/192850.blk"
INCBIN "maps/1928a0.blk"
INCBIN "maps/1928f0.blk"
INCBIN "maps/192940.blk"
INCBIN "maps/192990.blk"
INCBIN "maps/1929e0.blk"
INCBIN "maps/192a30.blk"
INCBIN "maps/192a80.blk"
INCBIN "maps/192ad0.blk"
INCBIN "maps/192b20.blk"
INCBIN "maps/192b70.blk"
INCBIN "maps/192bc0.blk"
INCBIN "maps/192c10.blk"
INCBIN "maps/192c60.blk"
INCBIN "maps/192cb0.blk"
INCBIN "maps/192d00.blk"
INCBIN "maps/192d50.blk"
INCBIN "maps/192da0.blk"

SECTION "bank 65", ROMX, BANK [$65]
Data_194000:
INCBIN "maps/194000.blk"
INCBIN "maps/194050.blk"
INCBIN "maps/1940a0.blk"
INCBIN "maps/1940f0.blk"
INCBIN "maps/194140.blk"
INCBIN "maps/194190.blk"
INCBIN "maps/1941e0.blk"
INCBIN "maps/194230.blk"
INCBIN "maps/194280.blk"
INCBIN "maps/1942d0.blk"
INCBIN "maps/194320.blk"
INCBIN "maps/194370.blk"
INCBIN "maps/1943c0.blk"
INCBIN "maps/194410.blk"
INCBIN "maps/194460.blk"
INCBIN "maps/1944b0.blk"
INCBIN "maps/194500.blk"
INCBIN "maps/194550.blk"
INCBIN "maps/1945a0.blk"
INCBIN "maps/1945f0.blk"
INCBIN "maps/194640.blk"
INCBIN "maps/194690.blk"
INCBIN "maps/1946e0.blk"
INCBIN "maps/194730.blk"
INCBIN "maps/194780.blk"
INCBIN "maps/1947d0.blk"
INCBIN "maps/194820.blk"
INCBIN "maps/194870.blk"
INCBIN "maps/1948c0.blk"
INCBIN "maps/194910.blk"
INCBIN "maps/194960.blk"
INCBIN "maps/1949b0.blk"
INCBIN "maps/194a00.blk"
INCBIN "maps/194a50.blk"
INCBIN "maps/194aa0.blk"
INCBIN "maps/194af0.blk"
INCBIN "maps/194b40.blk"
INCBIN "maps/194b90.blk"
INCBIN "maps/194be0.blk"
INCBIN "maps/194c30.blk"
INCBIN "maps/194c80.blk"
INCBIN "maps/194cd0.blk"
INCBIN "maps/194d20.blk"
INCBIN "maps/194d70.blk"
INCBIN "maps/194dc0.blk"
INCBIN "maps/194e10.blk"
INCBIN "maps/194e60.blk"
INCBIN "maps/194eb0.blk"
INCBIN "maps/194f00.blk"
INCBIN "maps/194f50.blk"
INCBIN "maps/194fa0.blk"
INCBIN "maps/194ff0.blk"
INCBIN "maps/195040.blk"
INCBIN "maps/195090.blk"
INCBIN "maps/1950e0.blk"
INCBIN "maps/195130.blk"
INCBIN "maps/195180.blk"
INCBIN "maps/1951d0.blk"
INCBIN "maps/195220.blk"
INCBIN "maps/195270.blk"
INCBIN "maps/1952c0.blk"
INCBIN "maps/195310.blk"
INCBIN "maps/195360.blk"
INCBIN "maps/1953b0.blk"
INCBIN "maps/195400.blk"
INCBIN "maps/195450.blk"
INCBIN "maps/1954a0.blk"
INCBIN "maps/1954f0.blk"
INCBIN "maps/195540.blk"
INCBIN "maps/195590.blk"
INCBIN "maps/1955e0.blk"
INCBIN "maps/195630.blk"
INCBIN "maps/195680.blk"
INCBIN "maps/1956d0.blk"
INCBIN "maps/195720.blk"
INCBIN "maps/195770.blk"
INCBIN "maps/1957c0.blk"
INCBIN "maps/195810.blk"
INCBIN "maps/195860.blk"
INCBIN "maps/1958b0.blk"
INCBIN "maps/195900.blk"
INCBIN "maps/195950.blk"
INCBIN "maps/1959a0.blk"
INCBIN "maps/1959f0.blk"
INCBIN "maps/195a40.blk"
INCBIN "maps/195a90.blk"
INCBIN "maps/195ae0.blk"
INCBIN "maps/195b30.blk"
INCBIN "maps/195b80.blk"
INCBIN "maps/195bd0.blk"
INCBIN "maps/195c20.blk"
INCBIN "maps/195c70.blk"
INCBIN "maps/195cc0.blk"
INCBIN "maps/195d10.blk"
INCBIN "maps/195d60.blk"
INCBIN "maps/195db0.blk"
INCBIN "maps/195e00.blk"
INCBIN "maps/195e50.blk"
INCBIN "maps/195ea0.blk"
INCBIN "maps/195ef0.blk"
INCBIN "maps/195f40.blk"
INCBIN "maps/195f90.blk"
INCBIN "maps/195fe0.blk"
INCBIN "maps/196030.blk"
INCBIN "maps/196080.blk"
INCBIN "maps/1960d0.blk"
INCBIN "maps/196120.blk"
INCBIN "maps/196170.blk"
INCBIN "maps/1961c0.blk"
INCBIN "maps/196210.blk"
INCBIN "maps/196260.blk"
INCBIN "maps/1962b0.blk"
INCBIN "maps/196300.blk"
INCBIN "maps/196350.blk"
INCBIN "maps/1963a0.blk"
INCBIN "maps/1963f0.blk"
INCBIN "maps/196440.blk"
INCBIN "maps/196490.blk"
INCBIN "maps/1964e0.blk"
INCBIN "maps/196530.blk"
INCBIN "maps/196580.blk"
INCBIN "maps/1965d0.blk"
INCBIN "maps/196620.blk"
INCBIN "maps/196670.blk"
INCBIN "maps/1966c0.blk"
INCBIN "maps/196710.blk"
INCBIN "maps/196760.blk"
INCBIN "maps/1967b0.blk"
INCBIN "maps/196800.blk"
INCBIN "maps/196850.blk"
INCBIN "maps/1968a0.blk"
INCBIN "maps/1968f0.blk"
INCBIN "maps/196940.blk"
INCBIN "maps/196990.blk"
INCBIN "maps/1969e0.blk"
INCBIN "maps/196a30.blk"
INCBIN "maps/196a80.blk"
INCBIN "maps/196ad0.blk"
INCBIN "maps/196b20.blk"
INCBIN "maps/196b70.blk"
INCBIN "maps/196bc0.blk"
INCBIN "maps/196c10.blk"
INCBIN "maps/196c60.blk"
INCBIN "maps/196cb0.blk"
INCBIN "maps/196d00.blk"
INCBIN "maps/196d50.blk"
INCBIN "maps/196da0.blk"
INCBIN "maps/196df0.blk"
INCBIN "maps/196e40.blk"
INCBIN "maps/196e90.blk"
INCBIN "maps/196ee0.blk"
INCBIN "maps/196f30.blk"
INCBIN "maps/196f80.blk"
INCBIN "maps/196fd0.blk"
INCBIN "maps/197020.blk"
INCBIN "maps/197070.blk"
INCBIN "maps/1970c0.blk"
INCBIN "maps/197110.blk"
INCBIN "maps/197160.blk"
INCBIN "maps/1971b0.blk"
INCBIN "maps/197200.blk"
INCBIN "maps/197250.blk"
INCBIN "maps/1972a0.blk"
INCBIN "maps/1972f0.blk"
INCBIN "maps/197340.blk"
INCBIN "maps/197390.blk"
INCBIN "maps/1973e0.blk"
INCBIN "maps/197430.blk"
INCBIN "maps/197480.blk"
INCBIN "maps/1974d0.blk"
INCBIN "maps/197520.blk"
INCBIN "maps/197570.blk"
INCBIN "maps/1975c0.blk"
INCBIN "maps/197610.blk"
INCBIN "maps/197660.blk"
INCBIN "maps/1976b0.blk"
INCBIN "maps/197700.blk"
INCBIN "maps/197750.blk"
INCBIN "maps/1977a0.blk"
INCBIN "maps/1977f0.blk"
INCBIN "maps/197840.blk"
INCBIN "maps/197890.blk"
INCBIN "maps/1978e0.blk"
INCBIN "maps/197930.blk"
INCBIN "maps/197980.blk"
INCBIN "maps/1979d0.blk"
INCBIN "maps/197a20.blk"
INCBIN "maps/197a70.blk"
INCBIN "maps/197ac0.blk"
INCBIN "maps/197b10.blk"
INCBIN "maps/197b60.blk"
INCBIN "maps/197bb0.blk"
INCBIN "maps/197c00.blk"
INCBIN "maps/197c50.blk"
INCBIN "maps/197ca0.blk"
INCBIN "maps/197cf0.blk"
INCBIN "maps/197d40.blk"
INCBIN "maps/197d90.blk"

SECTION "bank 66", ROMX, BANK [$66]
Data_198000:
INCBIN "maps/198000.blk"
INCBIN "maps/198050.blk"
INCBIN "maps/1980a0.blk"
INCBIN "maps/1980f0.blk"
INCBIN "maps/198140.blk"
INCBIN "maps/198190.blk"
INCBIN "maps/1981e0.blk"
INCBIN "maps/198230.blk"
INCBIN "maps/198280.blk"
INCBIN "maps/1982d0.blk"
INCBIN "maps/198320.blk"
INCBIN "maps/198370.blk"
INCBIN "maps/1983c0.blk"
INCBIN "maps/198410.blk"
INCBIN "maps/198460.blk"
INCBIN "maps/1984b0.blk"
INCBIN "maps/198500.blk"
INCBIN "maps/198550.blk"
INCBIN "maps/1985a0.blk"
INCBIN "maps/1985f0.blk"
INCBIN "maps/198640.blk"
INCBIN "maps/198690.blk"
INCBIN "maps/1986e0.blk"
INCBIN "maps/198730.blk"
INCBIN "maps/198780.blk"
INCBIN "maps/1987d0.blk"
INCBIN "maps/198820.blk"
INCBIN "maps/198870.blk"
INCBIN "maps/1988c0.blk"
INCBIN "maps/198910.blk"
INCBIN "maps/198960.blk"
INCBIN "maps/1989b0.blk"
INCBIN "maps/198a00.blk"
INCBIN "maps/198a50.blk"
INCBIN "maps/198aa0.blk"
INCBIN "maps/198af0.blk"
INCBIN "maps/198b40.blk"
INCBIN "maps/198b90.blk"
INCBIN "maps/198be0.blk"
INCBIN "maps/198c30.blk"
INCBIN "maps/198c80.blk"
INCBIN "maps/198cd0.blk"
INCBIN "maps/198d20.blk"
INCBIN "maps/198d70.blk"
INCBIN "maps/198dc0.blk"
INCBIN "maps/198e10.blk"
INCBIN "maps/198e60.blk"
INCBIN "maps/198eb0.blk"
INCBIN "maps/198f00.blk"
INCBIN "maps/198f50.blk"
INCBIN "maps/198fa0.blk"
INCBIN "maps/198ff0.blk"
INCBIN "maps/199040.blk"
INCBIN "maps/199090.blk"
INCBIN "maps/1990e0.blk"
INCBIN "maps/199130.blk"
INCBIN "maps/199180.blk"
INCBIN "maps/1991d0.blk"
INCBIN "maps/199220.blk"
INCBIN "maps/199270.blk"
INCBIN "maps/1992c0.blk"
INCBIN "maps/199310.blk"
INCBIN "maps/199360.blk"
INCBIN "maps/1993b0.blk"
INCBIN "maps/199400.blk"
INCBIN "maps/199450.blk"
INCBIN "maps/1994a0.blk"
INCBIN "maps/1994f0.blk"
INCBIN "maps/199540.blk"
INCBIN "maps/199590.blk"
INCBIN "maps/1995e0.blk"
INCBIN "maps/199630.blk"
INCBIN "maps/199680.blk"
INCBIN "maps/1996d0.blk"
INCBIN "maps/199720.blk"
INCBIN "maps/199770.blk"
INCBIN "maps/1997c0.blk"
INCBIN "maps/199810.blk"
INCBIN "maps/199860.blk"
INCBIN "maps/1998b0.blk"
INCBIN "maps/199900.blk"
INCBIN "maps/199950.blk"
INCBIN "maps/1999a0.blk"
INCBIN "maps/1999f0.blk"
INCBIN "maps/199a40.blk"
INCBIN "maps/199a90.blk"
INCBIN "maps/199ae0.blk"
INCBIN "maps/199b30.blk"
INCBIN "maps/199b80.blk"
INCBIN "maps/199bd0.blk"
INCBIN "maps/199c20.blk"
INCBIN "maps/199c70.blk"
INCBIN "maps/199cc0.blk"
INCBIN "maps/199d10.blk"
INCBIN "maps/199d60.blk"
INCBIN "maps/199db0.blk"
INCBIN "maps/199e00.blk"
INCBIN "maps/199e50.blk"
INCBIN "maps/199ea0.blk"
INCBIN "maps/199ef0.blk"
INCBIN "maps/199f40.blk"
INCBIN "maps/199f90.blk"
INCBIN "maps/199fe0.blk"
INCBIN "maps/19a030.blk"
INCBIN "maps/19a080.blk"
INCBIN "maps/19a0d0.blk"
INCBIN "maps/19a120.blk"
INCBIN "maps/19a170.blk"
INCBIN "maps/19a1c0.blk"
INCBIN "maps/19a210.blk"
INCBIN "maps/19a260.blk"
INCBIN "maps/19a2b0.blk"
INCBIN "maps/19a300.blk"
INCBIN "maps/19a350.blk"
INCBIN "maps/19a3a0.blk"
INCBIN "maps/19a3f0.blk"
INCBIN "maps/19a440.blk"
INCBIN "maps/19a490.blk"
INCBIN "maps/19a4e0.blk"
INCBIN "maps/19a530.blk"
INCBIN "maps/19a580.blk"
INCBIN "maps/19a5d0.blk"
INCBIN "maps/19a620.blk"
INCBIN "maps/19a670.blk"
INCBIN "maps/19a6c0.blk"
INCBIN "maps/19a710.blk"
INCBIN "maps/19a760.blk"
INCBIN "maps/19a7b0.blk"
INCBIN "maps/19a800.blk"
INCBIN "maps/19a850.blk"
INCBIN "maps/19a8a0.blk"
INCBIN "maps/19a8f0.blk"
INCBIN "maps/19a940.blk"
INCBIN "maps/19a990.blk"
INCBIN "maps/19a9e0.blk"
INCBIN "maps/19aa30.blk"
INCBIN "maps/19aa80.blk"
INCBIN "maps/19aad0.blk"
INCBIN "maps/19ab20.blk"
INCBIN "maps/19ab70.blk"
INCBIN "maps/19abc0.blk"
INCBIN "maps/19ac10.blk"
INCBIN "maps/19ac60.blk"
INCBIN "maps/19acb0.blk"
INCBIN "maps/19ad00.blk"
INCBIN "maps/19ad50.blk"
INCBIN "maps/19ada0.blk"
INCBIN "maps/19adf0.blk"
INCBIN "maps/19ae40.blk"
INCBIN "maps/19ae90.blk"
INCBIN "maps/19aee0.blk"
INCBIN "maps/19af30.blk"
INCBIN "maps/19af80.blk"
INCBIN "maps/19afd0.blk"
INCBIN "maps/19b020.blk"
INCBIN "maps/19b070.blk"
INCBIN "maps/19b0c0.blk"
INCBIN "maps/19b110.blk"
INCBIN "maps/19b160.blk"
INCBIN "maps/19b1b0.blk"
INCBIN "maps/19b200.blk"
INCBIN "maps/19b250.blk"
INCBIN "maps/19b2a0.blk"
INCBIN "maps/19b2f0.blk"
INCBIN "maps/19b340.blk"
INCBIN "maps/19b390.blk"
INCBIN "maps/19b3e0.blk"
INCBIN "maps/19b430.blk"
INCBIN "maps/19b480.blk"
INCBIN "maps/19b4d0.blk"
INCBIN "maps/19b520.blk"
INCBIN "maps/19b570.blk"
INCBIN "maps/19b5c0.blk"
INCBIN "maps/19b610.blk"
INCBIN "maps/19b660.blk"
INCBIN "maps/19b6b0.blk"
INCBIN "maps/19b700.blk"
INCBIN "maps/19b750.blk"
INCBIN "maps/19b7a0.blk"
INCBIN "maps/19b7f0.blk"
INCBIN "maps/19b840.blk"
INCBIN "maps/19b890.blk"
INCBIN "maps/19b8e0.blk"

SECTION "bank 67", ROMX, BANK [$67]
INCLUDE "data/unknown_19c000.asm"

Pointers_19e8ed::
macro_19e8ed: MACRO
	db \1
	dn \2, \3
	db \4, \5
	ENDM

	dw Data_19e957
	dw Data_19e958
	dw Data_19e959
	dw Data_19e95e
	dw Data_19e95f
	dw Data_19e968
	dw Data_19e959
	dw Data_19e95e
	dw Data_19e95f
	dw Data_19e968
	dw Data_19e96d
	dw Data_19e972
	dw Data_19e973
	dw Data_19e974
	dw Data_19e975
	dw Data_19e99a
	dw Data_19e9b3
	dw Data_19e9b4
	dw Data_19e9c5
	dw Data_19e9e6
	dw Data_19ea03
	dw Data_19ea04
	dw Data_19ea15
	dw Data_19ea2a
	dw Data_19ea3f
	dw Data_19ea4c
	dw Data_19ea4d
	dw Data_19ea4e
	dw Data_19ea4f
	dw Data_19ea58
	dw Data_19ea61
	dw Data_19ea7e
	dw Data_19ea9f
	dw Data_19eac0
	dw Data_19eac5
	dw Data_19eac6
	dw Data_19eac7
	dw Data_19ead8
	dw Data_19eae5
	dw Data_19eb0a
	dw Data_19eb27
	dw Data_19eb30
	dw Data_19eb31
	dw Data_19eb3a
	dw Data_19eb3b
	dw Data_19eb3c
	dw Data_19eb3d
	dw Data_19eb3e
	dw Data_19eb3f
	dw Data_19eb44
	dw Data_19eb45
	dw Data_19eb52
	dw Data_19eb5f

Data_19e957:
	db $ff

Data_19e958:
	db $ff

Data_19e959:
	macro_19e8ed $43, 8, 3, EVENT_001, $36
	db $ff

Data_19e95e:
	db $ff

Data_19e95f:
	macro_19e8ed $94, 8, 5, EVENT_000, $37
	macro_19e8ed $a2, 6, 6, EVENT_003, $37
	db $ff

Data_19e968:
	macro_19e8ed $1d, 1, 6, EVENT_002, $36
	db $ff

Data_19e96d:
	macro_19e8ed $4c, 1, 1, EVENT_005, $30
	db $ff

Data_19e972:
	db $ff

Data_19e973:
	db $ff

Data_19e974:
	db $ff

Data_19e975:
	macro_19e8ed $6a, 1, 6, EVENT_00A, $00
	macro_19e8ed $71, 1, 1, EVENT_00B, $01
	macro_19e8ed $71, 8, 1, EVENT_00C, $02
	macro_19e8ed $74, 2, 4, EVENT_00D, $03
	macro_19e8ed $76, 8, 6, EVENT_00E, $04
	macro_19e8ed $7b, 1, 2, EVENT_00F, $05
	macro_19e8ed $7d, 6, 5, EVENT_010, $08
	macro_19e8ed $7e, 2, 5, EVENT_011, $07
	macro_19e8ed $65, 2, 4, EVENT_012, $30
	db $ff

Data_19e99a:
	macro_19e8ed $84, 8, 6, EVENT_013, $09
	macro_19e8ed $86, 1, 6, EVENT_014, $0a
	macro_19e8ed $89, 1, 6, EVENT_015, $30
	macro_19e8ed $8b, 1, 6, EVENT_016, $0c
	macro_19e8ed $93, 8, 6, EVENT_017, $0d
	macro_19e8ed $94, 1, 6, EVENT_018, $0e
	db $ff

Data_19e9b3:
	db $ff

Data_19e9b4:
	macro_19e8ed $16, 1, 6, EVENT_019, $0f
	macro_19e8ed $17, 8, 6, EVENT_01A, $10
	macro_19e8ed $20, 3, 3, EVENT_01B, $11
	macro_19e8ed $26, 5, 6, EVENT_01C, $12
	db $ff

Data_19e9c5:
	macro_19e8ed $2f, 5, 1, EVENT_01D, $13
	macro_19e8ed $33, 4, 2, EVENT_01E, $14
	macro_19e8ed $33, 2, 4, EVENT_01F, $15
	macro_19e8ed $33, 6, 4, EVENT_020, $16
	macro_19e8ed $34, 5, 4, EVENT_021, $17
	macro_19e8ed $39, 4, 4, EVENT_022, $18
	macro_19e8ed $39, 2, 4, EVENT_023, $19
	macro_19e8ed $39, 6, 4, EVENT_024, $1a
	db $ff

Data_19e9e6:
	macro_19e8ed $40, 3, 2, EVENT_025, $1b
	macro_19e8ed $40, 6, 2, EVENT_026, $1c
	macro_19e8ed $41, 3, 2, EVENT_027, $1d
	macro_19e8ed $41, 2, 4, EVENT_028, $1e
	macro_19e8ed $41, 5, 4, EVENT_029, $1f
	macro_19e8ed $4a, 5, 3, EVENT_02A, $20
	macro_19e8ed $52, 8, 1, EVENT_02B, $21
	db $ff

Data_19ea03:
	db $ff

Data_19ea04:
	macro_19e8ed $66, 4, 4, EVENT_02C, $22
	macro_19e8ed $6e, 8, 3, EVENT_06F, $23
	macro_19e8ed $71, 1, 6, EVENT_070, $24
	macro_19e8ed $72, 1, 1, EVENT_071, $22
	db $ff

Data_19ea15:
	macro_19e8ed $76, 1, 1, EVENT_072, $26
	macro_19e8ed $76, 1, 4, EVENT_073, $27
	macro_19e8ed $87, 2, 6, EVENT_074, $28
	macro_19e8ed $87, 7, 6, EVENT_075, $29
	macro_19e8ed $8b, 5, 1, EVENT_076, $2a
	db $ff

Data_19ea2a:
	macro_19e8ed $99, 1, 3, EVENT_02D, $23
	macro_19e8ed $9b, 3, 3, EVENT_02E, $24
	macro_19e8ed $a2, 3, 5, EVENT_02F, $24
	macro_19e8ed $a2, 6, 5, EVENT_030, $26
	macro_19e8ed $ad, 8, 6, EVENT_077, $27
	db $ff

Data_19ea3f:
	macro_19e8ed $b5, 1, 6, EVENT_081, $28
	macro_19e8ed $b7, 7, 6, EVENT_082, $29
	macro_19e8ed $bc, 4, 3, EVENT_083, $2a
	db $ff

Data_19ea4c:
	db $ff

Data_19ea4d:
	db $ff

Data_19ea4e:
	db $ff

Data_19ea4f:
	macro_19e8ed $24, 6, 1, EVENT_031, $27
	macro_19e8ed $2d, 1, 4, EVENT_032, $28
	db $ff

Data_19ea58:
	macro_19e8ed $30, 1, 3, EVENT_033, $29
	macro_19e8ed $3f, 8, 4, EVENT_034, $2a
	db $ff

Data_19ea61:
	macro_19e8ed $49, 8, 3, EVENT_085, $2b
	macro_19e8ed $4e, 8, 3, EVENT_086, $2c
	macro_19e8ed $53, 8, 3, EVENT_035, $2d
	macro_19e8ed $55, 4, 1, EVENT_036, $2e
	macro_19e8ed $56, 4, 1, EVENT_037, $2f
	macro_19e8ed $57, 4, 1, EVENT_038, $01
	macro_19e8ed $58, 4, 1, EVENT_039, $34
	db $ff

Data_19ea7e:
	macro_19e8ed $67, 8, 3, EVENT_03A, $1d
	macro_19e8ed $6a, 8, 3, EVENT_03B, $37
	macro_19e8ed $6f, 8, 3, EVENT_03C, $1d
	macro_19e8ed $78, 1, 3, EVENT_03D, $37
	macro_19e8ed $79, 8, 3, EVENT_03E, $1d
	macro_19e8ed $7a, 1, 3, EVENT_03F, $37
	macro_19e8ed $7a, 1, 5, EVENT_040, $1d
	macro_19e8ed $7b, 8, 3, EVENT_041, $37
	db $ff

Data_19ea9f:
	macro_19e8ed $8c, 2, 2, EVENT_042, $1d
	macro_19e8ed $8c, 4, 2, EVENT_043, $38
	macro_19e8ed $8c, 6, 2, EVENT_044, $1d
	macro_19e8ed $8c, 8, 2, EVENT_045, $38
	macro_19e8ed $8c, 2, 4, EVENT_046, $1d
	macro_19e8ed $8c, 4, 4, EVENT_047, $38
	macro_19e8ed $8c, 6, 4, EVENT_048, $1d
	macro_19e8ed $8c, 8, 4, EVENT_049, $38
	db $ff

Data_19eac0:
	macro_19e8ed $ac, 4, 2, EVENT_04A, $35
	db $ff

Data_19eac5:
	db $ff

Data_19eac6:
	db $ff

Data_19eac7:
	macro_19e8ed $25, 3, 2, EVENT_04B, $1d
	macro_19e8ed $25, 7, 2, EVENT_04C, $0a
	macro_19e8ed $25, 5, 4, EVENT_04D, $35
	macro_19e8ed $45, 8, 1, EVENT_04E, $36
	db $ff

Data_19ead8:
	macro_19e8ed $55, 5, 4, EVENT_04F, $37
	macro_19e8ed $61, 1, 5, EVENT_050, $38
	macro_19e8ed $81, 3, 1, EVENT_051, $39
	db $ff

Data_19eae5:
	macro_19e8ed $8d, 2, 3, EVENT_052, $40
	macro_19e8ed $8d, 4, 3, EVENT_053, $41
	macro_19e8ed $8d, 7, 3, EVENT_054, $40
	macro_19e8ed $96, 3, 3, EVENT_055, $41
	macro_19e8ed $96, 5, 3, EVENT_056, $40
	macro_19e8ed $96, 4, 4, EVENT_057, $41
	macro_19e8ed $a2, 2, 2, EVENT_058, $40
	macro_19e8ed $a2, 7, 2, EVENT_059, $40
	macro_19e8ed $a2, 4, 5, EVENT_05A, $41
	db $ff

Data_19eb0a:
	macro_19e8ed $a7, 4, 2, EVENT_05B, $21
	macro_19e8ed $aa, 4, 2, EVENT_05C, $1f
	macro_19e8ed $b0, 5, 5, EVENT_05D, $07
	macro_19e8ed $b6, 4, 2, EVENT_05E, $1e
	macro_19e8ed $bb, 4, 2, EVENT_05F, $39
	macro_19e8ed $be, 5, 5, EVENT_060, $39
	macro_19e8ed $c3, 5, 5, EVENT_061, $39
	db $ff

Data_19eb27:
	macro_19e8ed $07, 4, 1, EVENT_062, $41
	macro_19e8ed $11, 4, 1, EVENT_063, $41
	db $ff

Data_19eb30:
	db $ff

Data_19eb31:
	macro_19e8ed $27, 4, 1, EVENT_064, $42
	macro_19e8ed $2b, 4, 1, EVENT_065, $42
	db $ff

Data_19eb3a:
	db $ff

Data_19eb3b:
	db $ff

Data_19eb3c:
	db $ff

Data_19eb3d:
	db $ff

Data_19eb3e:
	db $ff

Data_19eb3f:
	macro_19e8ed $56, 4, 3, EVENT_084, $ff

Data_19eb43:
	db $ff

Data_19eb44:
	db $ff

Data_19eb45:
	macro_19e8ed $02, 4, 4, EVENT_066, $34
	macro_19e8ed $0d, 7, 5, EVENT_067, $35
	macro_19e8ed $15, 1, 1, EVENT_068, $36
	db $ff

Data_19eb52:
	macro_19e8ed $23, 6, 1, EVENT_069, $20
	macro_19e8ed $26, 8, 1, EVENT_06A, $23
	macro_19e8ed $2f, 4, 1, EVENT_06B, $0b
	db $ff

Data_19eb5f:
	macro_19e8ed $42, 4, 5, EVENT_06C, $3f
	macro_19e8ed $4e, 5, 3, EVENT_06D, $3c
	macro_19e8ed $4f, 4, 4, EVENT_06E, $30
	db $ff

SECTION "bank 68", ROMX, BANK [$68]
Data_1a0000:
INCBIN "maps/1a0000.blk"
INCBIN "maps/1a0050.blk"
INCBIN "maps/1a00a0.blk"
INCBIN "maps/1a00f0.blk"
INCBIN "maps/1a0140.blk"
INCBIN "maps/1a0190.blk"
INCBIN "maps/1a01e0.blk"
INCBIN "maps/1a0230.blk"
INCBIN "maps/1a0280.blk"
INCBIN "maps/1a02d0.blk"
INCBIN "maps/1a0320.blk"
INCBIN "maps/1a0370.blk"
INCBIN "maps/1a03c0.blk"
INCBIN "maps/1a0410.blk"
INCBIN "maps/1a0460.blk"
INCBIN "maps/1a04b0.blk"
INCBIN "maps/1a0500.blk"
INCBIN "maps/1a0550.blk"
INCBIN "maps/1a05a0.blk"
INCBIN "maps/1a05f0.blk"
INCBIN "maps/1a0640.blk"
INCBIN "maps/1a0690.blk"
INCBIN "maps/1a06e0.blk"
INCBIN "maps/1a0730.blk"
INCBIN "maps/1a0780.blk"
INCBIN "maps/1a07d0.blk"
INCBIN "maps/1a0820.blk"
INCBIN "maps/1a0870.blk"
INCBIN "maps/1a08c0.blk"
INCBIN "maps/1a0910.blk"
INCBIN "maps/1a0960.blk"
INCBIN "maps/1a09b0.blk"
INCBIN "maps/1a0a00.blk"
INCBIN "maps/1a0a50.blk"
INCBIN "maps/1a0aa0.blk"
INCBIN "maps/1a0af0.blk"
INCBIN "maps/1a0b40.blk"
INCBIN "maps/1a0b90.blk"
INCBIN "maps/1a0be0.blk"
INCBIN "maps/1a0c30.blk"
INCBIN "maps/1a0c80.blk"
INCBIN "maps/1a0cd0.blk"
INCBIN "maps/1a0d20.blk"
INCBIN "maps/1a0d70.blk"
INCBIN "maps/1a0dc0.blk"
INCBIN "maps/1a0e10.blk"
INCBIN "maps/1a0e60.blk"
INCBIN "maps/1a0eb0.blk"
INCBIN "maps/1a0f00.blk"
INCBIN "maps/1a0f50.blk"
INCBIN "maps/1a0fa0.blk"
INCBIN "maps/1a0ff0.blk"
INCBIN "maps/1a1040.blk"
INCBIN "maps/1a1090.blk"
INCBIN "maps/1a10e0.blk"
INCBIN "maps/1a1130.blk"
INCBIN "maps/1a1180.blk"
INCBIN "maps/1a11d0.blk"
INCBIN "maps/1a1220.blk"
INCBIN "maps/1a1270.blk"
INCBIN "maps/1a12c0.blk"
INCBIN "maps/1a1310.blk"
INCBIN "maps/1a1360.blk"
INCBIN "maps/1a13b0.blk"
INCBIN "maps/1a1400.blk"
INCBIN "maps/1a1450.blk"
INCBIN "maps/1a14a0.blk"
INCBIN "maps/1a14f0.blk"
INCBIN "maps/1a1540.blk"
INCBIN "maps/1a1590.blk"
INCBIN "maps/1a15e0.blk"
INCBIN "maps/1a1630.blk"
INCBIN "maps/1a1680.blk"
INCBIN "maps/1a16d0.blk"
INCBIN "maps/1a1720.blk"
INCBIN "maps/1a1770.blk"
INCBIN "maps/1a17c0.blk"
INCBIN "maps/1a1810.blk"
INCBIN "maps/1a1860.blk"
INCBIN "maps/1a18b0.blk"
INCBIN "maps/1a1900.blk"
INCBIN "maps/1a1950.blk"
INCBIN "maps/1a19a0.blk"
INCBIN "maps/1a19f0.blk"
INCBIN "maps/1a1a40.blk"
INCBIN "maps/1a1a90.blk"
INCBIN "maps/1a1ae0.blk"
INCBIN "maps/1a1b30.blk"
INCBIN "maps/1a1b80.blk"
INCBIN "maps/1a1bd0.blk"
INCBIN "maps/1a1c20.blk"
INCBIN "maps/1a1c70.blk"
INCBIN "maps/1a1cc0.blk"
INCBIN "maps/1a1d10.blk"
INCBIN "maps/1a1d60.blk"
INCBIN "maps/1a1db0.blk"
INCBIN "maps/1a1e00.blk"
INCBIN "maps/1a1e50.blk"
INCBIN "maps/1a1ea0.blk"
INCBIN "maps/1a1ef0.blk"
INCBIN "maps/1a1f40.blk"
INCBIN "maps/1a1f90.blk"
INCBIN "maps/1a1fe0.blk"
INCBIN "maps/1a2030.blk"
INCBIN "maps/1a2080.blk"
INCBIN "maps/1a20d0.blk"
INCBIN "maps/1a2120.blk"
INCBIN "maps/1a2170.blk"
INCBIN "maps/1a21c0.blk"
INCBIN "maps/1a2210.blk"
INCBIN "maps/1a2260.blk"
INCBIN "maps/1a22b0.blk"
INCBIN "maps/1a2300.blk"
INCBIN "maps/1a2350.blk"
INCBIN "maps/1a23a0.blk"
INCBIN "maps/1a23f0.blk"
INCBIN "maps/1a2440.blk"
INCBIN "maps/1a2490.blk"
INCBIN "maps/1a24e0.blk"
INCBIN "maps/1a2530.blk"
INCBIN "maps/1a2580.blk"
INCBIN "maps/1a25d0.blk"
INCBIN "maps/1a2620.blk"
INCBIN "maps/1a2670.blk"
INCBIN "maps/1a26c0.blk"
INCBIN "maps/1a2710.blk"
INCBIN "maps/1a2760.blk"
INCBIN "maps/1a27b0.blk"
INCBIN "maps/1a2800.blk"
INCBIN "maps/1a2850.blk"
INCBIN "maps/1a28a0.blk"
INCBIN "maps/1a28f0.blk"
INCBIN "maps/1a2940.blk"
INCBIN "maps/1a2990.blk"
INCBIN "maps/1a29e0.blk"
INCBIN "maps/1a2a30.blk"
INCBIN "maps/1a2a80.blk"
INCBIN "maps/1a2ad0.blk"
INCBIN "maps/1a2b20.blk"
INCBIN "maps/1a2b70.blk"
INCBIN "maps/1a2bc0.blk"
INCBIN "maps/1a2c10.blk"
INCBIN "maps/1a2c60.blk"
INCBIN "maps/1a2cb0.blk"
INCBIN "maps/1a2d00.blk"
INCBIN "maps/1a2d50.blk"
INCBIN "maps/1a2da0.blk"
INCBIN "maps/1a2df0.blk"
INCBIN "maps/1a2e40.blk"
INCBIN "maps/1a2e90.blk"
INCBIN "maps/1a2ee0.blk"
INCBIN "maps/1a2f30.blk"
INCBIN "maps/1a2f80.blk"
INCBIN "maps/1a2fd0.blk"
INCBIN "maps/1a3020.blk"
INCBIN "maps/1a3070.blk"
INCBIN "maps/1a30c0.blk"
INCBIN "maps/1a3110.blk"
INCBIN "maps/1a3160.blk"
INCBIN "maps/1a31b0.blk"
INCBIN "maps/1a3200.blk"
INCBIN "maps/1a3250.blk"
INCBIN "maps/1a32a0.blk"
INCBIN "maps/1a32f0.blk"
INCBIN "maps/1a3340.blk"
INCBIN "maps/1a3390.blk"
INCBIN "maps/1a33e0.blk"
INCBIN "maps/1a3430.blk"
INCBIN "maps/1a3480.blk"
INCBIN "maps/1a34d0.blk"
INCBIN "maps/1a3520.blk"
INCBIN "maps/1a3570.blk"
INCBIN "maps/1a35c0.blk"
INCBIN "maps/1a3610.blk"
INCBIN "maps/1a3660.blk"
INCBIN "maps/1a36b0.blk"
INCBIN "maps/1a3700.blk"
INCBIN "maps/1a3750.blk"
INCBIN "maps/1a37a0.blk"
INCBIN "maps/1a37f0.blk"
INCBIN "maps/1a3840.blk"
INCBIN "maps/1a3890.blk"
INCBIN "maps/1a38e0.blk"
INCBIN "maps/1a3930.blk"
INCBIN "maps/1a3980.blk"
INCBIN "maps/1a39d0.blk"
INCBIN "maps/1a3a20.blk"
INCBIN "maps/1a3a70.blk"
INCBIN "maps/1a3ac0.blk"
INCBIN "maps/1a3b10.blk"
INCBIN "maps/1a3b60.blk"
INCBIN "maps/1a3bb0.blk"

SECTION "bank 69", ROMX, BANK [$69]
Data_1a4000:
INCBIN "maps/1a4000.blk"
INCBIN "maps/1a4050.blk"
INCBIN "maps/1a40a0.blk"
INCBIN "maps/1a40f0.blk"
INCBIN "maps/1a4140.blk"
INCBIN "maps/1a4190.blk"
INCBIN "maps/1a41e0.blk"
INCBIN "maps/1a4230.blk"
INCBIN "maps/1a4280.blk"
INCBIN "maps/1a42d0.blk"
INCBIN "maps/1a4320.blk"
INCBIN "maps/1a4370.blk"
INCBIN "maps/1a43c0.blk"
INCBIN "maps/1a4410.blk"
INCBIN "maps/1a4460.blk"
INCBIN "maps/1a44b0.blk"
INCBIN "maps/1a4500.blk"
INCBIN "maps/1a4550.blk"
INCBIN "maps/1a45a0.blk"
INCBIN "maps/1a45f0.blk"
INCBIN "maps/1a4640.blk"
INCBIN "maps/1a4690.blk"
INCBIN "maps/1a46e0.blk"
INCBIN "maps/1a4730.blk"
INCBIN "maps/1a4780.blk"
INCBIN "maps/1a47d0.blk"
INCBIN "maps/1a4820.blk"
INCBIN "maps/1a4870.blk"
INCBIN "maps/1a48c0.blk"
INCBIN "maps/1a4910.blk"
INCBIN "maps/1a4960.blk"
INCBIN "maps/1a49b0.blk"
INCBIN "maps/1a4a00.blk"
INCBIN "maps/1a4a50.blk"
INCBIN "maps/1a4aa0.blk"
INCBIN "maps/1a4af0.blk"
INCBIN "maps/1a4b40.blk"
INCBIN "maps/1a4b90.blk"
INCBIN "maps/1a4be0.blk"
INCBIN "maps/1a4c30.blk"
INCBIN "maps/1a4c80.blk"
INCBIN "maps/1a4cd0.blk"
INCBIN "maps/1a4d20.blk"
INCBIN "maps/1a4d70.blk"
INCBIN "maps/1a4dc0.blk"
INCBIN "maps/1a4e10.blk"
INCBIN "maps/1a4e60.blk"
INCBIN "maps/1a4eb0.blk"
INCBIN "maps/1a4f00.blk"
INCBIN "maps/1a4f50.blk"
INCBIN "maps/1a4fa0.blk"
INCBIN "maps/1a4ff0.blk"
INCBIN "maps/1a5040.blk"
INCBIN "maps/1a5090.blk"
INCBIN "maps/1a50e0.blk"
INCBIN "maps/1a5130.blk"
INCBIN "maps/1a5180.blk"
INCBIN "maps/1a51d0.blk"
INCBIN "maps/1a5220.blk"
INCBIN "maps/1a5270.blk"
INCBIN "maps/1a52c0.blk"
INCBIN "maps/1a5310.blk"
INCBIN "maps/1a5360.blk"
INCBIN "maps/1a53b0.blk"
INCBIN "maps/1a5400.blk"
INCBIN "maps/1a5450.blk"
INCBIN "maps/1a54a0.blk"
INCBIN "maps/1a54f0.blk"
INCBIN "maps/1a5540.blk"
INCBIN "maps/1a5590.blk"
INCBIN "maps/1a55e0.blk"
INCBIN "maps/1a5630.blk"
INCBIN "maps/1a5680.blk"
INCBIN "maps/1a56d0.blk"
INCBIN "maps/1a5720.blk"
INCBIN "maps/1a5770.blk"
INCBIN "maps/1a57c0.blk"
INCBIN "maps/1a5810.blk"
INCBIN "maps/1a5860.blk"
INCBIN "maps/1a58b0.blk"
INCBIN "maps/1a5900.blk"
INCBIN "maps/1a5950.blk"
INCBIN "maps/1a59a0.blk"
INCBIN "maps/1a59f0.blk"
INCBIN "maps/1a5a40.blk"
INCBIN "maps/1a5a90.blk"
INCBIN "maps/1a5ae0.blk"
INCBIN "maps/1a5b30.blk"
INCBIN "maps/1a5b80.blk"
INCBIN "maps/1a5bd0.blk"
INCBIN "maps/1a5c20.blk"
INCBIN "maps/1a5c70.blk"
INCBIN "maps/1a5cc0.blk"
INCBIN "maps/1a5d10.blk"
INCBIN "maps/1a5d60.blk"
INCBIN "maps/1a5db0.blk"
INCBIN "maps/1a5e00.blk"
INCBIN "maps/1a5e50.blk"
INCBIN "maps/1a5ea0.blk"
INCBIN "maps/1a5ef0.blk"
INCBIN "maps/1a5f40.blk"
INCBIN "maps/1a5f90.blk"
INCBIN "maps/1a5fe0.blk"
INCBIN "maps/1a6030.blk"
INCBIN "maps/1a6080.blk"
INCBIN "maps/1a60d0.blk"
INCBIN "maps/1a6120.blk"
INCBIN "maps/1a6170.blk"
INCBIN "maps/1a61c0.blk"
INCBIN "maps/1a6210.blk"
INCBIN "maps/1a6260.blk"
INCBIN "maps/1a62b0.blk"
INCBIN "maps/1a6300.blk"
INCBIN "maps/1a6350.blk"
INCBIN "maps/1a63a0.blk"
INCBIN "maps/1a63f0.blk"
INCBIN "maps/1a6440.blk"
INCBIN "maps/1a6490.blk"
INCBIN "maps/1a64e0.blk"
INCBIN "maps/1a6530.blk"
INCBIN "maps/1a6580.blk"
INCBIN "maps/1a65d0.blk"
INCBIN "maps/1a6620.blk"
INCBIN "maps/1a6670.blk"
INCBIN "maps/1a66c0.blk"
INCBIN "maps/1a6710.blk"
INCBIN "maps/1a6760.blk"
INCBIN "maps/1a67b0.blk"
INCBIN "maps/1a6800.blk"
INCBIN "maps/1a6850.blk"
INCBIN "maps/1a68a0.blk"
INCBIN "maps/1a68f0.blk"
INCBIN "maps/1a6940.blk"
INCBIN "maps/1a6990.blk"
INCBIN "maps/1a69e0.blk"
INCBIN "maps/1a6a30.blk"
INCBIN "maps/1a6a80.blk"
INCBIN "maps/1a6ad0.blk"
INCBIN "maps/1a6b20.blk"
INCBIN "maps/1a6b70.blk"
INCBIN "maps/1a6bc0.blk"
INCBIN "maps/1a6c10.blk"
INCBIN "maps/1a6c60.blk"
INCBIN "maps/1a6cb0.blk"
INCBIN "maps/1a6d00.blk"
INCBIN "maps/1a6d50.blk"
INCBIN "maps/1a6da0.blk"
INCBIN "maps/1a6df0.blk"
INCBIN "maps/1a6e40.blk"
INCBIN "maps/1a6e90.blk"
INCBIN "maps/1a6ee0.blk"
INCBIN "maps/1a6f30.blk"
INCBIN "maps/1a6f80.blk"
INCBIN "maps/1a6fd0.blk"
INCBIN "maps/1a7020.blk"
INCBIN "maps/1a7070.blk"
INCBIN "maps/1a70c0.blk"
INCBIN "maps/1a7110.blk"
INCBIN "maps/1a7160.blk"
INCBIN "maps/1a71b0.blk"
INCBIN "maps/1a7200.blk"
INCBIN "maps/1a7250.blk"
INCBIN "maps/1a72a0.blk"
INCBIN "maps/1a72f0.blk"
INCBIN "maps/1a7340.blk"
INCBIN "maps/1a7390.blk"

SECTION "bank 6A", ROMX, BANK [$6a]
Data_1a8000:
INCBIN "maps/1a8000.blk"
INCBIN "maps/1a8050.blk"
INCBIN "maps/1a80a0.blk"
INCBIN "maps/1a80f0.blk"
INCBIN "maps/1a8140.blk"
INCBIN "maps/1a8190.blk"
INCBIN "maps/1a81e0.blk"
INCBIN "maps/1a8230.blk"
INCBIN "maps/1a8280.blk"
INCBIN "maps/1a82d0.blk"
INCBIN "maps/1a8320.blk"
INCBIN "maps/1a8370.blk"
INCBIN "maps/1a83c0.blk"
INCBIN "maps/1a8410.blk"
INCBIN "maps/1a8460.blk"
INCBIN "maps/1a84b0.blk"
INCBIN "maps/1a8500.blk"
INCBIN "maps/1a8550.blk"
INCBIN "maps/1a85a0.blk"
INCBIN "maps/1a85f0.blk"
INCBIN "maps/1a8640.blk"
INCBIN "maps/1a8690.blk"
INCBIN "maps/1a86e0.blk"
INCBIN "maps/1a8730.blk"
INCBIN "maps/1a8780.blk"
INCBIN "maps/1a87d0.blk"
INCBIN "maps/1a8820.blk"
INCBIN "maps/1a8870.blk"
INCBIN "maps/1a88c0.blk"
INCBIN "maps/1a8910.blk"
INCBIN "maps/1a8960.blk"
INCBIN "maps/1a89b0.blk"
INCBIN "maps/1a8a00.blk"
INCBIN "maps/1a8a50.blk"
INCBIN "maps/1a8aa0.blk"
INCBIN "maps/1a8af0.blk"
INCBIN "maps/1a8b40.blk"
INCBIN "maps/1a8b90.blk"
INCBIN "maps/1a8be0.blk"
INCBIN "maps/1a8c30.blk"
INCBIN "maps/1a8c80.blk"
INCBIN "maps/1a8cd0.blk"
INCBIN "maps/1a8d20.blk"
INCBIN "maps/1a8d70.blk"
INCBIN "maps/1a8dc0.blk"
INCBIN "maps/1a8e10.blk"
INCBIN "maps/1a8e60.blk"
INCBIN "maps/1a8eb0.blk"
INCBIN "maps/1a8f00.blk"
INCBIN "maps/1a8f50.blk"
INCBIN "maps/1a8fa0.blk"
INCBIN "maps/1a8ff0.blk"
INCBIN "maps/1a9040.blk"
INCBIN "maps/1a9090.blk"
INCBIN "maps/1a90e0.blk"
INCBIN "maps/1a9130.blk"
INCBIN "maps/1a9180.blk"
INCBIN "maps/1a91d0.blk"
INCBIN "maps/1a9220.blk"
INCBIN "maps/1a9270.blk"
INCBIN "maps/1a92c0.blk"
INCBIN "maps/1a9310.blk"
INCBIN "maps/1a9360.blk"
INCBIN "maps/1a93b0.blk"
INCBIN "maps/1a9400.blk"
INCBIN "maps/1a9450.blk"
INCBIN "maps/1a94a0.blk"
INCBIN "maps/1a94f0.blk"
INCBIN "maps/1a9540.blk"
INCBIN "maps/1a9590.blk"
INCBIN "maps/1a95e0.blk"
INCBIN "maps/1a9630.blk"
INCBIN "maps/1a9680.blk"
INCBIN "maps/1a96d0.blk"
INCBIN "maps/1a9720.blk"
INCBIN "maps/1a9770.blk"
INCBIN "maps/1a97c0.blk"
INCBIN "maps/1a9810.blk"
INCBIN "maps/1a9860.blk"
INCBIN "maps/1a98b0.blk"
INCBIN "maps/1a9900.blk"
INCBIN "maps/1a9950.blk"
INCBIN "maps/1a99a0.blk"
INCBIN "maps/1a99f0.blk"
INCBIN "maps/1a9a40.blk"
INCBIN "maps/1a9a90.blk"
INCBIN "maps/1a9ae0.blk"
INCBIN "maps/1a9b30.blk"
INCBIN "maps/1a9b80.blk"
INCBIN "maps/1a9bd0.blk"
INCBIN "maps/1a9c20.blk"
INCBIN "maps/1a9c70.blk"
INCBIN "maps/1a9cc0.blk"
INCBIN "maps/1a9d10.blk"
INCBIN "maps/1a9d60.blk"
INCBIN "maps/1a9db0.blk"
INCBIN "maps/1a9e00.blk"
INCBIN "maps/1a9e50.blk"
INCBIN "maps/1a9ea0.blk"
INCBIN "maps/1a9ef0.blk"
INCBIN "maps/1a9f40.blk"
INCBIN "maps/1a9f90.blk"
INCBIN "maps/1a9fe0.blk"
INCBIN "maps/1aa030.blk"
INCBIN "maps/1aa080.blk"
INCBIN "maps/1aa0d0.blk"
INCBIN "maps/1aa120.blk"
INCBIN "maps/1aa170.blk"
INCBIN "maps/1aa1c0.blk"
INCBIN "maps/1aa210.blk"
INCBIN "maps/1aa260.blk"
INCBIN "maps/1aa2b0.blk"
INCBIN "maps/1aa300.blk"
INCBIN "maps/1aa350.blk"
INCBIN "maps/1aa3a0.blk"
INCBIN "maps/1aa3f0.blk"
INCBIN "maps/1aa440.blk"
INCBIN "maps/1aa490.blk"
INCBIN "maps/1aa4e0.blk"
INCBIN "maps/1aa530.blk"
INCBIN "maps/1aa580.blk"
INCBIN "maps/1aa5d0.blk"
INCBIN "maps/1aa620.blk"
INCBIN "maps/1aa670.blk"
INCBIN "maps/1aa6c0.blk"
INCBIN "maps/1aa710.blk"
INCBIN "maps/1aa760.blk"
INCBIN "maps/1aa7b0.blk"
INCBIN "maps/1aa800.blk"
INCBIN "maps/1aa850.blk"
INCBIN "maps/1aa8a0.blk"
INCBIN "maps/1aa8f0.blk"
INCBIN "maps/1aa940.blk"
INCBIN "maps/1aa990.blk"
INCBIN "maps/1aa9e0.blk"
INCBIN "maps/1aaa30.blk"
INCBIN "maps/1aaa80.blk"
INCBIN "maps/1aaad0.blk"
INCBIN "maps/1aab20.blk"
INCBIN "maps/1aab70.blk"
INCBIN "maps/1aabc0.blk"
INCBIN "maps/1aac10.blk"
INCBIN "maps/1aac60.blk"
INCBIN "maps/1aacb0.blk"
INCBIN "maps/1aad00.blk"
INCBIN "maps/1aad50.blk"
INCBIN "maps/1aada0.blk"
INCBIN "maps/1aadf0.blk"
INCBIN "maps/1aae40.blk"
INCBIN "maps/1aae90.blk"
INCBIN "maps/1aaee0.blk"
INCBIN "maps/1aaf30.blk"
INCBIN "maps/1aaf80.blk"
INCBIN "maps/1aafd0.blk"
INCBIN "maps/1ab020.blk"
INCBIN "maps/1ab070.blk"
INCBIN "maps/1ab0c0.blk"
INCBIN "maps/1ab110.blk"
INCBIN "maps/1ab160.blk"
INCBIN "maps/1ab1b0.blk"
INCBIN "maps/1ab200.blk"
INCBIN "maps/1ab250.blk"
INCBIN "maps/1ab2a0.blk"
INCBIN "maps/1ab2f0.blk"
INCBIN "maps/1ab340.blk"
INCBIN "maps/1ab390.blk"
INCBIN "maps/1ab3e0.blk"
INCBIN "maps/1ab430.blk"
INCBIN "maps/1ab480.blk"
INCBIN "maps/1ab4d0.blk"
INCBIN "maps/1ab520.blk"
INCBIN "maps/1ab570.blk"
INCBIN "maps/1ab5c0.blk"
INCBIN "maps/1ab610.blk"
INCBIN "maps/1ab660.blk"
INCBIN "maps/1ab6b0.blk"
INCBIN "maps/1ab700.blk"
INCBIN "maps/1ab750.blk"
INCBIN "maps/1ab7a0.blk"
INCBIN "maps/1ab7f0.blk"
INCBIN "maps/1ab840.blk"
INCBIN "maps/1ab890.blk"
INCBIN "maps/1ab8e0.blk"
INCBIN "maps/1ab930.blk"
INCBIN "maps/1ab980.blk"
INCBIN "maps/1ab9d0.blk"
INCBIN "maps/1aba20.blk"
INCBIN "maps/1aba70.blk"
INCBIN "maps/1abac0.blk"
INCBIN "maps/1abb10.blk"
INCBIN "maps/1abb60.blk"
INCBIN "maps/1abbb0.blk"
INCBIN "maps/1abc00.blk"
INCBIN "maps/1abc50.blk"
INCBIN "maps/1abca0.blk"
INCBIN "maps/1abcf0.blk"
INCBIN "maps/1abd40.blk"
INCBIN "maps/1abd90.blk"
INCBIN "maps/1abde0.blk"
INCBIN "maps/1abe30.blk"
INCBIN "maps/1abe80.blk"

SECTION "bank 75", ROMX, BANK [$75]
DenjuuNames::
INCLUDE "text/denjuu_names.asm"
TFangerNames:: ; 1d4570
INCLUDE "text/tfanger_names.asm"
MoveNames:: ; 1d46f8
INCLUDE "text/attack_names.asm"

BaseStats::
INCLUDE "data/base_stats.asm"

TypeNames::
	db "いわやま"
	db "そうげん"
	db "しんリん"
	db "すいせい"
	db "そら  "
	db "さばく "

INCLUDE "data/denjuu_sprites.asm"

Data_1d56ee::
INCLUDE "data/wild_denjuu.asm"
INCLUDE "text/battle_catchphrases.asm"

Data_1d7928::
	db "のんびリ$$$$"
	db "ちょーのんびリ$"
	db "あわてもの$$$"
	db "ちょーあわてもの"
	db "わがまま$$$$"
	db "ちょーわがまま$"
	db "おくびょう$$$"
	db "ちょーおくびょう"
	db "おこリんぼ$$$"
	db "ちょーおこリんぼ"
	db "リちぎ$$$$$"
	db "ちょーリちぎ$$"

Data_1d7988::
	db "ふつう$"
	db "かくれる"
	db "ジャンプ"
	db "ひこう$"
	db "こんらん"
	db "まひ$$"
	db "のろい$"
	db "ねむリ$"
	db "ひるむ$"
	db "けむリ$"
	db "どく$$"
	db "みえない"
	db "バリア$"
	db "けっかい"
	db "しもやけ"
	db "やけど$"

SECTION "bank 79", ROMX, BANK [$79]
GFX_1e4000: INCBIN "gfx/phone_keypads/1e4000.t2.2bpp"
GFX_1e4400: INCBIN "gfx/phone_keypads/1e4400.t2.2bpp"
GFX_1e4800: INCBIN "gfx/phone_keypads/1e4800.t2.2bpp"
GFX_1e4c00: INCBIN "gfx/phone_keypads/1e4c00.t2.2bpp"
GFX_1e5000: INCBIN "gfx/phone_keypads/1e5000.t2.2bpp"
GFX_1e5400: INCBIN "gfx/phone_keypads/1e5400.t2.2bpp"
GFX_1e5800: INCBIN "gfx/phone_keypads/1e5800.t2.2bpp"
GFX_1e5c00: INCBIN "gfx/phone_keypads/1e5c00.t2.2bpp"
GFX_1e6000: INCBIN "gfx/phone_keypads/1e6000.t2.2bpp"
GFX_1e6400: INCBIN "gfx/phone_keypads/1e6400.t2.2bpp"
GFX_1e6800: INCBIN "gfx/phone_keypads/1e6800.t2.2bpp"
GFX_1e6c00: INCBIN "gfx/phone_keypads/1e6c00.t2.2bpp"

SECTION "bank 7A", ROMX, BANK [$7a]
GFX_1e8000: INCBIN "gfx/phone/1e8000.2bpp"
GFX_1e8200: INCBIN "gfx/phone/1e8200.2bpp"
GFX_1e8400: INCBIN "gfx/phone/1e8400.2bpp"
GFX_1e8600: INCBIN "gfx/phone/1e8600.2bpp"
GFX_1e8800: INCBIN "gfx/phone/1e8800.2bpp"
GFX_1e8a00: INCBIN "gfx/phone/1e8a00.2bpp"
GFX_1e8c00: INCBIN "gfx/phone/1e8c00.2bpp"
GFX_1e8e00: INCBIN "gfx/phone/1e8e00.2bpp"
GFX_1e9000: INCBIN "gfx/phone/1e9000.2bpp"

SECTION "bank 7B", ROMX, BANK [$7b]
GFX_1ec000: INCBIN "gfx/phone_keypads/1ec000.t2.2bpp"
GFX_1ec400: INCBIN "gfx/phone_keypads/1ec400.t2.2bpp"
GFX_1ec800: INCBIN "gfx/phone_keypads/1ec800.t2.2bpp"
GFX_1ecc00: INCBIN "gfx/phone_keypads/1ecc00.t2.2bpp"
GFX_1ed000: INCBIN "gfx/phone_keypads/1ed000.t2.2bpp"
GFX_1ed400: INCBIN "gfx/phone_keypads/1ed400.t2.2bpp"
GFX_1ed800: INCBIN "gfx/phone_keypads/1ed800.t2.2bpp"
GFX_1edc00: INCBIN "gfx/phone_keypads/1edc00.t2.2bpp"
GFX_1ee000: INCBIN "gfx/phone_keypads/1ee000.t2.2bpp"
GFX_1ee400: INCBIN "gfx/phone_keypads/1ee400.t2.2bpp"
GFX_1ee800: INCBIN "gfx/phone_keypads/1ee800.t2.2bpp"
GFX_1eec00: INCBIN "gfx/phone_keypads/1eec00.t2.2bpp"
