TopPhoneMenu:
	ld a, [wSubroutine]
	ld hl, Pointers_1000a
	call GetHalfwordFromTable
	jp [hl]

Pointers_1000a:
	dw Func_10054 ; 00
	dw Func_1006e ; 01
	dw Func_10089 ; 02
	dw Func_100bd ; 03
	dw Func_100ea ; 04
	dw Func_100fa ; 05
	dw Func_10108 ; 06
	dw Func_10113 ; 07
	dw Func_1013b ; 08
	dw Func_101ec ; 09
	dw Func_101f7 ; 0a
	dw Func_10205 ; 0b
	dw Func_10216 ; 0c
	dw Func_10221 ; 0d
	dw Phone_Load ; 0e
	dw Func_10265 ; 0f
	dw Func_1028a ; 10
	dw Func_102aa ; 11
	dw Func_102b3 ; 12
	dw Func_102cd ; 13
	dw Func_1031c ; 14
	dw Func_10328 ; 15
	dw Func_10339 ; 16
	dw Func_10346 ; 17
	dw Func_1037f ; 18
	dw Func_103a5 ; 19
	dw Func_103b4 ; 1a
	dw Func_103e2 ; 1b
	dw Func_10400 ; 1c
	dw Func_1040e ; 1d
	dw Func_10424 ; 1e
	dw Func_1006e ; 1f
	dw Func_10452 ; 20
	dw Func_10546 ; 21
	dw Func_10558 ; 22
	dw Func_1056a ; 23
	dw Phone_Save ; 24

Func_10054: ; 10054 (4:4054)
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	xor a
	ld [wcb28], a
	ld [wcb2a], a
IF DEF(POWER)
	ld a, $0
ELSE
	ld a, $3
ENDC
	ld [wCurPhoneGFX], a
	jp IncrementSubroutine

Func_1006e: ; 1006e (4:406e)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_13f51
	ld bc, $11
	call DecompressGFXByIndex_
	call Func_129c4
	call LoadPhoneKeypad
	jp IncrementSubroutine

Func_10089: ; 10089 (4:4089)
	ld a, $1
	ld [wdd06], a
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
	xor a
	ld [wcb38], a
	ld [wcb39], a
	ld [wcb3c], a
	ld a, $3
	ld [wcb3a], a
	jp IncrementSubroutine

Func_100bd: ; 100bd (4:40bd)
	ld a, $10
	ld [wcb39], a
	ld b, $0
	ld a, [wc434]
	cp $0
	jr z, .asm_100cd
	ld b, $3
.asm_100cd
	ld a, b
	ld [wcb38], a
	ld a, [wcb3f]
	cp $0
	jr z, .asm_100dd
	ld a, $2
	ld [wcb38], a
.asm_100dd
	xor a
	ld [wcb3f], a
	ld [wc900], a
	call Func_11927
	jp IncrementSubroutine

Func_100ea: ; 100ea (4:40ea)
	call Func_13a1e
	ld a, $a7
	ld [wWX], a
	ld a, $50
	ld [wSCX], a
	jp IncrementSubroutine

Func_100fa: ; 100fa (4:40fa)
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	jp IncrementSubroutine

Func_10108: ; 10108 (4:4108)
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10113: ; 10113 (4:4113)
	ld a, $e3
	ld [wLCDC], a
	xor a
	ld [wSCY], a
	ld a, [wSCX]
	sub $10
	ld [wSCX], a
	ld a, [wWX]
	sub $10
	ld [wWX], a
	cp $58
	ret nc
	ld a, $58
	ld [wWX], a
	xor a
	ld [wSCX], a
	jp IncrementSubroutine

Func_1013b: ; 1013b (4:413b)
	call Func_11913
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_10149
	ld a, $9
	jr .asm_10152

.asm_10149
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_1015b
	ld a, $c
.asm_10152
	ld [wSubroutine], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_1015b
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_101eb
	xor a
	ld [wcb3f], a
	ld a, [wcb38]
	cp $0
	jr z, .asm_101b7
	cp $3
	jp z, Func_101d9
	cp $1
	jr z, .asm_10192
	cp $2
	jr z, .asm_1017b
	ret

.asm_1017b
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $1
	ld [wcb3f], a
	xor a
	ld [wSubroutine], a
	ld [wBattleSubroutine], a
	ld a, $f
	ld [wGameRoutine], a
	ret

.asm_10192
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $3
	ld [H_SFX_ID], a
	ld bc, $104
	ld e, $3b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $18
	ld [wSubroutine], a
	jp Func_12cd3

.asm_101b7
	ld a, [wc434]
	cp $1
	jr z, .asm_101d3
	ld a, $4
	call Func_050a
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $10
	ld [wcf96], a
	ld a, $e
	ld [wSubroutine], a
	ret

.asm_101d3
	ld a, $5
	ld [H_SFX_ID], a
	ret

Func_101d9: ; 101d9 (4:41d9)
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $f
	ld [wSubroutine], a
	xor a
	ld [wcb39], a
	ld [wcb3a], a
	ret

Func_101eb: ; 101eb (4:41eb)
	ret

Func_101ec: ; 101ec (4:41ec)
	ld e, $1e
	call Func_13f3f
	call Func_11799
	jp IncrementSubroutine

Func_101f7: ; 101f7 (4:41f7)
	ld e, $1f
	call Func_13f3f
	ld bc, $307
	call Func_11939
	jp IncrementSubroutine

Func_10205: ; 10205 (4:4205)
	ld e, $12
	call Func_13f3f
	ld bc, $307
	call Func_11939
	ld a, $8
	ld [wSubroutine], a
	ret

Func_10216: ; 10216 (4:4216)
	ld e, $1f
	call Func_13f3f
	call Func_117c4
	jp IncrementSubroutine

Func_10221: ; 10221 (4:4221)
	ld e, $1e
	call Func_13f3f
	ld bc, $306
	call Func_11939
	ld a, $b
	ld [wSubroutine], a
	ret

Phone_Load: ; 10232 (4:4232)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wcb2a], a
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	call LoadGame_
	ld b, $1
	call Func_3768
	ld a, $1
	ld [wc900], a
	ret

Func_10265: ; 10265 (4:4265)
	ld e, $2d
	call Func_13951
	ld a, [wc434]
	cp $0
	jr nz, .asm_10287
	ld bc, $d
	check_cgb
	jr z, .asm_1027e
	ld bc, $56
.asm_1027e
	call DecompressGFXByIndex_
	ld a, $1b
	ld [wSubroutine], a
	ret

.asm_10287
	jp IncrementSubroutine

Func_1028a: ; 1028a (4:428a)
	ld bc, $104
	ld e, $14
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_12a4e
	ld a, $5
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wcb3e], a
	call Func_1189e
	jp IncrementSubroutine

Func_102aa: ; 102aa (4:42aa)
	ld de, wOAMAnimation02
	call Func_0616
	jp SelectTime

Func_102b3: ; 102b3 (4:42b3)
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld b, $50
	ld c, $50
	ld de, wOAMAnimations
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_11d40
	jp IncrementSubroutine

Func_102cd: ; 102cd (4:42cd)
	ld hl, VTilesBG tile $78
	ld b, $8
	call Func_13fd2
	xor a
	ld [wca65], a
	call Func_13fdf
	ld a, $78
	ld [wc91f], a
	xor a
	ld [wcb3e], a
	ld [wcb38], a
	ld a, $1
	ld [wcb2a], a
	ld a, $ff
	ld [wcb66], a
	call Func_128ff
	ld a, $2
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $2
	ld [wcb28], a
	call LoadPhoneKeypad
	call PaletteFade8
	call Func_1249a
	ld bc, $104
	ld e, $35
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_1265a
	jp IncrementSubroutine

Func_1031c: ; 1031c (4:431c)
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	call Func_128ff
	jp Func_124a9

Func_10328: ; 10328 (4:4328)
	ld b, $9
	ld hl, wOAMAnimationsEnd
	ld de, wc92c
.asm_10330
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_10330
	jp IncrementSubroutine

Func_10339: ; 10339 (4:4339)
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_10346: ; 10346 (4:4346)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wcb2a], a
	ld [wFontPaletteMode], a
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ld b, $1
	call Func_3768
	call ClearSRAM
	call DeleteSaveFile
	call Func_1a09
	jp SetRTC

Func_1037f: ; 1037f (4:437f)
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	ld a, $3
	ld [wd411], a
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0609
	xor a
	ld [wcb41], a
	ld [wcb40], a
	ld [wcb42], a
	call Func_12cd3
	jp IncrementSubroutine

Func_103a5: ; 103a5 (4:43a5)
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0616
	jp Func_12bbc

Func_103b4: ; 103b4 (4:43b4)
	ld bc, $1b
	check_cgb
	jr z, .asm_103c1
	ld bc, $55
.asm_103c1
	call DecompressGFXByIndex_
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	call Func_11927
	ld a, $8
	ld [wSubroutine], a
	ret

Func_103e2: ; 103e2 (4:43e2)
	ld bc, $104
	ld e, $5a
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wcb68], a
	call Func_13cf4
	jp IncrementSubroutine

Func_10400: ; 10400 (4:4400)
	ld de, wOAMAnimation02
	call Func_0616
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_13c8f

Func_1040e: ; 1040e (4:440e)
	ld bc, $1b
	check_cgb
	jr z, .asm_1041b
	ld bc, $55
.asm_1041b
	call DecompressGFXByIndex_
	ld a, $10
	ld [wSubroutine], a
	ret

Func_10424: ; 10424 (4:4424)
	ld bc, $1b
	check_cgb
	jr z, .asm_10431
	ld bc, $55
.asm_10431
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_11927
	ld a, $8
	ld [wSubroutine], a
	ret

Func_10452: ; 10452 (4:4452)
	ld bc, $17
	check_cgb
	jr z, .asm_1045f
	ld bc, $58
.asm_1045f
	call DecompressGFXByIndex_
	ld hl, VTilesBG tile $70
	ld b, $10
	call ClearTiles
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
	ld bc, $104
	ld e, $3a
	call Phone_LoadStdBGMapTileAndAttrLayout
	xor a
	ld [wca65], a
	call Func_13fdf
	ld a, $78
	ld [wc91f], a
	call PaletteFade8
	xor a
	ld [wcb3e], a
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	call Func_128ff
	ld a, $2
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	ld a, $2
	ld [wcb28], a
	call LoadPhoneKeypad
	ld a, $1
	ld [wcb2a], a
	call Func_13a1e
	xor a
	ld [wBGPalUpdate], a
	ld a, $e3
	ld [wLCDC], a
	ld a, $58
	ld [wWX], a
	xor a
	ld [wWY], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wcb38], a
	ld a, $4
	ld [wcb65], a
	call Func_12921
	call Func_11d40
	ld hl, VTilesBG tile $70
	ld b, $10
	call Func_13fd2
	ld a, $70
	ld [wc91f], a
	ld a, [wd480]
	ld [wd435], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld d, $c
	call Func_11a80
	ld a, [wd480]
	call Func_13d46
	ld a, $c
	ld [wd411], a
	ld de, wOAMAnimation05
	call Func_0609
	ld a, $28
	ld [wOAMAnimation05_XCoord], a
	ld a, $40
	ld [wOAMAnimation05_YCoord], a
	ld a, $1
	ld [wOAMAnimation05], a
	ld a, $0
	ld [wOAMAnimation05_TemplateBank], a
	ld a, $78
	ld [wc91f], a
	call PaletteFade8
	ld a, [wd4a7]
	call Func_13d8c
	call Func_127b7
	ld d, $c
	call Func_1249a
	call Func_1265a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_10546: ; 10546 (4:4546)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10558: ; 10558 (4:4558)
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	ld de, wOAMAnimation05
	call Func_0616
	call Func_12921
	jp Func_12582

Func_1056a: ; 1056a (4:456a)
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, [wd4a7]
	call Func_13dca
	jp IncrementSubroutine

Phone_Save: ; 1057d (4:457d)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wcb2a], a
	ld [wFontPaletteMode], a
	ld a, [wcb3f]
	cp $0
	jr z, .asm_105b0
	ld b, $0
	call Func_3768
	call SaveGame_
	xor a
	ld [wSubroutine], a
	ret

.asm_105b0
	ld b, $1
	call Func_3768
	ld a, $5
	ld [wGameRoutine], a
	ld a, $a
	ld [wSubroutine], a
	ret

InGamePhoneMenu: ; 105c0 (4:45c0)
	ld a, [wSubroutine]
	ld hl, Pointers_105ca
	call GetHalfwordFromTable
	jp [hl]

Pointers_105ca:
	dw Func_10612
	dw Func_10621
	dw Func_10627
	dw Func_10642
	dw Func_10658
	dw Func_10681
	dw Func_10743
	dw Func_107d9
	dw Func_107ee
	dw Func_10807
	dw Func_1082e
	dw Func_1084e
	dw Func_10866
	dw Func_10872
	dw Func_10883
	dw Func_1089c
	dw Func_10a49
	dw Func_10e5b
	dw Func_10ee7
	dw Func_112e3
	dw InGamePhone_Save
	dw Func_1107e
	dw Func_110ee
	dw Func_108ab
	dw DenjuuDex
	dw Func_108cb
	dw Func_10907
	dw Func_10936
	dw Func_10953
	dw Func_10969
	dw Func_109a8
	dw Func_109a9
	dw Func_109aa
	dw Func_109dc
	dw Func_109f3
	dw Func_10a09

Func_10612: ; 10612 (4:4612)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_13a0b
	jp IncrementSubroutine

Func_10621: ; 10621 (4:4621)
	call Func_13e27
	jp IncrementSubroutine

Func_10627: ; 10627 (4:4627)
	call Func_13a1e
	ld a, $a7
	ld [wWX], a
	xor a
	ld [wWY], a
	ld a, $50
	ld [wSCX], a
	xor a
	ld [wSCY], a
	call Func_119cd
	jp IncrementSubroutine

Func_10642: ; 10642 (4:4642)
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10658: ; 10658 (4:4658)
	ld a, $e3
	ld [wLCDC], a
	xor a
	ld [wSCY], a
	ld a, [wSCX]
	sub $10
	ld [wSCX], a
	ld a, [wWX]
	sub $10
	ld [wWX], a
	cp $58
	ret nc
	ld a, $58
	ld [wWX], a
	ld a, $0
	ld [wSCX], a
	jp IncrementSubroutine

Func_10681: ; 10681 (4:4681)
	call Func_119b9
	call Func_116e7
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_10697
	ld a, $b
	jr .asm_106a0

.asm_10697
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_106a9
	ld a, $e
.asm_106a0
	ld [wSubroutine], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_106a9
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_106f2
	ld a, [wcd22]
	cp $0
	jr z, .asm_106de
	cp $1
	jr z, .asm_106d6
	cp $2
	jr z, .asm_106da
	cp $3
	jr z, .asm_106da
	cp $4
	jr z, .asm_106da
	cp $5
	jr z, .asm_106da
	cp $6
	jr z, .asm_106da
	cp $7
	jr z, .asm_106f8
	ld a, $18
	jr .asm_106e0

.asm_106d6
	ld a, $16
	jr .asm_106e0

.asm_106da
	add $f
	jr .asm_106e0

.asm_106de
	ld a, $10
.asm_106e0
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld e, $2d
	call Func_13951
	ld a, $3
	ld [H_SFX_ID], a
	ret

.asm_106f2
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10708
.asm_106f8
	ld a, $4
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $17
	ld [wSubroutine], a
	ret

.asm_10708
	ld a, [hJoyNew]
	and SELECT
	jr z, .asm_10742
	ld a, $4
	ld [wcb65], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d40
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld bc, $d
	ld hl, wd000
	call ClearMemory3
	ld bc, $d
	ld hl, wd200
	call ClearMemory3
	xor a
	ld [wcb29], a
	ld [wcb43], a
	ld [wcb39], a
	jp IncrementSubroutine

.asm_10742
	ret

Func_10743: ; 10743 (4:4743)
	ld a, [wcb29]
	cp $0
	call z, Func_116e7
	ld a, [hJoyNew]
	and SELECT
	jr z, .asm_10778
	ld a, [wcb29]
	cp $0
	jr z, .asm_10764
.asm_10758
	call Func_13e37
	ld bc, $307
	call Func_119df
	call Func_135ef
.asm_10764
	ld de, wOAMAnimation01
	call Func_099c
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

