UpdateSound_20:
	push af
	push bc
	push de
	push hl
	ld a, [H_MusicID]
	cp $1
	jp z, Func_80629
	or a
	jr z, .asm_80018
	call PlayMusic_20
	xor a
	ld [H_MusicID], a
	jr .asm_8003e

.asm_80018
	ld a, [wcfc0]
	or a
	jr z, .asm_80022
	xor a
	ld [H_SFX_ID], a
.asm_80022
	ld a, [H_SFX_ID]
	or a
	jr z, .asm_80031
	call PlaySFX_20
	xor a
	ld [H_SFX_ID], a
	jr .asm_8003e

.asm_80031
	ld a, [H_FFA2]
	or a
	jr z, .asm_8003e
	call Func_80c3a
	xor a
	ld [H_FFA2], a
.asm_8003e
	ld a, [wcf90]
	or a
	jr z, .asm_80064
	ld a, [wcf91]
	or a
	jp nz, Func_80173
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
	jp Func_80173

.asm_80064
	ld a, [wcf91]
	or a
	jr z, .asm_80081
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
.asm_80081
	ld a, [wcf96]
	or a
	jr z, .asm_800e9
	ld a, [wcf97]
	or a
	jr z, .asm_80093
	dec a
	ld [wcf97], a
	jr .asm_800e9

.asm_80093
	ld a, [wcf98]
	sub $22
	jr c, .asm_800a7
	ld [wcf98], a
	ld [rNR50], a
	ld a, [wcf96]
	ld [wcf97], a
	jr .asm_800e9

.asm_800a7
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

.asm_800e9
	ld de, wChannel1
	ld a, [de]
	or a
	jr z, .asm_80125
	xor a
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_800ff
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_80125

.asm_800ff
	ld a, [wcf94]
	or a
	jr z, .asm_80122
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
.asm_80122
	call UpdateChannel_20
.asm_80125
	ld de, wChannel2
	ld a, [de]
	or a
	jr z, .asm_8013f
	ld a, $1
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_8013c
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8013f

.asm_8013c
	call UpdateChannel_20
.asm_8013f
	ld de, wChannel3
	ld a, [de]
	or a
	jr z, .asm_80159
	ld a, $2
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_80156
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_80159

.asm_80156
	call UpdateChannel_20
.asm_80159
	ld de, wChannel4
	ld a, [de]
	or a
	jr z, Func_80173
	ld a, $3
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_80170
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_80173

.asm_80170
	call UpdateChannel_20
Func_80173: ; 48173 (11:4173)
	ld de, wChannel5
	ld a, [de]
	or a
	jr z, .asm_8018d
	ld a, $4
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_8018a
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8018d

.asm_8018a
	call UpdateChannel_20
.asm_8018d
	ld a, [wcf90]
	or a
	jr nz, Func_801ad
	ld de, wChannel6
	ld a, [de]
	or a
	jr z, Func_801ad
	ld a, $5
	ld [H_FFA3], a
	call Func_802ff
	jr z, .asm_801aa
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_801ad

.asm_801aa
	call UpdateChannel_20
Func_801ad:
	ld a, [wcf90]
	or a
	jr z, .asm_801b6
	jp Func_802fa

.asm_801b6
	ld a, [wcfc0]
	or a
	jr nz, .asm_801bf
	jp Func_802fa

.asm_801bf
	ld a, [wcfc7]
	dec a
	ld [wcfc7], a
	jr z, .asm_801e1
	cp $1
	jr z, .asm_801cf
	jp Func_802fa

.asm_801cf
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jp Func_802fa

.asm_801e1
	ld a, [wcfc1]
	ld e, a
	ld a, [wcfc2]
	ld d, a
	ld a, [wcfc5]
	cp $fe
	jr nz, asm_80268
	call MemSRAMBank_20
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_20
	inc de
	cp $ff
	jr nz, asm_80217
	xor a
	ld [wcfc0], a
	jp Func_802fa

MemSRAMBank_20: ; 48206 (11:4206)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, [wcfc9]
	ld [MBC3SRamBank], a
	ret

