; All of these functions take the following arguments:
; b - Y coord
; c - X coord
; e - Index within bank
; a - Bank offset

LoadStdBGMapLayout: ; a2a (0:0a2a)
	push af
	ld hl, VBGMap
	xor a
	ld [wc41e], a
	jr ContinueLoadStdTileLayout

LoadStdWindowLayout: ; a34 (0:0a34)
	push af
	ld hl, VWindow
	ld a, $1
	ld [wc41e], a
ContinueLoadStdTileLayout:
	pop af

	push hl
	push de
	ld hl, .banks
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	rst Bankswitch
	pop de
	pop hl

	push de
	ld a, b
	and $1f
	ld b, a
	ld a, c
	and $1f
	ld c, a

	ld d, $0
	ld e, c
REPT 5
	sla e
	rl d
ENDR

	ld c, b
	ld b, $0
	add hl, bc
	add hl, de
	pop de

	push hl
	ld hl, StdBGMapLayoutPointers1 ; StdBGMapLayoutPointers2
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl

	ld b, h
	ld c, l
	ld a, [de]
	cp $ff
	ret z
	and $3
	jr z, .nonrle_loop
	jr .rle_loop

.nonrle_loop
	inc de
	ld a, [de]
	cp $ff
	ret z
	cp $fe
	jr z, .next_row
	call WaitStatAndLoad
	ld a, [wc41e]
	call WrapAroundBGMapOrWindowHorizontal
	jr .nonrle_loop

.next_row
	push de
	ld de, BG_MAP_WIDTH
	ld h, b
	ld l, c
	add hl, de
	ld a, [wc41e]
	call WrapAroundBGMapOrWindowVertical
	ld b, h
	ld c, l
	pop de
	jr .nonrle_loop

.rle_loop
	inc de
	ld a, [de]
	cp $ff
	ret z
	ld a, [de]
	and $c0
	cp $c0
	jp z, .copy_decrement
	cp $80
	jp z, .copy_increment
	cp $40
	jp z, .copy_repeat
.copy_literal
	push bc
	ld a, [de]
	inc a
	ld b, a
.loop_acd
	inc de
	ld a, [de]
	call WaitStatAndLoad
	dec b
	jp nz, .loop_acd
	pop bc
	jp .rle_loop

.copy_repeat
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_ae3
	call WaitStatAndLoad
	dec b
	jp nz, .loop_ae3
	pop bc
	jp .rle_loop

.copy_increment
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_af7
	call WaitStatAndLoad
	inc a
	dec b
	jp nz, .loop_af7
	pop bc
	jp .rle_loop

.copy_decrement
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_b0c
	call WaitStatAndLoad
	dec a
	dec b
	jp nz, .loop_b0c
	pop bc
	jp .rle_loop

.banks
	db TILEMAPS_01
	db TILEMAPS_02

LoadStdBGMapAttrLayout: ; b1a (0:0b1a)
	push af
	ld a, [wdd06]
	or a
	jp z, DontLoadStdAttrMap
	check_cgb
	jp nz, DontLoadStdAttrMap
	ld hl, VBGMap
	xor a
	ld [wc41e], a
	jr ContinueLoadStdAttrLayout

LoadStdWindowAttrLayout: ; b33 (0:0b33)
	push af
	ld a, [wdd06]
	or a
	jp z, DontLoadStdAttrMap
	check_cgb
	jp nz, DontLoadStdAttrMap
	ld hl, VWindow
	ld a, $1
	ld [wc41e], a
ContinueLoadStdAttrLayout
	ld a, $1
	ld [rVBK], a
	pop af
	push hl
	push de
	ld hl, StdAttrLayoutBanks
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	rst Bankswitch
	pop de
	pop hl
	push de
	ld a, b
	and $1f
	ld b, a
	ld a, c
	and $1f
	ld c, a
	ld d, $0
	ld e, c
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld c, b
	ld b, $0
	add hl, bc
	add hl, de
	pop de
	push hl
	ld hl, StdBGMapAttrLayoutPointers1 ; StdBGMapAttrLayoutPointers2
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld b, h
	ld c, l
	ld a, [de]
	cp $ff
	ret z
	and $3
	jr z, LiteralAttrLayout
	jr RLEAttrLayout

DontLoadStdAttrMap: ; b9e (0:0b9e)
	pop af
	ret

LiteralAttrLayout: ; ba0 (0:0ba0)
.loop_regular
	inc de
	ld a, [de]
	cp $ff
	jp z, RestoreVBankAfterStdAttrLayout
	cp $fe
	jr z, .line
	call WaitStatAndLoad
	ld a, [wc41e]
	call WrapAroundBGMapOrWindowHorizontal
	jr .loop_regular

.line
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld a, [wc41e]
	call WrapAroundBGMapOrWindowVertical
	ld b, h
	ld c, l
	pop de
	jr .loop_regular

RLEAttrLayout: ; bc8 (0:0bc8)
.loop_rle
	inc de
	ld a, [de]
	cp $ff
	jp z, RestoreVBankAfterStdAttrLayout
	ld a, [de]
	and $c0
	cp $c0
	jp z, .decrement
	cp $80
	jp z, .increment
	cp $40
	jp z, .repeat
	push bc
	ld a, [de]
	inc a
	ld b, a
.loop_literal
	inc de
	ld a, [de]
	call WaitStatAndLoad
	dec b
	jp nz, .loop_literal
	pop bc
	jp .loop_rle

.repeat
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_repeat
	call WaitStatAndLoad
	dec b
	jp nz, .loop_repeat
	pop bc
	jp .loop_rle

.increment
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_increment
	call WaitStatAndLoad
	inc a
	dec b
	jp nz, .loop_increment
	pop bc
	jp .loop_rle

.decrement
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
.loop_decrement
	call WaitStatAndLoad
	dec a
	dec b
	jp nz, .loop_decrement
	pop bc
	jp .loop_rle

RestoreVBankAfterStdAttrLayout:
	xor a
	ld [rVBK], a
	ret

StdAttrLayoutBanks::
	db ATTRMAPS_01
	db ATTRMAPS_02
