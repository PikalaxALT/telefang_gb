Func_38f8d: ; 38f8d (e:4f8d)
	ld a, [wcdb2]
	or a
	jr z, .asm_38fa6
	dec a
	ld [wcdb2], a
	or a
	jr nz, .asm_38fa6
	ld a, [wCurPlayerFacing]
	cp $1b
	jr c, .asm_38fa6
	sub $1b
	ld [wCurPlayerFacing], a
.asm_38fa6
	ld a, $3
	ld [wPlayerObjectStruct_PriorityFlags], a
	ld bc, EVENT_1C2
	call CheckEventFlag
	jr z, .asm_38fb8
	ld a, $2
	ld [wPlayerObjectStruct_PriorityFlags], a
.asm_38fb8
	ld a, [wPlayerObjectStruct_Duration]
	ld [wc9f0], a
	ld a, [wPlayerObjectStruct_Duration + 4]
	ld [wc9f2], a
	ld a, [wPlayerObjectStruct_Duration + 1]
	ld [wc9f1], a
	ld a, [wPlayerObjectStruct_Duration + 5]
	ld [wc9f3], a
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wCurXPixel], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wCurYPixel], a
	ld a, $0
	ld [wPlayerIsRunning], a
	ld [wc919], a
	ld a, [wTakingAStep]
	or a
	jr z, .asm_38fee
	dec a
	ld [wTakingAStep], a
.asm_38fee
	ld a, [wPlayerObjectStruct_Duration + 18]
	ld hl, Pointers_39045
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $14
	jr nc, .check_b_button
	ld a, [wPlayerNameEntryBuffer]
	or a
	ret nz
.check_b_button
	ld a, [hJoyLast]
	and B_BUTTON
	jr z, .not_running
	ld bc, EVENT_1DD
	call CheckEventFlag
	jr z, .not_running
	ld a, $1
	ld [wPlayerIsRunning], a
.not_running
	call ._hl_
	ld a, [wc919]
	cp $2
	jr z, .done
	ld a, $1
	ld [wc919], a
	ld a, [wCurXPixel]
	ld b, a
	ld a, [wPlayerObjectStruct_XCoord]
	cp b
	jr nz, .done
	ld a, [wCurYPixel]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	cp b
	jr nz, .done
	ld a, $0
	ld [wc919], a
.done
	ret

._hl_
	jp [hl]

Pointers_39045:
	dw Overworld_DPadInput ; 00
	dw Func_39f3e ; 01
	dw Func_39fbd ; 02
	dw Func_3a095 ; 03
	dw Func_3a026 ; 04
	dw Func_39c42 ; 05
	dw Func_39c4d ; 06
	dw Func_39c58 ; 07
	dw Func_39c63 ; 08
	dw Func_394ea ; 09
	dw Func_3939f ; 0a
	dw Func_39488 ; 0b
	dw Func_39479 ; 0c
	dw Func_39550 ; 0d
	dw Func_39598 ; 0e
	dw Overworld_SimulatedJoypadStates ; 0f
	dw Func_39075 ; 10
	dw Func_3952b ; 11
	dw Overworld_DPadInput ; 12
	dw Overworld_DPadInput ; 13
	dw Func_3932a ; 14
	dw Func_39298 ; 15
	dw Func_3939f ; 16
	dw Func_39497 ; 17

Func_39075: ; 39075 (e:5075)
	ld a, [wPlayerObjectStruct_Duration + 14]
	cp $0
	jr z, .asm_3908a
	cp $1
	jr z, .asm_390d9
	cp $2
	jp z, Func_39162
	cp $3
	jp z, Func_391c1
.asm_3908a
	ld a, [wPlayerObjectStruct_Duration + 14]
	inc a
	ld [wPlayerObjectStruct_Duration + 14], a
	ld de, wPlayerObjectStruct
	callba Func_337c2
	ld a, $0
	ld [wPlayerObjectStruct_TemplateIdx], a
	ld a, d
	ld [wPlayerObjectStruct_Duration + 12], a
	cp $3
	jr nz, .asm_390b0
	ld a, $1
	ld [wPlayerObjectStruct_TemplateIdx], a
	ld a, $2
.asm_390b0
	ld b, a
	add a
	add b
	ld [wCurPlayerFacing], a
	ld a, d
	cp $2
	jr nc, .asm_390ca
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wPlayerObjectStruct_Duration + 11], a
	callba Func_301c3
	ret

.asm_390ca
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wPlayerObjectStruct_Duration + 11], a
	callba Func_301c3
	ret

.asm_390d9
	ld a, [wPlayerObjectStruct_Duration + 13]
	inc a
	ld [wPlayerObjectStruct_Duration + 13], a
	cp $40
	jr c, .asm_390eb
	ld a, [wPlayerObjectStruct_Duration + 14]
	inc a
	ld [wPlayerObjectStruct_Duration + 14], a
.asm_390eb
	ld a, [wPlayerObjectStruct_Duration + 12]
	cp $3
	jr z, .asm_39114
	cp $2
	jr z, .asm_3912e
	cp $0
	jr z, .asm_39148
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld [wPlayerObjectStruct_YCoord], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	cp $20
	jr nc, .asm_39113
	and $8
	jr z, .asm_39113
	ld a, [wPlayerObjectStruct_YCoord]
	add -3
	ld [wPlayerObjectStruct_YCoord], a
.asm_39113
	ret