CloseSRAM_20: ; 48212 (11:4212)
	xor a
	ld [MBC3SRamEnable], a
	ret

asm_80217
	ld a, [H_FFA8]
	ld c, a
	and $f
	cp $0
	jr nz, .asm_8022d
	ld a, $7
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_80268

.asm_8022d
	cp $1
	jr nz, .asm_8023d
	ld a, $6
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_80268

.asm_8023d
	cp $2
	jr nz, .asm_80245
	ld a, $5
	jr .asm_80257

.asm_80245
	cp $3
	jr nz, .asm_8024d
	ld a, $4
	jr .asm_80257

.asm_8024d
	cp $4
	jr nz, .asm_80255
	ld a, $3
	jr .asm_80257

.asm_80255
	ld a, $2
.asm_80257
	ld [wcfc5], a
	ld a, c
	and $f0
	srl a
	srl a
	srl a
	srl a
	ld [wcfc6], a
asm_80268
	call MemSRAMBank_20
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_20
	inc de
	ld a, [H_FFA8]
	cp $fe
	jr nz, .asm_80295
	ld a, [wcfc8]
	or a
	jr z, .asm_8028a
	xor a
	ld [H_FFA2], a
	ld [wcfc0], a
	jp Func_802fa

.asm_8028a
	ld a, [wcfc3]
	ld e, a
	ld a, [wcfc4]
	ld d, a
	inc de
	jr asm_80268

.asm_80295
	ld c, a
	and $f0
	cp $c0
	jr nz, .asm_802ad
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jr .asm_802d0

.asm_802ad
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
	ld hl, Data_80569
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [rNR13], a
	inc hl
	ld a, [hl]
	or $80
	ld [rNR14], a
.asm_802d0
	ld a, [wcfc5]
	and $f
	ld c, a
	call MemSRAMBank_20
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_20
	ld a, [H_FFA8]
	inc de
	and $f
.asm_802e6
	or a
	jr z, .asm_802ee
	dec a
	sla c
	jr .asm_802e6

.asm_802ee
	ld a, c
	ld [wcfc7], a
	ld a, e
	ld [wcfc1], a
	ld a, d
	ld [wcfc2], a
Func_802fa: ; 482fa (11:42fa)
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_802ff: ; 482ff (11:42ff)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $80
	ret

UpdateChannel_20: ; 48307 (11:4307)
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_804cd
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_8033a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_808cb
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_808cb
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_809e3
	call Func_80ad1
	jp Func_80651

.asm_8033a
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_80341
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_804e8
asm_8034e
	ld a, [bc]
	ld [H_FFA4], a
	inc bc
	cp $ef
	jr nz, .asm_8035d
	ld hl, wcf9b
	inc [hl]
	jr asm_8034e

.asm_8035d
	and $f0
	cp $f0
	jr nz, .asm_80368
	call Func_8071d
	jr asm_80341

.asm_80368
	cp $e0
	jr nz, .asm_80371
	call Func_80723
	jr asm_80341

.asm_80371
	cp $d0
	jr nz, asm_8039f
	ld a, [H_FFA4]
	and $f
	ld hl, $9
	add hl, de
	ld [hl], a
	jr asm_80341

asm_80381
	ld hl, $8
	add hl, de
	xor a
	ld [hl], a
	call Func_80b39
	ld hl, $c
	add hl, de
	ld bc, Func_8039e
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $ff
	call Func_80b6c
	ld a, $8f
	jp Func_80b76

Func_8039e:
	ret

asm_8039f
	call Func_80561
	ld hl, $3
	add hl, de
	ld a, [H_FFA4]
	and $f
	ld b, a
	inc b
	xor a
.asm_803ae
	add [hl]
	dec b
	jr nz, .asm_803ae
	inc hl
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_8089a
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_8089a
	ld a, [H_FFA4]
	and $f0
	cp $c0
	jr z, asm_80381
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_803f5
	xor a
	ld [rNR30], a
	ld a, [wcf99]
	add a
	ld hl, Pointers_80db3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $10
	ld c, $30
