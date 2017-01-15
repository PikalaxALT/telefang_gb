UpdateSound_22:
	push af
	push bc
	push de
	push hl
	ld a, [H_MusicID]
	cp $1
	jp z, Func_88629
	or a
	jr z, .asm_88018
	call PlayMusic_22
	xor a
	ld [H_MusicID], a
	jr .asm_8803e

.asm_88018
	ld a, [wRingtoneID]
	or a
	jr z, .asm_88022
	xor a
	ld [H_SFX_ID], a
.asm_88022
	ld a, [H_SFX_ID]
	or a
	jr z, .asm_88031
	call PlaySFX_22
	xor a
	ld [H_SFX_ID], a
	jr .asm_8803e

.asm_88031
	ld a, [H_Ringtone]
	or a
	jr z, .asm_8803e
	call Func_88c3a
	xor a
	ld [H_Ringtone], a
.asm_8803e
	ld a, [wcf90]
	or a
	jr z, .asm_88064
	ld a, [wcf91]
	or a
	jp nz, Func_88173
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
	jp Func_88173

.asm_88064
	ld a, [wcf91]
	or a
	jr z, .asm_88081
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
.asm_88081
	ld a, [wcf96]
	or a
	jr z, .asm_880e9
	ld a, [wcf97]
	or a
	jr z, .asm_88093
	dec a
	ld [wcf97], a
	jr .asm_880e9

.asm_88093
	ld a, [wcf98]
	sub $22
	jr c, .asm_880a7
	ld [wcf98], a
	ld [rNR50], a
	ld a, [wcf96]
	ld [wcf97], a
	jr .asm_880e9

.asm_880a7
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

.asm_880e9
	ld de, wChannel1
	ld a, [de]
	or a
	jr z, .asm_88125
	xor a
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_880ff
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_88125

.asm_880ff
	ld a, [wcf94]
	or a
	jr z, .asm_88122
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
.asm_88122
	call UpdateChannel_22
.asm_88125
	ld de, wChannel2
	ld a, [de]
	or a
	jr z, .asm_8813f
	ld a, $1
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_8813c
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8813f

.asm_8813c
	call UpdateChannel_22
.asm_8813f
	ld de, wChannel3
	ld a, [de]
	or a
	jr z, .asm_88159
	ld a, $2
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_88156
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_88159

.asm_88156
	call UpdateChannel_22
.asm_88159
	ld de, wChannel4
	ld a, [de]
	or a
	jr z, Func_88173
	ld a, $3
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_88170
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_88173

.asm_88170
	call UpdateChannel_22
Func_88173: ; 48173 (11:4173)
	ld de, wChannel5
	ld a, [de]
	or a
	jr z, .asm_8818d
	ld a, $4
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_8818a
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .asm_8818d

.asm_8818a
	call UpdateChannel_22
.asm_8818d
	ld a, [wcf90]
	or a
	jr nz, Func_881ad
	ld de, wChannel6
	ld a, [de]
	or a
	jr z, Func_881ad
	ld a, $5
	ld [H_FFA3], a
	call Func_882ff
	jr z, .asm_881aa
	ld a, [hl]
	and $7f
	ld [hl], a
	jr Func_881ad

.asm_881aa
	call UpdateChannel_22
Func_881ad:
	ld a, [wcf90]
	or a
	jr z, .asm_881b6
	jp Func_882fa

.asm_881b6
	ld a, [wRingtoneID]
	or a
	jr nz, .asm_881bf
	jp Func_882fa

.asm_881bf
	ld a, [wcfc7]
	dec a
	ld [wcfc7], a
	jr z, .asm_881e1
	cp $1
	jr z, .asm_881cf
	jp Func_882fa

.asm_881cf
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jp Func_882fa

.asm_881e1
	ld a, [wRingtonePointer]
	ld e, a
	ld a, [wRingtonePointer + 1]
	ld d, a
	ld a, [wcfc5]
	cp $fe
	jr nz, asm_88268
	call MemSRAMBank_22
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_22
	inc de
	cp $ff
	jr nz, asm_88217
	xor a
	ld [wRingtoneID], a
	jp Func_882fa

MemSRAMBank_22: ; 48206 (11:4206)
	enable_sram
	ld a, [wAudioSRAMBank]
	ld [MBC3SRamBank], a
	ret

CloseSRAM_22: ; 48212 (11:4212)
	xor a
	ld [MBC3SRamEnable], a
	ret

asm_88217
	ld a, [H_FFA8]
	ld c, a
	and $f
	cp $0
	jr nz, .asm_8822d
	ld a, $7
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_88268

.asm_8822d
	cp $1
	jr nz, .asm_8823d
	ld a, $6
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_88268

.asm_8823d
	cp $2
	jr nz, .asm_88245
	ld a, $5
	jr .asm_88257

.asm_88245
	cp $3
	jr nz, .asm_8824d
	ld a, $4
	jr .asm_88257

.asm_8824d
	cp $4
	jr nz, .asm_88255
	ld a, $3
	jr .asm_88257

.asm_88255
	ld a, $2
.asm_88257
	ld [wcfc5], a
	ld a, c
	and $f0
	srl a
	srl a
	srl a
	srl a
	ld [wcfc6], a
asm_88268
	call MemSRAMBank_22
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_22
	inc de
	ld a, [H_FFA8]
	cp $fe
	jr nz, .asm_88295
	ld a, [wcfc8]
	or a
	jr z, .asm_8828a
	xor a
	ld [H_Ringtone], a
	ld [wRingtoneID], a
	jp Func_882fa

.asm_8828a
	ld a, [wcfc3]
	ld e, a
	ld a, [wcfc4]
	ld d, a
	inc de
	jr asm_88268

.asm_88295
	ld c, a
	and $f0
	cp $c0
	jr nz, .asm_882ad
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jr .asm_882d0

.asm_882ad
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
	ld hl, Data_88569
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [rNR13], a
	inc hl
	ld a, [hl]
	or $80
	ld [rNR14], a
.asm_882d0
	ld a, [wcfc5]
	and $f
	ld c, a
	call MemSRAMBank_22
	ld a, [de]
	ld [H_FFA8], a
	call CloseSRAM_22
	ld a, [H_FFA8]
	inc de
	and $f
.asm_882e6
	or a
	jr z, .asm_882ee
	dec a
	sla c
	jr .asm_882e6

.asm_882ee
	ld a, c
	ld [wcfc7], a
	ld a, e
	ld [wRingtonePointer], a
	ld a, d
	ld [wRingtonePointer + 1], a
Func_882fa: ; 482fa (11:42fa)
	pop hl
	pop de
	pop bc
	pop af
	ret

Func_882ff: ; 482ff (11:42ff)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $80
	ret

UpdateChannel_22: ; 48307 (11:4307)
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_884cd
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_8833a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_888cb
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_888cb
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_889e3
	call Func_88ad1
	jp Func_88651

.asm_8833a
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_88341
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, Func_884e8
asm_8834e
	ld a, [bc]
	ld [H_MusicCommand], a
	inc bc
	cp $ef
	jr nz, .asm_8835d
	ld hl, wcf9b
	inc [hl]
	jr asm_8834e

.asm_8835d
	and $f0
	cp $f0
	jr nz, .asm_88368
	call Func_8871d
	jr asm_88341

.asm_88368
	cp $e0
	jr nz, .asm_88371
	call Func_88723
	jr asm_88341

.asm_88371
	cp $d0
	jr nz, asm_8839f
	ld a, [H_MusicCommand]
	and $f
	ld hl, $9
	add hl, de
	ld [hl], a
	jr asm_88341

asm_88381
	ld hl, $8
	add hl, de
	xor a
	ld [hl], a
	call Func_88b39
	ld hl, $c
	add hl, de
	ld bc, Func_8839e
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $ff
	call Func_88b6c
	ld a, $8f
	jp Func_88b76

Func_8839e:
	ret

asm_8839f
	call Func_88561
	ld hl, $3
	add hl, de
	ld a, [H_MusicCommand]
	and $f
	ld b, a
	inc b
	xor a
.asm_883ae
	add [hl]
	dec b
	jr nz, .asm_883ae
	inc hl
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jp z, Func_8889a
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, Func_8889a
	ld a, [H_MusicCommand]
	and $f0
	cp $c0
	jr z, asm_88381
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_883f5
	xor a
	ld [rNR30], a
	ld a, [wcf99]
	add a
	ld hl, Pointers_88db3
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $10
	ld c, $30
.asm_883eb
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .asm_883eb
	ld a, $80
	ld [rNR30], a
.asm_883f5
	ld hl, $7
	add hl, de
	ld a, [hli]
	ld [hl], a
	call Func_88b39
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, Func_8841e
	jr asm_88455

Func_8840a: ; 4840a (11:440a)
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

Func_8841e: ; 4841e (11:441e)
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_88434
	call Func_8840a
	ld bc, Func_889eb
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_88434:
	ld hl, $11
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	jr z, Func_8844a
	call Func_8840a
	ld bc, Func_88a1a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_8844a:
	ld hl, $c
	add hl, de
	ld bc, Func_88a49
	ld [hl], c
	inc hl
	ld [hl], b
	ret

asm_88455
	ld hl, $15
	add hl, de
	ld a, [hld]
	or a
	jr z, .asm_88466
	ld b, a
	ld a, [hli]
	inc hl
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hl], $0
.asm_88466
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
	jr z, .asm_8848b
	cp $1
	ld a, [H_FFA8]
	jr nz, Func_88495
	call Func_8869d
	ld hl, wcfb5
	jr .asm_88494

.asm_8848b
	ld a, [H_FFA8]
	call Func_88698
	ld hl, wcfb4
.asm_88494
	ld [hl], a
Func_88495:
	ld hl, Data_88569
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
	call Func_88b6c
	ld a, [H_FFA7]
	and $f
	ld [hl], a
	or $80
	jp Func_88b76

Func_884cd: ; 484cd (11:44cd)
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .asm_884d5
	ret

.asm_884d5
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_884dc
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	or a
	jp z, asm_8834e
Func_884e8: ; 484e8 (11:44e8)
	ld a, [bc]
	inc bc
	ld [H_MusicCommand], a
	cp $e0
	jp z, Func_88549
	and $f0
	cp $f0
	jr nz, .asm_884fd
	call Func_8871d
	jr asm_884dc

.asm_884fd
	cp $e0
	jr nz, .asm_88506
	call Func_88723
	jr asm_884dc

.asm_88506
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_MusicCommand]
	and $f0
	jr z, .asm_88533
	add $20
	call Func_88ba0
	ld hl, $8
	add hl, de
	ld [hli], a
	call Func_88b39
	ld a, [bc]
	inc bc
	ld [hli], a
	call Func_88b6c
	ld a, [H_MusicCommand]
	and $f
	ld [hl], a
	or $80
	call Func_88b76
	jr Func_88561

.asm_88533
	call Func_88561
	ld a, [H_MusicCommand]
	and $f
	swap a
	call Func_88ba0
	or $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

Func_88549: ; 48549 (11:4549)
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	call Func_88561
	xor a
	call Func_88b39
	ld a, $ff
	call Func_88b6c
	ld a, $8f
	jp Func_88b76

Func_88561: ; 48561 (11:4561)
	ld hl, $1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Data_88569:
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

Func_88629: ; 48629 (11:4629)
	xor a
	ld [rNR52], a
	ld [rNR50], a
	xor a
	ld [H_Ringtone], a
	ld [wRingtoneID], a
	ld [H_MusicID], a
	ld [wChannel1], a
	ld [wChannel2], a
	ld [wChannel3], a
	ld [wChannel4], a
	ld [wChannel5], a
	ld [wChannel6], a
	ld a, $77
	ld [rNR50], a
	jp Func_881ad

Func_88651: ; 48651 (11:4651)
	ld a, [H_FFA3]
	or a
	jr z, .asm_88679
	cp $1
	ret nz
	ld a, [wcfb5]
	call Func_8869d
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
	call Func_88b39
	call Func_886b4
	ld a, [hl]
	jp Func_88495

.asm_88679
	ld a, [wcfb4]
	call Func_88698
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
	call Func_88b39
	call Func_886ac
	ld a, [hl]
	jp Func_88495

Func_88698: ; 48698 (11:4698)
	ld hl, wcfb2
	jr asm_886a0

Func_8869d: ; 4869d (11:469d)
	ld hl, wcfb3
asm_886a0
	push af
	ld a, [hl]
	inc a
	and $3f
	ld [hl], a
	call Func_886c2
	pop af
	ld [hl], a
	ret

