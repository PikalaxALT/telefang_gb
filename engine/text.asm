PrintText: ; 2c100 (b:4100)
	ld a, [wCumulativeTextFrameCounter]
	inc a
	ld [wCumulativeTextFrameCounter], a
	ld a, [wTextSubroutine]
	cp $0
	jp z, TextSubroutine0
	cp $1
	jr z, TextSubroutine1
	cp $2
	jp z, TextSubroutine2
	cp $3
	jp z, TextSubroutine3
	cp $4
	jp z, TextSubroutine4
	cp $5
	jp z, TextSubroutine5
	cp $6
	jp z, TextSubroutine6
	cp $7
	jp z, TextSubroutine7
	cp $8
	jp z, TextSubroutine8
	cp $a
	jp z, TextSubroutine10
	ret

TextSubroutine1:
	ld a, [wTextPointer]
	ld l, a
	ld a, [wTextPointer + 1]
	ld h, a
	call GetTextByte
	or a
	jr nz, .not_space
	push af
	ld a, [wTextBGMapColumn]
	ld [wPositionOfLastSpaceChar], a
	pop af
.not_space
	cp "<LINE>"
	jr nz, .asm_2c17b
	ld a, [wTextBGMapColumn]
	cp $10
	jr nc, .asm_2c16c
	ld a, $10
	ld [wTextBGMapColumn], a
	ld a, [wTextLine]
	inc a
	ld [wTextLine], a
	jp Func_2c2ea

.asm_2c16c
	ld a, $0
	ld [wTextBGMapColumn], a
	ld a, [wTextLine]
	inc a
	ld [wTextLine], a
	jp Func_2c2ea

.asm_2c17b
	cp "<PARA>"
	jr nz, asm_2c182
Func_2c17f: ; 2c17f (b:417f)
	jp Func_2c5c8

asm_2c182
	cp $e7
	jr nz, .asm_2c18c
	call Func_2c22f
	jp Func_2c316

.asm_2c18c
	cp $e9
	jr nz, .asm_2c196
	call AdvanceTextPointer
	jp Func_2c313

.asm_2c196
	cp "<DELAY>"
	jr nz, .asm_2c1a6
	call GetTextByte
	ld [wTextDelayTimerReset], a
	call AdvanceTextPointer
	jp Func_2c313

.asm_2c1a6
	cp "<CALL>"
	jr nz, .asm_2c1ba
	ld a, [wTextPointer + 1]
	ld [wBackupTextPointer + 1], a
	ld a, [wTextPointer]
	ld [wBackupTextPointer], a
	call PrintText_JumpText
	ret

.asm_2c1ba
	cp "$"
	jr nz, .asm_2c1d3
	ld a, [wBackupTextPointer]
	ld [wTextPointer], a
	ld a, [wBackupTextPointer + 1]
	ld [wTextPointer + 1], a
	call AdvanceTextPointer
	call AdvanceTextPointer
	jp Func_2c313

.asm_2c1d3
	cp "<PARA>"
	jp nc, AdvanceTextPointer
	ld a, [wTextDelayTimer]
	or a
	jp z, .reset_delay
	dec a
	jp nz, LoadTextDelayTimer
.reset_delay: ; 2c1e3 (b:41e3)
	push hl
	ld a, [wTextDelayTimerReset]
	ld [wTextDelayTimer], a
	ld a, [wTextBGMapColumn]
	ld b, a
	ld a, [wTextBoxStartTile]
	add b
	call GetCurrentTileVRAMAddress
	call .ld_a_c ; completely useless!!!
	ld a, c
	call LoadCharacter
	pop hl
	ld a, [wTextBGMapColumn]
	inc a
	ld [wTextBGMapColumn], a
	cp $10
	jr nz, .asm_2c212
	ld a, [wTextLine]
	inc a
	ld [wTextLine], a
	jp Func_2c2ea

.asm_2c212
	cp $1f
	jr c, .asm_2c22a
	call Func_2c2be
	jr z, .asm_2c22a
	ld a, [wTextLine]
	inc a
	ld [wTextLine], a
	ld a, $0
	ld [wTextBGMapColumn], a
	jp Func_2c2ea

.asm_2c22a
	jp Func_2c313

.ld_a_c
	ld a, c
	ret

Func_2c22f: ; 2c22f (b:422f)
	ld a, $0
	ld [wBackupTextPointer + 1], a
	ld b, $0
	ld c, "$"
	ld de, VTilesShared tile $60
.loop
	push bc
.loop2
	call GetTextByte
	cp "$"
	jr z, .asm_2c25c
	cp $e5
	jr nz, .asm_2c27b
	ld a, h
	ld [wBackupTextPointer + 1], a
	ld a, l
	ld [wBackupTextPointer], a
	call PrintText_JumpText
	ld a, [wTextPointer]
	ld l, a
	ld a, [wTextPointer + 1]
	ld h, a
	jr .loop2

