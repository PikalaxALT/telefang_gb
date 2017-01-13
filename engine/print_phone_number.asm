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
	call .GenerateUnique11BitID
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
	ld hl, $10000 - (sAddressBook + $0)
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
	ld a, [wMapNumber]
	ld [hli], a
	pop af
	ld [wPrevROMBank], a
	push hl
	ld l, e
	ld a, [wMapGroup]
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

.GenerateUnique11BitID: ; a40b7 (29:40b7)
.outer_loop
	call OverworldRandom8_
	and $3
	ld b, a
	call OverworldRandom8_
	ld d, b
	ld e, a
	ld hl, sAddressBook + 1
	ld bc, ADDRESS_BOOK_SIZE
.loop
	push hl
	ld a, [hl]
	or a
	jr z, .next
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	cp e
	jr nz, .next
	ld a, [hl]
	cp d
	jr nz, .next
	pop hl
	jr .outer_loop

.next
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
	jr nz, .loop
	ret

Func_a40ef: ; a40ef (29:40ef)
	call Func_a412e
	call Func_a4121
	ld b, $0
	sla c
	rl b
	ld hl, sOwnedDenjuuNicknames
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
	ld hl, s2_b800
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

CompressStandardPhoneNumber: ; a4162 (29:4162)
	ld e, $e
	call Multiply_C_by_E
	ld hl, StoryPhoneNumbers
	add hl, de
	ld c, $e
	ld de, wMapHeader
.copy
	ld b, BANK(StoryPhoneNumbers) ; same bank
	call GetFarByte
	ld a, b
	ld [de], a
	inc hl
	inc de
	dec c
	jr nz, .copy
	ld hl, wMapHeader
	call CompressPhoneNumber
	ld a, b
	or $80
	ld b, a
	ret

CompressPhoneNumber: ; a4187 (29:4187)
	push hl
	call ValidateDecompressedPhoneNumber
	pop hl
	jr nz, .nope
	push hl
	call IsPatternOfHashesAndAsterisksValid
	pop hl
	jr nz, .nope
	ld a, e
	ld [wWhichPhoneNumberSymbolCode], a
	call .CompressNumericPortionOfPhoneNumber
	xor a
	ld a, [wWhichPhoneNumberSymbolCode]
	ret

.nope
	xor a
	ld e, a
	ld d, a
	ld c, a
	ld b, a
	ret

.CompressNumericPortionOfPhoneNumber: ; a41a7 (29:41a7)
	inc hl
	ld a, $8
	ld [wCustomSpriteDest], a
	ld b, $0
	ld c, $0
	ld d, $0
	ld e, $0
.loop
	ld a, [hli]
	cp $78 ; #
	jr nc, .loop
	push hl
	push bc
	push de
	ld b, a
	ld a, [wCustomSpriteDest]
	cp $8
	jr nz, .okay
	ld a, b
	cp $6e ; 7
	jr nz, .okay
	ld b, $6a ; 5
.okay
	ld hl, PhoneNumber_MultiplesOfPowersOfTen ; because why try to do 32-bit multiplication?
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
	sub $60 ; 0
	jr nz, .not_zero
	pop de
	pop bc
	pop hl
	jr .next

.not_zero
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
	call Add32
	pop hl
.next
	ld a, [wCustomSpriteDest]
	dec a
	ld [wCustomSpriteDest], a
	jr nz, .loop
	ret

ValidateDecompressedPhoneNumber: ; a4202 (29:4202)
	ld a, [hli]
	cp $60 ; 0
	jr nz, .nope
	ld b, $2
	call .ContainsExactlyOneHash
	jr nz, .nope
	inc hl
	ld b, $4
	call .ContainsExactlyOneHash
	jr nz, .nope
	inc hl
	ld b, $5
	call .ContainsExactlyOneHash
	jr nz, .nope
	ret

.nope
	ret