.asm_803eb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_803eb
	ld a, $80
	ld [rNR30], a
.asm_803f5
	ld hl, $7
	add hl, de
	ld a, [hli]
	ld [hl], a
	call Func_80b39
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_8041e
	jr asm_80455

Func_8040a: ; 4840a (11:440a)
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

Func_8041e: ; 4841e (11:441e)
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_80434
	call Func_8040a
	ld bc, Func_809eb
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_80434:
	ld hl, $11
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_8044a
	call Func_8040a
	ld bc, Func_80a1a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8044a:
	ld hl, $c
	add hl, de
	ld bc, Func_80a49
	ld [hl], c
	inc hl
	ld [hl], b
	ret

asm_80455
	ld hl, $15
	add hl, de
	ld a, [hld]
	or a
	jr z, .asm_80466
	ld b, a
	ld a, [hli]
	inc hl
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hl], $0
.asm_80466
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
	jr z, .asm_8048b
	cp $1
	ld a, [H_FFA8]
	jr nz, Func_80495
	call Func_8069d
	ld hl, wcfb5
	jr .asm_80494

.asm_8048b
	ld a, [H_FFA8]
	call Func_80698
	ld hl, wcfb4
.asm_80494
	ld [hl], a
Func_80495:
	ld hl, Data_80569
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
	call Func_80b6c
	ld a, [H_FFA7]
	and $f
	ld [hl], a
	or $80
	jp Func_80b76

Func_804cd: ; 484cd (11:44cd)
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_804d5
	ret

.asm_804d5
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_804dc
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	or a
	jp z, asm_8034e
Func_804e8: ; 484e8 (11:44e8)
	ld a, [bc]
	inc bc
	ld [H_FFA4], a
	cp $e0
	jp z, Func_80549
	and $f0
	cp $f0
	jr nz, .asm_804fd
	call Func_8071d
	jr asm_804dc

.asm_804fd
	cp $e0
	jr nz, .asm_80506
	call Func_80723
	jr asm_804dc

.asm_80506
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA4]
	and $f0
	jr z, .asm_80533
	add $20
	call Func_80ba0
	ld hl, $8
	add hl, de
	ld [hli], a
	call Func_80b39
	ld a, [bc]
	inc bc
	ld [hli], a
	call Func_80b6c
	ld a, [H_FFA4]
	and $f
	ld [hl], a
	or $80
	call Func_80b76
	jr Func_80561

.asm_80533
	call Func_80561
	ld a, [H_FFA4]
	and $f
	swap a
	call Func_80ba0
	or $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

Func_80549: ; 48549 (11:4549)
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	call Func_80561
	xor a
	call Func_80b39
	ld a, $ff
	call Func_80b6c
	ld a, $8f
	jp Func_80b76

Func_80561: ; 48561 (11:4561)
	ld hl, $1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Data_80569:
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

Func_80629: ; 48629 (11:4629)
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
	jp Func_801ad

Func_80651: ; 48651 (11:4651)
	ld a, [H_FFA3]
	or a
	jr z, .asm_80679
	cp $1
	ret nz
	ld a, [wcfb5]
	call Func_8069d
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
	call Func_80b39
	call Func_806b4
	ld a, [hl]
	jp Func_80495

.asm_80679
	ld a, [wcfb4]
	call Func_80698
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
	call Func_80b39
	call Func_806ac
	ld a, [hl]
	jp Func_80495

Func_80698: ; 48698 (11:4698)
	ld hl, wcfb2
	jr asm_806a0

Func_8069d: ; 4869d (11:469d)
	ld hl, wcfb3
asm_806a0
	push af
	ld a, [hl]
	inc a
	and $3f
	ld [hl], a
	call Func_806c2
	pop af
	ld [hl], a
	ret

Func_806ac: ; 486ac (11:46ac)
	ld hl, wcfb0
	ld a, [wcfb2]
	jr asm_806ba

Func_806b4: ; 486b4 (11:46b4)
	ld hl, wcfb1
	ld a, [wcfb3]