.asm_39114
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld [wPlayerObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	cp $20
	jr nc, .asm_3912d
	and $8
	jr z, .asm_3912d
	ld a, [wPlayerObjectStruct_XCoord]
	add 3
	ld [wPlayerObjectStruct_XCoord], a
.asm_3912d
	ret

.asm_3912e
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld [wPlayerObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	cp $20
	jr nc, .asm_39147
	and $8
	jr z, .asm_39147
	ld a, [wPlayerObjectStruct_XCoord]
	add -3
	ld [wPlayerObjectStruct_XCoord], a
.asm_39147
	ret

.asm_39148
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld [wPlayerObjectStruct_YCoord], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	cp $20
	jr nc, .asm_39161
	and $8
	jr z, .asm_39161
	ld a, [wPlayerObjectStruct_YCoord]
	add 3
	ld [wPlayerObjectStruct_YCoord], a
.asm_39161
	ret

Func_39162: ; 39162 (e:5162)
	ld a, [wc90d]
	cp $3a
	jr c, .asm_3916d
	cp $40
	jr c, .asm_3917c
.asm_3916d
	cp $30
	jr z, .asm_3917c
	cp $32
	jr z, .asm_3917c
	cp $25
	jr z, .asm_3917c
	call Func_2fb4
.asm_3917c
	ld b, a
	callba GetItemName
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld hl, sAddressBook + 6
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
	ld d, h
	ld e, l
	callba GetDenjuuNicknameFromAdddressBookOffset
	ld c, $aa
	ld a, [wc90d]
	cp $1d
	jr nz, .asm_391b4
	ld c, $ac
.asm_391b4
	ld b, $0
	call PrintMapObjectText_
	ld a, [wPlayerObjectStruct_Duration + 14]
	inc a
	ld [wPlayerObjectStruct_Duration + 14], a
	ret

Func_391c1: ; 391c1 (e:51c1)
	ld c, $97
	ld a, [wc90d]
	cp $1d
	jr nz, .asm_391f0
	ld hl, Data_aa369
	ld a, [wc912]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(Data_aa369)
	call GetFarByte
	ld c, $ad
	ld a, b
	or a
	jr z, .asm_391ee
	call Func_2fa0
	callba GetItemName
	ld c, $ae
.asm_391ee
	jr .asm_3926d

.asm_391f0
	cp $3a
	jr c, .asm_391f8
	cp $40
	jr c, .asm_39204
.asm_391f8
	cp $25
	jr z, .asm_39204
	cp $32
	jr z, .asm_39204
	cp $30
	jr nz, .asm_39208
.asm_39204
	ld c, $a9
	jr .asm_3926d

.asm_39208
	push bc
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
	ld hl, sAddressBook + 2
	add hl, bc
	enable_sram sAddressBook
	ld a, [hl]
	cp $64
	jr nc, .asm_39267
	push hl
	ld b, BANK(ItemPrices)
	ld hl, ItemPrices
	ld a, [wc90d]
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call GetFarByte
	ld c, b
	ld b, BANK(ItemPrices)
	inc hl
	call GetFarByte
	ld hl, $c8
	add hl, bc
	ld b, h
	ld c, l
	ld de, $c8
	callba Divide_BC_by_DE
	pop hl
	ld a, [hl]
	add c
	cp $64
	jr c, .asm_39266
	ld a, $64
.asm_39266
	ld [hl], a
.asm_39267
	disable_sram
	pop bc
.asm_3926d
	ld b, $0
	ld a, $97
	cp c
	jr nz, .asm_39285
	ld a, [wc90d]
	ld d, a
	ld hl, Data_3928e
.asm_3927b
	ld a, [hli]
	cp $ff
	jr z, .asm_39285
	cp d
	jr nz, .asm_3927b
	ld c, $ab
.asm_39285
	call PrintMapObjectText_
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ret

Data_3928e:
	db $00
	db $01
	db $02
	db $03
	db $04
	db $05
	db $06
	db $07
	db $17
	db $ff

Func_39298: ; 39298 (e:5298)
	callba Func_c81bf
	ld a, $10
	ld [wPlayerObjectStruct_Duration + 8], a
	ld hl, wCurObjectStruct
	ld a, wPlayerObjectStruct % $100
	ld [hli], a
	ld a, wPlayerObjectStruct / $100
	ld [hl], a
	ld hl, wPlayerObjectStruct
	ld a, [wc98c]
	ld d, a
	ld a, [wc98d]
	ld e, a
	xor a
	ld [wc98c], a
	ld [wc98d], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	push af
	push de
	callba Func_323e8
	ld a, b
	or a
	jr z, .asm_392d3
	ld c, $ff
.asm_392d3
	pop de
	ld a, d
	ld [wc98c], a
	ld a, e
	ld [wc98d], a
	pop af
	ld d, a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp d
	jr z, .asm_392fa
	call StopPlayerWalkingAnimation
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $ff
	ld [wPlayerObjectStruct_Duration + 12], a
	ld a, $0
	ld [wCurStandingTile], a
	call Func_2c94
	ret

.asm_392fa
	ld d, $0
	ld a, c
	cp $ff
	ret z
	and $f
	cp $9
	jr c, .asm_39309
	sub $3
	inc d
.asm_39309
	ld a, a
	ld [wCurPlayerFacing], a
	ld a, d
	ld [wPlayerObjectStruct_TemplateIdx], a
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 2, a
	jp z, Func_39321
	ld a, [wCurPlayerFacing]
	add $2d
	ld [wCurPlayerFacing], a
Func_39321: ; 39321 (e:5321)
	ret

Data_39322:
	db $1c, $58
	db $28, $58
	db $20, $58
	db $24, $58

Func_3932a: ; 3932a (e:532a)
	ld hl, wPlayerObjectStruct
	call Func_2acd
	ld a, $0
	ld [wTakingAStep], a
	call Func_39bfa
	ld a, [wPlayerObjectStruct_Duration + 14]
	ld b, a
	ld hl, Data_3938d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wPlayerObjectStruct_YCoord]
	add [hl]
	ld [wPlayerObjectStruct_YCoord], a
	inc b
	ld a, b
	cp 18
	jr c, .okay
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	callba Func_c81bf
	call Func_39371
	callba Func_31588
	call Func_2c94
.okay
	ld [wPlayerObjectStruct_Duration + 14], a
	ret

Func_39371: ; 39371 (e:5371)
	ld b, $0
	ld a, [wCurStandingTile]
	cp $4
	jr z, .four_nine
	cp $9
	jr z, .four_nine
	cp $3
	jr nz, .done
	ld b, $2
	jr .done

.four_nine
	ld b, $1
.done
	ld a, b
	ld [wca5e], a
	ret

Data_3938d:
	db  -4,  -7, -10, -13, -15, -16, -17, -18, -18
	db -18, -17, -16, -15, -13, -10,  -7,  -4,   0

Func_3939f: ; 3939f (e:539f)
	ld a, $10
	ld [wTakingAStep], a
	ld a, $2
	ld [wc919], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	or a
	jr z, .asm_393c4
	dec a
	ld [wPlayerObjectStruct_Duration + 13], a
	or a
	ret nz
	ld hl, wPlayerObjectStruct_Duration + 6
	ld a, $80
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, $9
	ld [wCurPlayerFacing], a
	ret

.asm_393c4
	ld hl, wPlayerObjectStruct
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $16
	jr nz, .asm_393e5
	ld a, [wPlayerObjectStruct_Duration + 14]
	cp $1
	jr c, .asm_393e5
	ld bc, -$20
	cp $2
	jr c, .asm_393df
	ld bc, -$8
.asm_393df
	call Func_2b01
	call Func_39c1c
.asm_393e5
	ld hl, wPlayerObjectStruct
	ld bc, $10
	call Func_2ae7
	call ApplyYStepVector_
	call Func_39c2f
	ld a, [wPlayerObjectStruct_Duration + 2]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	sub b
	jr c, .asm_39478
	cp $10
	jr nc, .asm_39478
	ld a, [wCurStandingTile]
	cp $a
	jr z, .asm_39446
	ld a, SFX_3F
	ld [H_SFX_ID], a
	xor a
	ld a, [wPlayerObjectStruct_Duration + 2]
	ld [wPlayerObjectStruct_YCoord], a
	call Func_39bd5
	callba Func_31588
	ld b, $2
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $16
	jr nz, .asm_3942b
	ld b, $4
.asm_3942b
	ld a, [wPlayerObjectStruct_Duration + 14]
	inc a
	ld [wPlayerObjectStruct_Duration + 14], a
	cp b
	jr nz, .asm_39456
	ld a, $0
	ld [wCurPlayerFacing], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $16
	jr nz, .asm_39446
	ld a, $9
	ld [wCurPlayerFacing], a
.asm_39446
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $1c
	ld [wPlayerObjectStruct_Duration + 11], a
	ld a, $0
	ld [wc919], a
	ret

.asm_39456
	cp $2
	jr c, .asm_39461
	ld a, $2
	ld [wPlayerObjectStruct_Duration + 13], a
	jr .asm_39466

.asm_39461
	ld a, $c
	ld [wPlayerObjectStruct_Duration + 13], a
.asm_39466
	ld a, $a
	ld [wCurPlayerFacing], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $16
	jr nz, .asm_39477
	ld a, $60
	ld [wPlayerObjectStruct_Duration + 2], a
.asm_39477
	ret

.asm_39478
	ret

Func_39479: ; 39479 (e:5479)
	ld a, [wPlayerObjectStruct_Duration + 13]
	dec a
	ld [wPlayerObjectStruct_Duration + 13], a
	jr nz, .asm_39487
	ld a, $9
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_39487
	ret

Func_39488: ; 39488 (e:5488)
	ld a, [wPlayerObjectStruct_Duration + 11]
	dec a
	ld [wPlayerObjectStruct_Duration + 11], a
	jr nz, .asm_39496
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_39496
	ret

Func_39497: ; 39497 (e:5497)
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 20], a
	ld a, [wPlayerObjectStruct_Duration + 11]
	dec a
	ld [wPlayerObjectStruct_Duration + 11], a
	jr nz, .asm_394d9
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, [wcd51]
	ld [wScriptNumber + 1], a
	ld b, a
	ld a, [wCurMapScripts]
	ld [wScriptNumber], a
	cp $ff
	jr nz, .asm_394c0
	ld a, b
	cp $ff
	jr z, .asm_394d8
