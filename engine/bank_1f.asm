Func_7c000:
	ld a, $f0
	ld [wc91e], a
	ld a, [wSubroutine]
	jump_table
	dw Func_7c019
	dw Func_7c01c
	dw Func_7c01f
	dw Func_7c022
	dw Func_7c025

Func_7c019: ; 7c019 (1f:4019)
	jp Func_7c028

Func_7c01c: ; 7c01c (1f:401c)
	jp Func_7c6f7

Func_7c01f: ; 7c01f (1f:401f)
	jp Func_7e358

Func_7c022: ; 7c022 (1f:4022)
	jp Func_7f0c9

Func_7c025: ; 7c025 (1f:4025)
	jp Func_7c443

Func_7c028: ; 7c028 (1f:4028)
	ld a, [wBattleSubroutine]
	cp $0
	jr z, .asm_7c03b
	cp $6
	jr z, .asm_7c03b
	cp $a
	jr z, .asm_7c03b
	cp $b
	jr nz, .asm_7c053
.asm_7c03b
	call Func_7c61b
	ld a, [wCGBPalFadeProgram]
	or a
	jr z, .asm_7c053
	ld a, $5
	ld [H_SFX_ID], a
	ld a, $4
	ld [wdc4a], a
	ld a, $e
	ld [wBattleSubroutine], a
.asm_7c053
	ld a, [wBattleSubroutine]
	jump_table
	dw Func_7c081
	dw Func_7c08d
	dw Func_7c0b9
	dw Func_7c11e
	dw Func_7c128
	dw Func_7c15a
	dw Func_7c1fe
	dw Func_7c240
	dw Func_7c24a
	dw Func_7c2db
	dw Func_7c2e5
	dw Func_7c35e
	dw Func_7c399
	dw Func_7c3a1
	dw Func_7c3ab
	dw Func_7c3c4
	dw Func_7c1ed
	dw Func_7c228

Func_7c081: ; 7c081 (1f:4081)
	xor a
	ld [wd43a], a
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c08d: ; 7c08d (1f:408d)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_3566
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	xor a
	ld [wMoveAnimationTimer], a
	ld [wdc20], a
	ld [wdc58], a
	call InitSerialData
	jp NextBattleSubroutine

Func_7c0b9: ; 7c0b9 (1f:40b9)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $2
	call GetCGB_BGLayout_
	ld bc, $40
	call DecompressGFXByIndex_
	ld bc, $41
	call DecompressGFXByIndex_
	ld a, $82
	ld [wca65], a
	ld bc, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld c, $91
	call Func_3d02
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c11e: ; 7c11e (1f:411e)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c128: ; 7c128 (1f:4128)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $0
	call Func_0543
	ld a, $20
	ld [wd4ee], a
	call Func_7e0ec
	xor a
	ld [wd40d], a
	call Func_7e0f9
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld c, $92
	call Func_3d02
	jp NextBattleSubroutine

Func_7c15a: ; 7c15a (1f:415a)
	call Func_3cd0
	call PrintText_
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_7c17b
	ld a, [wd40d]
	cp $0
	jr z, .asm_7c174
	ld a, $0
	ld [wd40d], a
	jr .asm_7c194

.asm_7c174
	ld a, $1
	ld [wd40d], a
	jr .asm_7c194

.asm_7c17b
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_7c19c
	ld a, [wd40d]
	cp $1
	jr z, .asm_7c18f
	ld a, $1
	ld [wd40d], a
	jr .asm_7c194

.asm_7c18f
	ld a, $0
	ld [wd40d], a
.asm_7c194
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_7e0f9

.asm_7c19c
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .asm_7c1d0
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $0
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_7c1d0
	ld c, $72
	call Func_3d02
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld a, $10
	ld [wBattleSubroutine], a
	ret

.asm_7c1d0
	ld a, $4
	ld [H_SFX_ID], a
	ld a, $0
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1
	call Func_050a
	ld a, $f
	ld [wBattleSubroutine], a
	ret

Func_7c1ed: ; 7c1ed (1f:41ed)
	call PrintText_
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, $6
	ld [wBattleSubroutine], a
	ret

Func_7c1fe: ; 7c1fe (1f:41fe)
	call PrintText_
	call Func_7c575
	ld a, [wdc58]
	cp $1
	jr z, .asm_7c210
	cp $2
	jr z, .asm_7c220
	ret

.asm_7c210
	ld a, $5
	ld [H_SFX_ID], a
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld a, $11
	ld [wBattleSubroutine], a
	ret

.asm_7c220
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c228: ; 7c228 (1f:4228)
	call PrintText_
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	xor a
	ld [wBattleSubroutine], a
	ld [wdc4a], a
	ld a, $4
	ld [wSubroutine], a
	ret

Func_7c240: ; 7c240 (1f:4240)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c24a: ; 7c24a (1f:424a)
	ld bc, $2
	call GetCGB_BGLayout_
	ld bc, $40
	call DecompressGFXByIndex_
	ld bc, $41
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $60
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $0
	ld e, $60
	ld a, $0
	call LoadStdBGMapAttrLayout_
IF DEF(POWER)
	ld a, CRYPTO
ELSE
	ld a, FUNGUS
ENDC
	ld [wCurDenjuuBuffer], a
	ld a, $b0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wd4ee], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	call Func_7c3e3
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBuffer]
	ld b, $1
	call Func_7c3e3
	ld a, $4
	ld [wd459], a
	callba Func_70448
	ld a, $1f
	ld [wPrevROMBank], a
	xor a
	ld [wd40d], a
	call Func_7c41b
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $c
	ld [wd411], a
	call Func_3cb5
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	call Func_3cb5
	xor a
	ld [wd458], a
	ld a, $27
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c2db: ; 7c2db (1f:42db)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c2e5: ; 7c2e5 (1f:42e5)
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
	ld a, [hJoyNew]
	and D_UP
	jr z, .asm_7c30f
	ld a, [wd40d]
	cp $0
	jr z, .asm_7c308
	dec a
	ld [wd40d], a
	jr .asm_7c327

.asm_7c308
	ld a, $2
	ld [wd40d], a
	jr .asm_7c327

.asm_7c30f
	ld a, [hJoyNew]
	and D_DOWN
	jr z, .asm_7c340
	ld a, [wd40d]
	cp $2
	jr z, .asm_7c322
	inc a
	ld [wd40d], a
	jr .asm_7c327

.asm_7c322
	ld a, $0
	ld [wd40d], a
.asm_7c327
	ld a, $2
	ld [H_SFX_ID], a
	call Func_7c41b
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	call Func_3cb5
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	call Func_3cb5
	ret

.asm_7c340
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wd40d]
	inc a
	ld [wdc34], a
	ld a, $1
	ld [wd458], a
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c35e: ; 7c35e (1f:435e)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wBattleSubroutine], a
	ld [wd401], a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call LoadGame_
	ld a, [wd40d]
	cp $0
	jr z, .asm_7c38a
	cp $1
	jr z, .asm_7c38d
	cp $2
	jr z, .asm_7c393
.asm_7c38a
	jp IncrementSubroutine

.asm_7c38d
	ld a, $2
	ld [wSubroutine], a
	ret

.asm_7c393
	ld a, $3
	ld [wSubroutine], a
	ret

Func_7c399: ; 7c399 (1f:4399)
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c3a1: ; 7c3a1 (1f:43a1)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c3ab: ; 7c3ab (1f:43ab)
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wBattleSubroutine], a
	ld [wd401], a
	ld a, $4
	ld [wSubroutine], a
	ret

Func_7c3c4: ; 7c3c4 (1f:43c4)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld a, $3
	ld [wGameRoutine], a
	ret

Func_7c3e3: ; 7c3e3 (1f:43e3)
	push af
	ld a, b
	cp $0
	jr z, .asm_7c3ed
	cp $1
	jr z, .asm_7c3f2
.asm_7c3ed
	ld hl, VTilesOB tile $50
	jr .asm_7c3f5

.asm_7c3f2
	ld hl, VTilesOB tile $5c
.asm_7c3f5
	pop af
	push hl
	ld [wd409], a
	call GetDenjuuSprite_
	pop hl
	ld a, [wd409]
	jp GetOverworldSprite_SizeHL

Func_7c404:
	push de
	ld bc, $28c
	ld h, $0
	ld a, [wd409]
	ld l, a
	add hl, bc
	push hl
	pop bc
	pop af
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_7c41b: ; 7c41b (1f:441b)
	ld a, [wd40d]
	cp $0
	jr z, .asm_7c428
	cp $1
	jr z, .asm_7c42c
	jr .asm_7c430

.asm_7c428
	ld a, $38
	jr .asm_7c432

.asm_7c42c
	ld a, $50
	jr .asm_7c432

.asm_7c430
	ld a, $68
.asm_7c432
	ld [wSpriteInitYCoordBuffers], a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $20
	ld [wSpriteInitXCoordBuffers], a
	add $60
	ld [wSpriteInitXCoordBuffers + 1], a
	ret

Func_7c443: ; 7c443 (1f:4443)
	ld a, [wBattleSubroutine]
	jump_table
	dw Func_7c459
	dw Func_7c461
	dw Func_7c46b
	dw Func_7c52e
	dw Func_7c538
	dw Func_7c553