.asm_10778
	call Func_11b37
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_107b6
	call Func_126a1
	ld a, [wcb65]
	cp $0
	ret z
	cp $1
	ret z
	cp $2
	ret z
	cp $3
	jr nz, .asm_1079f
	call Func_1360a
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

.asm_1079f
	ld a, [wcb29]
	cp $0
	jr nz, .asm_107b3
	ld a, $1
	ld [wcb29], a
	ld e, $2d
	call Func_13951
	call Func_1175d
.asm_107b3
	jp Func_13474

.asm_107b6
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_107d8
	ld a, [wcb39]
	cp $0
	jr z, .asm_10758
	dec a
	ld [wcb39], a
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	xor a
	ld [hl], a
	ld a, $4
	ld [H_SFX_ID], a
	jp Func_134aa

.asm_107d8
	ret

Func_107d9: ; 107d9 (4:47d9)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_107ee: ; 107ee (4:47ee)
	ld a, $65
	ld [H_SFX_ID], a
	ld a, [wcb43]
	cp $0
	jr z, .asm_107ff
	ld a, $66
	ld [H_SFX_ID], a
.asm_107ff
	ld a, $80
	ld [wcb2c], a
	jp IncrementSubroutine

Func_10807: ; 10807 (4:4807)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, [wcb43]
	cp $0
	jr z, .asm_1082b
	ld a, $4
	call Func_050a
	ld a, $19
	ld [wSubroutine], a
	ret

.asm_1082b
	jp IncrementSubroutine

Func_1082e: ; 1082e (4:482e)
	call Func_13e37
	ld bc, $307
	call Func_119df
	call Func_135ef
	ld de, wOAMAnimation01
	call Func_099c
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

Func_1084e: ; 1084e (4:484e)
	call Func_13f38
	ld bc, $306
	call Func_119df
	ld a, [wcd22]
	inc a
	cp $9
	jr nz, .asm_10860
	xor a
.asm_10860
	ld [wcd22], a
	jp IncrementSubroutine

Func_10866: ; 10866 (4:4866)
	call Func_13f3d
	ld bc, $308
	call Func_119df
	jp IncrementSubroutine

Func_10872: ; 10872 (4:4872)
	ld e, $12
	call Func_13951
	ld bc, $307
	call Func_119df
	ld a, $5
	ld [wSubroutine], a
	ret

Func_10883: ; 10883 (4:4883)
	call Func_13f3d
	ld bc, $308
	call Func_119df
	ld a, [wcd22]
	dec a
	cp $ff
	jr nz, .asm_10896
	ld a, $8
.asm_10896
	ld [wcd22], a
	jp IncrementSubroutine

Func_1089c: ; 1089c (4:489c)
	call Func_13f38
	ld bc, $306
	call Func_119df
	ld a, $d
	ld [wSubroutine], a
	ret

Func_108ab: ; 108ab (4:48ab)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wcad0], a
	ld a, $5
	ld [wGameRoutine], a
	ld a, $a
	ld [wSubroutine], a
	call Func_13e6e
	xor a
	ld [wcb2b], a
	ld [wFontPaletteMode], a
	ret

Func_108cb: ; 108cb (4:48cb)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_135ef
	ld a, [wcb43]
	cp $1
	jr z, .asm_10904
	call Func_13b3a
	cp $0
	jr nz, .asm_108e9
	ld a, $20
	ld [wSubroutine], a
	ret

.asm_108e9
	ld a, [wcb01]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	ld [wcb01], a
	ld a, $3
	ld [wcb43], a
.asm_10904
	jp IncrementSubroutine

Func_10907: ; 10907 (4:4907)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	call Func_13e6e
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine

Func_10936: ; 10936 (4:4936)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call Func_13c53
	ld a, [wcb43]
	cp $3
	jr nz, .asm_1094b
	ld c, $fd
	ld b, $1
.asm_1094b
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_10953: ; 10953 (4:4953)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_10969: ; 10969 (4:4969)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wcad0], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb04]
	jp Func_13fb5

Func_109a8: ; 109a8 (4:49a8)
	ret

Func_109a9: ; 109a9 (4:49a9)
	ret

Func_109aa: ; 109aa (4:49aa)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_13c7e
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	call Func_13e6e
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine

Func_109dc: ; 109dc (4:49dc)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wcb01]
	add $80
	ld c, a
	ld b, $1
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_109f3: ; 109f3 (4:49f3)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_10a09: ; 10a09 (4:4a09)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wcad0], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb01]
	call Func_13b79
	ret

Func_10a49: ; 10a49 (4:4a49)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_10a56
	call GetHalfwordFromTable
	jp [hl]

Pointers_10a56:
	dw Func_10a86
	dw Func_10a9c
	dw Func_10ad6
	dw Func_10afc
	dw Func_10b92
	dw Func_10bbd
	dw Func_10bc0
	dw Func_10bce
	dw Func_10bf3
	dw Func_10c47
	dw Func_13f47
	dw Func_13f4e
	dw Func_10c4a
	dw Func_10c90
	dw Func_10cb4
	dw Func_10cc9
	dw Func_10d30
	dw Func_10d86
	dw Func_10dd3
	dw Func_10dec
	dw Func_10e37
	dw Func_10e45
	dw Func_10e59
	dw Func_10e5a

Func_10a86:
	call Func_1236b
	ld bc, $12
	check_cgb
	jr z, .asm_10a96
	ld bc, $57
.asm_10a96
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_10a9c:
	ld a, [wcd24]
	ld b, a
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp b
	jr nc, .asm_10aae
	ld a, [wcd24]
	dec a
	ld [wcd24], a
.asm_10aae
	ld a, [wcd24]
	call Func_12473
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, [wcd24]
	call Func_12473
	call Func_1764
.asm_10ac5
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wcd24]
	call Func_12473
	call Func_11a35
	jp IncrementSubroutine2

Func_10ad6:
	ld e, $2e
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13124
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_10afc:
	call Func_132d9
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr z, .asm_10b2f
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_10b2f
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	ld b, a
	ld a, [wcd24]
	cp b
	jr nz, .asm_10b20
	ld a, $ff
.asm_10b20
	inc a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_10b2f
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr z, .asm_10b57
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_10b57
	ld a, [wcd24]
	cp $0
	jr nz, .asm_10b48
	ld a, [wLastDenjuuSeenOrCaught]
.asm_10b48
	dec a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_10b57
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10b70
	ld e, $2d
	call Func_13951
	ld a, $4
	ld [H_SFX_ID], a
	call Func_13fc6
	ld a, $a
	ld [wSubroutine2], a
	ret

.asm_10b70
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_10b91
	ld a, $3
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	xor a
	ld [wcb67], a
	call Func_13fc6
	ld a, $4
	call Func_050a
	ld a, $7
	ld [wSubroutine2], a
.asm_10b91
	ret

Func_10b92:
	ld bc, $1a
	check_cgb
	jr z, .asm_10b9f
	ld bc, $54
.asm_10b9f
	call DecompressGFXByIndex_
	ld e, $3e
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call Func_1329a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_10bbd:
	jp IncrementSubroutine2

Func_10bc0:
	ld de, wOAMAnimation02
	call Func_0616
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_131a0

Func_10bce:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	call Func_136d2
	call ClearObjectAnimationBuffers
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld [wcb2b], a
	ld a, $9
	ld [wGameRoutine], a
	xor a
	ld [wMoveAnimationSubroutine], a
	ld [wFontPaletteMode], a
	ret

Func_10bf3:
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, [wcb2b]
	cp $1
	jr nz, .asm_10c3d
	ld bc, $12
	check_cgb
	jr z, .asm_10c2e
	ld bc, $57
.asm_10c2e
	call DecompressGFXByIndex_
	ld a, $1
	ld [wSubroutine2], a
	xor a
	ld [wcb2b], a
	jp Func_1236b

.asm_10c3d
	xor a
	ld [wcb2b], a
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10c47:
	jp Func_12b2b

Func_10c4a:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	call ClearObjectAnimationBuffers
	call Func_13e4c
	ld [wcb04], a
	call Func_13a30
	call Func_1371c
	call Func_13f15
	ld e, $1c
	lb bc, $6, $3
	ld a, $0
	call LoadStdBGMapLayout_
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	ld a, $2
	ld [wcad0], a
	ld a, [wcb04]
	call Func_13fb5
	jp IncrementSubroutine2

Func_10c90:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	call Func_070c
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_10cb4:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld c, $fe
	ld b, $1
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_10cc9:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld bc, EVENT_C3E
	call CheckEventFlag
	jr nz, .asm_10ce7
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

.asm_10ce7
	ld a, $3
	ld [H_SFX_ID], a
	call Func_06d4
	ld a, [wPartnerDenjuuHPRemaining]
	cp c
	jr nz, .asm_10d21
	call Func_13e4c
	ld b, a
	ld a, [wcdb4]
	cp b
	jr z, .asm_10d1d
	ld a, b
	ld [wcdb4], a
	call Func_13a30
	ld [wc912], a
	ld a, $8
	ld [wc900], a
	ld a, $4
	call Func_050a
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

.asm_10d1d
	ld c, $f0
	jr .asm_10d23

.asm_10d21
	ld c, $f1
.asm_10d23
	ld b, $1
	ld d, $c
	call Func_0520
	ld a, $15
	ld [wSubroutine2], a
	ret

Func_10d30:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wcad0], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $12
	check_cgb
	jr z, .asm_10d4e
	ld bc, $57
.asm_10d4e
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld a, $1
	ld [wSubroutine2], a
	jp Func_1236b

Func_10d86:
	ld e, $58
	call Func_13951
	call Func_13dea
	call Func_13907
	sla a
	sla a
	sla a
	add $38
	ld [wOAMAnimation03_YCoord], a
	ld a, $10
	ld [wOAMAnimation03_XCoord], a
	ld a, $1
	ld [wOAMAnimation03], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $d
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wcb67], a
	call Func_138e2
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_10dd3:
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	call Func_0616
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $c
	ld [wcb2c], a
	jp Func_13816

Func_10dec:
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $1
	jr z, .asm_10e2e
	cp $0
	ret nz
	ld e, $2d
	call Func_13951
	check_cgb
	jr z, .asm_10e14
	ld bc, $54
	call DecompressGFXByIndex_
	ld bc, $57
	call DecompressGFXByIndex_
	jr .asm_10e20

.asm_10e14
	ld bc, $1a
	call DecompressGFXByIndex_
	ld bc, $12
	call DecompressGFXByIndex_
.asm_10e20
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $1
	ld [wSubroutine2], a
	ret

.asm_10e2e
	call Func_13fc6
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_10e37:
	ld de, wOAMAnimation02
	call Func_0616
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_1396d

Func_10e45:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wSubroutine2], a
	ret

Func_10e59:
	ret

Func_10e5a:
	ret

Func_10e5b: ; 10e5b (4:4e5b)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_10e68
	call GetHalfwordFromTable
	jp [hl]

Pointers_10e68:
	dw Func_10e78
	dw Func_10e7b
	dw Func_10e8e
	dw Func_10ed2
	dw Func_10edb
	dw Func_13f47
	dw Func_13f4e
	dw Func_10ede

Func_10e78:
	jp IncrementSubroutine2

Func_10e7b:
	ld bc, $13
	check_cgb
	jr z, .asm_10e88
	ld bc, $5a
.asm_10e88
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_10e8e:
	ld e, $30
	call Func_13931
	ld e, $35
	call Func_13939
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb65], a
	ld [wcb67], a
	ld [wcb68], a
	ld [wcb69], a
	ld [wcb6a], a
	ld [wcb6b], a
	ld [wcb6c], a
	ld [wcb6d], a
	ld a, $ff
	ld [wcb66], a
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call Func_11fe9
	jp IncrementSubroutine2

Func_10ed2:
	ld de, wOAMAnimation02
	call Func_0616
	jp Func_1208b

Func_10edb:
	jp Func_11aaf

Func_10ede:
	call Func_11c1d
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10ee7: ; 10ee7 (4:4ee7)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_10ef4
	call GetHalfwordFromTable
	jp [hl]

Pointers_10ef4:
	dw Func_10f06
	dw Func_10f3a
	dw Func_10f4d
	dw Func_10f82
	dw Func_1100c
	dw Func_11021
	dw Func_11022
	dw Func_13f47
	dw Func_13f4e

Func_10f06:
	xor a
	ld [wcb6f], a
	call Func_12279
	ld a, [wcb37]
	cp $0
	jr z, .asm_10f1b
	xor a
	ld [wcb6f], a
	jp IncrementSubroutine2

.asm_10f1b
	ld c, $43
	ld hl, VTilesBG tile $40
	call Func_0630
	ld b, $43
	call Func_122d6
	ld e, $31
	call Func_13951
	xor a
	hlbgcoord 6, 16
	call Func_127e3
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10f3a:
	ld a, [wcb6f]
	call Func_122ba
	ld c, b
	ld hl, VTilesBG tile $40
	call Func_0630
	call Func_122d0
	jp IncrementSubroutine2

Func_10f4d:
	ld a, [wcb6f]
	call Func_122ba
	ld a, b
	call Func_11a59
	ld e, $31
	call Func_13951
	lb bc, $1, $d
	ld e, $2f
	ld a, $0
	call LoadStdBGMapLayout_
	call Func_127da
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	jp IncrementSubroutine2

Func_10f82:
	call Func_1336e
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_10fad
	ld a, [wcb37]
	dec a
	ld b, a
	ld a, [wcb6f]
	cp b
	jr nz, .asm_10f9e
	ld a, $ff
.asm_10f9e
	inc a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_10fad
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_10fcd
	ld a, [wcb6f]
	cp $0
	jr nz, .asm_10fbe
	ld a, [wcb37]
.asm_10fbe
	dec a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_SFX_ID], a
	ret

.asm_10fcd
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10fe6
	ld a, $4
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	call Func_13fc6
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_10fe6
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [wc900], a
	ld a, [wcb6f]
	call Func_122ba
	ld a, b
	ld [wc90d], a
	ld a, $4
	call Func_050a
	call Func_13fc6
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

Func_1100c:
	ld a, [hJoyNew]
	and $3
	ret z
	ld e, $2d
	call Func_13951
	ld a, $4
	ld [H_SFX_ID], a
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11021:
	ret

Func_11022:
	ret

InGamePhone_Save: ; 11023 (4:5023)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_11030
	call GetHalfwordFromTable
	jp [hl]

Pointers_11030:
	dw .Init
	dw .Menu
	dw .Delay
	dw .ButtonPress
	dw Func_13f47
	dw Func_13f4e

.Init: ; 1103c (4:503c)
	ld e, $32
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wcb67], a
	call Func_12352
	jp IncrementSubroutine2

.Menu: ; 11056 (4:5056)
	ld de, wOAMAnimation02
	call Func_0616
	jp Phone_SaveMenu_JoypadAction

.Delay: ; 1105f (4:505f)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld e, $34
	call Func_13931
	jp IncrementSubroutine2

.ButtonPress: ; 11071 (4:5071)
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld e, $2d
	call Func_13951
	jp IncrementSubroutine2

Func_1107e: ; 1107e (4:507e)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_1108b
	call GetHalfwordFromTable
	jp [hl]


Pointers_1108b:
	dw Func_1109b
	dw Func_110bb
	dw Func_110d6
	dw Func_110d9
	dw Func_110e8
	dw Func_110eb
	dw Func_13f47
	dw Func_13f4e

Func_1109b:
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $3
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	xor a
	ld [wcb3e], a
	call Func_12d63
	jp IncrementSubroutine2

Func_110bb:
	ld bc, $5
	check_cgb
	jr z, .asm_110c8
	ld bc, $59
.asm_110c8
	call DecompressGFXByIndex_
	ld e, $17
	call Func_13951
	call Func_12dc7
	jp IncrementSubroutine2

Func_110d6:
	jp IncrementSubroutine2

Func_110d9:
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	call Func_0616
	jp Func_12e00

Func_110e8:
	jp IncrementSubroutine2

Func_110eb:
	jp IncrementSubroutine2

Func_110ee:
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_110fb
	call GetHalfwordFromTable
	jp [hl]

Pointers_110fb:
	dw Func_11119
	dw Func_11133
	dw Func_11159
	dw Func_11177
	dw Func_111dd
	dw Func_111f3
	dw Func_111f6
	dw Func_1120c
	dw Func_11241
	dw Func_11265
	dw Func_11276
	dw Func_112d7
	dw Func_112d8
	dw Func_13f47
	dw Func_13f4e

