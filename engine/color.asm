BGPaletteFade:
	ld [wCGBPalFadeProgram], a
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
	jp z, BGPaletteFadeCGB
	ld a, [wCGBPalFadeProgram]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, FadePrograms_ROM3
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
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
.nope
	xor a
	ret

.done
	ld a, $1
	ret

OBPaletteFade:
	ld [wCGBPalFadeProgram], a
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
	jp z, OBPaletteFadeCGB
	ld a, [wCGBPalFadeProgram]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, FadePrograms_ROM3
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurFadePosition]
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
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
.nope
	xor a
	ret

.done
	ld a, $1
	ret

FadePrograms_ROM3:
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
	ld de, wCGBPalFadeBuffer
	ld a, d
	ld [wCGBPalFadeBufferPointer], a
	ld a, e
	ld [wCGBPalFadeBufferPointer + 1], a
	ld a, [wCurFadeProgram]
	ld hl, wCGB_BGPalFadeComponentBuffer
	call ApplyCGBFadeToEightPals
	call CopyFadeBufferToBGPalBuffer
	ld de, wCGBPalFadeBuffer
	ld a, d
	ld [wCGBPalFadeBufferPointer], a
	ld a, e
	ld [wCGBPalFadeBufferPointer + 1], a
	ld a, [wCurFadeProgram]
	ld hl, wCGB_OBPalFadeComponentBuffer
	call ApplyCGBFadeToEightPals
	call CopyFadeBufferToOBPalBuffer
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	pop de
	xor a
	ret

CopyFadeBufferToBGPalBuffer: ; f6c3 (3:76c3)
	ld hl, wCGBPalFadeBuffer
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

CGBPalIOFlags_f6de:
x = $80 ; auto-increment
REPT 8
	db x
x = x + 1 palettes
ENDR

CopyFadeBufferToOBPalBuffer: ; f6e6 (3:76e6)
	ld hl, wCGBPalFadeBuffer
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

BGPaletteFadeCGB: ; f701 (3:7701)
; c palettes starting at b
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
	ld de, wCGB_BGPalFadeComponentBuffer
	add hl, de
	ld a, c
	ld [wNumCGBPalettesToFade], a
	ld de, wCGBPalFadeBuffer
	ld a, d
	ld [wCGBPalFadeBufferPointer], a
	ld a, e
	ld [wCGBPalFadeBufferPointer + 1], a
	ld a, [wCurFadeProgram]
	call ApplyCGBFadeToCPals
	pop bc
	ld a, b
	ld hl, CGBPalIOFlags_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rBGPI], a
	ld hl, wCGBPalFadeBuffer
	ld a, c
	add a
	add a
	add a
	ld b, a
.ApplyBGPal
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rBGPD], a
	ei
	pop bc
	dec b
	jp nz, .ApplyBGPal
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
	pop de
	xor a
	ret

CGBPalIOFlags_f75b:
x = $80 ; auto-increment
REPT 8
	db x
x = x + 1 palettes
ENDR

OBPaletteFadeCGB: ; f763 (3:7763)
; c palettes starting at b
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
	ld de, wCGB_OBPalFadeComponentBuffer
	add hl, de
	ld a, c
	ld [wNumCGBPalettesToFade], a
	ld de, wCGBPalFadeBuffer
	ld a, d
	ld [wCGBPalFadeBufferPointer], a
	ld a, e
	ld [wCGBPalFadeBufferPointer + 1], a
	ld a, [wCurFadeProgram]
	call ApplyCGBFadeToCPals
	pop bc
	ld a, b
	ld hl, CGBPalIOFlags_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rOBPI], a
	ld hl, wCGBPalFadeBuffer
	ld a, c
	add a
	add a
	add a
	ld b, a
.ApplyOBPal
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rOBPD], a
	ei
	pop bc
	dec b
	jp nz, .ApplyOBPal
	ld a, [wCurFadePosition]
	inc a
	ld [wCurFadePosition], a
	pop de
	xor a
	ret