Func_886ac: ; 486ac (11:46ac)
	ld hl, wcfb0
	ld a, [wcfb2]
	jr asm_886ba

Func_886b4: ; 486b4 (11:46b4)
	ld hl, wcfb1
	ld a, [wcfb3]
asm_886ba
	sub [hl]
	and $3f
	call Func_886c2
	ld a, [hl]
	ret

Func_886c2: ; 486c2 (11:46c2)
	push bc
	push af
	ld hl, Pointers_886d9
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

Pointers_886d9:
	dw wcf00
	dw wcf40

Pointers_886dd:
	dw Func_88894
	dw Func_88840
	dw Func_88846
	dw Func_8884f
	dw Func_88864
	dw Func_88865
	dw Func_88866
	dw Func_88867
	dw Func_88858
	dw Func_88894
	dw Func_8886d
	dw Func_88877
	dw Func_8888b
	dw Func_88894
	dw Func_88894
	dw Func_88894

Pointers_886fd:
	dw Func_88738
	dw Func_8873d
	dw Func_88742
	dw Func_88749
	dw Func_88754
	dw Func_8875f
	dw Func_8876f
	dw Func_88777
	dw Func_88780
	dw Func_88786
	dw Func_88799
	dw Func_887b6
	dw Func_887c9
	dw Func_887d2
	dw Func_887d8
	dw Func_887de

Func_8871d: ; 4871d (11:471d)
	ld hl, Pointers_886fd
	jp Func_88729

Func_88723: ; 48723 (11:4723)
	ld hl, Pointers_886dd
	jp Func_88729

Func_88729: ; 48729 (11:4729)
	ld a, [H_MusicCommand]
	and $f
	add a
	add l
	ld l, a
	jr nc, .asm_88734
	inc h
.asm_88734
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_88738: ; 48738 (11:4738)
	ld hl, $1a
	jr asm_8874c

Func_8873d: ; 4873d (11:473d)
	ld hl, $1a
	jr asm_88757

Func_88742: ; 48742 (11:4742)
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld b, a
	ld c, l
	ret

Func_88749: ; 48749 (11:4749)
	ld hl, $1d
asm_8874c
	ld a, [bc]
	inc bc
	add hl, de
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_88754: ; 48754 (11:4754)
	ld hl, $1d
asm_88757
	add hl, de
	dec [hl]
	ret z
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_8875f: ; 4875f (11:475f)
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

Func_8876f: ; 4876f (11:476f)
	ld hl, $20
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

Func_88777: ; 48777 (11:4777)
	ld hl, $5
	call Func_88895
	jp Func_88b25

Func_88780: ; 48780 (11:4780)
	ld hl, $24
	jp Func_88895

Func_88786: ; 48786 (11:4786)
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

Func_88799: ; 48799 (11:4799)
	ld a, [bc]
	inc bc
	push af
	ld hl, $6
	add hl, de
	and $c0
	ld [hl], a
	ld a, [H_FFA3]
	cp $2
	jr z, .asm_887ae
	ld a, [hl]
	call Func_88b2f
.asm_887ae
	inc hl
	pop af
	and $f
	swap a
	ld [hl], a
	ret

Func_887b6: ; 487b6 (11:47b6)
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
	jp Func_8888b

Func_887c9: ; 487c9 (11:47c9)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	ret

Func_887d2: ; 487d2 (11:47d2)
	ld hl, $3
	jp Func_88895

Func_887d8: ; 487d8 (11:47d8)
	ld hl, $23
	jp Func_88895

Func_887de: ; 487de (11:47de)
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_887f4
	ld a, [wChannel4]
	or a
	ret nz
	xor a
	ld [rNR42], a
	ret

.asm_887f4
	cp $4
	jr nz, .asm_887fd
	ld a, $ff
	ld [wcf94], a
.asm_887fd
	ld hl, Data_88d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_8882a
	push bc
	ld b, $0
	cp $1
	jr nz, .asm_88811
	ld c, $5
	jr .asm_88828

.asm_88811
	cp $2
	jr nz, .asm_88819
	ld c, $a
	jr .asm_88828

.asm_88819
	cp $3
	jr nz, .asm_88826
	ld c, $f
	ld a, $ff
	ld [wcf9a], a
	jr .asm_88828

.asm_88826
	ld c, $14
