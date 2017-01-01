DrawHPBar::
	ld b, $6
	ld [wcb20], a
.full_loop
	sub $8
	jr c, .less_than_full_tile
	ld [wcb20], a
	push af
	ld a, $8 ; full HP
	call PlaceHPBarTile
	pop af
	dec b
	jp nz, .full_loop
	ret

.less_than_full_tile
	ld a, [wcb20] ; HP mod 8
	call PlaceHPBarTile
	dec b
	ret z
.empty_loop
	xor a
	call PlaceHPBarTile
	dec b
	jp nz, .empty_loop
	ret

CalcHPBarLength::
; a: current HP
; e: max HP
; return to a
	cp e
	jr z, .full_hp
	push af
	ld bc, $3000
	ld d, $0
	call Divide_BC_by_DE_signed_
	pop af
	ld d, $0
	ld e, a
	call Multiply_DE_by_BC
	ld a, d
	ret

.full_hp
	ld a, 48
	ret

SetHPBarPalette::
	cp 13
	jr c, .red
	cp 21
	jr c, .yellow
	ld bc, $2
	jr .load

.yellow
	ld bc, $3
	jr .load

.red
	ld bc, $4
.load
	ld a, d
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

PlaceHPBarTile: ; 39b7 (0:39b7)
	push bc
	push hl
	bit 0, c
	jr nz, .player1
	ld hl, .Data_Enemy
	jp .continue

.player1
	ld hl, .Data_Player
.continue
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	pop hl
	push hl
	call WaitStatAndLoad
	pop hl
	pop bc
	bit 0, c
	jr nz, .player2
	inc hl
	ret

.player2
	dec hl
	ret

	;    0,   1,   2,   3,   4,   5,   6,   7,   8
.Data_Enemy:
	db $3e, $30, $31, $32, $33, $34, $35, $36, $3f
.Data_Player:
	db $3e, $37, $38, $39, $3a, $3b, $3c, $3d, $3f
