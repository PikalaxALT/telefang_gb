LCD: ; 324 (0:0324)
	push af
	ld a, [wc46d]
	cp $2
	jp nc, .ScrollScreenVerticalFollowingSprite
	push bc
	push hl
	ld a, [wc469]
	or a
	jp nz, .okay
	call .ClearLCDBuffers
	jr .bail

.okay
	ld a, [wc46d]
	or a
	jr nz, .scanlines
	ld hl, wc464
	ld a, [hli]
	sub $4
	ld b, a
	ld a, [rLY]
	cp b
	jr nc, .add_4
	ld a, [wcac1]
	or a
	jr nz, .bail
	ld a, [hli]
	ld [rWX], a
	ld a, [hl]
	ld [rWY], a
	ld a, b
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr .bail

.add_4
	ld a, b
	add $4
	ld b, a
.wait_ly
	ld a, [rLY]
	cp b
	jr c, .wait_ly
.bail3
	xor a
	ld [rSCX], a
	ld [rSCY], a
.bail2
	ld [wcac1], a
	ld a, $0
	ld [rLYC], a
	ld [wLYC], a
	ld a, $83
	ld [rLCDC], a
.bail
	pop hl
	pop bc
	pop af
	reti

.scanlines
	ld a, [wGameRoutine]
	cp $4
	jr z, .asm_03bc
	ld hl, wc467
	ld a, [rLY]
	cp $5f
	jr nc, .bail3
	ld a, [wcac1]
	cp $1
	jr z, .load_scx
	cp $0
	jr nz, .bail
	xor a
	ld [rSCX], a
	ld [rSCY], a
	ld a, $27
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr .bail

.load_scx
	ld a, [hl]
	ld [rSCX], a
	ld a, $5f
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr .bail

.asm_03bc
	ld a, [rLY]
	cp $6c
	jr nc, .wait_set_scy_0x10
	ld a, [wcac1]
	cp $1
	jr z, .wait_set_scy_wc467
	cp $0
	jr nz, .bail
	ld a, $7f
	ld [rSCY], a
	ld a, $14
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr .bail

.wait_set_scy_wc467
	ld a, [rLY]
	cp $18
	jr c, .wait_set_scy_wc467
	ld a, [wc467]
	ld [rSCY], a
	ld a, $6c
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr .bail

.wait_set_scy_0x10
	ld a, [rLY]
	cp $70
	jr c, .wait_set_scy_0x10
	ld a, $10
	ld [rSCY], a
	xor a
	ld [rSCX], a
	jp .bail2

.ScrollScreenVerticalFollowingSprite
	push hl
	ld hl, wOAMAnimation06
	ld a, [wc957]
	or a
	jr nz, .got_start_addr
	ld hl, wOAMAnimation01
.got_start_addr
	ld a, [wc46d]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [rSCY], a
	ld a, [wc46d]
	inc a
	ld [wc46d], a
	pop hl
	pop af
	reti

.ClearLCDBuffers
	xor a
	ld [wcac1], a
	ld hl, wc460
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret
