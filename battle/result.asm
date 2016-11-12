BattleResult:
	ld a, [wSubroutine]
	jump_table
	dw Func_7400e
	dw Func_74011

Func_7400e: ; 7400e (1d:400e)
	jp Func_740ee

Func_74011: ; 74011 (1d:4011)
	xor a
	ld [MBC3SRamEnable], a
	ld a, $0
	ld [wc46c], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wWX], a
	ld a, $a5
	ld [wWX], a
	ld a, [wLCDC]
	res 5, a
	ld [wLCDC], a
	ld a, [wLCDC]
	res 6, a
	ld [wLCDC], a
	ld a, $0
	ld [wc46c], a
	ld a, [wPlayerDenjuu1CurHP]
	ld [wPartnerDenjuuHPRemaining], a
	ld a, $a
	ld [wSubroutine], a
	ld a, $5
	ld [wGameRoutine], a
	ret

Func_7404f: ; 7404f (1d:404f)
	ld bc, wCurDenjuuBuffer
	ld de, $16
	cp $0
	jr z, .asm_7405d
.asm_74059
	add hl, de
	dec a
	jr nz, .asm_74059
.asm_7405d
	ld d, $10
.asm_7405f
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .asm_7405f
	ret

Func_74066:
	ld [wd435], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_74079
	call Func_74099
	ret

Func_74079: ; 74079 (1d:4079)
	ld hl, wd420
	ld a, $8
	ld [wMoveAnimationTimer], a
.asm_74081
	ld a, [bc]
	cp $c0
	jr z, .asm_74092
	ld [hl], a
	inc hl
	inc bc
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	jr nz, .asm_74081
.asm_74092
	ld a, $e0
	ld [hl], a
	ld hl, wd420
	ret

Func_74099: ; 74099 (1d:4099)
	ld de, wd460
	ld b, $9
.asm_7409e
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_7409e
	ret

Func_740a5: ; 740a5 (1d:40a5)
	xor a
	ld [wd4c9], a
	push hl
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	jr nz, .asm_740cc
	ld b, $0
	dec hl
	ld a, [hl]
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wd4c9], a
	jr .asm_740ed

.asm_740cc
	push hl
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	jr nz, .asm_740ed
	ld b, $0
	dec hl
	ld a, [hl]
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wd4c9], a
.asm_740ed
	ret

Func_740ee: ; 740ee (1d:40ee)
	ld a, [wBattleSubroutine]
	jump_table
	dw Func_7410e
	dw Func_74111
	dw Func_74120
	dw Func_74142
	dw Func_74145
	dw Func_741e4
	dw Func_741e7
	dw Func_74216
	dw Func_74219
	dw Func_74220
	dw Func_74233

Func_7410e: ; 7410e (1d:410e)
	jp Func_74243

Func_74111: ; 74111 (1d:4111)
	ld a, [wd407]
	or a
	jr z, .asm_7411a
	jp NextBattleSubroutine

.asm_7411a
	ld a, $6
	ld [wBattleSubroutine], a
	ret

Func_74120: ; 74120 (1d:4120)
	xor a
	ld [wd401], a
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $b
	jr z, .asm_7413f
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $b
	jr z, .asm_7413f
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $b
	jr z, .asm_7413f
	ld a, $4
	ld [wBattleSubroutine], a
	ret

.asm_7413f
	jp NextBattleSubroutine

Func_74142: ; 74142 (1d:4142)
	jp Func_7548f

Func_74145: ; 74145 (1d:4145)
	xor a
	ld [wd401], a
	ld a, [wd403]
	cp $2
	jp z, Func_741de
	ld a, [wcd00]
	or a
	jp nz, Func_741de
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_74179
	cp $2
	jr z, .asm_7418e
	ld a, [wEnemyDenjuu1ArrivedStatus]
	cp $8
	jp z, Func_741de
	ld a, [wEnemyDenjuu1Species]
	ld b, a
	ld a, [wEnemyDenjuu1Level]
	ld c, a
	ld a, [wEnemyDenjuu1Field0x0c]
	ld d, a
	jr .asm_741a1