Func_7c459: ; 7c459 (1f:4459)
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c461: ; 7c461 (1f:4461)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c46b: ; 7c46b (1f:446b)
	ld bc, $2
	call GetCGB_BGLayout_
	ld bc, $40
	call DecompressGFXByIndex_
	ld bc, $41
	call DecompressGFXByIndex_
	ld a, $82
	ld [wca65], a
	ld bc, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $500
	ld e, $bf
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $500
	ld e, $bf
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	call Func_3566
	call Func_3f02
	ld a, [wdc4a]
	cp $0
	jr z, .asm_7c4e9
	cp $1
	jr z, .asm_7c4f0
	cp $2
	jr z, .asm_7c4f7
	cp $3
	jr z, .asm_7c4fe
	cp $4
	jr z, .asm_7c505
	cp $5
	jr z, .asm_7c50c
	cp $6
	jr z, .asm_7c513
	cp $7
	jr z, .asm_7c51a
	cp $8
	jr z, .asm_7c521
.asm_7c4e9
	ld c, $73
	call Func_7f432
	jr .asm_7c526

.asm_7c4f0
	ld c, $78
	call Func_7f432
	jr .asm_7c526

.asm_7c4f7
	ld c, $7d
	call Func_7f432
	jr .asm_7c526

.asm_7c4fe
	ld c, $77
	call Func_7f432
	jr .asm_7c526

.asm_7c505
	ld c, $74
	call Func_7f432
	jr .asm_7c526

.asm_7c50c
	ld c, $7b
	call Func_7f432
	jr .asm_7c526

.asm_7c513
	ld c, $7a
	call Func_7f432
	jr .asm_7c526

.asm_7c51a
	ld c, $89
	call Func_7f432
	jr .asm_7c526

.asm_7c521
	ld c, $8a
	call Func_7f432
.asm_7c526
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c52e: ; 7c52e (1f:452e)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_7c538: ; 7c538 (1f:4538)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $10
	ld [wcf96], a
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_7c553: ; 7c553 (1f:4553)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld [wd456], a
	ld a, $3
	ld [wGameRoutine], a
	ret

Func_7c575: ; 7c575 (1f:4575)
	ld a, [wdc20]
	jump_table Pointers_7c584

Func_7c57f: ; 7c57f (1f:457f)
	ld hl, wdc20
	inc [hl]
	ret

Pointers_7c584:
	dw Func_7c590
	dw Func_7c5a2
	dw Func_7c5ad
	dw Func_7c5c7
	dw Func_7c5e1
	dw Func_7c5eb

Func_7c590:
	ld a, $4
	ld [wdc23], a
	ld a, [wdc05]
	or a
	jp nz, Func_7c59f
	call Func_1d38
Func_7c59f: ; 7c59f (1f:459f)
	jp Func_7c57f

Func_7c5a2:
	ld a, [wdc23]
	dec a
	ld [wdc23], a
	ret nz
	jp Func_7c57f

Func_7c5ad:
	xor a
	ld [wdc22], a
	ld [wdc58], a
	ld a, $2
	ld [wdc48], a
	ld a, $58
	ld [wdc49], a
	jp Func_7c57f

Func_7c5c1:
	ld a, $5
	ld [wdc20], a
	ret

Func_7c5c7:
	ld a, [hJoyNew]
	and B_BUTTON
	jp nz, Func_7c5db
	call Func_7c656
	ld a, [wCGBPalFadeProgram]
	or a
	ret z
	cp $1
	jp z, Func_7c57f
Func_7c5db: ; 7c5db (1f:45db)
	ld a, $5
	ld [wdc20], a
	ret

Func_7c5e1:
	xor a
	ld [wdc20], a
	ld a, $2
	ld [wdc58], a
	ret

Func_7c5eb:
	xor a
	ld [wdc20], a
	ld a, $5
	ld [H_SFX_ID], a
	call InitSerialData
	ld a, $1
	ld [wdc58], a
	ret

Func_7c5fd: ; 7c5fd (1f:45fd)
	ld hl, wdb00
	ld a, [wdc45]
	ld c, a
	ld b, $0
	add hl, bc
	ret

Func_7c608:
	push hl
	push bc
	push af
	call Func_7c5fd
	xor a
	ld [hl], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	pop af
	pop bc
	pop hl
	ret

Func_7c61b: ; 7c61b (1f:461b)
	xor a
	ld [wCGBPalFadeProgram], a
	ld a, [wdc01]
	or a
	jr z, .asm_7c638
	ld a, [wdc2e]
	cp $ff
	jr nz, .asm_7c638
	ld a, [wdc59]
	cp $8
	jr nc, .asm_7c649
	inc a
	ld [wdc59], a
	ret

.asm_7c638
	ld a, [wdc07]
	cp $8
	jp nc, .asm_7c649
	inc a
	ld [wdc07], a
	xor a
	ld [wdc59], a
	ret

.asm_7c649
	xor a
	ld [wdc07], a
	ld [wdc59], a
	ld a, $1
	ld [wCGBPalFadeProgram], a
	ret

Func_7c656: ; 7c656 (1f:4656)
	xor a
	ld [wCGBPalFadeProgram], a
	ld a, [wdc22]
	jump_table
	dw Func_7c670
	dw Func_7c678
	dw Func_7c6b0
	dw Func_7c6bb
	dw Func_7c6c6
	dw Func_7c6e0

Func_7c670: ; 7c670 (1f:4670)
	ld a, $11
	ld [wdc34], a
	jp Func_7c6f2

Func_7c678: ; 7c678 (1f:4678)
	call Func_7c5fd
	ld a, [hl]
	or a
	jr nz, .asm_7c698
.asm_7c67f
	ld a, [wdc49]
	sub $1
	ld [wdc49], a
	ld b, a
	ld a, [wdc48]
	sbc $0
	ld [wdc48], a
	or b
	ret nz
.asm_7c692
	ld a, $2
	ld [wCGBPalFadeProgram], a
	ret

.asm_7c698
	cp $11
	jr z, .asm_7c6a5
	cp $ff
	jr z, .asm_7c692
	call Func_7c608
	jr .asm_7c67f

.asm_7c6a5
	call Func_7c608
	ld a, $20
	ld [wdc23], a
	jp Func_7c6f2

Func_7c6b0: ; 7c6b0 (1f:46b0)
	ld a, [wdc23]
	dec a
	ld [wdc23], a
	ret nz
	jp Func_7c6f2

Func_7c6bb: ; 7c6bb (1f:46bb)
	ld a, [wdc01]
	or $80
	ld [wdc34], a
	jp Func_7c6f2

Func_7c6c6: ; 7c6c6 (1f:46c6)
	call Func_7c5fd
	ld a, [hl]
	or a
	ret z
	cp $ff
	jr z, .asm_7c6da
	and $f
	ld b, a
	ld a, [wdc01]
	cp b
	jp nz, Func_7c6f2
.asm_7c6da
	ld a, $2
	ld [wCGBPalFadeProgram], a
	ret

Func_7c6e0: ; 7c6e0 (1f:46e0)
	call Func_7c608
	ld a, $1
	ld [wcf96], a
	xor a
	ld [wdc22], a
	ld a, $1
	ld [wCGBPalFadeProgram], a
	ret

Func_7c6f2: ; 7c6f2 (1f:46f2)
	ld hl, wdc22
	inc [hl]
	ret

Func_7c6f7: ; 7c6f7 (1f:46f7)
	ld a, [wBattleSubroutine]
	jump_table
	dw Func_7c70b
	dw Func_7c70e
	dw Func_7c711
	dw Func_7c714
	dw Func_7c717

Func_7c70b: ; 7c70b (1f:470b)
	jp Func_7c71a

Func_7c70e: ; 7c70e (1f:470e)
	jp Func_7c8f1

Func_7c711: ; 7c711 (1f:4711)
	jp Func_7db03

Func_7c714: ; 7c714 (1f:4714)
	jp Func_7dc46

Func_7c717: ; 7c717 (1f:4717)
	jp Func_7e11a

Func_7c71a: ; 7c71a (1f:471a)
	ld a, [wd401]
	cp $b
	jr z, .asm_7c725
	cp $7
	jr nz, .asm_7c73d
.asm_7c725
	call Func_7c61b
	ld a, [wCGBPalFadeProgram]
	or a
	jr z, .asm_7c73d
	ld a, $5
	ld [H_SFX_ID], a
	ld a, $4
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
.asm_7c73d
	ld a, [wd401]
	jump_table
	dw Func_7c75f
	dw Func_7c7e4
	dw Func_7c837
	dw Func_7c858
	dw Func_7c886
	dw Func_7c88e
	dw Func_7c8b2
	dw Func_7c8ba
	dw Func_7c8d0
	dw Func_7c8e2
	dw Func_7c7ad
	dw Func_7c7bc

Func_7c75f: ; 7c75f (1f:475f)
	ld bc, $2
	call GetCGB_BGLayout_
	lb bc, 0, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, $0
	ld e, $61
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, $5, $0
	ld e, $bc
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $5, $0
	ld e, $bc
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	call Func_3566
	ld a, $4
	call Func_050a
	ld a, $a
	ld [wd401], a
	ret