.asm_2c25c
	ld a, [wBackupTextPointer + 1]
	or a
	jr z, .asm_2c299
	ld a, [wBackupTextPointer]
	ld l, a
	ld a, [wBackupTextPointer + 1]
	ld h, a
	inc hl
	inc hl
	ld a, l
	ld [wTextPointer], a
	ld a, h
	ld [wTextPointer + 1], a
	ld a, $0
	ld [wBackupTextPointer + 1], a
	jr .loop2

.asm_2c27b
	pop bc
	push bc
	push af
	ld a, c
	ld c, $1
	inc b
	inc b
	call .PlaceCharacter
	pop af
	push hl
	ld h, d
	ld l, e
	call LoadCharacter
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc c
	inc b
	ld a, b
	cp $a
	jr nz, .loop
	ret

.asm_2c299
	add sp, $2
	ld a, l
	ld [wTextPointer], a
	ld a, h
	ld [wTextPointer + 1], a
	ret

.PlaceCharacter: ; 2c2a4 (b:42a4)
; bc: (x, y)
;  a: char to load
	push hl
	push af
	push bc
	ld a, [wTextBGMapTop]
	add c
	call GetBGMapRow
	pop bc
	push bc
	ld c, b
	call GetBGMapColumn
	pop bc
	di
	call TextWaitStat
	pop af
	ld [hl], a
	ei
	pop hl
	ret

Func_2c2be: ; 2c2be (b:42be)
	ld b, $0
.loop
	call GetTextByte
	cp "<PARA>"
	jr c, .asm_2c2e2
	cp "<PARA>"
	jr nz, .asm_2c2d6
	ld a, b
	or a
	jr z, .asm_2c2d1
	xor a
	ret

.asm_2c2d1
	call Func_2c17f
	xor a
	ret

.asm_2c2d6
	cp "<LINE>"
	jr nz, .loop_
	ld a, b
	or a
	jr nz, .asm_2c2e2
	xor a
	ret

.loop_
	jr .loop

.asm_2c2e2
	inc b
	ld a, b
	cp $1
	jr z, .loop
	or a
	ret

Func_2c2ea: ; 2c2ea (b:42ea)
	call AdvanceTextPointer
	ld a, [wTextLine]
	cp $2
	jr nc, .asm_2c2f6
	jr Func_2c316

.asm_2c2f6
	and $1
	jr nz, .asm_2c306
	ld a, $2
	ld [wTextSubroutine], a
	ld a, $0
	ld [wTextDelayTimer], a
	jr Func_2c316

.asm_2c306
	ld a, [wCumulativeTextFrameCounter]
	ld [wTextDelayTimer], a
	ld a, $3
	ld [wTextSubroutine], a
	jr Func_2c316

Func_2c313: ; 2c313 (b:4313)
	call AdvanceTextPointer
Func_2c316: ; 2c316 (b:4316)
	ld a, [wTextDelayTimerReset]
	or a
	jp z, PrintText
	ld a, [wcad3]
	or a
	jp nz, PrintText
	ld a, [hJoyLast]
	and B_BUTTON
	jp nz, PrintText
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_2c336
	ld a, $1
	ld [wcad3], a
.asm_2c336
	ret

AdvanceTextPointer: ; 2c337 (b:4337)
	ld a, [wTextPointer + 1]
	ld c, a
	ld a, [wTextPointer]
	add $1
	ld [wTextPointer], a
	ld a, $0
	adc c
	ld [wTextPointer + 1], a
	ret

LoadTextDelayTimer: ; 2c34a (b:434a)
	ld [wTextDelayTimer], a
	ret

TextSubroutine2: ; 2c34e (b:434e)
	ld a, [wTextBGMapTop]
	add $4
	call GetBGMapRow
	ld c, $11
	call GetBGMapColumn
	ld a, [wTextBoxStartTile]
	add $1f
	ld c, a
	ld a, [wTextDelayTimer]
	inc a
	ld [wTextDelayTimer], a
	bit 4, a
	jr nz, .asm_2c372
	ld a, [wTileWhere0IsLoaded]
	add $e
	ld c, a
.asm_2c372
	di
	call TextWaitStat
	ld [hl], c
	ei
	ld a, [hJoyNew]
	ld [wcdb7], a
	ld a, [hJoyLast]
	and A_BUTTON
	jr z, .asm_2c39a
	ld a, [wcdb8]
	cp $14
	jr c, .asm_2c391
	ld a, $1
	ld [wcdb7], a
	jr .asm_2c39f

.asm_2c391
	ld a, [wcdb8]
	inc a
	ld [wcdb8], a
	jr .asm_2c39f

.asm_2c39a
	ld a, $0
	ld [wcdb8], a
.asm_2c39f
	ld a, [wcdb7]
	and $1
	ret z
	ld a, $0
	ld [wcad3], a
	ld a, [wTextBoxStartTile]
	add $1f
	ld c, a
	di
	call TextWaitStat
	ld [hl], c
	ei
	ld a, $8
	ld [H_SFX_ID], a
	ld a, [wCumulativeTextFrameCounter]
	ld [wTextDelayTimer], a
	ld a, $3
	ld [wTextSubroutine], a
	ret

