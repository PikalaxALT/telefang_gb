Func_c000:
	ld bc, $20
	call Wait17500TimesBCCycles
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2a0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2b0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2c0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2d0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2e0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2f0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c300
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c310
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, GFX_e368 + $86 tiles
	ld de, Data_c230
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368 + $b7 tiles
	ld de, Data_c270
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_c368
	ld de, Data_c240
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_d368
	ld de, Data_c250
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368
	ld de, Data_c260
	call CopyToVRAMAndSendToSGB
	ld hl, Data_c280
	call SendViaJoypadRegister
	ld bc, $40
	call Wait17500TimesBCCycles
	ld b, $0
	ld c, $0
	ld d, $0
	ld e, $0
	ld a, $0
	jp Func_c320

Func_c0b8:
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, GFX_c368
	ld de, Data_c240
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_d368
	ld de, Data_c250
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368
	ld de, Data_c260
	call CopyToVRAMAndSendToSGB
	ld hl, Data_c280
	call SendViaJoypadRegister
	ld bc, $20
	call Wait17500TimesBCCycles
	ret

Func_c0ec:
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c112
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ret

Func_c105:
	ld hl, wcc00
	call SendViaJoypadRegister
	ld bc, $3
	call Wait17500TimesBCCycles
	ret

Data_c112:
	db $50 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $c2, $00, $00
	db     $00, $00, $00, $00

Wait17500TimesBCCycles: ; c122 (3:4122)
	ld de, 1750
.asm_c125
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_c125
	dec bc
	ld a, b
	or c
	jr nz, Wait17500TimesBCCycles
	ret

SendViaJoypadRegister: ; c133 (3:4133)
	ld a, [hl]
	and $7
	ret z
	ld b, a
	ld c, rJOYP % $100
.loop
	push bc
	ld a, $0
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	ld b, $10
.loop_byte
	ld e, $8
	ld a, [hli]
	ld d, a
.loop_bit
	bit 0, d
	ld a, R_BUTTONS
	jr nz, .got_value
	ld a, R_DPAD
.got_value
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	rr d
	dec e
	jr nz, .loop_bit
	dec b
	jr nz, .loop_byte
	ld a, R_DPAD
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	pop bc
	dec b
	ret z
	call Wait70000Cycles
	jr .loop

CopyToVRAMAndSendToSGB: ; c169 (3:4169)
	di
	push de
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld de, VTilesShared
	ld bc, $100 tiles
	call .CopyData
	ld hl, VBGMap
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	ld a, $80
	ld c, 13
.row
	ld b, SCREEN_WIDTH
.column
	ld [hli], a
	inc a
	dec b
	jr nz, .column
	add hl, de
	dec c
	jr nz, .row
	ld a, $81
	ld [rLCDC], a
	ld bc, $5
	call Wait17500TimesBCCycles
	pop hl
	call SendViaJoypadRegister
	ld bc, $6
	call Wait17500TimesBCCycles
	ei
	ret

.CopyData: ; c1a6 (3:41a6)
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .CopyData
	ret

Func_c1af: ; c1af (3:41af)
	ld hl, Data_c214
	call SendViaJoypadRegister
	call Wait70000Cycles
	ld a, [rJOYP]
	and A_BUTTON | B_BUTTON
	cp  A_BUTTON | B_BUTTON
	jr nz, .finish_return_carry
	ld a, R_DPAD
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, R_BUTTONS
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	and A_BUTTON | B_BUTTON
	cp  A_BUTTON | B_BUTTON
	jr nz, .finish_return_carry
	ld hl, Data_c204
	call SendViaJoypadRegister
	call Wait70000Cycles
	sub a
	ret

.finish_return_carry
	ld hl, Data_c204
	call SendViaJoypadRegister
	call Wait70000Cycles
	scf
	ret

Data_c204:
	db $88 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c214:
	db $88 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Wait70000Cycles: ; c224 (3:4224)
	ld de, 7000
.asm_c227
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_c227
	ret

Data_c230:
	db $58 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c240:
	db $98 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c250:
	db $98 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c260:
	db $a0 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c270:
	db $a8 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c280:
	db $b8 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c290:
	db $b8 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c2a0:
	db $78 | 1, $5d, $08, $00
	db     $0b, $8c, $d0, $f4
	db     $60, $00, $00, $00
	db     $00, $00, $00, $00

Data_c2b0:
	db $78 | 1, $52, $08, $00
	db     $0b, $a9, $e7, $9f
	db     $01, $c0, $7e, $e8
	db     $e8, $e8, $e8, $e0

Data_c2c0:
	db $78 | 1, $47, $08, $00
	db     $0b, $c4, $d0, $16
	db     $a5, $cb, $c9, $05
	db     $d0, $10, $a2, $28

Data_c2d0:
	db $78 | 1, $3c, $08, $00
	db     $0b, $f0, $12, $a5
	db     $c9, $c9, $c8, $d0
	db     $1c, $a5, $ca, $c9

Data_c2e0:
	db $78 | 1, $31, $08, $00
	db     $0b, $0c, $a5, $ca
	db     $c9, $7e, $d0, $06
	db     $a5, $cb, $c9, $7e

Data_c2f0:
	db $78 | 1, $26, $08, $00
	db     $0b, $39, $cd, $48
	db     $0c, $d0, $34, $a5
	db     $c9, $c9, $80, $d0

Data_c300:
	db $78 | 1, $1b, $08, $00
	db     $0b, $ea, $ea, $ea
	db     $ea, $ea, $a9, $01
	db     $cd, $4f, $0c, $d0

Data_c310:
	db $78 | 1, $10, $08, $00
	db     $0b, $4c, $20, $08
	db     $ea, $ea, $ea, $ea
	db     $ea, $60, $ea, $ea

Func_c320: ; c320 (3:4320)
	push af
	ld a, [wc40a]
	or a
	jp nz, Func_c32a
	pop af
	ret

Func_c32a: ; c32a (3:432a)
	pop af
	add $c0
	ld [wcc09], a
	ld a, b
	ld [wcc01], a
	ld a, c
	ld [wcc03], a
	ld a, d
	ld [wcc05], a
	ld a, e
	ld [wcc07], a
	ld a, $51
	ld [wcc00], a
	xor a
	ld [wcc02], a
	ld [wcc04], a
	ld [wcc06], a
	ld [wcc08], a
	xor a
	ld [wcc0a], a
	ld [wcc0b], a
	ld [wcc0c], a
	ld [wcc0d], a
	ld [wcc0e], a
	ld [wcc0f], a
	jp Func_c105

IF DEF(POWER)
GFX_c368: INCBIN "gfx/misc/c368.power.2bpp"
GFX_d368: INCBIN "gfx/misc/d368.power.2bpp"
GFX_e368: INCBIN "gfx/misc/e368.power.2bpp"
ELSE
GFX_c368: INCBIN "gfx/misc/c368.speed.2bpp"
GFX_d368: INCBIN "gfx/misc/d368.speed.2bpp"
GFX_e368: INCBIN "gfx/misc/e368.speed.2bpp"
ENDC

REPT $1e
	db $0
ENDR
