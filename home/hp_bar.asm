Func_3957::
	ld b, $6
	ld [wcb20], a
Func_395c: ; 395c (0:395c)
	sub $8
	jr c, .asm_396f
	ld [wcb20], a
	push af
	ld a, $8
	call Func_39b7
	pop af
	dec b
	jp nz, Func_395c
	ret

.asm_396f
	ld a, [wcb20]
	call Func_39b7
	dec b
	ret z
Func_3977: ; 3977 (0:3977)
	xor a
	call Func_39b7
	dec b
	jp nz, Func_3977
	ret

Func_3980::
	cp e
	jr z, .full_hp
	push af
	lb bc, $30, $0
	ld d, $0
	call Func_0628
	pop af
	ld d, $0
	ld e, a
	call Multiply_DE_by_BC
	ld a, d
	ret

.full_hp
	ld a, $30
	ret

Func_3998::
	cp $d
	jr c, .asm_39aa
	cp $15
	jr c, .asm_39a5
	ld bc, $2
	jr .asm_39ad

.asm_39a5
	ld bc, $3
	jr .asm_39ad

.asm_39aa
	ld bc, $4
.asm_39ad
	ld a, d
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_39b7: ; 39b7 (0:39b7)
	push bc
	push hl
	bit 0, c
	jr nz, .asm_39c3
	ld hl, Data_39da
	jp Func_39c6

.asm_39c3
	ld hl, Data_39e3
Func_39c6: ; 39c6 (0:39c6)
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	pop hl
	push hl
	call WaitStatAndLoad
	pop hl
	pop bc
	bit 0, c
	jr nz, .asm_39d8
	inc hl
	ret

.asm_39d8
	dec hl
	ret

Data_39da::
	db $3e, $30, $31, $32, $33, $34, $35, $36, $3f
Data_39e3::
	db $3e, $37, $38, $39, $3a, $3b, $3c, $3d, $3f
