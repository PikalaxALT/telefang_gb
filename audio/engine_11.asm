UpdateSound_11:
	push af
	push bc
	push de
	push hl
	ld a, [H_MusicID]
	cp $1
	jp z, Func_44629
	or a
	jr z, .asm_44018
	call PlayMusic_11
	xor a
	ld [H_MusicID], a
	jr .asm_4403e

.asm_44018
	ld a, [wcfc0]
	or a
	jr z, .asm_44022
	xor a
	ld [H_SFX_ID], a
.asm_44022
	ld a, [H_SFX_ID]
	or a
	jr z, .asm_44031
	call PlaySFX_11
	xor a
	ld [H_SFX_ID], a
	jr .asm_4403e

.asm_44031
	ld a, [H_Ringtone]
	or a
	jr z, .asm_4403e
	call Func_44c3a
	xor a
	ld [H_Ringtone], a
.asm_4403e
	ld a, [wcf90]
	or a
	jr z, .asm_44064
	ld a, [wcf91]
	or a
	jp nz, Func_44173
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
	jp Func_44173

.asm_44064
	ld a, [wcf91]
	or a
	jr z, .asm_44081
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
.asm_44081
	ld a, [wcf96]
	or a
	jr z, .asm_440e9
	ld a, [wcf97]
	or a
	jr z, .asm_44093
	dec a
	ld [wcf97], a
	jr .asm_440e9

.asm_44093
	ld a, [wcf98]
	sub $22
	jr c, .asm_440a7
	ld [wcf98], a
	ld [rNR50], a
	ld a, [wcf96]
	ld [wcf97], a
	jr .asm_440e9

.asm_440a7
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

.asm_440e9
	ld de, wChannel1
	ld a, [de]
	or a
	jr z, .asm_44125
	xor a
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_440ff
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_44125

.asm_440ff
	ld a, [wcf94]
	or a
	jr z, .asm_44122
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
.asm_44122
	call UpdateChannel_11
.asm_44125
	ld de, wChannel2
	ld a, [de]
	or a
	jr z, .asm_4413f
	ld a, $1
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_4413c
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_4413f

.asm_4413c
	call UpdateChannel_11
.asm_4413f
	ld de, wChannel3
	ld a, [de]
	or a
	jr z, .asm_44159
	ld a, $2
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_44156
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_44159

.asm_44156
	call UpdateChannel_11
.asm_44159
	ld de, wChannel4
	ld a, [de]
	or a
	jr z, Func_44173
	ld a, $3
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_44170
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_44173

.asm_44170
	call UpdateChannel_11
Func_44173: ; 44173 (11:4173)
	ld de, wChannel5
	ld a, [de]
	or a
	jr z, .asm_4418d
	ld a, $4
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_4418a
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_4418d

.asm_4418a
	call UpdateChannel_11
.asm_4418d
	ld a, [wcf90]
	or a
	jr nz, Func_441ad
	ld de, wChannel6
	ld a, [de]
	or a
	jr z, Func_441ad
	ld a, $5
	ld [H_FFA3], a
	call Func_442ff
	jr z, .asm_441aa
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_441ad

.asm_441aa
	call UpdateChannel_11
Func_441ad:
	ld a, [wcf90]
	or a
	jr z, .asm_441b6
	jp Func_442fa

.asm_441b6
	ld a, [wcfc0]
	or a
	jr nz, .asm_441bf
	jp Func_442fa

.asm_441bf
	ld a, [wcfc7]
	dec a
	ld [wcfc7], a
	jr z, .asm_441e1
	cp $1
	jr z, .asm_441cf
	jp Func_442fa

.asm_441cf
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jp Func_442fa

.asm_441e1
	ld a, [wcfc1]
	ld e, a
	ld a, [wcfc2]
	ld d, a
	ld a, [wcfc5]
	cp $fe
	jr nz, asm_44268
	call MemSRAMBank_11
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_11
	inc de
	cp $ff
	jr nz, asm_44217
	xor a
	ld [wcfc0], a
	jp Func_442fa

MemSRAMBank_11: ; 44206 (11:4206)
	enable_sram
	ld a, [wAudioSRAMBank]
	ld [MBC3SRamBank], a
	ret