Func_11119: ; 11119 (4:5119)
	xor a
	ld [wcb67], a
	ld [wcb68], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	jp IncrementSubroutine2

Func_11133: ; 11133 (4:5133)
	call Func_12f14
	ld a, [wcb68]
	cp $0
	jr nz, .asm_1114b
	call Func_137a1
	ld e, $6
	call Func_13951
	call Func_12f31
	jp IncrementSubroutine2

.asm_1114b
	ld hl, VTilesBG tile $40
	ld b, $4
	call ClearTiles
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_11159: ; 11159 (4:5159)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11167
	ld a, $4
	ld [H_SFX_ID], a
	jp Func_11171

.asm_11167
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
Func_11171: ; 11171 (4:5171)
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_11177: ; 11177 (4:5177)
	ld bc, $1a
	check_cgb
	jr z, .asm_11184
	ld bc, $54
.asm_11184
	call DecompressGFXByIndex_
	ld e, $3c
	call Func_13951
	lb bc, $1, $b
	ld e, $22
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wcb67]
	call Func_12fd8
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld a, [wcb68]
	cp $1
	jr nz, .asm_111da
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_111da
	jp IncrementSubroutine2

Func_111dd: ; 111dd (4:51dd)
	ld a, [wcb68]
	cp $1
	jr z, .asm_111f0
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	call Func_0616
.asm_111f0
	jp Func_12f59

Func_111f3: ; 111f3 (4:51f3)
	jp Func_12b6c

Func_111f6: ; 111f6 (4:51f6)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	jp IncrementSubroutine2

Func_1120c: ; 1120c (4:520c)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_137df
	push af
	ld [wcb04], a
	call Func_137fa
	call Func_1371c
	pop af
	call Func_13f18
	ld e, $1c
	lb bc, $6, $3
	ld a, $0
	call LoadStdBGMapLayout_
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine2

Func_11241: ; 11241 (4:5241)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	call Func_070c
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_11265: ; 11265 (4:5265)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

Func_11276: ; 11276 (4:5276)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wcad0], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld hl, VTilesBG tile $40
	ld b, $38
	call Func_11a1c
	ld e, $2d
	call Func_13951
	ld a, $1
	ld [wSubroutine2], a
	call Func_13fdf
	ld a, [wcb04]
	jp Func_13fb5

Func_112d7: ; 112d7 (4:52d7)
	ret

Func_112d8: ; 112d8 (4:52d8)
	ld e, $2d
	call Func_13951
	call Func_13fc6
	jp IncrementSubroutine2

Func_112e3:
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_112f0
	call GetHalfwordFromTable
	jp [hl]

Pointers_112f0:
	dw Func_11304
	dw Func_1132a
	dw Func_1133b
	dw Func_11370
	dw Func_113d6
	dw Func_113ec
	dw Func_113f4
	dw Func_1140c
	dw Func_13f47
	dw Func_13f4e

Func_11304: ; 11304 (4:5304)
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	xor a
	ld [wcb67], a
	ld [wcb68], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	xor a
	ld [wc90b], a
	jp IncrementSubroutine2

Func_1132a: ; 1132a (4:532a)
	ld e, $6
	call Func_13951
	call Func_137a1
	call Func_12f3a
	call Func_12f31
	jp IncrementSubroutine2

Func_1133b: ; 1133b (4:533b)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11349
	ld a, $4
	ld [H_SFX_ID], a
	jp Func_1136a

.asm_11349
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wcb68]
	cp $0
	jr z, Func_1136a
	ld e, $2d
	call Func_13951
	ld hl, VTilesBG tile $40
	ld b, $6
	call Func_13fd2
	jp IncrementSubroutine2

Func_1136a: ; 1136a (4:536a)
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11370: ; 11370 (4:5370)
	ld bc, $1a
	check_cgb
	jr z, .asm_1137d
	ld bc, $54
.asm_1137d
	call DecompressGFXByIndex_
	ld e, $3d
	call Func_13951
	lb bc, $1, $b
	ld e, $22
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wcb67]
	call Func_130bc
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03], a
	ld a, [wcb68]
	cp $1
	jr nz, .asm_113d3
	xor a
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
.asm_113d3
	jp IncrementSubroutine2

Func_113d6: ; 113d6 (4:53d6)
	ld a, [wcb68]
	cp $1
	jr z, .asm_113e9
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	call Func_0616
.asm_113e9
	jp Func_13028

Func_113ec: ; 113ec (4:53ec)
	ld e, $57
	call Func_13951
	jp IncrementSubroutine2

Func_113f4: ; 113f4 (4:53f4)
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld e, $2d
	call Func_13951
	ld hl, VTilesBG tile $40
	ld b, $6
	call Func_11a1c
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_1140c: ; 1140c (4:540c)
	ld e, $2d
	call Func_13951
	call Func_13fc6
	jp IncrementSubroutine2

INCLUDE "engine/denjuudex.asm"

SelectTime: ; 117ef (4:57ef)
	call Func_118dd
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_1181f
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wcb3e]
	cp $0
	jr z, .asm_11815
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld de, wOAMAnimation02
	call Func_099c
	jp IncrementSubroutine

.asm_11815
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jp Func_11910

.asm_1181f
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11837
	ld a, [wcb3e]
	cp $0
	ret z
	ld a, $4
	ld [H_SFX_ID], a
	xor a
	ld [wcb3e], a
	jp Func_11910

.asm_11837
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_1186a
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb3e]
	cp $1
	jr z, .asm_1185a
	ld a, [wCurHours]
	cp 23
	jr nz, .asm_11853
	ld a, $ff
.asm_11853
	inc a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1185a
	ld a, [wCurMinutes]
	cp 59
	jr nz, .asm_11863
	ld a, $ff
.asm_11863
	inc a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1186a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_1189d
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb3e]
	cp $1
	jr z, .asm_1188d
	ld a, [wCurHours]
	cp $0
	jr nz, .asm_11886
	ld a, 24
.asm_11886
	dec a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1188d
	ld a, [wCurMinutes]
	cp $0
	jr nz, .asm_11896
	ld a, 60
.asm_11896
	dec a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1189d
	ret

Func_1189e: ; 1189e (4:589e)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call TimeSet_PrintHours
	call TimeSet_PrintMinutes
	jp Func_118c4

TimeSet_PrintHours: ; 118ac (4:58ac)
	ld a, [wCurHours]
	call Get2DigitBCD
	hlbgcoord 2, 13
	jp Print2DigitBCD

TimeSet_PrintMinutes: ; 118b8 (4:58b8)
	ld a, [wCurMinutes]
	call Get2DigitBCD
	hlbgcoord 5, 13
	jp Print2DigitBCD

Func_118c4: ; 118c4 (4:58c4)
	ld b, $15
	ld a, [wcb3e]
	cp $0
	jr z, .asm_118cf
	ld b, $2d
.asm_118cf
	ld c, $68
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_118dd: ; 118dd (4:58dd)
	ld a, [wVBlankCounter]
	and $f
	ret nz
	ld a, [wcb3d]
	xor $1
	ld [wcb3d], a
	cp $1
	jr z, .asm_118fc
	ld a, [wcb3e]
	cp $0
	jr nz, .asm_118f9
	jp TimeSet_PrintHours

.asm_118f9
	jp TimeSet_PrintMinutes

.asm_118fc
	lb bc, 2, 13
	ld a, [wcb3e]
	cp $0
	jr z, .asm_11909
	lb bc, 5, 13
.asm_11909
	ld e, $23
	ld a, $0
	jp LoadStdBGMapLayout_

Func_11910: ; 11910 (4:5910)
	jp Func_1189e

Func_11913: ; 11913 (4:5913)
	ld a, [wJoyNew]
	and $c0
	jr nz, asm_11932
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
Func_11927: ; 11927 (4:5927)
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_11936

asm_11932
	xor a
	ld [wcb39], a
Func_11936: ; 11936 (4:5936)
	lb bc, 3, 7
Func_11939: ; 11939 (4:5939)
	ld a, [wcb38]
	add $36
	call Func_119ac
	ld a, [wcb38]
	inc a
	cp $4
	jr c, .asm_1194b
	sub $4
.asm_1194b
	add $36
	call Func_119ac
	ld a, [wcb38]
	inc a
	inc a
	cp $4
	jr c, .asm_1195b
	sub $4
.asm_1195b
	add $36
	jp Func_119ac

Func_11960:
	ld a, [hJoyNew]
	and $c0
	jr nz, .asm_1197e
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_11982

.asm_1197e
	xor a
	ld [wcb39], a
Func_11982: ; 11982 (4:5982)
	lb bc, 3, 7
Func_11985: ; 11985 (4:5985)
	ld a, [wcb3a]
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	cp $4
	jr c, .asm_11997
	sub $4
.asm_11997
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	inc a
	cp $4
	jr c, .asm_119a7
	sub $4
.asm_119a7
	add $17
	jp Func_119ac

Func_119ac: ; 119ac (4:59ac)
	push bc
	ld e, a
	ld a, $0
	call LoadStdBGMapLayout_
	pop bc
	ld a, c
	add $3
	ld c, a
	ret

Func_119b9: ; 119b9 (4:59b9)
	ld a, [wJoyNew]
	and $c0
	jr nz, asm_119d8
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
Func_119cd: ; 119cd (4:59cd)
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_119dc

asm_119d8
	xor a
	ld [wcb39], a
Func_119dc: ; 119dc (4:59dc)
	lb bc, 3, 7
Func_119df: ; 119df (4:59df)
	ld a, [wcd22]
	add $24
	call Func_119ac
	ld a, [wcd22]
	inc a
	cp $9
	jr c, .asm_119f1
	sub $9
.asm_119f1
	add $24
	call Func_119ac
	ld a, [wcd22]
	inc a
	inc a
	cp $9
	jr c, .asm_11a01
	sub $9
.asm_11a01
	add $24
	jp Func_119ac

ClearTiles: ; 11a06 (4:5a06)
; clear b tiles in VRAM
	push bc
	ld c, $10
.asm_11a09
	xor a
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a09
	pop bc
	dec b
	jr nz, ClearTiles
	ret

Func_11a16:
	ld d, $ff
	ld e, $0
	jr asm_11a20

Func_11a1c: ; 11a1c (4:5a1c)
	ld d, $0
	ld e, $ff
asm_11a20
	push bc
	ld c, $8
.asm_11a23
	call WaitStat
	ld a, d
	ld [hli], a
	ld a, e
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a23
	pop bc
	dec b
	jr nz, asm_11a20
	ret

Func_11a35: ; 11a35 (4:5a35)
	ld [wd435], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wc91e], a
	xor a
	ld [wca65], a
	ld a, $78
	ld [wc91f], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld d, $c
	jp Func_11a80

Func_11a59: ; 11a59 (4:5a59)
	ld [wd435], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	xor a
	ld [wca65], a
	ld a, $78
	ld [wc91f], a
	ld hl, $6652
	call Get8CharName0B
	ld d, $b
	jp Func_11a80

Func_11a80: ; 11a80 (4:5a80)
	push de
	ld hl, wc3a0
	ld b, $9
.asm_11a86
	ld a, $e0
	ld [hli], a
	dec b
	jr nz, .asm_11a86
	ld hl, wStringBuffer
	ld de, wOAMAnimationsEnd
	call Func_33e3
	pop de
	jp Func_1249a

Func_11a99:
	xor a
	ld [wd000], a
	ld [wd001], a
	ld bc, $1fe
	ld hl, wd002
.asm_11aa6
	ld a, $fe
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_11aa6
	ret

Func_11aaf: ; 11aaf (4:5aaf)
	call Func_11b37
	call Func_11d7e
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11af9
	ld a, $4
	ld [H_SFX_ID], a
	lb bc, $1, $6
	ld e, $30
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $6
	ld e, $35
	ld a, $0
	call LoadStdBGMapAttrLayout_
	call Func_1bd1
	call Func_11ee9
	ld a, $3
	ld [wSubroutine2], a
	ld a, $ff
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call Func_11fe9
	xor a
	ld [wcb28], a
	jp LoadPhoneKeypad

.asm_11af9
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_11b08
	call Func_126a1
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_11b08
	ld a, [hJoyNew]
	and SELECT
	jr z, .asm_11b20
	ld b, $0
	ld a, [wcb28]
	cp $0
	jr nz, .asm_11b19
	ld b, $3
.asm_11b19
	ld a, b
	ld [wcb28], a
	call LoadPhoneKeypad
.asm_11b20
	ret

Func_11b21:
	call Func_13f51
	jp IncrementSubroutine2

Func_11b27:
	call Func_13e37
	call Func_119cd
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

Func_11b37: ; 11b37 (4:5b37)
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_11b68
	ld a, $63
	ld [H_SFX_ID], a
	ld a, [wcb65]
	cp $3
	jr nz, .asm_11b4d
	xor a
	jr .asm_11b62

.asm_11b4d
	cp $6
	jr z, .asm_11b5f
	cp $9
	jr z, .asm_11b5f
	cp $c
	jr z, .asm_11b5f
	cp $f
	jr z, .asm_11b5f
	jr .asm_11b61

.asm_11b5f
	sub $3
.asm_11b61
	inc a
.asm_11b62
	ld [wcb65], a
	jp Func_11d40

.asm_11b68
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_11b9a
	ld a, $63
	ld [H_SFX_ID], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11b7f
	ld a, $3
	jr .asm_11b94

.asm_11b7f
	cp $4
	jr z, .asm_11b91
	cp $7
	jr z, .asm_11b91
	cp $a
	jr z, .asm_11b91
	cp $d
	jr z, .asm_11b91
	jr .asm_11b93

.asm_11b91
	adc $3
.asm_11b93
	dec a
.asm_11b94
	ld [wcb65], a
	jp Func_11d40

.asm_11b9a
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_11bdb
	ld a, $63
	ld [H_SFX_ID], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11bb1
	ld a, $d
	jr .asm_11bd5

.asm_11bb1
	cp $1
	jr nz, .asm_11bb9
	ld a, $e
	jr .asm_11bd5

.asm_11bb9
	cp $2
	jr nz, .asm_11bc1
	ld a, $e
	jr .asm_11bd5

.asm_11bc1
	cp $3
	jr nz, .asm_11bc9
	ld a, $f
	jr .asm_11bd5

.asm_11bc9
	cp $4
	jr nz, .asm_11bd1
	ld a, $0
	jr .asm_11bd5

.asm_11bd1
	sub $3
	and $f
.asm_11bd5
	ld [wcb65], a
	jp Func_11d40

.asm_11bdb
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_11c1c
	ld a, $63
	ld [H_SFX_ID], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11bf2
	ld a, $4
	jr .asm_11c16

.asm_11bf2
	cp $1
	jr nz, .asm_11bfa
	ld a, $5
	jr .asm_11c16

.asm_11bfa
	cp $2
	jr nz, .asm_11c02
	ld a, $5
	jr .asm_11c16

.asm_11c02
	cp $3
	jr nz, .asm_11c0a
	ld a, $6
	jr .asm_11c16

.asm_11c0a
	cp $f
	jr nz, .asm_11c12
	ld a, $3
	jr .asm_11c16

.asm_11c12
	adc $2
	and $f
.asm_11c16
	ld [wcb65], a
	jp Func_11d40

.asm_11c1c
	ret

Func_11c1d:
	ld a, [wcb65]
	ld hl, Pointers_11c27
	call GetHalfwordFromTable
	jp [hl]

Pointers_11c27:
	dw Func_11c47
	dw Func_11c5c
	dw Func_11c9f
	dw Func_11ce9
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11d2a
	dw Func_11d35
	dw Func_11d10
	dw Func_11cf4
	dw Func_11cf9

Func_11c47: ; 11c47 (4:5c47)
	ld a, [wcfc0]
	cp $0
	jr nz, .asm_11c59
	ld a, $cf
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	ret

.asm_11c59
	jp Func_1bd1

Func_11c5c: ; 11c5c (4:5c5c)
	ld a, [wcb69]
	cp $0
	jr nz, .asm_11c6b
	ld a, [wcb67]
	cp $0
	jr nz, .asm_11c6b
	ret

.asm_11c6b
	ld a, [wcb67]
	dec a
	and $f
	ld [wcb67], a
	cp $f
	jr nz, .asm_11c7f
	ld a, [wcb69]
	cp $0
	jr nz, .asm_11c87
.asm_11c7f
	ld a, $ff
	ld [wcb66], a
	jp Func_11d7e

.asm_11c87
	dec a
	ld [wcb69], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp Func_072f

