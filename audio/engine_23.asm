UpdateSound_23:
	push af
	push bc
	push de
	push hl
	ld a, [H_MusicID]
	cp $1
	jp z, Func_8c629
	or a
	jr z, .asm_8c018
	call PlayMusic_23
	xor a
	ld [H_MusicID], a
	jr .asm_8c03e

.asm_8c018
	ld a, [wcfc0]
	or a
	jr z, .asm_8c022
	xor a
	ld [H_SFX_ID], a
.asm_8c022
	ld a, [H_SFX_ID]
	or a
	jr z, .asm_8c031
	call PlaySFX_23
	xor a
	ld [H_SFX_ID], a
	jr .asm_8c03e

.asm_8c031
	ld a, [H_FFA2]
	or a
	jr z, .asm_8c03e
	call Func_8cc3a
	xor a
	ld [H_FFA2], a
.asm_8c03e
	ld a, [wcf90]
	or a
	jr z, .asm_8c064
	ld a, [wcf91]
	or a
	jp nz, Func_8c173
	ld a, $ff
	ld [wcf91], a
	ld a, $8
	ld [rNR22], a
	ld [rNR42], a
	xor a
	ld [rNR32], a
	ld a, $80
	ld [rNR24], a
	ld [rNR44], a
	ld [rNR34], a
	jp Func_8c173

.asm_8c064
	ld a, [wcf91]
	or a
	jr z, .asm_8c081
	xor a
	ld [wcf91], a
	ld a, $8f
	ld [rNR52], a
	ld [wcf94], a
	ld a, $8
	ld [rNR12], a
	ld a, $80
	ld [rNR14], a
	xor a
	ld [wChannel5], a
.asm_8c081
	ld a, [wcf96]
	or a
	jr z, .asm_8c0e9
	ld a, [wcf97]
	or a
	jr z, .asm_8c093
	dec a
	ld [wcf97], a
	jr .asm_8c0e9

.asm_8c093
	ld a, [wcf98]
	sub $22
	jr c, .asm_8c0a7
	ld [wcf98], a
	ld [rNR50], a
	ld a, [wcf96]
	ld [wcf97], a
	jr .asm_8c0e9

.asm_8c0a7
	xor a
	ld [rNR50], a
	ld [wcf96], a
	ld [wcf97], a
	ld [rNR51], a
	ld [wChannel1], a
	ld [wChannel2], a
	ld [wChannel3], a
	ld [wChannel4], a
	ld [wChannel5], a
	ld [wChannel6], a
	ld [rNR11], a
	ld [rNR21], a
	ld [rNR32], a
	ld [rNR42], a
	ld [rNR13], a
	ld [rNR23], a
	ld [rNR33], a
	ld [rNR43], a
	ld [rNR30], a
	ld a, $8
	ld [rNR10], a
	ld a, $c0
	ld [rNR14], a
	ld [rNR24], a
	ld [rNR34], a
	ld [rNR44], a
	pop hl
	pop de
	pop bc
	pop af
	ret

.asm_8c0e9
	ld de, wChannel1
	ld a, [de]
	or a
	jr z, .asm_8c125
	xor a
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c0ff
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8c125

.asm_8c0ff
	ld a, [wcf94]
	or a
	jr z, .asm_8c122
	xor a
	ld [wcf94], a
	ld hl, $5
	add hl, de
	ld a, [hli]
	ld [rNR10], a
	ld a, [hli]
	ld [rNR11], a
	inc hl
	ld a, [hli]
	or $8
	ld [rNR12], a
	inc hl
	ld a, [hli]
	ld [rNR13], a
	ld a, [hl]
	or $80
	ld [rNR14], a
.asm_8c122
	call UpdateChannel_23
.asm_8c125
	ld de, wChannel2
	ld a, [de]
	or a
	jr z, .asm_8c13f
	ld a, $1
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c13c
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8c13f

.asm_8c13c
	call UpdateChannel_23
.asm_8c13f
	ld de, wChannel3
	ld a, [de]
	or a
	jr z, .asm_8c159
	ld a, $2
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c156
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8c159

.asm_8c156
	call UpdateChannel_23
.asm_8c159
	ld de, wChannel4
	ld a, [de]
	or a
	jr z, Func_8c173
	ld a, $3
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c170
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_8c173

.asm_8c170
	call UpdateChannel_23
Func_8c173: ; 48173 (11:4173)
	ld de, wChannel5
	ld a, [de]
	or a
	jr z, .asm_8c18d
	ld a, $4
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c18a
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8c18d

.asm_8c18a
	call UpdateChannel_23
.asm_8c18d
	ld a, [wcf90]
	or a
	jr nz, Func_8c1ad
	ld de, wChannel6
	ld a, [de]
	or a
	jr z, Func_8c1ad
	ld a, $5
	ld [H_FFA3], a
	call Func_8c2ff
	jr z, .asm_8c1aa
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_8c1ad

.asm_8c1aa
	call UpdateChannel_23
Func_8c1ad:
	ld a, [wcf90]
	or a
	jr z, .asm_8c1b6
	jp Func_8c2fa

