Func_30000:
	call Func_307a4
	call Func_30784
	jp Func_30009

Func_30009: ; 30009 (c:4009)
	ld hl, wPartnerDenjuuObjectStruct
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3007c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	ld a, [wSubroutine]
	cp $4
	jr nz, .asm_3007a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $8
	jr z, .asm_3007a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $83
	jr c, .asm_3005e
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	ret

.asm_3005e
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $3
	ld [hl], a
	push hl
	ld bc, EVENT_1C3
	call CheckEventFlag
	pop hl
	jr z, .asm_3007a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
.asm_3007a
	ret

._hl_: ; 3007b (c:407b)
	jp hl

Pointers_3007c:
	dw Func_30090
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_305e4
	dw Func_30528
	dw Func_30575
	dw Func_3059f

Func_30090:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $14
	ld [hl], a
	ld a, [wCurPlayerFacing]
	ld [wRequestedPartnerDenjuuSprite], a
	cp $9
	jr c, .asm_300cf
	xor a
	ld [wRequestedPartnerDenjuuSprite], a
.asm_300cf
	ld de, Data_301bf
.asm_300d1
	cp $0
	jr z, .asm_300d9
	ld de, Data_301c1
.asm_300d9
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [wPlayerObjectStruct_XCoord]
	add b
	ld [hli], a
	ld a, [de]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	add b
	ld [hli], a
	ld a, [wPhoneCallSubroutine]
	cp $2
	jr nz, .asm_300fe
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $80
	ld [hl], a
.asm_300fe
	call Func_302a8
	ld a, [wPhoneCallSubroutine]
	cp $8
	jp nz, ForceReloadPartnerDenjuuSprite
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wc98c]
	cpl
	inc a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wc98d]
	cpl
	inc a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wc98c]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wc928]
	ld [hl], a
	ld a, [wc929]
	sub $a
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, b
	ld [hl], a
	ld a, b
	call Func_33846
	ld a, [wcdb9]
	ld b, a
	ld a, [wc912]
	ld [wcdb9], a
	ld a, b
	ld [wc912], a
	ld [wd409], a
	ld a, BANK(Func_30090)
	ld [wPrevROMBank], a
	call GetDenjuuSprite_
	ld a, [wd409]
	ld [wc9db], a
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $a8
	ld [wPlayerObjectStruct_Duration + 11], a
	call ForceReloadPartnerDenjuuSprite
	jp Func_30741

Data_301bf:
	db -2, -10

Data_301c1:
	db  2,  10

Func_301c3:
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	ld a, [wPlayerObjectStruct_Duration + 12]
	cp $3
	jr z, .asm_30207
	cp $2
	jr z, .asm_3021d
	cp $0
	jr z, .asm_301f1
	ld a, $3
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wPartnerDenjuuObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_YCoord]
	add $ed
	ld a, a
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	jr .asm_30231

.asm_301f1
	ld a, $0
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wPartnerDenjuuObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_YCoord]
	add $13
	ld a, a
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	jr .asm_30231

.asm_30207
	ld a, $6
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	ld a, [wPlayerObjectStruct_XCoord]
	add $13
	ld a, a
	ld [wPartnerDenjuuObjectStruct_XCoord], a
	jr .asm_30231

.asm_3021d
	ld a, $6
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	ld a, [wPlayerObjectStruct_XCoord]
	add $ed
	ld a, a
	ld [wPartnerDenjuuObjectStruct_XCoord], a
.asm_30231
	ld a, [wPlayerObjectStruct_TemplateIdx]
	add $2
	xor $1
	ld [wPartnerDenjuuObjectStruct_TemplateIdx], a
	call Func_302a8
	jr ForceReloadPartnerDenjuuSprite

ForceReloadPartnerDenjuuSprite: ; 30240 (c:4240)
	ld hl, wPartnerDenjuuObjectStruct
	ld a, $ff
	ld [wLoadedPartnerDenjuuSprite], a
	call RequestPartnerDenjuuSprite
	call LoadPartnerDenjuuSprite
	ret

RequestPartnerDenjuuSprite: ; 3024f (c:424f)
	ld a, [wLoadedPartnerDenjuuSprite]
	ld b, a
	ld a, [wRequestedPartnerDenjuuSprite]
	cp b
	jr z, .nope
	ld [wLoadedPartnerDenjuuSprite], a
	push af
	ld a, [wc9db]
	ld c, $0
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
.got_sprite_bank
	ld b, a
	ld a, SPRITES_01
	add c
	ld [wPartnerDenjuuSpriteBank], a
	ld a, b
	ld d, $0
	ld e, a
	ld bc, $24 tiles
	call Multiply_DE_by_BC
	ld hl, OverworldSprite001
	add hl, de
	pop af
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld a, l
	ld [wPartnerDenjuuSpriteAddr], a
	ld a, h
	ld [wPartnerDenjuuSpriteAddr + 1], a
	ret

