HandleMenuScrollDelay::
	ld a, [hJoyNew]
	ld [wJoyNew], a
	and D_PAD
	jr z, .same_dpad
	ld a, $10
	ld [wMenuScrollDelay], a
.same_dpad
	ld a, [hJoyLast]
	and D_PAD
	ret z
	ld a, [wMenuScrollDelay]
	or a
	jr z, .restart_fast_delay
	dec a
	ld [wMenuScrollDelay], a
	ret

.restart_fast_delay
	ld a, $2
	ld [wMenuScrollDelay], a
	ld a, [hJoyLast]
	and D_PAD
	ld b, a
	ld a, [hJoyNew]
	or b
	ld [wJoyNew], a
	ret

ReadJoypad: ; 766 (0:0766)
	ld a, R_DPAD
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	swap a
	ld b, a
	ld a, R_BUTTONS
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	cpl
	and $f
	or b
	ld c, a
	ld a, [hJoyLast]
	xor c
	and c
	ld [hJoyNew], a
	ld a, c
	ld [hJoyLast], a
	ld a, $30
	ld [rJOYP], a
	call HandleMenuScrollDelay
	ret