.asm_8c1b6
	ld a, [wcfc0]
	or a
	jr nz, .asm_8c1bf
	jp Func_8c2fa

.asm_8c1bf
	ld a, [wcfc7]
	dec a
	ld [wcfc7], a
	jr z, .asm_8c1e1
	cp $1
	jr z, .asm_8c1cf
	jp Func_8c2fa

.asm_8c1cf
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jp Func_8c2fa

.asm_8c1e1
	ld a, [wcfc1]
	ld e, a
	ld a, [wcfc2]
	ld d, a
	ld a, [wcfc5]
	cp $fe
	jr nz, asm_8c268
	call MemSRAMBank_23
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_23
	inc de
	cp $ff
	jr nz, asm_8c217
	xor a
	ld [wcfc0], a
	jp Func_8c2fa

MemSRAMBank_23: ; 48206 (11:4206)
	enable_sram
	ld a, [wcfc9]
	ld [MBC3SRamBank], a
	ret

CloseSRAM_23: ; 48212 (11:4212)
	xor a
	ld [MBC3SRamEnable], a
	ret

asm_8c217
	ld a, [H_FFA8]
	ld c, a
	and $f
	cp $0
	jr nz, .asm_8c22d
	ld a, $7
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_8c268

.asm_8c22d
	cp $1
	jr nz, .asm_8c23d
	ld a, $6
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_8c268

.asm_8c23d
	cp $2
	jr nz, .asm_8c245
	ld a, $5
	jr .asm_8c257

.asm_8c245
	cp $3
	jr nz, .asm_8c24d
	ld a, $4
	jr .asm_8c257

.asm_8c24d
	cp $4
	jr nz, .asm_8c255
	ld a, $3
	jr .asm_8c257

.asm_8c255
	ld a, $2
.asm_8c257
	ld [wcfc5], a
	ld a, c
	and $f0
	srl a
	srl a
	srl a
	srl a
	ld [wcfc6], a
asm_8c268
	call MemSRAMBank_23
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_23
	inc de
	ld a, [H_FFA8]
	cp $fe
	jr nz, .asm_8c295
	ld a, [wcfc8]
	or a
	jr z, .asm_8c28a
	xor a
	ld [H_FFA2], a
	ld [wcfc0], a
	jp Func_8c2fa

.asm_8c28a
	ld a, [wcfc3]
	ld e, a
	ld a, [wcfc4]
	ld d, a
	inc de
	jr asm_8c268

.asm_8c295
	ld c, a
	and $f0
	cp $c0
	jr nz, .asm_8c2ad
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jr .asm_8c2d0

.asm_8c2ad
	ld a, $c0
	ld [rNR11], a
	ld a, $f0
	ld [rNR12], a
	ld a, c
	ld c, a
	and $f
	sla a
	ld b, a
	ld a, c
	and $f0
	or b
	ld hl, Data_8c569
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [rNR13], a
	inc hl
	ld a, [hl]
	or $80
	ld [rNR14], a
.asm_8c2d0
	ld a, [wcfc5]
	and $f
	ld c, a
	call MemSRAMBank_23
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_23
	ld a, [H_FFA8]
	inc de
	and $f
.asm_8c2e6
	or a
	jr z, .asm_8c2ee
	dec a
	sla c
	jr .asm_8c2e6

.asm_8c2ee
	ld a, c
	ld [wcfc7], a
	ld a, e
	ld [wcfc1], a
	ld a, d
	ld [wcfc2], a
Func_8c2fa: ; 482fa (11:42fa)
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_8c2ff: ; 482ff (11:42ff)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $80
	ret

UpdateChannel_23: ; 48307 (11:4307)
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_8c4cd
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_8c33a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_8c8cb
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_8c8cb
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_8c9e3
	call Func_8cad1
	jp Func_8c651

.asm_8c33a
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_8c341
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_8c4e8
asm_8c34e
	ld a, [bc]
	ld [H_FFA4], a
	inc bc
	cp $ef
	jr nz, .asm_8c35d
	ld hl, wcf9b
	inc [hl]
	jr asm_8c34e

.asm_8c35d
	and $f0
	cp $f0
	jr nz, .asm_8c368
	call Func_8c71d
	jr asm_8c341

.asm_8c368
	cp $e0
	jr nz, .asm_8c371
	call Func_8c723
	jr asm_8c341

.asm_8c371
	cp $d0
	jr nz, asm_8c39f
	ld a, [H_FFA4]
	and $f
	ld hl, $9
	add hl, de
	ld [hl], a
	jr asm_8c341

asm_8c381
	ld hl, $8
	add hl, de
	xor a
	ld [hl], a
	call Func_8cb39
	ld hl, $c
	add hl, de
	ld bc, Func_8c39e
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $ff
	call Func_8cb6c
	ld a, $8f
	jp Func_8cb76

Func_8c39e:
	ret

asm_8c39f
	call Func_8c561
	ld hl, $3
	add hl, de
	ld a, [H_FFA4]
	and $f
	ld b, a
	inc b
	xor a