.nope
	ld a, $0
	ld [wPartnerDenjuuSpriteAddr + 1], a
	ret

Func_302a8: ; 302a8 (c:42a8)
	ld hl, wPartnerDenjuuObjectStruct
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wc947]
	or a
	jr z, .asm_302c3
	ld a, [wc948]
	ld [hl], a
.asm_302c3
	ld a, [hl]
	cp $e0
	jr c, .asm_302c9
	xor a
.asm_302c9
	ld c, a
	ld a, [wPlayerObjectStruct_XCoord]
	ld e, a
	ld hl, wPartnerDenjuuXCoordBuffer
	call Func_30326
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wc947]
	or a
	jr z, .asm_302e8
	ld a, [wc949]
	ld [hl], a
.asm_302e8
	ld a, [hl]
	cp $e0
	jr c, .asm_302ee
	xor a
.asm_302ee
	ld c, a
	ld a, [wPlayerObjectStruct_YCoord]
	ld e, a
	ld hl, wPartnerDenjuuYCoordBuffer
	call Func_30326
	ld a, [wc947]
	or a
	jr z, .asm_30315
	ld a, [wc94a]
	and $7f
	ld [wRequestedPartnerDenjuuSprite], a
	ld b, $2
	ld a, [wc94a]
	and $80
	jr z, .asm_30311
	inc b
.asm_30311
	ld a, b
	ld [wPartnerDenjuuObjectStruct_TemplateIdx], a
.asm_30315
	ld hl, wc9b0
	ld a, $0
	call Func_2f76
	ld hl, wPartnerDenjuuObjectStruct
	ld a, $0
	ld [wc947], a
	ret

Func_30326: ; 30326 (c:4326)
	ld b, $0
.asm_30328
	push bc
	push de
	push hl
	call Func_3006
	ld a, l
	pop hl
	ld [hli], a
	pop de
	pop bc
	inc b
	ld a, b
	cp $10
	jr nz, .asm_30328
	ret

Func_3033a: ; 3033a (c:433a)
	ld a, [wMapGroup]
	cp $b
	jr nz, .asm_30349
	ld a, [wMapNumber]
	cp $10
	jr nc, .asm_30349
	ret

.asm_30349
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jp nz, Func_303e8
	ld a, [wc919]
	or a
	jp z, Func_303e8
	ld a, [wTakingAStep]
	or a
	jp z, Func_303e8
	ld hl, wPartnerDenjuuXCoordBuffer
	ld a, [hl]
	push af
	ld de, wPartnerDenjuuXCoordBuffer + 1
	ld b, $f
.asm_3036c
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_3036c
	ld a, [wPlayerObjectStruct_XCoord]
	ld [hl], a
	ld hl, wPartnerDenjuuYCoordBuffer
	ld a, [hl]
	push af
	ld de, wPartnerDenjuuYCoordBuffer + 1
	ld b, $f
.asm_30380
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_30380
	ld a, [wPlayerObjectStruct_YCoord]
	ld [hl], a
	ld hl, wc9b0
	ld de, wc9b1
	ld a, [hl]
	push af
	ld b, $f
.asm_30394
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_30394
	ld a, [hJoyLast]
	ld b, a
	ld a, [wPlayerIsRunning]
	or a
	jr nz, .asm_303a7
	ld a, b
	and $fd
	ld b, a
.asm_303a7
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld b, [hl]
	pop af
	ld c, a
	ld [hl], a
	ld b, a
	and $f0
	cp $10
	jr z, asm_3041c
	cp $20
	jr z, asm_30421
	cp $40
	jr z, asm_30426
	cp $80
	jr z, asm_3042b
	cp $50
	jr z, asm_30430
	cp $60
	jr z, asm_30435
	cp $90
	jr z, asm_3043a
	cp $a0
	jr z, asm_3043f
Func_303d9: ; 303d9 (c:43d9)
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop af
	ld c, a
	pop af
	ld [hli], a
	ld [hl], c