TextSubroutine3: ; 2c3c7 (b:43c7)
TextSubroutine4: ; 2c3c7 (b:43c7)
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_2c3d8
	ld a, [wTextDelayTimer]
	ld b, a
	ld a, [wCumulativeTextFrameCounter]
	sub b
	and $3
	ret nz
.asm_2c3d8
	call Func_2cb3d
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2c3f2
	ld a, [wTextLine]
	and $1
	jr z, .asm_2c3ef
	call Func_2ccf6
	jp .asm_2c3f2

.asm_2c3ef
	call Func_2cceb
.asm_2c3f2
	call Func_2cbd0
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2c407
	ld a, $1
	ld [wTextSubroutine], a
	ld a, $2
	ld [wTextDelayTimer], a
	ret

.asm_2c407
	ld a, $4
	ld [wTextSubroutine], a
	ret

TextSubroutine6: ; 2c40d (b:440d)
	call Func_2c533
	jr z, .asm_2c412
.asm_2c412
	ret

TextSubroutine7: ; 2c413 (b:4413)
	call Func_2c533
	jr z, .asm_2c428
	call Func_2cce5
	ld a, [wTextBGMapTop]
	ld de, Data_2d00f
	ld b, $6
	ld c, $1
	jp Func_2ca5c

.asm_2c428
	ret

TextSubroutine8: ; 2c429 (b:4429) (blink cursor)
	call Func_2c533
	jr z, .skip
	call Func_2c9d1
.skip
	ret

TextSubroutine5: ; 2c432 (b:4432)
	call Func_2c533
	jr z, .asm_2c444
	ld a, [wc900]
	cp $4
	jr nc, .asm_2c444
	call Func_2ccb9
	jp Func_2ba9

.asm_2c444
	ret

TextSubroutine10: ; 2c445 (b:4445)
	call Func_2c4f0
	call Func_2c533
	jr z, .asm_2c484
	ld bc, EVENT_C3E
	ld a, [wc9d7]
	or a
	jr nz, .asm_2c461
	call ResetEventFlag
	ld bc, EVENT_C3F
	call SetEventFlag
	jr .asm_2c46a

.asm_2c461
	call SetEventFlag
	ld bc, EVENT_C3F
	call ResetEventFlag
.asm_2c46a
	ld a, [wSubroutine]
	cp $5
	jr nz, .asm_2c47e
	ld a, [wc900]
	cp $4
	jr nc, .asm_2c47e
	call Func_2ccb9
	call Func_2ba9
.asm_2c47e
	ld a, $0
	ld [wc9cf], a
	ret

.asm_2c484
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_2c49d
	ld a, [wc9d7]
	cp $1
	jr z, .asm_2c4b4
	ld a, $1
	ld [wc9d7], a
	ld a, $2
	ld [H_SFX_ID], a
	jr .asm_2c4b4

.asm_2c49d
	ld a, [hJoyNew]
	and D_RIGHT | B_BUTTON
	jr z, .asm_2c4b4
	ld a, [wc9d7]
	cp $0
	jr z, .asm_2c4b4
	ld a, $0
	ld [wc9d7], a
	ld a, $2
	ld [H_SFX_ID], a
.asm_2c4b4
	ld b, $f
	ld a, [wc9d7]
	or a
	jr z, .asm_2c4be
	ld b, $e
.asm_2c4be
	ld c, $2
	push bc
	call Func_2c4d5
	pop bc
	ld a, [wPositionOfLastSpaceChar]
	and $f
	add $2
	ld c, a
	ld a, b
	xor $1
	ld b, a
	call Func_2c4d5
	ret

Func_2c4d5: ; 2c4d5 (b:44d5)
	ld a, [wTextBGMapTop]
	add $4
	push bc
	call GetBGMapRow
	pop bc
	push bc
	call GetBGMapColumn
	pop bc
	ld a, [wTileWhere0IsLoaded]
	add b
	ld b, a
	di
	call TextWaitStat
	ld [hl], b
	ei
	ret

Func_2c4f0: ; 2c4f0 (b:44f0)
	ld a, [wCumulativeTextFrameCounter]
	and $3
	ret nz
Func_2c4f6: ; 2c4f6 (b:44f6)
	ld a, [wCumulativeTextFrameCounter]
	srl a
	srl a
	and $7
	ld hl, Data_2c52b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	swap a
	ld de, GFX_e0b08
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wTileWhere0IsLoaded]
	cp "$"
	jr nz, .asm_2c520
	ld hl, VTilesShared tile $6e
	jr .asm_2c523

.asm_2c520
	ld hl, VTilesShared tile $7e
.asm_2c523
	ld a, BANK(GFX_e0b08)
	ld bc, $10
	jp FarCopy2bpp_2

Data_2c52b:
	db 0, 1
	db 2, 2
	db 2, 2
	db 1, 0

Func_2c533: ; 2c533 (b:4533)
	ld a, [wTextDelayTimer]
	or a
	jr nz, .asm_2c575
	ld a, [wTextBGMapTop]
	add $4
	call GetBGMapRow
	ld c, $11
	call GetBGMapColumn
	ld c, $c
	ld a, [wCumulativeTextFrameCounter]
	bit 4, a
	jr nz, .got_tile
	ld c, $d
