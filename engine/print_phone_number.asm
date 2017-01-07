Func_a4000:
	enable_sram sAddressBook
	ld a, [wc924]
	inc a
	ld [wc924], a
	jr nz, .asm_a401a
	ld a, [wc925]
	inc a
	ld [wc925], a
.asm_a401a
	push hl
	call Func_a40b7
	pop hl
	ld b, h
	ld c, l
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	push hl
	ld hl, $6000
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	and $ff
	ld c, a
	call Func_a40ef
	pop hl
	ld a, [wPrevROMBank]
	push af
	push hl
	push de
	callba Func_a8539
	ld a, c
	pop de
	pop hl
	ld [hli], a
	ld a, [wc906]
	ld [hli], a
	pop af
	ld [wPrevROMBank], a
	push hl
	ld l, e
	ld a, [wc904]
	sla a
	or d
	ld h, a
	call Func_a4560
	push bc
	push de
	ld a, [wc920]
	ld l, a
	ld a, [wc921]
	ld h, a
	call Func_a452c
	pop hl
	ld a, d
	or h
	ld d, a
	ld a, e
	or l
	ld e, a
	pop hl
	ld a, c
	or h
	ld c, a
	ld a, b
	or l
	ld b, a
	ld l, $0
	sla a
	rl l
	sla a
	rl l
	ld a, b
	and $3f
	ld b, a
	ld a, [wc924]
	sla a
	sla a
	or l
	pop hl
	push af
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	and $3
	ld [hli], a
	pop af
	ld [hli], a
	xor a
	ld [hl], a
	disable_sram
	ret

Func_a40b7: ; a40b7 (29:40b7)
	call OverworldRandom8_
	and $3
	ld b, a
	call OverworldRandom8_
	ld d, b
	ld e, a
	ld hl, sAddressBook + 1
	ld bc, ADDRESS_BOOK_SIZE
.asm_a40c8
	push hl
	ld a, [hl]
	or a
	jr z, .asm_a40e0
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	cp e
	jr nz, .asm_a40e0
	ld a, [hl]
	cp d
	jr nz, .asm_a40e0
	pop hl
	jr Func_a40b7

.asm_a40e0
	pop hl
	ld a, $10
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec bc
	ld a, b
	or c
	jr nz, .asm_a40c8
	ret

Func_a40ef: ; a40ef (29:40ef)
	call Func_a412e
	call Func_a4121
	ld b, $0
	sla c
	rl b
	ld hl, $b200
	add hl, bc
	add hl, bc
	add hl, bc
	push hl
	ld hl, DenjuuNames
	ld a, [wCGBPalFadeProgram]
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
	ld b, $6
	pop de
	call FarCopyData_Under256Bytes
	ret

Func_a4121: ; a4121 (29:4121)
	ld a, c
	ld hl, $b800
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld [hl], $47
	ret

Func_a412e: ; a412e (29:412e)
	push bc
	push hl
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
	ld c, [hl]
	ld a, c
	ld [wCGBPalFadeProgram], a
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
	pop hl
	pop bc
	ret

Func_a4162: ; a4162 (29:4162)
	ld e, $e
	call Multiply_C_by_E
	ld hl, Data_a69a9
	add hl, de
	ld c, $e
	ld de, wMapHeader
.asm_a4170
	ld b, BANK(Data_a69a9) ; same bank
	call GetFarByte
	ld a, b
	ld [de], a
	inc hl
	inc de
	dec c
	jr nz, .asm_a4170
	ld hl, wMapHeader
	call Func_a4187
	ld a, b
	or $80
	ld b, a
	ret

Func_a4187: ; a4187 (29:4187)
	push hl
	call Func_a4202
	pop hl
	jr nz, .asm_a41a1
	push hl
	call Func_a4232
	pop hl
	jr nz, .asm_a41a1
	ld a, e
	ld [wca69], a
	call Func_a41a7
	xor a
	ld a, [wca69]
	ret

.asm_a41a1
	xor a
	ld e, a
	ld d, a
	ld c, a
	ld b, a
	ret

Func_a41a7: ; a41a7 (29:41a7)
	inc hl
	ld a, $8
	ld [wCustomSpriteDest], a
	ld b, $0
	ld c, $0
	ld d, $0
	ld e, $0
.asm_a41b5
	ld a, [hli]
	cp $78
	jr nc, .asm_a41b5
	push hl
	push bc
	push de
	ld b, a
	ld a, [wCustomSpriteDest]
	cp $8
	jr nz, .asm_a41cc
	ld a, b
	cp $6e
	jr nz, .asm_a41cc
	ld b, $6a
.asm_a41cc
	ld hl, Data_a4888
	ld a, [wCustomSpriteDest]
	dec a
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, b
	sub $60
	jr nz, .asm_a41e7
	pop de
	pop bc
	pop hl
	jr .asm_a41f8

.asm_a41e7
	srl a
	dec a
	add a
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop de
	pop bc
	call DecryptPhoneNumberByte
	pop hl
.asm_a41f8
	ld a, [wCustomSpriteDest]
	dec a
	ld [wCustomSpriteDest], a
	jr nz, .asm_a41b5
	ret

Func_a4202: ; a4202 (29:4202)
	ld a, [hli]
	cp $60
	jr nz, .asm_a421f
	ld b, $2
	call Func_a4220
	jr nz, .asm_a421f
	inc hl
	ld b, $4
	call Func_a4220
	jr nz, .asm_a421f
	inc hl
	ld b, $5
	call Func_a4220
	jr nz, .asm_a421f
	ret

.asm_a421f
	ret

Func_a4220: ; a4220 (29:4220)
	ld c, $0
.asm_a4222
	ld a, [hli]
	cp $78
	jr c, .asm_a4228
	inc c
.asm_a4228
	dec b
	jr nz, .asm_a4222
	ld a, c
	cp $1
	jr nz, .asm_a4231
	ret

.asm_a4231
	ret

Func_a4232: ; a4232 (29:4232)
	ld b, $0
	ld c, $0
	ld d, $0
	inc hl
	ld a, [hli]
	cp $78
	jr nc, .asm_a4243
	ld b, $10
	ld a, [hli]
	jr .asm_a4244

.asm_a4243
	inc hl
.asm_a4244
	cp $78
	jr z, .asm_a4249
	inc b
.asm_a4249
	inc hl
	ld e, $4
.asm_a424c
	ld a, [hli]
	cp $78
	jr nc, .asm_a425a
	dec e
	jr z, .asm_a42a0
	ld a, c
	add $10
	ld c, a
	jr .asm_a424c

.asm_a425a
	push af
	ld a, e
	dec a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	cp $78
	jr z, .asm_a4269
	inc c
.asm_a4269
	inc hl
	ld e, $5
.asm_a426c
	ld a, [hli]
	cp $78
	jr nc, .asm_a427a
	dec e
	jr z, .asm_a42a0
	ld a, d
	add $10
	ld d, a
	jr .asm_a426c

.asm_a427a
	push af
	ld a, e
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	cp $78
	jr z, .asm_a4288
	inc d
.asm_a4288
	ld e, $0
	ld hl, Data_a4588
.asm_a428d
	ld a, [hli]
	cp b
	jr nz, .asm_a429b
	ld a, [hli]
	cp c
	jr nz, .asm_a429c
	ld a, [hli]
	cp d
	jr nz, .asm_a429d
	xor a
	ret

.asm_a429b
	inc hl
.asm_a429c
	inc hl
.asm_a429d
	inc e
	jr nz, .asm_a428d
.asm_a42a0
	or $1
	ret

PrintPhoneNumber: ; a42a3 (29:42a3)
; abcde = Phone Number
; hl = VBGMap address
	push hl
	call GetPhoneNumber
	push de
	call LoadPhoneNumberDigitTiles
	pop de
	pop hl
	push hl
	push de
	call .PrintFirstRow
	pop de
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	jp .PrintSecondRow