Func_303e8: ; 303e8 (c:43e8)
	ld a, [wc98e]
	or a
	jr nz, .asm_30411
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	ld d, a
	ld a, b
	cp $a
	jr nc, .asm_30410
	ld a, c
	cp $8
	jr nc, .asm_30410
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, d
	ld [hl], a
.asm_30410
	ret

.asm_30411
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, [wCurStandingTile]
	ld [hl], a
	ret

asm_3041c
	ld hl, Data_30487
	jr asm_30444

asm_30421
	ld hl, Data_3048b
	jr asm_30444

asm_30426
	ld hl, Data_3048f
	jr asm_30444

asm_3042b
	ld hl, Data_30493
	jr asm_30444

asm_30430
	ld hl, Data_30487
	jr asm_30444

asm_30435
	ld hl, Data_3048b
	jr asm_30444

asm_3043a
	ld hl, Data_30487
	jr asm_30444

asm_3043f
	ld hl, Data_3048b
	jr asm_30444

asm_30444
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, a
	srl d
	srl d
	ld a, c
	and $2
	jr nz, .asm_3045e
	srl d
.asm_3045e
	ld a, d
	and $3
	ld d, $0
	ld e, a
	pop hl
	add hl, de
	ld a, [hl]
	ld b, a
	and $7f
	ld [wRequestedPartnerDenjuuSprite], a
	ld c, $2
	bit 7, b
	jr z, .asm_30475
	ld c, $3
.asm_30475
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	call RequestPartnerDenjuuSprite
	jp Func_303d9

Data_30487:
	db $86, $87, $86, $88
Data_3048b:
	db $06, $07, $06, $08
Data_3048f:
	db $03, $04, $03, $05
Data_30493:
	db $00, $01, $00, $02

Func_30497:
	ld hl, wPartnerDenjuuXCoordBuffer
	ld b, $10
.asm_3049c
	ld a, [hl]
	add d
	ld [hli], a
	dec b
	jr nz, .asm_3049c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add d
	ld [hl], a
	ret

Func_304b0:
	ld hl, wPartnerDenjuuYCoordBuffer
	ld b, $10
.asm_304b5
	ld a, [hl]
	add d
	ld [hli], a
	dec b
	jr nz, .asm_304b5
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add d
	ld [hl], a
	ret

Func_304c9: ; 304c9 (c:44c9)
	call Func_304d7
	ld a, [hl]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Func_2c05
	ret

Func_304d7: ; 304d7 (c:44d7)
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	add $ff
	swap a
	and $f
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add $fa
	swap a
	and $f
	ld c, a
	ld hl, Data_30514
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
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wCurTilesetCollisionPointer + 1]
	ld d, a
	ld a, [wCurTilesetCollisionPointer]
	ld e, a
	ret

Data_30514:
x = 0
REPT 10
	dw x
x = x + 10
ENDR

Func_30528: ; 30528 (c:4528)
	ld hl, wPartnerDenjuuObjectStruct
	call Func_2acd
	call Func_308b0
	ld a, [wPartnerDenjuuObjectStruct_Duration + 14]
	ld b, a
	ld hl, Data_30563
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	add [hl]
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	inc b
	ld a, b
	cp $12
	jr c, .asm_3055f
	ld a, $1
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	call Func_31576
	ld hl, wCurObjectStruct
	ld a, $a0
	ld [hli], a
	ld a, $c4
	ld [hl], a
	call Func_302a8
.asm_3055f
	ld [wPartnerDenjuuObjectStruct_Duration + 14], a
	ret

Data_30563:
	db  -4,  -7, -10, -13, -15, -16, -17, -18, -18
	db -18, -17, -16, -15, -13, -10,  -7,  -4,   0

Func_30575: ; 30575 (c:4575)
	ld a, [wPartnerDenjuuObjectStruct_Duration + 14]
	ld b, a
	cp $ff
	jr z, .asm_30596
	inc b
	ld a, [wPartnerDenjuuObjectStruct_Duration + 13]
	inc a
	cp b
	jr c, .asm_30592
	xor a
	ld [wPartnerDenjuuObjectStruct_Duration + 13], a
	ld a, [wPartnerDenjuuObjectStruct_PriorityFlags]
	xor $1
	ld [wPartnerDenjuuObjectStruct_PriorityFlags], a
	ret

.asm_30592
	ld [wPartnerDenjuuObjectStruct_Duration + 13], a
	ret

.asm_30596
	ld a, [wPartnerDenjuuObjectStruct_PriorityFlags]
	and $fe
	ld [wPartnerDenjuuObjectStruct_PriorityFlags], a
	ret