.asm_88828
	add hl, bc
	pop bc
.asm_8882a
	ld a, [hli]
	cp $ee
	call nz, Func_88b25
	ld a, [hli]
	call Func_88b2f
	ld a, [hli]
	call Func_88b39
	ld a, [hli]
	call Func_88b6c
	ld a, [hl]
	jp Func_88b76

Func_88840: ; 48840 (11:4840)
	ld hl, $3
	jp Func_88895

Func_88846: ; 48846 (11:4846)
	ld hl, $a
	call Func_88895
	ld [rNR43], a
	ret

Func_8884f: ; 4884f (11:484f)
	ld hl, $6
	call Func_88895
	jp Func_88b2f

Func_88858: ; 48858 (11:4858)
	ld hl, wcfb0
	ld a, [H_FFA3]
	add l
	ld l, a
	ld a, [bc]
	inc bc
	ld [hl], a
	ret

Func_88864: ; 48864 (11:4864)
	ret

Func_88865: ; 48865 (11:4865)
	ret

Func_88866: ; 48866 (11:4866)
	ret

Func_88867: ; 48867 (11:4867)
	ld a, [bc]
	inc bc
	ld [wcf99], a
	ret

Func_8886d: ; 4886d (11:486d)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	jr asm_8887f

Func_88877: ; 48877 (11:4877)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
asm_8887f
	ld hl, $7
	add hl, de
	ld a, [bc]
	inc bc
	and $f
	swap a
	ld [hl], a
	ret

Func_8888b: ; 4888b (11:488b)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
	ret

Func_88894: ; 48894 (11:4894)
	ret

Func_88895: ; 48895 (11:4895)
	ld a, [bc]
	inc bc
	add hl, de
	ld [hl], a
	ret

Func_8889a: ; 4889a (11:489a)
	ld a, [wChannel4]
	or a
	ret nz
	ld a, [wcf9a]
	or a
	jr z, .asm_888b5
	xor a
	ld [wcf9a], a
	ld a, [wcf95]
	and $77
	or $88
	ld [rNR51], a
	ld [wcf95], a
.asm_888b5
	ld a, [H_MusicCommand]
	and $f0
	swap a
	add a
	ld hl, Pointers_88937
	add l
	ld l, a
	jr nc, .asm_888c5
	inc h
.asm_888c5
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jp Func_888e0

Func_888cb: ; 488cb (11:48cb)
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
Func_888e0: ; 488e0 (11:48e0)
	ld a, [bc]
	inc bc
	ld [H_FFA5], a
	cp $ff
	jr nz, .asm_888f7
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld hl, $c
	add hl, de
	ld [hli], a
	ld [hl], a
	ret

.asm_888f7
	ld a, [H_FFA5]
	and $f0
	jr nz, .asm_8891a
	ld hl, $10
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA5]
	swap a
	ld [rNR42], a
	call Func_88ba0
	ld a, $80
	ld [rNR44], a
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

.asm_8891a
	cp $e0
	jr nz, .asm_8892b
	ld a, [H_FFA5]
	and $f
	ld hl, $10
	add hl, de
	ld [hl], a
	jp Func_888e0

.asm_8892b
	ld a, [bc]
	inc bc
	ld hl, $a
	add hl, de
	ld [hl], a
	ld [rNR43], a
	jp Func_888e0

Pointers_88937:
	dw Data_88951
	dw Data_8895d
	dw Data_88965
	dw Data_8896d
	dw Data_88978
	dw Data_88985
	dw Data_88991
	dw Data_8899d
	dw Data_889aa
	dw Data_889b7
	dw Data_889c7
	dw Data_889d3
	dw Data_889e2

Data_88951:
	db $e1, $d0, $36, $0f, $d0, $37, $0f, $d0, $35, $03, $02, $ff

Data_8895d:
	db $e1, $d0, $01, $09, $d0, $00, $04, $ff

Data_88965:
	db $e1, $d0, $01, $0c, $d0, $00, $06, $ff

Data_8896d:
	db $e1, $d0, $01, $0b, $e6, $05, $04, $03, $02, $01, $ff

Data_88978:
	db $e1, $d0, $01, $0e, $e6, $07, $06, $05, $04, $03, $02, $01, $ff