CloseSRAM_11: ; 44212 (11:4212)
	xor a
	ld [MBC3SRamEnable], a
	ret

asm_44217
	ld a, [H_FFA8]
	ld c, a
	and $f
	cp $0
	jr nz, .asm_4422d
	ld a, $7
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_44268

.asm_4422d
	cp $1
	jr nz, .asm_4423d
	ld a, $6
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_44268

.asm_4423d
	cp $2
	jr nz, .asm_44245
	ld a, $5
	jr .asm_44257

.asm_44245
	cp $3
	jr nz, .asm_4424d
	ld a, $4
	jr .asm_44257

.asm_4424d
	cp $4
	jr nz, .asm_44255
	ld a, $3
	jr .asm_44257

.asm_44255
	ld a, $2
.asm_44257
	ld [wcfc5], a
	ld a, c
	and $f0
	srl a
	srl a
	srl a
	srl a
	ld [wcfc6], a
asm_44268
	call MemSRAMBank_11
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_11
	inc de
	ld a, [H_FFA8]
	cp $fe
	jr nz, .asm_44295
	ld a, [wcfc8]
	or a
	jr z, .asm_4428a
	xor a
	ld [H_Ringtone], a
	ld [wcfc0], a
	jp Func_442fa

.asm_4428a
	ld a, [wcfc3]
	ld e, a
	ld a, [wcfc4]
	ld d, a
	inc de
	jr asm_44268

.asm_44295
	ld c, a
	and $f0
	cp $c0
	jr nz, .asm_442ad
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jr .asm_442d0

.asm_442ad
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
	ld hl, Data_44569
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [rNR13], a
	inc hl
	ld a, [hl]
	or $80
	ld [rNR14], a
.asm_442d0
	ld a, [wcfc5]
	and $f
	ld c, a
	call MemSRAMBank_11
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_11
	ld a, [H_FFA8]
	inc de
	and $f
.asm_442e6
	or a
	jr z, .asm_442ee
	dec a
	sla c
	jr .asm_442e6

.asm_442ee
	ld a, c
	ld [wcfc7], a
	ld a, e
	ld [wcfc1], a
	ld a, d
	ld [wcfc2], a
Func_442fa: ; 442fa (11:42fa)
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_442ff: ; 442ff (11:42ff)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $80
	ret

UpdateChannel_11: ; 44307 (11:4307)
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_444cd
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_4433a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_448cb
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_448cb
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_449e3
	call Func_44ad1
	jp Func_44651

.asm_4433a
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_44341
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_444e8
asm_4434e
	ld a, [bc]
	ld [H_MusicCommand], a
	inc bc
	cp $ef
	jr nz, .asm_4435d
	ld hl, wcf9b
	inc [hl]
	jr asm_4434e

.asm_4435d
	and $f0
	cp $f0
	jr nz, .asm_44368
	call Func_4471d
	jr asm_44341

.asm_44368
	cp $e0
	jr nz, .asm_44371
	call Func_44723
	jr asm_44341

.asm_44371
	cp $d0
	jr nz, asm_4439f
	ld a, [H_MusicCommand]
	and $f
	ld hl, $9
	add hl, de
	ld [hl], a
	jr asm_44341

asm_44381
	ld hl, $8
	add hl, de
	xor a
	ld [hl], a
	call Func_44b39
	ld hl, $c
	add hl, de
	ld bc, Func_4439e
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $ff
	call Func_44b6c
	ld a, $8f
	jp Func_44b76

Func_4439e:
	ret

asm_4439f
	call Func_44561
	ld hl, $3
	add hl, de
	ld a, [H_MusicCommand]
	and $f
	ld b, a
	inc b
	xor a
.asm_443ae
	add [hl]
	dec b
	jr nz, .asm_443ae
	inc hl
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_4489a
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_4489a
	ld a, [H_MusicCommand]
	and $f0
	cp $c0
	jr z, asm_44381
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_443f5
	xor a
	ld [rNR30], a
	ld a, [wcf99]
	add a
	ld hl, Pointers_44db3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $10
	ld c, $30
