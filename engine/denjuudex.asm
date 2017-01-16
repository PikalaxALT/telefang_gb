InGamePhone_Zukan:
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_1143e
	dw Func_1146e
	dw Func_11479
	dw DexMainScreenJoypadAction
	dw Func_114ff
	dw Func_115a4
	dw Func_115ae
	dw Func_11644
	dw Func_115a4
	dw Func_11690
	dw Func_13f47
	dw Func_13f4e
	dw Func_1169d

Func_1143e: ; 1143e (4:543e)
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $0
	ld [wca65], a
	ld a, $78
	ld [wTextBoxStartTile], a
	call GetDexCounts
	ld bc, $48
	check_cgb
	jr z, .asm_11468
	ld bc, $5b
.asm_11468
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_1146e: ; 1146e (4:546e)
	call Func_13eb5
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine2

Func_11479: ; 11479 (4:5479)
	jp Func_13f8c

DexMainScreenJoypadAction: ; 1147c (4:547c)
	call Func_13312
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, [wLastDenjuuSeenOrCaught]
	ld b, a
	ld a, [wDexCurDenjuu]
	cp b
	jr nz, .asm_11497
	ld a, $ff
.asm_11497
	inc a
	jr .asm_114ad

.check_left
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_114c3
	ld a, [wDexCurDenjuu]
	cp $0
	jr nz, .asm_114ac
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
.asm_114ac
	dec a
.asm_114ad
	ld [wDexCurDenjuu], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	ret

.asm_114c3
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_114dc
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, SFX_04
	ld [H_SFX_ID], a
	call Func_13fc6
	ld a, $a
	ld [wSubroutine2], a
	ret

.asm_114dc
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_114fe
	ld a, [wDexCurDenjuu]
	call CheckCaughtDenjuu
	jr nz, .asm_114f1
	ld a, [wDexCurDenjuu]
	call CheckSeenDenjuu
	ret z
.asm_114f1
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine2

.asm_114fe
	ret