.got_tile
	ld a, [wTileWhere0IsLoaded]
	add c
	ld c, a
	di
	call TextWaitStat
	ld [hl], c
	ei
	ld a, [hJoyLast]
	and A_BUTTON | B_BUTTON
	cp  A_BUTTON | B_BUTTON
	jr z, .end_text
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
.end_text
	ld a, $0
	ld [wcad3], a
	ld a, $9
	ld [wTextSubroutine], a
	or a
	ret

.asm_2c575
	dec a
	jr z, .end_text
	ld [wTextDelayTimer], a
	xor a
	ret

TextSubroutine0: ; 2c57d (b:457d)
	ld a, [wTextDelayTimer]
	dec a
	ld [wTextDelayTimer], a
	jr nz, .asm_2c5c7
	ld a, $4
	ld [wTextDelayTimer], a
	ld a, [wTextLine]
	inc a
	ld [wTextLine], a
	cp $1
	jr nz, .asm_2c5a7
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld de, Data_2d07b
	ld b, $4
	ld c, $1
	jp Func_2ca5c

.asm_2c5a7
	ld a, $1
	ld [wTextSubroutine], a
	ld a, $0
	ld [wTextLine], a
	ld a, $8
	ld [wTextDelayTimer], a
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld de, Data_2d00f
	ld b, $6
	ld c, $1
	jp Func_2ca5c

.asm_2c5c7
	ret

Func_2c5c8: ; 2c5c8 (b:45c8)
	call GetTextByte
	ld [wc9cf], a
	cp $0
	jr nz, .asm_2c5dd
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $5
	ld [wTextSubroutine], a
	ret

.asm_2c5dd
	cp $1
	jr nz, .asm_2c5ec
	ld a, $3c
	ld [wTextDelayTimer], a
	ld a, $5
	ld [wTextSubroutine], a
	ret

.asm_2c5ec
	cp $2
	jr nz, .asm_2c5fb
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $6
	ld [wTextSubroutine], a
	ret

.asm_2c5fb
	cp $3
	jr nz, .asm_2c60a
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $7
	ld [wTextSubroutine], a
	ret

.asm_2c60a
	cp $4
	jr nz, .asm_2c619
	ld a, $1
	ld [wTextDelayTimer], a
	ld a, $6
	ld [wTextSubroutine], a
	ret

.asm_2c619
	cp $a
	jr nz, .asm_2c630
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $a
	ld [wTextSubroutine], a
	call Func_2c4f6
	ld a, $1
	ld [wc9d7], a
	ret

.asm_2c630
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $8
	ld [wTextSubroutine], a
	ret

Func_2c63b: ; 2c63b (b:463b)
	xor a
	ld [wc9cf], a
Func_2c63f: ; 2c63f (b:463f)
	ld a, [wc9d8]
	cp $2
	jr z, .asm_2c64b
	ld a, $1
	ld [wc9d8], a
.asm_2c64b
	call Func_2c6d2
Func_2c64e: ; 2c64e (b:464e)
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $1
	ld [wc9d7], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wTextBank], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call PrintText_JumpText
	call Func_3566
	ld a, $7
	ld [wca65], a
	xor a
	ld [wTextBGMapColumn], a
	ld [wTextLine], a
	ld a, $5
	ld [wSubroutine], a
	ld a, $4
	ld [wTextDelayTimer], a
	ld a, $1
	ld [wTextDelayTimerReset], a
	ld a, $0
	ld [wcad3], a
	ld a, $2
	ld [wcada], a
	ld bc, EVENT_C3E
	call ResetEventFlag
	ld bc, EVENT_C3F
	call ResetEventFlag
	ld a, [wc9cf]
	cp $2
	jr c, .asm_2c6be
	ld a, $1
	ld [wTextSubroutine], a
	call Func_2c98e
	jr .asm_2c6d1

.asm_2c6be
	ld a, $0
	ld [wTextSubroutine], a
	ld a, [wTextBGMapTop]
	add $2
	ld [wTextBGMapTop], a
	call Func_2c9bd
	call Func_2cc4e
.asm_2c6d1
	ret

Func_2c6d2: ; 2c6d2 (b:46d2)
	ld d, $a
	ld a, [wPlayerYCoord]
	cp $48
	jr c, .asm_2c6dd
	ld d, $1
.asm_2c6dd
	ld a, d
	ld [wTextBGMapTop], a
	ret

Func_2c6e2: ; 2c6e2 (b:46e2)
	call Func_2c6d2
	ld hl, ItemNames
	ld c, b
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, $8
	ld de, wca53
.asm_2c6fd
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2c6fd
	ld a, "$"
	ld [de], a
	xor a
	ld [wc9cf], a
	ld b, $0
	ld c, $bf
	jp Func_2c64e