Func_11c9f: ; 11c9f (4:5c9f)
	ld a, [wcb69]
	cp $e
	jr nz, .asm_11cae
	ld a, [wcb67]
	cp $f
	jr nz, .asm_11cae
	ret

.asm_11cae
	ld a, [wcb67]
	inc a
	and $f
	ld [wcb67], a
	jr nz, .asm_11cde
	ld a, [wcb69]
	cp $e
	jr z, .asm_11cde
	inc a
	and $f
	ld [wcb69], a
	xor a
	ld [wcb67], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp Func_072f

.asm_11cde
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	jp Func_072f

Func_11ce9: ; 11ce9 (4:5ce9)
	jp Func_11fbc

Func_11cec: ; 11cec (4:5cec)
	ld a, [wcb65]
	sub $4
	jp Func_11dcb

Func_11cf4: ; 11cf4 (4:5cf4)
	ld a, $7
	jp Func_11dcb

Func_11cf9: ; 11cf9 (4:5cf9)
	call Func_11ec6
	inc hl
	ld a, [hl]
	inc a
	push af
	and $7
	cp $5
	jr nz, .asm_11d0b
	pop af
	ld a, [hl]
	and $f0
	push af
.asm_11d0b
	pop af
	ld [hl], a
	jp Func_072f

Func_11d10: ; 11d10 (4:5d10)
	call Func_11ec6
	inc hl
	ld a, [hl]
	push af
	and $7
	cp $0
	jr nz, .asm_11d24
	pop af
	ld a, [hl]
	and $f0
	add $4
	jr .asm_11d26

.asm_11d24
	pop af
	dec a
.asm_11d26
	ld [hl], a
	jp Func_072f

Func_11d2a: ; 11d2a (4:5d2a)
	ld a, [wd001]
	xor $1
	ld [wd001], a
	jp Func_121fd

Func_11d35: ; 11d35 (4:5d35)
	call Func_11ed8
	ld a, $ff
	ld [wcb66], a
	jp Func_072f

Func_11d40: ; 11d40 (4:5d40)
	ld hl, Data_11d5e
	ld a, [wcb65]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld de, wOAMAnimation01
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_11d5e:
	db $68, $28
	db $78, $28
	db $88, $28
	db $98, $28
	db $68, $40
	db $80, $40
	db $98, $40
	db $68, $50
	db $80, $50
	db $98, $50
	db $68, $60
	db $80, $60
	db $98, $60
	db $68, $70
	db $80, $70
	db $98, $70

Func_11d7e: ; 11d7e (4:5d7e)
	ld hl, Data_11dab
	ld a, [wcb67]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $a
	ld [wOAMAnimation02_TemplateIdx], a
	ld de, wOAMAnimation02
	call Func_11781
	ld a, [wVBlankCounter]
	and $f
	jr nz, .asm_11da5
	ld a, [wOAMAnimation02]
	xor $1
	ld [wOAMAnimation02_PriorityFlags], a
.asm_11da5
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_11dab:
	db $10, $38
	db $20, $38
	db $30, $38
	db $40, $38
	db $10, $48
	db $20, $48
	db $30, $48
	db $40, $48
	db $10, $58
	db $20, $58
	db $30, $58
	db $40, $58
	db $10, $68
	db $20, $68
	db $30, $68
	db $40, $68

Func_11dcb: ; 11dcb (4:5dcb)
	ld [wcb20], a
	call Func_11ec6
	ld a, [wcb66]
	ld b, a
	ld a, [wcb65]
	cp b
	jp z, Func_11e54
	ld a, [wcb68]
	cp $f0
	ret z
	ld a, [wcb66]
	cp $ff
	jr z, .asm_11e44
	ld a, [wcb67]
	inc a
	and $f
	ld [wcb67], a
	jr nz, .asm_11e1c
	ld a, [wcb69]
	inc a
	and $f
	ld [wcb69], a
	cp $f
	jr nz, .asm_11e0c
	ld a, $f
	ld [wcb67], a
	ld a, $e
	ld [wcb69], a
	ret

.asm_11e0c
	lb bc, $1, $6
	ld e, $30
	ld a, $0
	call LoadStdBGMapLayout_
	call Func_121bf
	call Func_121fd
.asm_11e1c
	call Func_11efa
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	push af
	call Func_11ec6
	pop af
	ld [hli], a
	ld a, $2
	ld [hl], a
	call Func_072f
	ld a, [wcb65]
	ld [wcb66], a
	call Func_11d7e
	jp Func_1221c

.asm_11e44
	push hl
	ld a, [hl]
	cp $fe
	jr z, .asm_11e4f
	call Func_11efa
	pop hl
	push hl
.asm_11e4f
	inc hl
	ld a, $2
	jr asm_11e60

Func_11e54: ; 11e54 (4:5e54)
	push hl
	inc hl
	ld a, [hl]
	add $10
	cp $60
	jr c, asm_11e60
	ld a, [hl]
	and $7
asm_11e60
	ld [hl], a
	swap a
	and $f
	push af
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	call Func_072f
	ld a, [wcb65]
	ld [wcb66], a
	jp Func_1221c

Data_11e86:
	db $96, $5e
	db $9c, $5e
	db $a2, $5e
	db $a8, $5e
	db $ae, $5e
	db $b4, $5e
	db $ba, $5e
	db $c0, $5e
	db $01, $11
	db $02, $12
	db $00, $10
	db $21, $31
	db $22, $32
	db $20, $30
	db $41, $42
	db $40, $41
	db $42, $40
	db $51, $61
	db $52, $62
	db $50, $60
	db $71, $81
	db $72, $82
	db $70, $80
	db $91, $a1
	db $92, $a2
	db $90, $a0
	db $b1, $b2
	db $b0, $b1
	db $b2, $b0
	db $c0, $c0
	db $c0, $c0
	db $c0, $c0

Func_11ec6: ; 11ec6 (4:5ec6)
	ld a, [wcb69]
	swap a
	and $f0
	ld b, a
	ld a, [wcb67]
	add b
	ld hl, wd002
	jp Rom4_PointToHalfwordInTable

Func_11ed8: ; 11ed8 (4:5ed8)
	call Func_11ec6
	ld a, [hl]
	cp $fe
	jr z, .asm_11ee6
	call Func_11f37
	jp Func_1221c

.asm_11ee6
	jp Func_11f37

Func_11ee9: ; 11ee9 (4:5ee9)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld de, wOAMAnimation01
	call Func_099c
	ld de, wOAMAnimation02
	jp Func_099c

Func_11efa: ; 11efa (4:5efa)
	call Func_11ec6
	ld a, l
	cp $e0
	jr nz, .asm_11f0c
	ld a, h
	cp $d1
	jr nz, .asm_11f0c
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.asm_11f0c
	push hl
	ld hl, wd000
	ld de, wd200
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	pop hl
	ld a, $fe
	ld [hli], a
	ld [hli], a
.asm_11f26
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp $e2
	jr nz, .asm_11f26
	ld a, h
	cp $d1
	jr nz, .asm_11f26
	ret

Func_11f37: ; 11f37 (4:5f37)
	call Func_11ec6
	ld a, l
	cp $e0
	jr nz, .asm_11f49
	ld a, h
	cp $d1
	jr nz, .asm_11f49
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.asm_11f49
	push hl
	ld hl, wd000
	ld de, wd200
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	inc de
	inc de
	pop hl
.asm_11f61
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp $e0
	jr nz, .asm_11f61
	ld a, h
	cp $d1
	jr nz, .asm_11f61
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

Func_11f76:
	ld b, BANK(s1_a000)
	call Rom4_GetSRAMBankB
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	ld a, [hl]
	cp $1
	jr z, .asm_11f98
	jp Func_11a99

.asm_11f98
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	ld de, wd000
	ld bc, $200
	call CopyData
	call Rom4_CloseSRAM
	jp Func_1224e

Func_11fbc: ; 11fbc (4:5fbc)
	ld a, $1
	ld [wd000], a
	ld b, BANK(s1_a000)
	call Rom4_GetSRAMBankB
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	push hl
	pop de
	ld hl, wd000
	ld bc, $200
	call CopyData
	jp Rom4_CloseSRAM

Func_11fe9: ; 11fe9 (4:5fe9)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, [wcb6d]
	and $7
	sla a
	sla a
	sla a
	add $50
	ld [wOAMAnimation02_YCoord], a
	xor a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld [wOAMAnimation03_XCoord], a
	ld [wOAMAnimation04_XCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld [wOAMAnimation04_YCoord], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld [wOAMAnimation04_TemplateBank], a
	ld b, $6
	ld a, [wcb6c]
	debgcoord 2, 10
.asm_1202e
	push af
	ld c, a
	cp $47
	jr nc, .asm_12037
	xor a
	jr .asm_12039

.asm_12037
	ld a, $1
.asm_12039
	push bc
	push de
	call Func_1204e
	pop de
	pop bc
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop af
	inc a
	dec b
	jr nz, .asm_1202e
	ret

Func_1204e: ; 1204e (4:604e)
	push de
	push bc
	push de
	ld hl, Data_1207d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ld b, $5
.asm_1205d
	di
	ld a, [hli]
	call WaitStat
	ld [de], a
	ei
	inc de
	dec b
	jr nz, .asm_1205d
	pop bc
	ld a, c
	cp $47
	jr c, .asm_12070
	sub $47
.asm_12070
	inc a
	ld c, a
	call Get2DigitBCD
	pop de
	ld hl, $5
	add hl, de
	jp Func_121e0

Data_1207d:
	db $81, $60
	db $86, $60
	db $60, $61
	db $62, $63
	db $52, $64
	db $65, $66
	db $67, $52

Func_1208b: ; 1208b (4:608b)
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_120bd
	call Func_1bd1
	ld a, [wcb6d]
	cp $0
	jr nz, .asm_120b1
	ld a, [wcb6c]
	cp $0
	ret z
	ld a, [wcb6c]
	dec a
	ld [wcb6c], a
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_120b1
	dec a
	ld [wcb6d], a
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_120bd
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_120ef
	call Func_1bd1
	ld a, [wcb6d]
	cp $5
	jr nz, .asm_120e3
	ld a, [wcb6c]
	cp $49
	ret z
	ld a, [wcb6c]
	inc a
	ld [wcb6c], a
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_120e3
	inc a
	ld [wcb6d], a
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_120ef
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_1211a
	ld a, $4
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	call Func_1bd1
	call Func_11ee9
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine2], a
	ret

.asm_1211a
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_12184
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	ld [wcb20], a
	cp $47
	jr nc, .asm_12147
	ld a, [wcfc0]
	cp $0
	jr z, .asm_12139
	call Func_1bd1
.asm_12139
	ld a, [wcb20]
	add $81
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	ret

.asm_12147
	ld e, $30
	call Func_13951
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	xor a
	ld [wcb67], a
	ld [wcb69], a
	ld a, $4
	ld [wcb65], a
	ld a, $ff
	ld [wcb66], a
	ld a, $3
	ld [H_SFX_ID], a
	ld de, wOAMAnimation02
	call Func_099c
	call Func_11f76
	call Func_072f
	call Func_11d40
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp IncrementSubroutine2

.asm_12184
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_121a1
	ld a, [wcb6c]
	add $6
	cp $47
	jr nc, .asm_121a1
	ld [wcb6c], a
	call Func_1bd1
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_121a1
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_121be
	ld a, [wcb6c]
	sub $6
	bit 7, a
	jr nz, .asm_121be
	ld [wcb6c], a
	call Func_1bd1
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_11fe9

.asm_121be
	ret

Func_121bf: ; 121bf (4:61bf)
	ld a, $74
	hlbgcoord 2, 14
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $75
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wcb69]
	inc a
Func_121db:
	push hl
	call Get2DigitBCD
	pop hl
Func_121e0: ; 121e0 (4:61e0)
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $76
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Func_121fd: ; 121fd (4:61fd)
	ld a, $53
	hlbgcoord 2, 15
	call WaitStatAndLoad
	ld a, $73
	call WaitStatAndLoad
	ld a, $54
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wd001]
	inc a
	jp Func_121db

Func_1221c: ; 1221c (4:621c)
	call Func_1224e
	ld a, $56
	hlbgcoord 2, 16
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $71
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	ld a, [wcb68]
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	jp Func_121e0

Func_1224e: ; 1224e (4:624e)
; Count 240 halfwords starting at wd002, skipping any that are equal to $fefe
	xor a
	ld [wcb68], a
	ld hl, wd002
	ld bc, $f0
.loop
	ld a, [hli]
	cp $fe
	jr nz, .count
	ld a, [hl]
	cp $fe
	jr z, .next
.count
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Rom4_PointToHalfwordInTable: ; 12270 (4:6270)
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ret

Func_12279: ; 12279 (4:6279)
	xor a
	ld [wcb37], a
	ld [wcb21], a
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld hl, wcdbc
	ld b, $44
	ld de, s1_b000
.loop
	push bc
	ld a, [hli]
	ld [wcb20], a
	cp $0
	jr z, .next
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb20]
	ld [de], a
	inc de
	ld a, [wcb21]
	ld [de], a
	inc de
	ld a, [wcb37]
	inc a
	ld [wcb37], a
.next
	ld a, [wcb21]
	inc a
	ld [wcb21], a
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

Func_122ba: ; 122ba (4:62ba)
	push af
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop af
	ld hl, s1_b000
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	push af
	ld a, [hli]
	ld b, a
	call Rom4_CloseSRAM
	pop af
	ret

Func_122d0: ; 122d0 (4:62d0)
	ld a, [wcb6f]
	call Func_122ba
Func_122d6: ; 122d6 (4:62d6)
	ld e, b
	ld d, $0
	ld hl, $1e0
	add hl, de
	push hl
	pop bc
	ld a, $7
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Phone_SaveMenu_JoypadAction: ; 122ea (4:62ea)
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .dont_save
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_d_down
.d_up_down
	ld a, [wcb67]
	xor $1
	ld [wcb67], a
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_12352

.check_d_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_a_button
	jr .d_up_down

.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .no_a_button
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wcb67]
	cp $0
	jr z, .save
.dont_save
	ld a, $4
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	ld de, wOAMAnimation02
	call Func_099c
	ld a, $4
	ld [wSubroutine2], a
	ret

.save
	call SaveGame_
	lb bc, $1, $6
	ld e, $33
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $40
	ld [wcb2c], a
	jp IncrementSubroutine2

.no_a_button
	ret

Func_12352: ; 12352 (4:6352)
	ld c, $68
	ld a, [wcb67]
	cp $0
	jr z, .asm_1235d
	ld c, $78
.asm_1235d
	ld b, $c
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_1236b: ; 1236b (4:636b)
	xor a
	ld [wcb70], a
	ld [wcb71], a
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld hl, sAddressBook
	ld bc, ADDRESS_BOOK_SIZE
.asm_1237d
	ld a, BANK(sAddressBook)
	ld [MBC3SRamBank], a
	push bc
	push hl
	ld a, [hli]
	ld [wcb20], a
	ld a, [hli]
	ld [wcb21], a
	cp $0
	jr z, .asm_123c3
	inc hl
	ld a, [hli]
	ld [wcb22], a
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, s1_b000
	add hl, de
	ld a, [wcb20]
	ld [hli], a
	ld a, [wcb21]
	ld [hli], a
	ld a, [wcb71]
	ld [hli], a
	ld a, [wcb22]
	ld [hli], a
	ld a, [wcb70]
	inc a
	ld [wcb70], a
.asm_123c3
	pop hl
	ld de, $10
	add hl, de
	ld a, [wcb71]
	inc a
	ld [wcb71], a
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_1237d
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	cp $1
	jr z, asm_12417
	ld a, [wcb70]
	ld c, a
asm_123e5
	push bc
	ld a, [wcb70]
	dec a
	ld b, a
	ld hl, s1_b000
	ld de, s1_b000 + 4
asm_123f1
	push bc
	ld a, [hl]
	ld b, a
	ld a, [de]
	cp b
	jr nc, .asm_12407
	call Func_1241d
	call Func_1241d
	call Func_1241d
	call Func_1241d
	jp Func_1240f

.asm_12407
	inc hl
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
	inc de
Func_1240f: ; 1240f (4:640f)
	pop bc
	dec b
	jr nz, asm_123f1
	pop bc
	dec c
	jr nz, asm_123e5
asm_12417
	call Rom4_CloseSRAM
	jp Func_12426