Func_7c7ad: ; 7c7ad (1f:47ad)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld c, $72
	call Func_3d02
	jp Func_7dc41

Func_7c7bc: ; 7c7bc (1f:47bc)
	call Func_3eee
	cp $0
	jr nz, .asm_7c7c7
	call PrintText_
	ret

.asm_7c7c7
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $1
	jr z, .asm_7c7de
	ld a, $3
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
	ret

.asm_7c7de
	ld a, $1
	ld [wd401], a
	ret

Func_7c7e4: ; 7c7e4 (1f:47e4)
	ld a, [wc434]
	or a
	jr nz, .asm_7c827
	xor a
	ld [wd4b0], a
	ld b, $0
	ld hl, wd000
.asm_7c7f3
	push hl
	push bc
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld a, b
	call Func_3d0e
	ld a, [hl]
	pop bc
	pop hl
	cp $0
	jr z, .asm_7c80d
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.asm_7c80d
	ld a, $fe
	cp b
	jr z, .asm_7c815
	inc b
	jr .asm_7c7f3

.asm_7c815
	call CloseSRAM
	ld a, [wd4b0]
	cp $2
	jr c, .asm_7c827
	ld a, $f0
	ld [wdc34], a
	jp Func_7dc41

.asm_7c827
	ld a, $f9
	ld [wdc34], a
	ld a, $1
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
	ret

Func_7c837: ; 7c837 (1f:4837)
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $f0
	jp z, Func_7c855
	ld a, $3
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
	ret

Func_7c855: ; 7c855 (1f:4855)
	jp Func_7dc41

Func_7c858: ; 7c858 (1f:4858)
	ld hl, Data_7dc8f
	ld a, [wCurPhoneGFX]
	cp $0
	jr z, .asm_7c866
.asm_7c862
	inc hl
	dec a
	jr nz, .asm_7c862
.asm_7c866
	ld a, [hl]
	ld b, a
	ld a, [wd4b0]
	cp b
	jr nc, .asm_7c876
	ld a, $e0
	ld [wdc34], a
	jp Func_7dc41

.asm_7c876
	ld a, $ee
	ld [wdc34], a
	ld a, $2
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
	ret

Func_7c886: ; 7c886 (1f:4886)
	ld c, $72
	call Func_3d02
	jp Func_7dc41

Func_7c88e: ; 7c88e (1f:488e)
	call PrintText_
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $e0
	jp z, Func_7c8af
	ld a, $2
	ld [wdc4a], a
	ld a, $9
	ld [wd401], a
	ret

Func_7c8af: ; 7c8af (1f:48af)
	jp Func_7dc41

Func_7c8b2: ; 7c8b2 (1f:48b2)
	ld c, $79
	call Func_3d02
	jp Func_7dc41

Func_7c8ba: ; 7c8ba (1f:48ba)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld c, $96
	call Func_3d02
	jp Func_7dc41

Func_7c8d0: ; 7c8d0 (1f:48d0)
	call PrintText_
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	xor a
	ld [wd401], a
	jp NextBattleSubroutine

Func_7c8e2: ; 7c8e2 (1f:48e2)
	xor a
	ld [wd401], a
	ld a, $0
	ld [wBattleSubroutine], a
	ld a, $4
	ld [wSubroutine], a
	ret

Func_7c8f1: ; 7c8f1 (1f:48f1)
	ld a, [wd401]
	cp $c
	jr z, .asm_7c90f
	cp $b
	jr z, .asm_7c90f
	call Func_7c61b
	ld a, [wCGBPalFadeProgram]
	or a
	jr z, .asm_7c90f
	ld c, $74
	call Func_3d02
	ld a, $c
	ld [wd401], a
.asm_7c90f
	ld a, [wd401]
	jump_table
	dw Func_7c947
	dw Func_7cb81
	dw Func_7cbbe
	dw Func_7cbd4
	dw Func_7cbe4
	dw Func_7ce4e
	dw Func_7ce84
	dw Func_7cea1
	dw Func_7ceb5
	dw Func_7d12f
	dw Func_7d13c
	dw Func_7d1d3
	dw Func_7cfbd
	dw Func_7cfd9
	dw Func_7d085
	dw Func_7d066
	dw Func_7d1ed
	dw Func_7cf96
	dw Func_7caaa

String_7c93f:
	db "リスト  /  "

Func_7c947: ; 7c947 (1f:4947)
	ld hl, wPlayerDenjuu1
	call Func_7dafa
	ld hl, wPlayerDenjuu2
	call Func_7dafa
	ld hl, wPlayerDenjuu3
	call Func_7dafa
	ld hl, wEnemyDenjuu1
	call Func_7dafa
	ld hl, wEnemyDenjuu2
	call Func_7dafa
	ld hl, wEnemyDenjuu3Species
	call Func_7dafa
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	ld [wEnemyDenjuu1ArrivedStatus], a
	ld a, $0
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wEnemyDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld [wEnemyDenjuu3ArrivedStatus], a
	ld a, $0
	ld [wd5a8], a
	ld a, $2
	ld [wd4e5], a
	ld a, $1
	ld [wd4e6], a
	ld a, $1
	ld [wd4e7], a
	xor a
	ld [wd5d0], a
	ld [wd5d1], a
	ld [wd5d2], a
	ld [wd5d3], a
	ld [wd5d4], a
	xor a
	ld [wCurBattleDenjuu], a
	ld [wCurEnemyDenjuu], a
	inc a
	ld [wCurBattleDenjuu2], a
	ld [wCurEnemyDenjuu2], a
	inc a
	ld [wCurBattleDenjuu3], a
	ld [wCurEnemyDenjuu3], a
	xor a
	ld [wd412], a
	ld [wd4ea], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wd42e], a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd4bd], a
	ld [wd4be], a
	ld [wd4bf], a
	ld [wd5ba], a
	ld [wd5bb], a
	ld [wd5bc], a
	ld [wd5bd], a
	ld [wd5be], a
	ld [wd5bf], a
	ld [wd5c0], a
	ld [wd5c1], a
	ld [wd5c2], a
	ld [wd5c3], a
	ld [wd5c4], a
	ld [wd5c5], a
	ld [wPlayerDenjuu1AttackedOnItsOwn], a
	ld [wPlayerDenjuu2AttackedOnItsOwn], a
	ld [wPlayerDenjuu3AttackedOnItsOwn], a
	ld [wPlayerDenjuu1LastMoveSelection], a
	ld [wPlayerDenjuu2LastMoveSelection], a
	ld [wPlayerDenjuu3LastMoveSelection], a
	ld [wd4a8], a
	ld [wd4a9], a
	ld [wd4aa], a
	ld [wd450], a
	ld [wd451], a
	ld [wd452], a
	ld [wd453], a
	ld [wd430], a
	ld [wd431], a
	ld [wd432], a
	ld [wd433], a
	ld a, [wd43a]
	cp $1
	jp z, Func_7ca9c
	xor a
	ld [wBattleMenuSelection], a
	ld [wd4a0], a
	ld [wd4a1], a
	ld a, $3
	ld [wd42b], a
	ld [wd429], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld de, $10
	ld b, $0
	ld a, $fe
	ld c, a
	ld a, b
	cp $0
	jr z, .asm_7ca71
.asm_7ca70
	add hl, de
.asm_7ca71
	ld a, [hl]
	cp $0
	jr z, .asm_7ca77
	inc b
.asm_7ca77
	dec c
	ld a, c
	jr nz, .asm_7ca70
	ld a, b
	ld [wd40c], a
	call Func_7d620
	ld a, [wd4b0]
	dec a
	ld b, $0
	ld a, a
	ld c, a
	ld d, $0
	ld a, $3
	ld e, a
	call Func_0628
	ld a, c
	ld [wd4a1], a
	call Func_7d602
	call Func_7d55f
Func_7ca9c: ; 7ca9c (1f:4a9c)
	call CloseSRAM
	ld a, $1
	call Func_050a
	ld a, $12
	ld [wd401], a
	ret

Func_7caaa: ; 7caaa (1f:4aaa)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd43a]
	cp $1
	jr nz, .asm_7cabe
	ld bc, $15
	call DecompressGFXByIndex_
.asm_7cabe
	ld bc, $12
	call GetCGB_BGLayout_
	ld a, $28
	call Func_3eb9
	ld bc, $15
	call DecompressGFXByIndex_
	ld hl, VTilesShared tile $00
	call Func_7d56b
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, $390
	add hl, de
	push hl
	pop bc
	xor a
	call Func_10ee
	ld a, $0
	call Func_0543
	ld a, $5
	ld [wca65], a
	ld hl, VTilesBG tile $40
	ld a, $20
	call ClearString
	lb bc, 0, 0
	ld e, $d
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $d
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, 0
	ld e, $b7
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $5
	ld e, $8c
	ld a, $0
	call LoadStdBGMapAttrLayout_
	hlbgcoord 2, 4
	ld a, $3
	call Func_7d59a
	ld de, String_7c93f
	ld hl, VTilesBG tile $10
	ld b, $8
	call PlaceString_
	ld a, [wd4a1]
	inc a
	hlbgcoord 17, 1
	ld c, $1
	call Func_1430
	call Func_7d694
	call Func_7d796
	call Func_7d6fe
	call Func_7d905
	call OpenSRAMBank2
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hl]
	ld [wd490], a
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	call CloseSRAM
	ld a, $13
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $4
	call Func_050a
	ld a, $1
	ld [wd401], a
	ret