.asm_8c3ae
	add [hl]
	dec b
	jr nz, .asm_8c3ae
	inc hl
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_8c89a
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_8c89a
	ld a, [H_FFA4]
	and $f0
	cp $c0
	jr z, asm_8c381
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_8c3f5
	xor a
	ld [rNR30], a
	ld a, [wcf99]
	add a
	ld hl, Pointers_8cdb3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $10
	ld c, $30
.asm_8c3eb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_8c3eb
	ld a, $80
	ld [rNR30], a
.asm_8c3f5
	ld hl, $7
	add hl, de
	ld a, [hli]
	ld [hl], a
	call Func_8cb39
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_8c41e
	jr asm_8c455

Func_8c40a: ; 4840a (11:440a)
	swap a
	ld hl, $e
	add hl, de
	ld [hli], a
	ld a, [H_FFA8]
	and $f
	swap a
	ld [hl], a
	ld hl, $c
	add hl, de
	ret

Func_8c41e: ; 4841e (11:441e)
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_8c434
	call Func_8c40a
	ld bc, Func_8c9eb
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8c434:
	ld hl, $11
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_8c44a
	call Func_8c40a
	ld bc, Func_8ca1a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8c44a:
	ld hl, $c
	add hl, de
	ld bc, Func_8ca49
	ld [hl], c
	inc hl
	ld [hl], b
	ret

asm_8c455
	ld hl, $15
	add hl, de
	ld a, [hld]
	or a
	jr z, .asm_8c466
	ld b, a
	ld a, [hli]
	inc hl
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hl], $0
.asm_8c466
	ld a, [H_FFA4]
	ld hl, $9
	add hl, de
	ld b, [hl]
	sla b
	and $f0
	add b
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr z, .asm_8c48b
	cp $1
	ld a, [H_FFA8]
	jr nz, Func_8c495
	call Func_8c69d
	ld hl, wcfb5
	jr .asm_8c494

.asm_8c48b
	ld a, [H_FFA8]
	call Func_8c698
	ld hl, wcfb4
.asm_8c494
	ld [hl], a
Func_8c495:
	ld hl, Data_8c569
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [H_FFA6], a
	ld a, [hl]
	ld b, a
	ld [H_FFA7], a
	ld hl, $24
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ld [H_FFA6], a
	ld a, h
	ld [H_FFA7], a
	ld hl, $a
	add hl, de
	ld a, [H_FFA6]
	ld [hli], a
	call Func_8cb6c
	ld a, [H_FFA7]
	and $f
	ld [hl], a
	or $80
	jp Func_8cb76

Func_8c4cd: ; 484cd (11:44cd)
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_8c4d5
	ret

.asm_8c4d5
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_8c4dc
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	or a
	jp z, asm_8c34e
Func_8c4e8: ; 484e8 (11:44e8)
	ld a, [bc]
	inc bc
	ld [H_FFA4], a
	cp $e0
	jp z, Func_8c549
	and $f0
	cp $f0
	jr nz, .asm_8c4fd
	call Func_8c71d
	jr asm_8c4dc

.asm_8c4fd
	cp $e0
	jr nz, .asm_8c506
	call Func_8c723
	jr asm_8c4dc

.asm_8c506
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA4]
	and $f0
	jr z, .asm_8c533
	add $20
	call Func_8cba0
	ld hl, $8
	add hl, de
	ld [hli], a
	call Func_8cb39
	ld a, [bc]
	inc bc
	ld [hli], a
	call Func_8cb6c
	ld a, [H_FFA4]
	and $f
	ld [hl], a
	or $80
	call Func_8cb76
	jr Func_8c561

.asm_8c533
	call Func_8c561
	ld a, [H_FFA4]
	and $f
	swap a
	call Func_8cba0
	or $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

Func_8c549: ; 48549 (11:4549)
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	call Func_8c561
	xor a
	call Func_8cb39
	ld a, $ff
	call Func_8cb6c
	ld a, $8f
	jp Func_8cb76

Func_8c561: ; 48561 (11:4561)
	ld hl, $1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Data_8c569:
	dw  $783,  $706,  $60b,  $413,  $02e, -1, -1, -1
	dw  $78a,  $714,  $627,  $450,  $0a2, -1, -1, -1
	dw  $791,  $721,  $642,  $485,  $108, -1, -1, -1
	dw  $797,  $72d,  $65b,  $4b7,  $16d, -1, -1, -1
	dw  $79d,  $739,  $672,  $4e6,  $1cb, -1, -1, -1
	dw  $7a2,  $744,  $689,  $516,  $225, -1, -1, -1
	dw  $7a8,  $74f,  $69e,  $53c,  $27a, -1, -1, -1
	dw  $7ad,  $759,  $6b2,  $564,  $2c7, -1, -1, -1
	dw  $7b1,  $762,  $6c4,  $589,  $314, -1, -1, -1
	dw  $7b6,  $76b,  $6d6,  $5ad,  $35a, -1, -1, -1
	dw  $7ba,  $774,  $6e9,  $5d2,  $39d, -1, -1, -1
	dw  $7be,  $77b,  $6f9,  $5ed,  $3dc, -1, -1, -1