.asm_74179
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $8
	jr z, Func_741de
	ld a, [wEnemyDenjuu2]
	ld b, a
	ld a, [wEnemyDenjuu2Level]
	ld c, a
	ld a, [wEnemyDenjuu2Field0x0c]
	ld d, a
	jr .asm_741a1

.asm_7418e
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $8
	jr z, Func_741de
	ld a, [wEnemyDenjuu3Species]
	ld b, a
	ld a, [wEnemyDenjuu3Level]
	ld c, a
	ld a, [wEnemyDenjuu3Field0x0c]
	ld d, a
.asm_741a1
	ld a, b
	ld [wd480], a
	ld a, c
	ld [wd481], a
	ld a, $14
	ld [wd482], a
	ld a, d
	ld [wd483], a
	ld a, $0
	or a
	jp nz, NextBattleSubroutine
	ld a, [wd403]
	or a
	jp nz, NextBattleSubroutine
	ld a, [wd40c]
	cp $fe
	jr nc, Func_741de
	call Func_753f8
	or a
	jr z, .asm_741d6
	call Random
	cp $10
	jp c, NextBattleSubroutine
	jr Func_741de

.asm_741d6
	call Random
	cp $99
	jp c, NextBattleSubroutine
Func_741de: ; 741de (1d:41de)
	ld a, $8
	ld [wBattleSubroutine], a
	ret

Func_741e4: ; 741e4 (1d:41e4)
	jp Func_75040

Func_741e7: ; 741e7 (1d:41e7)
	xor a
	ld [wd401], a
	ld bc, EVENT_1F1
	call CheckEventFlag
	jr nz, .asm_74210
	ld a, [wcd00]
	or a
	jr nz, .asm_7420a
	ld a, [wd403]
	cp $1
	jr z, .asm_7420a
	ld a, [wd403]
	cp $2
	jr z, .asm_7420a
	jp NextBattleSubroutine

.asm_7420a
	ld a, $a
	ld [wBattleSubroutine], a
	ret

.asm_74210
	ld a, $8
	ld [wBattleSubroutine], a
	ret

Func_74216: ; 74216 (1d:4216)
	jp Func_757c3

Func_74219: ; 74219 (1d:4219)
	xor a
	ld [wBattleSubroutine], a
	jp IncrementSubroutine

Func_74220: ; 74220 (1d:4220)
	xor a
	ld [wd401], a
	ld a, [wd40c]
	or a
	jr z, .asm_74230
	ld a, $8
	ld [wBattleSubroutine], a
	ret

.asm_74230
	jp NextBattleSubroutine

Func_74233: ; 74233 (1d:4233)
	xor a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld [wSubroutine2], a
	ld a, $e
	ld [wGameRoutine], a
	ret

Func_74243: ; 74243 (1d:4243)
	ld a, [wd401]
	jump_table
	dw Func_74291
	dw Func_742c4
	dw Func_742f6
	dw Func_747d7
	dw Func_74827
	dw Func_74957
	dw Func_74f3d
Func_7425a: ; 7425a (1d:425a)
	dw Func_74f80
	dw Func_74fc2
	dw Func_74fd4
	dw Func_74fe8
	dw Func_7449f
	dw Func_74b86
	dw Func_7497d
	dw Func_74942
	dw Func_74bdc
	dw Func_74c2b
	dw Func_747e6
	dw Func_74813
	dw Func_74d96
	dw Func_74e64
	dw Func_74e89
	dw Func_74f27
	dw Func_74c3a

String_7427d:
	db "すばやさ"
String_74281:
	db "こうげき"
String_74285:
	db "ぼうぎょ"
String_74289:
	db "でんこう"
String_7428d:
	db "でんぼう"

Func_74291: ; 74291 (1d:4291)
	ld a, $20
	ld [wd4ee], a
	ld bc, $1
	call DecompressGFXByIndex_
	ld bc, $14
	call DecompressGFXByIndex_
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, [wd407]
	cp $0
	jr z, .asm_742be
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.asm_742be
	ld a, $6
	ld [wd401], a
	ret