.asm_443eb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_443eb
	ld a, $80
	ld [rNR30], a
.asm_443f5
	ld hl, $7
	add hl, de
	ld a, [hli]
	ld [hl], a
	call Func_44b39
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_4441e
	jr asm_44455

Func_4440a: ; 4440a (11:440a)
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

Func_4441e: ; 4441e (11:441e)
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_44434
	call Func_4440a
	ld bc, Func_449eb
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_44434:
	ld hl, $11
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_4444a
	call Func_4440a
	ld bc, Func_44a1a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_4444a:
	ld hl, $c
	add hl, de
	ld bc, Func_44a49
	ld [hl], c
	inc hl
	ld [hl], b
	ret

asm_44455
	ld hl, $15
	add hl, de
	ld a, [hld]
	or a
	jr z, .asm_44466
	ld b, a
	ld a, [hli]
	inc hl
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hl], $0
.asm_44466
	ld a, [H_MusicCommand]
	ld hl, $9
	add hl, de
	ld b, [hl]
	sla b
	and $f0
	add b
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr z, .asm_4448b
	cp $1
	ld a, [H_FFA8]
	jr nz, Func_44495
	call Func_4469d
	ld hl, wcfb5
	jr .asm_44494

.asm_4448b
	ld a, [H_FFA8]
	call Func_44698
	ld hl, wcfb4
.asm_44494
	ld [hl], a
Func_44495:
	ld hl, Data_44569
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
	call Func_44b6c
	ld a, [H_FFA7]
	and $f
	ld [hl], a
	or $80
	jp Func_44b76

Func_444cd: ; 444cd (11:44cd)
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_444d5
	ret

.asm_444d5
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_444dc
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	or a
	jp z, asm_4434e
Func_444e8: ; 444e8 (11:44e8)
	ld a, [bc]
	inc bc
	ld [H_MusicCommand], a
	cp $e0
	jp z, Func_44549
	and $f0
	cp $f0
	jr nz, .asm_444fd
	call Func_4471d
	jr asm_444dc

.asm_444fd
	cp $e0
	jr nz, .asm_44506
	call Func_44723
	jr asm_444dc

.asm_44506
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_MusicCommand]
	and $f0
	jr z, .asm_44533
	add $20
	call Func_44ba0
	ld hl, $8
	add hl, de
	ld [hli], a
	call Func_44b39
	ld a, [bc]
	inc bc
	ld [hli], a
	call Func_44b6c
	ld a, [H_MusicCommand]
	and $f
	ld [hl], a
	or $80
	call Func_44b76
	jr Func_44561

.asm_44533
	call Func_44561
	ld a, [H_MusicCommand]
	and $f
	swap a
	call Func_44ba0
	or $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

Func_44549: ; 44549 (11:4549)
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	call Func_44561
	xor a
	call Func_44b39
	ld a, $ff
	call Func_44b6c
	ld a, $8f
	jp Func_44b76

Func_44561: ; 44561 (11:4561)
	ld hl, $1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Data_44569:
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

Func_44629: ; 44629 (11:4629)
	xor a
	ld [rNR52], a
	ld [rNR50], a
	xor a
	ld [H_Ringtone], a
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
	jp Func_441ad

Func_44651: ; 44651 (11:4651)
	ld a, [H_FFA3]
	or a
	jr z, .asm_44679
	cp $1
	ret nz
	ld a, [wcfb5]
	call Func_4469d
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
	call Func_44b39
	call Func_446b4
	ld a, [hl]
	jp Func_44495

.asm_44679
	ld a, [wcfb4]
	call Func_44698
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
	call Func_44b39
	call Func_446ac
	ld a, [hl]
	jp Func_44495

Func_44698: ; 44698 (11:4698)
	ld hl, wcfb2
	jr asm_446a0

Func_4469d: ; 4469d (11:469d)
	ld hl, wcfb3
asm_446a0
	push af
	ld a, [hl]
	inc a
	and $3f
	ld [hl], a
	call Func_446c2
	pop af
	ld [hl], a
	ret