Func_2c711: ; 2c711 (b:4711)
	push bc
	call Func_2c73e
	xor a
	ld [wc9cf], a
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, "$"
	ld [wTileWhere0IsLoaded], a
	ld b, $0
	ld c, $ba
	ld d, $0
	call AnchorMapAndLoadTextPointer__
	ld a, $1
	ld [wcada], a
	ld a, $7
	ld [wca65], a
	call Func_2c9e6
	pop bc
	call Func_2ca0f
	ret

Func_2c73e: ; 2c73e (b:473e)
	ld hl, ItemNames
	ld c, b
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, $8
	ld de, wca53
.asm_2c756
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2c756
	ld a, "$"
	ld [de], a
	ret

LoadTextPointer:
	call LoadTextPointer__
	jp Func_2c9d1

AnchorMapAndLoadTextPointer: ; 2c766 (b:4766)
	call AnchorMapAndLoadTextPointer__
	jp Func_2c9d1

AnchorMapAndLoadTextPointer__: ; 2c76c (b:476c)
	ld hl, wBGMapAnchor
	ld a, VBGMap % $100
	ld [hli], a
	ld a, VBGMap / $100
	ld [hl], a
LoadTextPointer__: ; 2c775 (b:4775)
	ld a, d
	ld [wTextBGMapTop], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wTextBank], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call PrintText_JumpText
	call Func_3566
	xor a
	ld [wTextBGMapColumn], a
	ld [wTextLine], a
	ld a, $0
	ld [wTextDelayTimer], a
	ld a, $1
	ld [wTextDelayTimerReset], a
	ld a, $0
	ld [wcad3], a
	ld a, $2
	ld [wcada], a
	ld a, $1
	ld [wTextSubroutine], a
	ret

Func_2c7b9:
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call AnchorMapAndLoadTextPointer__
	ld a, $7
	ld [wca65], a
	jp Func_2c9a2

Func_2c7ce:
	ld a, $d0
	ld [wTextBoxStartTile], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call Func_3566
	ld d, $3
	call AnchorMapAndLoadTextPointer__
	ld a, $7
	ld [wca65], a
	ld a, $5
	ld [wSubroutine], a
	jp Func_2c9a2

Func_2c7ed: ; 2c7ed (b:47ed)
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, d
	ld [wTextBGMapTop], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wTextBank], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call PrintText_JumpText
	xor a
	ld [wTextBGMapColumn], a
	ld [wTextLine], a
	ld [wTextDelayTimer], a
	ld [wcad3], a
	ld a, $0
	ld [wTextDelayTimerReset], a
	ld [wcada], a
	ld a, $1
	ld [wTextSubroutine], a
	ret

Func_2c831: ; 2c831 (b:4831)
	ld a, [wMoney]
	ld l, a
	ld a, [wMoney + 1]
	ld h, a
	ld d, $0
	call Func_2c883
	call Func_2c9e6
	call PrintText
	call PrintText
	ld a, $0
	ld [wc9cf], a
	ret

OverworldIdleHUD: ; 2c84d (b:484d)
	ld a, [wMoney]
	ld l, a
	ld a, [wMoney + 1]
	ld h, a
	ld a, [wPlayerYCoord]
	cp $48 ; halfway up/down the screen
	jr nc, .on_top
	ld d, $e
	call Func_2c883
	call Func_2c9fb
	ld a, $1
	ld [wIdleHUDOnBottomOfScreen], a
	jr .done

.on_top
	ld d, $0
	call Func_2c883
	call Func_2c9fb
	ld a, $0
	ld [wIdleHUDOnBottomOfScreen], a
.done
	ld a, $1
	ld [wcd21], a
	ld a, $0
	ld [wc9cf], a
	ret

Func_2c883: ; 2c883 (b:4883)
	push de
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, "$"
	ld [wTileWhere0IsLoaded], a
	call Func_2d03
	ld b, $0
	ld c, $9d
	pop de
	call LoadTextPointer__
	ld a, $7
	ld [wca65], a
	ret

Func_2c89f: ; 2c89f (b:489f)
	ld a, [wca5d]
	cp $5a
	jr c, .skip
	call CloseIdleOverworldHUD
.skip
	xor a
	ld [wca5d], a
	ld [wcd21], a
	ret

CloseIdleOverworldHUD: ; 2c8b1 (b:48b1)
	ld a, [wIdleHUDOnBottomOfScreen]
	or a
	jr nz, .asm_2c8c6
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wBGMapAnchor]
	ld l, a
	decoord 0, 0
	call .ReloadMetatilesOverIdleHUD
	ret

.asm_2c8c6
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wBGMapAnchor]
	ld l, a
	ld bc, 14 * BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	decoord 0, 7
.ReloadMetatilesOverIdleHUD: ; 2c8d8 (b:48d8)
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	jp .ReloadMetatile

.ReloadMetatile: ; 2c8f6 (b:48f6)
	ld a, [de]
	push hl
	push de
	call LoadMetatile
	pop de
	inc de
	pop hl
	ld c, $2
	jp GetBGMapColumn

OverworldIdleHudCheck: ; 2c904 (b:4904)
	call Func_2107
	jr nz, .finish
	ld a, [wc904]
	cp $b
	jr z, .finish
	ld a, [wca5d]
	cp 90
	jr nz, .check_a
	jp OverworldIdleHUD_

