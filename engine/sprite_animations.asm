Func_30784: ; 30784 (c:4784)
	ld b, $c
	ld hl, wOAMAnimation01
	call Func_307a9
	ld b, $1
	ld hl, wOAMAnimation13
	call Func_307a9
	ld b, $1
	ld hl, wOAMAnimation14
	jp Func_307a9

Func_3079c:
	ld b, $c
	ld hl, wOAMAnimation01
	jp Func_307a9

Func_307a4: ; 307a4 (c:47a4)
	ld b, $8
	ld hl, wOAMAnimation17
Func_307a9: ; 307a9 (c:47a9)
.loop
	ld a, [hl]
	and $2
	jr z, .next
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	push bc
	push hl
	add $10
	ld l, a
	ld a, [hl]
	ld hl, Pointers_307f5
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	pop hl
	push hl
	ld a, [hl]
	and $2
	jr z, .skip
	call Func_308b0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30952
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_309f3
.skip
	pop hl
	pop bc
.next
	ld a, [wSubroutine]
	cp $4
	ret nz
	ld de, $20
	add hl, de
	dec b
	jr nz, .loop
	ret

._hl_
	jp hl

Pointers_307f5:
	dw Func_30a2f
	dw Func_30d2f
	dw Func_314b9
	dw Func_315e1
	dw Func_31874
	dw Func_319ab
	dw Func_31aba
	dw Func_31bbe
	dw Func_31c83
	dw Func_31c9c
	dw Func_31d96
	dw Func_31390
	dw Func_31429
	dw Func_31f44
	dw Func_320d8
	dw Func_3217b
	dw Func_3226b
	dw Func_3226b
	dw Func_3226b
	dw Func_3226b
	dw Func_329b6
	dw Func_3305e
	dw Func_330a1
	dw Func_3317d
	dw Func_33247
	dw Func_3333d
	dw Func_33346
	dw Func_33346
	dw Func_3334f
	dw Func_33358
	dw Func_33392
	dw Func_33361
	dw Func_33574
	dw Func_33479
	dw Func_335f4
	dw Func_336dc
	dw Func_33756
	dw Func_337b0
	dw Func_337b9

Func_30843: ; unlinked
	ld b, $8
	ld hl, wOAMAnimation17_Duration
	ld de, wOAMAnimation17_XCoord
.asm_3084b
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld c, a
	ld a, [wc98c]
	add c
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
	ld c, a
	ld a, [wc98d]
	add c
	ld [de], a
	ld a, $1f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $1b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_3084b
	ld b, $8
	ld hl, wOAMAnimation17 + $1b
	ld de, wOAMAnimation17_XCoord
.asm_3088b
	ld a, [de]
	ld c, a
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [de]
	ld c, a
	ld a, [hl]
	add c
	ld [de], a
	ld a, $1f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $1f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_3088b
	ret

Func_308aa:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jr asm_308bf

Func_308b0: ; 308b0 (c:48b0)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 6, a
	jr nz, asm_30917
asm_308bf
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
	ld c, a
	ld a, [wc98c]
	add c
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
	ld c, a
	ld a, [wc98d]
	add c
	ld [de], a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [de]
	ld c, a
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [de]
	ld c, a
	ld a, [hl]
	add c
	ld [de], a
asm_30917
	ret

Func_30918:
	ld b, $c
	ld hl, wOAMAnimation01
	jr asm_3092b

Func_3091f:
	ld b, $c
	ld hl, wOAMAnimation12
	jr asm_30941

Func_30926:
	ld b, $8
	ld hl, wOAMAnimation17
asm_3092b
	ld de, $20
.asm_3092e
	ld a, [hl]
	and $2
	jr z, .asm_30939
	add hl, de
	dec b
	jr nz, .asm_3092e
	xor a
	ret

.asm_30939
	ld a, b
	or a
	ret

Func_3093c:
	ld b, $8
	ld hl, wOAMAnimation24
asm_30941
	ld de, -$20
.asm_30944
	ld a, [hl]
	and $2
	jr z, .asm_3094f
	add hl, de
	dec b
	jr nz, .asm_30944
	xor a
	ret

.asm_3094f
	ld a, b
	or a
	ret

Func_30952: ; 30952 (c:4952)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 2, a
	jr nz, .asm_30961
	bit 1, a
	jr z, .asm_309a7
.asm_30961
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $a8
	jr c, .asm_30996
	cp $f8
	jr nc, .asm_30996
.asm_30970
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 2, a
	jr z, .asm_3098b
	res 2, a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	or $1
	ld [hl], a
	ret

.asm_3098b
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	xor a
	ld [hl], a
	ret

.asm_30996
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_309a6
	cp $ff
	jr c, .asm_30970
.asm_309a6
	ret

.asm_309a7
	ld a, [wc98e]
	or a
	jr nz, .asm_309b7
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	set 1, a
	ld [hl], a
.asm_309b7
	ret

Func_309b8:
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $a8
	jr c, .asm_309cc
	cp $f8
	jr nc, .asm_309cc
.asm_309cb
	ret

.asm_309cc
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_309dc
	cp $ff
	jr c, .asm_309cb
.asm_309dc
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	set 2, a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	and $fe
	ld [hl], a
	ret

Func_309f3: ; 309f3 (c:49f3)
	ld a, [wc98e]
	or a
	jr z, .asm_30a08
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_30a08
	ld a, $d0
	ld [hl], a
.asm_30a08
	ret