Func_446ac: ; 446ac (11:46ac)
	ld hl, wcfb0
	ld a, [wcfb2]
	jr asm_446ba

Func_446b4: ; 446b4 (11:46b4)
	ld hl, wcfb1
	ld a, [wcfb3]
asm_446ba
	sub [hl]
	and $3f
	call Func_446c2
	ld a, [hl]
	ret

Func_446c2: ; 446c2 (11:46c2)
	push bc
	push af
	ld hl, Pointers_446d9
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

Pointers_446d9:
	dw wcf00
	dw wcf40

Pointers_446dd:
	dw Func_44894
	dw Func_44840
	dw Func_44846
	dw Func_4484f
	dw Func_44864
	dw Func_44865
	dw Func_44866
	dw Func_44867
	dw Func_44858
	dw Func_44894
	dw Func_4486d
	dw Func_44877
	dw Func_4488b
	dw Func_44894
	dw Func_44894
	dw Func_44894

Pointers_446fd:
	dw Func_44738
	dw Func_4473d
	dw Func_44742
	dw Func_44749
	dw Func_44754
	dw Func_4475f
	dw Func_4476f
	dw Func_44777
	dw Func_44780
	dw Func_44786
	dw Func_44799
	dw Func_447b6
	dw Func_447c9
	dw Func_447d2
	dw Func_447d8
	dw Func_447de

Func_4471d: ; 4471d (11:471d)
	ld hl, Pointers_446fd
	jp Func_44729

Func_44723: ; 44723 (11:4723)
	ld hl, Pointers_446dd
	jp Func_44729

Func_44729: ; 44729 (11:4729)
	ld a, [H_MusicCommand]
	and $f
	add a
	add l
	ld l, a
	jr nc, .asm_44734
	inc h
.asm_44734
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_44738: ; 44738 (11:4738)
	ld hl, $1a
	jr asm_4474c

Func_4473d: ; 4473d (11:473d)
	ld hl, $1a
	jr asm_44757

Func_44742: ; 44742 (11:4742)
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld b, a
	ld c, l
	ret

Func_44749: ; 44749 (11:4749)
	ld hl, $1d
asm_4474c
	ld a, [bc]
	inc bc
	add hl, de
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_44754: ; 44754 (11:4754)
	ld hl, $1d
asm_44757
	add hl, de
	dec [hl]
	ret z
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_4475f: ; 4475f (11:475f)
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

Func_4476f: ; 4476f (11:476f)
	ld hl, $20
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_44777: ; 44777 (11:4777)
	ld hl, $5
	call Func_44895
	jp Func_44b25

Func_44780: ; 44780 (11:4780)
	ld hl, $24
	jp Func_44895

Func_44786: ; 44786 (11:4786)
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

Func_44799: ; 44799 (11:4799)
	ld a, [bc]
	inc bc
	push af
	ld hl, $6
	add hl, de
	and $c0
	ld [hl], a
	ld a, [H_FFA3]
	cp $2
	jr z, .asm_447ae
	ld a, [hl]
	call Func_44b2f
.asm_447ae
	inc hl
	pop af
	and $f
	swap a
	ld [hl], a
	ret

Func_447b6: ; 447b6 (11:47b6)
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
	jp Func_4488b

Func_447c9: ; 447c9 (11:47c9)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	ret

Func_447d2: ; 447d2 (11:47d2)
	ld hl, $3
	jp Func_44895

Func_447d8: ; 447d8 (11:47d8)
	ld hl, $23
	jp Func_44895

Func_447de: ; 447de (11:47de)
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_447f4
	ld a, [wChannel4]
	or a
	ret nz
	xor a
	ld [rNR42], a
	ret

.asm_447f4
	cp $4
	jr nz, .asm_447fd
	ld a, $ff
	ld [wcf94], a
.asm_447fd
	ld hl, Data_44d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_4482a
	push bc
	ld b, $0
	cp $1
	jr nz, .asm_44811
	ld c, $5
	jr .asm_44828

.asm_44811
	cp $2
	jr nz, .asm_44819
	ld c, $a
	jr .asm_44828

.asm_44819
	cp $3
	jr nz, .asm_44826
	ld c, $f
	ld a, $ff
	ld [wcf9a], a
	jr .asm_44828

