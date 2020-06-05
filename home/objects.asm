StartObjectAnimation: ; d97 (0:0d97)
	ld hl, $6
	add hl, de
	ld [hl], $1

	ld hl, $7
	add hl, de
	ld [hl], a

	ld hl, $8
	add hl, de
	ld [hl], $0

	ld hl, $9
	add hl, de
	ld [hl], $0

	ld hl, $a
	add hl, de
	ld [hl], $0

	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f

	push af
	ld hl, Data_0dee
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch

	pop af
	ld hl, Data_0df1
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	push hl
	ld hl, $7
	add hl, de
	ld a, [hl]
	pop hl

	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a

	inc hl
	ld a, [hl]

	ld hl, $2
	add hl, de
	ld [hl], a
	ret

Data_0dee::
	db BANK(Pointers_33ac4)
	db BANK(Pointers_33ac4)
	db BANK(Pointers_33ac4)

Data_0df1::
	dw Pointers_33ac4
	dw Pointers_33ac4
	dw Pointers_33ac4

AnimateObject: ; df7 (0:0df7)
	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f
	ld hl, Data_0dee
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch
	ld hl, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, @+3
	; stuff was commented out in source :/
	ld hl, $a
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jr z, .asm_0e23
	dec a
	ld [hl], a
	ret

.asm_0e23
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f
	ld hl, Data_0df1
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $7
	add hl, de
	ld a, [hl]
	pop hl
	ld c, a
	ld b, $0
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
.loop
	ld hl, $9
	add hl, de
	ld a, [hl]
	ld h, $0
	ld l, a
	add hl, bc
	ld a, [hl]
	cp $fe
	jr z, .asm_0e71
	cp $ff
	jr z, .asm_0e64
	jp .done

.asm_0e64
	ld hl, $a
	add hl, de
	ld [hl], $ff
	ld hl, $6
	add hl, de
	ld [hl], $0
	ret

.asm_0e71
	inc hl
	ld a, [hl]
	sla a
	sla a
	ld hl, $9
	add hl, de
	ld [hl], a
	jp .loop

.done
	ld a, [hli]
	dec a
	push hl
	ld hl, $8
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	ld hl, $2
	add hl, de
	ld [hl], a
	ld hl, $9
	add hl, de
	ld a, [hl]
	add $2
	ld [hl], a
	ret

