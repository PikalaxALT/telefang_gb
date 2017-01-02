Multiply_DE_by_BC: ; 2b44 (0:2b44)
; de *= bc
	ld hl, 0
	ld a, $f
.loop
	sla e
	rl d
	jr nc, .next
	add hl, bc
.next
	add hl, hl
	dec a
	jr nz, .loop
	bit 7, d
	jr z, .done
	add hl, bc
.done
	ld d, h
	ld e, l
	ret

Multiply_C_by_E: ; 2b5c (0:2b5c)
	ld b, $0
	ld d, $0
	jp Multiply_DE_by_BC

Multiply_C_by_E_signed:
	xor a
	ld b, a
	ld d, a
	bit 7, c
	jr z, .c_positive
	dec b
.c_positive
	bit 7, e
	jr z, Multiply_DE_by_BC
	dec d
	jr Multiply_DE_by_BC