Func_742c4: ; 742c4 (1d:42c4)
	ld a, $18
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $10
	call Func_3d02
	call Func_74ff2
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
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_742f6: ; 742f6 (1d:42f6)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd4e6]
	ld [wd40a], a
	xor a
	ld [wd5ac], a
	ld [wd5ad], a
	ld [wd5ae], a
	ld a, [wd403]
	cp $0
	jr z, .asm_74329
	cp $1
	jr z, .asm_74338
	cp $2
	jp z, Func_74392
.asm_74329
	ld h, $0
	ld a, [wEnemyDenjuu1Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	jp Func_743b2

.asm_74338
	ld a, [wEnemyDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wEnemyDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	sra b
	rr c
	sra b
	rr c
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	push bc
	pop hl
	ld h, $0
	ld a, [wEnemyDenjuu2Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [wd4a6]
	ld d, a
	ld a, [wd4a5]
	ld e, a
	add hl, de
	ld a, h
	ld [wd4a6], a
	ld a, l
	ld [wd4a5], a
	ld h, $0
	ld a, [wEnemyDenjuu3Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [wd4a6]
	ld d, a
	ld a, [wd4a5]
	ld e, a
	add hl, de
	jr Func_743b2

Func_74392: ; 74392 (1d:4392)
	ld a, [wEnemyDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wEnemyDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	sra b
	rr c
	sra b
	rr c
	ld a, b
	ld h, a
	ld a, c
	ld l, a
Func_743b2: ; 743b2 (1d:43b2)
	ld a, [wd4e6]
	ld d, $0
	ld e, a
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	call Func_0628
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $3
	jr z, .asm_743d2
	cp $5
	jr nz, .asm_7440d
.asm_743d2
	ld a, [wPlayerDenjuu1Level]
	ld b, a
	ld a, [wEnemyDenjuu1Level]
	cp b
	jr c, .asm_743eb
	sub b
	ld h, $0
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	add hl, bc
	jr .asm_743f3

.asm_743eb
	ld a, [wd4a6]
	ld h, a
	ld a, [wd4a5]
	ld l, a
.asm_743f3
	ld a, h
	cp $0
	jr nz, .asm_74400
	ld a, l
	cp $2
	jr nc, .asm_74400
	ld a, $2
	ld l, a
.asm_74400
	ld a, h
	ld [wd5b1], a
	ld a, l
	ld [wd5b0], a
	ld a, $9
	ld [wPlayerDenjuu1ArrivedStatus], a
.asm_7440d
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $3
	jr z, .asm_74418
	cp $5
	jr nz, .asm_74453
.asm_74418
	ld a, [wPlayerDenjuu2Level]
	ld b, a
	ld a, [wEnemyDenjuu2Level]
	cp b
	jr c, .asm_74431
	sub b
	ld h, $0
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	add hl, bc
	jr .asm_74439

.asm_74431
	ld a, [wd4a6]
	ld h, a
	ld a, [wd4a5]
	ld l, a
.asm_74439
	ld a, h
	cp $0
	jr nz, .asm_74446
	ld a, l
	cp $2
	jr nc, .asm_74446
	ld a, $2
	ld l, a
.asm_74446
	ld a, h
	ld [wd5b3], a
	ld a, l
	ld [wd5b2], a
	ld a, $9
	ld [wPlayerDenjuu2ArrivedStatus], a
.asm_74453
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $3
	jr z, .asm_7445e
	cp $5
	jr nz, .asm_74499
.asm_7445e
	ld a, [wPlayerDenjuu3Level]
	ld b, a
	ld a, [wEnemyDenjuu3Level]
	cp b
	jr c, .asm_74477
	sub b
	ld h, $0
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	add hl, bc
	jr .asm_7447f

.asm_74477
	ld a, [wd4a6]
	ld h, a
	ld a, [wd4a5]
	ld l, a
.asm_7447f
	ld a, h
	cp $0
	jr nz, .asm_7448c
	ld a, l
	cp $2
	jr nc, .asm_7448c
	ld a, $2
	ld l, a
.asm_7448c
	ld a, h
	ld [wd5b5], a
	ld a, l
	ld [wd5b4], a
	ld a, $9
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_74499
	ld a, $b
	ld [wd401], a
	ret

Func_7449f: ; 7449f (1d:449f)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $9
	jp nz, Func_74598
	ld a, $0
	ld [wd40a], a
	ld a, [wd40a]
	ld hl, wPlayerDenjuu1
	call Func_7404f
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, sAddressBook + $6
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	call Func_3d7f
	ld a, [wPlayerDenjuu1Level]
	cp $63
	jp z, Func_74595
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [hl]
	cp $64
	jr nc, .asm_744e7
	inc a
	ld [hl], a
.asm_744e7
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wd5c8], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wd5c9], a
	push de
	pop hl
	ld a, [wd5b1]
	ld b, a
	ld a, [wd5b0]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	srl h
	rr l
	ld a, [wd5c9]
	ld b, a
	ld a, [wd5c8]
	ld c, a
	srl b
	rr c
	call Func_75007
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, Func_74595
	ld a, $1
	ld [wd5ac], a
	ld a, $a
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
Func_74595: ; 74595 (1d:4595)
	jp Func_74792

Func_74598: ; 74598 (1d:4598)
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $9
	jp nz, Func_74691
	ld a, $1
	ld [wd40a], a
	ld a, [wd40a]
	ld hl, wPlayerDenjuu1Species
	call Func_7404f
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, sAddressBook + $6
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	call Func_3d7f
	ld a, [wPlayerDenjuu2Level]
	cp $63
	jp z, Func_7468e
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	ld a, [hl]
	cp $64
	jr nc, .asm_745e0
	inc a
	ld [hl], a
.asm_745e0
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wd5c8], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wd5c9], a
	push de
	pop hl
	ld a, [wd5b3]
	ld b, a
	ld a, [wd5b2]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	srl h
	rr l
	ld a, [wd5c9]
	ld b, a
	ld a, [wd5c8]
	ld c, a
	srl b
	rr c
	call Func_75007
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, Func_7468e
	ld a, $1
	ld [wd5ad], a
	ld a, $a
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
Func_7468e: ; 7468e (1d:468e)
	jp Func_74792

Func_74691: ; 74691 (1d:4691)
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $9
	jp nz, Func_74789
	ld a, $2
	ld [wd40a], a
	ld a, [wd40a]
	ld hl, wPlayerDenjuu1
	call Func_7404f
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, sAddressBook + $6
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call OpenSRAMBank2
	call Func_3d7f
	ld a, [wPlayerDenjuu3Level]
	cp 99
	jp z, Func_74787
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	ld a, [hl]
	cp 100
	jr nc, .asm_746d9
	inc a
	ld [hl], a
.asm_746d9
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wd5c8], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wd5c9], a
	push de
	pop hl
	ld a, [wd5b5]
	ld b, a
	ld a, [wd5b4]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	srl h
	rr l
	ld a, [wd5c9]
	ld b, a
	ld a, [wd5c8]
	ld c, a
	srl b
	rr c
	call Func_75007
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, Func_74787
	ld a, $1
	ld [wd5ae], a
	ld a, $a
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
Func_74787: ; 74787 (1d:4787)
	jr Func_74792