Data_88985:
	db $e1, $d0, $15, $0b, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_88991:
	db $e1, $d0, $15, $0c, $d0, $16, $e3, $05, $04, $03, $02, $ff

Data_8899d:
	db $e1, $d0, $15, $0d, $d0, $16, $e3, $05, $04, $03, $02, $01, $ff

Data_889aa:
	db $e1, $d0, $15, $0e, $d0, $07, $e3, $05, $04, $03, $02, $01, $ff

Data_889b7:
	db $e1, $d0, $4f, $0f, $d0, $3f, $0e, $d0, $3d, $e4, $05, $04, $03, $02, $01, $ff

Data_889c7:
	db $e1, $d0, $2c, $0c, $e6, $d0, $11, $0d, $0a, $06, $02, $ff

Data_889d3:
	db $e1, $d0, $3c, $0b, $d0, $4c, $0b, $d0, $5c, $0b, $07, $e3, $04, $02, $ff

Data_889e2:
	db $ff

Func_889e3: ; 489e3 (11:49e3)
	ld hl, $c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_889eb: ; 489eb (11:49eb)
	call Func_88aa9
	jp nc, Func_88a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	add [hl]
	jr nc, .asm_889ff
	ld a, $f0
.asm_889ff
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_88b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_88b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_88434
	ret

Func_88a1a: ; 48a1a (11:4a1a)
	call Func_88aa9
	jp nc, Func_88a4d
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	sub [hl]
	jr nc, .asm_88a2e
	ld a, $10
.asm_88a2e
	ld hl, $8
	add hl, de
	ld [hl], a
	call Func_88b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call Func_88b76
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, Func_8844a
	ret

Func_88a49: ; 48a49 (11:4a49)
	call Func_88aa9
	ret c
Func_88a4d: ; 48a4d (11:4a4d)
	call Func_88ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld [H_FFA8], a
	and $f0
	call Func_8840a
	ld bc, Func_88a64
	ld [hl], c
	inc hl
	ld [hl], b
	ret

Func_88a64:
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
	jr z, .asm_88a88
	ld [hl], a
	call Func_88ab4
	ld hl, $13
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, $f
	add hl, de
	ld [hl], a
	ret

.asm_88a88
	ld hl, $8
	add hl, de
	ld [hl], $0
	call Func_88b39
	push bc
	ld bc, Func_88aa8
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
	jp Func_88b76

Func_88aa8:
	ret

Func_88aa9: ; 48aa9 (11:4aa9)
	ld hl, $12
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	cp [hl]
	ret

Func_88ab4: ; 48ab4 (11:4ab4)
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jp z, Func_88ac3
	sub $10
	jr nz, Func_88ac3
	ld a, $10
Func_88ac3: ; 48ac3 (11:4ac3)
	ld [hl], a
	call Func_88b39
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	jp Func_88b76

Func_88ad1: ; 48ad1 (11:4ad1)
	ld hl, $16
	add hl, de
	ld a, [hli]
	or a
	ret z
	ld a, [hl]
	or a
	jr z, .asm_88ade
	dec [hl]
	ret

.asm_88ade
	inc hl
	dec [hl]
	jr z, .asm_88ae3
	ret

.asm_88ae3
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
	jr z, .asm_88b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	add c
	ld c, a
	jr nc, .asm_88b06
	inc b
.asm_88b06
	ld hl, $a
	add hl, de
	ld a, c
	ld [hli], a
	call Func_88b6c
	ld a, b
	cp [hl]
	ret z
	ld [hl], a
	and $f
	jp Func_88b76

.asm_88b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_88b1f
	dec bc
	dec a
	jr nz, .asm_88b1f
	jr .asm_88b06

Func_88b25: ; 48b25 (11:4b25)
	call Func_88b90
	ret nz
	push hl
	ld hl, Pointers_88bb0
	jr asm_88b7e

Func_88b2f: ; 48b2f (11:4b2f)
	call Func_88b90
	ret nz
	push hl
	ld hl, Pointers_88bbc
	jr asm_88b7e

Func_88b39: ; 48b39 (11:4b39)
	call Func_88b90
	ret nz
	push hl
	ld a, [H_FFA3]
	cp $2
	jr nz, .asm_88b5d
	ld a, [H_FFA8]
	swap a
	and $f
	ld hl, Data_88bec
	add l
	ld l, a
	jr nc, .asm_88b54
	inc h