Func_7cb81: ; 7cb81 (1f:4b81)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wd4a1]
	cp $1
	jr c, .asm_7cb92
	call Func_7da8d
.asm_7cb92
	call Func_7d8ce
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, [wd43a]
	cp $1
	jr nz, .asm_7cbbb
	xor a
	ld [wd43a], a
	ld a, $3
	ld [wd401], a
	ret

.asm_7cbbb
	jp Func_7dc41

Func_7cbbe: ; 7cbbe (1f:4bbe)
	ld a, [wdc01]
	cp $0
	jr z, .asm_7cbcc
	ld a, $1
	ld [wd458], a
	jr .asm_7cbd1

.asm_7cbcc
	ld a, $0
	ld [wd458], a
.asm_7cbd1
	jp Func_7dc41

Func_7cbd4: ; 7cbd4 (1f:4bd4)
	ld h, $0
	ld a, $3
	ld l, a
	call PrintNumHL
	ld c, $6a
	call Func_3d02
	jp Func_7dc41

Func_7cbe4: ; 7cbe4 (1f:4be4)
	call Func_3cd0
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_7cbfb
	ld a, [wBattleMenuSelection]
	cp $0
	jr z, .asm_7cbfb
	dec a
	ld [wBattleMenuSelection], a
	jr .asm_7cc14

.asm_7cbfb
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_7cc1f
	ld a, [wd413]
	sub $1
	ld b, a
	ld a, [wBattleMenuSelection]
	cp b
	jp z, Func_7cc1f
	inc a
	ld [wBattleMenuSelection], a
.asm_7cc14
	ld a, $2
	ld [H_SFX_ID], a
	ld a, $5
	ld [wd401], a
	ret

Func_7cc1f: ; 7cc1f (1f:4c1f)
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_7cc48
	ld a, [wd4a1]
	cp $0
	jp z, Func_7ccb0
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd4a0]
	cp $0
	jr z, .asm_7cc40
	dec a
	ld [wd4a0], a
	jr .asm_7cc72

.asm_7cc40
	ld a, [wd4a1]
	ld [wd4a0], a
	jr .asm_7cc72

.asm_7cc48
	ld a, [wJoyNew]
	and D_RIGHT
	jp z, Func_7ccb0
	ld a, [wd4a1]
	cp $0
	jp z, Func_7ccb0
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd4a1]
	ld b, a
	ld a, [wd4a0]
	cp b
	jr z, .asm_7cc6d
	inc a
	ld [wd4a0], a
	jr .asm_7cc72

.asm_7cc6d
	ld a, $0
	ld [wd4a0], a
.asm_7cc72
	xor a
	ld [wBattleMenuSelection], a
	ld a, $0
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld hl, VTilesBG tile $40
	ld a, $18
	call ClearString
	call Func_7d55f
	call Func_7d602
	call Func_7d694
	call Func_7d796
	call Func_7d6fe
	call CloseSRAM
	xor a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_7d96c
	call Func_7d97c
	ld a, $5
	ld [wd401], a
	ret

Func_7ccb0: ; 7ccb0 (1f:4cb0)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_7cdae
	ld a, [wd42e]
	cp $0
	jr nz, .asm_7ccd1
	ld a, $1
	ld [wd4ba], a
	ld a, [wd4a0]
	ld [wd4bb], a
	ld a, [wBattleMenuSelection]
	ld [wd4bc], a
	jr .asm_7cce2

.asm_7ccd1
	ld a, $1
	ld [wd4bd], a
	ld a, [wd4a0]
	ld [wd4be], a
	ld a, [wBattleMenuSelection]
	ld [wd4bf], a
.asm_7cce2
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wBattleMenuSelection]
	cp $0
	jp z, Func_7ccf9
	cp $1
	jp z, Func_7cd25
	cp $2
	jp z, Func_7cd51
Func_7ccf9: ; 7ccf9 (1f:4cf9)
	ld a, [wd47c]
	cp $1
	jp z, Func_7ce34
	ld a, $1
	ld [wd47c], a
	ld a, $0
	call Func_7d949
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_7d9fd
	ld a, [wd42e]
	inc a
	ld [wd42e], a
	jp Func_7cd7a

Func_7cd25: ; 7cd25 (1f:4d25)
	ld a, [wd47d]
	cp $1
	jp z, Func_7ce34
	ld a, $1
	ld [wd47d], a
	ld a, $1
	call Func_7d949
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_7d9fd
	ld a, [wd42e]
	inc a
	ld [wd42e], a
	jp Func_7cd7a

Func_7cd51: ; 7cd51 (1f:4d51)
	ld a, [wd47e]
	cp $1
	jp z, Func_7ce34
	ld a, $1
	ld [wd47e], a
	ld a, $2
	call Func_7d949
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_7d9fd
	ld a, [wd42e]
	inc a
	ld [wd42e], a
Func_7cd7a: ; 7cd7a (1f:4d7a)
	ld a, [wd42e]
	cp $3
	jp z, Func_7ce34
	ld a, [wd413]
	cp $1
	jr z, .asm_7cdad
	cp $2
	jr z, .asm_7cd91
	cp $3
	jr z, .asm_7cd9a
.asm_7cd91
	ld a, [wBattleMenuSelection]
	cp $1
	jr z, .asm_7cdad
	jr .asm_7cda1

.asm_7cd9a
	ld a, [wBattleMenuSelection]
	cp $2
	jr z, .asm_7cdad
.asm_7cda1
	ld a, [wBattleMenuSelection]
	inc a
	ld [wBattleMenuSelection], a
	ld a, $5
	ld [wd401], a
.asm_7cdad
	ret

Func_7cdae: ; 7cdae (1f:4dae)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_7ce04
	ld a, $0
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $0
	ld [wd42e], a
	xor a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_7d96c
	xor a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd4bd], a
	ld [wd4be], a
	ld [wd4bf], a
	ld c, $6a
	call Func_3d02
	ld a, [wd429]
	cp $1
	jr nz, .asm_7ce03
	ld a, [wd42b]
	cp $1
	jr z, .asm_7ce03
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, [wd429]
	inc a
	ld [wd429], a
.asm_7ce03
	ret

.asm_7ce04
	ld a, [wd42e]
	cp $0
	jr z, .asm_7ce19
	ld a, [hJoyNew]
	and START
	jp z, .asm_7ce19
	ld a, $3
	ld [H_SFX_ID], a
	jr Func_7ce34

.asm_7ce19
	ld a, [hJoyNew]
	and SELECT
	jp z, Func_7ce30
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wd401], a
	ret

Func_7ce30: ; 7ce30 (1f:4e30)
	call PrintText_
	ret

Func_7ce34: ; 7ce34 (1f:4e34)
	ld c, $1e
	call Func_3d02
	xor a
	ld [wd40d], a
	call Func_7e0f9
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, $7
	ld [wd401], a
	ret

Func_7ce4e: ; 7ce4e (1f:4e4e)
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	call OpenSRAMBank2
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hl]
	ld [wd490], a
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	ld a, $1
	ld [wBGPalUpdate], a
	call CloseSRAM
	jp Func_7dc41

Func_7ce84: ; 7ce84 (1f:4e84)
	lb bc, $1, $5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $5
	ld e, $8c
	ld a, $0
	call LoadStdBGMapAttrLayout_
	call Func_7d8ce
	ld a, $4
	ld [wd401], a
	ret

Func_7cea1: ; 7cea1 (1f:4ea1)
	call PrintText_
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $a
	ret c
	xor a
	ld [wMoveAnimationTimer], a
	jp Func_7dc41

Func_7ceb5: ; 7ceb5 (1f:4eb5)
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_7ced0
	ld a, [wd40d]
	cp $0
	jr z, .asm_7cec9
	ld a, $0
	ld [wd40d], a
	jr .asm_7cee9

.asm_7cec9
	ld a, $1
	ld [wd40d], a
	jr .asm_7cee9

.asm_7ced0
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_7cef1
	ld a, [wd40d]
	cp $1
	jr z, .asm_7cee4
	ld a, $1
	ld [wd40d], a
	jr .asm_7cee9

.asm_7cee4
	ld a, $0
	ld [wd40d], a
.asm_7cee9
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_7e0f9

.asm_7cef1
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_7cefa
	jp Func_7cf0d

.asm_7cefa
	call Func_3cd0
	call PrintText_
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, asm_7cf42
	ld a, [wd40d]
	cp $0
	jr z, asm_7cf4e
Func_7cf0d: ; 7cf0d (1f:4f0d)
	ld a, $4
	ld [H_SFX_ID], a
	xor a
	ld [wd42e], a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd4bd], a
	ld [wd4be], a
	ld [wd4bf], a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_7d96c
	call Func_7d8ce
	ld c, $6a
	call Func_3d02
	ld a, $4
	ld [wd401], a
	ret