Func_74789: ; 74789 (1d:4789)
	call CloseSRAM
	ld a, $11
	ld [wd401], a
	ret

Func_74792: ; 74792 (1d:4792)
	ld a, [wd40a]
	cp $0
	jr z, .asm_7479f
	cp $1
	jr z, .asm_747ad
	jr .asm_747bb

.asm_7479f
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $9
	jr nz, .asm_747c9
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_747c9

.asm_747ad
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $9
	jr nz, .asm_747c9
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_747c9

.asm_747bb
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $9
	jr nz, .asm_747c9
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	jr .asm_747c9

.asm_747c9
	call CloseSRAM
	ld c, $17
	call Func_3d02
	ld a, $3
	ld [wd401], a
	ret

Func_747d7: ; 747d7 (1d:47d7)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $b
	ld [wd401], a
	ret

Func_747e6: ; 747e6 (1d:47e6)
	ld b, $0
	ld a, [wEnemyDenjuu1Level]
	ld c, a
	ld d, $0
	ld e, $8
	call Multiply_DE_by_BC
	push de
	ld a, d
	ld h, a
	ld a, e
	ld l, a
	call PrintNumHL
	ld c, $68
	call Func_3d02
	pop de
	ld a, d
	ld b, a
	ld a, e
	ld c, a
	call AddOrSubtractMoney_
	ld a, $6
	ld [H_SFX_ID], a
	ld a, $12
	ld [wd401], a
	ret