Func_114ff: ; 114ff (4:54ff)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call ClearObjectAnimationBuffers
	ld bc, $e
	call DecompressGFXByIndex_
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld bc, $16
	call GetCGB_BGLayout_
	ld bc, $3
	call GetCGB_OBLayout_
	lb bc, $0, $0
	ld e, $1
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $1
	ld a, $1
	call LoadStdBGMapAttrLayout_
	call Func_13e6e
	ld a, [wDexCurDenjuu]
	ld [wCurDenjuu], a
	call PrintCurDenjuuTypeName_
	ld a, [wDexCurDenjuu]
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	ld a, [wDexCurDenjuu]
	call GetDenjuuPalette_Pal6
	ld a, [wDexCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
	ld a, [wDexCurDenjuu]
	ld de, VTilesBG tile $20
	call GetCurDenjuuKanjiDescription
	ld hl, VTilesShared tile $40
	ld b, $20
	call ClearTiles
	ld a, $1
	ld [wcb2b], a
	ld a, $4
	call StartFade_
	ld a, $c0
	ld [wTextBoxStartTile], a
	call Func_13f70
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13340
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_115a4: ; 115a4 (4:55a4)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine2

Func_115ae: ; 115ae (4:55ae)
	call Func_13340
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_115be
	ld hl, VTilesBG tile $1b
	call Func_17ef
.asm_115be
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	jr z, .asm_115d1
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine2

.asm_115d1
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_11610
	ld a, [wDexCurDenjuu]
	ld [wcb20], a
.asm_115de
	ld a, [wLastDenjuuSeenOrCaught]
	ld b, a
	ld a, [wDexCurDenjuu]
	cp b
	jr z, .asm_115fe
	inc a
	ld [wDexCurDenjuu], a
	ld a, [wDexCurDenjuu]
	call CheckCaughtDenjuu
	jr nz, .asm_11605
	ld a, [wDexCurDenjuu]
	call CheckSeenDenjuu
	jr nz, .asm_11605
	jr .asm_115de

.asm_115fe
	ld a, $ff
	ld [wDexCurDenjuu], a
	jr .asm_115de

.asm_11605
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

.asm_11610
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_11643
	ld a, [wDexCurDenjuu]
	ld [wcb20], a
.asm_1161d
	ld a, [wDexCurDenjuu]
	cp $0
	jr z, .asm_1163a
	dec a
	ld [wDexCurDenjuu], a
	ld a, [wDexCurDenjuu]
	call CheckCaughtDenjuu
	jr nz, .asm_11605
	ld a, [wDexCurDenjuu]
	call CheckSeenDenjuu
	jr nz, .asm_11605
	jr .asm_1161d

.asm_1163a
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
	ld [wDexCurDenjuu], a
	jr .asm_1161d

.asm_11643
	ret

Func_11644: ; 11644 (4:5644)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	call Func_13a0b
	ld bc, $48
	check_cgb
	jr z, .asm_11663
	ld bc, $5b
.asm_11663
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	call Func_13a1e
	call Func_13e58
	xor a
	ld [wcb2b], a
	xor a
	ld [wBGPalUpdate], a
	call Func_13eb5
	call Func_13f8c
	ld a, $4
	call StartFade_
	ret

Func_11690: ; 11690 (4:5690)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_1169d: ; 1169d (4:569d)
	ld a, [wDexCurDenjuu]
	ld [wCurDenjuu], a
	call PrintCurDenjuuTypeName_
	ld a, [wDexCurDenjuu]
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	ld a, [wDexCurDenjuu]
	call GetDenjuuPalette_Pal6
	ld a, [wDexCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
	ld a, [wDexCurDenjuu]
	ld de, VTilesBG tile $20
	call GetCurDenjuuKanjiDescription
	ld hl, VTilesShared tile $40
	ld b, $20
	call ClearTiles
	ld a, $c0
	ld [wTextBoxStartTile], a
	call Func_13f70
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $6
	ld [wSubroutine2], a
	ret

UpdatePhoneClockDisplay: ; 116e7 (4:56e7)
	ld a, [wcb2b]
	cp $0
	ret nz
	call Func_11773
	ld a, [wCurHours]
	call Get2DigitBCD
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $20
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $20
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, [wCurMinutes]
	call Get2DigitBCD
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $20
	ld [wOAMAnimation19_TemplateIdx], a
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $20
	ld [wOAMAnimation20_TemplateIdx], a
	ld de, wOAMAnimation17
	lb bc, $20, $20
	call Func_11789
	ld de, wOAMAnimation18
	lb bc, $28, $20
	call Func_11789
	ld de, wOAMAnimation19
	lb bc, $38, $20
	call Func_11789
	ld de, wOAMAnimation20
	lb bc, $40, $20
	call Func_11789
	ld de, wOAMAnimation21
	lb bc, $30, $20
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_12baa

InGamePhone_HideClockDisplay: ; 1175d (4:575d)
	xor a
	ld [wOAMAnimation17_PriorityFlags], a
	ld [wOAMAnimation18_PriorityFlags], a
	ld [wOAMAnimation19_PriorityFlags], a
	ld [wOAMAnimation20_PriorityFlags], a
	ld [wOAMAnimation21_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_11773: ; 11773 (4:5773)
	call GetRTC
	ld a, [wCurSeconds]
	and $1
	add $2a
	ld [wOAMAnimation21_TemplateIdx], a
	ret

Func_11781:
	ld hl, $0
	add hl, de
	inc hl
	jp Func_11790

Func_11789: ; 11789 (4:5789)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hli], a
Func_11790: ; 11790 (4:5790)
	ld a, $0
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Func_11799: ; 11799 (4:5799)
	ld a, [wcb3c]
	cp $0
	jr nz, .asm_117b4
	lb bc, 3, 6
	call Func_11939
	ld a, [wcb38]
	cp $3
	jr nz, .asm_117af
	ld a, $ff
.asm_117af
	inc a
	ld [wcb38], a
	ret

.asm_117b4
	ld bc, $306
	call Func_11985
	ld a, [wcb3a]
	inc a
	and $3
	ld [wcb3a], a
	ret

Func_117c4: ; 117c4 (4:57c4)
	ld a, [wcb3c]
	cp $0
	jr nz, .asm_117df
	lb bc, 3, 8
	call Func_11939
	ld a, [wcb38]
	cp $0
	jr nz, .asm_117da
	ld a, $4
.asm_117da
	dec a
	ld [wcb38], a
	ret

.asm_117df
	ld bc, $308
	call Func_11985
	ld a, [wcb3a]
	dec a
	and $3
	ld [wcb3a], a
	ret