asm_806ba
	sub [hl]
	and $3f
	call Func_806c2
	ld a, [hl]
	ret

Func_806c2: ; 486c2 (11:46c2)
	push bc
	push af
	ld hl, Pointers_806d9
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

Pointers_806d9:
	dw wcf00
	dw wcf40

Pointers_806dd:
	dw Func_80894
	dw Func_80840
	dw Func_80846
	dw Func_8084f
	dw Func_80864
	dw Func_80865
	dw Func_80866
	dw Func_80867
	dw Func_80858
	dw Func_80894
	dw Func_8086d
	dw Func_80877
	dw Func_8088b
	dw Func_80894
	dw Func_80894
	dw Func_80894

Pointers_806fd:
	dw Func_80738
	dw Func_8073d
	dw Func_80742
	dw Func_80749
	dw Func_80754
	dw Func_8075f
	dw Func_8076f
	dw Func_80777
	dw Func_80780
	dw Func_80786
	dw Func_80799
	dw Func_807b6
	dw Func_807c9
	dw Func_807d2
	dw Func_807d8
	dw Func_807de

Func_8071d: ; 4871d (11:471d)
	ld hl, Pointers_806fd
	jp Func_80729

Func_80723: ; 48723 (11:4723)
	ld hl, Pointers_806dd
	jp Func_80729

Func_80729: ; 48729 (11:4729)
	ld a, [H_FFA4]
	and $f
	add a
	add l
	ld l, a
	jr nc, .asm_80734
	inc h
.asm_80734
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_80738: ; 48738 (11:4738)
	ld hl, $1a
	jr asm_8074c

Func_8073d: ; 4873d (11:473d)
	ld hl, $1a
	jr asm_80757

Func_80742: ; 48742 (11:4742)
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld b, a
	ld c, l
	ret

Func_80749: ; 48749 (11:4749)
	ld hl, $1d
asm_8074c
	ld a, [bc]
	inc bc
	add hl, de
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_80754: ; 48754 (11:4754)
	ld hl, $1d
asm_80757
	add hl, de
	dec [hl]
	ret z
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_8075f: ; 4875f (11:475f)
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

Func_8076f: ; 4876f (11:476f)
	ld hl, $20
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_80777: ; 48777 (11:4777)
	ld hl, $5
	call Func_80895
	jp Func_80b25

Func_80780: ; 48780 (11:4780)
	ld hl, $24
	jp Func_80895

Func_80786: ; 48786 (11:4786)
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

Func_80799: ; 48799 (11:4799)
	ld a, [bc]
	inc bc
	push af
	ld hl, $6
	add hl, de
	and $c0
	ld [hl], a
	ld a, [H_FFA3]
	cp $2
	jr z, .asm_807ae
	ld a, [hl]
	call Func_80b2f
.asm_807ae
	inc hl
	pop af
	and $f
	swap a
	ld [hl], a
	ret

Func_807b6: ; 487b6 (11:47b6)
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
	jp Func_8088b

Func_807c9: ; 487c9 (11:47c9)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	ret

Func_807d2: ; 487d2 (11:47d2)
	ld hl, $3
	jp Func_80895

Func_807d8: ; 487d8 (11:47d8)
	ld hl, $23
	jp Func_80895

Func_807de: ; 487de (11:47de)
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_807f4
	ld a, [wChannel4]
	or a
	ret nz
	xor a
	ld [rNR42], a
	ret

.asm_807f4
	cp $4
	jr nz, .asm_807fd
	ld a, $ff
	ld [wcf94], a
.asm_807fd
	ld hl, Data_80d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_8082a
	push bc
	ld b, $0
	cp $1
	jr nz, .asm_80811
	ld c, $5
	jr .asm_80828

.asm_80811
	cp $2
	jr nz, .asm_80819
	ld c, $a
	jr .asm_80828

.asm_80819
	cp $3
	jr nz, .asm_80826
	ld c, $f
	ld a, $ff
	ld [wcf9a], a
	jr .asm_80828

.asm_80826
	ld c, $14
.asm_80828
	add hl, bc
	pop bc