asm_7cf42
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wd40d]
	cp $1
	jr z, Func_7cf0d
asm_7cf4e
	ld a, [wd42e]
	cp $1
	jr z, .asm_7cf6c
	cp $2
	jr z, .asm_7cf5d
	cp $3
	jr z, .asm_7cf64
.asm_7cf5d
	ld a, $1
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_7cf6c

.asm_7cf64
	ld a, $1
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_7cf6c
	ld a, $3
	ld [H_SFX_ID], a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation05], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	xor a
	ld [wd45b], a
	ld a, [wd42e]
	ld [wdc34], a
	ld c, $72
	call Func_3d02
	ld a, $11
	ld [wd401], a
	ret

Func_7cf96: ; 7cf96 (1f:4f96)
	ld hl, wdb00
	ld a, [wdc45]
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	cp $0
	jr nz, .asm_7cfa9
	call PrintText_
	ret

.asm_7cfa9
	ld a, [hl]
	ld [wd42f], a
	ld [wEnemyPartySize], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, $d
	ld [wd401], a
	ret

Func_7cfbd: ; 7cfbd (1f:4fbd)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	call InitSerialData
	ld a, $10
	ld [wcf96], a
	ld a, $4
	call Func_050a
	ld a, $b
	ld [wd401], a
	ret

Func_7cfd9: ; 7cfd9 (1f:4fd9)
	ld hl, wd5d0
	ld b, $10
.asm_7cfde
	ld a, $0
	ld [hli], a
	dec b
	jr nz, .asm_7cfde
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu1Field0x0d]
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hli]
	ld [wd5d0], a
	ld a, [hli]
	ld [wd5d1], a
	ld a, [hli]
	ld [wd5d2], a
	ld a, [hli]
	ld [wd5d3], a
	ld a, [hl]
	ld [wd5d4], a
	ld a, [wd42e]
	cp $1
	jr z, .asm_7d054
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2Field0x0d]
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hli]
	ld [wd5d5], a
	ld a, [hli]
	ld [wd5d6], a
	ld a, [hli]
	ld [wd5d7], a
	ld a, [hli]
	ld [wd5d8], a
	ld a, $20
	ld [wd5d9], a
	ld a, [wd42e]
	cp $2
	jr z, .asm_7d054
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu3Field0x0d]
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hli]
	ld [wd5da], a
	ld a, [hli]
	ld [wd5db], a
	ld a, [hli]
	ld [wd5dc], a
	ld a, [hli]
	ld [wd5dd], a
	ld a, $20
	ld [wd5de], a
.asm_7d054
	ld a, $ec
	ld [wd5df], a
	call CloseSRAM
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $f
	ld [wd401], a
	ret

Func_7d066: ; 7d066 (1f:5066)
	ld hl, wd5d0
	ld d, $0
	ld a, [wMoveAnimationTimer]
	ld e, a
	add hl, de
	ld a, [hl]
	inc a
	ld [wdc34], a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $10
	ret nz
	ld a, $e
	ld [wd401], a
	ret

Func_7d085: ; 7d085 (1f:5085)
	ld hl, wdb00
	ld a, [wdc45]
	add $f
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	cp $ed
	jr z, .asm_7d097
	ret

.asm_7d097
	ld de, wd5d0
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, [wdc45]
	ld c, a
.asm_7d0a3
	ld hl, wdb00
	ld b, $0
	add hl, bc
	push de
	push bc
	ld bc, $1
	call CopyData
	pop bc
	inc c
	pop de
	inc de
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $f
	jr nz, .asm_7d0a3
	ld hl, wd5d0
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu1], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu1Level], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu1FD], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu1Field0x0c], a
	inc hl
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu2Species], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu2Level], a
	cp $0
	jr z, .asm_7d120
	ld a, $1
	ld [wEnemyDenjuu2ArrivedStatus], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu2FD], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu2Field0x0c], a
	dec [hl]
	inc hl
	ld a, $20
	ld [wEnemyDenjuu2Field0x08], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu3], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu3Level], a
	cp $0
	jr z, .asm_7d120
	ld a, $1
	ld [wEnemyDenjuu3ArrivedStatus], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu3FD], a
	dec [hl]
	ld a, [hli]
	ld [wEnemyDenjuu3Field0x0c], a
	dec [hl]
	inc hl
	ld a, $20
	ld [wEnemyDenjuu3Field0x08], a
.asm_7d120
	ld a, [wdc45]
	add $f
	inc a
	ld [wdc45], a
	ld a, $9
	ld [wd401], a
	ret

Func_7d12f: ; 7d12f (1f:512f)
	ld a, $10
	ld [wcf96], a
	ld a, $4
	call Func_050a
	jp Func_7dc41

Func_7d13c: ; 7d13c (1f:513c)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $2
	ld [wd4e5], a
	ld a, $1
	ld [wd4e6], a
	ld a, $1
	ld [wd4e7], a
	ld a, [wd42e]
	ld [wPlayerPartySize], a
	ld hl, wPlayerDenjuu1Species
	call Func_7d24d
	ld a, [wPlayerDenjuu2Level]
	cp $0
	jr z, .asm_7d178
	ld hl, wPlayerDenjuu2Species
	call Func_7d24d
	ld a, [wPlayerDenjuu3Level]
	cp $0
	jr z, .asm_7d178
	ld hl, wPlayerDenjuu3Species
	call Func_7d24d
.asm_7d178
	ld hl, wEnemyDenjuu1Species
	call Func_7d24d
	ld a, [wEnemyDenjuu2Level]
	cp $0
	jr z, .asm_7d198
	ld hl, wEnemyDenjuu2Species
	call Func_7d24d
	ld a, [wEnemyDenjuu3Level]
	cp $0
	jr z, .asm_7d198
	ld hl, wEnemyDenjuu3Species
	call Func_7d24d
.asm_7d198
	ld a, $1
	ld [wd456], a
	xor a
	ld [wdc07], a
	xor a
	ld [wd42e], a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd4bd], a
	ld [wd4be], a
	ld [wd4bf], a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_7d96c
	xor a
	ld [wSubroutine], a
	ld [wBattleSubroutine], a
	ld [wd401], a
	ld a, $7
	ld [wGameRoutine], a
	ret

Func_7d1d3: ; 7d1d3 (1f:51d3)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_06bc
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld a, $3
	ld [wGameRoutine], a
	ret

Func_7d1ed: ; 7d1ed (1f:51ed)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wd456], a
	ld a, $0
	ld [wOAMAnimation01], a
	ld [wOAMAnimation05], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_7d96c
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d5f1
	ld [wd415], a
	call OpenSRAMBank2
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld hl, sAddressBook + $0
	call Func_3d0e
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	inc hl
	ld a, [hl]
	ld [wd499], a
	call CloseSRAM
	xor a
	ld [wMoveAnimationSubroutine], a
	ld a, $9
	ld [wGameRoutine], a
	ret

Func_7d23d: ; 7d23d (1f:523d)
	push hl
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	pop hl
	ret

Func_7d24d: ; 7d24d (1f:524d)
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	ld c, DENJUU_HP
	call Func_7d23d
	ld [hli], a
	ld [hli], a
	ld c, DENJUU_SPEED
	call Func_7d23d
	ld [wd491], a
	ld c, DENJUU_TYPE
	call Func_7d23d
	push hl
	ld hl, $5516 ; broken pointer?
	ld de, $7
	addntimes_hl_de
	ld d, $0
	ld a, [wCurBackground]
	ld e, a
	add hl, de
	ld a, [hl]
	cp $2
	jr z, .asm_7d289
	ld a, [wd491]
	jr .asm_7d292

.asm_7d289
	ld a, [wd491]
	ld b, a
	srl a
	add b
	jr .asm_7d292

.asm_7d292
	pop hl
	ld [hli], a
	inc hl
	ld c, DENJUU_BASE_YIELD
	call Func_7d23d
	inc hl
	inc hl
	inc hl
	ld [hli], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, DENJUU_ATTACK
	call Func_7d23d
	ld [hli], a
	ld c, DENJUU_DEFENSE
	call Func_7d23d
	ld [hli], a
	ld c, DENJUU_SPATK
	call Func_7d23d
	ld [hli], a
	ld c, DENJUU_SPDEF
	call Func_7d23d
	ld [hli], a
	inc hl
	ld c, DENJUU_SPEED
	call Func_7d23d
	ld [hli], a
	ld [hl], a
	ret

Func_7d2c3: ; 7d2c3 (1f:52c3)
	call OpenSRAMBank2
	ld a, [wd4b0]
	ld [wd5a5], a
	ld [wd5aa], a
	cp $1
	ret z
Func_7d2d2: ; 7d2d2 (1f:52d2)
	ld a, [wd5aa]
	ld b, a
	add a
	add b
	srl a
	srl a
	ld [wd5aa], a
	cp $0
	jr nz, .asm_7d2e8
	ld a, $1
	ld [wd5aa], a