.check_a
	ret c
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wOverworldIdleHUDPage]
	xor $1
	ld [wOverworldIdleHUDPage], a
	jp Func_2c9fe

.finish
	jp Func_2c89f

Func_2c92e: ; 2c92e (b:492e)
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, "$"
	ld [wTileWhere0IsLoaded], a
	push bc
	push de
	call Func_2d03
	pop de
	pop bc
	ld a, $e6
	ld [wca00], a
	call AnchorMapAndLoadTextPointer__
	ld a, $7
	ld [wca65], a
	jp Func_2ca48

Pointers_2c94f:
	dab Pointers_114000
	dab Pointers_118000
	dab Pointers_11c000
	dab Pointers_120000
	dab Pointers_124000
	dab Pointers_128000
	dab Pointers_100000
	dab Pointers_130000
	dab Pointers_134000
	dab Pointers_12c000
	dab Pointers_138000
	dab Pointers_13c000
	dab Pointers_140000
	dab Pointers_11507b
	dab Pointers_144000
	dab Pointers_145c9a
	dab Pointers_99068
	dab Pointers_40000
	dab Pointers_158000
	dab Pointers_15c000
	dab Pointers_1281d9

Func_2c98e: ; 2c98e (b:498e)
	call Func_2cf28
	call Func_2cce5
	ld de, Data_2d00f
	ld b, $6
	ld a, [wTextBGMapTop]
	ld c, $1
	call Func_2ca5c
	ret

Func_2c9a2: ; 2c9a2 (b:49a2)
	call Func_2cf28
	call Func_2ccf6
	ld de, Data_2d127
	ld b, $3
	ld a, [wTextBGMapTop]
	ld c, $1
	call Func_2ca5c
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ret

Func_2c9bd: ; 2c9bd (b:49bd)
	call Func_2cf28
	call Func_2cce5
	ld de, Data_2d0c3
	ld b, $2
	ld a, [wTextBGMapTop]
	ld c, $1
	call Func_2ca5c
	ret

Func_2c9d1: ; 2c9d1 (b:49d1)
	call Func_2cce5
	call Func_2cd3b
	ld de, wca00
	ld b, $4
	ld a, [wTextBGMapTop]
	inc a
	ld c, $2
	call Func_2ca5c
	ret

Func_2c9e6: ; 2c9e6 (b:49e6)
	call Func_2cf28
	call Func_2cceb
	ld de, Data_2d15d
	ld b, $4
	ld a, [wTextBGMapTop]
	ld c, $0
	call Func_2ca5c
	ret

Func_2c9fa:
	ret

Func_2c9fb: ; 2c9fb (b:49fb)
	call Func_2d001
Func_2c9fe: ; 2c9fe (b:49fe)
	call Func_2cd63
	ld de, wca08
	ld b, $2
	ld a, [wTextBGMapTop]
	ld c, $0
	call Func_2ca5c
	ret

Func_2ca0f: ; 2ca0f (b:4a0f)
	ld a, b
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp 100
	jr c, .asm_2ca20
	ld a, 99
.asm_2ca20
	call Get2DigitBCD
	ld a, "×"
	ld hl, VTilesShared tile $48
	call LoadCharacter
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add "0"
	ld hl, VTilesShared tile $49
	call LoadCharacter
	ld a, [wNumCGBPalettesToFade]
	and $f
	add "0"
	ld hl, VTilesShared tile $4a
	call LoadCharacter
	ret

Func_2ca48: ; 2ca48 (b:4a48)
	call Func_2cf28
	call Func_2ccf6
	ld de, Data_2d185
	ld b, $3
	ld a, [wTextBGMapTop]
	ld c, $c
	call Func_2ca5c
	ret

Func_2ca5c: ; 2ca5c (b:4a5c)
	push bc
	push de
	ld b, $0
REPT 5
	sla a
	rl b
ENDR
	ld d, a
	ld a, [wBGMapAnchor]
	add c
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld c, d
	add hl, bc
	call WrapAroundBGMapPointer
	pop de
	pop bc
.loop
	push bc
	push hl
	call Func_2caa5
	pop hl
	pop bc
	push bc
	push hl
	check_cgb
	jr nz, .not_cgb
	call Func_2caf9
.not_cgb
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop bc
	dec b
	jr nz, .loop
	ret

Func_2caa5: ; 2caa5 (b:4aa5)
	ld a, c
	ld [wSpriteDestIsCustom], a
	ld c, 18
	cp $1
	jr z, .asm_2cacb
	ld c, 10
	cp $0
	jr nz, .asm_2cac0
	ld a, [wc904]
	cp $b
	jr z, .asm_2cacb
	ld c, 20
	jr .asm_2cacb

.asm_2cac0
	ld a, [wSpriteDestIsCustom]
	ld c, 8
	cp $c
	jr z, .asm_2cacb
	ld c, 16
.asm_2cacb
	ld a, c
	ld [wc987], a