Func_30a09:
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $14
	ret z
	ld a, [wPlayerObjectStruct_YCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_30a26
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	or $80
	ld [hl], a
	ret

.asm_30a26
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	and $7f
	ld [hl], a
	ret

Func_30a2f: ; 30a2f (c:4a2f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_30a48
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_30a48:
	dw Func_30a54
	dw Func_30b00
	dw Func_30b23
	dw Func_30c0a
	dw Func_30cd0
	dw Func_30cf0

Func_30a54:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	and $60
	jr z, Func_30aea
	ld d, a
	ld bc, $154
	ld a, d
	and $20
	jr nz, .asm_30aa6
	ld bc, $2a0
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	sub $14
	jr .asm_30abb

.asm_30aa6
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	push bc
	call GetMapHeaderBank
	call GetFarByte
	ld a, b
	pop bc
.asm_30abb
	add c
	jr nc, .asm_30abf
	inc b
.asm_30abf
	ld c, a
	ld a, c
	ld [wcdba], a
	ld a, b
	ld [wcdbb], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, $c
	ld [wPrevROMBank], a
	ld a, $3
	call LoadNthStdOBPalette
	ld a, [wcd20]
	or a
	jr z, Func_30aea
	ld a, $1
	ld [wOBPalUpdate], a
Func_30aea
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $1
	jp GetOverworldSprite

Func_30b00:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $50
	ld [hl], a
	call Func_30a09
Func_30b14
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_30b22
	call Func_30aea
.asm_30b22
	ret

Func_30b23:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_30b4d
	inc a
	ld [hl], a
	call Func_1fff
	call Func_30b4e
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	call Func_30b7f
	callba EndOverworldIdleState
.asm_30b4d
	ret

Func_30b4e: ; 30b4e (c:4b4e)
	call GetDirectionFromObjectToPlayer
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $2
	jr nc, .asm_30b6b
	ld c, $50
	cp $0
	jr z, .asm_30b64
	ld c, $60
.asm_30b64
	ld a, b
	add a
	add b
	add c
	ld b, a
	jr .asm_30b76

.asm_30b6b
	ld c, $18
	cp $b
	jr z, .asm_30b73
	ld c, $1c
.asm_30b73
	ld a, b
	add c
	ld b, a
.asm_30b76
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_30b7f: ; 30b7f (c:4b7f)
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	or a
	ret z
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	ld c, a
	push hl
	call LoadMapObjectTextIdxs
	pop hl
	ld [hl], e
	ld a, d
	and $80
	jp nz, Func_30bc9
	ld a, [wMapGroup]
	cp $b
	jr nz, .skip
	ld a, [wMapNumber]
	cp $10
	jr nc, .skip
	ld a, [wPlayerObjectStruct_YCoord]
	cp $48
	jr nc, .skip
	ld a, $0
	ld [hJoyNew], a
	push bc
	callba Func_c8f04
	pop bc
.skip
	ld a, $0
	ld [wc91d], a
	jp PrintMapObjectText_

Func_30bc9: ; 30bc9 (c:4bc9)
	push bc
	ld a, [wMapEnemyEventFlag + 1]
	ld b, a
	ld a, [wMapEnemyEventFlag]
	ld c, a
	bit 7, b
	jr z, .asm_30be1
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc bc
	call ResetEventFlag
	jr .asm_30be4

.asm_30be1
	call SetEventFlag
.asm_30be4
	pop bc
	ld a, [wc91d]
	jp z, PrintMapObjectText_
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $2d
	ld [wPlayerObjectStruct_Duration + 11], a
	jp PrintMapObjectText_

Func_30c0a: ; 30c0a (c:4c0a)
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_30aea
	call Func_30b14
	ret

Func_30c1d: ; 30c1d (c:4c1d)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wBattleResult]
	or a
	jr nz, .asm_30c53
	ld a, [wMapEnemyEventFlag + 1]
	ld b, a
	ld a, [wMapEnemyEventFlag]
	ld c, a
	bit 7, b
	jr z, .asm_30c3e
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc bc
	call SetEventFlag
	jr .asm_30c41

.asm_30c3e
	call ResetEventFlag
.asm_30c41
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld [hl], $0
	ret

.asm_30c53
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret c
	jr nz, asm_30ca2
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	or a
	jp z, Func_30c9b
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	or a
	jr z, Func_30c9b
	ld c, a
	call Func_2f0a
	ld a, b
	cp $ff
	jr z, Func_30c9b
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	ld c, a
	call LoadMapObjectTextIdxs
	ld a, $0
	ld [wc91d], a
	jp PrintMapObjectText_

Func_30c9b: ; 30c9b (c:4c9b)
	ld b, $0
	ld c, $9f
	jp PrintMapObjectText_

asm_30ca2
	cp $50
	jr c, .asm_30cad
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_30cad
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	push af
	push hl
	call Func_3259b
	pop hl
	pop bc
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or b
	ld [hl], a
	ret

Func_30cd0: ; 30cd0 (c:4cd0)
	call Func_325e4
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $4
	jr z, .asm_30cef
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
.asm_30cef
	ret

Func_30cf0: ; 30cf0 (c:4cf0)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_30d13
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
.asm_30d13
	ret

Func_30d14:
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
	jp CalcL1Distance_

Func_30d2f: ; 30d2f (c:4d2f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_30d48
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_30d48:
	dw Func_30d54
	dw Func_30d89
	dw Func_30b23
	dw Func_30dac
	dw Func_30cd0
	dw Func_30cf0

Func_30d54:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $60
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
Func_30d73: ; 30d73 (c:4d73)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $2
	jp GetOverworldSprite

Func_30d89:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $60
	ld [hl], a
	call Func_30a09
Func_30d9d: ; 30d9d (c:4d9d)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_30dab
	call Func_30d73
.asm_30dab
	ret

Func_30dac:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_30d73
	call Func_30d9d
	ret

Func_30dbf: ; 30dbf (c:4dbf)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jp z, Func_30ece
	ld a, [wcd00]
	or a
	jp nz, Func_30ece
	ld a, [wScriptDelay]
	or a
	jp nz, Func_30ece
	ld a, [wPhoneCallSubroutine]
	cp $1
	jp nz, Func_30ece
	ld a, [wc98e]
	or a
	jp nz, Func_30ece
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	jp nz, Func_30ece
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_30e06
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_30ece
.asm_30e06
	call Func_30d14
	ld d, a
	ld e, $1a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr z, .asm_30e1b
	ld e, $28
	jr .asm_30e33

.asm_30e1b
	ld bc, EVENT_C39
	call CheckEventFlag
	jr nz, .asm_30e33
	ld a, [wMapGroup]
	cp $b
	jr nz, .asm_30e33
	ld a, [wMapNumber]
	cp $10
	jr nc, .asm_30e33
	ld e, $26
.asm_30e33
	ld a, d
	cp e
	jp nc, Func_30ece
	ld a, e
	cp $28
	jr z, .asm_30e52
	call GetDirectionFromObjectToPlayer
	ld de, Data_30efc
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wPlayerObjectStruct_Duration + 15]
	cp b
	jr nz, Func_30ece
.asm_30e52
	call Func_1fff
	callba StopPlayerWalkingAnimation
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $8
	ld [wPlayerObjectStruct_Duration + 11], a
	ld a, $0
	ld [hJoyNew], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr z, .asm_30ecd
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $4
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fe
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
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_30b4e
	ld a, $3c
	ld [wPlayerObjectStruct_Duration + 11], a
	ld a, SFX_10
	ld [H_SFX_ID], a
.asm_30ecd
	ret

Func_30ece: ; 30ece (c:4ece)
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	or a
	jr nz, .asm_30edb
	ld a, [hl]
	jr .asm_30eee

.asm_30edb
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jr z, .asm_30eea
	inc de
	inc de
.asm_30eea
	call GetMapByte
	ld a, b
.asm_30eee
	ld hl, Pointers_30f00
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Data_30efc:
	db 1, 3, 0, 2

Pointers_30f00:
	dw Func_30f0c
	dw Func_31007
	dw Func_30f4a
	dw Func_30f90
	dw Func_31074
	dw Func_31241

Func_30f0c:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_30f40
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_30f37
	ld a, b
	add a
	add b
	ld b, a
.asm_30f37
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

.asm_30f40
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $0
	ld [hl], a
	ret

Func_30f4a:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, l
	ld b, a
	ld a, [wOverworldFrameCounter]
	add b
	and $60
	jr nz, .asm_30f6f
	ld a, l
	swap a
	srl a
	srl a
	ld b, a
	ld a, [wOverworldFrameCounter]
	add b
	and $7
	jr nz, .asm_30f6f
	call Func_3154b
.asm_30f6f
	ld de, Data_30f8c
	ld a, [wOverworldFrameCounter]
	srl a
	srl a
	and $3
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
	ret

Data_30f8c:
	db 0, 1, 0, 2

Func_30f90:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_30fc5
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $8
	jr c, .asm_31006
	xor a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $ba
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jp .asm_31006

.asm_30fc5
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call ApplyYStepVector_
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, [hl]
	cp c
	jr c, .asm_31006
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
.asm_31006
	ret

Func_31007:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call GetDirectionFromObjectToPlayer
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_31021
	ld a, b
	add a
	add b
	ld b, a
.asm_31021
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

GetDirectionFromObjectToPlayer: ; 3102a (c:502a)
; Returns to b
; 0: Face Up
; 1: Face Down
; 2: Face Right
; 3: Face Left
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld de, $0
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerObjectStruct_XCoord]
	sub b
	jr c, .object_to_right
	cpl
	inc a
	inc d
.object_to_right
	ld c, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	sub b
	jr c, .object_below
	cpl
	inc a
	inc e
.object_below
	or a
	jr z, .no_y_displacement
	ld b, a
	ld a, c
	or a
	jr z, .no_x_displacement
	ld a, b
	cp c
	jr nc, .no_y_displacement
.no_x_displacement
	ld a, e
	or a
	jr nz, .return_face_down
	ld b, $1
	ret

.return_face_down
	ld b, $0
	ret

.no_y_displacement
	ld a, d
	or a
	jr nz, .return_face_left
	ld b, $2
	ret

.return_face_left
	ld b, $3
	ret

Func_31074: ; 31074 (c:5074)
	ld a, [wc98e]
	or a
	jr z, .asm_3107b
	ret

.asm_3107b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_3108c
	dec a
	ld [hl], a
	ret

.asm_3108c
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jr z, .asm_310a2
	inc de
	inc de
.asm_310a2
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld c, a
	call Func_2e42
	ld a, b
	inc a
	ld c, a
	and $f0
	add $8
	ld b, a
	ld a, c
	swap a
	and $f0
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
	call CalcL1Distance_
	cp $3
	jr nc, .asm_310d7
	push bc
	call Func_311f1
	pop bc
.asm_310d7
	call Func_303a
	ld [wMathBuffer3], a
	ld d, a
	call Cosine8_
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_310ea
	ld b, $ff
.asm_310ea
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_310f7
.asm_310f0
	sra b
	rr c
	dec a
	jr nz, .asm_310f0
.asm_310f7
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $9
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [hl]
	ld e, a
	push de
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
	push de
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wMathBuffer3]
	ld d, a
	call Sine8_
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_31134
	ld b, $ff
.asm_31134
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_31141
.asm_3113a
	sra b
	rr c
	dec a
	jr nz, .asm_3113a
.asm_31141
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	call Func_308b0
	call Func_3133d
	jr nz, .asm_31157
	call Func_31376
.asm_31157
	pop bc
	pop de
	jr z, .asm_31187
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	ld a, c
	ld [hli], a
	ld [hl], b
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31190
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
	call Func_311f1
.asm_31187
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31190
	ld a, [wMathBuffer3]
	add $10
	and $7f
	swap a
	srl a
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	add a
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	ld c, a
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_311c2
.asm_311bd
	srl c
	dec a
	jr nz, .asm_311bd