.asm_44826
	ld c, $14
.asm_44828
	add hl, bc
	pop bc
.asm_4482a
	ld a, [hli]
	cp $ee
	call nz, Func_44b25
	ld a, [hli]
	call Func_44b2f
	ld a, [hli]
	call Func_44b39
	ld a, [hli]
	call Func_44b6c
	ld a, [hl]
	jp Func_44b76

Func_44840: ; 44840 (11:4840)
	ld hl, $3
	jp Func_44895

Func_44846: ; 44846 (11:4846)
	ld hl, $a
	call Func_44895
	ld [rNR43], a
	ret

Func_4484f: ; 4484f (11:484f)
	ld hl, $6
	call Func_44895
	jp Func_44b2f

Func_44858: ; 44858 (11:4858)
	ld hl, wcfb0
	ld a, [H_FFA3]
	add l
	ld l, a
	ld a, [bc]
	inc bc
	ld [hl], a
	ret

Func_44864: ; 44864 (11:4864)
	ret

Func_44865: ; 44865 (11:4865)
	ret

Func_44866: ; 44866 (11:4866)
	ret

Func_44867: ; 44867 (11:4867)
	ld a, [bc]
	inc bc
	ld [wcf99], a
	ret

Func_4486d: ; 4486d (11:486d)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	jr asm_4487f

Func_44877: ; 44877 (11:4877)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
asm_4487f
	ld hl, $7
	add hl, de
	ld a, [bc]
	inc bc
	and $f
	swap a
	ld [hl], a
	ret

Func_4488b: ; 4488b (11:488b)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
	ret

Func_44894: ; 44894 (11:4894)
	ret

Func_44895: ; 44895 (11:4895)
	ld a, [bc]
	inc bc
	add hl, de
	ld [hl], a
	ret

Func_4489a: ; 4489a (11:489a)
	ld a, [wChannel4]
	or a
	ret nz
	ld a, [wcf9a]
	or a
	jr z, .asm_448b5
	xor a
	ld [wcf9a], a
	ld a, [wcf95]
	and $77
	or $88
	ld [rNR51], a
	ld [wcf95], a
.asm_448b5
	ld a, [H_MusicCommand]
	and $f0
	swap a
	add a
	ld hl, Pointers_44937
	add l
	ld l, a
	jr nc, .asm_448c5
	inc h
.asm_448c5
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jp Func_448e0

Func_448cb: ; 448cb (11:48cb)
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
Func_448e0: ; 448e0 (11:48e0)
	ld a, [bc]
	inc bc
	ld [H_FFA5], a
	cp $ff
	jr nz, .asm_448f7
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld hl, $c
	add hl, de
	ld [hli], a
	ld [hl], a
	ret

.asm_448f7
	ld a, [H_FFA5]
	and $f0
	jr nz, .asm_4491a
	ld hl, $10
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA5]
	swap a
	ld [rNR42], a
	call Func_44ba0
	ld a, $80
	ld [rNR44], a
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

.asm_4491a
	cp $e0
	jr nz, .asm_4492b
	ld a, [H_FFA5]
	and $f
	ld hl, $10
	add hl, de
	ld [hl], a
	jp Func_448e0

.asm_4492b
	ld a, [bc]
	inc bc
	ld hl, $a
	add hl, de
	ld [hl], a
	ld [rNR43], a
	jp Func_448e0

Pointers_44937:
	dw Data_44951
	dw Data_4495d
	dw Data_44965
	dw Data_4496d
	dw Data_44978
	dw Data_44985
	dw Data_44991
	dw Data_4499d
	dw Data_449aa
	dw Data_449b7
	dw Data_449c7
	dw Data_449d3
	dw Data_449e2

Data_44951:
	db $e1, $d0, $36, $0f, $d0, $37, $0f, $d0, $35, $03, $02, $ff

Data_4495d:
	db $e1, $d0, $01, $09, $d0, $00, $04, $ff

Data_44965:
	db $e1, $d0, $01, $0c, $d0, $00, $06, $ff