Func_74813: ; 74813 (1d:4813)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	call Func_75456
	ld a, $4
	ld [wd401], a
	ret

Func_74827: ; 74827 (1d:4827)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $a
	jr nz, .asm_74860
	ld a, [wPlayerDenjuu1Level]
	inc a
	ld [wPlayerDenjuu1Level], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [wPlayerDenjuu1Level]
	ld [hl], a
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_74859
	ld [hl], a
	ld [wPlayerDenjuu1FD], a
.asm_74859
	ld a, $0
	ld [wd40a], a
	jr .asm_748df

.asm_74860
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $a
	jr nz, .asm_74899
	ld a, [wPlayerDenjuu2Level]
	inc a
	ld [wPlayerDenjuu2Level], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2Field0x0d]
	ld hl, sAddressBook + $1
	call Func_3d0e
	ld a, [wPlayerDenjuu2Level]
	ld [hl], a
	ld a, [wPlayerDenjuu2Field0x0d]
	ld hl, sAddressBook + $2
	call Func_3d0e
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_74892
	ld [hl], a
	ld [wPlayerDenjuu2FD], a
.asm_74892
	ld a, $1
	ld [wd40a], a
	jr .asm_748df

.asm_74899
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $a
	jr nz, .asm_748d2
	ld a, [wPlayerDenjuu3Level]
	inc a
	ld [wPlayerDenjuu3Level], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu3Field0x0d]
	ld hl, sAddressBook + $1
	call Func_3d0e
	ld a, [wPlayerDenjuu3Level]
	ld [hl], a
	ld a, [wPlayerDenjuu3Field0x0d]
	ld hl, sAddressBook + $2
	call Func_3d0e
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_748cb
	ld [hl], a
	ld [wPlayerDenjuu3FD], a
.asm_748cb
	ld a, $2
	ld [wd40a], a
	jr .asm_748df

.asm_748d2
	xor a
	ld [wd40a], a
	call CloseSRAM
	ld a, $13
	ld [wd401], a
	ret

.asm_748df
	ld a, [wd40a]
	ld hl, wPlayerDenjuu1Species
	call Func_7404f
	lb bc, 1, 5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wCurDenjuuBufferSpecies]
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	ld a, $1
	ld [wBGPalUpdate], a
	lb bc, 0, 0
	ld e, $9e
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $90
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $8
	ld hl, VTilesBG tile $20
	call ClearString
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, VTilesBG tile $20
	call Func_3e19
	ld c, $18
	call Func_3d02
	ld a, $1a
	call GetMusicBank
	ld [H_MusicID], a
	call CloseSRAM
	ld a, $e
	ld [wd401], a
	ret

Func_74942: ; 74942 (1d:4942)
	lb bc, 1, 5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $14
	ld [H_SFX_ID], a
	ld a, $5
	ld [wd401], a
	ret

Func_74957: ; 74957 (1d:4957)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $7
	ld bc, $b
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $28
	call Func_3eb9
	ld a, $38
	call Func_3eb9
	ld a, $d
	ld [wd401], a
	ret

Func_7497d: ; 7497d (1d:497d)
	ld de, String_7427d
	ld hl, VTilesBG tile $40
	ld b, $4
	call PlaceString_
	ld de, String_74281
	ld hl, VTilesBG tile $44
	ld b, $4
	call PlaceString_
	ld de, String_74285
	ld hl, VTilesBG tile $48
	ld b, $4
	call PlaceString_
	ld de, String_74289
	ld hl, VTilesBG tile $4c
	ld b, $4
	call PlaceString_
	ld de, String_7428d
	ld hl, VTilesBG tile $50
	ld b, $4
	call PlaceString_
	lb bc, 10, 0
	ld e, $9d
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 10, 0
	ld e, $8f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wd40a]
	ld hl, wPlayerDenjuu1
	call Func_7404f
	ld a, [wCurDenjuuBufferLevel]
	hlbgcoord 16, 2
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 4
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74a22
	push af
	lb bc, 15, 5
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 5
	ld c, $1
	call Func_1499