.asm_7d2e8
	ld a, $0
	ld [wd5ab], a
	ld a, $0
	ld [wd5a3], a
Func_7d2f2: ; 7d2f2 (1f:52f2)
	ld a, [wd5aa]
	ld b, a
	ld a, [wd5a3]
	add b
	ld [wd5a4], a
	ld hl, wd200
	ld d, $0
	ld a, [wd5a3]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, wd200
	ld d, $0
	ld a, [wd5a4]
	ld e, a
	add hl, de
	ld a, c
	ld b, a
	ld a, [hl]
	cp b
	jr z, .asm_7d31d
	jr nc, .asm_7d394
	jr .asm_7d339

.asm_7d31d
	ld hl, wd100
	ld d, $0
	ld a, [wd5a4]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	ld hl, wd100
	ld d, $0
	ld a, [wd5a3]
	ld e, a
	add hl, de
	ld a, c
	ld b, a
	ld a, [hl]
	cp b
	jr nc, .asm_7d394
.asm_7d339
	ld a, [wd5a3]
	call Func_7d680
	ld a, [hl]
	ld [wd5a0], a
	push hl
	ld a, [wd5a4]
	call Func_7d680
	ld a, [hl]
	ld b, a
	ld a, [wd5a0]
	ld [hl], a
	pop hl
	ld a, b
	ld [hl], a
	ld hl, wd200
	ld d, $0
	ld a, [wd5a3]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	push hl
	ld hl, wd200
	ld d, $0
	ld a, [wd5a4]
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	ld a, c
	ld [hl], a
	pop hl
	ld a, b
	ld [hl], a
	ld hl, wd100
	ld d, $0
	ld a, [wd5a3]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	push hl
	ld hl, wd100
	ld d, $0
	ld a, [wd5a4]
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	ld a, c
	ld [hl], a
	pop hl
	ld a, b
	ld [hl], a
	ld a, $1
	ld [wd5ab], a
.asm_7d394
	ld a, [wd5a5]
	ld b, a
	ld a, [wd5a4]
	inc a
	cp b
	jr nc, .asm_7d3a9
	ld a, [wd5a3]
	inc a
	ld [wd5a3], a
	jp Func_7d2f2

.asm_7d3a9
	ld a, [wd5ab]
	cp $1
	jp z, Func_7d2d2
	ld a, [wd5aa]
	cp $2
	jp nc, Func_7d2d2
	ret

Func_7d3ba:
	call OpenSRAMBank2
	ld a, [wd4b0]
	ld [wd5a5], a
	ld [wd5aa], a
	cp $1
	ret z
Func_7d3c9: ; 7d3c9 (1f:53c9)
	ld a, [wd5aa]
	ld b, a
	add a
	add b
	srl a
	srl a
	ld [wd5aa], a
	cp $0
	jr nz, .asm_7d3df
	ld a, $1
	ld [wd5aa], a
.asm_7d3df
	ld a, $0
	ld [wd5ab], a
	ld a, $0
	ld [wd5a3], a
Func_7d3e9: ; 7d3e9 (1f:53e9)
	ld a, [wd5aa]
	ld b, a
	ld a, [wd5a3]
	add b
	ld [wd5a4], a
	ld a, [wd5a4]
	call Func_7d680
	ld a, [hl]
	ld hl, $a001
	call Func_3d0e
	ld a, [hl]
	ld b, a
	push bc
	ld a, [wd5a3]
	call Func_7d680
	ld a, [hl]
	ld hl, $a001
	call Func_3d0e
	ld a, [hl]
	pop bc
	cp b
	jr nc, .asm_7d453
	ld a, [wd5a3]
	call Func_7d680
	ld a, [hl]
	ld [wd5a0], a
	push hl
	ld a, [wd5a4]
	call Func_7d680
	ld a, [hl]
	ld b, a
	ld a, [wd5a0]
	ld [hl], a
	pop hl
	ld a, b
	ld [hl], a
	ld hl, wd200
	ld d, $0
	ld a, [wd5a3]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	push hl
	ld hl, wd200
	ld d, $0
	ld a, [wd5a4]
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	ld a, c
	ld [hl], a
	pop hl
	ld a, b
	ld [hl], a
	ld a, $1
	ld [wd5ab], a
.asm_7d453
	ld a, [wd5a5]
	ld b, a
	ld a, [wd5a4]
	inc a
	cp b
	jr nc, .asm_7d468
	ld a, [wd5a3]
	inc a
	ld [wd5a3], a
	jp Func_7d3e9

.asm_7d468
	ld a, [wd5ab]
	cp $1
	jp z, Func_7d3c9
	ld a, [wd5aa]
	cp $2
	jp nc, Func_7d3c9
	ret

Func_7d479
	ld a, $9
	ld [wd5a8], a
	ret

Func_7d47f:
	call Random
	cp $b
	jr c, .asm_7d4db
	cp $16
	jr c, .asm_7d4e1
	cp $21
	jr c, .asm_7d4e7
	cp $2c
	jr c, .asm_7d4ed
	cp $37
	jr c, .asm_7d4f3
	cp $42
	jr c, .asm_7d4f9
	cp $4d
	jr c, .asm_7d4ff
	cp $58
	jr c, .asm_7d505
	cp $63
	jr c, .asm_7d50b
	cp $6e
	jr c, .asm_7d511
	cp $79
	jr c, .asm_7d517
	cp $84
	jr c, .asm_7d51d
	cp $8f
	jr c, .asm_7d523
	cp $9a
	jr c, .asm_7d529
	cp $a5
	jr c, .asm_7d52f
	cp $b0
	jr c, .asm_7d535
	cp $bb
	jr c, .asm_7d53b
	cp $c6
	jr c, .asm_7d541
	cp $d1
	jr c, .asm_7d547
	cp $dc
	jr c, .asm_7d54d
	cp $e7
	jr c, .asm_7d553
	cp $f2
	jp c, .asm_7d559
.asm_7d4db
	ld a, $0
	ld [wd5a8], a
	ret

.asm_7d4e1
	ld a, $1
	ld [wd5a8], a
	ret

.asm_7d4e7
	ld a, $2
	ld [wd5a8], a
	ret

.asm_7d4ed
	ld a, $3
	ld [wd5a8], a
	ret

.asm_7d4f3
	ld a, $4
	ld [wd5a8], a
	ret

.asm_7d4f9
	ld a, $5
	ld [wd5a8], a
	ret

.asm_7d4ff
	ld a, $6
	ld [wd5a8], a
	ret

.asm_7d505
	ld a, $7
	ld [wd5a8], a
	ret

.asm_7d50b
	ld a, $8
	ld [wd5a8], a
	ret

.asm_7d511
	ld a, $9
	ld [wd5a8], a
	ret

.asm_7d517
	ld a, $a
	ld [wd5a8], a
	ret

.asm_7d51d
	ld a, $b
	ld [wd5a8], a
	ret

.asm_7d523
	ld a, $c
	ld [wd5a8], a
	ret

.asm_7d529
	ld a, $d
	ld [wd5a8], a
	ret

.asm_7d52f
	ld a, $e
	ld [wd5a8], a
	ret

.asm_7d535
	ld a, $f
	ld [wd5a8], a
	ret

.asm_7d53b
	ld a, $10
	ld [wd5a8], a
	ret

.asm_7d541
	ld a, $11
	ld [wd5a8], a
	ret

.asm_7d547
	ld a, $12
	ld [wd5a8], a
	ret

.asm_7d54d
	ld a, $13
	ld [wd5a8], a
	ret

.asm_7d553
	ld a, $14
	ld [wd5a8], a
	ret

.asm_7d559
	ld a, $15
	ld [wd5a8], a
	ret

Func_7d55f: ; 7d55f (1f:555f)
	ld a, $1
	ld [wd4a2], a
	ld [wd4a3], a
	ld [wd4a4], a
	ret

Func_7d56b: ; 7d56b (1f:556b)
	push hl
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, $5588
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	pop de
	ld bc, $200
	ld a, $37
	jp Copy2bpp

	ld e, a
	ld e, l
	ld e, a
	ld e, l
	ld e, a
	ld e, l
	ld e, a
	ld h, c
	ld e, a
	ld h, c
	ld e, a
	ld h, c
	ld e, a
	ld h, l
	ld e, a
	ld h, l
	ld e, a
	ld h, l
Func_7d59a: ; 7d59a (1f:559a)
	cp $1
	jr z, .asm_7d5ad
	cp $2
	jr z, .asm_7d5b5
	cp $3
	jr z, .asm_7d5bd
	cp $4
	jr z, .asm_7d5d9
	jp Func_7d5f0

.asm_7d5ad
	ld c, $32
	call Func_3abb
	jp Func_7d5f0

.asm_7d5b5
	ld c, $33
	call Func_3abb
	jp Func_7d5f0

.asm_7d5bd
	ld c, $33
	call Func_3abb
	ld a, $1f
	ld b, a
	ld a, l
	sub b
	ld l, a
	ld c, $34
	call Func_3abb
	ld de, $20
	add hl, de
	ld c, $35
	call Func_3abb
	jp Func_7d5f0

