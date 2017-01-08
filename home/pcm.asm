PlayPCM: ; 3882 (0:3882)
	push af
	push bc
	push de
	push hl
	xor a
	ld [rNR52], a
	call GetPCMPointer
.loop
	call GetPCMBlockAndLength
	call PlayPCMBlock
	ld a, [wcf8a]
	dec a
	ld [wcf8a], a
	jr nz, .loop
	call ResetAudioRegistersAfterPCM
	pop hl
	pop de
	pop bc
	pop af
	ret

GetPCMPointer: ; 38a3 (0:38a3)
	ld hl, Pointer_3951
	ld d, $0
	ld a, [hPCM_ID]
	dec a
	ld e, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, a
	ld l, d
	ld a, [hli]
	ld [wcf8a], a
	ret

GetPCMBlockAndLength: ; 38b8 (0:38b8)
	ld a, [hli]
	rst Bankswitch
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld de, TitleScreenPCM
	ld a, l
	ld [wcf8b], a
	ld a, h
	ld [wcf8c], a
	ret

PlayPCMBlock: ; 38ca (0:38ca)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld a, $0
	ld [rNR10], a
	ld a, $80
	ld [rNR11], a
	ld [rNR21], a
	ld a, $ff
	ld [rNR13], a
	ld [rNR23], a
	ld a, $78
	ld [rNR12], a
	ld [rNR22], a
	ld a, $87
	ld [rNR14], a
	ld [rNR24], a
.loop
	ld a, [de]
	and $f0
	or $8
	call .PCMWait
	ld [rNR12], a
	ld [rNR22], a
	ld a, $0
	ld [rNR13], a
	ld [rNR23], a
	ld a, $80
	ld [rNR14], a
	ld [rNR24], a
	dec bc
	ld a, c
	or b
	ret z
	ld a, [de]
	sla a
	sla a
	sla a
	sla a
	or $8
	nop
	nop
	nop
	call .PCMWait
	ld [rNR12], a
	ld [rNR22], a
	ld a, $0
	ld [rNR13], a
	ld [rNR23], a
	ld a, $80
	ld [rNR14], a
	ld [rNR24], a
	dec bc
	ld a, c
	or b
	ret z
	inc de
	jr .loop

.PCMWait: ; 3936 (0:3936)
	push hl
	pop hl
	nop
	nop
	nop
	nop
	ret

ResetAudioRegistersAfterPCM: ; 393d (0:393d)
	xor a
	ld [rNR12], a
	ld [rNR22], a
	ld [hPCM_ID], a
	ld a, $ff
	ld [rNR13], a
	ld [rNR23], a
	ld a, $87
	ld [rNR14], a
	ld [rNR24], a
	ret

Pointer_3951::
	dw Pointer_3953

Pointer_3953::
	db 1
	db BANK(TitleScreenPCM)
	dw (TitleScreenPCMEnd - TitleScreenPCM) * 2 - 1
