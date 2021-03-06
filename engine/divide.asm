Divide_BC_by_DE_signed: ; 2d99b (b:599b)
; bc / de --> bc remainder de
	ld a, b
	ld [wScriptCount], a
	xor d
	ld [wWhichPhoneNumberSymbolCode], a
	bit 7, d
	jp z, .de_positive
	sub a
	sub e
	ld e, a
	sbc a
	sub d
	ld d, a
.de_positive
	bit 7, b
	jp z, .bc_positive
	sub a
	sub c
	ld c, a
	sbc a
	sub b
	ld b, a
.bc_positive
	call Divide_BC_by_DE
	ret c
	ld a, [wWhichPhoneNumberSymbolCode]
	and $80
	jp z, .quotient_positive
	sub a
	sub c
	ld c, a
	sbc a
	sub b
	ld b, a
.quotient_positive
	ld a, [wScriptCount]
	and $80
	ret z
; remainder negative
	sub a
	sub e
	ld e, a
	sbc a
	sub d
	ld d, a
	ret

Divide_BC_by_DE: ; 2d9d8 (b:59d8)
	ld a, e
	or d
	jr nz, .proceed
; OH SHI-
	ld bc, $0
	ld d, b
	ld e, c
	scf
	ret

.proceed
	ld l, c
	ld h, b
	ld bc, $0
	or a
	ld a, 16
.loop
	ld [wMathBuffer3], a
	rl l
	rl h
	rl c
	rl b
	push bc
	ld a, c
	sbc e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	ccf
	jr c, .save_bc
	pop bc
	jr .okay

.save_bc
	inc sp
	inc sp
.okay
	ld a, [wMathBuffer3]
	dec a
	jr nz, .loop
	ld d, b
	ld e, c
	rl l
	ld c, l
	rl h
	ld b, h
	or a
	ret

Divide_C_by_E_signed:
	ld a, c
	rlca
	sbc a
	ld b, a
	ld a, e
	rlca
	sbc a
	ld d, a
	jp Divide_BC_by_DE_signed

Divide_C_by_E: ; 2da20 (b:5a20)
	ld b, $0
	ld d, $0
	jp Divide_BC_by_DE