Func_8c629: ; 48629 (11:4629)
	xor a
	ld [rNR52], a
	ld [rNR50], a
	xor a
	ld [H_FFA2], a
	ld [wcfc0], a
	ld [H_MusicID], a
	ld [wChannel1], a
	ld [wChannel2], a
	ld [wChannel3], a
	ld [wChannel4], a
	ld [wChannel5], a
	ld [wChannel6], a
	ld a, $77
	ld [rNR50], a
	jp Func_8c1ad

Func_8c651: ; 48651 (11:4651)
	ld a, [H_FFA3]
	or a
	jr z, .asm_8c679
	cp $1
	ret nz
	ld a, [wcfb5]
	call Func_8c69d
	ld a, [wcfb1]
	or a
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	ret nz
	ld a, $20
	ld [hl], a
	call Func_8cb39
	call Func_8c6b4
	ld a, [hl]
	jp Func_8c495

.asm_8c679
	ld a, [wcfb4]
	call Func_8c698
	ld a, [wcfb0]
	or a
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	ret nz
	ld a, $20
	ld [hl], a
	call Func_8cb39
	call Func_8c6ac
	ld a, [hl]
	jp Func_8c495

Func_8c698: ; 48698 (11:4698)
	ld hl, wcfb2
	jr asm_8c6a0

Func_8c69d: ; 4869d (11:469d)
	ld hl, wcfb3
asm_8c6a0
	push af
	ld a, [hl]
	inc a
	and $3f
	ld [hl], a
	call Func_8c6c2
	pop af
	ld [hl], a
	ret

Func_8c6ac: ; 486ac (11:46ac)
	ld hl, wcfb0
	ld a, [wcfb2]
	jr asm_8c6ba

Func_8c6b4: ; 486b4 (11:46b4)
	ld hl, wcfb1
	ld a, [wcfb3]
asm_8c6ba
	sub [hl]
	and $3f
	call Func_8c6c2
	ld a, [hl]
	ret

Func_8c6c2: ; 486c2 (11:46c2)
	push bc
	push af
	ld hl, Pointers_8c6d9
	ld a, [H_FFA3]
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	ret

Pointers_8c6d9:
	dw wcf00
	dw wcf40

Pointers_8c6dd:
	dw Func_8c894
	dw Func_8c840
	dw Func_8c846
	dw Func_8c84f
	dw Func_8c864
	dw Func_8c865
	dw Func_8c866
	dw Func_8c867
	dw Func_8c858
	dw Func_8c894
	dw Func_8c86d
	dw Func_8c877
	dw Func_8c88b
	dw Func_8c894
	dw Func_8c894
	dw Func_8c894

Pointers_8c6fd:
	dw Func_8c738
	dw Func_8c73d
	dw Func_8c742
	dw Func_8c749
	dw Func_8c754
	dw Func_8c75f
	dw Func_8c76f
	dw Func_8c777
	dw Func_8c780
	dw Func_8c786
	dw Func_8c799
	dw Func_8c7b6
	dw Func_8c7c9
	dw Func_8c7d2
	dw Func_8c7d8
	dw Func_8c7de

Func_8c71d: ; 4871d (11:471d)
	ld hl, Pointers_8c6fd
	jp Func_8c729

Func_8c723: ; 48723 (11:4723)
	ld hl, Pointers_8c6dd
	jp Func_8c729

Func_8c729: ; 48729 (11:4729)
	ld a, [H_FFA4]
	and $f
	add a
	add l
	ld l, a
	jr nc, .asm_8c734
	inc h
.asm_8c734
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_8c738: ; 48738 (11:4738)
	ld hl, $1a
	jr asm_8c74c

Func_8c73d: ; 4873d (11:473d)
	ld hl, $1a
	jr asm_8c757

Func_8c742: ; 48742 (11:4742)
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld b, a
	ld c, l
	ret

Func_8c749: ; 48749 (11:4749)
	ld hl, $1d
asm_8c74c
	ld a, [bc]
	inc bc
	add hl, de
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8c754: ; 48754 (11:4754)
	ld hl, $1d
asm_8c757
	add hl, de
	dec [hl]
	ret z
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_8c75f: ; 4875f (11:475f)
	ld a, [bc]
	inc bc
	push af
	ld a, [bc]
	inc bc
	ld hl, $20
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld b, a
	pop af
	ld c, a
	ret

Func_8c76f: ; 4876f (11:476f)
	ld hl, $20
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_8c777: ; 48777 (11:4777)
	ld hl, $5
	call Func_8c895
	jp Func_8cb25

Func_8c780: ; 48780 (11:4780)
	ld hl, $24
	jp Func_8c895

Func_8c786: ; 48786 (11:4786)
	ld a, [bc]
	inc bc
	ld hl, $14
	add hl, de
	ld [hli], a
	ld a, [bc]
	and $f0
	swap a
	ld [hli], a
	ld a, [bc]
	inc bc
	and $f
	ld [hl], a
	ret

Func_8c799: ; 48799 (11:4799)
	ld a, [bc]
	inc bc
	push af
	ld hl, $6
	add hl, de
	and $c0
	ld [hl], a
	ld a, [H_FFA3]
	cp $2
	jr z, .asm_8c7ae
	ld a, [hl]
	call Func_8cb2f