ApplyCGBFadeToCPals: ; f7bd (3:77bd)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, .Pointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Pointers:
	dw .FromWhite, .ret
	dw .ToWhite, .ret
	dw .FromBlack, .ret
	dw .ToBlack, .ret

.ret
	ret

.FromWhite:
	ld h, b
	ld l, c
	ld a, [wNumCGBPalettesToFade]
	ld b, a
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
.loop1
	push bc
	push hl
	call CGB_FadeToOrFromWhite
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop1
	ret

.ToWhite:
	ld h, b
	ld l, c
	ld a, [wNumCGBPalettesToFade]
	ld b, a
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $0
	add c
	ld c, a
.loop2
	push bc
	push hl
	call CGB_FadeToOrFromWhite
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop2
	ret

.FromBlack:
	ld h, b
	ld l, c
	ld a, [wNumCGBPalettesToFade]
	ld b, a
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
.loop3
	push bc
	push hl
	call CGB_FadeToOrFromBlack
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop3
	ret

.ToBlack:
	ld h, b
	ld l, c
	ld a, [wNumCGBPalettesToFade]
	ld b, a
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $1f
	sub c
	ld c, a
.loop4
	push bc
	push hl
	call CGB_FadeToOrFromBlack
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop4
	ret

ApplyCGBFadeToEightPals: ; f873 (3:7873)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, .Pointers
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

.Pointers:
	dw .FromWhite, .ret
	dw .ToWhite,   .ret
	dw .FromBlack, .ret
	dw .ToBlack,   .ret

.ret
	ret

.FromWhite:
	ld h, b
	ld l, c
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
	ld b, $8
.loop1
	push bc
	push hl
	call CGB_FadeToOrFromWhite
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop1
	ret

.ToWhite:
	ld h, b
	ld l, c
	ld a, [wCurFadePosition]
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
.loop2
	push bc
	push hl
	call CGB_FadeToOrFromWhite
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop2
	ret

.FromBlack:
	ld h, b
	ld l, c
	ld a, [wCurFadePosition]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
	ld b, $8
.loop3
	push bc
	push hl
	call CGB_FadeToOrFromBlack
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop3
	ret

.ToBlack:
	ld h, b
	ld l, c
	ld a, [wCurFadePosition]
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
.loop4
	push bc
	push hl
	call CGB_FadeToOrFromBlack
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, .loop4
	ret

CGB_FadeToOrFromWhite: ; f921 (3:7921)
	ld a, c
	ld [wCGBFade_PalLimit], a
REPT 4
	ld de, wCGBPalFadeCurPalRGBBuffer
	call .ApplyFade
ENDR
	ret

.ApplyFade: ; f93e (3:793e)
	ld b, $3
.loop
	ld a, [wCGBFade_PalLimit]
	cp [hl]
	jp nc, .skip
	ld a, [hl]
.skip
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, .loop
	call CompressCGBPalette
	ret

CGB_FadeToOrFromBlack: ; f953 (3:7953)
	ld a, c
	ld [wCGBFade_PalLimit], a
REPT 4
	ld de, wCGBPalFadeCurPalRGBBuffer
	call .ApplyFade
ENDR
	ret

.ApplyFade: ; f970 (3:7970)
	ld b, $3
.loop
	ld a, [wCGBFade_PalLimit]
	cp [hl]
	jp c, .skip
	ld a, [hl]
.skip
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, .loop
	call CompressCGBPalette
	ret

CompressCGBPalette: ; f985 (3:7985)
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
	ld a, [wCGBPalFadeBufferPointer]
	ld d, a
	ld a, [wCGBPalFadeBufferPointer + 1]
	ld e, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, d
	ld [wCGBPalFadeBufferPointer], a
	ld a, e
	ld [wCGBPalFadeBufferPointer + 1], a
	ret