.asm_311c2
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	ret nz
	ld a, c
	and $3
	ld de, Data_3123d
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld c, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_311e5
	ld c, $0
.asm_311e5
	ld a, c
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_311f1: ; 311f1 (c:51f1)
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_31219
	ld a, [wSpriteDestIsCustom]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCustomSpriteDest]
	ld b, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	cp b
	jr c, .asm_31217
	xor a
.asm_31217
	ld [hl], a
	ret

.asm_31219
	ld a, [wSpriteDestIsCustom]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCustomSpriteDest]
	ld b, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	cp $ff
	jr nz, .asm_31237
	ld a, b
	dec a
.asm_31237
	ld [hl], a
	ret

Data_31239:
	db 3, 0, 2, 1

Data_3123d:
	db 0, 1, 0, 2

Func_31241: ; 31241 (c:5241)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_312b8
	ld a, [wPlayerObjectStruct_YCoord]
	cp $48
	jr c, .asm_31290
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	cp $68
	jr nc, .asm_31269
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $6c
	jr c, .asm_31290
.asm_31269
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_31275
	cpl
	inc a
.asm_31275
	cp $4
	jr c, .asm_31290
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31299
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ret

.asm_31290
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31299
	call GetDirectionFromObjectToPlayer
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_312af
	ld a, b
	add a
	add b
	ld b, a
.asm_312af
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

.asm_312b8
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp b
	jr nc, .asm_312d8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, $9
	ld [wSpriteDestIsCustom], a
	ld bc, $40
	jr .asm_312e4

.asm_312d8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, $6
	ld [wSpriteDestIsCustom], a
	ld bc, -$40
.asm_312e4
	call Func_2b01
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $68
	jr c, .asm_3132a
	ld a, [wVBlankCounter]
	srl a
	srl a
	and $3
	ld de, Data_3123d
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wSpriteDestIsCustom]
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerObjectStruct_XCoord]
	sub b
	jr nc, .asm_31326
	cpl
	inc a
.asm_31326
	cp $4
	jr nc, .asm_31333
.asm_3132a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31333
	ret

Func_31334:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3133d
	ld c, a
	ret

Func_3133d: ; 3133d (c:533d)
	ld a, [wPlayerObjectStruct_XCoord]
	ld d, a
	ld a, [wPlayerObjectStruct_YCoord]
	call Func_3134f
	ret nz
	ld a, [wPartnerDenjuuObjectStruct_XCoord]
	ld d, a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
Func_3134f: ; 3134f (c:534f)
	add $3
	ld e, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	inc hl
	sub d
	cp $80
	jr c, .asm_31361
	cpl
	inc a
.asm_31361
	cp $d
	jr nc, .asm_31374
	ld a, [hl]
	sub e
	cp $80
	jr c, .asm_3136d
	cpl
	inc a
.asm_3136d
	cp $d
	jr nc, .asm_31374
	or $1
	ret

.asm_31374
	xor a
	ret

Func_31376: ; 31376 (c:5376)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	and $10
	cp $10
	jr z, .asm_31389
	ld a, [wCurObjectStruct + 1]
	ld h, a
	xor a
	ret

.asm_31389
	ld a, [wCurObjectStruct + 1]
	ld h, a
	or $1
	ret

Func_31390: ; 31390 (c:5390)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_313a9
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_313a9:
	dw Func_313b5
	dw Func_313f3
	dw Func_30b23
	dw Func_31416
	dw Func_30cd0
	dw Func_30cf0

Func_313b5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $18
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
Func_313dd: ; 313dd (c:53dd)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $3
	jp GetOverworldSprite

Func_313f3:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $18
	ld [hl], a
	call Func_30a09
Func_31407: ; 31407 (c:5407)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_31415
	call Func_313dd
.asm_31415
	ret

Func_31416:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_313dd
	call Func_31407
	ret

Func_31429: ; 31429 (c:5429)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Func_31442
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Func_31442:
	dw Func_3144e
	dw Func_31483
	dw Func_30b23
	dw Func_314a6
	dw Func_30cd0
	dw Func_30cf0

Func_3144e:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $1c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
Func_3146d: ; 3146d (c:546d)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $4
	jp GetOverworldSprite

Func_31483:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $1c
	ld [hl], a
	call Func_30a09
Func_31497: ; 31497 (c:5497)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_314a5
	call Func_3146d
.asm_314a5
	ret

Func_314a6:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_3146d
	call Func_31497
	ret

Func_314b9: ; 314b9 (c:54b9)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_314d2
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_314d2:
	dw Func_314d6
	dw Func_31510

Func_314d6:
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
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $30
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_31510:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $8
	jr c, .asm_3153d
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
	jr c, .asm_3153d
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3153d
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -3
	call Func_2ae7
	call Func_2acd
	ret

Func_3154b: ; 3154b (c:554b)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld b, $2
	call Func_33886
	jr z, .asm_31562
	ld a, d
	ld [wCurObjectStruct + 1], a
	ld a, e
	ld [wCurObjectStruct], a
.asm_31562
	ld h, d
	ld l, e
	ret

Func_31565:
	ld h, b
	ld l, c
	ld a, [wca5e]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
	jr asm_31598

Func_31576: ; 31576 (c:5576)
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wca5f]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
	jr asm_31598

Func_31588:
	ld hl, wPlayerObjectStruct
Func_3158b:
	ld a, [wca5e]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
asm_31598
	push hl
	ld b, $2
	call Func_33886
	jr z, .asm_315d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31d76
	pop hl
	push hl
	ld b, $2
	call Func_33886
	jr z, .asm_315d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31d76
.asm_315d7
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_315e1: ; 315e1 (c:55e1)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_315fa
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_315fa:
	dw Func_31600
	dw Func_3162e
	dw Func_31763

Func_31600: ; 31600 (c:5600)
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
	ld a, $26
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
	ret

Func_3162e: ; 3162e (c:562e)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $3
	jr nz, .asm_31650
	push af
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_31726
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	pop af
.asm_31650
	and $7
	jr nz, .asm_31683
	ld a, [hl]
	srl a
	srl a
	srl a
	sla a
	ld de, Data_31706
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add a
	add a
	add a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [de]
	add [hl]
	ld [hli], a
	inc de
	ld a, [de]
	add [hl]
	ld [hl], a
.asm_31683
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $19
	jr nc, .asm_31690
	inc a
	ld [hl], a
.asm_31690
	ld de, wPlayerObjectStruct_Duration
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $8
.asm_3169b
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_3169b
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 2, a
	jr z, .asm_316c3
	ld a, [wCurPlayerFacing]
	cp $2d
	jr z, .asm_316b8
	cp $30
	jr z, .asm_316b8
	cp $33
	jr z, .asm_316b8
	ret

.asm_316b8
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$40
	call Func_2af4
	ret

.asm_316c3
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wPlayerObjectStruct_Duration + 15]
	add a
	add a
	ld de, Data_316f6
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc hl
	inc hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret

Data_316f6:
	db $c0, $00
	db $c0, $ff
	db $00, $00
	db $00, $ff
	db $40, $ff
	db $c0, $ff
	db $00, $00
	db $80, $00

Data_31706:
	db $0c, $fd
	db $00, $fc
	db $f8, $fa
	db $fc, $01
	db $00, $f0
	db $00, $00
	db $00, $01
	db $00, $03

Data_31716:
	db $f4, $fd
	db $00, $fc
	db $08, $fa
	db $04, $01
	db $00, $0a
	db $00, $f1
	db $00, $f8
	db $00, $01

Func_31726: ; 31726 (c:5726)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	push bc
	push hl
	callba Func_c8222
	pop hl
	ld a, d
	ld [hl], a
	call Func_252a
	pop bc
	ld a, [wc9c2]
	cp $14
	jr nz, .asm_31762
	call Func_28a9
	jr z, .asm_31762
	ld a, $c
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $a8
	ld [wPlayerObjectStruct_Duration + 13], a
.asm_31762
	ret

Func_31763:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wc98e]
	or a
	jr z, .asm_3177d
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_3177d
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_31790
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	jr .asm_31796

.asm_31790
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
.asm_31796
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld de, Data_31828
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
	add b
	ld [hl], a
	push bc
	call Func_304c9
	pop bc
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	sub b
	ld [hl], a
	ld a, d
	and $10
	jr nz, .asm_317e3
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	cp $19
	jr nc, .asm_317e3
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	jp Func_2acd

.asm_317e3
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_31916
	pop hl
	ld [hl], $0
	ld a, SFX_69
	ld [H_SFX_ID], a
	ld a, [wMapGroup]
	cp $a
	jr nc, .asm_31803
	ld a, SFX_5E
	ld [H_SFX_ID], a
.asm_31803
	call OverworldRandom8_
	and $3
	cp $1
	ret nz
	ld a, [wc94c]
	or a
	ret nz
	ld c, $0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
.asm_3181a
	call Func_3336a
	ld a, c
	add $15
	cp $7e
	jr z, .asm_31827
	ld c, a
	jr .asm_3181a

.asm_31827
	ret

Data_31828:
	db $0d, $0e, $0f, $10, $10, $11, $11, $11, $11
	db $11, $11, $10, $10, $0f, $0e, $0d, $0c, $0b
	db $0a, $09, $07, $06, $04, $02, $00, $fe, $fc

Func_31843: ; 31843 (c:5843)
	ld hl, wPlayerObjectStruct
	ld b, $3
	call Func_33870
	jr z, .asm_31871
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wPlayerObjectStruct_Duration + 15]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [wc9c0]
	ld [hli], a
	ld a, [wc9c1]
	ld [hl], a
	ld b, $1
	ld a, SFX_67
	ld [H_SFX_ID], a
	ret

.asm_31871
	ld b, $0
	ret

Func_31874: ; 31874 (c:5874)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3188d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_3188d:
	dw Func_31891
	dw Func_318c1

Func_31891:
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
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_308aa
Func_318c1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_318e1
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	jr .asm_318e7

.asm_318e1
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
.asm_318e7
	ld a, [wc98e]
	or a
	jr z, .asm_318f4
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_318f4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31908
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31908
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	ret

Func_31916: ; 31916 (c:5916)
	ld b, $4
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
Func_31920: ; 31920 (c:5920)
	push hl
	push bc
	ld b, $4
	call Func_33886
	jr z, .asm_3199c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop af
	push af
	dec a
	ld c, a
	add a
	ld de, Data_319a3
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $27
	add c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [de]
	inc de
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld a, [de]
	inc de
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	pop af
	push af
	ld bc, $568
	cp $3
	jr c, .asm_31982
	ld bc, $3a8
.asm_31982
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hli]
	ld c, [hl]
	dec hl
	sra c
	rr a
	sra c
	rr a
	sra c
	rr a
	ld [hli], a
	ld [hl], c
.asm_3199c
	pop bc
	pop hl
	dec b
	jp nz, Func_31920
	ret

Data_319a3:
	db $fc, $e8
	db $04, $e8
	db $fc, $f0
	db $04, $f0

Func_319ab: ; 319ab (c:59ab)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_319c4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_319c4:
	dw Func_319c8
	dw Func_319f6

Func_319c8:
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
	ld a, $2b
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
	ret

Func_319f6:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $6
	jr c, .asm_31a23
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
	cp $2f
	jr c, .asm_31a23
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31a23
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_31a31:
	ld hl, wPlayerObjectStruct
	jr Func_31a39

Func_31a36:
	ld hl, wPartnerDenjuuObjectStruct
Func_31a39: ; 31a39 (c:5a39)
	push hl
	ld b, $5
	call Func_33886
	jr z, .asm_31a90
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31a9a
	pop hl
	push hl
	ld b, $5
	call Func_33886
	jr z, .asm_31a90
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31a9a
.asm_31a90
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_31a9a: ; 31a9a (c:5a9a)
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2ada
	ld bc, -$80
	jp Func_2af4

Func_31aba: ; 31aba (c:5aba)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31ad3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_31ad3:
	dw Func_31ad7
	dw Func_31b19

Func_31ad7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $33
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
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_31b19:
	ld a, $40
	ld [wOAMAnimation13 + $19], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wTakingAStep]
	or a
	jr z, .asm_31b31
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_31b31
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_31b3f
	dec a
	ld [hl], a
	jr .asm_31b64

.asm_31b3f
	call Func_31c6d
	ld a, $2
	ld [wca5e], a
	ld a, [wCurStandingTile]
	cp $4
	jr z, .asm_31b52
	cp $9
	jr nz, .asm_31b7d
.asm_31b52
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $4
	ld [hl], a
.asm_31b64
	ld a, $1
	ld [wca5e], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	srl a
	srl a
	srl a
	and $1
	add $30
	ld b, a
	jr .asm_31b81

.asm_31b7d
	cp $3
	jr nz, .asm_31b9e
.asm_31b81
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld de, wPlayerObjectStruct_XCoord
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret

.asm_31b9e
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, $0
	ld [wca5e], a
	ret

Func_31bb3:
	ld hl, wPlayerObjectStruct
	ld b, $6
	call Func_338f0
	jp Func_31c7b

Func_31bbe: ; 31bbe (c:5bbe)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31bd7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_31bd7:
	dw Func_31bdb
	dw Func_31bde

Func_31bdb:
	jp Func_31ad7

Func_31bde:
	ld a, $40
	ld [wOAMAnimation14 + $19], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wTakingAStep]
	or a
	jr z, .asm_31bf6
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_31bf6
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_31c04
	dec a
	ld [hl], a
	jr .asm_31c20

.asm_31c04
	call Func_31c6d
	ld a, $2
	ld [wca5f], a
	ld a, [wPartnerDenjuuObjectStruct_Duration + 9]
	cp $4
	jr z, .asm_31c17
	cp $9
	jr nz, .asm_31c39
.asm_31c17
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $4
	ld [hl], a
.asm_31c20
	ld a, $1
	ld [wca5f], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	srl a
	srl a
	srl a
	and $1
	add $30
	ld b, a
	jr .asm_31c3d

.asm_31c39
	cp $3
	jr nz, .asm_31c61
.asm_31c3d
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wPartnerDenjuuObjectStruct_PriorityFlags]
	ld [wOAMAnimation14_PriorityFlags], a
	ld de, wPartnerDenjuuObjectStruct_XCoord
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ld a, [wPartnerDenjuuObjectStruct_Duration + 17]
	and $1
	jr nz, .asm_31c66
	ret

.asm_31c61
	ld a, $0
	ld [wca5f], a
.asm_31c66
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ret

Func_31c6d: ; 31c6d (c:5c6d)
	ld b, $33
	ld a, [wOverworldFrameCounter]
	srl a
	srl a
	and $1
	add b
	ld b, a
	ret

Func_31c7b: ; 31c7b (c:5c7b)
	ld hl, wPartnerDenjuuObjectStruct
	ld b, $7
	jp Func_338f9

Func_31c83: ; 31c83 (c:5c83)
	ret

Data_31c84:
	db $20, $00, $00, $00
	db $00, $00, $e0, $ff
	db $e0, $ff, $00, $00
	db $00, $00, $20, $00
	db $09, $00, $00, $f8
	db $f8, $00, $00, $09

Func_31c9c: ; 31c9c (c:5c9c)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31cb5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_31cb5:
	dw Func_31cb9
	dw Func_31ce7

Func_31cb9:
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
	ld a, $16
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
	ret

Func_31ce7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_31cff
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31cff
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_31d0d:
	ld hl, wPartnerDenjuuObjectStruct
	jr Func_31d15

Func_31d12:
	ld hl, wPlayerObjectStruct
Func_31d15: ; 31d15 (c:5d15)
	push hl
	ld b, $9
	call Func_33886
	jr z, .asm_31d6c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31d76
	pop hl
	push hl
	ld b, $9
	call Func_33886
	jr z, .asm_31d6c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31d76
.asm_31d6c
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_31d76: ; 31d76 (c:5d76)
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2ada
	ld bc, -$80
	jp Func_2af4

Func_31d96: ; 31d96 (c:5d96)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31daf
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_31daf:
	dw Func_31db5
	dw Func_31df2
	dw Func_31e12

Func_31db5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2f
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, SFX_0F
	ld [H_SFX_ID], a
	ret

Func_31df2:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	call Func_304d7
	push hl
	callba Func_c8222
	pop hl
	ld a, d
	ld [hl], a
	call Func_252a
	ret

Func_31e12:
	ld hl, Data_31c84
	call Func_31e63
	ld a, [wc98e]
	or a
	jr z, .asm_31e25
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31e25
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_31e62
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	call Func_304d7
	ld a, b
	cp $a
	jr nc, .asm_31e62
	ld a, c
	cp $8
	jr nc, .asm_31e62
	ld a, [wCurTilesetIdx]
	cp $10
	jr z, .asm_31e5c
	cp $3
	jr nz, .asm_31e56
	ld a, $39
	ld [hl], a
	jp Func_252a

.asm_31e56
	ld a, $88
	ld [hl], a
	jp Func_252a

.asm_31e5c
	ld a, $39
	ld [hl], a
	jp Func_252a

.asm_31e62
	ret

Func_31e63: ; 31e63 (c:5e63)
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	pop hl
	add a
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	pop hl
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_2af4

Func_31e97: ; 31e97 (c:5e97)
	call Func_30926
	ret z
	ld de, wPlayerObjectStruct
	ld b, $a
	call Func_3389c
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	xor a
	ld [hli], a
	ld a, [wPlayerXTile]
	inc a
	sla a
	sla a
	ld [hli], a
	inc hl
	inc hl
	xor a
	ld [hli], a
	ld a, [wPlayerYTile]
	inc a
	sla a
	sla a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wPlayerObjectStruct_Duration + 15]
	ld [hl], a
	ld hl, Data_31f24
	call Func_31e63
	call Func_308b0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304d7
	ld a, b
	cp $a
	jr nc, .asm_31f1b
	ld a, c
	cp $8
	jr nc, .asm_31f1b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	cp $0
	jr z, .asm_31f1b
	cp $b
	jr z, .asm_31f04
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	xor a
	ret

.asm_31f04
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304d7
	push bc
	ld a, $9d
	ld [hl], a
	call Func_252a
	pop de
	callba Func_c830a
.asm_31f1b
	ld hl, Data_31f34
	call Func_31e63
	or $1
	ret

Data_31f24:
	db $00, $06, $00, $00
	db $00, $fe, $00, $f8
	db $00, $f6, $00, $00
	db $00, $fe, $00, $08

Data_31f34:
	db $00, $fc, $00, $00
	db $00, $00, $00, $04
	db $00, $04, $00, $00
	db $00, $00, $00, $fc

Func_31f44: ; 31f44 (c:5f44)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31f5d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_31f5d:
	dw Func_31f65
	dw Func_31fc3
	dw Func_31ff1
	dw Func_3202b

Func_31f65:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $2
	ld bc, -$100
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $17
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $5
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
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, b
	ld [hl], a
	ld c, $ff
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a6f
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_31fc3:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $18
	jr c, .asm_31ff0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, SFX_6A
	ld [H_SFX_ID], a
.asm_31ff0
	ret

Func_31ff1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$8
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $64
	jr c, .asm_3201e
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

.asm_3201e
	ld a, [wOverworldFrameCounter]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_3202b:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .check_item
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ld a, BANK(Func_3202b)
	ld [wPrevROMBank], a
	ld a, $5
	ld bc, $15
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_0A
	ld [H_SFX_ID], a
	ret

.check_item
	cp $26
	jr nz, .skip
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	call GiveItem
	call Func_33bc
.skip
	ld a, [wOverworldFrameCounter]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_32079: ; 32079 (c:6079)
	cp $ff
	jr nz, .not_null
	ld a, [wCurMapScripts + 1]
	ld [wScriptNumber + 1], a
	ld b, a
	ld a, [wCurMapScripts]
	ld [wScriptNumber], a
	cp $ff
	jr nz, .asm_32093
	ld a, b
	cp $ff
	jr z, .asm_320ab
.asm_32093
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
.asm_320ab
	ret

.not_null
	push af
	ld hl, wPlayerObjectStruct
	ld b, $d
	call Func_33870
	jr z, .nope
	ld a, [wc9c3]
	swap a
	ld d, a
	ld a, [wc9c4]
	or d
	ld [wca67], a
	ld de, wca67
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	pop af
	ld [hl], a
	jp Func_33a62

.nope
	pop af
	ret

Func_320d8: ; 320d8 (c:60d8)
	callba Func_c903d
	ret

Func_320e1: ; 320e1 (c:60e1)
	push bc
	call Func_30918
	jp z, Func_3215b
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld [hl], $2
	pop bc
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	swap b
	ld a, b
	or c
	ld [hl], a
	ld d, h
	ld e, l
	call Func_33a62
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, rLCDC
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $cc
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_32161
	call Func_308b0
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
	ld a, $1
	ld [wc945], a
	ret

Func_3215b: ; 3215b (c:615b)
	pop bc
	ret

Func_3215d:
	ld a, [wCurObjectStruct + 1]
	ld h, a
Func_32161: ; 32161 (c:6161)
	call OverworldRandom16_
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

Func_3217b: ; 3217b (c:617b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_32194
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_32194:
	dw Func_32198
	dw Func_321e2

Func_32198:
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
	ld a, $36
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

Func_321e2:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $30
	jr c, .asm_321fa
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_321fa
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $1
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
	jr nc, .asm_32221
	ld b, $2
.asm_32221
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32228:
	ld h, d
	ld l, e
Func_3222a: ; 3222a (c:622a)
	ld b, $f
	call Func_33886
	jr z, .asm_3223c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3223d
.asm_3223c
	ret

Func_3223d: ; 3223d (c:623d)
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	ld hl, -$200
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jp Func_2af4

Func_3226b: ; 3226b (c:626b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_32284
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_32284:
	dw Func_32294
	dw Func_323a9
	dw Func_323f1
	dw Func_3259b
	dw Func_325e4
	dw Func_32658

Data_32290:
	db $50, $60
	db $18, $1c

Func_32294:
	ld a, [wCurObjectStruct + 1]
	ld h, a
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
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wc98e]
	or a
	jr nz, .asm_322c3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
.asm_322c3
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_322f4
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $12
	jr nc, .asm_322ea
	ld a, b
	add a
	add b
	ld b, a
.asm_322ea
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, b
	ld [hl], a
	jr .asm_322fd

.asm_322f4
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, $0
	ld [hl], a
.asm_322fd
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	and $60
	jr z, .asm_3236e
	ld d, a
	ld bc, $100
	ld a, d
	and $20
	jr nz, .asm_3231f
	ld bc, $2a0
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	sub $14
	jr .asm_32326

.asm_3231f
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
.asm_32326
	add c
	jr nc, .asm_3232a
	inc b
.asm_3232a
	ld c, a
	ld a, c
	ld [wcdba], a
	ld a, b
	ld [wcdbb], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, .asm_32354
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $1
	ld [hl], a
.asm_32354
	ld a, $c
	ld [wPrevROMBank], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, [hl]
	call LoadNthStdOBPalette
	ld a, [wcd20]
	or a
	jr z, .asm_3236e
	ld a, $1
	ld [wOBPalUpdate], a
.asm_3236e
	call Func_32373
	jr Func_323a9

Func_32373: ; 32373 (c:6373)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	sub $f
	ld b, a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	jp GetOverworldSprite

Func_32391: ; 32391 (c:6391)
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	sub $10
	ld de, Data_32290
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Data_323a5:
	db 2, 1
	db 2, 1

Func_323a9
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jr nz, .asm_323bd
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
.asm_323bd
	call Func_30a09
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	call Func_32391
	or b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
Func_323d5:
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_323e3
	call Func_32373
.asm_323e3
	ret

Func_323e4:
	ld h, d
	ld l, e
	jr Func_323d5

Func_323e8:
	call Func_323ff
	ld b, $0
	jr z, .asm_323f0
	inc b
.asm_323f0
	ret

Func_323f1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30a09
	call Func_323ff
	ret nz
	jp Func_3251e

Func_323ff: ; 323ff (c:63ff)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	inc a
	ld c, a
	and $f0
	add $8
	ld b, a
	ld a, c
	swap a
	and $f0
	ld c, a
	push bc
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
	pop bc
	push af
	push bc
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_302d
	sla e
	rl d
	sla c
	rl b
	push de
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	pop bc
	call Func_2af4
	call Func_308b0
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
	pop bc
	call CalcL1Distance_
	push af
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld l, a
	pop af
	dec a
	cp l
	jr c, .asm_324b5
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld d, c
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	call Func_33846
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $df
	ld [hl], a
	call Func_324f8
	add sp, $2
	ret

.asm_324b5
	inc a
	ld [wMathBuffer3], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wMathBuffer3]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	cp $4
	jr nc, .asm_324d3
	add sp, $2
	or $1
	ret

.asm_324d3
	pop af
	add $10
	and $7f
	swap a
	srl a
	and $3
	ld b, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $20
	jr z, .asm_324ef
	ld hl, Pointers_32573
	jr .asm_324f2

.asm_324ef
	ld hl, Pointers_3256b
.asm_324f2
	ld a, b
	call Func_3252c
	xor a
	ret

Func_324f8: ; 324f8 (c:64f8)
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	and $f
	ld c, $0
	cp $3
	jr c, .asm_32515
	ld c, $3
	cp $6
	jr c, .asm_32515
	ld c, $6
	cp $9
	jr c, .asm_32515
	ld c, $9
.asm_32515
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_3251e: ; 3251e (c:651e)
	call Func_32391
	or c
	ld c, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_3252c: ; 3252c (c:652c)
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	swap a
	and $f
	jr nz, .asm_32547
	inc a
.asm_32547
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	pop hl
	swap a
	and $3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, c
	ld [hl], a
	ret

Pointers_3256b:
	dw Data_3257b
	dw Data_32587
	dw Data_3257f
	dw Data_32583

Pointers_32573:
	dw Data_3258b
	dw Data_32597
	dw Data_3258f
	dw Data_32593
	
Data_3257b: db $9, $a, $9, $b
Data_3257f: db $6, $7, $6, $8
Data_32583: db $3, $4, $3, $5
Data_32587: db $0, $1, $0, $2
Data_3258b: db $6, $7, $6, $8
Data_3258f: db $9, $a, $9, $b
Data_32593: db $0, $1, $0, $2
Data_32597: db $3, $4, $3, $5

Func_3259b: ; 3259b (c:659b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_323d5
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	cp $ff
	jr z, .asm_325d2
	inc b
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	cp b
	jr c, .asm_325d0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
	ret

.asm_325d0
	ld [hl], a
	ret

.asm_325d2
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	or $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_325e4: ; 325e4 (c:65e4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	call Func_308aa
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	ld hl, Data_30563
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, c
	add [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	inc b
	ld a, b
	cp $12
	jr c, asm_3264f
Func_3262a:
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $bf
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_3158b
	pop hl
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ret

asm_3264f
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32658: ; 32658 (c:6658)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_326b2
	cp $1
	jp z, Func_326fe
	cp $2
	jp z, Func_32734
	cp $3
	jp z, Func_32779
	cp $4
	jp z, Func_327af
	cp $5
	jp z, Func_327f4
	cp $6
	jp z, Func_32857
	cp $7
	jp z, Func_32898
	cp $8
	jp z, Func_328ae
	cp $9
	jp z, Func_328da
	cp $a
	jp z, Func_328db
	cp $b
	jp z, Func_3291b
	cp $c
	jp z, Func_32942
	cp $d
	jp z, Func_32979
.asm_326b2
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $28
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $2d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, Func_326fe
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add $a
	ld [hl], a
	ld a, SFX_6B
	ld [H_SFX_ID], a
Func_326fe: ; 326fe (c:66fe)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_32712
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_32712
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	jr c, .asm_32733
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_32733
	ret

Func_32734: ; 32734 (c:6734)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_32778
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $13
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, SFX_6B
	ld [H_SFX_ID], a
.asm_32778
	ret

Func_32779: ; 32779 (c:6779)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_3278d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
.asm_3278d
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	jr c, .asm_327ae
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_327ae
	ret

Func_327af: ; 327af (c:67af)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_327f3
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $2c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $3a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, SFX_6B
	ld [H_SFX_ID], a
.asm_327f3
	ret

Func_327f4: ; 327f4 (c:67f4)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_32808
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_32808
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_32856
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, .asm_3282d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $8
	ld [hl], a
	ret

.asm_3282d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
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
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_32856
	ret

Func_32857: ; 32857 (c:6857)
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_3288a
	ld a, $50
	call Func_33846
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	call Func_3262a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, SFX_0B
	ld [H_SFX_ID], a
	ret

.asm_3288a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $6
	call Func_2ae7
	call Func_2acd
	ret

Func_32898: ; 32898 (c:6898)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_328ad
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_328ad
	ret

Func_328ae: ; 328ae (c:68ae)
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .asm_328d9
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
.asm_328d9
	ret

Func_328da: ; 328da (c:68da)
	ret

Func_328db: ; 328db (c:68db)
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $16
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fd
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $64
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add $f6
	ld [hl], a
	ret

Func_3291b: ; 3291b (c:691b)
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, rIE
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_3293a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ret

.asm_3293a
	ld a, [wCurObjectStruct]
	ld l, a
	call ApplyYStepVector_
	ret

Func_32942: ; 32942 (c:6942)
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_3296c
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, $50
	call Func_33846
	ld a, SFX_0B
	ld [H_SFX_ID], a
	jp Func_3262a

.asm_3296c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $a
	call Func_2ae7
	jp ApplyYStepVector_

Func_32979: ; 32979 (c:6979)
	ret

Func_3297a: ; 3297a (c:697a)
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld d, a
	call Cosine8_
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_3298d
	dec b
.asm_3298d
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld d, a
	call Sine8_
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_329ab
	dec b
.asm_329ab
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_2af4

Func_329b6: ; 329b6 (c:69b6)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_329cf
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_329cf:
	dw Func_329dd
	dw Func_32ac4
	dw Func_32bf4
	dw Func_32d1b
	dw Func_32d5a
	dw Func_32ec9
	dw Func_32ec9

Func_329dd:
	ld a, [wCurObjectStruct + 1]
	ld h, a
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
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld c, a
	inc c
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	add $4c
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld hl, Data_32ac0
	and $3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, b
	ld [hl], a
	call Func_32a9d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32a6f: ; 32a6f (c:6a6f)
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	ld hl, $200
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, $c
	ld [wPrevROMBank], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, [hl]
	call LoadNthStdOBPalette
	ret

Func_32a93: ; 32a93 (c:6a93)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	ret z
Func_32a9d: ; 32a9d (c:6a9d)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, a
	dec c
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jr Func_32a6f

Data_32ac0:
	db 0, 3, 5, 6

Func_32ac4: ; 32ac4 (c:6ac4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a93
	call Func_30d14
	cp $12
	jp nc, Func_32bb1
	call GetDirectionFromObjectToPlayer
	ld de, Data_30efc
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wPlayerObjectStruct_Duration + 15]
	cp b
	jp nz, Func_32bb1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wcade]
	or a
	jr nz, .asm_32b16
	ld a, $1
	ld [wc9d8], a
	ld a, b
	ld [wcade], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, a
	call LoadItemNameAndQuantityTextbox_
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32bcd
	ld a, [wCurObjectStruct + 1]
	ld h, a
.asm_32b16
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_32bcc
	ld a, $0
	ld [hJoyNew], a
	ld a, [wSubroutine]
	cp $4
	jp nz, Func_32bcc
	call Func_32bb1
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_3091f
	ld d, h
	ld e, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, $20
	call CopyData_Under256Bytes
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ld a, [wPlayerObjectStruct_Duration + 17]
	or $4
	ld [wPlayerObjectStruct_Duration + 17], a
	ld a, $9
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 11], a
	ld hl, Data_2698
	ld a, [wPlayerObjectStruct_Duration + 15]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wCurPlayerFacing], a
	ld a, $1
	ld [wcadb], a
	ld bc, EVENT_C39
	call SetEventFlag
	ld bc, EVENT_C3A
	call ResetEventFlag
	ld a, [wMapNumber]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	call SetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	ld a, SFX_67
	ld [H_SFX_ID], a
	ret

Func_32bb1: ; 32bb1 (c:6bb1)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wcade]
	or a
	jr z, .asm_32bcb
	cp b
	jr nz, .asm_32bcb
	ld a, $0
	ld [wcade], a
.asm_32bcb
	ret

Func_32bcc: ; 32bcc (c:6bcc)
	ret

Func_32bcd: ; 32bcd (c:6bcd)
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld hl, ItemPrices
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(ItemPrices)
	call GetFarWord
	ld h, d
	ld l, e
	ld b, $0
	ld c, $9e
	ld d, $0
	call LoadItemPriceTextbox_
	ld a, $0
	ld [wTextSubfunction], a
	ret

Func_32bf4: ; 32bf4 (c:6bf4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a93
	call Func_32df3
	call Func_32e28
	ld bc, EVENT_C3D
	call CheckEventFlag
	jr z, .asm_32c19
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_33047
	ld bc, EVENT_C3D
	call ResetEventFlag
.asm_32c19
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	and $7
	jr nz, .asm_32c4b
	ld a, [hl]
	srl a
	srl a
	srl a
	sla a
	ld de, Data_31706
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $8
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [de]
	add [hl]
	ld [hli], a
	inc de
	ld a, [de]
	add [hl]
	ld [hl], a
.asm_32c4b
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $19
	jr nc, .asm_32c58
	inc a
	ld [hl], a
.asm_32c58
	ld de, wPlayerObjectStruct_Duration
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $8
.asm_32c63
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_32c63
	ld a, $1
	ld [wcadb], a
	ld a, [wPlayerObjectStruct_YCoord]
	cp $4f
	jr z, .asm_32c79
	cp $50
	jr nz, .asm_32c8e
.asm_32c79
	ld a, [wPlayerObjectStruct_Duration + 15]
	cp $3
	jr nz, .asm_32c8e
	ld a, [wPlayerObjectStruct_XCoord]
	cp $63
	jr c, .asm_32c8e
	ld a, $0
	ld [wcadb], a
	jr .asm_32c8e

.asm_32c8e
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 2, a
	jr z, .asm_32cb0
	ld a, [wCurPlayerFacing]
	cp $2d
	jr z, .asm_32ca5
	cp $30
	jr z, .asm_32ca5
	cp $33
	jr z, .asm_32ca5
	ret

.asm_32ca5
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$40
	call Func_2af4
	ret

.asm_32cb0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c7
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld hl, ItemPrices
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(ItemPrices)
	call GetFarWord
	ld a, [wcadc]
	ld l, a
	ld a, [wcadd]
	ld h, a
	add hl, de
	ld a, l
	ld [wcadc], a
	ld a, h
	ld [wcadd], a
Func_32cf5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld bc, EVENT_C3A
	call SetEventFlag
	ld a, [wMapNumber]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	inc bc
	call SetEventFlag
	inc bc
	call SetEventFlag
	inc bc
	call SetEventFlag
	ret

Func_32d1b: ; 32d1b (c:6d1b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, hFFF5
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_32d3c
	ld a, [wCurObjectStruct]
	ld l, a
	call ApplyYStepVector_
	ret

.asm_32d3c
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $4
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $64
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_32d5a: ; 32d5a (c:6d5a)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32df3
	call Func_32a93
	ld bc, EVENT_C3C
	call CheckEventFlag
	ret z
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld bc, EVENT_C3B
	call CheckEventFlag
	jr nz, .asm_32ddd
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wPlayerObjectStruct_XCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
.asm_32ddd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	call Func_32e0c
	ret

Func_32df3: ; 32df3 (c:6df3)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, $1
	or a
	jr z, .asm_32e04
.asm_32dff
	sla c
	dec a
	jr nz, .asm_32dff
.asm_32e04
	ld a, [wc946]
	or c
	ld [wc946], a
	ret

Func_32e0c: ; 32e0c (c:6e0c)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, $1
	or a
	jr z, .asm_32e1d
.asm_32e18
	sla c
	dec a
	jr nz, .asm_32e18
.asm_32e1d
	ld a, c
	cpl
	ld c, a
	ld a, [wc946]
	and c
	ld [wc946], a
	ret

Func_32e28: ; 32e28 (c:6e28)
	ld a, [wPlayerYTile]
	cp $3
	ret nz
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wPlayerObjectStruct_Duration + 15]
	cp $1
	ret nz
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	ld a, [wPlayerObjectStruct_Duration + 17]
	and $fb
	ld [wPlayerObjectStruct_Duration + 17], a
	ld a, $0
	ld [wcadb], a
	ld a, $e
	ld hl, Func_26ff
	call FarCall_HL
	ld a, [wc946]
	or a
	jr z, Func_32e9c
	call Func_32cf5
	add sp, $2
	ret

Func_32e9c:
	ld bc, EVENT_C39
	call ResetEventFlag
	ld bc, EVENT_C3A
	call ResetEventFlag
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
	add sp, $2
	ret

Func_32ec9: ; 32ec9 (c:6ec9)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $40
	ld [hl], a

	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3013
	ld b, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a

	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3013
	ld b, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a

	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $40
	jr z, .asm_32f53
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	cp $40
	jr c, .asm_32f48
	ld a, $40
.asm_32f48
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ret

.asm_32f53
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	call Func_33846
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $bf
	ld [hl], a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $6
	jp z, Func_33018
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_33047
	ld a, SFX_06
	ld [H_SFX_ID], a
	call PrintMoneyInShop_
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $58
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $24
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $8
	ld [wPlayerObjectStruct_Duration + 11], a
	call Func_32e9c
	ret

Func_33018: ; 33018 (c:7018)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_30926
	ld d, h
	ld e, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, $20
	call CopyData_Under256Bytes
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

Func_33047: ; 33047 (c:7047)
	push hl
	ld hl, wItems
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp $63
	jr nc, .asm_33059
	inc [hl]
	pop hl
	ret

.asm_33059
	ld a, $63
	ld [hl], a
	pop hl
	ret

Func_3305e: ; 3305e (c:705e)
	callba Func_2de3f
	callba Func_c8d9b
	ret

Func_3306f: ; 3306f (c:706f)
	ld hl, ItemSpriteGFX
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld d, h
	ld e, l
	bit 7, c
	jr z, .asm_33089
	ld hl, VTilesOB tile $7c
	jr .asm_33099

.asm_33089
	ld hl, VTilesOB tile $30
	ld a, c
	swap a
	sla a
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.asm_33099
	ld a, $2a
	ld bc, $40
	jp FarCopy2bpp_2

Func_330a1: ; 330a1 (c:70a1)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_330ba
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_330ba:
	dw Func_330be
	dw Func_330ec

Func_330be:
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
	ret

Func_330ec:
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
	cp $e
	jr c, .asm_3310d
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3310d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ret

Func_3311f:
	ld hl, wPlayerObjectStruct
	ld b, $16
	call Func_33886
	jr z, .asm_3317c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call OverworldRandom8_
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	and $3f
	add $24
	ld [hl], a
	bit 0, b
	jr z, .asm_33161
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $7b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $b0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $f4
	ld [hl], a
	ret

.asm_33161
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $74
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $c
	ld [hl], a
.asm_3317c
	ret

Func_3317d: ; 3317d (c:717d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33196
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_33196:
	dw Func_3319a
	dw Func_331d8

Func_3319a:
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
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $76
	ld [hl], a
Func_331d8:
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
	cp $40
	jr c, .asm_331f9
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_331f9
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $3
	ld [hl], a
	ld d, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add $3
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

Func_3322a:
	push de
	ld hl, wPlayerObjectStruct
	ld b, $17
	call Func_33886
	pop de
	jr z, .asm_33246
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, d
	ld [hl], a
.asm_33246
	ret

Func_33247: ; 33247 (c:7247)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33260
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_33260:
	dw Func_33264
	dw Func_332ad

Func_33264:
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
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, b
	ld [hl], a
Func_332ad:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	srl a
	add $2
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
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
	ld a, c
	cp $28
	jr c, .asm_332fc
	cp $62
	jr nc, .asm_332fc
	ld a, b
	cp $a4
	jr nc, .asm_332fc
	ret

.asm_332fc
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

Func_33303:
	ld hl, wPlayerObjectStruct
	ld b, $18
	call Func_33886
	jp z, .nope
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call OverworldRandom8_
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $72
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $96
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $10
	ld [hl], a
.nope
	ret

Func_3333d: ; 3333d (c:733d)
	callba Func_c83bc
	ret

Func_33346: ; 33346 (c:7346)
	callba Func_c8621
	ret

Func_3334f: ; 3334f (c:734f)
	callba Func_c885f
	ret

Func_33358: ; 33358 (c:7358)
	callba Func_c8f2d
	ret

Func_33361: ; 33361 (c:7361)
	callba Func_c91df
	ret

Func_3336a: ; 3336a (c:736a)
	push hl
	ld b, $1f
	push bc
	call Func_33886
	pop bc
	jr z, .asm_33390
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
.asm_33390
	pop hl
	ret

Func_33392: ; 33392 (c:7392)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_333ab
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_333ab:
	dw Func_333af
	dw Func_3342c
	dw Func_33478

Func_333af:
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
	ld a, $13
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
	ld a, $8
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $4c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $30
	ld c, $0
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ret

Func_3342c:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $1
	call Func_2ae7
	call Func_2acd
	callba Func_308b0 ; same bank
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_3346b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $38
	jr c, .asm_3346b
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ld a, SFX_0A
	ld [H_SFX_ID], a
	ret

.asm_3346b
	ld a, [wOverworldFrameCounter]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_33478:
	ret

Func_33479: ; 33479 (c:7479)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33492
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_33492:
	dw Func_33496
	dw Func_33508

Func_33496:
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
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wMapNumber]
	cp $16
	jr z, .asm_334e2
	cp $e
	jr z, .asm_334f5
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $48
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $48
	ld [hl], a
	ret

.asm_334e2
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $40
	ld [hl], a
	ret

.asm_334f5
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $5c
	ld [hl], a
	ret

Func_33508:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jr z, .asm_33519
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_33519
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, a
	call Cosine8_
	sra d
	sra d
	ld a, [wMapNumber]
	cp $16
	jr z, .asm_33540
	cp $e
	jr z, .asm_33540
	sra d
.asm_33540
	ld a, [wCurObjectStruct]
	add $8
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
	sra d
	sra d
	sra d
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ret

Func_33574: ; 33574 (c:7574)
	ld a, [wMapNumber]
	cp $16
	jr nz, .asm_3358e
	ld bc, EVENT_1F4
	call CheckEventFlag
	jr nz, .asm_3358e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_3358e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $13
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $10
	ld [hl], a
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	ld b, $8
	ld c, $0
.asm_335c7
	push bc
	ld b, $21
	call Func_33886
	jr z, .asm_335ee
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop bc
	add sp, $fe
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	pop bc
	ld a, c
	add $10
	ld c, a
	dec b
	jr nz, .asm_335c7
	pop hl
	ld [hl], $0
	ret

.asm_335ee
	add sp, $2
	pop hl
	ld [hl], $0
	ret

Func_335f4: ; 335f4 (c:75f4)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3360d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_3360d:
	dw AppendScriptIndexToBuffer7
	dw Func_33688

Func_33611: ; 33611 (c:7611)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, asm_33636
Func_3361c: ; 3361c (c:761c)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld de, GFX_e0320 + 4 tiles
	push hl
	ld a, BANK(GFX_e0320)
	ld hl, VTilesOB tile $7c
	ld bc, $40
	call FarCopy2bpp_2
	pop hl
asm_33636
	ret

AppendScriptIndexToBuffer7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	ld a, [wCurObjectStruct + 1]
	ld l, a
	jr z, .asm_33650
	ld [hl], $0
	ret

.asm_33650
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
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $3c
	ld [hl], a
	ld bc, EVENT_C02
	call ResetEventFlag
	call Func_3361c
Func_33688:
	call Func_336bd
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	jr z, .asm_336b9
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	jr nz, .asm_336b9
	ld bc, EVENT_C02
	call ResetEventFlag
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	call Func_336e5
	ld a, SFX_41
	ld [H_SFX_ID], a
	ret

.asm_336b9
	call Func_33611
	ret

Func_336bd: ; 336bd (c:76bd)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wPlayerObjectStruct_YCoord]
	cp $48
	jr nc, .asm_336d7
	ld a, [wIdleHUDVisible]
	or a
	jr z, .asm_336d7
	ld a, [hl]
	and $fe
	ld [hl], a
	ret

