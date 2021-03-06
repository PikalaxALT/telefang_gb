WhiteDMGPals::
	xor a ; `0000
	ld [wBGP], a
	ld [wOBP0], a
	ld [wOBP1], a
	ret

BlackDMGPals::
	ld a, $ff ; `3333
	ld [wBGP], a
	ld [wOBP0], a
	ld [wOBP1], a
	ret

NormalDMGPals::
	ld a, $e4 ; `3210
	ld [wBGP], a
	ld a, $e4 ; `3210
	ld [wOBP0], a
	ld a, $d0 ; `3100
	ld [wOBP1], a
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

LoadNthStdBGPalette::
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

LoadNthStdOBPalette::
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

ApplyPaletteFadeToBuffer::
	ld hl, wCGB_BGPalFadeComponentBuffer
	ld de, wCGB_BGPalsBuffer
	call ApplyPaletteFadeToBGBuffer
	ld hl, wCGB_OBPalFadeComponentBuffer
	ld de, wCGB_OBPalsBuffer
	jp Func_11f7

ApplyPaletteFadeToBGBuffer: ; 11e3 (0:11e3)
	ld b, $8
.outer_loop
	push bc
	ld b, $4
.inner_loop
	push bc
	call CondensePalette
	pop bc
	dec b
	jp nz, .inner_loop
	pop bc
	dec b
	jp nz, .outer_loop
	ret

Func_11f7: ; 11f7 (0:11f7)
	ld b, $8
.outer_loop
	push bc
	ld b, $4
.inner_loop
	push bc
	call CondensePalette
	pop bc
	dec b
	jp nz, .inner_loop
	pop bc
	dec b
	jp nz, .outer_loop
	ret

CondensePalette: ; 120b (0:120b)
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

StartFade: ; 122d (0:122d)
	ld [wCurFadeTimerReset], a
	xor a
	ld [wCurFadeTimer], a
	ld [wCurFadePosition], a
	ld a, $1
	ld [wc3df], a
	check_cgb
	ret nz
	push de
	call ApplyPaletteFadeToBuffer
	pop de
	ret

PaletteFade: ; 1248 (0:1248)
	ld [wCurFadeProgram], a
	ld a, [wCurFadeTimer]
	or a
	jr z, .fade
	dec a
	ld [wCurFadeTimer], a
	jp .nope

.fade
	ld a, [wCurFadePosition]
	cp $4
	jr z, .done
	ld a, [wCurFadeTimerReset]
	ld [wCurFadeTimer], a
	check_cgb
	jp z, PaletteFadeCGB_
	ld a, [wCurFadeProgram]
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
	ld a, [wCurFadePosition]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wBGP], a
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
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
.nope
	xor a
	ret

.done
	xor a
	ld [wc3df], a
	ld a, $1
	ret

Pointers_12af::
	dw DMGPals_12bf, DMGPals_12c9
	dw DMGPals_12ce, DMGPals_12d8
	dw DMGPals_12dd, DMGPals_12e7
	dw DMGPals_12ec, DMGPals_12f6

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