.asm_88b54
	ld a, [hl]
	ld [H_FFA8], a
	ld hl, Pointers_88bc8
	jr asm_88b7e

.asm_88b5d
	ld a, [H_FFA8]
	and $f0
	or $8
	ld [H_FFA8], a
	ld hl, Pointers_88bc8
	jr asm_88b7e

Func_88b6c: ; 48b6c (11:4b6c)
	call Func_88b90
	ret nz
	push hl
	ld hl, Pointers_88bd4
	jr asm_88b7e

Func_88b76: ; 48b76 (11:4b76)
	call Func_88b90
	ret nz
	push hl
	ld hl, Pointers_88be0
asm_88b7e
	ld a, [H_FFA3]
	add a
	add l
	ld l, a
	jr nc, .asm_88b87
	inc h
.asm_88b87
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_FFA8]
	ld [hl], a
	pop hl
	ret

Func_88b90: ; 48b90 (11:4b90)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	or a
	jr nz, .asm_88b9e
	ld a, [wChannel5]
	or a
	ret

.asm_88b9e
	xor a
	ret

Func_88ba0: ; 48ba0 (11:4ba0)
	ld [H_FFA8], a
	ld a, [H_FFA3]
	add $f0
	ld l, a
	ld h, $cf
	ld a, [H_FFA8]
	ld [hl], a
	ret

Pointers_88bb0:
	dw rNR10, rNR20, rNR30, rNR40, rNR10, rNR40
Pointers_88bbc:
	dw rNR11, rNR21, rNR31, rNR41, rNR11, rNR41
Pointers_88bc8:
	dw rNR12, rNR22, rNR32, rNR42, rNR12, rNR42
Pointers_88bd4:
	dw rNR13, rNR23, rNR33, rNR43, rNR13, rNR43
Pointers_88be0:
	dw rNR14, rNR24, rNR34, rNR44, rNR14, rNR44

Data_88bec:
	db $00, $60, $40, $20
	db $00, $00, $00, $00

PlayMusic_22: ; 48bf4 (11:4bf4)
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
	ld hl, MusicPointers_22
	ld a, [H_MusicID]
	jp Func_88cdd

PlaySFX_22: ; 48c22 (11:4c22)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, SFXPointers_22
	ld a, [H_SFX_ID]
	jp Func_88cdd

Func_88c3a: ; 48c3a (11:4c3a)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wcf98], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, Pointers_8bd51
	xor a
	ld [wcfc8], a
	ld a, [H_Ringtone]
	and $80
	jr z, .asm_88c5c
	ld a, $ff
	ld [wcfc8], a
.asm_88c5c
	ld a, [H_Ringtone]
	and $7f
	ld [wRingtoneID], a
	cp $50
	jr c, .asm_88c6b
	jp Func_88cad

.asm_88c6b
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
Func_88c71: ; 48c71 (11:4c71)
	ld a, [hli]
	ld [wRingtonePointer], a
	ld [wcfc3], a
	ld a, [hl]
	ld [wRingtonePointer + 1], a
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

Func_88cad: ; 48cad (11:4cad)
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
	jp Func_88c71

Func_88cbe:
	enable_sram
	ld a, c
	ld [MBC3SRamBank], a
asm_88cc7
	inc bc
	inc bc
asm_88cc9
	ld a, [H_FFA3]
	inc a
	ld [H_FFA3], a
	cp $6
	jr nz, .asm_88cd5
	ret

.asm_88cd5
	ld hl, $28
	add hl, de
	ld e, l
	ld d, h
	jr asm_88cf7

Func_88cdd: ; 48cdd (11:4cdd)
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
asm_88cf7
	ld a, [wcf92]
	add a
	ld [wcf92], a
	jr nc, asm_88cc9
	ld hl, $0
	add hl, de
	ld a, [wcf93]
	cp [hl]
	jr c, asm_88cc7
	push de
	ld l, wChannel2 - wChannel1
	xor a
.asm_88d0e
	ld [de], a
	inc de
	dec l
	jr nz, .asm_88d0e
	pop de
	ld hl, $4
	add hl, de
	ld [hl], $1
	ld hl, $b
	add hl, de
	ld [hl], $ff
	call Func_88866
	ld a, [H_FFA3]
	cp $5
	jr nz, .asm_88d3f
	ld a, [wChannel4]
	or a
	jp nz, Func_88d7d
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	jp Func_88d7d

