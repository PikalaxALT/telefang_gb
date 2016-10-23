Func_f586:
	ld [wFontSourceBank], a
	ld a, [wc3d8]
	or a
	jr z, .asm_f596
	dec a
	ld [wc3d8], a
	jp Func_f5d2

.asm_f596
	ld a, [wc3da]
	cp $4
	jr z, asm_f5d4
	ld a, [wc3d9]
	ld [wc3d8], a
	check_cgb
	jp z, Func_f701
	ld a, [wFontSourceBank]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f636
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc3da]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wBGP], a
	ld a, [wc3da]
	inc a
	ld [wc3da], a
Func_f5d2: ; f5d2 (3:75d2)
	xor a
	ret

asm_f5d4
	ld a, $1
	ret

Func_f5d7:
	ld [wFontSourceBank], a
	ld a, [wc3d8]
	or a
	jr z, .asm_f5e7
	dec a
	ld [wc3d8], a
	jp Func_f631

.asm_f5e7
	ld a, [wc3da]
	cp $4
	jr z, asm_f633
	ld a, [wc3d9]
	ld [wc3d8], a
	check_cgb
	jp z, Func_f763
	ld a, [wFontSourceBank]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f636
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc3da]
	ld d, $0
	ld e, a
	add hl, de
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	ld a, [wc3da]
	inc a
	ld [wc3da], a
Func_f631: ; f631 (3:7631)
	xor a
	ret

asm_f633
	ld a, $1
	ret

Pointers_f636:
	dw Data_f646, Data_f650
	dw Data_f655, Data_f65f
	dw Data_f664, Data_f66e
	dw Data_f673, Data_f67d

Data_f646: db $00, $54, $a4, $e4, $ff
           db $00, $50, $a0, $e0, $ff
Data_f650: db $00, $51, $92, $d2, $ff
Data_f655: db $e4, $a4, $54, $00, $ff
           db $e0, $a0, $50, $00, $ff
Data_f65f: db $d2, $92, $51, $00, $ff
Data_f664: db $ff, $ea, $e5, $e4, $ff
           db $ff, $ea, $e5, $e0, $ff
Data_f66e: db $ff, $ea, $d6, $d2, $ff
Data_f673: db $e4, $e5, $ea, $ff, $ff
           db $e0, $e5, $ea, $ff, $ff
Data_f67d: db $d2, $d6, $ea, $ff, $ff

PaletteFadeCGB: ; f682 (3:7682)
	push de
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	ld hl, wde00
	call Func_f873
	call CopyDEC0ToBGPalBuffer
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	ld hl, wde60
	call Func_f873
	call CopyDEC0ToOBPalBuffer
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	pop de
	xor a
	ret

CopyDEC0ToBGPalBuffer: ; f6c3 (3:76c3)
	ld hl, wdec0
	ld de, wCGB_BGPalsBuffer
	ld b, $8
.pal
	push bc
	ld b, $4
.hue
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jp nz, .hue
	pop bc
	dec b
	jp nz, .pal
	ret

Data_f6de:
x = $80
REPT 8
	db x
x = x + $08
ENDR

CopyDEC0ToOBPalBuffer: ; f6e6 (3:76e6)
	ld hl, wdec0
	ld de, wCGB_OBPalsBuffer
	ld b, $8
.pal
	push bc
	ld b, $4
.hue
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jp nz, .hue
	pop bc
	dec b
	jp nz, .pal
	ret

Func_f701: ; f701 (3:7701)
	push de
	push bc
	ld a, b
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld h, d
	ld l, e
	sla e
	rl d
	add hl, de
	ld de, wde00
	add hl, de
	ld a, c
	ld [wc44f], a
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	call Func_f7bd
	pop bc
	ld a, b
	ld hl, Data_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rBGPI], a
	ld hl, wdec0
	ld a, c
	add a
	add a
	add a
	ld b, a
Func_f743: ; f743 (3:7743)
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rBGPD], a
	ei
	pop bc
	dec b
	jp nz, Func_f743
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	pop de
	xor a
	ret

Data_f75b:
x = $80
REPT 8
	db x
x = x + $08
ENDR

Func_f763: ; f763 (3:7763)
	push de
	push bc
	ld a, b
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld h, d
	ld l, e
	sla e
	rl d
	add hl, de
	ld de, wde60
	add hl, de
	ld a, c
	ld [wc44f], a
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	call Func_f7bd
	pop bc
	ld a, b
	ld hl, Data_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rOBPI], a
	ld hl, wdec0
	ld a, c
	add a
	add a
	add a
	ld b, a
Func_f7a5: ; f7a5 (3:77a5)
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rOBPD], a
	ei
	pop bc
	dec b
	jp nz, Func_f7a5
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	pop de
	xor a
	ret

Func_f7bd: ; f7bd (3:77bd)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f7d2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_f7d2:
	dw Func_f7e3
	dw Func_f7e2
	dw Func_f806
	dw Func_f7e2
	dw Func_f82b
	dw Func_f7e2
	dw Func_f84e
	dw Func_f7e2

Func_f7e2:
	ret

Func_f7e3:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
Func_f7f6: ; f7f6 (3:77f6)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f7f6
	ret

Func_f806:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $0
	add c
	ld c, a
Func_f81b: ; f81b (3:781b)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f81b
	ret

Func_f82b:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
Func_f83e: ; f83e (3:783e)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f83e
	ret

Func_f84e:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $1f
	sub c
	ld c, a
Func_f863: ; f863 (3:7863)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f863
	ret

Func_f873: ; f873 (3:7873)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f888
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_f888:
	dw Func_f899, .ret
	dw Func_f8ba, .ret
	dw Func_f8dd, .ret
	dw Func_f8fe, .ret

.ret
	ret

Func_f899:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
	ld b, $8
.loop
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop
	ret

Func_f8ba:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $0
	add c
	ld c, a
	ld b, $8
.loop
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop
	ret

Func_f8dd:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
	ld b, $8
.loop
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop
	ret

Func_f8fe:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $1f
	sub c
	ld c, a
	ld b, $8
.loop
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop
	ret

Func_f921: ; f921 (3:7921)
	ld a, c
	ld [wc440], a
REPT 4
	ld de, wFontSourceAddr + 1
	call Func_f93e
ENDR
	ret

Func_f93e: ; f93e (3:793e)
	ld b, $3
Func_f940: ; f940 (3:7940)
	ld a, [wc440]
	cp [hl]
	jp nc, Func_f948
	ld a, [hl]
Func_f948: ; f948 (3:7948)
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, Func_f940
	call Func_f985
	ret

Func_f953: ; f953 (3:7953)
	ld a, c
	ld [wc440], a
REPT 4
	ld de, wFontSourceAddr + 1
	call Func_f970
ENDR
	ret

Func_f970: ; f970 (3:7970)
	ld b, $3
Func_f972: ; f972 (3:7972)
	ld a, [wc440]
	cp [hl]
	jp c, Func_f97a
	ld a, [hl]
Func_f97a: ; f97a (3:797a)
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, Func_f972
	call Func_f985
	ret

Func_f985: ; f985 (3:7985)
	dec de
	ld a, [de]
	ld b, a
	sla b
	sla b
	dec de
	ld a, [de]
	sla a
	swap a
	ld c, a
	and $3
	or b
	ld b, a
	ld a, c
	and $e0
	ld c, a
	dec de
	ld a, [de]
	or c
	ld c, a
	ld a, [wc454]
	ld d, a
	ld a, [wc455]
	ld e, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ret