Data_4496d:
	db $e1, $d0, $01, $0b, $e6, $05, $04, $03, $02, $01, $ff

Data_44978:
	db $e1, $d0, $01, $0e, $e6, $07, $06, $05, $04, $03, $02, $01, $ff

Data_44985:
	db $e1, $d0, $15, $0b, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_44991:
	db $e1, $d0, $15, $0c, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_4499d:
	db $e1, $d0, $15, $0d, $d0, $16, $e3, $05, $04, $03, $02, $01, $ff

Data_449aa:
	db $e1, $d0, $15, $0e, $d0, $07, $e3, $05, $04, $03, $02, $01, $ff

Data_449b7:
	db $e1, $d0, $4f, $0f, $d0, $3f, $0e, $d0, $3d, $e4, $05, $04, $03, $02, $01, $ff

Data_449c7:
	db $e1, $d0, $2c, $0c, $e6, $d0, $11, $0d, $0a, $06, $02, $ff

Data_449d3:
	db $e1, $d0, $3c, $0b, $d0, $4c, $0b, $d0, $5c, $0b, $07, $e3, $04, $02, $ff

Data_449e2:
	db $ff

Func_449e3: ; 449e3 (11:49e3)
	ld hl, $c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_449eb: ; 449eb (11:49eb)
	call Func_44aa9
	jp nc, Func_44a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	add [hl]
	jr nc, .asm_449ff
	ld a, $f0
.asm_449ff
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_44b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_44b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_44434
	ret

Func_44a1a: ; 44a1a (11:4a1a)
	call Func_44aa9
	jp nc, Func_44a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	sub [hl]
	jr nc, .asm_44a2e
	ld a, $10
.asm_44a2e
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_44b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_44b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_4444a
	ret

Func_44a49: ; 44a49 (11:4a49)
	call Func_44aa9
	ret c
Func_44a4d: ; 44a4d (11:4a4d)
	call Func_44ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	call Func_4440a
	ld bc, Func_44a64
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_44a64:
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
	jr z, .asm_44a88
	ld [hl], a
	call Func_44ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, $f
	add hl, de
	ld [hl], a
	ret

.asm_44a88
	ld hl, $8
	add hl, de
	ld [hl], $0
	call Func_44b39
	push bc
	ld bc, Func_44aa8
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
	jp Func_44b76

Func_44aa8:
	ret

Func_44aa9: ; 44aa9 (11:4aa9)
	ld hl, $12
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	cp [hl]
	ret

Func_44ab4: ; 44ab4 (11:4ab4)
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_44ac3
	sub $10
	jr nz, Func_44ac3
	ld a, $10
Func_44ac3: ; 44ac3 (11:4ac3)
	ld [hl], a
	call Func_44b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	jp Func_44b76

Func_44ad1: ; 44ad1 (11:4ad1)
	ld hl, $16
	add hl, de
	ld a, [hli]
	or a
	ret z
	ld a, [hl]
	or a
	jr z, .asm_44ade
	dec [hl]
	ret

.asm_44ade
	inc hl
	dec [hl]
	jr z, .asm_44ae3
	ret

.asm_44ae3
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
	jr z, .asm_44b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	add c
	ld c, a
	jr nc, .asm_44b06
	inc b
.asm_44b06
	ld hl, $a
	add hl, de
	ld a, c
	ld [hli], a
	call Func_44b6c
	ld a, b
	cp [hl]
	ret z
	ld [hl], a
	and $f
	jp Func_44b76

.asm_44b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_44b1f
	dec bc
	dec a
	jr nz, .asm_44b1f
	jr .asm_44b06

Func_44b25: ; 44b25 (11:4b25)
	call Func_44b90
	ret nz
	push hl
	ld hl, Pointers_44bb0
	jr asm_44b7e

Func_44b2f: ; 44b2f (11:4b2f)
	call Func_44b90
	ret nz
	push hl
	ld hl, Pointers_44bbc
	jr asm_44b7e

Func_44b39: ; 44b39 (11:4b39)
	call Func_44b90
	ret nz
	push hl
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_44b5d
	ld a, [H_FFA8]
	swap a
	and $f
	ld hl, Data_44bec
	add l
	ld l, a
	jr nc, .asm_44b54
	inc h