.asm_8082a
	ld a, [hli]
	cp $ee
	call nz, Func_80b25
	ld a, [hli]
	call Func_80b2f
	ld a, [hli]
	call Func_80b39
	ld a, [hli]
	call Func_80b6c
	ld a, [hl]
	jp Func_80b76

Func_80840: ; 48840 (11:4840)
	ld hl, $3
	jp Func_80895

Func_80846: ; 48846 (11:4846)
	ld hl, $a
	call Func_80895
	ld [rNR43], a
	ret

Func_8084f: ; 4884f (11:484f)
	ld hl, $6
	call Func_80895
	jp Func_80b2f

Func_80858: ; 48858 (11:4858)
	ld hl, wcfb0
	ld a, [H_FFA3]
	add l
	ld l, a
	ld a, [bc]
	inc bc
	ld [hl], a
	ret

Func_80864: ; 48864 (11:4864)
	ret

Func_80865: ; 48865 (11:4865)
	ret

Func_80866: ; 48866 (11:4866)
	ret

Func_80867: ; 48867 (11:4867)
	ld a, [bc]
	inc bc
	ld [wcf99], a
	ret

Func_8086d: ; 4886d (11:486d)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	jr asm_8087f

Func_80877: ; 48877 (11:4877)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
asm_8087f
	ld hl, $7
	add hl, de
	ld a, [bc]
	inc bc
	and $f
	swap a
	ld [hl], a
	ret

Func_8088b: ; 4888b (11:488b)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
	ret

Func_80894: ; 48894 (11:4894)
	ret

Func_80895: ; 48895 (11:4895)
	ld a, [bc]
	inc bc
	add hl, de
	ld [hl], a
	ret

Func_8089a: ; 4889a (11:489a)
	ld a, [wChannel4]
	or a
	ret nz
	ld a, [wcf9a]
	or a
	jr z, .asm_808b5
	xor a
	ld [wcf9a], a
	ld a, [wcf95]
	and $77
	or $88
	ld [rNR51], a
	ld [wcf95], a
.asm_808b5
	ld a, [H_FFA4]
	and $f0
	swap a
	add a
	ld hl, Pointers_80937
	add l
	ld l, a
	jr nc, .asm_808c5
	inc h
.asm_808c5
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jp Func_808e0

Func_808cb: ; 488cb (11:48cb)
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
Func_808e0: ; 488e0 (11:48e0)
	ld a, [bc]
	inc bc
	ld [H_FFA5], a
	cp $ff
	jr nz, .asm_808f7
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld hl, $c
	add hl, de
	ld [hli], a
	ld [hl], a
	ret

.asm_808f7
	ld a, [H_FFA5]
	and $f0
	jr nz, .asm_8091a
	ld hl, $10
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA5]
	swap a
	ld [rNR42], a
	call Func_80ba0
	ld a, $80
	ld [rNR44], a
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

.asm_8091a
	cp $e0
	jr nz, .asm_8092b
	ld a, [H_FFA5]
	and $f
	ld hl, $10
	add hl, de
	ld [hl], a
	jp Func_808e0

.asm_8092b
	ld a, [bc]
	inc bc
	ld hl, $a
	add hl, de
	ld [hl], a
	ld [rNR43], a
	jp Func_808e0

Pointers_80937:
	dw Data_80951
	dw Data_8095d
	dw Data_80965
	dw Data_8096d
	dw Data_80978
	dw Data_80985
	dw Data_80991
	dw Data_8099d
	dw Data_809aa
	dw Data_809b7
	dw Data_809c7
	dw Data_809d3
	dw Data_809e2

Data_80951:
	db $e1, $d0, $36, $0f, $d0, $37, $0f, $d0, $35, $03, $02, $ff

Data_8095d:
	db $e1, $d0, $01, $09, $d0, $00, $04, $ff

Data_80965:
	db $e1, $d0, $01, $0c, $d0, $00, $06, $ff

Data_8096d:
	db $e1, $d0, $01, $0b, $e6, $05, $04, $03, $02, $01, $ff

