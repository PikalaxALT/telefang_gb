Random::
	ld a, [wInLinkBattle]
	cp $2
	jp z, LinkRandom
	push hl
	push bc
	ld a, [wRNGState]
	ld h, a
	ld a, [wRNGState + 1]
	ld l, a
	ld a, [wVBlankCounter]
	ld b, a
	swap a
	inc a
	srl a
	add $87
	ld c, a
	add hl, bc
	ld a, l
	ld [wRNGState], a
	ld a, h
	xor l
	ld [wRNGState + 1], a
	add l
	ld [wRandomSample], a
	pop bc
	pop hl
	ret

LinkRandom: ; d7d (0:0d7d)
	push hl
	push bc
	ld a, BANK(LinkBattleRNs)
	rst Bankswitch
	ld a, [wLinkBattleRNIdx]
	inc a
	ld [wLinkBattleRNIdx], a
	ld hl, LinkBattleRNs
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wRandomSample], a
	pop bc
	pop hl
	ret