.asm_8c7ae
	inc hl
	pop af
	and $f
	swap a
	ld [hl], a
	ret

Func_8c7b6: ; 487b6 (11:47b6)
	ld hl, $10
	add hl, de
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hl], a
	jp Func_8c88b

Func_8c7c9: ; 487c9 (11:47c9)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	ret

Func_8c7d2: ; 487d2 (11:47d2)
	ld hl, $3
	jp Func_8c895

Func_8c7d8: ; 487d8 (11:47d8)
	ld hl, $23
	jp Func_8c895

Func_8c7de: ; 487de (11:47de)
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_8c7f4
	ld a, [wChannel4]
	or a
	ret nz
	xor a
	ld [rNR42], a
	ret

.asm_8c7f4
	cp $4
	jr nz, .asm_8c7fd
	ld a, $ff
	ld [wcf94], a
.asm_8c7fd
	ld hl, Data_8cd95
	ld a, [H_FFA3]
	or a
	jr z, .asm_8c82a
	push bc
	ld b, $0
	cp $1
	jr nz, .asm_8c811
	ld c, $5
	jr .asm_8c828

.asm_8c811
	cp $2
	jr nz, .asm_8c819
	ld c, $a
	jr .asm_8c828

.asm_8c819
	cp $3
	jr nz, .asm_8c826
	ld c, $f
	ld a, $ff
	ld [wcf9a], a
	jr .asm_8c828

.asm_8c826
	ld c, $14
.asm_8c828
	add hl, bc
	pop bc
.asm_8c82a
	ld a, [hli]
	cp $ee
	call nz, Func_8cb25
	ld a, [hli]
	call Func_8cb2f
	ld a, [hli]
	call Func_8cb39
	ld a, [hli]
	call Func_8cb6c
	ld a, [hl]
	jp Func_8cb76

Func_8c840: ; 48840 (11:4840)
	ld hl, $3
	jp Func_8c895

Func_8c846: ; 48846 (11:4846)
	ld hl, $a
	call Func_8c895
	ld [rNR43], a
	ret

Func_8c84f: ; 4884f (11:484f)
	ld hl, $6
	call Func_8c895
	jp Func_8cb2f

Func_8c858: ; 48858 (11:4858)
	ld hl, wcfb0
	ld a, [H_FFA3]
	add l
	ld l, a
	ld a, [bc]
	inc bc
	ld [hl], a
	ret

Func_8c864: ; 48864 (11:4864)
	ret

Func_8c865: ; 48865 (11:4865)
	ret

Func_8c866: ; 48866 (11:4866)
	ret

Func_8c867: ; 48867 (11:4867)
	ld a, [bc]
	inc bc
	ld [wcf99], a
	ret

Func_8c86d: ; 4886d (11:486d)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	jr asm_8c87f

Func_8c877: ; 48877 (11:4877)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
asm_8c87f
	ld hl, $7
	add hl, de
	ld a, [bc]
	inc bc
	and $f
	swap a
	ld [hl], a
	ret

Func_8c88b: ; 4888b (11:488b)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
	ret

Func_8c894: ; 48894 (11:4894)
	ret

Func_8c895: ; 48895 (11:4895)
	ld a, [bc]
	inc bc
	add hl, de
	ld [hl], a
	ret

Func_8c89a: ; 4889a (11:489a)
	ld a, [wChannel4]
	or a
	ret nz
	ld a, [wcf9a]
	or a
	jr z, .asm_8c8b5
	xor a
	ld [wcf9a], a
	ld a, [wcf95]
	and $77
	or $88
	ld [rNR51], a
	ld [wcf95], a
.asm_8c8b5
	ld a, [H_FFA4]
	and $f0
	swap a
	add a
	ld hl, Pointers_8c937
	add l
	ld l, a
	jr nc, .asm_8c8c5
	inc h
.asm_8c8c5
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jp Func_8c8e0

Func_8c8cb: ; 488cb (11:48cb)
	ld a, [wChannel4]
	or a
	ret nz
	ld hl, $11
	add hl, de
	dec [hl]
	ret nz
	ld hl, $c
	add hl, de
	ld a, [hl]
	or a
	ret z
	ld c, a
	inc hl
	ld b, [hl]
Func_8c8e0: ; 488e0 (11:48e0)
	ld a, [bc]
	inc bc
	ld [H_FFA5], a
	cp $ff
	jr nz, .asm_8c8f7
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld hl, $c
	add hl, de
	ld [hli], a
	ld [hl], a
	ret

.asm_8c8f7
	ld a, [H_FFA5]
	and $f0
	jr nz, .asm_8c91a
	ld hl, $10
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA5]
	swap a
	ld [rNR42], a
	call Func_8cba0
	ld a, $80
	ld [rNR44], a
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

.asm_8c91a
	cp $e0
	jr nz, .asm_8c92b
	ld a, [H_FFA5]
	and $f
	ld hl, $10
	add hl, de
	ld [hl], a
	jp Func_8c8e0

.asm_8c92b
	ld a, [bc]
	inc bc
	ld hl, $a
	add hl, de
	ld [hl], a
	ld [rNR43], a
	jp Func_8c8e0