Data_80978:
	db $e1, $d0, $01, $0e, $e6, $07, $06, $05, $04, $03, $02, $01, $ff

Data_80985:
	db $e1, $d0, $15, $0b, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_80991:
	db $e1, $d0, $15, $0c, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_8099d:
	db $e1, $d0, $15, $0d, $d0, $16, $e3, $05, $04, $03, $02, $01, $ff

Data_809aa:
	db $e1, $d0, $15, $0e, $d0, $07, $e3, $05, $04, $03, $02, $01, $ff

Data_809b7:
	db $e1, $d0, $4f, $0f, $d0, $3f, $0e, $d0, $3d, $e4, $05, $04, $03, $02, $01, $ff

Data_809c7:
	db $e1, $d0, $2c, $0c, $e6, $d0, $11, $0d, $0a, $06, $02, $ff

Data_809d3:
	db $e1, $d0, $3c, $0b, $d0, $4c, $0b, $d0, $5c, $0b, $07, $e3, $04, $02, $ff

Data_809e2:
	db $ff

Func_809e3: ; 489e3 (11:49e3)
	ld hl, $c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_809eb: ; 489eb (11:49eb)
	call Func_80aa9
	jp nc, Func_80a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	add [hl]
	jr nc, .asm_809ff
	ld a, $f0
.asm_809ff
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_80b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_80b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_80434
	ret

Func_80a1a: ; 48a1a (11:4a1a)
	call Func_80aa9
	jp nc, Func_80a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	sub [hl]
	jr nc, .asm_80a2e
	ld a, $10
.asm_80a2e
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_80b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_80b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_8044a
	ret

Func_80a49: ; 48a49 (11:4a49)
	call Func_80aa9
	ret c
Func_80a4d: ; 48a4d (11:4a4d)
	call Func_80ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	call Func_8040a
	ld bc, Func_80a64
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_80a64:
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
	jr z, .asm_80a88
	ld [hl], a
	call Func_80ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, $f
	add hl, de
	ld [hl], a
	ret

.asm_80a88
	ld hl, $8
	add hl, de
	ld [hl], $0
	call Func_80b39
	push bc
	ld bc, Func_80aa8
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
	jp Func_80b76

Func_80aa8:
	ret

Func_80aa9: ; 48aa9 (11:4aa9)
	ld hl, $12
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	cp [hl]
	ret

Func_80ab4: ; 48ab4 (11:4ab4)
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_80ac3
	sub $10
	jr nz, Func_80ac3
	ld a, $10
Func_80ac3: ; 48ac3 (11:4ac3)
	ld [hl], a
	call Func_80b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	jp Func_80b76

Func_80ad1: ; 48ad1 (11:4ad1)
	ld hl, $16
	add hl, de
	ld a, [hli]
	or a
	ret z
	ld a, [hl]
	or a
	jr z, .asm_80ade
	dec [hl]
	ret

.asm_80ade
	inc hl
	dec [hl]
	jr z, .asm_80ae3
	ret

.asm_80ae3
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
	jr z, .asm_80b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	add c
	ld c, a
	jr nc, .asm_80b06
	inc b
.asm_80b06
	ld hl, $a
	add hl, de
	ld a, c
	ld [hli], a
	call Func_80b6c
	ld a, b
	cp [hl]
	ret z
	ld [hl], a
	and $f
	jp Func_80b76

.asm_80b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_80b1f
	dec bc
	dec a
	jr nz, .asm_80b1f
	jr .asm_80b06

Func_80b25: ; 48b25 (11:4b25)
	call Func_80b90
	ret nz
	push hl
	ld hl, Pointers_80bb0
	jr asm_80b7e

Func_80b2f: ; 48b2f (11:4b2f)
	call Func_80b90
	ret nz
	push hl
	ld hl, Pointers_80bbc
	jr asm_80b7e

Func_80b39: ; 48b39 (11:4b39)
	call Func_80b90
	ret nz
	push hl
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_80b5d
	ld a, [H_FFA8]
	swap a
	and $f
	ld hl, Data_80bec
	add l
	ld l, a
	jr nc, .asm_80b54
	inc h
