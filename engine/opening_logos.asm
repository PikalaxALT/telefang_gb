OpeningLogos: ; 9300 (2:5300)
	ld a, [wSubroutine]
	ld hl, Pointers_930a
	call GetHalfwordFromTable
	jp [hl]

Pointers_930a:
	dw Func_937e
	dw Func_9390
	dw Func_93bd
	dw Func_9362
	dw Func_9406
	dw Func_936c
	dw Func_9427
	dw Func_9376
	dw Func_9362
	dw Func_9406
	dw Func_936c
	dw Func_945c
	dw Func_9376
	dw Func_9362
	dw Func_9406
	dw Func_936c
	dw Func_9491
	dw Func_9376
	dw Func_9362
	dw Func_9406
	dw Func_936c
	dw Func_94c5
	dw Func_9376
	dw Func_94dc
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_94ed
	dw Func_937e
	dw Func_94ee
	dw Func_9503
	dw Func_951f
	dw Func_9376
	dw Func_9362
	dw Func_9535
	dw Func_9376
	dw Func_936c
	dw Func_9562
	dw Func_9568
	dw Func_9573

Func_9362: ; 9362 (2:5362)
	ld a, $0
	call PaletteFade
	or a
	ret z
	jp IncrementSubroutine

Func_936c: ; 936c (2:536c)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

Func_9376: ; 9376 (2:5376)
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_937e: ; 937e (2:537e)
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	xor a
	ld [wdc58], a
	jp IncrementSubroutine

Func_9390: ; 9390 (2:5390)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_0a0b
	ld hl, wEventFlags
	ld bc, $900
	call ClearMemory3
	ld hl, wBattleSubroutine
	ld bc, $200
	call ClearMemory3
	ld bc, $3
	call DecompressGFXByIndex_
	ld bc, $4
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_93bd: ; 93bd (2:53bd)
	ld b, $1
	ld c, $a
	ld d, $0
	ld e, $0
	ld a, $1
	call Func_04c0
	ld bc, $11
	call GetCGB_BGLayout_
	ld a, $1
	ld [wdd06], a
	lb bc, SCREEN_WIDTH, SCREEN_HEIGHT
	ld a, $0
	hlbgcoord 0, 0
	call FillBoxAttr
	lb bc, BG_MAP_WIDTH, 6
	ld a, $1
	hlbgcoord 0, 7
	call FillBoxAttr
	lb bc, $0, $0
	ld e, $7
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $4
	call Func_050a
	ld a, $60
	ld [wc3e4], a
	xor a
	ld [wc475], a
	jp IncrementSubroutine

Func_9406: ; 9406 (2:5406)
	ld a, [hJoyNew]
	and $1
	jr z, .asm_9417
	ld a, $0
	call Func_050a
	ld a, $14
	ld [wSubroutine], a
	ret

.asm_9417
	ld a, [wc3e4]
	dec a
	ld [wc3e4], a
	ret nz
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_9427: ; 9427 (2:5427)
	ld b, $2f
	ld c, $0
	ld d, $0
	ld e, $0
	ld a, $0
	call Func_04c0
	lb bc, SCREEN_WIDTH, SCREEN_HEIGHT
	ld a, $2
	hlbgcoord 0, 0
	call FillBoxAttr
	lb bc, $0, $0
	ld e, $8
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $60
	ld [wc3e4], a
	ld a, $1
	ld [wc475], a
	ld bc, $11
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_945c: ; 945c (2:545c)
	ld b, $1
	ld c, $0
	ld d, $0
	ld e, $0
	ld a, $0
	call Func_04c0
	lb bc, SCREEN_WIDTH, SCREEN_HEIGHT
	ld a, $0
	hlbgcoord 0, 0
	call FillBoxAttr
	lb bc, $0, $0
	ld e, $a
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $60
	ld [wc3e4], a
	ld a, $2
	ld [wc475], a
	ld bc, $11
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_9491: ; 9491 (2:5491)
	ld b, $1
	ld c, $c
	ld d, $0
	ld e, $0
	ld a, $1
	call Func_04c0
	lb bc, $0, $0
	ld e, $7
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, $0, $0
	ld e, $9
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $60
	ld [wc3e4], a
	ld a, $3
	ld [wc475], a
	ld bc, $11
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_94c5: ; 94c5 (2:54c5)
	ld b, $0
	ld c, $0
	ld d, $0
	ld e, $0
	ld a, $0
	call Func_04c0
	ld a, $1
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

Func_94dc: ; 94dc (2:54dc)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

Func_94ed: ; 94ed (2:54ed)
	ret

Func_94ee: ; 94ee (2:54ee)
	call ClearObjectAnimationBuffers
	call Func_0a0b
	ld bc, $c0
	call DecompressGFXByIndex_
	ld bc, $cc
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_9503: ; 9503 (2:5503)
	ld a, $1
	ld [wdd06], a
	ld bc, $0
	ld e, $aa
	ld a, $0
	call LoadStdBGMapLayout
	ld bc, $0
	ld e, $aa
	ld a, $0
	call LoadStdBGMapAttrLayout
	jp IncrementSubroutine

Func_951f: ; 951f (2:551f)
	ld b, $1
	ld c, $5f
	ld d, $0
	ld e, $0
	ld a, $12
	call Func_8320
	ld bc, $a4
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_9535: ; 9535 (2:5535)
	ld a, [hJoyNew]
	and $9
	jp nz, Func_9557
	ld a, [wc3e4]
	ld h, a
	ld a, [wc3e5]
	ld l, a
	inc hl
	ld a, h
	ld [wc3e4], a
	ld a, l
	ld [wc3e5], a
	cp $58
	ret nz
	ld a, h
	cp $2
	ret nz
	jp IncrementSubroutine

Func_9557: ; 9557 (2:5557)
	ld a, $0
	call Func_050a
	ld a, $28
	ld [wSubroutine], a
	ret

Func_9562: ; 9562 (2:5562)
	ld a, $1
	ld [wSubroutine], a
	ret

Func_9568: ; 9568 (2:5568)
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_9573: ; 9573 (2:5573)
	di
	call DisableLCD
	xor a
	ld [rIF], a
	ld [rIE], a
	xor a
	ld [wSubroutine2], a
	ld [wc46c], a
	ld [wc469], a
	ld [wc46d], a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wcb3f], a
	xor a
	ld [rVBK], a
	ld [rSVBK], a
	ld [rRP], a
	call InitSoundData
	call WhiteDMGPals
	ld a, $c3
	ld [wLCDC], a
	ld [rLCDC], a
	ei
	call InitSerialData
	ld a, $40
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld a, $b
	ld [rIE], a
	xor a
	ld [wcb3f], a
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	xor a
	call GetCGB_BGLayout_
	call GetCGB_OBLayout_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call ClearObjectAnimationBuffers
	xor a
	ld [wSubroutine], a
	ld b, $0
	call Func_3768
	ret