Func_2cacf:
	ld a, l
	and "$"
	ld b, a
	ld c, l
	ld a, h
	ld [wc988], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [de]
	ld [hli], a
	inc de
	ei
	ld a, [wc988]
	ld h, a
	ld a, $1
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	ld a, [wc987]
	dec a
	ld [wc987], a
	jr nz, .loop
	ret

Func_2caf9: ; 2caf9 (b:4af9)
	push de
	ld a, c
	ld d, $12
	cp $1
	jr z, .go
	ld d, $a
	cp $0
	jr nz, .asm_2cb12
	ld a, [wc904]
	cp $b
	jr z, .go
	ld d, $14
	jr .go

.asm_2cb12
	ld d, $10
.go
	ld a, l
	and "$"
	ld b, a
	ld c, l
	ld a, h
	ld e, a
	ld a, $1
	ld [rVBK], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [wca65]
	ld [hli], a
	ei
	ld a, e
	ld h, a
	ld a, $1
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	dec d
	jr nz, .loop
	xor a
	ld [rVBK], a
	pop de
	ret

Func_2cb3d: ; 2cb3d (b:4b3d)
	ld a, [wTextBGMapTop]
	inc a
	call GetBGMapRow
	ld c, $2
	call GetBGMapColumn
	push hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop de
	ld b, $3
.loop
	push bc
	push hl
	call Func_2cb8c
	pop de
	ld h, d
	ld l, e
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop bc
	dec b
	jr nz, .loop
	ret

GetBGMapRow: ; 2cb68 (b:4b68)
	ld b, $0
REPT 5
	sla a
	rl b
ENDR
	ld c, a
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	call WrapAroundBGMapPointer
	ret

Func_2cb8c: ; 2cb8c (b:4b8c)
	ld a, $8
	ld [wc987], a
	ld a, l
	and "$"
	ld b, a
	ld c, l
	ld a, h
	ld [wc988], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ei
	ld a, [wc988]
	ld h, a
	ld a, $2
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	push hl
	ld de, -BG_MAP_WIDTH
	add hl, de
	call Func_2cbc8
	ld d, h
	ld e, l
	pop hl
	ld a, [wc987]
	dec a
	ld [wc987], a
	jr nz, .loop
	ret

Func_2cbc8: ; 2cbc8 (b:4bc8)
	ld a, h
	cp VBGMap / $100
	jr nc, .asm_2cbcf
	ld h, VWindow / $100
.asm_2cbcf
	ret

Func_2cbd0: ; 2cbd0 (b:4bd0)
	ld a, [wTextBGMapTop]
	add $4
	ld b, $0
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	ld c, a
	ld a, [wTextBoxStartTile]
	cp $c0
	jr nz, .asm_2cbf8
	ld hl, Data_2d0e7
	jr .asm_2cbfb

.asm_2cbf8
	ld hl, wca00
.asm_2cbfb
	ld a, [wTextLine]
	and $1
	ld de, $0
	jr z, .asm_2cc08
	ld de, $20
.asm_2cc08
	add hl, de
	ld de, $0
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2cc16
	ld de, $10
.asm_2cc16
	add hl, de
	ld d, h
	ld e, l
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	call WrapAroundBGMapPointer
	ld c, $2
	call GetBGMapColumn
	ld a, $10
	ld [wc987], a
	jp Func_2cacf

GetBGMapColumn: ; 2cc32 (b:4c32)
	ld a, l
	and $1f
	add c
	cp BG_MAP_WIDTH
	jr c, .no_wrap
	bit 7, a
	jr z, .forward
	ld a, l
	add c
	add BG_MAP_WIDTH
	jr .finish

.forward
	ld a, l
	add c
	sub BG_MAP_WIDTH
	jr .finish

.no_wrap
	ld a, l
	add c
.finish
	ld l, a
	ret

Func_2cc4e: ; 2cc4e (b:4c4e)
	ld hl, wc480
	ld de, wOAMAnimation15
	ld b, $8
	call CopyData_Under256Bytes
	ld hl, wc4a0
	ld de, wOAMAnimation16
	ld b, $8
	call CopyData_Under256Bytes
	ld de, wcadf
	ld hl, wOAMAnimation01
	ld b, $18
	ld a, [wTextBGMapTop]
	dec a
	swap a
	srl a
	ld c, a
.asm_2cc75
	push hl
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	add $6
	cp c
	jr c, .asm_2cc92
	sub $3c
	jr nc, .asm_2cc8d
	xor a
.asm_2cc8d
	cp c
	jr nc, .asm_2cc92
	xor a
	ld [hl], a
.asm_2cc92
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_2cc75
	ld hl, wOAMAnimation15
	ld de, wc480
	ld b, $8
	call CopyData_Under256Bytes
	ld hl, wOAMAnimation16
	ld de, wc4a0
	ld b, $8
	call CopyData_Under256Bytes
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_2ccb9: ; 2ccb9 (b:4cb9)
	ld hl, wcadf
	ld de, wOAMAnimation01
	ld b, $18