.asm_80b54
	ld a, [hl]
	ld [H_FFA8], a
	ld hl, Pointers_80bc8
	jr asm_80b7e

.asm_80b5d
	ld a, [H_FFA8]
	and $f0
	or $8
	ld [H_FFA8], a
	ld hl, Pointers_80bc8
	jr asm_80b7e

Func_80b6c: ; 48b6c (11:4b6c)
	call Func_80b90
	ret nz
	push hl
	ld hl, Pointers_80bd4
	jr asm_80b7e

Func_80b76: ; 48b76 (11:4b76)
	call Func_80b90
	ret nz
	push hl
	ld hl, Pointers_80be0
asm_80b7e
	ld a, [H_FFA3]
	add a
	add l
	ld l, a
	jr nc, .asm_80b87
	inc h
.asm_80b87
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_FFA8]
	ld [hl], a
	pop hl
	ret

Func_80b90: ; 48b90 (11:4b90)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr nz, .asm_80b9e
	ld a, [wChannel5]
	or a
	ret

.asm_80b9e
	xor a
	ret

Func_80ba0: ; 48ba0 (11:4ba0)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	add wcff0 % $100
	ld l, a
	ld h, wcff0 / $100
	ld a, [H_FFA8]
	ld [hl], a
	ret

Pointers_80bb0:
	dw rNR10, rNR20, rNR30, rNR40, rNR10, rNR40
Pointers_80bbc:
	dw rNR11, rNR21, rNR31, rNR41, rNR11, rNR41
Pointers_80bc8:
	dw rNR12, rNR22, rNR32, rNR42, rNR12, rNR42
Pointers_80bd4:
	dw rNR13, rNR23, rNR33, rNR43, rNR13, rNR43
Pointers_80be0:
	dw rNR14, rNR24, rNR34, rNR44, rNR14, rNR44

Data_80bec:
	db $00, $60, $40, $20
	db $00, $00, $00, $00

PlayMusic_20: ; 48bf4 (11:4bf4)
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
	ld hl, MusicPointers_20
	ld a, [H_MusicID]
	jp Func_80cdd

PlaySFX_20: ; 48c22 (11:4c22)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, SFXPointers_20
	ld a, [H_SFX_ID]
	jp Func_80cdd

Func_80c3a: ; 48c3a (11:4c3a)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, Pointers_83e66
	xor a
	ld [wcfc8], a
	ld a, [H_FFA2]
	and $80
	jr z, .asm_80c5c
	ld a, $ff
	ld [wcfc8], a
.asm_80c5c
	ld a, [H_FFA2]
	and $7f
	ld [wcfc0], a
	cp $50
	jr c, .asm_80c6b
	jp Func_80cad

.asm_80c6b
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
Func_80c71: ; 48c71 (11:4c71)
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

Func_80cad: ; 48cad (11:4cad)
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
	jp Func_80c71

Func_80cbe:
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, c
	ld [MBC3SRamBank], a
asm_80cc7
	inc bc
	inc bc
asm_80cc9
	ld a, [H_FFA3]
	inc a
	ld [H_FFA3], a
	cp $6
	jr nz, .asm_80cd5
	ret

.asm_80cd5
	ld hl, $28
	add hl, de
	ld e, l
	ld d, h
	jr asm_80cf7

Func_80cdd: ; 48cdd (11:4cdd)
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
asm_80cf7
	ld a, [wcf92]
	add a
	ld [wcf92], a
	jr nc, asm_80cc9
	ld hl, $0
	add hl, de
	ld a, [wcf93]
	cp [hl]
	jr c, asm_80cc7
	push de
	ld l, wChannel2 - wChannel1
	xor a
.asm_80d0e
	ld [de], a
	inc de
	dec l
	jr nz, .asm_80d0e
	pop de
	ld hl, $4
	add hl, de
	ld [hl], $1
	ld hl, $b
	add hl, de
	ld [hl], $ff
	call Func_80866
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_80d3f
	ld a, [wChannel4]
	or a
	jp nz, Func_80d7d
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	jp Func_80d7d