.asm_7d5d9
	ld c, $33
	call Func_3abb
	inc l
	ld c, $36
	call Func_3abb
	dec l
	ld a, $1f
	ld b, a
	ld a, l
	sub b
	ld l, a
	ld c, $37
	call Func_3abb
Func_7d5f0: ; 7d5f0 (1f:55f0)
	ret

Func_7d5f1: ; 7d5f1 (1f:55f1)
	ld a, [wd4a0]
	cp $0
	jr z, .asm_7d600
	ld b, a
	ld a, d
.asm_7d5fa
	add $3
	dec b
	jr nz, .asm_7d5fa
	ld d, a
.asm_7d600
	ld a, d
	ret

Func_7d602: ; 7d602 (1f:5602)
	ld a, [wd4a0]
	ld b, a
	ld a, [wd4a1]
	cp b
	jr z, .asm_7d610
	ld a, $3
	jr .asm_7d61c

.asm_7d610
	ld a, [wd4a1]
	ld b, a
	ld a, [wd4b0]
.asm_7d617
	sub $3
	dec b
	jr nz, .asm_7d617
.asm_7d61c
	ld [wd413], a
	ret

Func_7d620: ; 7d620 (1f:5620)
	xor a
	ld [wd4b0], a
	ld a, $fe
	ld b, a
	ld hl, wd000
.asm_7d62a
	push hl
	push bc
	call OpenSRAMBank2
	ld hl, $a001
	ld a, b
	call Func_3d0e
	ld a, [hl]
	ld [wCurDenjuuLevel], a
	pop bc
	pop hl
	ld a, [wCurDenjuuLevel]
	cp $0
	jr z, .asm_7d675
	ld a, $1
	ld [wd4ec], a
	push hl
	ld hl, wd200
	ld a, [wd4b0]
	cp $0
	jr z, .asm_7d657
.asm_7d653
	inc hl
	dec a
	jr nz, .asm_7d653
.asm_7d657
	ld a, [wd4ec]
	ld [hl], a
	pop hl
	push hl
	ld hl, wd100
	ld d, $0
	ld a, [wd4b0]
	ld e, a
	add hl, de
	ld a, [wCurDenjuuLevel]
	ld [hl], a
	pop hl
	ld a, b
	ld [hli], a
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.asm_7d675
	ld a, $0
	cp b
	jr z, .asm_7d67d
	dec b
	jr .asm_7d62a

.asm_7d67d
	jp Func_7d2c3

Func_7d680: ; 7d680 (1f:5680)
	ld hl, wd000
	ld d, $0
	ld e, a
	add hl, de
	ret

Func_7d688: ; 7d688 (1f:5688)
	ld hl, wd000
	call Func_7d5f1
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ret

Func_7d694: ; 7d694 (1f:5694)
	ld a, [wd413]
	cp $1
	jr c, .asm_7d6fd
	ld bc, $b04
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $f04
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $2
	jr c, .asm_7d6cc
	ld bc, $b07
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $f07
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_7d6d6

.asm_7d6cc
	ld bc, $b07
	ld e, $aa
	ld a, $0
	call LoadStdBGMapLayout_
.asm_7d6d6
	ld a, [wd413]
	cp $3
	jr c, .asm_7d6f3
	ld bc, $b0a
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $f0a
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_7d6fd

.asm_7d6f3
	ld bc, $b0a
	ld e, $aa
	ld a, $0
	call LoadStdBGMapLayout_
.asm_7d6fd
	ret

Func_7d6fe: ; 7d6fe (1f:56fe)
	ld a, [wd413]
	cp $1
	jp c, Func_7d795
	call OpenSRAMBank2
	ld d, $0
	call Func_7d688
	ld hl, $a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	ld hl, VTilesBG tile $40
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	ld bc, $b03
	ld e, $a7
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $2
	jr c, Func_7d795
	call OpenSRAMBank2
	ld d, $1
	call Func_7d688
	ld hl, $a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	ld hl, VTilesBG tile $48
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	ld bc, $b06
	ld e, $a8
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $3
	jr c, Func_7d795
	call OpenSRAMBank2
	ld d, $2
	call Func_7d688
	ld hl, $a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	ld hl, VTilesBG tile $50
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	ld bc, $b09
	ld e, $a9
	ld a, $0
	call LoadStdBGMapLayout_
Func_7d795: ; 7d795 (1f:5795)
	ret

Func_7d796: ; 7d796 (1f:5796)
	call OpenSRAMBank2
	ld a, [wd4a0]
	inc a
	hlbgcoord 14, 1
	ld c, $1
	call Func_1430
	ld a, [wd44e]
	cp $1
	jp z, Func_7d821
	ld a, [wd413]
	cp $1
	jp c, Func_7d820
	ld d, $0
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 4
	ld c, $1
	call Func_1430
	ld a, [wd4a2]
	hlbgcoord 17, 4
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $2
	jr c, Func_7d820
	ld d, $1
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 7
	ld c, $1
	call Func_1430
	ld a, [wd4a3]
	hlbgcoord 17, 7
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $3
	jr c, Func_7d820
	ld d, $2
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 10
	ld c, $1
	call Func_1430
	ld a, [wd4a4]
	hlbgcoord 17, 10
	ld c, $1
	call Func_1430
Func_7d820: ; 7d820 (1f:5820)
	ret

Func_7d821: ; 7d821 (1f:5821)
	ld a, [wd413]
	cp $1
	jp c, Func_7d8cd
	ld d, $0
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 4
	ld c, $1
	call Func_1430
	ld d, $0
	call Func_7d688
	ld hl, $a002
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 4
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $2
	jr c, Func_7d8cd
	ld d, $1
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 7
	ld c, $1
	call Func_1430
	ld d, $1
	call Func_7d688
	ld hl, $a002
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 7
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $3
	jr c, Func_7d8cd
	ld d, $2
	call Func_7d688
	ld hl, $a001
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 10
	ld c, $1
	call Func_1430
	ld d, $2
	call Func_7d688
	ld hl, $a002
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 10
	ld c, $1
	call Func_1430
Func_7d8cd: ; 7d8cd (1f:58cd)
	ret

Func_7d8ce: ; 7d8ce (1f:58ce)
	ld a, [wBattleMenuSelection]
	cp $0
	jr z, .asm_7d8db
	cp $1
	jr z, .asm_7d8e1
	jr .asm_7d8e7

.asm_7d8db
	ld a, $50
	ld b, $18
	jr .asm_7d8eb

.asm_7d8e1
	ld a, $50
	ld b, $30
	jr .asm_7d8eb

.asm_7d8e7
	ld a, $50
	ld b, $48
.asm_7d8eb
	ld [wSpriteInitXCoordBuffers], a
	ld a, b
	ld [wSpriteInitYCoordBuffers], a
	ld a, $20
	ld [wd4ee], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	call InitBattleMenuCursor
	ret

Func_7d905: ; 7d905 (1f:5905)
	ld a, $20
	ld [wd4ee], a
	ld a, $d4
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, $10
	ld [wSpriteInitYCoordBuffers + 1], a
	call InitBattleMenuCursor
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, $28
	ld [wSpriteInitYCoordBuffers + 2], a
	call InitBattleMenuCursor
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, $40
	ld [wSpriteInitYCoordBuffers + 3], a
	call InitBattleMenuCursor
	call Func_7d96c
	ret

Func_7d949: ; 7d949 (1f:5949)
	cp $0
	jr z, .asm_7d953
	cp $1
	jr z, .asm_7d95a
	jr .asm_7d961

.asm_7d953
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	jr .asm_7d966

.asm_7d95a
	ld a, $1
	ld [wOAMAnimation03_PriorityFlags], a
	jr .asm_7d966

.asm_7d961
	ld a, $1
	ld [wOAMAnimation04], a
.asm_7d966
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_7d96c: ; 7d96c (1f:596c)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_7d97c: ; 7d97c (1f:597c)
	ld a, [wd4ba]
	cp $0
	jr z, .asm_7d9bc
	ld a, [wd4bb]
	ld b, a
	ld a, [wd4a0]
	cp b
	jr nz, .asm_7d9bc
	ld a, [wd4bc]
	cp $0
	jr z, .asm_7d99a
	cp $1
	jr z, .asm_7d9a6
	jr .asm_7d9b2

.asm_7d99a
	ld a, $1
	ld [wd47c], a
	ld a, $0
	call Func_7d949
	jr .asm_7d9bc

.asm_7d9a6
	ld a, $1
	ld [wd47d], a
	ld a, $1
	call Func_7d949
	jr .asm_7d9bc

.asm_7d9b2
	ld a, $1
	ld [wd47e], a
	ld a, $2
	call Func_7d949
.asm_7d9bc
	ld a, [wd4bd]
	cp $0
	jr z, .asm_7d9fc
	ld a, [wd4be]
	ld b, a
	ld a, [wd4a0]
	cp b
	jr nz, .asm_7d9fc
	ld a, [wd4bf]
	cp $0
	jr z, .asm_7d9da
	cp $1
	jr z, .asm_7d9e6
	jr .asm_7d9f2

.asm_7d9da
	ld a, $1
	ld [wd47c], a
	ld a, $0
	call Func_7d949
	jr .asm_7d9fc