.asm_74a22
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 7
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74a68
	push af
	lb bc, 15, 8
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 8
	ld c, $1
	call Func_1499
.asm_74a68
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 9
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74aae
	push af
	lb bc, $f, $a
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 10
	ld c, $1
	call Func_1499
.asm_74aae
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 11
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74af4
	push af
	lb bc, $f, $c
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 12
	ld c, $1
	call Func_1499
.asm_74af4
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 13
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74b3a
	push af
	lb bc, $f, $e
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 14
	ld c, $1
	call Func_1499
.asm_74b3a
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 15
	ld c, $0
	call Func_1430
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74b80
	push af
	lb bc, $f, $10
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 16
	ld c, $1
	call Func_1499
.asm_74b80
	ld a, $c
	ld [wd401], a
	ret

Func_74b86: ; 74b86 (1d:4b86)
	ld a, [wVBlankCounter]
	and $7
	jr nz, .asm_74b93
	ld hl, VTilesBG tile $10
	call Func_1796
.asm_74b93
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wd40a]
	cp $0
	jr z, .asm_74ba5
	cp $1
	jr z, .asm_74bac
	jr .asm_74bb3

.asm_74ba5
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_74bb8

.asm_74bac
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_74bb8

.asm_74bb3
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_74bb8
	lb bc, 10, 0
	ld e, $9f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 10, 0
	ld e, $91
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, $c
	ld e, $80
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $f
	ld [wd401], a
	ret

Func_74bdc: ; 74bdc (1d:4bdc)
	ld a, [wd40a]
	cp $0
	jr z, .asm_74be9
	cp $1
	jr z, .asm_74bf1
	jr .asm_74bf9

.asm_74be9
	ld hl, wPlayerDenjuu1Level
	call Func_740a5
	jr .asm_74bff

.asm_74bf1
	ld hl, wPlayerDenjuu2Level
	call Func_740a5
	jr .asm_74bff

.asm_74bf9
	ld hl, wPlayerDenjuu3Level
	call Func_740a5
.asm_74bff
	ld a, [wd4c9]
	cp $0
	jr z, .asm_74c25
	ld [wd435], a
	ld hl, MoveNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_74079
	call Func_74099
	ld c, $34
	call Func_3d02
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.asm_74c25
	ld a, $17
	ld [wd401], a
	ret

Func_74c2b: ; 74c2b (1d:4c2b)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $17
	ld [wd401], a
	ret

Func_74c3a: ; 74c3a (1d:4c3a)
	ld a, [wd40a]
	cp $0
	jr z, .asm_74c48
	cp $1
	jr z, .asm_74cb7
	jp Func_74d23

.asm_74c48
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wPlayerDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, .asm_74cb4
	ld a, $a
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.asm_74cb4
	jp Func_74d8d

.asm_74cb7
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wPlayerDenjuu2]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu2Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, .asm_74d21
	ld a, $a
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.asm_74d21
	jr Func_74d8d

Func_74d23: ; 74d23 (1d:4d23)
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wd4af], a
	ld a, c
	ld [wd4ae], a
	push bc
	ld a, [wPlayerDenjuu3Species]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu3Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	ld a, b
	ld [wd4a6], a
	ld a, c
	ld [wd4a5], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Func_0628
	ld a, c
	cp $0
	jr z, Func_74d8d
	ld a, $a
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wd4af]
	ld h, a
	ld a, [wd4ae]
	ld l, a
	ld a, [wd4a6]
	ld b, a
	ld a, [wd4a5]
	ld c, a
	call Func_75007
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
Func_74d8d: ; 74d8d (1d:4d8d)
	call CloseSRAM
	ld a, $4
	ld [wd401], a
	ret

Func_74d96: ; 74d96 (1d:4d96)
	call OpenSRAMBank2
	ld a, [wd40a]
	cp $0
	jr z, .asm_74dab
	cp $1
	jr z, .asm_74dd5
	cp $2
	jr z, .asm_74e01
	jp Func_74e4c