.asm_80d3f
	push bc
	ld hl, Data_80d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_80d66
	ld b, $0
	cp $1
	jr nz, .asm_80d53
	ld c, $5
	jr .asm_80d65

.asm_80d53
	cp $2
	jr nz, .asm_80d5b
	ld c, $a
	jr .asm_80d65

.asm_80d5b
	cp $3
	jr nz, .asm_80d63
	ld c, $f
	jr .asm_80d65

.asm_80d63
	ld c, $14
.asm_80d65
	add hl, bc
.asm_80d66
	pop bc
	ld a, [hli]
	cp $ee
	call nz, Func_80b25
	ld a, [hli]
	call Func_80b2f
	ld a, [hli]
	call Func_80b39
	ld a, [hli]
	call Func_80b6c
	ld a, [hl]
	call Func_80b76
Func_80d7d: ; 48d7d (11:4d7d)
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
	jp asm_80cc9

Data_80d95:
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80
	db $00, $00, $00, $00, $80
	db $ee, $00, $08, $00, $80
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80

Pointers_80db3:
	dw Data_80dd5
	dw Data_80de5
	dw Data_80df5
	dw Data_80e05
	dw Data_80e15
	dw Data_80e25
	dw Data_80e35
	dw Data_80e45
	dw Data_80e55
	dw Data_80e65
	dw Data_80e75
	dw Data_80e85
	dw Data_80e95
	dw Data_80ea5
	dw Data_80eb5
	dw Data_80ec5
	dw Data_80ed5

Data_80dd5: db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
Data_80de5: db $00, $11, $23, $46, $8c, $de, $ef, $ff, $ff, $ee, $dc, $b9, $73, $21, $10, $00
Data_80df5: db $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8
Data_80e05: db $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d
Data_80e15: db $01, $24, $8b, $de, $fe, $eb, $84, $21, $01, $24, $8b, $de, $fe, $eb, $84, $21
Data_80e25: db $9b, $ce, $fd, $cb, $ba, $aa, $99, $88, $77, $66, $55, $54, $43, $20, $13, $46
Data_80e35: db $bf, $ff, $da, $88, $76, $31, $01, $37, $bc, $ef, $ec, $98, $77, $52, $00, $04
Data_80e45: db $b9, $53, $02, $44, $56, $8b, $cb, $ac, $df, $ec, $d6, $74, $33, $24, $35, $20
Data_80e55: db $fc, $d5, $63, $43, $64, $46, $86, $47, $66, $06, $ce, $96, $49, $64, $64, $34
Data_80e65: db $f8, $0c, $5a, $87, $a7, $89, $87, $98, $79, $87, $98, $7a, $79, $a5, $c0, $7f
Data_80e75: db $8f, $0c, $49, $67, $89, $6b, $3f, $07, $8f, $0c, $49, $67, $89, $6b, $3f, $07
Data_80e85: db $f0, $a5, $97, $87, $87, $86, $a5, $f0, $f0, $a5, $97, $87, $87, $86, $a5, $f0
Data_80e95: db $fc, $ba, $a9, $98, $76, $65, $54, $30, $fc, $ba, $a9, $98, $76, $65, $54, $30
Data_80ea5: db $8f, $6c, $28, $5f, $0a, $6d, $39, $07, $8f, $6c, $28, $5f, $0a, $6d, $39, $07
Data_80eb5: db $fa, $b7, $97, $84, $b7, $86, $84, $50, $fa, $b7, $97, $84, $b7, $86, $84, $50
Data_80ec5: db $bf, $dc, $dc, $b9, $64, $32, $32, $04, $bf, $dc, $dc, $b9, $64, $32, $32, $04
Data_80ed5: db $be, $de, $96, $76, $98, $95, $12, $14, $be, $de, $96, $76, $98, $95, $12, $14

SFXPointers_20:
INCLUDE "audio/unknown_sfx_80ee5.asm"

MusicPointers_20:
INCLUDE "audio/unknown_sfx_81fe2.asm"

Pointers_83e66:
	db $ff