.asm_394c0
	ld a, $1
	ld [wPlayerNameEntryBuffer], a
	ld a, $0
	ld [wScriptDelay], a
	ld a, $0
	ld [wScriptBank], a
	ld hl, wScriptOffset
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_394d8
	ret

.asm_394d9
	cp $40
	jr nz, .asm_394d8
	ld b, $40
	ld c, $1
	call Func_341d
	ld a, SFX_41
	ld [H_SFX_ID], a
	ret

Func_394ea: ; 394ea (e:54ea)
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld hl, Data_39517
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ld a, [wCurPlayerFacing]
	sub b
	ld [wCurPlayerFacing], a
	ld a, [wPlayerObjectStruct_Duration + 11]
	inc a
	ld [wPlayerObjectStruct_Duration + 11], a
	cp $14
	jr c, .asm_39516
	ld a, [wCurPlayerFacing]
	add $9
	ld [wCurPlayerFacing], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_39516
	ret

Data_39517:
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0
	db  0,  0
	db  1,  0
	db  0,  0
	db  0,  0

Func_3952b: ; 3952b (e:552b)
	ld a, [wPlayerObjectStruct_Duration + 11]
	ld hl, Data_39517
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ld a, [wCurPlayerFacing]
	add b
	ld [wCurPlayerFacing], a
	ld a, [wPlayerObjectStruct_Duration + 11]
	inc a
	ld [wPlayerObjectStruct_Duration + 11], a
	cp $14
	jr c, .asm_3954f
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_3954f
	ret

Func_39550: ; 39550 (e:5550)
	ld a, [wPlayerObjectStruct_Duration + 12]
	dec a
	ld [wPlayerObjectStruct_Duration + 12], a
	jr nz, .asm_39595
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, [wc9df]
	ld b, a
	ld a, [wPlayerXTile]
	cp b
	jp nz, Overworld_DPadInput
	ld a, [wc9e0]
	ld b, a
	ld a, [wPlayerYTile]
	cp b
	jp nz, Overworld_DPadInput
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
	ret

.asm_39595
	jp Overworld_DPadInput

Func_39598: ; 39598 (e:5598)
	ld a, [wPlayerObjectStruct_Duration + 13]
	add $2
	cp $40
	jr nc, .asm_395a4
	ld [wPlayerObjectStruct_Duration + 13], a
.asm_395a4
	ld a, [wc9df]
	swap a
	and $f0
	add $8
	ld e, a
	ld a, [wPlayerObjectStruct_Duration + 2]
	ld c, a
	ld a, [wPlayerObjectStruct_Duration + 13]
	ld b, a
	call Func_3013
	ld a, l
	ld [wPlayerObjectStruct_XCoord], a
	call Func_39be9
	ld a, [wc9e0]
	inc a
	and $f
	swap a
	ld e, a
	ld a, [wPlayerObjectStruct_Duration + 6]
	ld c, a
	ld a, [wPlayerObjectStruct_Duration + 13]
	ld b, a
	call Func_3013
	ld a, l
	ld [wPlayerObjectStruct_YCoord], a
	call Func_39bd5
	ld a, [wc984]
	and $3
	ret nz
	ld a, [wCurPlayerFacing]
	inc a
	ld [wCurPlayerFacing], a
	cp $1a
	ret nz
	ld a, [wCurTilesetIdx]
	cp $8
	jr z, .asm_39631
	cp $10
	jr z, .asm_395ff
	ld a, [wMapGroup]
	dec a
	ld [wMapGroup], a
	jr .asm_39606

