WhiteDMGPals::
	xor a ; `0000
	ld [wBGP], a
	ld [wOBP1], a
	ld [wOBP2], a
	ret

BlackDMGPals::
	ld a, $ff ; `3333
	ld [wBGP], a
	ld [wOBP1], a
	ld [wOBP2], a
	ret

NormalDMGPals::
	ld a, $e4 ; `3210
	ld [wBGP], a
	ld a, $e4 ; `3210
	ld [wOBP1], a
	ld a, $d0 ; `3100
	ld [wOBP2], a
	ret

UpdatePalsCGB: ; 106a (0:106a)
	check_cgb
	ret nz
	ld a, [wBGPalUpdate]
	or a
	jr z, .skip_bg
	call PushBGPals
.skip_bg
	ld a, [wOBPalUpdate]
	or a
	ret z
	jp PushOBPals

PushBGPals: ; 1081 (0:1081)
	ld a, BANK(Palettes_34000)
	rst Bankswitch
	ld hl, wCGB_BGPalsBuffer
	ld b, 8 palettes
	ld a, $80
	ld [rBGPI], a
.asm_108d
	ld a, [hli]
	di
	call WaitStat
	ld [rBGPD], a
	ei
	dec b
	jr nz, .asm_108d
	xor a
	ld [wBGPalUpdate], a
	ret

GetCGB_BGLayout: ; 109d (0:109d)
	push hl
	push bc
	push de
	ld a, b
	ld [wCGB_BGLayoutIndex], a
	ld a, c
	ld [wCGB_BGLayoutIndex + 1], a
	ld hl, PalPackets_1c000
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 8
	ld de, wCGB_BGPalsBuffer
.packet_loop
	push bc
	ld a, BANK(PalPackets_1c000)
	rst Bankswitch
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld a, BANK(Palettes_34000)
	rst Bankswitch
	ld hl, Palettes_34000
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 1 palettes
.palette_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .palette_copy
	pop hl
	pop bc
	dec b
	jr nz, .packet_loop
	pop de
	pop bc
	pop hl
	ret

Func_10ee::
	push hl
	push bc
	push de
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, wCGB_BGPalsBuffer
	add hl, de
	push hl
	pop de
	ld a, BANK(Palettes_34000)
	rst Bankswitch
	ld hl, Palettes_34000
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 1 palettes
.palette_copy
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .palette_copy
	pop de
	pop bc
	pop hl
	ld a, [wPrevROMBank]
	rst Bankswitch
	ret

PushOBPals: ; 1129 (0:1129)
	ld a, BANK(Palettes_35d80)
	rst Bankswitch
	ld hl, wCGB_OBPalsBuffer
	ld b, 8 palettes
	ld a, $80
	ld [rOBPI], a
.asm_1135
	ld a, [hli]
	di
	call WaitStat
	ld [rOBPD], a
	ei
	dec b
	jr nz, .asm_1135
	xor a
	ld [wOBPalUpdate], a
	ret

GetCGB_OBLayout: ; 1145 (0:1145)
	push hl
	push bc
	push de
	ld a, b
	ld [wCGB_OBLayoutIndex], a
	ld a, c
	ld [wCGB_OBLayoutIndex + 1], a
	ld hl, PalPackets_38000
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 8
	ld de, wCGB_OBPalsBuffer
.asm_1169
	push bc
	ld a, BANK(PalPackets_38000)
	rst Bankswitch
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	push hl
	ld a, BANK(Palettes_35d80)
	rst Bankswitch
	ld hl, Palettes_35d80
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 1 palettes
.asm_1187
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_1187
	pop hl
	pop bc
	dec b
	jr nz, .asm_1169
	pop de
	pop bc
	pop hl
	ret

Func_1196::
	push hl
	push bc
	push de
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, wCGB_OBPalsBuffer
	add hl, de
	push hl
	pop de
	ld a, BANK(Palettes_35d80)
	rst Bankswitch
	ld hl, Palettes_35d80
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, 1 palettes
.asm_11c3
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_11c3
	pop de
	pop bc
	pop hl
	ld a, [wPrevROMBank]
	rst Bankswitch
	ret

Func_11d1::
	ld hl, wde00
	ld de, wCGB_BGPalsBuffer
	call Func_11e3
	ld hl, wde60
	ld de, wCGB_OBPalsBuffer
	jp Func_11f7

Func_11e3: ; 11e3 (0:11e3)
	ld b, $8
Func_11e5: ; 11e5 (0:11e5)
	push bc
	ld b, $4
Func_11e8: ; 11e8 (0:11e8)
	push bc
	call Func_120b
	pop bc
	dec b
	jp nz, Func_11e8
	pop bc
	dec b
	jp nz, Func_11e5
	ret

Func_11f7: ; 11f7 (0:11f7)
	ld b, $8
Func_11f9: ; 11f9 (0:11f9)
	push bc
	ld b, $4
Func_11fc: ; 11fc (0:11fc)
	push bc
	call Func_120b
	pop bc
	dec b
	jp nz, Func_11fc
	pop bc
	dec b
	jp nz, Func_11f9
	ret

Func_120b: ; 120b (0:120b)
	ld a, [de]
	ld c, a
	and $1f
	ld [hli], a
	inc de
	ld a, [de]
	ld b, a
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld a, b
	and $1f
	ld [hli], a
	ld a, [de]
	srl a
	srl a
	and $1f
	ld [hli], a
	inc de
	ret

Func_122d: ; 122d (0:122d)
	ld [wc3d9], a
	xor a
	ld [wc3d8], a
	ld [wc3da], a
	ld a, $1
	ld [wc3df], a
	check_cgb
	ret nz
	push de
	call Func_11d1
	pop de
	ret

Func_1248: ; 1248 (0:1248)
	ld [wcb27], a
	ld a, [wc3d8]
	or a
	jr z, .asm_1258
	dec a
	ld [wc3d8], a
	jp .nope

.asm_1258
	ld a, [wc3da]
	cp $4
	jr z, .asm_12a8
	ld a, [wc3d9]
	ld [wc3d8], a
	check_cgb
	jp z, Func_04a7
	ld a, [wcb27]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_12af
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
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP2], a
	ld a, [wc3da]
	inc a
	ld [wc3da], a
.nope
	xor a
	ret

.asm_12a8
	xor a
	ld [wc3df], a
	ld a, $1
	ret

Pointers_12af::
	dw DMGPals_12bf
	dw DMGPals_12c9
	dw DMGPals_12ce
	dw DMGPals_12d8
	dw DMGPals_12dd
	dw DMGPals_12e7
	dw DMGPals_12ec
	dw DMGPals_12f6

DMGPals_12bf:: db $00, $54, $a4, $e4, $ff
               db $00, $50, $a0, $e0, $ff
DMGPals_12c9:: db $00, $51, $92, $d2, $ff
DMGPals_12ce:: db $e4, $a4, $54, $00, $ff
               db $e0, $a0, $50, $00, $ff
DMGPals_12d8:: db $d2, $92, $51, $00, $ff
DMGPals_12dd:: db $ff, $ea, $e5, $e4, $ff
               db $ff, $ea, $e5, $e0, $ff
DMGPals_12e7:: db $ff, $ea, $d6, $d2, $ff
DMGPals_12ec:: db $e4, $e5, $ea, $ff, $ff
               db $e0, $e5, $ea, $ff, $ff
DMGPals_12f6:: db $d2, $d6, $ea, $ff, $ff