.asm_44b54
	ld a, [hl]
	ld [H_FFA8], a
	ld hl, Pointers_44bc8
	jr asm_44b7e

.asm_44b5d
	ld a, [H_FFA8]
	and $f0
	or $8
	ld [H_FFA8], a
	ld hl, Pointers_44bc8
	jr asm_44b7e

Func_44b6c: ; 44b6c (11:4b6c)
	call Func_44b90
	ret nz
	push hl
	ld hl, Pointers_44bd4
	jr asm_44b7e

Func_44b76: ; 44b76 (11:4b76)
	call Func_44b90
	ret nz
	push hl
	ld hl, Pointers_44be0
asm_44b7e
	ld a, [H_FFA3]
	add a
	add l
	ld l, a
	jr nc, .asm_44b87
	inc h
.asm_44b87
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_FFA8]
	ld [hl], a
	pop hl
	ret

Func_44b90: ; 44b90 (11:4b90)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr nz, .asm_44b9e
	ld a, [wChannel5]
	or a
	ret

.asm_44b9e
	xor a
	ret

Func_44ba0: ; 44ba0 (11:4ba0)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	add wcff0 % $100
	ld l, a
	ld h, wcff0 / $100
	ld a, [H_FFA8]
	ld [hl], a
	ret

Pointers_44bb0:
	dw rNR10, rNR20, rNR30, rNR40, rNR10, rNR40
Pointers_44bbc:
	dw rNR11, rNR21, rNR31, rNR41, rNR11, rNR41
Pointers_44bc8:
	dw rNR12, rNR22, rNR32, rNR42, rNR12, rNR42
Pointers_44bd4:
	dw rNR13, rNR23, rNR33, rNR43, rNR13, rNR43
Pointers_44be0:
	dw rNR14, rNR24, rNR34, rNR44, rNR14, rNR44

Data_44bec:
	db $00, $60, $40, $20
	db $00, $00, $00, $00

PlayMusic_11: ; 44bf4 (11:4bf4)
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
	ld hl, MusicPointers_11
	ld a, [H_MusicID]
	jp Func_44cdd

PlaySFX_11: ; 44c22 (11:4c22)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, SFXPointers_11
	ld a, [H_SFX_ID]
	jp Func_44cdd

Func_44c3a: ; 44c3a (11:4c3a)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, Pointers_45fe2
	xor a
	ld [wcfc8], a
	ld a, [H_Ringtone]
	and $80
	jr z, .asm_44c5c
	ld a, $ff
	ld [wcfc8], a
.asm_44c5c
	ld a, [H_Ringtone]
	and $7f
	ld [wcfc0], a
	cp $50
	jr c, .asm_44c6b
	jp Func_44cad

.asm_44c6b
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
Func_44c71: ; 44c71 (11:4c71)
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

Func_44cad: ; 44cad (11:4cad)
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
	ld [wAudioSRAMBank], a
	jp Func_44c71

Func_44cbe:
	enable_sram
	ld a, c
	ld [MBC3SRamBank], a
asm_44cc7
	inc bc
	inc bc
asm_44cc9
	ld a, [H_FFA3]
	inc a
	ld [H_FFA3], a
	cp $6
	jr nz, .asm_44cd5
	ret

.asm_44cd5
	ld hl, $28
	add hl, de
	ld e, l
	ld d, h
	jr asm_44cf7

Func_44cdd: ; 44cdd (11:4cdd)
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
asm_44cf7
	ld a, [wcf92]
	add a
	ld [wcf92], a
	jr nc, asm_44cc9
	ld hl, $0
	add hl, de
	ld a, [wcf93]
	cp [hl]
	jr c, asm_44cc7
	push de
	ld l, wChannel2 - wChannel1
	xor a
.asm_44d0e
	ld [de], a
	inc de
	dec l
	jr nz, .asm_44d0e
	pop de
	ld hl, $4
	add hl, de
	ld [hl], $1
	ld hl, $b
	add hl, de
	ld [hl], $ff
	call Func_44866
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_44d3f
	ld a, [wChannel4]
	or a
	jp nz, Func_44d7d
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	jp Func_44d7d