.asm_7d9e6
	ld a, $1
	ld [wd47d], a
	ld a, $1
	call Func_7d949
	jr .asm_7d9fc

.asm_7d9f2
	ld a, $1
	ld [wd47e], a
	ld a, $2
	call Func_7d949
.asm_7d9fc
	ret

Func_7d9fd: ; 7d9fd (1f:59fd)
	ld a, [wd42e]
	cp $1
	jr z, .asm_7da31
	cp $2
	jr z, .asm_7da5e
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld [wPlayerDenjuu1Field0x0d], a
	call OpenSRAMBank2
	ld hl, $a000
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld [wPlayerDenjuu1], a
	ld a, [hli]
	ld [wPlayerDenjuu1Level], a
	ld a, [hli]
	ld [wPlayerDenjuu1FD], a
	ld a, [hl]
	ld [wPlayerDenjuu1Field0x0c], a
	jp Func_7da89

.asm_7da31
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld [wPlayerDenjuu2Field0x0d], a
	call OpenSRAMBank2
	ld hl, $a000
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld [wPlayerDenjuu2], a
	ld a, [hli]
	ld [wPlayerDenjuu2Level], a
	ld a, [hli]
	ld [wPlayerDenjuu2FD], a
	ld a, [hl]
	ld [wPlayerDenjuu2Field0x0c], a
	ld a, $20
	ld [wPlayerDenjuu2Field0x08], a
	jr Func_7da89

.asm_7da5e
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_7d688
	ld [wPlayerDenjuu3Field0x0d], a
	call OpenSRAMBank2
	ld hl, $a000
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld [wPlayerDenjuu3], a
	ld a, [hli]
	ld [wPlayerDenjuu3Level], a
	ld a, [hli]
	ld [wPlayerDenjuu3FD], a
	ld a, [hl]
	ld [wPlayerDenjuu3Field0x0c], a
	ld a, $20
	ld [wPlayerDenjuu3Field0x08], a
Func_7da89: ; 7da89 (1f:5a89)
	call CloseSRAM
	ret

Func_7da8d: ; 7da8d (1f:5a8d)
	ld a, $d6
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, $8
	ld [wSpriteInitYCoordBuffers + 4], a
	call InitBattleMenuCursor
	ret

	ld a, $9a
	ld [wd437], a
	ld a, $4
	ld [wd436], a
	ld de, $6
	ld a, $2
	ld [wd438], a
	ld a, [wd40d]
	ld [wd439], a
	ld b, $38
	call Func_7dac3
	ret

Func_7dac3: ; 7dac3 (1f:5ac3)
	ld a, [wd437]
	ld h, a
	ld a, [wd436]
	ld l, a
.asm_7dacb
	ld a, [wd438]
	cp $0
	jr z, .asm_7dae1
	ld c, $0
	call Func_3abb
	ld a, [wd438]
	dec a
	ld [wd438], a
	add hl, de
	jr .asm_7dacb

.asm_7dae1
	ld a, [wd437]
	ld h, a
	ld a, [wd436]
	ld l, a
	ld a, [wd439]
.asm_7daec
	cp $0
	jr z, .asm_7daf4
	dec a
	add hl, de
	jr .asm_7daec

.asm_7daf4
	ld a, b
	ld c, a
	call Func_3abb
	ret

Func_7dafa: ; 7dafa (1f:5afa)
	ld a, $16
	ld b, a
.asm_7dafd
	xor a
	ld [hli], a
	dec b
	jr nz, .asm_7dafd
	ret

Func_7db03: ; 7db03 (1f:5b03)
	ld a, [wd401]
	cp $5
	jr z, .asm_7db20
	cp $6
	jr z, .asm_7db20
	cp $7
	jr z, .asm_7db20
	call Func_7c61b
	ld a, [wCGBPalFadeProgram]
	or a
	jr z, .asm_7db20
	ld a, $5
	ld [wd401], a
.asm_7db20
	ld a, [wd401]
	ld hl, Pointers_7db2a
	call GetWordFromTable
	jp [hl]

Pointers_7db2a: ; 7db2a (1f:5b2a)
	dw Func_7db70
	dw Func_7db91
	dw Func_7dbbe
	dw Func_7dbe1
	dw Func_7dc22
	dw Func_7db3a
	dw Func_7db42
	dw Func_7db59

Func_7db3a: ; 7db3a (1f:5b3a)
	ld c, $74
	call Func_3d02
	jp Func_7dc41

Func_7db42: ; 7db42 (1f:5b42)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	call InitSerialData
	call Func_06bc
	ld a, $1
	call Func_050a
	jp Func_7dc41

Func_7db59: ; 7db59 (1f:5b59)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld a, $3
	ld [wGameRoutine], a
	ret

Func_7db70: ; 7db70 (1f:5b70)
	ld a, $20
	ld [wd4ee], a
	ld bc, $1
	call DecompressGFXByIndex_
	ld bc, $14
	call DecompressGFXByIndex_
	ld a, [wd407]
	cp $0
	jr z, .asm_7db8b
	jp Func_7dc41

.asm_7db8b
	ld a, $3
	ld [wd401], a
	ret

Func_7db91: ; 7db91 (1f:5b91)
	ld a, $18
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $10
	call Func_3d02
	call Func_06bc
	ld a, $7f
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers], a
	ld a, $32
	ld [wSpriteInitYCoordBuffers], a
	ld hl, VTilesOB tile $00
	call InitBattleMenuCursor
	jp Func_7dc41

Func_7dbbe: ; 7dbbe (1f:5bbe)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, $4
	ld [wd401], a
	ret

Func_7dbe1: ; 7dbe1 (1f:5be1)
	ld a, $19
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $13
	call Func_3d02
	ld bc, $105
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $100
	ld e, $85
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $7e
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers], a
	ld a, $32
	ld [wSpriteInitYCoordBuffers], a
	ld hl, VTilesOB tile $00
	call InitBattleMenuCursor
	ld a, $2
	ld [wd401], a
	ret

Func_7dc22: ; 7dc22 (1f:5c22)
	call Func_06bc
	xor a
	ld [wd401], a
	ld a, $1
	ld [wSubroutine], a
	ld a, [wd407]
	cp $0
	jr z, .asm_7dc3b
	ld a, $3
	ld [wBattleSubroutine], a
	ret

.asm_7dc3b
	ld a, $4
	ld [wBattleSubroutine], a
	ret

Func_7dc41: ; 7dc41 (1f:5c41)
	ld hl, wd401
	inc [hl]
	ret

Func_7dc46: ; 7dc46 (1f:5c46)
	ld a, [wd401]
	cp $f
	jr z, .asm_7dc51
	cp $0
	jr nz, .asm_7dc5f
.asm_7dc51
	call Func_7c61b
	ld a, [wCGBPalFadeProgram]
	or a
	jr z, .asm_7dc5f
	ld a, $b
	ld [wd401], a
.asm_7dc5f
	ld a, [wd401]
	ld hl, Pointers_7dc69
	call GetWordFromTable
	jp [hl]

Pointers_7dc69: ; 7dc69 (1f:5c69)
	dw Func_7dcd4
	dw Func_7de6b
	dw Func_7de97
	dw Func_7dea3
	dw Func_7dee6
	dw Func_7df06
	dw Func_7dfa0
	dw Func_7dfd6
	dw Func_7dfe0
	dw Func_7de8c
	dw Func_7dee6
	dw Func_7dc98
	dw Func_7dca0
	dw Func_7dff3
	dw Func_7e08e
	dw Func_7dcdf
	dw Func_7ddb6
	dw Func_7dcb7
	dw Func_7dcc1

Data_7dc8f:
	dr $7dc8f, $7dc98

Func_7dc98:
	dr $7dc98, $7dca0

Func_7dca0:
	dr $7dca0, $7dcb7

Func_7dcb7:
	dr $7dcb7, $7dcc1

Func_7dcc1:
	dr $7dcc1, $7dcd4

Func_7dcd4:
	dr $7dcd4, $7dcdf

Func_7dcdf:
	dr $7dcdf, $7ddb6

Func_7ddb6:
	dr $7ddb6, $7de6b

Func_7de6b:
	dr $7de6b, $7de8c

Func_7de8c:
	dr $7de8c, $7de97

Func_7de97:
	dr $7de97, $7dea3

Func_7dea3:
	dr $7dea3, $7dee6

Func_7dee6:
	dr $7dee6, $7df06

Func_7df06:
	dr $7df06, $7dfa0

Func_7dfa0:
	dr $7dfa0, $7dfd6

Func_7dfd6:
	dr $7dfd6, $7dfe0

Func_7dfe0:
	dr $7dfe0, $7dff3

Func_7dff3:
	dr $7dff3, $7e08e

Func_7e08e:
	dr $7e08e, $7e0ec

Func_7e0ec:
	dr $7e0ec, $7e0f9

Func_7e0f9:
	dr $7e0f9, $7e11a

Func_7e11a:
	dr $7e11a, $7e358

Func_7e358:
	dr $7e358, $7f0c9

Func_7f0c9:
	dr $7f0c9, $7f432

Func_7f432:
	dr $7f432, $7f9d5