.asm_2ccc1
	ld a, [hli]
	ld [de], a
	ld a, $20
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_2ccc1
	ld hl, wOAMAnimation15
	ld de, wc480
	ld b, $1
	call CopyData_Under256Bytes
	ld hl, wOAMAnimation16
	ld de, wc4a0
	ld b, $1
	call CopyData_Under256Bytes
	ret

Func_2cce5: ; 2cce5 (b:4ce5)
	call Func_2cceb
	jp Func_2ccf6

Func_2cceb: ; 2cceb (b:4ceb)
	ld a, [wTextBoxStartTile]
asm_2ccee
	call GetCurrentTileVRAMAddress
	ld b, $80
	jp Func_2ccfd

Func_2ccf6: ; 2ccf6 (b:4cf6)
	ld a, [wTextBoxStartTile]
	add $10
	jr asm_2ccee

Func_2ccfd: ; 2ccfd (b:4cfd)
	ld a, [wFontPaletteMode]
	cp $0
	jr z, .asm_2cd0c
	cp $1
	jr z, .asm_2cd1b
	cp $2
	jr z, .asm_2cd2b
.asm_2cd0c
	di
.asm_2cd0d
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd0d
	xor a
	ld [hli], a
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd0c
	ret

.asm_2cd1b
	di
.asm_2cd1c
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd1c
	xor a
	ld [hli], a
	cpl
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd1b
	ret

.asm_2cd2b
	di
.asm_2cd2c
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd2c
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd2b
	ret

Func_2cd3b: ; 2cd3b (b:4d3b)
	ld hl, wca00
	ld a, [wTileWhere0IsLoaded]
	add $f
	ld b, $30
.asm_2cd45
	ld a, a
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_2cd45
	ld hl, wca10
	ld a, [wTextBoxStartTile]
	ld b, $10
.asm_2cd53
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_2cd53
	ld hl, wca30
	ld b, $10
.asm_2cd5d
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_2cd5d
	ret

Func_2cd63: ; 2cd63 (b:4d63)
	ld hl, wca08
	ld de, Data_2d1c5
	ld a, [wOverworldIdleHUDPage]
	or a
	jr z, .asm_2cd72
	ld de, Data_2d1ed
.asm_2cd72
	ld b, $28
.asm_2cd74
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_2cd74
	ld hl, wca09
	ld c, $0
	call Func_2cd87
	ld hl, wca1d
	ld c, $1
Func_2cd87: ; 2cd87 (b:4d87)
	ld de, wca00
	ld b, $5
.loop
	ld a, [de]
	sub "0"
	jr c, .skip
	add a
	add "9"
	add c
	ld [hli], a
	jr .next

.skip
	inc hl
.next
	inc de
	dec b
	jr nz, .loop
	jr @ + 2 ; nop
	ld a, [wOverworldIdleHUDPage]
	or a
	jr z, .print_hp
	callba Func_a54f1
	push de
	ld a, d
	call Get2DigitBCD
	ld hl, wca14
	ld c, "9"
	call .Print2DigitBCD
	ld hl, wca28
	ld c, "9" + 1
	call .Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	ld hl, wca18
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca2c
	ld c, "9" + 1
	call .Print3DigitBCD
	ret

.print_hp
	ld a, [wPartnerDenjuuHPRemaining]
	call Get2DigitBCD
	ld hl, wca14
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca28
	ld c, "9" + 1
	call .Print3DigitBCD
	callba GetPartnerDenjuuMaxHP
	ld a, c
	call Get2DigitBCD
	ld hl, wca18
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca2c
	ld c, "9" + 1
	call .Print3DigitBCD
	ret

.Print3DigitBCD: ; 2ce0b (b:4e0b)
	ld a, [wCGBPalFadeProgram]
	and $f
	sla a
	add c
	ld [hli], a
.Print2DigitBCD: ; 2ce14 (b:4e14)
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	sla a
	add c
	ld [hli], a
	ld a, [wNumCGBPalettesToFade]
	and $f
	sla a
	add c
	ld [hli], a
	ret

LoadCharacter: ; 2ce29 (b:4e29)
	push hl
	ld b, $0
	add a
	jr nc, .seven_bits
	inc b
.seven_bits
	sla a
	rl b
	sla a
	rl b
	ld c, a
	ld hl, FontGFX
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wFontPaletteMode]
	cp $0
	jr z, .white_bg
	cp $1
	jr z, .hue1_bg
	cp $2
	jr z, .inverted
	cp $3
	jr z, .hue2_bg
.white_bg
	ld b, $8
.white_bg_loop
	di
.white_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .white_bg_waitstat
	ld a, [de]
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .white_bg_loop
	ret

.hue1_bg
	ld b, $8
.hue1_bg_loop
	di
.hue1_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .hue1_bg_waitstat
	ld a, [de]
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .hue1_bg_loop
	ret

.inverted
	ld b, $8
.inverted_loop
	di
.inverted_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .inverted_waitstat
	ld a, [de]
	cpl
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .inverted_loop
	ret

.hue2_bg
	ld b, $8
.hue2_bg_loop
	di
.hue2_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .hue2_bg_waitstat
	ld a, $ff
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .hue2_bg_loop
	ret