.ContainsExactlyOneHash: ; a4220 (29:4220)
	ld c, $0
.count_78
	ld a, [hli]
	cp $78 ; #
	jr c, .next
	inc c
.next
	dec b
	jr nz, .count_78
	ld a, c
	cp $1
	jr nz, .useless
	ret

.useless
	ret

IsPatternOfHashesAndAsterisksValid: ; a4232 (29:4232)
	ld b, $0
	ld c, $0
	ld d, $0
	inc hl
	ld a, [hli]
	cp $78 ; #
	jr nc, .hash_or_asterisk
	ld b, $10
	ld a, [hli]
	jr .okay

.hash_or_asterisk
	inc hl
.okay
	cp $78 ; #
	jr z, .is_hash
	inc b
.is_hash
	inc hl
	ld e, $4
.loop
	ld a, [hli]
	cp $78
	jr nc, .hash_or_asterisk_2
	dec e
	jr z, .done_section
	ld a, c
	add $10
	ld c, a
	jr .loop

.hash_or_asterisk_2
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
	jr z, .is_hash_2
	inc c
.is_hash_2
	inc hl
	ld e, $5
.loop2
	ld a, [hli]
	cp $78
	jr nc, .hash_or_asterisk_3
	dec e
	jr z, .done_section
	ld a, d
	add $10
	ld d, a
	jr .loop2

.hash_or_asterisk_3
	push af
	ld a, e
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	cp $78
	jr z, .is_hash_3
	inc d
.is_hash_3
	ld e, $0
	ld hl, PhoneSpecialCharacterPositionCodes
.loop3
	ld a, [hli]
	cp b
	jr nz, .next_1
	ld a, [hli]
	cp c
	jr nz, .next_2
	ld a, [hli]
	cp d
	jr nz, .next_3
	xor a
	ret

.next_1
	inc hl
.next_2
	inc hl
.next_3
	inc e
	jr nz, .loop3
.done_section
	or $1
	ret

PrintPhoneNumber: ; a42a3 (29:42a3)
; abcde = Encrypted Phone Number
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
; bcde = Phone number, 32-bit
; a = Which symbol position set
	push af
	call ConvertPhoneNumberToBCD
	pop af
	ld hl, PhoneSpecialCharacterPositionCodes
	ld c, a
	ld b, $0
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l
	ld hl, wMapHeader
	ld a, $60 ; 0
	ld [hli], a
	ld a, [wPhoneNumberBuffer]
	ld b, a
	ld a, [de]
	inc de
	ld c, $78 ; #
	bit 0, a
	jr z, .okay1
	ld c, $7c ; *
.okay1
	swap a
	and $7
	or a
	jr nz, .no_shuffle
	ld a, c
	ld c, b
	ld b, a
.no_shuffle
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $7a ; -
	ld [hli], a
	ld a, [de]
	inc de
	ld c, $78 ; #
	bit 0, a
	jr z, .okay2
	ld c, $7c ; *
.okay2
	swap a
	and $7
	cp $3
	jr z, .c_slot_3
	cp $2
	jr z, .c_slot_2
	cp $1
	jr z, .c_slot_1
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 3]
	ld [hli], a
	jr .next

.c_slot_1
	ld a, [wPhoneNumberBuffer + 1]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 3]
	ld [hli], a
	jr .next

.c_slot_2
	ld a, [wPhoneNumberBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 2]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 3]
	ld [hli], a
	jr .next

.c_slot_3
	ld a, [wPhoneNumberBuffer + 1]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 2]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 3]
	ld [hli], a
	ld a, c
	ld [hli], a
.next
	ld a, $7a ; -
	ld [hli], a
	ld a, [de]
	ld c, $78 ; #
	bit 0, a
	jr z, .okay3
	ld c, $7c ; *
.okay3
	swap a
	and $7
	cp $4
	jr z, .c_slot_8
	cp $3
	jr z, .c_slot_7
	cp $2
	jr z, .c_slot_6
	cp $1
	jr z, .c_slot_5
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 7]
	ld [hli], a
	jr .done