Pointers_8c937:
	dw Data_8c951
	dw Data_8c95d
	dw Data_8c965
	dw Data_8c96d
	dw Data_8c978
	dw Data_8c985
	dw Data_8c991
	dw Data_8c99d
	dw Data_8c9aa
	dw Data_8c9b7
	dw Data_8c9c7
	dw Data_8c9d3
	dw Data_8c9e2

Data_8c951:
	db $e1, $d0, $36, $0f, $d0, $37, $0f, $d0, $35, $03, $02, $ff

Data_8c95d:
	db $e1, $d0, $01, $09, $d0, $00, $04, $ff

Data_8c965:
	db $e1, $d0, $01, $0c, $d0, $00, $06, $ff

Data_8c96d:
	db $e1, $d0, $01, $0b, $e6, $05, $04, $03, $02, $01, $ff

Data_8c978:
	db $e1, $d0, $01, $0e, $e6, $07, $06, $05, $04, $03, $02, $01, $ff

Data_8c985:
	db $e1, $d0, $15, $0b, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_8c991:
	db $e1, $d0, $15, $0c, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_8c99d:
	db $e1, $d0, $15, $0d, $d0, $16, $e3, $05, $04, $03, $02, $01, $ff

Data_8c9aa:
	db $e1, $d0, $15, $0e, $d0, $07, $e3, $05, $04, $03, $02, $01, $ff

Data_8c9b7:
	db $e1, $d0, $4f, $0f, $d0, $3f, $0e, $d0, $3d, $e4, $05, $04, $03, $02, $01, $ff

Data_8c9c7:
	db $e1, $d0, $2c, $0c, $e6, $d0, $11, $0d, $0a, $06, $02, $ff

Data_8c9d3:
	db $e1, $d0, $3c, $0b, $d0, $4c, $0b, $d0, $5c, $0b, $07, $e3, $04, $02, $ff

Data_8c9e2:
	db $ff

Func_8c9e3: ; 489e3 (11:49e3)
	ld hl, $c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_8c9eb: ; 489eb (11:49eb)
	call Func_8caa9
	jp nc, Func_8ca4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	add [hl]
	jr nc, .asm_8c9ff
	ld a, $f0
.asm_8c9ff
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_8cb39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_8cb76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_8c434
	ret

Func_8ca1a: ; 48a1a (11:4a1a)
	call Func_8caa9
	jp nc, Func_8ca4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	sub [hl]
	jr nc, .asm_8ca2e
	ld a, $10
.asm_8ca2e
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_8cb39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_8cb76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_8c44a
	ret

Func_8ca49: ; 48a49 (11:4a49)
	call Func_8caa9
	ret c
Func_8ca4d: ; 48a4d (11:4a4d)
	call Func_8cab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	call Func_8c40a
	ld bc, Func_8ca64
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8ca64:
	ld hl, $f
	add hl, de
	ld a, [hl]
	sub $10
	ld [hl], a
	ret nz
	ld hl, $e
	add hl, de
	ld a, [hl]
	dec a
	jr z, .asm_8ca88
	ld [hl], a
	call Func_8cab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, $f
	add hl, de
	ld [hl], a
	ret

.asm_8ca88
	ld hl, $8
	add hl, de
	ld [hl], $0
	call Func_8cb39
	push bc
	ld bc, Func_8caa8
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ld a, [H_FFA3]
	cp $2
	ret z
	ld a, $80
	jp Func_8cb76

Func_8caa8:
	ret

Func_8caa9: ; 48aa9 (11:4aa9)
	ld hl, $12
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	cp [hl]
	ret

Func_8cab4: ; 48ab4 (11:4ab4)
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_8cac3
	sub $10
	jr nz, Func_8cac3
	ld a, $10
Func_8cac3: ; 48ac3 (11:4ac3)
	ld [hl], a
	call Func_8cb39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	jp Func_8cb76

Func_8cad1: ; 48ad1 (11:4ad1)
	ld hl, $16
	add hl, de
	ld a, [hli]
	or a
	ret z
	ld a, [hl]
	or a
	jr z, .asm_8cade
	dec [hl]
	ret

.asm_8cade
	inc hl
	dec [hl]
	jr z, .asm_8cae3
	ret

.asm_8cae3
	ld hl, $15
	add hl, de
	ld a, [hli]
	inc hl
	inc hl
	ld [hl], a
	ld hl, $19
	add hl, de
	ld a, [hl]
	xor $1
	ld [hl], a
	ld hl, $16
	add hl, de
	ld a, [hl]
	jr z, .asm_8cb18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	add c
	ld c, a
	jr nc, .asm_8cb06
	inc b
.asm_8cb06
	ld hl, $a
	add hl, de
	ld a, c
	ld [hli], a
	call Func_8cb6c
	ld a, b
	cp [hl]
	ret z
	ld [hl], a
	and $f
	jp Func_8cb76

.asm_8cb18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_8cb1f
	dec bc
	dec a
	jr nz, .asm_8cb1f
	jr .asm_8cb06