.asm_88d3f
	push bc
	ld hl, Data_88d95
	ld a, [H_FFA3]
	or a
	jr z, .asm_88d66
	ld b, $0
	cp $1
	jr nz, .asm_88d53
	ld c, $5
	jr .asm_88d65

.asm_88d53
	cp $2
	jr nz, .asm_88d5b
	ld c, $a
	jr .asm_88d65

.asm_88d5b
	cp $3
	jr nz, .asm_88d63
	ld c, $f
	jr .asm_88d65

.asm_88d63
	ld c, $14
.asm_88d65
	add hl, bc
.asm_88d66
	pop bc
	ld a, [hli]
	cp $ee
	call nz, Func_88b25
	ld a, [hli]
	call Func_88b2f
	ld a, [hli]
	call Func_88b39
	ld a, [hli]
	call Func_88b6c
	ld a, [hl]
	call Func_88b76
Func_88d7d: ; 48d7d (11:4d7d)
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
	jp asm_88cc9

Data_88d95:
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80
	db $00, $00, $00, $00, $80
	db $ee, $00, $08, $00, $80
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80

Pointers_88db3:
	dw Data_88dd5
	dw Data_88de5
	dw Data_88df5
	dw Data_88e05
	dw Data_88e15
	dw Data_88e25
	dw Data_88e35
	dw Data_88e45
	dw Data_88e55
	dw Data_88e65
	dw Data_88e75
	dw Data_88e85
	dw Data_88e95
	dw Data_88ea5
	dw Data_88eb5
	dw Data_88ec5
	dw Data_88ed5

Data_88dd5: db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
Data_88de5: db $00, $11, $23, $46, $8c, $de, $ef, $ff, $ff, $ee, $dc, $b9, $73, $21, $10, $00
Data_88df5: db $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8
Data_88e05: db $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d
Data_88e15: db $01, $24, $8b, $de, $fe, $eb, $84, $21, $01, $24, $8b, $de, $fe, $eb, $84, $21
Data_88e25: db $9b, $ce, $fd, $cb, $ba, $aa, $99, $88, $77, $66, $55, $54, $43, $20, $13, $46
Data_88e35: db $bf, $ff, $da, $88, $76, $31, $01, $37, $bc, $ef, $ec, $98, $77, $52, $00, $04
Data_88e45: db $b9, $53, $02, $44, $56, $8b, $cb, $ac, $df, $ec, $d6, $74, $33, $24, $35, $20
Data_88e55: db $fc, $d5, $63, $43, $64, $46, $86, $47, $66, $06, $ce, $96, $49, $64, $64, $34
Data_88e65: db $f8, $0c, $5a, $87, $a7, $89, $87, $98, $79, $87, $98, $7a, $79, $a5, $c0, $7f
Data_88e75: db $8f, $0c, $49, $67, $89, $6b, $3f, $07, $8f, $0c, $49, $67, $89, $6b, $3f, $07
Data_88e85: db $f0, $a5, $97, $87, $87, $86, $a5, $f0, $f0, $a5, $97, $87, $87, $86, $a5, $f0
Data_88e95: db $fc, $ba, $a9, $98, $76, $65, $54, $30, $fc, $ba, $a9, $98, $76, $65, $54, $30
Data_88ea5: db $8f, $6c, $28, $5f, $0a, $6d, $39, $07, $8f, $6c, $28, $5f, $0a, $6d, $39, $07
Data_88eb5: db $fa, $b7, $97, $84, $b7, $86, $84, $50, $fa, $b7, $97, $84, $b7, $86, $84, $50
Data_88ec5: db $bf, $dc, $dc, $b9, $64, $32, $32, $04, $bf, $dc, $dc, $b9, $64, $32, $32, $04
Data_88ed5: db $be, $de, $96, $76, $98, $95, $12, $14, $be, $de, $96, $76, $98, $95, $12, $14

SFXPointers_22:
INCLUDE "audio/unknown_sfx_88ee5.asm"

MusicPointers_22:
INCLUDE "audio/unknown_sfx_89fe2.asm"

Pointers_8bd51:
	db $ff