.c_slot_5
	ld a, [wPhoneNumberBuffer + 4]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 7]
	ld [hli], a
	jr .done

.c_slot_6
	ld a, [wPhoneNumberBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 5]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 7]
	ld [hli], a
	jr .done

.c_slot_7
	ld a, [wPhoneNumberBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 6]
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 7]
	ld [hli], a
	jr .done

.c_slot_8
	ld a, [wPhoneNumberBuffer + 4]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 5]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 6]
	ld [hli], a
	ld a, [wPhoneNumberBuffer + 7]
	ld [hli], a
	ld a, c
	ld [hli], a
.done
	ld de, wMapHeader
	ret

ConvertPhoneNumberToBCD: ; a43f8 (29:43f8)
	push bc
	ld a, b
	and $3
	ld b, a
	ld hl, .MinusTenMillion
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop1
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call Add32
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
	ld [wPhoneNumberBuffer], a
	ld hl, .MinusOneMillion
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop2
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call Add32
	jr z, .decrypt_next2
	add sp, $4
	jr .decrypt_loop2

.decrypt_next2
	pop de
	pop bc
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberBuffer + 1], a
	ld hl, .MinusHundredThousand
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop3
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call Add32
	jr z, .decrypt_next3
	add sp, $4
	jr .decrypt_loop3

.decrypt_next3
	pop de
	pop bc
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberBuffer + 2], a
	ld hl, .MinusTenThousand
	ld a, $ff
	ld [wCustomSpriteDest], a
.decrypt_loop4
	ld a, [wCustomSpriteDest]
	inc a
	ld [wCustomSpriteDest], a
	push bc
	push de
	call Add32
	jr z, .decrypt_next4
	add sp, $4
	jr .decrypt_loop4

.decrypt_next4
	pop hl
	add sp, $2
	ld a, [wCustomSpriteDest]
	ld [wPhoneNumberBuffer + 3], a
	ld bc, -1000
	ld a, $ff
.bcd_thousands
	inc a
	ld d, h
	ld e, l
	add hl, bc
	jr c, .bcd_thousands
	ld [wPhoneNumberBuffer + 4], a
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
	ld [wPhoneNumberBuffer + 5], a
	ld a, e
	ld c, -10
	ld d, $ff
.bcd_tens
	inc d
	ld b, a
	add c
	jr c, .bcd_tens
	ld a, d
	ld [wPhoneNumberBuffer + 6], a
	ld a, b
	ld [wPhoneNumberBuffer + 7], a
	ld b, 8
	ld hl, wPhoneNumberBuffer
.convert_to_tile_loop
	ld a, [hl]
	add a ; each digit is 2 tiles high
	add $60 ; where top 0 is loaded
	ld [hli], a
	dec b
	jr nz, .convert_to_tile_loop
	ret

.MinusTenMillion:
	dl 4, -10000000

.MinusOneMillion:
	dl 4, -1000000

.MinusHundredThousand:
	dl 4, -100000

.MinusTenThousand:
	dl 4, -10000

Add32: ; a44e5 (29:44e5)
; add hl[:4] + (bcde)
; value at hl is little-endian
; store 40-bit result to ([wMathBuffer3]bcde)
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

PhoneSpecialCharacterPositionCodes:
INCLUDE "data/unknown_a4588.asm"

PhoneNumber_MultiplesOfPowersOfTen:
INCLUDE "data/unknown_a4888.asm"

LoadPhoneNumberDigitTiles: ; a49b8 (29:49b8)
	ld hl, VTilesBG tile $60
	ld de, GFX_a49c4
	ld bc, $200 ; $1e0 (last two tiles are garbage taken from the next function)
	jp Copy2bpp_2

GFX_a49c4: INCBIN "gfx/misc/a49c4.w24.interleave.2bpp"