.asm_395ff
	ld a, [wMapGroup]
	inc a
	ld [wMapGroup], a
.asm_39606
	ld a, $2
	ld [wPhoneCallSubroutine], a
	ld a, [wc9df]
	swap a
	and $f0
	add $8
	ld [wc901], a
	ld a, [wc9e0]
	inc a
	and $f
	swap a
	ld [wc902], a
	ld a, BANK(Func_39598)
	ld [wPrevROMBank], a
	ld a, $7
	ld [wSubroutine], a
	ld a, $4
	jp StartFade_

.asm_39631
	callba Func_c8802
	ret

Overworld_SimulatedJoypadStates: ; 3963a (e:563a)
	ld a, $0
	ld [wc989], a
	ld a, [wPlayerObjectStruct_Duration + 13]
	dec a
	ld [wPlayerObjectStruct_Duration + 13], a
	jr nz, .simulate_dpad
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ret

.simulate_dpad
	ld a, [wPlayerObjectStruct_Duration + 12]
	cp $c
	jr z, .force_walk_up
	cp $d
	jr z, .force_walk_down
	cp $e
	jr z, .force_walk_right
	ld a, D_LEFT
	jr asm_39674

.force_walk_right
	ld a, D_RIGHT
	jr asm_39674

.force_walk_up
	ld a, D_UP
	jr asm_39674

.force_walk_down
	ld a, D_DOWN
	jr asm_39674

Overworld_DPadInput: ; 3966d (e:566d)
	ld a, $0
	ld [wc989], a
	ld a, [hJoyLast]
asm_39674
	ld b, a
	and $f0
	push af
	jr z, .no_dpad_input
	ld a, [wPlayerIsRunning]
	or a
	jr z, .skip_wca6e
	ld a, [wca6e]
	inc a
	cp $14
	jr c, .asm_39689
	xor a
.asm_39689
	ld [wca6e], a
.skip_wca6e
	ld a, [wTakingAStep]
	or a
	jr nz, .do_dpad_input
	ld a, $1
	ld [wTakingAStep], a
	jr .do_dpad_input

.no_dpad_input
	ld a, $0
	ld [wca6e], a
.do_dpad_input
	pop af
	swap a
	and $f
	ld hl, Pointers_396c7
	add a
	ld b, a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	ld a, [wc98e]
	or a
	jr nz, .finish
	call Func_2509
	ld a, [wSubroutine]
	cp $4
	jr nz, .finish
	call Func_256e
.finish
	ret

._hl_
	jp [hl]

Pointers_396c7:
	dw Overworld_NoMovement
	dw Overworld_MoveRight
	dw Overworld_MoveLeft
	dw Overworld_NoMovement
	dw Overworld_MoveUp
	dw Overworld_MoveUpRight
	dw Overworld_MoveUpLeft
	dw Overworld_MoveUp
	dw Overworld_MoveDown
	dw Overworld_MoveDownRight
	dw Overworld_MoveDownLeft
	dw Overworld_MoveDown
	dw Overworld_NoMovement
	dw Overworld_MoveRight
	dw Overworld_MoveLeft
	dw Overworld_NoMovement

step_vector: MACRO
; speed, running
speed = \1 >> \2
negsp = ((-\1) & $ffff) >> \2
diag = (\1 * $b2) >> 8
negdg = ((-diag) & $ffff) >> \2
diag = diag >> \2
	dw 0, 0
	dw speed, 0
	dw negsp, 0
	dw 0, 0

	dw 0, negsp
	dw diag, negdg
	dw negdg, negdg
	dw 0, negsp

	dw 0, speed
	dw diag, diag
	dw negdg, diag
	dw 0, diag ; whoopsie!

	dw 0, 0
	dw speed, 0
	dw negsp, 0
	dw 0, 0
	ENDM

RunningStepVectors: step_vector $80, 0
StepVectors: step_vector $80, 1
SpecialRunningStepVectors: step_vector $55, 0
SpecialStepVectors: step_vector $55, 1

Overworld_NoMovement:
	call StopPlayerWalkingAnimation
	ld a, [wNumIdleFrames]
	inc a
	jr nz, .idle_inc
	cpl
.idle_inc
	ld [wNumIdleFrames], a
	ld a, [wCurTilesetIdx]
	cp $7
	jr nz, .not_tileset_7
	ld a, [wCurStandingTile]
	cp $c
	jr z, .apply_forced_movement
	cp $d
	jr z, .apply_forced_movement
	cp $f
	jr z, .apply_forced_movement
	cp $e
	jr nz, .not_tileset_7
.apply_forced_movement
	ld [wPlayerObjectStruct_Duration + 12], a
	ld a, $f
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $10
	ld [wPlayerObjectStruct_Duration + 13], a
.not_tileset_7
	ret

Data_3981c:
	db $86, $87, $86, $88

Data_39820:
	db $06, $07, $06, $08

Data_39824:
	db $03, $04, $03, $05

Data_39828:
	db $00, $01, $00, $02

StopPlayerWalkingAnimation: ; 3982c (e:582c)
	ld c, $0
	ld a, [wCurPlayerFacing]
	cp $2d
	jr c, .no_sub_2d
	ld c, $2d
	sub c
.no_sub_2d
	cp $24
	jr c, .no_sub_24
	ld c, $0
	sub $24
.no_sub_24
	cp $1b
	jr c, .no_sub_1b
	ld c, $1b
	sub c
.no_sub_1b
	ld b, $0
	sub $3
	jr c, .less_3_or_less_6
	ld b, $3
	sub $3
	jr c, .less_3_or_less_6
	ld b, $6
.less_3_or_less_6
	ld a, b
	add c
	ld [wCurPlayerFacing], a
	ret