.asm_74dab
	ld a, [wd5ac]
	cp $0
	jp z, Func_74e4c
	ld a, [wPlayerDenjuu1]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jp z, Func_74e4c
	ld a, [wPlayerDenjuu1Level]
	cp b
	jp c, Func_74e4c
	ld a, $b
	ld [wPlayerDenjuu1ArrivedStatus], a
	ld a, [wPlayerDenjuu1Field0x0d]
	jr .asm_74e2b

.asm_74dd5
	ld a, [wd5ad]
	cp $0
	jr z, Func_74e4c
	ld a, [wPlayerDenjuu2]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jr z, Func_74e4c
	ld a, [wPlayerDenjuu2Level]
	cp b
	jr c, Func_74e4c
	ld a, $b
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld a, $1
	ld [wd40a], a
	ld a, [wPlayerDenjuu2Field0x0d]
	jr .asm_74e2b

.asm_74e01
	ld a, [wd5ae]
	cp $0
	jr z, Func_74e4c
	ld a, [wPlayerDenjuu3Species]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jr z, Func_74e4c
	ld a, [wPlayerDenjuu3Level]
	cp b
	jr c, Func_74e4c
	ld a, $b
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $2
	ld [wd40a], a
	ld a, [wPlayerDenjuu3Field0x0d]
.asm_74e2b
	call OpenSRAMBank2
	ld hl, sAddressBook + $6
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	call Func_3d7f
	call CloseSRAM
	ld c, $8c
	call Func_3d02
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74e4c: ; 74e4c (1d:4e4c)
	ld a, [wd40a]
	cp $2
	jr nc, .asm_74e5b
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ret

.asm_74e5b
	call CloseSRAM
	ld a, $8
	ld [wd401], a
	ret

Func_74e64: ; 74e64 (1d:4e64)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld c, $8d
	call Func_3d02
	xor a
	ld [wd40d], a
	call Func_7546d
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74e89: ; 74e89 (1d:4e89)
	call Func_3cd0
	call PrintText_
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_74ea3
	ld a, [wd40d]
	cp $0
	jr z, .asm_74ea3
	ld a, $0
	ld [wd40d], a
	jr .asm_74eb5

.asm_74ea3
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_74ebd
	ld a, [wd40d]
	cp $1
	jr z, .asm_74ebd
	ld a, $1
	ld [wd40d], a
.asm_74eb5
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_7546d

.asm_74ebd
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_74eca
	ld a, $3
	ld [H_SFX_ID], a
	jr .asm_74edb

.asm_74eca
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $0
	jr z, .asm_74f11
.asm_74edb
	ld a, [wd40a]
	cp $0
	jr z, .asm_74ee8
	cp $1
	jr z, .asm_74eef
	jr .asm_74ef6

.asm_74ee8
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_74efb

.asm_74eef
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_74efb

.asm_74ef6
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_74efb
	ld c, $8e
	call Func_3d02
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.asm_74f11
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ld a, $13
	ld [wd401], a
	ret

Func_74f27: ; 74f27 (1d:4f27)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ld a, $13
	ld [wd401], a
	ret

Func_74f3d: ; 74f3d (1d:4f3d)
	ld a, $19
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $13
	call Func_3d02
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
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
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74f80: ; 74f80 (1d:4f80)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoney + 1]
	ld b, a
	ld a, [wMoney]
	ld c, a
	srl b
	rr c
	ld a, b
	ld [wMoney + 1], a
	ld a, c
	ld [wMoney], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1Field0x0d]
	call Func_3d0e
	ld a, [hl]
	srl a
	ld [hl], a
	call CloseSRAM
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74fc2: ; 74fc2 (1d:4fc2)
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74fd4: ; 74fd4 (1d:4fd4)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wc46c], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_74fe8: ; 74fe8 (1d:4fe8)
	xor a
	ld [wd401], a
	call Func_74ff2
	jp NextBattleSubroutine

Func_74ff2::
	dr $74ff2, $75007

Func_75007:
	dr $75007, $75040

Func_75040:
	dr $75040, $753f8

Func_753f8::
	dr $753f8, $75456

Func_75456:
	dr $75456, $7546d

Func_7546d:
	dr $7546d, $7548f

Func_7548f:
	dr $7548f, $757c3

Func_757c3:
	dr $757c3, $758f8

Func_758f8::
	dr $758f8, $7598a