Func_8cb25: ; 48b25 (11:4b25)
	call Func_8cb90
	ret nz
	push hl
	ld hl, Pointers_8cbb0
	jr asm_8cb7e

Func_8cb2f: ; 48b2f (11:4b2f)
	call Func_8cb90
	ret nz
	push hl
	ld hl, Pointers_8cbbc
	jr asm_8cb7e

Func_8cb39: ; 48b39 (11:4b39)
	call Func_8cb90
	ret nz
	push hl
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_8cb5d
	ld a, [H_FFA8]
	swap a
	and $f
	ld hl, Data_8cbec
	add l
	ld l, a
	jr nc, .asm_8cb54
	inc h
.asm_8cb54
	ld a, [hl]
	ld [H_FFA8], a
	ld hl, Pointers_8cbc8
	jr asm_8cb7e

.asm_8cb5d
	ld a, [H_FFA8]
	and $f0
	or $8
	ld [H_FFA8], a
	ld hl, Pointers_8cbc8
	jr asm_8cb7e

Func_8cb6c: ; 48b6c (11:4b6c)
	call Func_8cb90
	ret nz
	push hl
	ld hl, Pointers_8cbd4
	jr asm_8cb7e

Func_8cb76: ; 48b76 (11:4b76)
	call Func_8cb90
	ret nz
	push hl
	ld hl, Pointers_8cbe0
asm_8cb7e
	ld a, [H_FFA3]
	add a
	add l
	ld l, a
	jr nc, .asm_8cb87
	inc h
.asm_8cb87
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_FFA8]
	ld [hl], a
	pop hl
	ret

Func_8cb90: ; 48b90 (11:4b90)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr nz, .asm_8cb9e
	ld a, [wChannel5]
	or a
	ret

.asm_8cb9e
	xor a
	ret

Func_8cba0: ; 48ba0 (11:4ba0)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	add $f0
	ld l, a
	ld h, $cf
	ld a, [H_FFA8]
	ld [hl], a
	ret

Pointers_8cbb0:
	dw rNR10, rNR20, rNR30, rNR40, rNR10, rNR40
Pointers_8cbbc:
	dw rNR11, rNR21, rNR31, rNR41, rNR11, rNR41
Pointers_8cbc8:
	dw rNR12, rNR22, rNR32, rNR42, rNR12, rNR42
Pointers_8cbd4:
	dw rNR13, rNR23, rNR33, rNR43, rNR13, rNR43
Pointers_8cbe0:
	dw rNR14, rNR24, rNR34, rNR44, rNR14, rNR44

Data_8cbec:
	db $00, $60, $40, $20
	db $00, $00, $00, $00

PlayMusic_23: ; 48bf4 (11:4bf4)
	xor a
	ld [wcf96], a
	ld [wcf97], a
	ld [wcf9b], a
	ld [wcfb0], a
	ld [wcfb1], a
	ld [wcfb4], a
	ld [wcfb5], a
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, MusicPointers_23
	ld a, [H_MusicID]
	jp Func_8ccdd

PlaySFX_23: ; 48c22 (11:4c22)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, SFXPointers_23
	ld a, [H_SFX_ID]
	jp Func_8ccdd

Func_8cc3a: ; 48c3a (11:4c3a)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, Pointers_8f9cd
	xor a
	ld [wcfc8], a
	ld a, [H_FFA2]
	and $80
	jr z, .asm_8cc5c
	ld a, $ff
	ld [wcfc8], a
.asm_8cc5c
	ld a, [H_FFA2]
	and $7f
	ld [wcfc0], a
	cp $50
	jr c, .asm_8cc6b
	jp Func_8ccad

.asm_8cc6b
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
Func_8cc71: ; 48c71 (11:4c71)
	ld a, [hli]
	ld [wcfc1], a
	ld [wcfc3], a
	ld a, [hl]
	ld [wcfc2], a
	ld [wcfc4], a
	ld a, $1
	ld [wcfc7], a
	ld a, $fe
	ld [wcfc5], a
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [wcfc6], a
	ld [rNR11], a
	ld [rNR13], a
	ld [rNR30], a
	ld [rNR31], a
	ld [rNR32], a
	ld [rNR33], a
	ld a, $80
	ld [rNR14], a
	ld [rNR34], a
	xor a
	ld [wChannel4], a
	ld [wChannel5], a
	ret

Func_8ccad: ; 48cad (11:4cad)
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	ld h, [hl]
	ld l, c
	ld a, [hli]
	ld [wcfc9], a
	jp Func_8cc71

Func_8ccbe:
	enable_sram
	ld a, c
	ld [MBC3SRamBank], a
asm_8ccc7
	inc bc
	inc bc
asm_8ccc9
	ld a, [H_FFA3]
	inc a
	ld [H_FFA3], a
	cp $6
	jr nz, .asm_8ccd5
	ret

.asm_8ccd5
	ld hl, $28
	add hl, de
	ld e, l
	ld d, h
	jr asm_8ccf7

Func_8ccdd: ; 48cdd (11:4cdd)
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [bc]
	ld [wcf92], a
	inc bc
	ld a, [bc]
	ld [wcf93], a
	inc bc
	ld de, wChannel1
	xor a
	ld [H_FFA3], a