Overworld_MoveUp: ; 3985b (e:585b)
	callba EndOverworldIdleState
	call .WalkUp
	ld a, [wPlayerObjectStruct_Duration + 2]
	or a
	ret z
	ld a, [wPlayerObjectStruct_Duration + 3]
	bit 7, a
	jp nz, Func_3996e
	jp Func_399d1

.WalkUp: ; 39876 (e:5876)
	ld a, $1
	ld [wPlayerObjectStruct_Duration + 15], a
	call UpdatePlayerFacing
PlayerStep_Up:
	ld hl, wPlayerObjectStruct
	call ApplyYStepVector_
	call Func_39c2f
	ld a, $1
	call Func_39ad0
	ld a, [wPlayerObjectStruct_YCoord]
	cp $f0
	jr nc, .asm_39897
	cp $10
	jr nc, .asm_398b7
.asm_39897
	ld a, $10
	ld [wPlayerObjectStruct_YCoord], a
	ld hl, wPlayerObjectStruct_Duration + 4
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	ld a, $1
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, -8
	call GetEdgeConnection
	callba Func_33908
.asm_398b7
	ret

Overworld_MoveDown: ; 398b8 (e:58b8)
	callba EndOverworldIdleState
	call .WalkDown
	ld a, [wPlayerObjectStruct_Duration + 2]
	or a
	ret z
	ld a, [wPlayerObjectStruct_Duration + 3]
	bit 7, a
	jp nz, Func_3996e
	jp Func_399d1

.WalkDown: ; 398d3 (e:58d3)
	ld a, $3
	ld [wPlayerObjectStruct_Duration + 15], a
	call UpdatePlayerFacing
PlayerStep_Down:
	ld hl, wPlayerObjectStruct
	call ApplyYStepVector_
	call Func_39c2f
	ld a, $3
	call Func_39ad0
	ld a, [wPlayerObjectStruct_YCoord]
	cp $81
	jr c, .asm_39916
	ld a, $81
	ld [wPlayerObjectStruct_YCoord], a
	ld hl, wPlayerObjectStruct_Duration + 4
	ld a, $40
	ld [hli], a
	ld a, $20
	ld [hl], a
	ld a, $2
	ld [wPlayerObjectStruct_Duration + 18], a
	ld bc, $200
	call Func_2b0e
	ld a, 8
	call GetEdgeConnection
	callba Func_33914
.asm_39916
	ret

GetEdgeConnection: ; 39917 (e:5917)
; a: direction
;  8: down
; -8: up
; -1: left
;  1: right

	push af
	ld a, [wMapNumber]
	ld [wc90f], a
	pop bc
	callba Func_2e1fd
	ld a, $f
	ld [wPlayerXTile], a
	ld [wPlayerYTile], a
	ld a, $0
	ld [wc980], a
	ld a, $1
	ld [wc98e], a
	call LoadTilesetRegisters
	ld a, $c
	ld hl, Func_2b98
	call FarCall_HL ; Func_2b98 does not read any data
	call LoadMapBlockdataAndScriptHeader
	ld a, [wOverworldRingtoneSubroutine]
	or a
	ret nz
	call PlayMapMusic_
	ret

Overworld_MoveLeft: ; 39950 (e:5950)
	callba EndOverworldIdleState
	call .WalkLeft
	ld a, [wPlayerObjectStruct_Duration + 6]
	or a
	ret z
	ld a, [wPlayerObjectStruct_Duration + 7]
	bit 7, a
	jp nz, PlayerStep_Up
	jp PlayerStep_Down

.WalkLeft: ; 3996b (e:596b)
	call PlayerStep_Left
Func_3996e: ; 3996e (e:596e)
	ld hl, wPlayerObjectStruct
	call ApplyXStepVector_
	call Func_39c1c
	ld a, $2
	call Func_39a94
	ld a, [wPlayerObjectStruct_XCoord]
	cp $f0
	jr nc, .off_screen
	cp $8
	jr nc, .finish
.off_screen
	ld a, $8
	ld [wPlayerObjectStruct_XCoord], a
	ld hl, wPlayerObjectStruct_Duration
	ld a, $0
	ld [hli], a
	ld a, $2
	ld [hl], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $f
	jr z, .asm_399a0
	cp $0
	jr nz, .finish
.asm_399a0
	ld a, $3
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, -1
	call GetEdgeConnection
	callba Func_33920
.finish
	ret

Overworld_MoveRight: ; 399b3 (e:59b3)
	callba EndOverworldIdleState
	call .WalkRight
	ld a, [wPlayerObjectStruct_Duration + 6]
	or a
	ret z
	ld a, [wPlayerObjectStruct_Duration + 7]
	bit 7, a
	jp nz, PlayerStep_Up
	jp PlayerStep_Down

.WalkRight: ; 399ce (e:59ce)
	call PlayerStep_Right
Func_399d1: ; 399d1 (e:59d1)
	ld hl, wPlayerObjectStruct
	call ApplyXStepVector_
	call Func_39c1c
	ld a, $0
	call Func_39a94
	ld a, [wPlayerObjectStruct_XCoord]
	cp $99
	jr c, .skip
	ld a, $99
	ld [wPlayerObjectStruct_XCoord], a
	ld hl, wPlayerObjectStruct_Duration
	ld a, $40
	ld [hli], a
	ld a, $26
	ld [hl], a
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $f
	jr z, .edge_connection
	cp $0
	jr nz, .skip
.edge_connection
	ld a, $4
	ld [wPlayerObjectStruct_Duration + 18], a
	ld bc, $14
	call Func_2b1b
	ld a, [wBGMapAnchor + 1]
	ld [wc983], a
	ld a, [wBGMapAnchor]
	ld [wc982], a
	ld a, 1
	call GetEdgeConnection
	callba Func_3392c
.skip
	ret

Overworld_MoveUpRight: ; 39a24 (e:5a24)
	callba EndOverworldIdleState
	ld a, $1
	ld [wc989], a
	call PlayerStep_Right
	call PlayerStep_Up
	ld a, [wc98e]
	or a
	ret nz
	call Func_399d1
	ret

Overworld_MoveDownRight: ; 39a40 (e:5a40)
	callba EndOverworldIdleState
	ld a, $1
	ld [wc989], a
	call PlayerStep_Right
	call PlayerStep_Down
	ld a, [wc98e]
	or a
	ret nz
	call Func_399d1
	ret

Overworld_MoveDownLeft: ; 39a5c (e:5a5c)
	callba EndOverworldIdleState
	ld a, $1
	ld [wc989], a
	call PlayerStep_Left
	call PlayerStep_Down
	ld a, [wc98e]
	or a
	ret nz
	call Func_3996e
	ret

Overworld_MoveUpLeft: ; 39a78 (e:5a78)
	callba EndOverworldIdleState
	ld a, $1
	ld [wc989], a
	call PlayerStep_Left
	call PlayerStep_Up
	ld a, [wc98e]
	or a
	ret nz
	call Func_3996e
	ret

Func_39a94: ; 39a94 (e:5a94)
	call Func_39cbe
	jr z, .asm_39aca
	ld a, [wCurStandingTile]
	cp $e
	jr c, .asm_39ab7
	cp $10
	jr nc, .asm_39ab7
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 14], a
	ld b, $7
	ld a, [hJoyLast]
	and D_RIGHT
	jr z, .asm_39ab3
	ld b, $8
.asm_39ab3
	ld a, b
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_39ab7
	ld a, [wCurXPixel]
	ld [wPlayerObjectStruct_XCoord], a
	ld a, [wc9f0]
	ld [wPlayerObjectStruct_Duration], a
	ld a, [wc9f1]
	ld [wPlayerObjectStruct_Duration + 1], a
	ret

.asm_39aca
	call Func_39ebe
	jr nz, .asm_39ab7
	ret

Func_39ad0: ; 39ad0 (e:5ad0)
	call Func_39cbe
	jr z, .asm_39b06
	ld a, [wCurStandingTile]
	cp $c
	jr c, .asm_39af3
	cp $e
	jr nc, .asm_39af3
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 14], a
	ld b, $5
	ld a, [hJoyLast]
	and D_DOWN
	jr z, .asm_39aef
	ld b, $6
.asm_39aef
	ld a, b
	ld [wPlayerObjectStruct_Duration + 18], a
.asm_39af3
	ld a, [wCurYPixel]
	ld [wPlayerObjectStruct_YCoord], a
	ld a, [wc9f2]
	ld [wPlayerObjectStruct_Duration + 4], a
	ld a, [wc9f3]
	ld [wPlayerObjectStruct_Duration + 5], a
	ret

.asm_39b06
	call Func_39ebe
	jr nz, .asm_39af3
	ret

PlayerStep_Right: ; 39b0c (e:5b0c)
	ld a, [wPlayerObjectStruct_Duration + 17]
	res 0, a
	ld [wPlayerObjectStruct_Duration + 17], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 15], a
	jr UpdatePlayerFacing

PlayerStep_Left: ; 39b1b (e:5b1b)
	ld a, [wPlayerObjectStruct_Duration + 17]
	set 0, a
	ld [wPlayerObjectStruct_Duration + 17], a
	ld a, $2
	ld [wPlayerObjectStruct_Duration + 15], a
UpdatePlayerFacing: ; 39b28 (e:5b28)
	ld a, [wPlayerObjectStruct_Duration + 15]
	ld hl, Pointers_39bca
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPlayerObjectStruct_Duration + 11]
	inc a
	ld [wPlayerObjectStruct_Duration + 11], a
	ld d, a
	srl d
	srl d
	ld a, [wPlayerIsRunning]
	or a
	jr nz, .normal_speed
	srl d
.normal_speed
	ld a, d
	and $3
	ld d, $0
	ld e, a
	add hl, de
	ld d, $0
	ld a, [hl]
	bit 7, a
	jr z, .not_going_right
	ld d, $1
.not_going_right
	and $7f
	ld [wCurPlayerFacing], a
	ld a, [wcdb2]
	or a
	jr z, .okay
	ld a, [wCurPlayerFacing]
	add $1b
	ld [wCurPlayerFacing], a
	jr .get_step_vector

.okay
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 2, a
	jp z, .get_step_vector
	ld a, [wCurPlayerFacing]
	add $2d
	ld [wCurPlayerFacing], a
.get_step_vector
	ld a, d
	ld [wPlayerObjectStruct_TemplateIdx], a
	ld a, [wCurStandingTile]
	cp $7
	jr z, .three_four_seven_nine
	ld a, [wCurStandingTile]
	cp $3
	jr c, .not_three_four_seven_nine
	cp $5
	jr c, .three_four_seven_nine
	cp $9
	jr nz, .not_three_four_seven_nine
.three_four_seven_nine
	ld hl, SpecialStepVectors
	ld a, [wPlayerIsRunning]
	or a
	jr z, .got_data
	ld hl, SpecialRunningStepVectors
	jr .got_data

.not_three_four_seven_nine
	ld hl, StepVectors
	ld a, [wPlayerIsRunning]
	or a
	jr z, .got_data
	ld hl, RunningStepVectors
.got_data
	ld a, b
	add a
	ld e, a
	ld d, $0
	add hl, de
	ld de, wPlayerObjectStruct_Duration + 2
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	inc de
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Pointers_39bca:
	dw Data_3981c
	dw Data_39824
	dw Data_39820
	dw Data_39828

Func_39bd2:
	ld a, [wc902]
Func_39bd5: ; 39bd5 (e:5bd5)
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld hl, wPlayerObjectStruct_Duration + 4
	ld [hl], b
	inc hl
	ld [hl], a
	ret

Func_39be6:
	ld a, [wc901]
Func_39be9: ; 39be9 (e:5be9)
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld hl, wPlayerObjectStruct_Duration
	ld [hl], b
	inc hl
	ld [hl], a
	ret

Func_39bfa: ; 39bfa (e:5bfa)
	ld de, wPlayerObjectStruct_XCoord
	ld hl, wPlayerObjectStruct_Duration
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
	ret

Func_39c1c: ; 39c1c (e:5c1c)
	ld de, wPlayerObjectStruct_XCoord
	ld hl, wPlayerObjectStruct_Duration
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
	ret

Func_39c2f: ; 39c2f (e:5c2f)
	ld de, wPlayerObjectStruct_YCoord
	ld hl, wPlayerObjectStruct_Duration + 4
	ld a, [hli]
	ld c, a
	ld a, [hl]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
	ret

Func_39c42: ; 39c42 (e:5c42)
	ld hl, wPlayerObjectStruct
	ld bc, -$40
	call Func_2af4
	jr asm_39c6c

Func_39c4d: ; 39c4d (e:5c4d)
	ld hl, wPlayerObjectStruct
	ld bc, $40
	call Func_2af4
	jr asm_39c6c

Func_39c58: ; 39c58 (e:5c58)
	ld hl, wPlayerObjectStruct
	ld bc, -$40
	call Func_2b01
	jr asm_39c6c

Func_39c63:
	ld hl, wPlayerObjectStruct
	ld bc, $40
	call Func_2b01
asm_39c6c
	ld a, $12
	ld [wTakingAStep], a
	call Func_39bfa
	ld a, [wPlayerObjectStruct_Duration + 14]
	ld b, a
	ld hl, Data_39ca4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wPlayerObjectStruct_YCoord]
	add [hl]
	ld [wPlayerObjectStruct_YCoord], a
	inc b
	ld a, b
	cp $1a
	jr c, .asm_39ca0
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	callba Func_31588
	ld a, $0
	ld [wCurStandingTile], a
.asm_39ca0
	ld [wPlayerObjectStruct_Duration + 14], a
	ret

Data_39ca4:
	db  -4,  -7, -10, -13, -15, -16, -17, -18, -18, -18, -18, -18, -18
	db -18, -18, -18, -18, -18, -17, -16, -15, -13, -10,  -7,  -4,   0

Func_39cbe: ; 39cbe (e:5cbe)
	ld [wMathBuffer3], a
	push af
	ld a, [wc98e]
	or a
	jr z, .asm_39ccc
	add sp, $2
	xor a
	ret

.asm_39ccc
	pop af
	call Func_39ce0
	push hl
	ld hl, Pointers_39eae
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_39ce0: ; 39ce0 (e:5ce0)
	ld hl, Data_39eb6
	push af
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wPlayerObjectStruct_XCoord]
	add [hl]
	add $ff
	ld b, a
	and $f
	ld [wPlayerXTile], a
	ld a, b
	swap a
	and $f
	cp $a
	jr nc, .asm_39d5c
	ld [wc9c3], a
	push af
	inc hl
	ld a, [wPlayerObjectStruct_YCoord]
	add [hl]
	add -6
	ld b, a
	and $f
	ld [wPlayerYTile], a
	ld a, b
	swap a
	and $f
	cp $8
	jr nc, .asm_39d5b
	ld [wc9c4], a
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
	pop af
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, l
	ld [wc9c0], a
	ld a, h
	ld [wc9c1], a
	ld a, [hl]
	ld b, a
	push af
	push hl
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	ld [wc9c2], a
	pop hl
	pop bc
	pop af
	ret

.asm_39d5b
	pop af
.asm_39d5c
	pop af
	add sp, $2
	xor a
	ld [wc9c1], a
	ret

Func_39d64:
	ld c, $0
	pop hl
	ld a, [wPlayerYTile]
	cp $4
	jr c, .asm_39d88
	cp $b
	jr nc, .asm_39d88
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr .asm_39e07

.asm_39d88
	cp $8
	jr c, .asm_39d91
	ld de, $a
	jr .asm_39d94

.asm_39d91
	ld de, -10
.asm_39d94
	add hl, de
	ld d, [hl]
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr z, .asm_39dad
	inc c
.asm_39dad
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr z, .asm_39dc5
	inc c
	inc c
.asm_39dc5
	ld a, [wPlayerYTile]
	cp $3
	jr c, .asm_39dd5
	cp $c
	jr nc, .asm_39dd5
	ld a, c
	cp $1
	jr nz, .asm_39e06
.asm_39dd5
	ld a, [wc989]
	or a
	jr nz, .asm_39e06
	ld a, c
	cp $1
	jr nz, .asm_39df2
	ld a, [wPlayerYTile]
	cp $8
	jr c, .asm_39dfd
.asm_39de7
	ld hl, wPlayerObjectStruct_Duration + 6
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_39e06

.asm_39df2
	cp $2
	jr nz, .asm_39e06
	ld a, [wPlayerYTile]
	cp $8
	jr c, .asm_39de7
.asm_39dfd
	ld hl, wPlayerObjectStruct_Duration + 6
	ld a, $20
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_39e06
	ld a, c
.asm_39e07
	or a
	ret

Func_39e09:
	ld c, $0
	pop hl
	ld a, [wPlayerXTile]
	cp $4
	jr c, .asm_39e2d
	cp $b
	jr nc, .asm_39e2d
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr .asm_39eac

.asm_39e2d
	cp $8
	jr c, .asm_39e36
	ld de, $1
	jr .asm_39e39

.asm_39e36
	ld de, -1
.asm_39e39
	add hl, de
	ld d, [hl]
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr z, .asm_39e52
	inc c
.asm_39e52
	ld a, [wCurTilesetCollisionPointer + 1]
	ld h, a
	ld a, [wCurTilesetCollisionPointer]
	ld l, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	call Func_2c29
	and $f0
	jr z, .asm_39e6a
	inc c
	inc c
.asm_39e6a
	ld a, [wPlayerXTile]
	cp $3
	jr c, .asm_39e7a
	cp $c
	jr nc, .asm_39e7a
	ld a, c
	cp $1
	jr nz, .asm_39eab
.asm_39e7a
	ld a, [wc989]
	or a
	jr nz, .asm_39eab
	ld a, c
	cp $1
	jr nz, .asm_39e97
	ld a, [wPlayerXTile]
	cp $8
	jr c, .asm_39ea2
.asm_39e8c
	ld hl, wPlayerObjectStruct_Duration + 2
	ld a, $e0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jr .asm_39eab

.asm_39e97
	cp $2
	jr nz, .asm_39eab
	ld a, [wPlayerXTile]
	cp $8
	jr c, .asm_39e8c
.asm_39ea2
	ld hl, wPlayerObjectStruct_Duration + 2
	ld a, $20
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_39eab
	ld a, c
.asm_39eac
	or a
	ret

Pointers_39eae:
	dw Func_39d64
	dw Func_39e09
	dw Func_39d64
	dw Func_39e09

