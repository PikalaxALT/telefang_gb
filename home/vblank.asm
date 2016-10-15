VBlank: ; 2e7 (0:02e7)
	push af
	push bc
	push de
	push hl
	call Func_0266
	ld a, [hVBlankOccurred]
	or a
	jr nz, .asm_0306
	ld a, [wc437]
	or a
	jr z, .asm_0306
	call hPushOAM
	call Func_3171
	xor a
	ld [wc430], a
	ld [wc437], a
.asm_0306
	ld a, $1
	ld [hVBlankOccurred], a
	ei
	call UpdateSound
	call Func_3442
	ld a, [wcb3f]
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
