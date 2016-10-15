Func_0824: ; 824 (0:0824)
	ld a, [wc430]
	or a
	ret z
	xor a
	ld [wc431], a
	ld hl, wOAMAnimations
	ld bc, wOAMBuffer
	ld a, $c
.asm_0835
	push af
	ld a, [hl]
	and $1
	call nz, Func_089c
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	pop af
	dec a
	jr nz, .asm_0835
	ld hl, wOAMAnimation17
	ld a, $8
.asm_0849
	push af
	ld a, [hl]
	and $81
	cp $81
	call z, Func_089c
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	pop af
	dec a
	jr nz, .asm_0849
	ld hl, wOAMAnimation13
	ld a, $c
	ld [wc40b], a
.asm_0862
	ld a, [hl]
	and $81
	cp $81
	jr z, .asm_086e
	and $1
	call nz, Func_089c
.asm_086e
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	ld a, [wc40b]
	dec a
	ld [wc40b], a
	jr nz, .asm_0862
	ld a, [wc432]
	ld h, a
	ld a, [wc431]
	ld [wc432], a
	sub h
	jr nc, .asm_0896
	xor $ff
	inc a
	ld h, b
	ld l, c
	ld b, a
	xor a
.asm_088f
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .asm_088f
.asm_0896
	ld a, $1
	ld [wc437], a
	ret

Func_089c: ; 89c (0:089c)
	push hl
	ld a, [hli]
	ld [wc419], a
	ld a, [hli]
	ld [wc418], a
	ld a, [hli]
	ld [wc41a], a
	ld a, [hli]
	add $8
	ld [wc41c], a
	ld a, [hli]
	add $10
	ld [wc41b], a
	ld a, [hli]
	ld [wc41d], a
	push bc
	ld a, [wc418]
	and $f0
	swap a
	ld hl, Data_094d
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch
	pop bc
	ld a, [wc418]
	and $f0
	swap a
	ld hl, Data_0956
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc41a]
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld d, h
	ld e, l
.LoadTemplate: ; 8f1 (0:08f1)
	push af
	ld a, [wc431]
	inc a
	cp $29
	jp z, .Full
	ld [wc431], a
	ld a, [wc41b]
	ld h, a
	ld a, [de]
	add h
	ld [bc], a
	inc bc
	inc de
	ld a, [wc41c]
	ld h, a
	ld a, [de]
	add h
	ld [bc], a
	inc bc
	inc de
	ld a, [de]
	ld [bc], a
	inc bc
	inc de
	ld a, [de]
	or a
	jr nz, .asm_092a
	ld a, [wc419]
	and $f0
	push bc
	ld b, a
	ld a, [wc41d]
	and $7
	or b
	pop bc
	ld [bc], a
	inc de
	jr .next

.asm_092a
	cp $1
	jr nz, .custom_flags
	inc de
	ld a, [de]
	ld [bc], a
	jr .next

.custom_flags
	inc de
	ld a, [de]
	and $f0
	push bc
	ld b, a
	ld a, [wc41d]
	and $7
	or b
	pop bc
	ld [bc], a
.next
	inc bc
	inc de
	pop af
	dec a
	jp nz, .LoadTemplate
	pop hl
	ret

.Full
	pop af
	pop hl
	ret

Data_094d:
	db BANK(Pointers_28000)
	db BANK(Pointers_38120)
	db BANK(Pointers_4c000)
	db BANK(Pointers_50000)
	db BANK(Pointers_54000)
	db BANK(Pointers_58000)
	db BANK(Pointers_5c000)
	db BANK(Pointers_60000)
	db BANK(Pointers_64000)

Data_0956:
	dw Pointers_28000
	dw Pointers_38120
	dw Pointers_4c000
	dw Pointers_50000
	dw Pointers_54000
	dw Pointers_58000
	dw Pointers_5c000
	dw Pointers_60000
	dw Pointers_64000