.asm_336d7
	ld a, [hl]
	or $1
	ld [hl], a
	ret

Func_336dc: ; 336dc (c:76dc)
	callba Func_3ac86
	ret

Func_336e5: ; 336e5 (c:76e5)
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $40
	ld [wPlayerObjectStruct_Duration + 11], a
	ld b, $40
	ld c, $0
	call SetUpScreenShake_
	ld b, $c
.asm_336f8
	push bc
	push hl
	ld b, $23
	call Func_33886
	jr z, .asm_3374b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call OverworldRandom8_
	ld a, d
	and $1f
	add $50
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, b
	ld [hl], a
	call OverworldRandom8_
	ld a, d
	and $1f
	add $18
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	call OverworldRandom16_
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	call Func_2af4
	ld bc, rJOYP
	call Func_2af4
	pop hl
	pop bc
	dec b
	jr nz, .asm_336f8
	ret

.asm_3374b
	pop hl
	pop bc
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_33756: ; 33756 (c:7756)
	callba Func_c9374
	ret

Func_3375f:
	push de
	ld a, BANK(GFX_e3494)
	ld hl, VTilesOB tile $60
	ld de, GFX_e3494
	ld bc, $80
	call FarCopy2bpp_2
	pop de
	ld hl, wPlayerObjectStruct
	ld b, $10
	ld c, $0
.asm_33776
	push bc
	push de
	ld b, $24
	call Func_33886
	jr z, .asm_337ad
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop de
	pop bc
	add sp, $fc
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, e
	ld [hl], a
	pop de
	pop bc
	ld a, c
	add $10
	ld c, a
	dec b
	jr nz, .asm_33776
	ret

.asm_337ad
	add sp, $4
	ret

Func_337b0: ; 337b0 (c:77b0)
	callba Func_3a7fd
	ret

Func_337b9: ; 337b9 (c:77b9)
	callba Func_3a996
	ret

Func_337c2:
	ld a, d
	ld [wCurObjectStruct + 1], a
	ld a, e
	ld [wCurObjectStruct], a
	ld h, d
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	push de
	dec hl
	ld a, [hl]
	add $10
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_337f1
.default
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $3
	ret

.asm_337f1
	ld a, [hl]
	add -$20
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_3380b
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $2
	ret

.asm_3380b
	ld a, [hl]
	add $10
	ld [hl], a
	inc hl
	ld a, [hl]
	add -$10
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_3382a
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $1
	ret

.asm_3382a
	ld a, [hl]
	add $20
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_33844
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $0
	ret

.asm_33844
	jr .default

Func_33846: ; 33846 (c:7846)
	ld c, a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld b, $0
	sra c
	rr b
	sra c
	rr b
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

Func_3385b: ; 3385b (c:785b)
	ld c, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $0
	sra c
	rr b
	sra c
	rr b
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

Func_33870: ; 33870 (c:7870)
	ld a, [wc98e]
	or a
	jr nz, .nope
	push hl
	push bc
	call Func_3091f
	pop bc
	pop de
	jr z, .nope2
	call Func_3389c
.nope2
	ret

.nope
	ld d, h
	ld e, l
	ret

Func_33886: ; 33886 (c:7886)
	ld a, [wc98e]
	or a
	jr nz, .asm_33899
	push hl
	push bc
	call Func_30918
	pop bc
	pop de
	jr z, .asm_33898
	call Func_3389c
.asm_33898
	ret

.asm_33899
	ld d, h
	ld e, l
	ret

Func_3389c: ; 3389c (c:789c)
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
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
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

Func_338f0: ; 338f0 (c:78f0)
	ld de, wPlayerObjectStruct
	ld hl, wOAMAnimation13
	jp Func_3389c

Func_338f9: ; 338f9 (c:78f9)
	ld de, wPartnerDenjuuObjectStruct
	ld hl, wOAMAnimation14
	call Func_3389c
	ld a, $0
	ld [wOAMAnimation14 + $19], a
	ret

Func_33908:
	ld a, [wc98d]
	cpl
	inc a
	sub $80
	ld [wc9e9], a
	jr asm_33942

Func_33914:
	ld a, [wc98d]
	cpl
	inc a
	add $80
	ld [wc9e9], a
	jr asm_33942

Func_33920:
	ld a, [wc98c]
	cpl
	inc a
	sub $a0
	ld [wc9e8], a
	jr asm_33936

Func_3392c:
	ld a, [wc98c]
	cpl
	inc a
	add $a0
	ld [wc9e8], a
asm_33936
	ld a, [wc98d]
	cpl
	inc a
	ld [wc9e9], a
	call Func_3394e
	ret

asm_33942
	ld a, [wc98c]
	cpl
	inc a
	ld [wc9e8], a
	call Func_3394e
	ret

Func_3394e: ; 3394e (c:794e)
	call GetMapHeaderAddress
.loop
	call CopyMapHeader
	push de
	ld de, wMapHeader
	ld a, [de]
	inc de
	cp $ff
	jr nz, .proceed
	ld a, [de]
	dec de
	cp $ff
	jr z, .done
.proceed
	call Func_30926
	jr z, .next
	ld de, wMapHeader
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	or b
	jr z, .always_visible
	bit 7, b
	jr z, .visible_if_set
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	call CheckEventFlag
	jr nz, .next
	jr .always_visible

.visible_if_set
	call CheckEventFlag
	jr z, .next
.always_visible
	call Func_339ad
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.next
	pop de
	jr .loop

.done
	pop de
	ret

Func_339ad: ; 339ad (c:79ad)
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	xor a
	ld b, $20
	call Func_2f76
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [de]
	push af
	inc de
	and $3f
	ld [hl], a
	call Func_33a62
	push de
	call Func_308b0
	pop de
	inc de
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld b, $3
	ld a, [de]
	and $1
	jr z, .asm_33a0a
	ld b, $7
.asm_33a0a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [de]
	ld b, a
	pop af
	swap a
	srl a
	srl a
	and $3
	or $80
	ld c, a
	ld a, b
	and $8
	jr z, .asm_33a2b
	ld [hl], c
	jr .asm_33a2d

.asm_33a2b
	ld [hl], $0
.asm_33a2d
	ld a, [de]
	and $2
	jr z, .asm_33a3c
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $80
	ld [hl], a
.asm_33a3c
	ld a, [de]
	and $60
	jr z, .asm_33a4b
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or b
	ld [hl], a
.asm_33a4b
	ld a, [de]
	and $10
	jr z, .asm_33a5a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $1
	ld [hl], a
.asm_33a5a
	ld a, [wc98e]
	or a
	ret z
	jp Func_309b8

Func_33a62: ; 33a62 (c:7a62)
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [de]
	and $f0
	add $8
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld a, [de]
	inc a
	swap a
	and $f0
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hl], a
	ret

Func_33a90: ; 33a90 (c:7a90)
	call Func_30926
	jr z, .asm_33ac3
	ld de, wMapHeader
	call Func_339ad
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld b, $3
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld [hl], $0
.asm_33ac3
	ret