Func_1241d: ; 1241d (4:641d)
	ld a, [hl]
	ld b, a
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	inc hl
	inc de
	ret

Func_12426: ; 12426 (4:6426)
	ld hl, wd000
	ld bc, $200
	call FillMemoryWithFF
	ld a, [wcb70]
	ld b, a
	ld hl, s1_b000
	ld a, $ff
	ld [wcb20], a
	xor a
	ld [wLastDenjuuSeenOrCaught], a
	push bc
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop bc
.loop
	push bc
	push hl
	ld a, [wcb20]
	ld b, a
	ld a, [hl]
	cp b
	jr z, .asm_12467
	ld [wcb20], a
	push af
	ld hl, wd000
	ld a, [wLastDenjuuSeenOrCaught]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
	ld [wLastDenjuuSeenOrCaught], a
.asm_12467
	pop hl
	ld de, $4
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

Func_12473: ; 12473 (4:6473)
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	ld a, [hl]
	ret

Func_1247c:
	call Func_13e08
	ld bc, $10
	call ClearMemory3
	jp Rom4_CloseSRAM

PaletteFade8: ; 12488 (4:6488)
	ld hl, wc3a9
	ld de, wOAMAnimationsEnd
	ld b, $9
.asm_12490
	ld a, $e0
	ld [de], a
	inc de
	xor a
	ld [hli], a
	dec b
	jr nz, .asm_12490
	ret

Func_1249a: ; 1249a (4:649a)
	ld b, $0
	ld c, $30
	ld d, $c
	call Func_0528
	call Func_0530
	jp Func_0530

Func_124a9: ; 124a9 (4:64a9)
	call Func_11b37
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_124e5
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call Func_13fd2
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call Func_12794
	call Func_1249a
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $4
	ld [H_SFX_ID], a
	ret

.asm_124e5
	ld a, [hJoyNew]
	and START
	jr nz, asm_12539
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_12581
	call Func_126a1
	ld a, [wcb65]
	cp $0
	jp z, Func_12519
	cp $1
	jp z, Func_12565
	cp $2
	jp z, Func_1256e
	cp $3
	jp z, asm_12539
	cp $d
	jp z, Func_12562
	cp $f
	jp z, Func_12562
	jp Func_126c0

Func_12519: ; 12519 (4:6519)
	xor a
	ld [wcb3e], a
	ld a, [wcb2a]
	inc a
	cp $3
	jr nz, .asm_12526
	xor a
.asm_12526
	ld [wcb2a], a
	add $1
	cp $3
	jr nz, .asm_12530
	xor a
.asm_12530
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

asm_12539
	ld a, $3
	ld [H_SFX_ID], a
	call Func_12794
	cp $0
	jr nz, .asm_1255f
	ld a, $c
	ld [wc3a9], a
	ld a, $70
	ld [wc3aa], a
	ld a, $7
	ld [wc3ab], a
	ld a, $3
	ld [wcb38], a
	call Func_12794
	jp Func_1249a

.asm_1255f
	jp IncrementSubroutine

Func_12562: ; 12562 (4:6562)
	jp Func_12673

Func_12565: ; 12565 (4:6565)
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	jr asm_12575

Func_1256e: ; 1256e (4:656e)
	ld a, [wcb38]
	cp $7
	ret z
	inc a
asm_12575
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
Func_12581: ; 12581 (4:6581)
	ret

Func_12582: ; 12582 (4:6582)
	call Func_11b37
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_125be
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ld hl, VTilesBG tile $78
	ld b, $6
	call Func_13fd2
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call Func_127b7
	call Func_1249a
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $4
	ld [H_SFX_ID], a
	ret

.asm_125be
	ld a, [hJoyNew]
	and START
	jr nz, asm_12612
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_12659
	call Func_126a1
	ld a, [wcb65]
	cp $0
	jp z, Func_125f2
	cp $1
	jp z, Func_12632
	cp $2
	jp z, Func_12646
	cp $3
	jp z, asm_12612
	cp $d
	jp z, Func_1262f
	cp $f
	jp z, Func_1262f
	jp Func_1272a

Func_125f2: ; 125f2 (4:65f2)
	xor a
	ld [wcb3e], a
	ld a, [wcb2a]
	inc a
	cp $3
	jr nz, .asm_125ff
	xor a
.asm_125ff
	ld [wcb2a], a
	add $1
	cp $3
	jr nz, .asm_12609
	xor a
.asm_12609
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

asm_12612
	ld a, $3
	ld [H_SFX_ID], a
	call Func_127b7
	cp $0
	jr nz, .asm_1262c
	ld a, [wd4a7]
	call Func_13d8c
	call Func_12794
	ld d, $c
	jp Func_1249a

.asm_1262c
	jp IncrementSubroutine

Func_1262f: ; 1262f (4:662f)
	jp Func_1268a

Func_12632: ; 12632 (4:6632)
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ret

Func_12646: ; 12646 (4:6646)
	ld a, [wcb38]
	cp $5
	ret z
	inc a
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
Func_12659: ; 12659 (4:6659)
	ret

Func_1265a: ; 1265a (4:665a)
	ld e, $15
	ld a, [wcb2a]
	cp $0
	jr z, .asm_1266b
	ld e, $16
	cp $1
	jr z, .asm_1266b
	ld e, $1b
.asm_1266b
	ld bc, $111
	ld a, $0
	jp LoadStdBGMapLayout_

Func_12673: ; 12673 (4:6673)
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call Func_133ab
	pop hl
	ld [hl], a
	call Func_12794
	jp Func_1249a

Func_1268a: ; 1268a (4:668a)
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call Func_133ab
	pop hl
	ld [hl], a
	call Func_127b7
	jp Func_1249a

Func_126a1: ; 126a1 (4:66a1)
	ld a, [wcb65]
	ld e, a
	ld d, $0
	ld hl, Data_126b0
	add hl, de
	ld a, [hl]
	ld [H_SFX_ID], a
	ret

Data_126b0:
	db $63, $63, $63, $63
	db $16, $17, $18, $19
	db $1a, $1b, $1c, $1d
	db $1e, $1f, $20, $21

Func_126c0: ; 126c0 (4:66c0)
	ld a, [wcb66]
	cp $ff
	jr z, .asm_126e9
	ld b, a
	ld a, [wcb65]
	cp b
	jr nz, .asm_126d7
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jr .asm_126e9

.asm_126d7
	xor a
	ld [wcb3e], a
	ld a, [wcb38]
	cp $7
	jr z, .asm_126e9
.asm_126e1
	ld a, [wcb38]
	inc a
	ld [wcb38], a
.asm_126e9
	ld a, [wcb65]
	ld [wcb66], a
	ld a, [wcb2a]
	ld hl, Pointers_1280d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb65]
	sub $4
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wcb3e]
	cp b
	jr nz, .asm_12712
	xor a
	ld [wcb3e], a
.asm_12712
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call Func_12794
	jp Func_1249a

Func_1272a: ; 1272a (4:672a)
	ld a, [wcb66]
	cp $ff
	jr z, .asm_12753
	ld b, a
	ld a, [wcb65]
	cp b
	jr nz, .asm_12741
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jr .asm_12753

.asm_12741
	xor a
	ld [wcb3e], a
	ld a, [wcb38]
	cp $5
	jr z, .asm_12753
	ld a, [wcb38]
	inc a
	ld [wcb38], a
.asm_12753
	ld a, [wcb65]
	ld [wcb66], a
	ld a, [wcb2a]
	ld hl, Pointers_1280d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb65]
	sub $4
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wcb3e]
	cp b
	jr nz, .asm_1277c
	xor a
	ld [wcb3e], a
.asm_1277c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call Func_127b7
	jp Func_1249a

Func_12794: ; 12794 (4:6794)
	ld hl, wc3a7
	ld de, wc3b0
	ld b, $8
	ld c, $0
.asm_1279e
	ld a, c
	cp $0
	jr nz, .asm_127af
	ld a, [de]
	cp $0
	jr nz, .asm_127ad
	ld a, $e0
	ld [hld], a
	jr .asm_127b1

.asm_127ad
	ld c, $1
.asm_127af
	ld a, [de]
	ld [hld], a
.asm_127b1
	dec de
	dec b
	jr nz, .asm_1279e
	ld a, c
	ret

Func_127b7: ; 127b7 (4:67b7)
	ld hl, wc3a5
	ld de, wc3ae
	ld b, $6
	ld c, $0
.asm_127c1
	ld a, c
	cp $0
	jr nz, .asm_127d2
	ld a, [de]
	cp $0
	jr nz, .asm_127d0
	ld a, $e0
	ld [hld], a
	jr .asm_127d4

.asm_127d0
	ld c, $1
.asm_127d2
	ld a, [de]
	ld [hld], a
.asm_127d4
	dec de
	dec b
	jr nz, .asm_127c1
	ld a, c
	ret

Func_127da: ; 127da (4:67da)
	ld a, [wcb6f]
	call Func_122ba
	hlbgcoord 6, 16
Func_127e3: ; 127e3 (4:67e3)
	push hl
	call Get2DigitBCD
	pop hl
	jp Dex_Print2DigitBCD

Func_127eb:
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $f0
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Pointers_1280d:
	dw Pointers_12813
	dw Pointers_12872
	dw Pointers_128d1

Pointers_12813:
	dw Data_1282b
	dw Data_12836
	dw Data_1283c
	dw Data_12842
	dw Data_12849
	dw Data_1284f
	dw Data_12855
	dw Data_1285b
	dw Data_12862
	dw Data_12868
	dw Data_12869
	dw Data_12871

Data_1282b:
	db 10
	db $38, $39, $3a, $3b, $3c, $64, $65, $66, $67, $68

Data_12836:
	db 5
	db $3d, $3e, $3f, $40, $41

Data_1283c:
	db 5
	db $42, $43, $44, $45, $46

Data_12842:
	db 6
	db $47, $48, $49, $4a, $4b, $69

Data_12849:
	db 5
	db $4c, $4d, $4e, $4f, $50

Data_1284f:
	db 5
	db $51, $52, $53, $1d, $54

Data_12855:
	db 5
	db $55, $56, $57, $58, $59

Data_1285b:
	db 6
	db $5a, $5b, $5c, $6a, $6b, $6c

Data_12862:
	db 5
	db $5d, $28, $5e, $5f, $60

Data_12868:
	db $ff

Data_12869:
	db 7
	db $61, $62, $63, $cd, $c8, $b9, $b8

Data_12871:
	db $ff

Pointers_12872:
	dw Data_1288a
	dw Data_12895
	dw Data_1289b
	dw Data_128a1
	dw Data_128a8
	dw Data_128ae
	dw Data_128b4
	dw Data_128ba
	dw Data_128c1
	dw Data_128c7
	dw Data_128c8
	dw Data_128d0

Data_1288a:
	db 10
	db $01, $02, $03, $04, $05, $2f, $30, $31, $32, $33

Data_12895:
	db 5
	db $06, $07, $08, $09, $0a

Data_1289b:
	db 5
	db $0b, $0c, $0d, $0e, $0f

Data_128a1:
	db 6
	db $10, $11, $12, $13, $14, $34

Data_128a8:
	db 5
	db $15, $16, $17, $18, $19

Data_128ae:
	db 5
	db $1a, $1b, $1c, $1d, $1e

Data_128b4:
	db 5
	db $1f, $20, $21, $22, $23

Data_128ba:
	db 6
	db $24, $25, $26, $35, $36, $37

Data_128c1:
	db 5
	db $27, $28, $29, $2a, $2b

Data_128c7:
	db $ff

Data_128c8:
	db 7
	db $2c, $2d, $2e, $cd, $c8, $b9, $b8

Data_128d0:
	db $ff

Pointers_128d1:
	dw Data_128e9
	dw Data_128eb
	dw Data_128ed
	dw Data_128ef
	dw Data_128f1
	dw Data_128f3
	dw Data_128f5
	dw Data_128f7
	dw Data_128f9
	dw Data_128fb
	dw Data_128fc
	dw Data_128fe

Data_128e9:
	db 1
	db $bc

Data_128eb:
	db 1
	db $bd

Data_128ed:
	db 1
	db $be

Data_128ef:
	db 1
	db $bf

Data_128f1:
	db 1
	db $c0

Data_128f3:
	db 1
	db $c1

Data_128f5:
	db 1
	db $c2

Data_128f7:
	db 1
	db $c3

Data_128f9:
	db 1
	db $c4

Data_128fb:
	db $ff

Data_128fc:
	db 1
	db $bb

Data_128fe:
	db $ff

Func_128ff: ; 128ff (4:68ff)
	ld a, [wcb38]
	ld e, a
	ld d, $0
	ld hl, Data_12919
	add hl, de
	ld a, [hl]
	ld b, a
	ld c, $68
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_12919:
x = 8
REPT 8
	db x
x = x + 8
ENDR

Func_12921: ; 12921 (4:6921)
	ld a, [wcb38]
	sla a
	sla a
	sla a
	add $10
	ld b, a
	ld c, $70
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

LoadPhoneKeypad: ; 1293b (4:693b)
	ld hl, Pointers_12970
	check_cgb
	jr z, .asm_12948
	ld hl, Pointers_1299a
.asm_12948
	ld a, [wCurPhoneGFX]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb28]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
.asm_12958
	ld h, [hl]
	ld l, a
	check_cgb
	jr z, .asm_12965
	ld a, BANK(GFX_1e4000)
	jr .asm_12967

.asm_12965
	ld a, BANK(GFX_1ec000)
.asm_12967
	ld de, VTilesShared tile $20
	ld bc, $40 tiles
	jp Copy2bpp

Pointers_12970:
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_12992
	dw Pointers_12992
	dw Pointers_12992

Pointers_12982:
	dw GFX_1e4000
	dw GFX_1e4400
	dw GFX_1e4800
	dw GFX_1e4c00

Pointers_1298a:
	dw GFX_1e5000
	dw GFX_1e5400
	dw GFX_1e5800
	dw GFX_1e5c00

Pointers_12992:
	dw GFX_1e6000
	dw GFX_1e6400
	dw GFX_1e6800
	dw GFX_1e6c00

Pointers_1299a:
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129bc
	dw Pointers_129bc
	dw Pointers_129bc

Pointers_129ac:
	dw GFX_1ec000
	dw GFX_1ec400
	dw GFX_1ec800
	dw GFX_1ecc00

Pointers_129b4:
	dw GFX_1ed000
	dw GFX_1ed400
	dw GFX_1ed800
	dw GFX_1edc00

Pointers_129bc:
	dw GFX_1ee000
	dw GFX_1ee400
	dw GFX_1ee800
	dw GFX_1eec00

Func_129c4: ; 129c4 (4:69c4)
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	sla e
	rl d
	push de
	ld hl, Pointers_12a18
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG
	ld bc, $40 tiles
	ld a, BANK(Phone1GFX)
	call Copy2bpp
	pop de
	push de
	ld hl, Pointers_12a2a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesShared
	ld bc, $20 tiles
	ld a, $7a
	call Copy2bpp
	pop de
	ld hl, Pointers_12a3c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG tile $21
	ld bc, $3 tiles
	ld a, BANK(GFX_dee5f)
	jp Copy2bpp

Func_12a08:
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, $39 tiles
	add hl, de
	push hl
	pop bc
	xor a
	jp Func_10ee

Pointers_12a18:
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Pointers_12a2a:
	dw GFX_1e8000
	dw GFX_1e8200
	dw GFX_1e8400
	dw GFX_1e8600
	dw GFX_1e8800
	dw GFX_1e8a00
	dw GFX_1e8c00
	dw GFX_1e8e00
	dw GFX_1e9000

Pointers_12a3c:
	dw GFX_dee5f
	dw GFX_dee8f
	dw GFX_deebf
	dw GFX_deeef
	dw GFX_def1f
	dw GFX_def4f
	dw GFX_def7f
	dw GFX_defaf
	dw GFX_defdf

Func_12a4e: ; 12a4e (4:6a4e)
	xor a
	ld [wCurSeconds], a
	ld [wCurMinutes], a
	ld [wCurHours], a
	ld [wCurDays], a
	ld [wCurDays + 1], a
	ret

SetRTC: ; 12a5f (4:6a5f)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, RTC_S
	ld [MBC3SRamBank], a
	xor a
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_M
	ld [MBC3SRamBank], a
	ld a, [wCurMinutes]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_H
	ld [MBC3SRamBank], a
	ld a, [wCurHours]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DL
	ld [MBC3SRamBank], a
	ld a, [wCurDays]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	ld a, [wCurDays + 1]
	ld [MBC3RTC], a
	jp Rom4_CloseSRAM

