PhoneMenu:
	ld a, [wSubroutine]
	ld hl, Pointers_1000a
	call GetHalfwordFromTable
	jp [hl]

Pointers_1000a:
	dw Func_10054
	dw Func_1006e
	dw Func_10089
	dw Func_100bd
	dw Func_100ea
	dw Func_100fa
	dw Func_10108
	dw Func_10113
	dw Func_1013b
	dw Func_101ec
	dw Func_101f7
	dw Func_10205
	dw Func_10216
	dw Func_10221
	dw Func_10232
	dw Func_10265
	dw Func_1028a
	dw Func_102aa
	dw Func_102b3
	dw Func_102cd
	dw Func_1031c
	dw Func_10328
	dw Func_10339
	dw Func_10346
	dw Func_1037f
	dw Func_103a5
	dw Func_103b4
	dw Func_103e2
	dw Func_10400
	dw Func_1040e
	dw Func_10424
	dw Func_1006e
	dw Func_10452
	dw Func_10546
	dw Func_10558
	dw Func_1056a
	dw Func_1057d

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
	call Func_13959
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Func_13959
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
	ld [H_FFA1], a
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
	ld [H_FFA1], a
	ld a, $1
	ld [wcb3f], a
	xor a
	ld [wSubroutine], a
	ld [wd400], a
	ld a, $f
	ld [wGameRoutine], a
	ret

.asm_10192
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $3
	ld [H_FFA1], a
	ld bc, $104
	ld e, $3b
	call Func_13959
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
	ld [H_FFA1], a
	ld a, $10
	ld [wcf96], a
	ld a, $e
	ld [wSubroutine], a
	ret

.asm_101d3
	ld a, $5
	ld [H_FFA1], a
	ret

Func_101d9: ; 101d9 (4:41d9)
	ld a, $3
	ld [H_FFA1], a
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

Func_10232: ; 10232 (4:4232)
	ld a, $1
	call Func_050f
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
	call Func_13959
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
	jp Func_117ef

Func_102b3: ; 102b3 (4:42b3)
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld b, $50
	ld c, $50
	ld de, wOAMAnimations
	call Func_11789
	ld a, $1
	ld [wc430], a
	call Func_11d40
	jp IncrementSubroutine

Func_102cd: ; 102cd (4:42cd)
	ld hl, $9780
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
	call Func_12488
	call Func_1249a
	ld bc, $104
	ld e, $35
	call Func_13959
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
	call Func_050f
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
	call Func_13959
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
	call Func_13959
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
	ld [wc430], a
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
	call Func_13959
	ld e, $12
	call Func_13951
	ld bc, $30f
	ld e, $20
	call Func_13959
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
	ld hl, $9700
	ld b, $10
	call ClearTiles
	ld bc, $0
	ld e, $10
	call Func_13959
	ld bc, $0
	ld e, $11
	call Func_13963
	ld bc, $104
	ld e, $3a
	call Func_13959
	xor a
	ld [wca65], a
	call Func_13fdf
	ld a, $78
	ld [wc91f], a
	call Func_12488
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
	ld hl, $9700
	ld b, $10
	call Func_13fd2
	ld a, $70
	ld [wc91f], a
	ld a, [wd480]
	ld [wd435], a
	ld hl, $4000
	call Func_0548
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
	call Func_12488
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
	call Func_050f
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

Func_1057d: ; 1057d (4:457d)
	ld a, $1
	call Func_050f
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