Data_39eb6:
	db  5,  0
	db  0, -4
	db -4,  0
	db  0,  5

Func_39ebe: ; 39ebe (e:5ebe)
	ld a, [wPlayerObjectStruct_XCoord]
	ld d, a
	ld a, [wPlayerObjectStruct_YCoord]
	add $3
	ld e, a
	ld b, $8
	ld hl, wOAMAnimation17
.asm_39ecd
	ld a, [hl]
	and $6
	cp $2
	jr nz, .asm_39f31
	inc l
	inc l
	inc l
	ld a, [hli]
	sub d
	cp $80
	jr c, .asm_39edf
	cpl
	inc a
.asm_39edf
	cp $d
	jr nc, .asm_39f2d
	ld c, a
	ld a, [hl]
	sub e
	cp $80
	jr c, .asm_39eec
	cpl
	inc a
.asm_39eec
	cp $d
	jr nc, .asm_39f2d
	cp c
	jr nc, .asm_39ef4
	ld a, c
.asm_39ef4
	cp $5
	jr c, .asm_39f2d
	ld a, $15
	add l
	ld l, a
	ld a, [hl]
	or $10
	ld [hl], a
	push bc
	ld a, $e7
	add l
	ld l, a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	call Func_2cb7
	ld a, b
	or a
	jr nz, .asm_39f16
	ld b, $3
.asm_39f16
	cp $3
	jr nz, .asm_39f1c
	ld b, $0
.asm_39f1c
	ld a, [wMathBuffer3]
	cp b
	jr nz, .asm_39f29
	ld a, [wCurObjectStruct]
	ld l, a
	pop bc
	jr .asm_39f31

.asm_39f29
	pop bc
	or $1
	ret

.asm_39f2d
	dec l
	dec l
	dec l
	dec l
.asm_39f31
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_39ecd
	xor a
	ret

Func_39f3e: ; 39f3e (e:5f3e)
	call Func_39f9d
	ld a, [wc980]
	and $f
	jr nz, .asm_39f5c
	ld bc, -$40
	call Func_2b0e
	ld a, [wc980]
	swap a
	and $f
	ld c, a
	ld a, $7
	sub c
	call Func_2b28
.asm_39f5c
	ld a, [wSCY]
	sub $4
	ld [wSCY], a
	ld a, [wc98d]
	add $4
	ld [wc98d], a
	ld a, [wc980]
	add $4
	ld [wc980], a
	cp $80
	jr nz, .asm_39f7b
	call Func_39fab
.asm_39f7b
	ld a, [wc980]
	ld bc, $e0
	ld hl, wPlayerObjectStruct
	call Func_2af4
	ld a, [wPlayerObjectStruct_YCoord]
	push af
	call Func_39bfa
	pop de
	ld a, [wPlayerObjectStruct_YCoord]
	sub d
	ld d, a
	callba Func_304b0
	ret

Func_39f9d: ; 39f9d (e:5f9d)
	ld a, [wc98e]
	cp $3
	jr nc, .resume_func
	inc a
	ld [wc98e], a
	inc sp
	inc sp
.resume_func
	ret

Func_39fab: ; 39fab (e:5fab)
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $0
	ld [wc98e], a
	jpba Func_a502a

Func_39fbd: ; 39fbd (e:5fbd)
	call Func_39f9d
	ld a, [wc980]
	and $f
	jr nz, .asm_39fdf
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wc980]
	swap a
	and $f
	call Func_2b28
	ld bc, $40
	call Func_2b0e
.asm_39fdf
	ld a, [wSCY]
	add $4
	ld [wSCY], a
	ld a, [wc98d]
	sub $4
	ld [wc98d], a
	ld a, [wc980]
	add $4
	ld [wc980], a
	cp $80
	jr nz, .asm_3a004
	call Func_39fab
	ld bc, -$200
	call Func_2b0e
.asm_3a004
	ld a, [wc980]
	ld bc, -$e2
	ld hl, wPlayerObjectStruct
	call Func_2af4
	ld a, [wPlayerObjectStruct_YCoord]
	push af
	call Func_39bfa
	pop de
	ld a, [wPlayerObjectStruct_YCoord]
	sub d
	ld d, a
	callba Func_304b0
	ret

Func_3a026: ; 3a026 (e:6026)
	call Func_39f9d
	ld a, [wc980]
	and $f
	jr nz, .asm_3a048
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wc980]
	swap a
	and $f
	call Func_2b36
	ld bc, $2
	call Func_2b1b
.asm_3a048
	ld a, [wSCX]
	add $4
	ld [wSCX], a
	ld a, [wc98c]
	sub $4
	ld [wc98c], a
	ld a, [wc980]
	add $4
	ld [wc980], a
	cp $a0
	jr nz, .asm_3a073
	call Func_39fab
	ld a, [wc983]
	ld [wBGMapAnchor + 1], a
	ld a, [wc982]
	ld [wBGMapAnchor], a
.asm_3a073
	ld a, [wc980]
	ld bc, rNR30
	ld hl, wPlayerObjectStruct
	call Func_2b01
	ld a, [wPlayerObjectStruct_XCoord]
	push af
	call Func_39bfa
	pop de
	ld a, [wPlayerObjectStruct_XCoord]
	sub d
	ld d, a
	callba Func_30497
	ret

Func_3a095: ; 3a095 (e:6095)
	call Func_39f9d
	ld a, [wc980]
	and $f
	jr nz, .asm_3a0b3
	ld bc, -2
	call Func_2b1b
	ld a, [wc980]
	swap a
	and $f
	ld c, a
	ld a, $9
	sub c
	call Func_2b36
.asm_3a0b3
	ld a, [wSCX]
	sub $4
	ld [wSCX], a
	ld a, [wc98c]
	add $4
	ld [wc98c], a
	ld a, [wc980]
	add $4
	ld [wc980], a
	cp $a0
	jr nz, .asm_3a0d2
	call Func_39fab
.asm_3a0d2
	ld a, [wc980]
	ld bc, $e7
	ld hl, wPlayerObjectStruct
	call Func_2b01
	ld a, [wPlayerObjectStruct_XCoord]
	push af
	call Func_39bfa
	pop de
	ld a, [wPlayerObjectStruct_XCoord]
	sub d
	ld d, a
	callba Func_30497
	ret