GetRTC: ; 12ab9 (4:6ab9)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, $8
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurSeconds], a
	ld a, $9
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurMinutes], a
	ld a, $a
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurHours], a
	jp Rom4_CloseSRAM

Func_12aef:
	ld hl, wca00
	ld de, wcb08
	ld b, $e
.loop
	ld a, [hli]
	cp $7a
	jr z, .next
	sub $60
	srl a
	ld [de], a
	inc de
.next
	dec b
	jr nz, .loop
	ld b, $c
	ld hl, wcb08
.loop2
	push bc
	ld a, [hl]
	push hl
	ld hl, Data_12b1c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	pop bc
	dec b
	jr nz, .loop2
	ret

Data_12b1c:
	db 10
	db  0
	db  1
	db  2
	db  3
	db  4
	db  5
	db  6
	db  7
	db  8
	db  0
	db  0
	db 11
	db  0
	db  9

Func_12b2b: ; 12b2b (4:6b2b)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wcb67]
	cp $c
	jr z, .asm_12b59
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wcb67]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_SFX_ID], a
	ld a, [wcb67]
	inc a
	ld [wcb67], a
	ret

.asm_12b59
	ld a, $4
	call Func_050a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_12b6c: ; 12b6c (4:6b6c)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wcb6d]
	cp $c
	jr z, .asm_12b9a
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wcb6d]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_SFX_ID], a
	ld a, [wcb6d]
	inc a
	ld [wcb6d], a
	ret

.asm_12b9a
	ld a, $4
	call Func_050a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_12baa: ; 12baa (4:6baa)
	ld a, [wc907]
	dec a
	add $2f
	ld [wOAMAnimation16_TemplateIdx], a
	ld de, wOAMAnimation16
	ld bc, $1028
	jp Func_11789

Func_12bbc: ; 12bbc (4:6bbc)
	ld a, [hJoyNew]
	and B_BUTTON
	jp nz, Func_12cb7
	ld a, [hJoyNew]
	and D_UP
	jr z, .asm_12be6
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb42]
	dec a
	cp $ff
	jr nz, .asm_12be0
	ld a, $2
.asm_12be0
	ld [wcb42], a
	jp Func_12cd3

.asm_12be6
	ld a, [hJoyNew]
	and D_DOWN
	jr z, .asm_12c08
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb42]
	inc a
	cp $3
	jr nz, .asm_12c02
	xor a
.asm_12c02
	ld [wcb42], a
	jp Func_12cd3

.asm_12c08
	ld a, [wcb42]
	cp $1
	jr z, .asm_12c5f
	cp $2
	jp z, Func_12cb1
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12c30
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb41]
	dec a
	cp $ff
	jr nz, .asm_12c2a
	ld a, $27
.asm_12c2a
	ld [wcb41], a
	jp Func_12cd3

.asm_12c30
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_12c4b
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb41]
	inc a
	cp $28
	jr c, .asm_12c45
	xor a
.asm_12c45
	ld [wcb41], a
	jp Func_12cd3

.asm_12c4b
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_12c5e
	ld a, [wcb41]
	call Func_12d32
	call GetMusicBank
	ld [H_MusicID], a
	ret

.asm_12c5e
	ret

.asm_12c5f
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12c7b
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb40]
	cp $0
	jr nz, .asm_12c74
	ld a, $74
.asm_12c74
	dec a
	ld [wcb40], a
	jp Func_12cd3

.asm_12c7b
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_12c97
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb40]
	cp $73
	jr c, .asm_12c90
	ld a, $ff
.asm_12c90
	inc a
	ld [wcb40], a
	jp Func_12cd3

.asm_12c97
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_12ca5
	ld a, [wcb40]
	inc a
	ld [H_SFX_ID], a
	ret

.asm_12ca5
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_12cb0
	ld a, $1
	ld [H_SFX_ID], a
.asm_12cb0
	ret

Func_12cb1: ; 12cb1 (4:6cb1)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, asm_12cd2
Func_12cb7: ; 12cb7 (4:6cb7)
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	call ClearObjectAnimationBuffers
	ld a, $4
	ld [H_SFX_ID], a
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp IncrementSubroutine

asm_12cd2
	ret

Func_12cd3: ; 12cd3 (4:6cd3)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wcb42]
	cp $0
	jr z, .asm_12cf2
	cp $1
	jr z, .asm_12cec
	ld b, $78
	ld c, $80
	ld d, $0
	jr .asm_12cf2

.asm_12cec
	ld b, $60
	ld c, $68
	ld d, $1
.asm_12cf2
	ld a, $10
	ld [wOAMAnimation02_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld a, $30
	ld [wOAMAnimation03_XCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wcb41]
	hlbgcoord 5, 10
	call Func_127e3
	ld a, [wcb40]
	hlbgcoord 4, 13
	jp Dex_Print3DigitBCD

Func_12d32: ; 12d32 (4:6d32)
	ld e, a
	ld hl, Data_12d3b
	ld d, $0
	add hl, de
	ld a, [hl]
	ret

Data_12d3b:
	db      $03, $04, $05, $06, $07, $08, $09, $0a, $0b
	db $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b
	db $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $32, $33, $34, $35, $36, $37, $38, $39

Func_12d63: ; 12d63 (4:6d63)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wcb3e]
	cp $0
	jr z, .asm_12d9a
	cp $1
	jr z, .asm_12d94
	cp $2
	jr z, .asm_12d8c
	cp $3
	jr z, .asm_12d84
	ld b, $88
	ld c, $90
	ld d, $0
	jr .asm_12d9a

.asm_12d84
	ld b, $78
	ld c, $80
	ld d, $1
	jr .asm_12d9a

.asm_12d8c
	ld b, $68
	ld c, $70
	ld d, $1
	jr .asm_12d9a

.asm_12d94
	ld b, $58
	ld c, $60
	ld d, $1
.asm_12d9a
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld a, $28
	ld [wOAMAnimation03_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_12dc7: ; 12dc7 (4:6dc7)
	ld e, $19
	ld a, [wc90a]
	cp $0
	jr z, .asm_12dd2
	ld e, $18
.asm_12dd2
	lb bc, $4, $a
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $19
	ld a, [wc93e]
	cp $0
	jr z, .asm_12de5
	ld e, $18
.asm_12de5
	lb bc, $4, $c
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $19
	ld a, [wcd27]
	cp $0
	jr z, .asm_12df8
	ld e, $18
.asm_12df8
	ld bc, $410
	ld a, $0
	jp LoadStdBGMapLayout_

Func_12e00: ; 12e00 (4:6e00)
	ld a, [hJoyNew]
	and B_BUTTON
	jp nz, Func_12eee
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_12e23
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb3e]
	cp $0
	jr nz, .asm_12e1c
	ld a, $5
.asm_12e1c
	dec a
	ld [wcb3e], a
	jp Func_12d63

.asm_12e23
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_12e3f
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb3e]
	cp $4
	jr nz, .asm_12e38
	ld a, $ff
.asm_12e38
	inc a
	ld [wcb3e], a
	jp Func_12d63

.asm_12e3f
	ld a, [wcb3e]
	cp $1
	jr z, .asm_12e73
	cp $2
	jr z, .asm_12e92
	cp $3
	jp z, Func_12ec3
	cp $4
	jp z, Func_12ee2
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12e5d
	jr .asm_12e63

.asm_12e5d
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.asm_12e63
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wc90a]
	xor $1
	ld [wc90a], a
	jp Func_12dc7

.asm_12e73
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12e7c
	jr .asm_12e82

.asm_12e7c
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.asm_12e82
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wc93e]
	xor $1
	ld [wc93e], a
	jp Func_12dc7

.asm_12e92
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12eab
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcdb3]
	inc a
	and $3
	ld [wcdb3], a
	call Func_12efe
	ret

.asm_12eab
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcdb3]
	dec a
	and $3
	ld [wcdb3], a
	call Func_12efe
	ret

Func_12ec3: ; 12ec3 (4:6ec3)
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12ecc
	jr .asm_12ed2

.asm_12ecc
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.asm_12ed2
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcd27]
	xor $1
	ld [wcd27], a
	jp Func_12dc7

Func_12ee2: ; 12ee2 (4:6ee2)
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	jr asm_12ef3

Func_12eee: ; 12eee (4:6eee)
	ld a, $4
	ld [H_SFX_ID], a
asm_12ef3
	call Func_13fc6
	ld e, $2d
	call Func_13951
	jp IncrementSubroutine2

Func_12efe: ; 12efe (4:6efe)
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wcdb3]
	ld e, a
	ld d, $0
	ld hl, $320
	add hl, de
	push hl
	pop bc
	ld a, $5
	jp Func_10ee

Func_12f14: ; 12f14 (4:6f14)
	xor a
	ld [wcb68], a
	ld hl, wcd70
	ld de, $4
	ld b, $8
.asm_12f20
	ld a, [hl]
	cp $0
	jr z, .asm_12f2c
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.asm_12f2c
	add hl, de
	dec b
	jr nz, .asm_12f20
	ret

Func_12f31: ; 12f31 (4:6f31)
	ld a, [wcb68]
	hlbgcoord 2, 10
	jp Func_127eb

Func_12f3a: ; 12f3a (4:6f3a)
	xor a
	ld [wcb68], a
	ld hl, wcd90
	ld de, $4
	ld b, $8
.asm_12f46
	push hl
	ld a, [hli]
	cp $0
	jr z, .asm_12f53
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.asm_12f53
	pop hl
	add hl, de
	dec b
	jr nz, .asm_12f46
	ret

Func_12f59: ; 12f59 (4:6f59)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_12f7e
	ld a, $3
	ld [H_SFX_ID], a
	call Func_137d9
	xor a
	ld [wcb6d], a
	ld a, $8
	ld [wcb2c], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	call Func_13fc6
	jp IncrementSubroutine2

.asm_12f7e
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_12f8f
	ld a, $4
	ld [H_SFX_ID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

.asm_12f8f
	ld a, [wcb68]
	cp $1
	ret z
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_12fb5
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp b
	jr nz, .asm_12fae
	ld a, $ff
.asm_12fae
	inc a
	ld [wcb67], a
	jp Func_12fd8

.asm_12fb5
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_12fd7
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_12fd0
	ld a, [wcb68]
.asm_12fd0
	dec a
	ld [wcb67], a
	jp Func_12fd8

.asm_12fd7
	ret

Func_12fd8: ; 12fd8 (4:6fd8)
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd70
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call Func_13ef6
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wcb67]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wcb68]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_13028: ; 13028 (4:7028)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_1305e
	ld a, $3
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	call Func_13fc6
	ld hl, VTilesBG tile $40
	ld b, $20
	call Func_13fd2
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	call Func_137af
	jp IncrementSubroutine2

.asm_1305e
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_13073
	ld a, $4
	ld [H_SFX_ID], a
	xor a
	ld [wFontPaletteMode], a
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_13073
	ld a, [wcb68]
	cp $1
	ret z
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_13099
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp b
	jr nz, .asm_13092
	ld a, $ff
.asm_13092
	inc a
	ld [wcb67], a
	jp Func_130bc

.asm_13099
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_130bb
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_130b4
	ld a, [wcb68]
.asm_130b4
	dec a
	ld [wcb67], a
	jp Func_130bc

.asm_130bb
	ret

Func_130bc: ; 130bc (4:70bc)
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd90
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call Func_13ef6
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wcb67]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wcb68]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_1310c:
	ld a, [wcd24]
	inc a
	hlbgcoord 2, 16
	call Dex_Print3DigitBCD
	ld a, $ee
	call WaitStatAndLoad
	ld a, [wcb70]
	hlbgcoord 6, 16
	jp Dex_Print3DigitBCD

Func_13124: ; 13124 (4:7124)
	ld a, [wcd24]
	call Func_13d38
	hlbgcoord 4, 14
	call Dex_Print3DigitBCD
	ld a, [wcb70]
	hlbgcoord 4, 17
	jp Dex_Print3DigitBCD

Func_13139:
	ld a, [wDexCurDenjuu]
	inc a
	hlbgcoord 2, 14
	call Dex_Print3DigitBCD
	ld a, $ee ; "/" in this context
	call WaitStatAndLoad
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
	hlbgcoord 6, 14
	call Dex_Print3DigitBCD
	ld a, [wNumDenjuuSeen]
	hlbgcoord 3, 17
	jp Dex_Print3DigitBCD

Dex_Print3DigitBCD: ; 1315b (4:715b)
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
Dex_Print2DigitBCD: ; 1316d (4:716d)
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
LoadBCDDigit:
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
	ret

Func_1318a:
	call Func_13e4c
	ld d, a
	call Rom4_CloseSRAM
	ld a, [wcdb4]
	cp d
	jr z, .asm_1319d
	ld c, d
	call Func_06a4
	xor a
	ret

.asm_1319d
	ld a, $1
	ret

Func_131a0: ; 131a0 (4:71a0)
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_131bd
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_131b6
	ld a, $3
.asm_131b6
	dec a
	ld [wcb67], a
	jp Func_1329a

Func_131bd: ; 131bd (4:71bd)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_131da
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb67]
	cp $2
	jr nz, .asm_131d3
	ld a, $ff
.asm_131d3
	inc a
	ld [wcb67], a
	jp Func_1329a

Func_131da: ; 131da (4:71da)
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, Func_13209
	ld a, $4
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	ld bc, $12
	check_cgb
	jr z, .asm_131f8
	ld bc, $57
.asm_131f8
	call DecompressGFXByIndex_
	ld de, wOAMAnimation02
	call Func_099c
	ld a, $1
	ld [wSubroutine2], a
	jp Func_1236b

Func_13209: ; 13209 (4:7209)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_13266
	ld a, [wcb67]
	cp $0
	jp z, Func_13243
	cp $1
	jp z, Func_13267
	ld de, wOAMAnimation02
	call Func_099c
	ld a, $3
	ld [H_SFX_ID], a
	ld e, $2d
	call Func_13951
	ld bc, $13
	check_cgb
	jr z, .asm_1323a
	ld bc, $5a
.asm_1323a
	call DecompressGFXByIndex_
	ld a, $11
	ld [wSubroutine2], a
	ret

Func_13243: ; 13243 (4:7243)
	call Func_13e4c
	call Func_132b0
	xor a
	ld [wcb67], a
	ld a, $10
	ld [wcb2c], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $9
	ld [wSubroutine2], a
	ret

Func_13261:
	ld a, $5
	ld [H_SFX_ID], a
	ret

Func_13266: ; 13266 (4:7266)
	ret

Func_13267: ; 13267 (4:7267)
	call Func_1318a
	cp $0
	jr z, .asm_13274
	ld a, $5
	ld [H_SFX_ID], a
	ret

.asm_13274
	ld a, $3
	ld [H_SFX_ID], a
	ld bc, $109
	ld e, $59
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wcb68], a
	call Func_139e7
	ld a, $14
	ld [wSubroutine2], a
	ret

Func_1329a: ; 1329a (4:729a)
	ld b, $10
	ld a, [wcb67]
	sla a
	sla a
	sla a
	sla a
	add $58
Func_132a9:
	ld c, a
	ld de, wOAMAnimation02
	jp Func_11789

Func_132b0:
	push af
	and $f0
	swap a
	ld d, a
	pop af
	and $f
	swap a
	ld e, a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook + 10
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	call Func_0667
	jp Func_12aef

Func_132d9: ; 132d9 (4:72d9)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld b, $1
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr nz, .asm_132f7
	ld b, $0
.asm_132f7
	ld a, b
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	jp Func_0616

Func_13312: ; 13312 (4:7312)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	jp Func_0616

Func_13340: ; 13340 (4:7340)
	ld a, $90
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	jp Func_0616

Func_1336e: ; 1336e (4:736e)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $50
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, [wcb37]
	dec a
	cp $0
	jr nz, .asm_13397
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_13397
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03
	jp Func_0616

Func_133ab: ; 133ab (4:73ab)
	ld hl, Data_133c0
	ld de, Data_1341a
	ld c, $5a
	ld b, a
.asm_133b4
	ld a, [hli]
	cp b
	jr z, .asm_133be
	inc de
	dec c
	jr nz, .asm_133b4
	ld a, b
	ret

.asm_133be
	ld a, [de]
	ret

