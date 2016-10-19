UpdateSprites: ; 824 (0:0824)
	ld a, [wc430]
	or a
	ret z
	xor a
	ld [wc431], a
	ld hl, wOAMAnimations
	ld bc, wOAMBuffer
	ld a, 12
.loop1
	push af
	ld a, [hl]
	and $1
	call nz, UpdateCurrentSprite
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	pop af
	dec a
	jr nz, .loop1
	ld hl, wOAMAnimation17
	ld a, 8
.loop2
	push af
	ld a, [hl]
	and $81
	cp $81
	call z, UpdateCurrentSprite
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	pop af
	dec a
	jr nz, .loop2
	ld hl, wOAMAnimation13
	ld a, 12
	ld [wc40b], a
.loop3
	ld a, [hl]
	and $81
	cp $81
	jr z, .skip3
	and $1
	call nz, UpdateCurrentSprite
.skip3
	ld de, wOAMAnimation02 - wOAMAnimation01
	add hl, de
	ld a, [wc40b]
	dec a
	ld [wc40b], a
	jr nz, .loop3
	ld a, [wc432]
	ld h, a
	ld a, [wc431]
	ld [wc432], a
	sub h
	jr nc, .finish
	xor $ff
	inc a
	ld h, b
	ld l, c
	ld b, a
	xor a
.clear_loop
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	dec b
	jr nz, .clear_loop
.finish
	ld a, $1
	ld [wOAMUpdate], a
	ret

UpdateCurrentSprite: ; 89c (0:089c)
	push hl
	ld a, [hli]
	ld [wCurSpriteOAMFlags], a
	ld a, [hli]
	ld [wCurSpriteTemplateBank], a
	ld a, [hli]
	ld [wCurSpriteTemplateIdx], a
	ld a, [hli]
	add $8
	ld [wCurSpriteXCoord], a
	ld a, [hli]
	add $10
	ld [wCurSpriteYCoord], a
	ld a, [hli]
	ld [wCurSpritePalette], a
	push bc
	ld a, [wCurSpriteTemplateBank]
	and $f0
	swap a
	ld hl, OAMTemplateBanks
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch
	pop bc
	ld a, [wCurSpriteTemplateBank]
	and $f0
	swap a
	ld hl, OAMTemplateAddrs
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wCurSpriteTemplateIdx]
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld d, h
	ld e, l
.LoadTemplate: ; 8f1 (0:08f1)
	push af
	ld a, [wc431]
	inc a
	cp $29
	jp z, .Full
	ld [wc431], a
	ld a, [wCurSpriteYCoord]
	ld h, a
	ld a, [de]
	add h
	ld [bc], a
	inc bc
	inc de
	ld a, [wCurSpriteXCoord]
	ld h, a
	ld a, [de]
	add h
	ld [bc], a
	inc bc
	inc de
	ld a, [de]
	ld [bc], a
	inc bc
	inc de
	ld a, [de]
	or a
	jr nz, .fixed_flags
	ld a, [wCurSpriteOAMFlags]
	and $f0
	push bc
	ld b, a
	ld a, [wCurSpritePalette]
	and $7
	or b
	pop bc
	ld [bc], a
	inc de
	jr .next

.fixed_flags
	cp $1
	jr nz, .custom_palette
	inc de
	ld a, [de]
	ld [bc], a
	jr .next

.custom_palette
	inc de
	ld a, [de]
	and $f0
	push bc
	ld b, a
	ld a, [wCurSpritePalette]
	and $7
	or b
	pop bc
	ld [bc], a
.next
	inc bc
	inc de
	pop af
	dec a
	jp nz, .LoadTemplate
	pop hl
	ret

.Full
	pop af
	pop hl
	ret

OAMTemplateBanks:
	db OAM_TEMPLATES_00
	db OAM_TEMPLATES_01
	db OAM_TEMPLATES_02
	db OAM_TEMPLATES_03
	db OAM_TEMPLATES_04
	db OAM_TEMPLATES_05
	db OAM_TEMPLATES_06
	db OAM_TEMPLATES_07
	db OAM_TEMPLATES_08

OAMTemplateAddrs:
	dw OAMTemplates00
	dw OAMTemplates01
	dw OAMTemplates02
	dw OAMTemplates03
	dw OAMTemplates04
	dw OAMTemplates05
	dw OAMTemplates06
	dw OAMTemplates07
	dw OAMTemplates08
