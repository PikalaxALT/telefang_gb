VBlank: ; 2e7 (0:02e7)
	push af
	push bc
	push de
	push hl
	call PushGFXRegisters
	ld a, [hVBlankOccurred]
	or a
	jr nz, .skip_sprites
	ld a, [wOAMUpdate]
	or a
	jr z, .skip_sprites
	call hPushOAM
	call ServeSpecialGFXRequest
	xor a
	ld [wSpriteUpdatesEnabled], a
	ld [wOAMUpdate], a
.skip_sprites
	ld a, $1
	ld [hVBlankOccurred], a
	ei
	call UpdateSound
	call HandleOverworldGFX
	ld a, [wLinkMode]
	or a
	jr nz, .asm_031c
	call Func_1f08
	jr .asm_031f

.asm_031c
	call Func_1c9b
.asm_031f
	pop hl
	pop de
	pop bc
	pop af
	reti