Data_133c0:
	db $3d, $3e, $3f, $40, $41
	db $42, $43, $44, $45, $46
	db $47, $48, $49, $4a, $4b
	db $51, $52, $53, $1d, $54
	db $96, $97, $98, $7f, $99
	db $06, $07, $08, $09, $0a
	db $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14
	db $1a, $1b, $1c, $1d, $1e
	db $7c, $7d, $7e, $7f, $80
	db $87, $88, $89, $8a, $8b
	db $8c, $8d, $8e, $8f, $90
	db $91, $92, $93, $94, $95
	db $9a, $9b, $9c, $84, $9d
	db $6d, $6e, $6f, $70, $71
	db $72, $73, $74, $75, $76
	db $77, $78, $79, $7a, $7b
	db $81, $82, $83, $84, $85

Data_1341a:
	db $87, $88, $89, $8a, $8b
	db $8c, $8d, $8e, $8f, $90
	db $91, $92, $93, $94, $95
	db $96, $97, $98, $7f, $99
	db $9a, $9b, $9c, $84, $9d
	db $6d, $6e, $6f, $70, $71
	db $72, $73, $74, $75, $76
	db $77, $78, $79, $7a, $7b
	db $7c, $7d, $7e, $7f, $80
	db $81, $82, $83, $84, $85
	db $3d, $3e, $3f, $40, $41
	db $42, $43, $44, $45, $46
	db $47, $48, $49, $4a, $4b
	db $51, $52, $53, $1d, $54
	db $06, $07, $08, $09, $0a
	db $0b, $0c, $0d, $0e, $0f
	db $10, $11, $12, $13, $14
	db $1a, $1b, $1c, $1d, $1e

Func_13474: ; 13474 (4:7474)
	ld a, [wcb39]
	cp $d
	ret z
	ld a, [wcb65]
	cp $4
	ret c
	sub $4
	ld e, a
	ld d, $0
	ld hl, Data_13584
	add hl, de
	ld a, [hl]
	ld b, a
	ld hl, Data_13590
	add hl, de
	ld a, [hl]
	ld c, a
	ld a, [wcb39]
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	ld a, b
	ld [hl], a
	ld hl, wd200
	add hl, de
	ld a, c
	ld [hl], a
	ld a, [wcb39]
	inc a
	ld [wcb39], a
Func_134aa: ; 134aa (4:74aa)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld b, $c
	ld hl, wOAMAnimation02_PriorityFlags
	call Func_13798
	ld a, [wcb39]
	cp $0
	ret z
	dec a
	ld b, a
	ld a, $c
	sub b
	ld c, a
	ld b, $0
	ld de, $20
	call Multiply_DE_by_BC
	ld hl, wOAMAnimation01_PriorityFlags
	add hl, de
	ld a, [wcb39]
	ld b, a
	xor a
	ld [wcb22], a
.asm_134d8
	push bc
	push hl
	push hl
	ld de, $0
	add hl, de
	ld a, $1
	ld [hl], a
	pop hl
	ld de, $2
	add hl, de
	push hl
	ld hl, wd200
	ld a, [wcb22]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	pop hl
	ld de, $20
	add hl, de
	ld a, [wcb22]
	inc a
	ld [wcb22], a
	pop bc
	dec b
	jr nz, .asm_134d8
	ld a, $50
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld [wOAMAnimation04_YCoord], a
	add $10
	ld [wOAMAnimation05_YCoord], a
	ld [wOAMAnimation06_YCoord], a
	ld [wOAMAnimation07_YCoord], a
	ld [wOAMAnimation08_YCoord], a
	add $10
	ld [wOAMAnimation09_YCoord], a
	ld [wOAMAnimation10_YCoord], a
	ld [wOAMAnimation11_YCoord], a
	ld [wOAMAnimation12_YCoord], a
	ld [wOAMAnimation13_YCoord], a
	ld a, $10
	ld [wOAMAnimation02_XCoord], a
	ld a, $18
	ld [wOAMAnimation03_XCoord], a
	ld [wOAMAnimation05_XCoord], a
	ld a, $20
	ld [wOAMAnimation04_XCoord], a
	ld [wOAMAnimation06_XCoord], a
	ld [wOAMAnimation09_XCoord], a
	ld a, $28
	ld [wOAMAnimation07_XCoord], a
	ld [wOAMAnimation10_XCoord], a
	ld a, $30
	ld [wOAMAnimation08_XCoord], a
	ld [wOAMAnimation11_XCoord], a
	ld a, $38
	ld [wOAMAnimation12_XCoord], a
	ld a, $40
	ld [wOAMAnimation13_XCoord], a
	ld a, $0
	ld b, $c
	ld hl, wOAMAnimation02_TemplateBank
	call Func_13798
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wcb39]
	cp $c
	jp z, Func_13579
	ret

Func_13579: ; 13579 (4:7579)
	call Func_1360a
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

Data_13584:
	db $62, $64, $66, $68
	db $6a, $6c, $6e, $70
	db $72, $7c, $60, $78

Data_13590:
	db $21, $22, $23, $24
	db $25, $26, $27, $28
	db $29, $2e, $20, $2c

Func_1359c: ; 1359c (4:759c)
	ld a, [wd000]
	ld [wd200], a
	ld a, [wd001]
	ld [wd201], a
	ld a, [wd002]
	ld [wd202], a
	ld a, $7a
	ld [wd203], a
	ld a, [wd003]
	ld [wd204], a
	ld a, [wd004]
	ld [wd205], a
	ld a, [wd005]
	ld [wd206], a
	ld a, [wd006]
	ld [wd207], a
	ld a, $7a
	ld [wd208], a
	ld a, [wd007]
	ld [wd209], a
	ld a, [wd008]
	ld [wd20a], a
	ld a, [wd009]
	ld [wd20b], a
	ld a, [wd00a]
	ld [wd20c], a
	ld a, [wd00b]
	ld [wd20d], a
	ret

Func_135ef: ; 135ef (4:75ef)
	ld b, $c
	ld de, wOAMAnimation02
.asm_135f4
	push bc
	push de
	call Func_099c
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_135f4
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_1360a: ; 1360a (4:760a)
	xor a
	ld [wcb43], a
	ld [wcb03], a
	ld [wcb22], a
	call Func_1359c
	ld hl, wd200
	call Func_3720
	ld a, e
	cp $0
	jr nz, .asm_13633
	ld a, d
	cp $0
	jr nz, .asm_13633
	ld a, c
	cp $0
	jr nz, .asm_13633
	ld a, b
	cp $0
	jr nz, .asm_13633
	jr .asm_1369a

.asm_13633
	ld hl, wd300
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	set 7, b
	ld a, b
	ld [hli], a
	ld a, [wca69]
	ld [hli], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld b, $fe
	ld hl, sAddressBook
	ld c, $0
.asm_13650
	push bc
	push hl
	ld de, $1
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_1368d
	pop hl
	push hl
	ld de, $a
	add hl, de
	ld de, wd300
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .asm_1368d
	inc de
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .asm_1368d
	inc de
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .asm_1368d
	inc de
	ld a, [hli]
	ld [wcb22], a
	and $3
	ld b, a
	ld a, [de]
	and $3
	cp b
	jr nz, .asm_1368d
	inc de
	ld a, [hl]
	ld b, a
	ld a, [de]
	cp b
	jr z, .asm_136a7
.asm_1368d
	pop hl
	ld de, $10
	add hl, de
	pop bc
	inc c
	dec b
	jr nz, .asm_13650
	call Rom4_CloseSRAM
.asm_1369a
	call Func_06ac
	ld a, c
	cp $0
	jr z, .asm_136c6
	xor a
	ld [wcb43], a
	ret

.asm_136a7
	pop hl
	pop bc
	ld a, c
	ld [wcb04], a
	ld a, [hl]
	ld [wcb01], a
	ld a, [wcb22]
	bit 7, a
	jr z, .asm_136bd
	ld a, $1
	ld [wcb03], a
.asm_136bd
	call Rom4_CloseSRAM
	ld a, $1
	ld [wcb43], a
	ret

.asm_136c6
	ld a, $2
	ld [wcb43], a
	ld a, [wcb20]
	ld [wcb01], a
	ret

Func_136d2: ; 136d2 (4:76d2)
	xor a
	ld [wd415], a
	ld [wd4b0], a
	ld hl, wd000
	ld a, [wcd24]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wcb20], a
	ld hl, s1_b000
	ld de, wd000
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	ld a, [wcb70]
	ld b, a
.loop
	push bc
	push hl
	ld a, [hl]
	push af
	ld a, [wcb20]
	ld b, a
	pop af
	cp b
	jr nz, .skip
	inc hl
	inc hl
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.skip
	pop hl
	push de
	ld de, $4
	add hl, de
	pop de
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

Func_1371c: ; 1371c (4:771c)
	push af
	call Func_0583
	ld a, [wc9da]
	call Func_0579
	pop af
	push af
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld hl, GFX_de95f
	ld de, VTilesShared tile $00
	ld bc, $10 tiles
	ld a, BANK(GFX_de95f)
	call Copy2bpp
	ld a, [wc9da]
	add $50
	ld e, a
	ld bc, $0
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $c
	ld e, $1a
	call Phone_LoadStdBGMapTileAndAttrLayout
	pop af
	call Func_175f
	ld hl, $60
	ld a, [wCurHours]
	cp $14
	jr nc, .asm_13764
	cp $4
	jr nc, .asm_13767
.asm_13764
	ld hl, $380
.asm_13767
	ld a, [wc9da]
	call Rom4_PointToHalfwordInTable
	push hl
	pop bc
	push bc
	ld a, $3
	call Func_10ee
	pop bc
	inc bc
	ld a, $4
	call Func_10ee
	ld bc, $36
	ld a, $1
	call Func_10ee
	ld a, [wcdb3]
	ld c, a
	ld b, $0
	ld hl, $324
	add hl, bc
	push hl
	pop bc
	ld a, $5
	call Func_10ee
	jp Func_12a08

Func_13798: ; 13798 (4:7798)
	ld [hl], a
	ld de, $20
	add hl, de
	dec b
	jr nz, Func_13798
	ret

Func_137a1: ; 137a1 (4:77a1)
	ld hl, GFX_dea5f
	ld de, VTilesBG tile $40
	ld bc, $38 tiles
	ld a, BANK(GFX_dea5f)
	jp Copy2bpp

Func_137af: ; 137af (4:77af)
	ld a, [wcb67]
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd90
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld c, a
	ld b, $1
	ld d, $c
	call Func_0528
	call Func_0530
	jp Func_0530

Func_137d9: ; 137d9 (4:77d9)
	call Func_137df
	jp Func_132b0

Func_137df: ; 137df (4:77df)
	ld a, [wcb67]
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd70
	add hl, de
	ld a, [hli]
	dec a
	ret

Func_137fa: ; 137fa (4:77fa)
	push af
	and $f0
	swap a
	ld d, a
	pop af
	and $f
	swap a
	ld e, a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	add hl, de
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	ret

Func_13816: ; 13816 (4:7816)
	ld a, [hJoyNew]
	and D_RIGHT
	jp z, Func_13850
	ld a, [wcb67]
	cp $0
	jr z, .asm_1382e
	cp $1
	jr z, .asm_13832
	sub $2
	add $50
	jr .asm_13835

.asm_1382e
	ld a, $47
	jr .asm_13835

.asm_13832
	ld a, [wcb73]
.asm_13835
	ld [wcb20], a
	ld a, [wcfc0]
	cp $0
	jr z, .asm_13842
	call Func_1bd1
.asm_13842
	ld a, [wcb20]
	add $80
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	ret

Func_13850: ; 13850 (4:7850)
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_13870
	call Func_1bd1
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_13869
	ld a, $a
.asm_13869
	dec a
	ld [wcb67], a
	jp Func_138e2

Func_13870: ; 13870 (4:7870)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_13890
	call Func_1bd1
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb67]
	cp $9
	jr nz, .asm_13889
	ld a, $ff
.asm_13889
	inc a
	ld [wcb67], a
	jp Func_138e2

Func_13890: ; 13890 (4:7890)
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, Func_138a5
	call Func_1bd1
	ld a, $4
	ld [H_SFX_ID], a
	call Func_1236b
	jp IncrementSubroutine2

Func_138a5: ; 138a5 (4:78a5)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_138e1
	call Func_1bd1
	ld a, $3
	ld [H_SFX_ID], a
	ld b, $47
	ld a, [wcb67]
	cp $0
	jp z, Func_138d1
	cp $1
	jp z, Func_138cd
	ld a, [wcb67]
	sub $2
	add $50
	ld b, a
	jr Func_138d1

Func_138cd: ; 138cd (4:78cd)
	ld a, [wcb73]
	ld b, a
Func_138d1: ; 138d1 (4:78d1)
	ld a, b
	call Func_138f2
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation03_YCoord], a
	call Func_1236b
	jp IncrementSubroutine2

Func_138e1: ; 138e1 (4:78e1)
	ret

Func_138e2: ; 138e2 (4:78e2)
	ld b, $8
	ld a, [wcb67]
	sla a
	sla a
	sla a
	add $38
	jp Func_132a9

Func_138f2: ; 138f2 (4:78f2)
	push af
	call Func_13e4c
	ld e, a
	ld d, $0
	ld hl, s2_b800
	add hl, de
	ld b, BANK(s2_b800)
	call Rom4_GetSRAMBankB
	pop af
	ld [hl], a
	jp Rom4_CloseSRAM

Func_13907: ; 13907 (4:7907)
	call Func_13e4c
	ld e, a
	ld d, $0
	ld hl, s2_b800
	add hl, de
	ld b, BANK(s2_b800)
	call Rom4_GetSRAMBankB
	ld a, [hl]
	ld b, a
	call Rom4_CloseSRAM
	ld a, b
	cp $47
	jr z, .asm_1392d
	cp $50
	jr c, .asm_13929
	sub $4e
	ld b, a
	jr .asm_1392f

.asm_13929
	ld b, $1
	jr .asm_1392f

.asm_1392d
	ld b, $0
.asm_1392f
	ld a, b
	ret

Func_13931: ; 13931 (4:7931)
	ld bc, $106
Func_13934: ; 13934 (4:7934)
	ld a, $0
	jp LoadStdBGMapLayout_

Func_13939: ; 13939 (4:7939)
	ld bc, $106
Func_1393c: ; 1393c (4:793c)
	ld a, $0
	jp LoadStdBGMapAttrLayout_

Func_13941:
	ld bc, $106
Func_13944: ; 13944 (4:7944)
	ld a, $0
	jp LoadStdWindowLayout_

Func_13949:
	ld bc, $106
Func_1394c: ; 1394c (4:794c)
	ld a, $0
	jp LoadStdWindowAttrLayout_

Func_13951: ; 13951 (4:7951)
	push de
	call Func_13931
	pop de
	jp Func_13939

Phone_LoadStdBGMapTileAndAttrLayout: ; 13959 (4:7959)
	push bc
	push de
	call Func_13934
	pop de
	pop bc
	jp Func_1393c

Func_13963: ; 13963 (4:7963)
	push bc
	push de
	call Func_13944
	pop de
	pop bc
	jp Func_1394c

Func_1396d: ; 1396d (4:796d)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_139a8
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wcb68]
	cp $0
	jr nz, .asm_139b3
	call Func_13e4c
	call Func_1247c
	call Func_1236b
	ld e, $2d
	call Func_13951
	ld a, $1
	ld [wSubroutine2], a
	ld bc, $12
	check_cgb
	jr z, .asm_1399f
	ld bc, $57
.asm_1399f
	call DecompressGFXByIndex_
	ld de, wOAMAnimation02_PriorityFlags
	jp Func_099c

.asm_139a8
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_139c4
	ld a, $4
	ld [H_SFX_ID], a
.asm_139b3
	ld de, wOAMAnimation02
	call Func_099c
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $4
	ld [wSubroutine2], a
	ret

.asm_139c4
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_139ce
	jr asm_139d6

Func_139ce: ; 139ce (4:79ce)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_139e6
asm_139d6
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	xor $1
	ld [wcb68], a
	jp Func_139e7

Func_139e6: ; 139e6 (4:79e6)
	ret

Func_139e7: ; 139e7 (4:79e7)
	ld b, $10
	ld a, [wcb68]
	sla a
	sla a
	sla a
	sla a
	add $68
	jp Func_132a9

Print2DigitBCD: ; 139f9 (4:79f9)
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	call LoadBCDDigit
	ld a, [wNumCGBPalettesToFade]
	and $f
	jp LoadBCDDigit