Func_3059f: ; 3059f (c:459f)
	ld a, $10
	ld [wPartnerDenjuuObjectStruct_Duration + 8], a
	call Func_323ff
	ld hl, wPartnerDenjuuObjectStruct
	jr nz, .asm_305d7
	ld b, $2
	ld a, c
	cp $9
	jr c, .asm_305b6
	sub $3
	inc b
.asm_305b6
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	call RequestPartnerDenjuuSprite
	ld hl, wPartnerDenjuuObjectStruct
	call Func_304c9
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, d
	ld [hl], a
.asm_305d7
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $9
	ret z
	jp Func_302a8

Func_305e4: ; 305e4 (c:45e4)
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wPartnerDenjuuObjectStruct_Duration + 14]
	cp $0
	jr z, .asm_30601
	cp $1
	jr z, .asm_3063b
	cp $2
	jp z, Func_30689
	cp $3
	jp z, Func_30689
	cp $4
	jp z, Func_306fe
.asm_30601
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $6
	jr nz, .asm_30613
	ld a, SFX_74
	ld [H_SFX_ID], a
.asm_30613
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wPartnerDenjuuObjectStruct_Duration + 17]
	or $1
	ld [wPartnerDenjuuObjectStruct_Duration + 17], a
	ld bc, hFFF8
	call Func_2ae7
	call ApplyYStepVector_
	call Func_308b0
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	cp $e0
	jr c, .asm_3063a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_3063a
	ret

.asm_3063b
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	push hl
	callba GetPartnerDenjuuMaxHP
	ld a, c
	ld [wPartnerDenjuuHPRemaining], a
	pop hl
	ld a, [wcdb9]
	ld [wc912], a
	ld [wd409], a
	ld a, BANK(Func_305e4)
	ld [wPrevROMBank], a
	call GetDenjuuSprite_
	ld a, [wd409]
	ld [wc9db], a
	call Func_30741
	ld a, $1
	ld [wOBPalUpdate], a
	jp ForceReloadPartnerDenjuuSprite

Func_30689: ; 30689 (c:4689)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_30696
	dec a
	ld [hl], a
	ret

.asm_30696
	ld a, [wPartnerDenjuuObjectStruct_Duration + 17]
	or $1
	ld [wPartnerDenjuuObjectStruct_Duration + 17], a
	ld bc, $8
	ld hl, wPartnerDenjuuObjectStruct
	call Func_2ae7
	call ApplyYStepVector_
	call Func_308b0
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	cp $d0
	jr nc, .asm_306fd
	cp b
	jr c, .asm_306fd
	ld a, [wPartnerDenjuuObjectStruct_Duration + 17]
	and $fe
	ld [wPartnerDenjuuObjectStruct_Duration + 17], a
	ld a, b
	ld [wPartnerDenjuuObjectStruct_YCoord], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $8
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	call Func_31576
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
.asm_306fd
	ret

Func_306fe: ; 306fe (c:46fe)
	ld a, [wPartnerDenjuuObjectStruct_Duration + 17]
	and $fe
	ld [wPartnerDenjuuObjectStruct_Duration + 17], a
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ld a, $1
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	call Func_31576
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	call Func_302a8
	ld a, BANK(Func_306fe)
	ld [wPrevROMBank], a
	ld a, [wc912]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	cp AQUATIC
	ret nz
	ld bc, EVENT_080
	call CheckEventFlag
	ret z
	ld bc, EVENT_1D8
	jp SetEventFlag

Func_30741: ; 30741 (c:4741)
	push bc
	push hl
	ld a, [wc912]
	ld b, a
	ld hl, Data_30778
.is_in_array
	ld a, [hli]
	cp $ff
	jr z, .not_in_array
	cp b
	jr nz, .is_in_array
	ld a, b
	cp $ac
	jr c, .less_than_ac
	add $2
.less_than_ac
	ld bc, $100
	jr .okay

.not_in_array
	ld a, [wc9db]
	ld bc, $2a0
	sub $14
.okay
	add c
	jr nc, .no_carry
	inc b
.no_carry
	ld c, a
	ld a, BANK(Func_30741)
	ld [wPrevROMBank], a
	ld a, $7
	call LoadNthStdOBPalette
	pop hl
	pop bc
	ret

Data_30778:
	db ARAKUIDA
	db FUNGBOOST
	db GYPSOPHI
	db GONUM
	db GOLAKING
	db KANZOU
	db GENTIANA
	db YARROW
	db DOOMSDAY
	db DENDEL
	db TELETEL
	db $ff