.PrintFirstRow: ; a42bb (29:42bb)
	ld b, $7
.loop1
	di
.wait_stat1
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat1
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .loop1
	ret

.PrintSecondRow: ; a42cf (29:42cf)
	ld b, $7
.loop2
	di
.wait_stat2
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat2
	ld a, [de]
	inc de
	inc a
	ld [hli], a
	ld a, [de]
	inc a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .loop2
	ret

GetPhoneNumber: ; a42e5 (29:42e5)
	push af
	call DecryptPhoneNumber
	pop af
	ld hl, Data_a4588
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wMapHeader
	ld a, $60
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer]
	ld b, a
	ld a, [de]
	inc de
	ld c, $78
	bit 0, a
	jr z, .asm_a4309
	ld c, $7c
.asm_a4309
	swap a
	and $7
	or a
	jr nz, .asm_a4313
	ld a, c
	ld c, b
	ld b, a
.asm_a4313
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $7a
	ld [hli], a
	ld a, [de]
	inc de
	ld c, $78
	bit 0, a
	jr z, .asm_a4324
	ld c, $7c
.asm_a4324
	swap a
	and $7
	cp $3
	jr z, .asm_a4364
	cp $2
	jr z, .asm_a4354
	cp $1
	jr z, .asm_a4344
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 3]
	ld [hli], a
	jr .asm_a4372

.asm_a4344
	ld a, [wPhoneNumberDecryptionBuffer + 1]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 3]
	ld [hli], a
	jr .asm_a4372

.asm_a4354
	ld a, [wPhoneNumberDecryptionBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 2]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 3]
	ld [hli], a
	jr .asm_a4372

.asm_a4364
	ld a, [wPhoneNumberDecryptionBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 3]
	ld [hli], a
	ld a, c
	ld [hli], a
.asm_a4372
	ld a, $7a
	ld [hli], a
	ld a, [de]
	ld c, $78
	bit 0, a
	jr z, .asm_a437e
	ld c, $7c
.asm_a437e
	swap a
	and $7
	cp $4
	jr z, .asm_a43e2
	cp $3
	jr z, .asm_a43ce
	cp $2
	jr z, .asm_a43ba
	cp $1
	jr z, .asm_a43a6
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 7]
	ld [hli], a
	jr .asm_a43f4

.asm_a43a6
	ld a, [wPhoneNumberDecryptionBuffer + 4]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 7]
	ld [hli], a
	jr .asm_a43f4

.asm_a43ba
	ld a, [wPhoneNumberDecryptionBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 5]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 7]
	ld [hli], a
	jr .asm_a43f4

.asm_a43ce
	ld a, [wPhoneNumberDecryptionBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 6]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 7]
	ld [hli], a
	jr .asm_a43f4

.asm_a43e2
	ld a, [wPhoneNumberDecryptionBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberDecryptionBuffer + 7]
	ld [hli], a
	ld a, c
	ld [hli], a
.asm_a43f4
	ld de, wMapHeader
	ret

DecryptPhoneNumber: ; a43f8 (29:43f8)
	push bc
	ld a, b
	and $3
	ld b, a
	ld hl, .DecryptionKey1
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop1
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call DecryptPhoneNumberByte
	jr z, .decrypt_next1
	add sp, $4
	jr .decrypt_loop1

.decrypt_next1
	pop de
	pop bc
	pop af
	and $80
	jr nz, .negative
	ld a, [wCustomSpriteDest]
	cp $5
	jr nz, .negative
	ld a, $7
	ld [wCustomSpriteDest], a
.negative
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberDecryptionBuffer], a
	ld hl, .DecryptionKey2
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop2
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call DecryptPhoneNumberByte
	jr z, .decrypt_next2
	add sp, $4
	jr .decrypt_loop2

.decrypt_next2
	pop de
	pop bc
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberDecryptionBuffer + 1], a
	ld hl, .DecryptionKey3
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop3
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call DecryptPhoneNumberByte
	jr z, .decrypt_next3
	add sp, $4
	jr .decrypt_loop3

.decrypt_next3
	pop de
	pop bc
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberDecryptionBuffer + 2], a
	ld hl, .DecryptionKey4
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop4
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call DecryptPhoneNumberByte
	jr z, .decrypt_next4
	add sp, $4
	jr .decrypt_loop4

.decrypt_next4
	pop hl
	add sp, $2
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberDecryptionBuffer + 3], a
	ld bc, -1000
	ld a, $ff
.bcd_thousands
	inc a
	ld d, h
	ld e, l
	add hl, bc
	jr c, .bcd_thousands
	ld [wPhoneNumberDecryptionBuffer + 4], a
	ld h, d
	ld l, e
	ld bc, -100
	ld a, $ff
.bcd_hundreds
	inc a
	ld d, h
	ld e, l
	add hl, bc
	jr c, .bcd_hundreds
	ld [wPhoneNumberDecryptionBuffer + 5], a
	ld a, e
	ld c, -10
	ld d, $ff
.bcd_tens
	inc d
	ld b, a
	add c
	jr c, .bcd_tens
	ld a, d
	ld [wPhoneNumberDecryptionBuffer + 6], a
	ld a, b
	ld [wPhoneNumberDecryptionBuffer + 7], a
	ld b, $8
	ld hl, wPhoneNumberDecryptionBuffer
.double_add_96_loop
	ld a, [hl]
	add a
	add $60
	ld [hli], a
	dec b
	jr nz, .double_add_96_loop
	ret

.DecryptionKey1:
	db $80, $69, $67, $ff

.DecryptionKey2:
	db $c0, $bd, $f0, $ff

.DecryptionKey3:
	db $60, $79, $fe, $ff

.DecryptionKey4:
	db $f0, $d8, $ff, $ff

DecryptPhoneNumberByte: ; a44e5 (29:44e5)
	ld a, [hli]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $0
	adc c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, $0
	adc $0
	ld [wMathBuffer3], a
	ld a, [hli]
	add d
	ld d, a
	ld a, $0
	adc c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [wMathBuffer3]
	adc $0
	ld [wMathBuffer3], a
	ld a, [hli]
	add c
	ld c, a
	ld a, $0
	adc b
	ld b, a
	ld a, [wMathBuffer3]
	adc $0
	ld [wMathBuffer3], a
	ld a, [hl]
	dec hl
	dec hl
	dec hl
	add b
	ld b, a
	ld a, [wMathBuffer3]
	adc $0
	ld [wMathBuffer3], a
	ret

Func_a452c: ; a452c (29:452c)
	xor a
	ld b, a
	ld c, a
	ld d, a
	ld e, a
	ld a, $10
	ld [wMathBuffer3], a
.asm_a4536
	sla e
	rl d
	rl c
	rl b
	sla e
	rl d
	rl c
	rl b
	sla l
	rl h
	jr nc, .asm_a454e
	set 0, e
.asm_a454e
	ld a, [wMathBuffer3]
	dec a
	ld [wMathBuffer3], a
	jr nz, .asm_a4536
	sla e
	rl d
	rl c
	rl b
	ret

Func_a4560: ; a4560 (29:4560)
	xor a
	ld b, a
	ld c, a
	ld d, a
	ld e, a
	ld a, $10
	ld [wMathBuffer3], a
.asm_a456a
	sla e
	rl d
	rl c
	rl b
	sla l
	rl h
	rl e
	rl d
	rl c
	rl b
	ld a, [wMathBuffer3]
	dec a
	ld [wMathBuffer3], a
	jr nz, .asm_a456a
	ret

Data_a4588:
INCLUDE "data/unknown_a4588.asm"

Data_a4888:
INCLUDE "data/unknown_a4888.asm"

LoadPhoneNumberDigitTiles: ; a49b8 (29:49b8)
	ld hl, VTilesBG tile $60
	ld de, GFX_a49c4
	ld bc, $200
	jp Copy2bpp_2

GFX_a49c4: INCBIN "gfx/misc/a49c4.w24.interleave.2bpp"