Func_13a0b: ; 13a0b (4:7a0b)
	call Func_13f51
	ld bc, $11
	call DecompressGFXByIndex_
	xor a
	ld [wcb28], a
	call Func_129c4
	jp LoadPhoneKeypad

Func_13a1e: ; 13a1e (4:7a1e)
	ld bc, $15
	call GetCGB_BGLayout_
	ld bc, $3
	call GetCGB_OBLayout_
	call Func_12efe
	jp Func_12a08

Func_13a30: ; 13a30 (4:7a30)
	call Func_13e08
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	ret

CheckCaughtDenjuu: ; 13a3a (4:7a3a)
	ld e, a
	ld d, $0
	ld hl, DENJUU_DEX_CAUGHT_FLAGS
	jr DexFlagAction

CheckSeenDenjuu: ; 13a42 (4:7a42)
	ld e, a
	ld d, $0
	ld hl, DENJUU_DEX_SEEN_FLAGS
DexFlagAction:
	add hl, de
	ld b, h
	ld c, l
	jp CheckEventFlag

GetDexCounts: ; 13a4e (4:7a4e)
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_CAUGHT_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld de, (EVENT_FF8 - DENJUU_DEX_CAUGHT_FLAGS) >> 3
	add hl, de
	ld c, (EVENT_FF8 - DENJUU_DEX_CAUGHT_FLAGS) >> 3
.asm_13a67
	ld a, [hld]
	cp $0
	jr nz, .asm_13a6f
	dec c
	jr .asm_13a67

.asm_13a6f
	sla c
	sla c
	sla c
	ld b, $8
	bit 7, a
	jr nz, .asm_13aa1
	ld b, $7
	bit 6, a
	jr nz, .asm_13aa1
	ld b, $6
	bit 5, a
	jr nz, .asm_13aa1
	ld b, $5
	bit 4, a
	jr nz, .asm_13aa1
	ld b, $4
	bit 3, a
	jr nz, .asm_13aa1
	ld b, $3
	bit 2, a
	jr nz, .asm_13aa1
	ld b, $2
	bit 1, a
	jr nz, .asm_13aa1
	ld b, $1
.asm_13aa1
	ld a, c
	add b
	dec a
	ld [wLastDenjuuSeenOrCaught], a
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_SEEN_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld de, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
	add hl, de
	ld c, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
.asm_13ac0
	ld a, [hld]
	cp $0
	jr nz, .asm_13ac8
	dec c
	jr .asm_13ac0

.asm_13ac8
	sla c
	sla c
	sla c
	ld b, $8
	bit 7, a
	jr nz, .asm_13afa
	ld b, $7
	bit 6, a
	jr nz, .asm_13afa
	ld b, $6
	bit 5, a
	jr nz, .asm_13afa
	ld b, $5
	bit 4, a
	jr nz, .asm_13afa
	ld b, $4
	bit 3, a
	jr nz, .asm_13afa
	ld b, $3
	bit 2, a
	jr nz, .asm_13afa
	ld b, $2
	bit 1, a
	jr nz, .asm_13afa
	ld b, $1
.asm_13afa
	ld a, c
	add b
	dec a
	ld b, a
	ld a, [wLastDenjuuSeenOrCaught]
	cp b
	jr nc, .asm_13b08
	ld a, b
	ld [wLastDenjuuSeenOrCaught], a
.asm_13b08
	xor a
	ld [wNumDenjuuSeen], a
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_SEEN_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld b, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
.asm_13b21
	ld c, $8
	ld a, [hli]
.asm_13b24
	bit 0, a
	jr z, .asm_13b31
	push af
	ld a, [wNumDenjuuSeen]
	inc a
	ld [wNumDenjuuSeen], a
	pop af
.asm_13b31
	srl a
	dec c
	jr nz, .asm_13b24
	dec b
	jr nz, .asm_13b21
	ret

Func_13b3a: ; 13b3a (4:7b3a)
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, Data_13b70
	add hl, de
	ld a, [hl]
	push af
	ld [wcb33], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook + 1
	ld c, $fe
	ld b, $0
	ld de, $10
.asm_13b58
	ld a, [hl]
	cp $0
	jr z, .asm_13b5e
	inc b
.asm_13b5e
	add hl, de
	dec c
	jr nz, .asm_13b58
	call Rom4_CloseSRAM
	pop af
	cp b
	jr z, .asm_13b6b
	jr nc, .asm_13b6e
.asm_13b6b
	ld a, $1
	ret

.asm_13b6e
	xor a
	ret

Data_13b70:
	db $46, $96, $f0
	db $46, $96, $f0
	db $46, $96, $f0

Func_13b79: ; 13b79 (4:7b79)
	push af
	xor a
	ld [wcb21], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	ld b, $fe
	ld c, $0
.asm_13b8a
	push hl
	ld de, $1
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_13ba1
	pop hl
	ld de, $10
	add hl, de
	inc c
	dec b
	jr nz, .asm_13b8a
	pop af
	jp Rom4_CloseSRAM

.asm_13ba1
	ld a, c
	ld [wcb21], a
	pop de
	pop af
	push af
	push de
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	pop de
	ld [de], a
	ld [wcb20], a
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
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	push de
	ld e, a
	ld d, $0
	ld hl, Data_13c45
	add hl, de
	ld a, [hli]
	pop de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld hl, wd300
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
	ld a, $2
	ld [de], a
	ld h, $0
	ld b, $0
	ld a, [wcb21]
	ld c, a
	ld a, [wcb01]
	ld l, a
	ld de, $420
	add hl, de
	push hl
	pop de
	call Func_06cc
	jp Rom4_CloseSRAM

Data_13c0d:
	db $2f, $14, $1e, $01
	db $64, $14, $1e, $0b
	db $94, $14, $1e, $07
	db $6b, $14, $1e, $05
	db $82, $0a, $28, $02
	db $92, $0a, $28, $0a
	db $84, $0a, $28, $03
	db $69, $0a, $28, $08
	db $36, $1e, $14, $02
	db $83, $1e, $14, $06
	db $67, $1e, $14, $04
	db $6c, $1e, $14, $02
	db $a5, $32, $0a, $04
	db $a6, $32, $0a, $09

Data_13c45:
	db $00
	db $07
	db $06
	db $0e
	db $00
	db $00
	db $00
	db $00
	db $04
	db $04
	db $04
	db $04
	db $0b
	db $0b

Func_13c53: ; 13c53 (4:7c53)
	xor a
	ld [wcb22], a
	ld a, [wcb01]
	ld b, a
	ld c, $e
	ld hl, Data_13c0d
.asm_13c60
	ld a, [hl]
	cp b
	jr z, .asm_13c75
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [wcb22]
	inc a
	ld [wcb22], a
	dec c
	jr nz, .asm_13c60
	jp Func_070c

.asm_13c75
	ld a, [wcb22]
	add $8e
	ld c, a
	ld b, $1
	ret

Func_13c7e: ; 13c7e (4:7c7e)
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	ret

Func_13c8f: ; 13c8f (4:7c8f)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_13cb2
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wcb68]
	cp $0
	jr nz, .asm_13cbd
	ld de, wOAMAnimation02
	call Func_099c
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp IncrementSubroutine

.asm_13cb2
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_13cd1
	ld a, $4
	ld [H_SFX_ID], a
.asm_13cbd
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld de, wOAMAnimation02_PriorityFlags
	call Func_099c
	ld a, $1e
	ld [wSubroutine], a
	ret

.asm_13cd1
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_13cdb
	jr asm_13ce3

Func_13cdb: ; 13cdb (4:7cdb)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_13cf3
asm_13ce3
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wcb68]
	xor $1
	ld [wcb68], a
	jp Func_13cf4

Func_13cf3: ; 13cf3 (4:7cf3)
	ret

Func_13cf4: ; 13cf4 (4:7cf4)
	ld b, $10
	ld a, [wcb68]
	sla a
	sla a
	sla a
	add $78
	jp Func_132a9

Func_13d04: ; 13d04 (4:7d04)
	ld [wcb20], a
	xor a
	ld [wcb21], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	ld b, $fe
.asm_13d15
	push bc
	push hl
	ld a, [wcb20]
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .asm_13d2b
	ld a, [hli]
	cp $0
	jr z, .asm_13d2b
	ld a, [wcb21]
	inc a
	ld [wcb21], a
.asm_13d2b
	pop hl
	ld de, $10
	add hl, de
	pop bc
	dec b
	jr nz, .asm_13d15
	ld a, [wcb21]
	ret

Func_13d38: ; 13d38 (4:7d38)
	ld hl, wd000
	ld a, [wcd24]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	jp Func_13d04

Func_13d46: ; 13d46 (4:7d46)
	push af
	ld hl, VTilesOB tile $50
	push hl
	ld [wd409], a
	call Func_05d1
	pop hl
	ld a, [wd409]
	call GetOverworldSprite_SizeHL
	pop af
	ld d, $4
	jp Func_13d5e

Func_13d5e: ; 13d5e (4:7d5e)
	ld b, a
	ld hl, Data_13d81
.is_in_array
	ld a, [hli]
	cp $ff
	jr z, .not_in_array
	cp b
	jr nz, .is_in_array
	ld a, b
	ld bc, $100
	jr .okay

.not_in_array
	ld a, [wd409]
	ld bc, $2a0
	sub $14
.okay
	add c
	jr nc, .asm_13d7c
	inc b
.asm_13d7c
	ld c, a
	ld a, d
	jp Func_1196

Data_13d81:
	db $5f
	db $71
	db $91
	db $95
	db $a4
	db $a5
	db $a7
	db $a8
	db $ab
	db $ad
	db $ff

Func_13d8c: ; 13d8c (4:7d8c)
	ld c, a
	ld b, $0
	ld de, $6
	call Multiply_DE_by_BC
	ld hl, s2_b200
	add hl, de
	ld b, BANK(s2_b200)
	call Rom4_GetSRAMBankB
	ld de, wc3a9
	ld bc, $6
	call CopyData
	call Rom4_CloseSRAM
	ld hl, wc3a9
	ld b, $0
	ld c, $6
.asm_13db1
	ld a, [hl]
	cp $e0
	jr z, .asm_13db9
	inc b
	jr .asm_13dbb

.asm_13db9
	xor a
	ld [hl], a
.asm_13dbb
	inc hl
	dec c
	jr nz, .asm_13db1
	ld a, b
	cp $5
	jr c, .asm_13dc6
	ld a, $5
.asm_13dc6
	ld [wcb38], a
	ret

Func_13dca: ; 13dca (4:7dca)
	ld c, a
	ld b, $0
	ld de, $6
	call Multiply_DE_by_BC
	ld hl, s2_b200
	add hl, de
	push hl
	pop de
	ld b, BANK(s2_b200)
	call Rom4_GetSRAMBankB
	ld hl, wOAMAnimationsEnd
	ld bc, $6
	call CopyData
	jp Rom4_CloseSRAM

Func_13dea: ; 13dea (4:7dea)
	call Func_13e4c
	call Func_13e08
	ld a, [hl]
	ld [wd409], a
	call Func_05d1
	ld a, [wd409]
	sub $13
	ld [wcb73], a
	hlbgcoord 7, 8
	call Func_127e3
	jp Rom4_CloseSRAM

Func_13e08: ; 13e08 (4:7e08)
	push af
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	pop af
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
	ld hl, sAddressBook
	add hl, de
	ret

Func_13e27: ; 13e27 (4:7e27)
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Func_13963
Func_13e37: ; 13e37 (4:7e37)
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $310
	ld e, $21
	jp Phone_LoadStdBGMapTileAndAttrLayout

Func_13e4c: ; 13e4c (4:7e4c)
	ld a, [wd415]
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	ld a, [hl]
	ret

Func_13e58: ; 13e58 (4:7e58)
	ld a, $e3
	ld [wLCDC], a
	ld a, $58
	ld [wWX], a
	xor a
	ld [wWY], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ret

Func_13e6e: ; 13e6e (4:7e6e)
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ret

Func_13e81:
	ld a, [wDexCurDenjuu]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, TypeNames
	ld bc, VTilesBG tile $38
	jp Func_056a

Func_13e97: ; 13e97 (4:7e97)
	xor a
	ld [wcb20], a
	ld a, [wDexCurDenjuu]
	call CheckCaughtDenjuu
	jr nz, .asm_13eaf
	ld a, [wDexCurDenjuu]
	call CheckSeenDenjuu
	jr z, .asm_13eb4
	ld a, $1
	jr .asm_13eb1

.asm_13eaf
	ld a, $2
.asm_13eb1
	ld [wcb20], a
.asm_13eb4
	ret

Func_13eb5: ; 13eb5 (4:7eb5)
	call Func_13e97
	cp $0
	jr z, .asm_13ed3
	ld a, [wDexCurDenjuu]
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, [wDexCurDenjuu]
	call Func_1764
	ld a, [wDexCurDenjuu]
	jp Func_11a35

.asm_13ed3
	ld a, $ae
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, $ae
	call Func_1764
	ld a, $ae
	jp Func_11a35

Rom4_GetSRAMBankB: ; 13ee7 (4:7ee7)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, b
	ld [MBC3SRamBank], a
	ret

Rom4_CloseSRAM: ; 13ef1 (4:7ef1)
	xor a
	ld [MBC3SRamEnable], a
	ret

Func_13ef6: ; 13ef6 (4:7ef6)
	call Func_069c
	ld hl, wc9e1
	ld de, wOAMAnimationsEnd
	call Func_33e3
	ld hl, VTilesBG tile $40
	ld b, $6
	call Func_13fd2
	ld de, wc3a1
	ld b, $6
	ld hl, VTilesBG tile $40
	jp PlaceString_

Func_13f15: ; 13f15 (4:7f15)
	call Func_13e4c
Func_13f18: ; 13f18 (4:7f18)
	ld c, a
	call Func_069c
	ld hl, wc9e1
	ld de, wc3a0
	call Func_33e3
	ld hl, VTilesBG tile $78
	ld b, $6
	call ClearTiles
	ld de, wc3a1
	ld b, $6
	ld hl, VTilesBG tile $78
	jp PlaceString_

Func_13f38: ; 13f38 (4:7f38)
	ld e, $1e
	jp Func_13f3f

Func_13f3d: ; 13f3d (4:7f3d)
	ld e, $1f
Func_13f3f: ; 13f3f (4:7f3f)
	call Func_13931
	ld e, $12
	jp Func_13939

Func_13f47: ; 13f47 (4:7f47)
	xor a
	ld [wFontPaletteMode], a
	jp Func_11b21

Func_13f4e: ; 13f4e (4:7f4e)
	jp Func_11b27

Func_13f51: ; 13f51 (4:7f51)
	check_cgb
	jr z, .asm_13f64
	ld bc, $54
	call DecompressGFXByIndex_
	ld bc, $55
	jp DecompressGFXByIndex_

.asm_13f64
	ld bc, $1a
	call DecompressGFXByIndex_
	ld bc, $1b
	jp DecompressGFXByIndex_

Func_13f70: ; 13f70 (4:7f70)
	call Func_13e97
	cp $1
	jr z, .asm_13f7d
	ld a, [wDexCurDenjuu]
	ld c, a
	jr .asm_13f7f

.asm_13f7d
	ld c, $ae
.asm_13f7f
	ld b, $11
	ld d, $a
	call Func_0528
	call Func_0530
	jp Func_0530

Func_13f8c: ; 13f8c (4:7f8c)
	ld e, $5c
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0609
	call Func_13312
	call Func_13139
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_13fb5: ; 13fb5 (4:7fb5)
	call Func_13e08
	ld de, $2
	add hl, de
	ld a, [hl]
	cp $64
	jr nc, .asm_13fc3
	inc a
	ld [hl], a
.asm_13fc3
	jp Rom4_CloseSRAM

Func_13fc6: ; 13fc6 (4:7fc6)
	ld de, wOAMAnimation02_PriorityFlags
	call Func_099c
	ld de, wOAMAnimation03_PriorityFlags
	jp Func_099c

Func_13fd2: ; 13fd2 (4:7fd2)
	check_cgb
	jr nz, .asm_13fdc
	jp Func_11a1c

.asm_13fdc
	jp Func_11a16

Func_13fdf: ; 13fdf (4:7fdf)
	check_cgb
	jr nz, .asm_13fea
	ld a, $1
	jr .asm_13fec

.asm_13fea
	ld a, $3
.asm_13fec
	ld [wFontPaletteMode], a
	ret