asm_8ccf7
	ld a, [wcf92]
	add a
	ld [wcf92], a
	jr nc, asm_8ccc9
	ld hl, $0
	add hl, de
	ld a, [wcf93]
	cp [hl]
	jr c, asm_8ccc7
	push de
	ld l, wChannel2 - wChannel1
	xor a
.asm_8cd0e
	ld [de], a
	inc de
	dec l
	jr nz, .asm_8cd0e
	pop de
	ld hl, $4
	add hl, de
	ld [hl], $1
	ld hl, $b
	add hl, de
	ld [hl], $ff
	call Func_8c866
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_8cd3f
	ld a, [wChannel4]
	or a
	jp nz, Func_8cd7d
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	jp Func_8cd7d

.asm_8cd3f
	push bc
	ld hl, Data_8cd95
	ld a, [H_FFA3]
	or a
	jr z, .asm_8cd66
	ld b, $0
	cp $1
	jr nz, .asm_8cd53
	ld c, $5
	jr .asm_8cd65

.asm_8cd53
	cp $2
	jr nz, .asm_8cd5b
	ld c, $a
	jr .asm_8cd65

.asm_8cd5b
	cp $3
	jr nz, .asm_8cd63
	ld c, $f
	jr .asm_8cd65

.asm_8cd63
	ld c, $14
.asm_8cd65
	add hl, bc
.asm_8cd66
	pop bc
	ld a, [hli]
	cp $ee
	call nz, Func_8cb25
	ld a, [hli]
	call Func_8cb2f
	ld a, [hli]
	call Func_8cb39
	ld a, [hli]
	call Func_8cb6c
	ld a, [hl]
	call Func_8cb76
Func_8cd7d: ; 48d7d (11:4d7d)
	ld hl, $0
	add hl, de
	ld a, [wcf93]
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hl], a
	ld hl, $22
	add hl, de
	ld a, $80
	ld [hl], a
	jp asm_8ccc9

Data_8cd95:
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80
	db $00, $00, $00, $00, $80
	db $ee, $00, $08, $00, $80
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80

Pointers_8cdb3:
	dw Data_8cdd5
	dw Data_8cde5
	dw Data_8cdf5
	dw Data_8ce05
	dw Data_8ce15
	dw Data_8ce25
	dw Data_8ce35
	dw Data_8ce45
	dw Data_8ce55
	dw Data_8ce65
	dw Data_8ce75
	dw Data_8ce85
	dw Data_8ce95
	dw Data_8cea5
	dw Data_8ceb5
	dw Data_8cec5
	dw Data_8ced5

Data_8cdd5: db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
Data_8cde5: db $00, $11, $23, $46, $8c, $de, $ef, $ff, $ff, $ee, $dc, $b9, $73, $21, $10, $00
Data_8cdf5: db $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8
Data_8ce05: db $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d
Data_8ce15: db $01, $24, $8b, $de, $fe, $eb, $84, $21, $01, $24, $8b, $de, $fe, $eb, $84, $21
Data_8ce25: db $9b, $ce, $fd, $cb, $ba, $aa, $99, $88, $77, $66, $55, $54, $43, $20, $13, $46
Data_8ce35: db $bf, $ff, $da, $88, $76, $31, $01, $37, $bc, $ef, $ec, $98, $77, $52, $00, $04
Data_8ce45: db $b9, $53, $02, $44, $56, $8b, $cb, $ac, $df, $ec, $d6, $74, $33, $24, $35, $20
Data_8ce55: db $fc, $d5, $63, $43, $64, $46, $86, $47, $66, $06, $ce, $96, $49, $64, $64, $34
Data_8ce65: db $f8, $0c, $5a, $87, $a7, $89, $87, $98, $79, $87, $98, $7a, $79, $a5, $c0, $7f
Data_8ce75: db $8f, $0c, $49, $67, $89, $6b, $3f, $07, $8f, $0c, $49, $67, $89, $6b, $3f, $07
Data_8ce85: db $f0, $a5, $97, $87, $87, $86, $a5, $f0, $f0, $a5, $97, $87, $87, $86, $a5, $f0
Data_8ce95: db $fc, $ba, $a9, $98, $76, $65, $54, $30, $fc, $ba, $a9, $98, $76, $65, $54, $30
Data_8cea5: db $8f, $6c, $28, $5f, $0a, $6d, $39, $07, $8f, $6c, $28, $5f, $0a, $6d, $39, $07
Data_8ceb5: db $fa, $b7, $97, $84, $b7, $86, $84, $50, $fa, $b7, $97, $84, $b7, $86, $84, $50
Data_8cec5: db $bf, $dc, $dc, $b9, $64, $32, $32, $04, $bf, $dc, $dc, $b9, $64, $32, $32, $04
Data_8ced5: db $be, $de, $96, $76, $98, $95, $12, $14, $be, $de, $96, $76, $98, $95, $12, $14

SFXPointers_23:
INCLUDE "audio/unknown_sfx_8cee5.asm"

MusicPointers_23:
INCLUDE "audio/unknown_sfx_8dfe2.asm"

Pointers_8f9cd:
	db $ff