.asm_44d3f
	push bc
	ld hl, Data_44d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_44d66
	ld b, $0
	cp $1
	jr nz, .asm_44d53
	ld c, $5
	jr .asm_44d65

.asm_44d53
	cp $2
	jr nz, .asm_44d5b
	ld c, $a
	jr .asm_44d65

.asm_44d5b
	cp $3
	jr nz, .asm_44d63
	ld c, $f
	jr .asm_44d65

.asm_44d63
	ld c, $14
.asm_44d65
	add hl, bc
.asm_44d66
	pop bc
	ld a, [hli]
	cp $ee
	call nz, Func_44b25
	ld a, [hli]
	call Func_44b2f
	ld a, [hli]
	call Func_44b39
	ld a, [hli]
	call Func_44b6c
	ld a, [hl]
	call Func_44b76
Func_44d7d: ; 44d7d (11:4d7d)
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
	jp asm_44cc9

Data_44d95:
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80
	db $00, $00, $00, $00, $80
	db $ee, $00, $08, $00, $80
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80

Pointers_44db3:
	dw Data_44dd5
	dw Data_44de5
	dw Data_44df5
	dw Data_44e05
	dw Data_44e15
	dw Data_44e25
	dw Data_44e35
	dw Data_44e45
	dw Data_44e55
	dw Data_44e65
	dw Data_44e75
	dw Data_44e85
	dw Data_44e95
	dw Data_44ea5
	dw Data_44eb5
	dw Data_44ec5
	dw Data_44ed5

Data_44dd5: db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
Data_44de5: db $00, $11, $23, $46, $8c, $de, $ef, $ff, $ff, $ee, $dc, $b9, $73, $21, $10, $00
Data_44df5: db $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8
Data_44e05: db $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d
Data_44e15: db $01, $24, $8b, $de, $fe, $eb, $84, $21, $01, $24, $8b, $de, $fe, $eb, $84, $21
Data_44e25: db $9b, $ce, $fd, $cb, $ba, $aa, $99, $88, $77, $66, $55, $54, $43, $20, $13, $46
Data_44e35: db $bf, $ff, $da, $88, $76, $31, $01, $37, $bc, $ef, $ec, $98, $77, $52, $00, $04
Data_44e45: db $b9, $53, $02, $44, $56, $8b, $cb, $ac, $df, $ec, $d6, $74, $33, $24, $35, $20
Data_44e55: db $fc, $d5, $63, $43, $64, $46, $86, $47, $66, $06, $ce, $96, $49, $64, $64, $34
Data_44e65: db $f8, $0c, $5a, $87, $a7, $89, $87, $98, $79, $87, $98, $7a, $79, $a5, $c0, $7f
Data_44e75: db $8f, $0c, $49, $67, $89, $6b, $3f, $07, $8f, $0c, $49, $67, $89, $6b, $3f, $07
Data_44e85: db $f0, $a5, $97, $87, $87, $86, $a5, $f0, $f0, $a5, $97, $87, $87, $86, $a5, $f0
Data_44e95: db $fc, $ba, $a9, $98, $76, $65, $54, $30, $fc, $ba, $a9, $98, $76, $65, $54, $30
Data_44ea5: db $8f, $6c, $28, $5f, $0a, $6d, $39, $07, $8f, $6c, $28, $5f, $0a, $6d, $39, $07
Data_44eb5: db $fa, $b7, $97, $84, $b7, $86, $84, $50, $fa, $b7, $97, $84, $b7, $86, $84, $50
Data_44ec5: db $bf, $dc, $dc, $b9, $64, $32, $32, $04, $bf, $dc, $dc, $b9, $64, $32, $32, $04
Data_44ed5: db $be, $de, $96, $76, $98, $95, $12, $14, $be, $de, $96, $76, $98, $95, $12, $14

SFXPointers_11:
INCLUDE "audio/unknown_sfx_44ee5.asm"

Pointers_45fe2:
INCLUDE "audio/unknown_sfx_45fe2.asm"

MusicPointers_11:
