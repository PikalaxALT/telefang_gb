SpeedUpAnimation:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c014
	dw Func_6c029
	dw Func_6c04a
	dw Func_6c069
	dw Func_6f229

Func_6c014: ; 6c014 (1b:4014)
	ld a, $0
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, SFX_4E
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c029: ; 6c029 (1b:4029)
	ld bc, $ff
	ld de, wOAMAnimation02
	call Func_6f1ff
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	ld a, $20
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c04a: ; 6c04a (1b:404a)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $3
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, SFX_40
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c069: ; 6c069 (1b:4069)
	ld de, wOAMAnimation02
	call Func_6f133
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

ParameterDownAnimation: ; 6c082 (1b:4082)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c098
	dw Func_6c0ad
	dw Func_6c0d3
	dw Func_6c0ee
	dw Func_6c109
	dw Func_6f229

Func_6c098: ; 6c098 (1b:4098)
	ld a, $0
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, SFX_26
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c0ad: ; 6c0ad (1b:40ad)
	ld de, wOAMAnimation02
	call Func_6f133
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8d
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	ld a, SFX_4A
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c0d3: ; 6c0d3 (1b:40d3)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c0ee: ; 6c0ee (1b:40ee)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8d
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c109: ; 6c109 (1b:4109)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

AvoidAnimation: ; 6c11b (1b:411b)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c131
	dw Func_6c146
	dw Func_6c16c
	dw Func_6c187
	dw Func_6c1a2
	dw Func_6f229

Func_6c131: ; 6c131 (1b:4131)
	ld a, $0
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, SFX_26
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c146: ; 6c146 (1b:4146)
	ld de, wOAMAnimation02
	call Func_6f133
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8d
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	ld a, SFX_4A
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c16c: ; 6c16c (1b:416c)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c187: ; 6c187 (1b:4187)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $8d
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $8
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c1a2: ; 6c1a2 (1b:41a2)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

InvigorateAnimation: ; 6c1b4 (1b:41b4)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c1c8
	dw Func_6c1dd
	dw Func_6c1fe
	dw Func_6f20f
	dw Func_6f229

Func_6c1c8: ; 6c1c8 (1b:41c8)
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, SFX_35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c1dd: ; 6c1dd (1b:41dd)
	ld bc, $ff
	ld de, wOAMAnimation02
	call Func_6f1ff
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	ld a, $20
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c1fe: ; 6c1fe (1b:41fe)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $4
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, SFX_26
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

ChargeUpAnimation: ; 6c21d (1b:421d)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c231
	dw Func_6c246
	dw Func_6c264
	dw Func_6f20f
	dw Func_6f229

Func_6c231: ; 6c231 (1b:4231)
	ld a, $5
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, SFX_26
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c246: ; 6c246 (1b:4246)
	ld de, wOAMAnimation02
	call Func_6f133
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	ld a, $20
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c264: ; 6c264 (1b:4264)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $6
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, SFX_26
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

RecoverAnimation: ; 6c27e (1b:427e)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c28e
	dw Func_6c34e
	dw Func_6f229

Func_6c28e: ; 6c28e (1b:428e)
	ld b, $24
	ld c, $50
	ld d, $20
	ld a, [wBattleTurn]
	and a
	jr z, .asm_6c2a0
	ld b, $70
	ld c, $30
	ld d, $0
.asm_6c2a0
	ld a, d
	ld [wd41a], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld [wSpriteInitXCoordBuffers + 5], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ld [wSpriteInitYCoordBuffers + 5], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $18
	ld [wOAMAnimation03 + $18], a
	ld a, $30
	ld [wOAMAnimation04 + $18], a
	ld a, $48
	ld [wOAMAnimation05 + $18], a
	ld a, $60
	ld [wOAMAnimation06 + $18], a
	ld a, $38
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld [wOAMAnimation06 + $19], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld [wOAMAnimation06 + $11], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation06 + $13], a
	ld a, $2
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $2
	ld de, wOAMAnimation03
	call Func_6f13c
	ld a, $2
	ld de, wOAMAnimation04
	call Func_6f13c
	ld a, $2
	ld de, wOAMAnimation05
	call Func_6f13c
	ld a, $2
	ld de, wOAMAnimation06
	call Func_6f13c
	ld a, $0
	ld [wd4c4], a
	call Func_6c397
	ld a, $a
	ld [wMoveAnimationTimer], a
	ld a, SFX_40
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c34e: ; 6c34e (1b:434e)
	ld a, [wd41a]
	ld b, a
	ld a, [wSpriteInitYCoordBuffers + 1]
	cp b
	jr z, .asm_6c376
	ld a, [wSpriteInitYCoordBuffers + 1]
	dec a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation06 + $13], a
	ld a, $1
	ld [wd4c4], a
	jp Func_6c397

.asm_6c376
	ld a, $0
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld [wOAMAnimation05_PriorityFlags], a
	ld [wOAMAnimation06_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, SFX_40
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c394:
	jp NextMoveAnimationSubroutine

Func_6c397: ; 6c397 (1b:4397)
	ld a, $2
	ld [wd4c4], a
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation02
	call Func_6c3d9
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation03
	call Func_6c3d9
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation04
	call Func_6c3d9
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation05
	call Func_6c3d9
	ld a, $5
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation06
	call Func_6c3d9
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6c3d9: ; 6c3d9 (1b:43d9)
	push de
	ld hl, $18
	add hl, de
	ld a, [wd4c4]
	ld b, a
	ld a, [hl]
	add b
	ld b, a
	ld [hl], a
	and $7f
	cp $0
	jr nz, .asm_6c3f3
	push af
	ld a, $1
	ld [wd4c2], a
	pop af
.asm_6c3f3
	ld [hli], a
	ld d, a
	ld a, [hl]
	ld e, a
	call Func_302d
	bit 7, e
	sra e
	sra e
	ld b, e
	pop de
	ld hl, $11
	add hl, de
	ld a, [hl]
	add c
	push af
	ld hl, $13
	add hl, de
	ld a, [hl]
	add b
	ld c, a
	pop af
	ld b, a
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld hl, $18
	add hl, de
	ld a, [hl]
	cp $50
	jr c, .asm_6c42e
	cp $70
	jr nc, .asm_6c42e
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ret

.asm_6c42e
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hl], a
	ret

Func_6c437:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c44c
	dw Func_6c488
	dw Func_6c4e2
	dw Func_6c504
	dw Func_6c517
	dw Func_6f229

Func_6c44c: ; 6c44c (1b:444c)
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, SFX_30
	ld [H_SFX_ID], a
	ld a, $20
	ld [wd45b], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wd45d], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c488: ; 6c488 (1b:4488)
	call Func_6c521
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $96
	jr nc, .asm_6c4da
	dec a
	and $1f
	ret nz
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6c4bd
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
	jr .asm_6c4cf

.asm_6c4bd
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
.asm_6c4cf
	ld c, $1
	callba Func_cdeac
	ret

.asm_6c4da
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c4e2: ; 6c4e2 (1b:44e2)
	call Func_6c521
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	ret c
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c504: ; 6c504 (1b:4504)
	call Func_6c521
	callba Func_cc000
	ld a, [wd45b]
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_6c517: ; 6c517 (1b:4517)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6c521: ; 6c521 (1b:4521)
	ld a, [wVBlankCounter]
	and $7
	jr nz, .asm_6c532
	ld a, [wd45b]
	or a
	jr z, .asm_6c532
	dec a
	ld [wd45b], a
.asm_6c532
	ld a, [wd45b]
	ld b, a
	ld a, b
	ld [wcac2], a
	ld de, Data_cef59
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	callba Func_cef5c
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ret

RestoreAnimation: ; 6c556 (1b:4556)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c56c
	dw Func_6c5a8
	dw Func_6c602
	dw Func_6c624
	dw Func_6c637
	dw Func_6f229

Func_6c56c: ; 6c56c (1b:456c)
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, SFX_30
	ld [H_SFX_ID], a
	ld a, $20
	ld [wd45b], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wd45d], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c5a8: ; 6c5a8 (1b:45a8)
	call Func_6c641
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $96
	jr nc, .asm_6c5fa
	dec a
	and $1f
	ret nz
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6c5dd
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
	jr .asm_6c5ef

.asm_6c5dd
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
.asm_6c5ef
	ld c, $4
	callba Func_cdeac
	ret

.asm_6c5fa
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c602: ; 6c602 (1b:4602)
	call Func_6c641
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	ret c
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c624: ; 6c624 (1b:4624)
	call Func_6c641
	callba Func_cc000
	ld a, [wd45b]
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_6c637: ; 6c637 (1b:4637)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6c641: ; 6c641 (1b:4641)
	ld a, [wVBlankCounter]
	and $7
	jr nz, .asm_6c652
	ld a, [wd45b]
	or a
	jr z, .asm_6c652
	dec a
	ld [wd45b], a
.asm_6c652
	ld a, [wd45b]
	ld b, a
	ld a, b
	ld [wcac2], a
	ld de, Data_cef59
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	callba Func_cef5c
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ret

ShieldAnimation: ; 6c676 (1b:4676)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c68c
	dw Func_6c69c
	dw Func_6c6a2
	dw Func_6c6b2
	dw Func_6c6d1
	dw Func_6f229

Func_6c68c: ; 6c68c (1b:468c)
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, SFX_30
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c69c: ; 6c69c (1b:469c)
	ld de, wOAMAnimation02
	jp Func_6f0ff

Func_6c6a2: ; 6c6a2 (1b:46a2)
	ld a, $3
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c6b2: ; 6c6b2 (1b:46b2)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

Func_6c6d1: ; 6c6d1 (1b:46d1)
	jp NextMoveAnimationSubroutine

ProtectAnimation: ; 6c6d4 (1b:46d4)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c6ea
	dw Func_6c6fa
	dw Func_6c700
	dw Func_6c710
	dw Func_6c72f
	dw Func_6f229

Func_6c6ea: ; 6c6ea (1b:46ea)
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, SFX_30
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c6fa: ; 6c6fa (1b:46fa)
	ld de, wOAMAnimation02
	jp Func_6f0ff

Func_6c700: ; 6c700 (1b:4700)
	ld a, $3
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c710: ; 6c710 (1b:4710)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

Func_6c72f: ; 6c72f (1b:472f)
	jp NextMoveAnimationSubroutine

IronWallAnimation: ; 6c732 (1b:4732)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c748
	dw Func_6c758
	dw Func_6c75e
	dw Func_6c76e
	dw Func_6c78d
	dw Func_6f229

Func_6c748: ; 6c748 (1b:4748)
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, SFX_30
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c758: ; 6c758 (1b:4758)
	ld de, wOAMAnimation02
	jp Func_6f0ff

Func_6c75e: ; 6c75e (1b:475e)
	ld a, $3
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6c76e: ; 6c76e (1b:476e)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

Func_6c78d: ; 6c78d (1b:478d)
	jp NextMoveAnimationSubroutine

CamouflageAnimation: ; 6c790 (1b:4790)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c7a6
	dw Func_6c7b3
	dw Func_6c89b
	dw Func_6c8a8
	dw Func_6c8da
	dw Func_6c8dd

Func_6c7a6: ; 6c7a6 (1b:47a6)
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6c7b3: ; 6c7b3 (1b:47b3)
	ld a, [wMoveAnimationTimer]
	cp $31
	jr nc, .asm_6c7c3
	ld a, [Data_6c845]
	ld d, a
	ld e, $7
	call Func_6c84d
.asm_6c7c3
	ld a, [wMoveAnimationTimer]
	cp $32
	jr nc, .asm_6c7d3
	ld a, [Data_6c845 + 1]
	ld d, a
	ld e, $6
	call Func_6c84d
.asm_6c7d3
	ld a, [wMoveAnimationTimer]
	cp $33
	jr nc, .asm_6c7e3
	ld a, [Data_6c845 + 2]
	ld d, a
	ld e, $5
	call Func_6c84d
.asm_6c7e3
	ld a, [wMoveAnimationTimer]
	cp $34
	jr nc, .asm_6c7f3
	ld a, [Data_6c845 + 3]
	ld d, a
	ld e, $4
	call Func_6c84d
.asm_6c7f3
	ld a, [wMoveAnimationTimer]
	cp $35
	jr nc, .asm_6c803
	ld a, [Data_6c845 + 4]
	ld d, a
	ld e, $3
	call Func_6c84d
.asm_6c803
	ld a, [wMoveAnimationTimer]
	cp $36
	jr nc, .asm_6c813
	ld a, [Data_6c845 + 5]
	ld d, a
	ld e, $2
	call Func_6c84d
.asm_6c813
	ld a, [wMoveAnimationTimer]
	cp $37
	jr nc, .asm_6c823
	ld a, [Data_6c845 + 6]
	ld d, a
	ld e, $1
	call Func_6c84d
.asm_6c823
	ld a, [wMoveAnimationTimer]
	cp $38
	jr nc, .asm_6c833
	ld a, [Data_6c845 + 7]
	ld d, a
	ld e, $0
	call Func_6c84d
.asm_6c833
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $38
	ret nz
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Data_6c845:
	db $7f
	db $77
	db $57
	db $55
	db $15
	db $11
	db $01
	db $00

Func_6c84d: ; 6c84d (1b:484d)
	ld a, [wMoveAnimationTimer]
	add e
	and $f8
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, VTilesShared tile $00
	ld a, [wBattleTurn]
	or a
	jr nz, .asm_6c872
	ld hl, VTilesShared tile $38
.asm_6c872
	add hl, bc
	ld a, [wMoveAnimationTimer]
	add e
	and $7
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld e, $8
	di
.asm_6c884
	ld a, [rSTAT]
	and $2
	jr nz, .asm_6c884
	inc hl
	ld a, [hl]
	and d
	ld [hl], a
	ei
	ld a, $f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec e
	jr nz, .asm_6c884
	ret

Func_6c89b: ; 6c89b (1b:489b)
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	ret c
	jp NextMoveAnimationSubroutine

Func_6c8a8: ; 6c8a8 (1b:48a8)
	ld a, BANK(Func_6c8a8)
	ld [wPrevROMBank], a
	ld a, [wBattleTurn]
	or a
	jr nz, .asm_6c8c6
	ld hl, wPlayerDenjuu1Species
	ld a, [wCurBattleDenjuu]
	call Func_6c8ea
	ld de, VTilesShared tile $38
	ld c, $1
	call LoadDenjuuPic_
	jr .asm_6c8d7

.asm_6c8c6
	ld hl, wEnemyDenjuu1Species
	ld a, [wCurEnemyDenjuu]
	call Func_6c8ea
	ld de, VTilesShared tile $00
	ld c, $0
	call LoadDenjuuPic_
.asm_6c8d7
	jp NextMoveAnimationSubroutine

Func_6c8da: ; 6c8da (1b:48da)
	jp NextMoveAnimationSubroutine

Func_6c8dd: ; 6c8dd (1b:48dd)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld a, $17
	ld [wd401], a
	ret

Func_6c8ea: ; 6c8ea (1b:48ea)
	ld de, $16
	addntimes_hl_de
	ld a, [hl]
	ret

UltrasonicAnimation: ; 6c8f7 (1b:48f7)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6c90b
	dw Func_6c958
	dw Func_6c98d
	dw Func_6ca06
	dw Func_6ca21

Func_6c90b: ; 6c90b (1b:490b)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6c926
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6c938

.asm_6c926
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6c938
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, SFX_4F
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wca60], a
	jp NextMoveAnimationSubroutine

Func_6c958: ; 6c958 (1b:4958)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld c, $24
	cp $a
	jr z, .asm_6c984
	ld c, $23
	cp $14
	jr z, .asm_6c984
	ld c, $22
	cp $1e
	jr z, .asm_6c984
	cp $1e
	ret c
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

.asm_6c984
	callba Func_cc2eb
	ret

Func_6c98d: ; 6c98d (1b:498d)
	call Func_6ca2b
	call Func_6ca51
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6c9c0
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $a
	ld [hl], a
	jr .asm_6c9d2

.asm_6c9c0
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $2
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $12
	ld [hl], a
.asm_6c9d2
	ld c, $25
	callba Func_cc3aa
	ld hl, wOAMAnimation01
	ld bc, $e00
	call Func_2b01
	ld c, $26
	callba Func_cc3aa
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $20
	ld [wca60], a
	ld a, $1e
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ca06: ; 6ca06 (1b:4a06)
	call Func_6ca2b
	call Func_6ca51
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $46
	ret c
	jp NextMoveAnimationSubroutine

Func_6ca21: ; 6ca21 (1b:4a21)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6ca2b: ; 6ca2b (1b:4a2b)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef50
	callba Func_cef5c
	ld a, [wcac2]
	or a
	jr z, .asm_6ca4b
	sub $1
	jr nc, .asm_6ca47
	xor a
.asm_6ca47
	ld [wcac2], a
	ret

.asm_6ca4b
	ld a, $ff
	ld [wcac2], a
	ret

Func_6ca51: ; 6ca51 (1b:4a51)
	ld a, [wVBlankCounter]
	ld d, a
	sla d
	sla d
	sla d
	sla d
	call Sine8_
	ld e, a
	ld a, [wca60]
	ld c, a
	call Multiply_C_by_E_signed
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6ca84
	ld a, $58
	add d
	ld [wWX], a
	call Func_6f1d2
.asm_6ca7a
	ld a, [wca60]
	or a
	ret z
	dec a
	ld [wca60], a
	ret

.asm_6ca84
	ld a, $0
	add d
	ld [wSCX], a
	jr .asm_6ca7a

EmWaveAnimation: ; 6ca8c (1b:4a8c)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6caa0
	dw Func_6caea
	dw Func_6cb22
	dw Func_6cbf1
	dw Func_6cc2d

Func_6caa0: ; 6caa0 (1b:4aa0)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6cabb
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6cacd

.asm_6cabb
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6cacd
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, SFX_4F
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6caea: ; 6caea (1b:4aea)
	callba Func_cc000
	call Func_6cc3a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld c, $24
	cp $a
	jr z, .asm_6cb19
	ld c, $23
	cp $14
	jr z, .asm_6cb19
	ld c, $22
	cp $1e
	jr z, .asm_6cb19
	cp $1e
	ret c
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

.asm_6cb19
	callba Func_cc2eb
	ret

Func_6cb22: ; 6cb22 (1b:4b22)
	call Func_6cc3a
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6cb52
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $a
	ld [hl], a
	jr .asm_6cb64

.asm_6cb52
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $2
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $12
	ld [hl], a
.asm_6cb64
	ld c, $25
	callba Func_cc3aa
	ld hl, wOAMBufferEnd
	ld bc, $e00
	call Func_2b01
	ld c, $26
	callba Func_cc3aa
	ld hl, wOAMAnimation01
	ld bc, $f600
	call Func_2b01
	ld bc, $fb00
	call Func_2af4
	ld c, $27
	callba Func_cc4a1
	ld hl, wOAMAnimation01
	ld bc, $580
	call Func_2b01
	ld c, $28
	callba Func_cc4a1
	ld hl, wOAMBufferEnd
	ld bc, $180
	call Func_2b01
	ld bc, $980
	call Func_2af4
	ld c, $27
	callba Func_cc4a1
	ld hl, wOAMAnimations
	ld bc, $f6c0
	call Func_2b01
	ld bc, $0
	call Func_2af4
	ld c, $28
	callba Func_cc4a1
	ld a, $20
	ld [wca60], a
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6cbf1: ; 6cbf1 (1b:4bf1)
	callba Func_cc000
	call Func_6cc3a
	call Func_6ca51
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $20
	jr c, .asm_6cc10
	cp $46
	ret c
	jp NextMoveAnimationSubroutine

.asm_6cc10
	ld a, [wVBlankCounter]
	sla a
	sla a
	sla a
	ld d, a
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	sra a
	add $10
	ld [wcac2], a
	ret

Func_6cc2d: ; 6cc2d (1b:4c2d)
	call Func_6caea
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6cc3a: ; 6cc3a (1b:4c3a)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef47
	callba Func_cef5c
	ld b, $1
	ld a, [wMoveAnimationSubroutine]
	cp $3
	jr nc, .asm_6cc56
	ld b, $3
.asm_6cc56
	ld a, [wcac2]
	or a
	jr z, .asm_6cc64
	sub b
	jr nc, .asm_6cc60
	xor a
.asm_6cc60
	ld [wcac2], a
	ret

.asm_6cc64
	ld a, $ff
	ld [wcac2], a
	ret

CurseSongAnimation: ; 6cc6a (1b:4c6a)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6cc82
	dw Func_6cd19
	dw Func_6cd1c
	dw Func_6cd9d
	dw Func_6cdd6
	dw Func_6cdd9
	dw Func_6f229

Func_6cc82: ; 6cc82 (1b:4c82)
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld [wOAMAnimation04 + $18], a
	ld [wOAMAnimation05 + $18], a
	ld a, $4
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $5
	ld de, wOAMAnimation03
	call Func_6f13c
	ld a, $4
	ld de, wOAMAnimation04
	call Func_6f13c
	ld a, $5
	ld de, wOAMAnimation05
	call Func_6f13c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $0
	ld [wOAMAnimation02 + $1a], a
	ld a, $18
	ld [wOAMAnimation03 + $1a], a
	ld a, $30
	ld [wOAMAnimation04 + $1a], a
	ld a, $48
	ld [wOAMAnimation05 + $1a], a
	xor a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld [wOAMAnimation05_PriorityFlags], a
	ld a, SFX_3C
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6cd19: ; 6cd19 (1b:4d19)
	jp Func_6ce1e

Func_6cd1c: ; 6cd1c (1b:4d1c)
	ld a, $8
	ld de, wOAMAnimation02
	call Func_6f058
	ld a, $9
	ld de, wOAMAnimation03
	call Func_6f058
	ld a, $a
	ld de, wOAMAnimation04
	call Func_6f058
	ld a, $b
	ld de, wOAMAnimation05
	call Func_6f058
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, SFX_4B
	ld [H_SFX_ID], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6cd61
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $a
	ld [hl], a
	jr .asm_6cd73

.asm_6cd61
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $2
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $12
	ld [hl], a
.asm_6cd73
	ld c, $2c
	callba Func_cc3aa
	ld hl, wOAMAnimation01
	ld bc, $e00
	call Func_2b01
	ld c, $2d
	callba Func_cc3aa
	ld a, $20
	ld [wca60], a
	ld a, $1e
	ld [wcac2], a
	jp NextMoveAnimationSubroutine

Func_6cd9d: ; 6cd9d (1b:4d9d)
	call Func_6ca2b
	call Func_6ca51
	callba Func_cc000
	ld de, wOAMAnimation02
	call Func_6f133
	ld de, wOAMAnimation03
	call Func_6f133
	ld de, wOAMAnimation04
	call Func_6f133
	ld de, wOAMAnimation05
	call Func_6f133
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6f1c2
	jp NextMoveAnimationSubroutine

Func_6cdd6: ; 6cdd6 (1b:4dd6)
	jp NextMoveAnimationSubroutine

Func_6cdd9: ; 6cdd9 (1b:4dd9)
	jp NextMoveAnimationSubroutine

Func_6cddc: ; 6cddc (1b:4ddc)
	call Func_6cdee
	ld hl, $4
	add hl, de
	ld [hl], a
	ret

Func_6cde5:
	call Func_6cdee
	ld hl, $3
	add hl, de
	ld [hl], a
	ret

Func_6cdee: ; 6cdee (1b:4dee)
	push de
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc a
	inc a
	inc a
	ld [hl], a
	ld d, a
	call Sine8_
	sra a
	sra a
	sra a
	sra a
	ld b, a
	pop de
	ld hl, $19
	add hl, de
	ld a, [hl]
	add b
	ret

Func_6ce0d: ; 6ce0d (1b:4e0d)
	ld hl, $3
	add hl, de
	ld a, [hl]
	cp $78
	jr nc, .asm_6ce19
	cp $28
	ret nc
.asm_6ce19
	push de
	pop hl
	jp Func_6f1c2

Func_6ce1e: ; 6ce1e (1b:4e1e)
	ld de, wOAMAnimation02
	ld b, $4
.asm_6ce23
	push bc
	push de
	ld hl, $2
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6ce3e
	ld hl, $1a
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6ce3b
	dec a
	ld [hl], a
	jr .asm_6ce3e

.asm_6ce3b
	call Func_6ce52
.asm_6ce3e
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_6ce23
	ld a, [wOAMAnimation05_TemplateIdx]
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

Func_6ce52: ; 6ce52 (1b:4e52)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	or a
	jr nz, .asm_6ce6d
	ld bc, $c0
	call Func_6f35e
	ld bc, hFFC0
	call Func_6f370
	jr .asm_6ce79

.asm_6ce6d
	ld bc, rLCDC
	call Func_6f35e
	ld bc, $40
	call Func_6f370
.asm_6ce79
	ld hl, $4
	add hl, de
	ld a, [hl]
	ld hl, $19
	add hl, de
	ld [hl], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	push de
	call Func_6cddc
	pop de
	jp Func_6ce0d

LullabyAnimation: ; 6ce90 (1b:4e90)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6cea8
	dw Func_6cf3f
	dw Func_6cf42
	dw Func_6cf5f
	dw Func_6d052
	dw Func_6d055
	dw Func_6f229

Func_6cea8: ; 6cea8 (1b:4ea8)
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld [wOAMAnimation04 + $18], a
	ld [wOAMAnimation05 + $18], a
	ld a, $6
	ld de, wOAMAnimation02
	call Func_6f13c
	ld a, $7
	ld de, wOAMAnimation03
	call Func_6f13c
	ld a, $6
	ld de, wOAMAnimation04
	call Func_6f13c
	ld a, $7
	ld de, wOAMAnimation05
	call Func_6f13c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $0
	ld [wOAMAnimation02 + $1a], a
	ld a, $18
	ld [wOAMAnimation03 + $1a], a
	ld a, $30
	ld [wOAMAnimation04 + $1a], a
	ld a, $48
	ld [wOAMAnimation05 + $1a], a
	xor a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld [wOAMAnimation05_PriorityFlags], a
	ld a, SFX_27
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6cf3f: ; 6cf3f (1b:4f3f)
	jp Func_6ce1e

Func_6cf42: ; 6cf42 (1b:4f42)
	ld a, $1f
	ld [wca60], a
	ld a, $2
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld [wd45c], a
	ld a, SFX_24
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6cf5f: ; 6cf5f (1b:4f5f)
	call Func_6d0a7
	call Func_6d058
	callba Func_cc000
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6cf88
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $1c
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $7
	ld [hl], a
	jr .asm_6cf9a

.asm_6cf88
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $7
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
.asm_6cf9a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1
	jr nz, .asm_6cfc4
	ld c, $0
	callba Func_cc565
	ld hl, wOAMAnimation01
	ld bc, $500
	call Func_2b01
	ld c, $1
	callba Func_cc565
	jr .asm_6d028

.asm_6cfc4
	cp $10
	jr nz, .asm_6cff6
	ld hl, wOAMAnimation01
	ld bc, $fe00
	call Func_2af4
	ld bc, $fe80
	call Func_2b01
	ld c, $0
	callba Func_cc565
	ld hl, wOAMAnimation01
	ld bc, $880
	call Func_2b01
	ld c, $1
	callba Func_cc565
	jr .asm_6d028

.asm_6cff6
	cp $20
	jr nz, .asm_6d028
	ld hl, wOAMAnimations
	ld bc, $fc00
	call Func_2af4
	ld bc, $fd00
	call Func_2b01
	ld c, $0
	callba Func_cc565
	ld hl, wOAMAnimation01
	ld bc, $c00
	call Func_2b01
	ld c, $1
	callba Func_cc565
	jr .asm_6d028

.asm_6d028
	ld a, [wd45c]
	or a
	jr nz, .asm_6d04a
	ld a, [wcac2]
	add $3
	cp $1f
	jr nc, .asm_6d045
	ld a, $20
	ld [wcac2], a
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	jr .asm_6d04a

.asm_6d045
	ld [wcac2], a
	jr .asm_6d04a

.asm_6d04a
	ld a, [wca60]
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_6d052: ; 6d052 (1b:5052)
	jp NextMoveAnimationSubroutine

Func_6d055: ; 6d055 (1b:5055)
	jp NextMoveAnimationSubroutine

Func_6d058: ; 6d058 (1b:5058)
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld d, a
	sla d
	call Sine8_
	ld e, a
	ld a, [wca60]
	ld c, a
	cp $1
	jr nz, .asm_6d070
	ld c, $0
.asm_6d070
	call Multiply_C_by_E_signed
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d099
	ld a, d
	ld [wd45d], a
	ld a, $58
	add d
	ld [wWX], a
	call Func_6f1d2
.asm_6d089
	ld a, [wd45b]
	and $3
	ret nz
	ld a, [wca60]
	or a
	ret z
	dec a
	ld [wca60], a
	ret

.asm_6d099
	ld a, d
	cpl
	inc a
	ld [wd45d], a
	ld a, $0
	add d
	ld [wSCX], a
	jr .asm_6d089

Func_6d0a7: ; 6d0a7 (1b:50a7)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef4d
	callba Func_cef5c
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wcac2]
	or a
	jr z, .asm_6d0cd
	sub $1
	jr nc, .asm_6d0c9
	xor a
.asm_6d0c9
	ld [wcac2], a
	ret

.asm_6d0cd
	ld a, $ff
	ld [wcac2], a
	ret

GlareAnimation: ; 6d0d3 (1b:50d3)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6d0e7
	dw Func_6d147
	dw Func_6d17c
	dw Func_6d230
	dw Func_6d265

Func_6d0e7: ; 6d0e7 (1b:50e7)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d102
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $d
	ld [hl], a
	jr .asm_6d114

.asm_6d102
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $8
	ld [hl], a
.asm_6d114
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wca60], a
	callba Func_cc63d
	ld hl, wOAMBufferEnd
	ld bc, $300
	call Func_2af4
	ld a, SFX_4F
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d147: ; 6d147 (1b:5147)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld c, $33
	cp $28
	jr z, .asm_6d173
	ld c, $32
	cp $32
	jr z, .asm_6d173
	ld c, $31
	cp $3c
	jr z, .asm_6d173
	cp $3c
	ret c
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

.asm_6d173
	callba Func_cc2eb
	ret

Func_6d17c: ; 6d17c (1b:517c)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d1a9
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $17
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $a
	ld [hl], a
	jr .asm_6d1bb

.asm_6d1a9
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $2
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $12
	ld [hl], a
.asm_6d1bb
	ld c, $34
	callba Func_cc3aa
	ld hl, wOAMAnimation01
	ld bc, $e00
	call Func_2b01
	ld c, $35
	callba Func_cc3aa
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d1f3
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $9
	ld [hl], a
	jr .asm_6d205

.asm_6d1f3
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $11
	ld [hl], a
.asm_6d205
	ld c, $0
	callba Func_cc780
	ld c, $40
	callba Func_cc780
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $20
	ld [wca60], a
	ld a, $1e
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d230: ; 6d230 (1b:5230)
	call Func_6d2a7
	call Func_6d2cd
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $34
	ret c
	ld a, SFX_24
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld [wd45c], a
	ld a, $1f
	ld [wca60], a
	ld a, $2
	ld [wcac2], a
	jp NextMoveAnimationSubroutine

Func_6d265: ; 6d265 (1b:5265)
	call Func_6d0a7
	call Func_6d058
	callba Func_cc000
	ld a, [wd45c]
	or a
	jr nz, .asm_6d295
	ld a, [wcac2]
	add $2
	cp $1f
	jr nc, .asm_6d290
	ld a, $20
	ld [wcac2], a
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	jr .asm_6d295

.asm_6d290
	ld [wcac2], a
	jr .asm_6d295

.asm_6d295
	ld a, [wca60]
	or a
	ret nz
	call Func_6d0a7
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6d2a7: ; 6d2a7 (1b:52a7)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef50
	callba Func_cef5c
	ld a, [wcac2]
	or a
	jr z, .asm_6d2c7
	sub $1
	jr nc, .asm_6d2c3
	xor a
.asm_6d2c3
	ld [wcac2], a
	ret

.asm_6d2c7
	ld a, $ff
	ld [wcac2], a
	ret

Func_6d2cd: ; 6d2cd (1b:52cd)
	ld a, [wVBlankCounter]
	ld d, a
	sla d
	sla d
	sla d
	sla d
	call Sine8_
	ld e, a
	ld a, [wca60]
	ld c, a
	or a
	jr nz, .asm_6d2e6
	ld c, $0
.asm_6d2e6
	call Multiply_C_by_E_signed
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d305
	ld a, $58
	add d
	ld [wWX], a
	call Func_6f1d2
.asm_6d2fb
	ld a, [wca60]
	or a
	ret z
	dec a
	ld [wca60], a
	ret

.asm_6d305
	ld a, $0
	add d
	ld [wSCX], a
	jr .asm_6d2fb

SleepGasAnimation: ; 6d30d (1b:530d)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6d323
	dw Func_6d36d
	dw Func_6d39c
	dw Func_6d3f5
	dw Func_6d423
	dw Func_6b761 ; wrong bank

Func_6d323: ; 6d323 (1b:5323)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d33e
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6d350

.asm_6d33e
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6d350
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d36d: ; 6d36d (1b:536d)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $64
	jr nc, .asm_6d394
	and $3
	ret nz
	call OverworldRandom8_
	and $1
	add $3b
	ld c, a
	callba Func_cc8b0
	ret

.asm_6d394
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d39c: ; 6d39c (1b:539c)
	call Func_6d42d
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d3cc
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6d3de

.asm_6d3cc
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6d3de
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d3f5: ; 6d3f5 (1b:53f5)
	call Func_6d42d
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $1e
	jr nc, .asm_6d416
	and $3
	jr nz, .asm_6d416
	callba Func_cc9a0
.asm_6d416
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6d423: ; 6d423 (1b:5423)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6d42d: ; 6d42d (1b:542d)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef53
	callba Func_cef5c
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6d45c
	sub $1
	jr nc, .asm_6d458
	xor a
.asm_6d458
	ld [wcac2], a
	ret

.asm_6d45c
	ld a, $ff
	ld [wcac2], a
	ret

SmokescreenAnimation: ; 6d462 (1b:5462)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6d476
	dw Func_6d4c8
	dw Func_6d4e4
	dw Func_6d53d
	dw Func_6d56b

Func_6d476: ; 6d476 (1b:5476)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d491
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6d4a3

.asm_6d491
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6d4a3
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	callba Func_ccb0d
	ld a, SFX_4D
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d4c8: ; 6d4c8 (1b:54c8)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $64
	jr nc, .asm_6d4dc
	ret

.asm_6d4dc
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d4e4: ; 6d4e4 (1b:54e4)
	call Func_6d575
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d514
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6d526

.asm_6d514
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6d526
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d53d: ; 6d53d (1b:553d)
	call Func_6d575
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $28
	jr nc, .asm_6d55e
	and $1
	jr nz, .asm_6d55e
	callba Func_cc9a0
.asm_6d55e
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6d56b: ; 6d56b (1b:556b)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6d575: ; 6d575 (1b:5575)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef56
	callba Func_cef5c
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6d5a4
	sub $1
	jr nc, .asm_6d5a0
	xor a
.asm_6d5a0
	ld [wcac2], a
	ret

.asm_6d5a4
	ld a, $ff
	ld [wcac2], a
	ret

PoisonGasAnimation: ; 6d5aa (1b:55aa)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6d5c0
	dw Func_6d60a
	dw Func_6d639
	dw Func_6d692
	dw Func_6d6c0
	dw Func_6f229

Func_6d5c0: ; 6d5c0 (1b:55c0)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d5db
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6d5ed

.asm_6d5db
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6d5ed
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d60a: ; 6d60a (1b:560a)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $64
	jr nc, .asm_6d631
	and $3
	ret nz
	call OverworldRandom8_
	and $1
	add $3b
	ld c, a
	callba Func_cc8b0
	ret

.asm_6d631
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d639: ; 6d639 (1b:5639)
	call Func_6d6ca
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d669
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6d67b

.asm_6d669
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6d67b
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d692: ; 6d692 (1b:5692)
	call Func_6d6ca
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $32
	jr nc, .asm_6d6b3
	and $1
	jr nz, .asm_6d6b3
	callba Func_cc9a0
.asm_6d6b3
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6d6c0: ; 6d6c0 (1b:56c0)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6d6ca: ; 6d6ca (1b:56ca)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef41
	callba Func_cef5c
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6d6f9
	sub $1
	jr nc, .asm_6d6f5
	xor a
.asm_6d6f5
	ld [wcac2], a
	ret

.asm_6d6f9
	ld a, $ff
	ld [wcac2], a
	ret

FlightAnimation: ; 6d6ff (1b:56ff)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6d713
	dw Func_6d772
	dw Func_6d799
	dw Func_6d7bd
	dw Func_6d83c

Func_6d713: ; 6d713 (1b:5713)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d72e
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
	jr .asm_6d740

.asm_6d72e
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
.asm_6d740
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, SFX_35
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d772: ; 6d772 (1b:5772)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	jr nc, .asm_6d791
	and $3
	ret nz
	callba Func_ccc95
	ret

.asm_6d791
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d799: ; 6d799 (1b:5799)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, $0
	ld [wOAMAnimation01 + $1a], a
	ld a, $0
	ld [wca60], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6d7bd: ; 6d7bd (1b:57bd)
	call Func_6d846
	callba Func_cc000
	ld a, [wOAMAnimation01 + $1a]
	cp $2
	jr nz, .asm_6d826
	ld a, [wMoveAnimationTimer]
	and $3
	jr nz, .asm_6d826
	ld a, [wOAMAnimation01 + $9]
	ld b, a
	ld a, [wOAMAnimation01_Duration]
	ld c, a
	ld a, [wOAMAnimation01 + $d]
	ld d, a
	ld a, [wOAMAnimation01 + $c]
	ld e, a
	push bc
	push de
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6d7fa
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	jr .asm_6d803

.asm_6d7fa
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
.asm_6d803
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $15
	ld [hl], a
	callba Func_ccde5
	pop de
	pop bc
	ld a, b
	ld [wOAMAnimation01 + $9], a
	ld a, c
	ld [wOAMAnimation01_Duration], a
	ld a, d
	ld [wOAMAnimation01 + $d], a
	ld a, e
	ld [wOAMAnimation01 + $c], a
.asm_6d826
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld a, [wOAMAnimation01 + $1a]
	cp $5
	ret c
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6d83c: ; 6d83c (1b:583c)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6d846: ; 6d846 (1b:5846)
	ld hl, wOAMAnimation01
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	add a
	ld hl, Pointers_6d866
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_6d866:
	dw Func_6d872
	dw Func_6d8e6
	dw Func_6d94e
	dw Func_6d9e8
	dw Func_6da8a
	dw Func_6dad3

Func_6d872: ; 6d872 (1b:5872)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d8c8
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $1b
	ld [wPrevROMBank], a
	ld bc, $c9
	ld a, $0
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
	ret

.asm_6d8c8
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fa
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	callba Func_cc095
	ret

Func_6d8e6: ; 6d8e6 (1b:58e6)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld bc, $2
	cp $f5
	jr c, .asm_6d8fb
	ld bc, hFFFE
.asm_6d8fb
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ae7
	call ApplyYStepVector_
	callba Func_cc095
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, $18
	add d
	ld [wWY], a
	call Func_6f1f0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wWY]
	cp $18
	jr c, .asm_6d94d
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $1b
	ld [wPrevROMBank], a
	ld bc, $c9
	ld a, $0
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
.asm_6d94d
	ret

Func_6d94e: ; 6d94e (1b:594e)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	add a
	add a
	ld d, a
	call Sine8_
	sra d
	sra d
	sra d
	sra d
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6d991
	ld a, $0
	add d
	cpl
	inc a
	ld [wSCY], a
	ld a, d
	ld [wca60], a
	ld a, [wSCY]
	ld b, a
	inc b
	ld a, $5f
	sub b
	cp $5f
	jr c, .asm_6d98c
	ld a, $5f
.asm_6d98c
	ld [wc460], a
	jr .asm_6d99e

.asm_6d991
	ld a, $18
	add d
	ld [wWY], a
	ld a, d
	ld [wca60], a
	call Func_6f1f0
.asm_6d99e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	and $1f
	cp $8
	ret nz
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret nz
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wca60]
	ld [hl], a
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, SFX_4D
	ld [H_SFX_ID], a
	ret

Func_6d9e8: ; 6d9e8 (1b:59e8)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, hFFF8
	call Func_2ae7
	call ApplyYStepVector_
	callba Func_cc095
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_6da31
	cpl
	add $8
	and $f8
	ld c, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp c
	jr z, .asm_6da31
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, c
	ld [hl], a
	srl c
	srl c
	srl c
	call Func_6db0d
.asm_6da31
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add b
	ld d, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6da5b
	ld a, $0
	add d
	cpl
	inc a
	ld [wSCY], a
	ld a, d
	ld [wca60], a
	jr .asm_6da68

.asm_6da5b
	ld a, $18
	add d
	ld [wWY], a
	ld a, d
	ld [wca60], a
	call Func_6f1f0
.asm_6da68
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $38
	jr c, .asm_6da89
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_6da89
	ret

Func_6da8a: ; 6da8a (1b:5a8a)
	ld a, $20
	ld [wcac2], a
	call Func_6dad7
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	ret c
	check_cgb
	jr z, .asm_6daae
	ld a, $ff
	ld [wcac2], a
.asm_6daae
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld c, $0
	call Func_6db0d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6daca
	ld a, $0
	ld [wSCY], a
	jr .asm_6dad2

.asm_6daca
	ld a, $0
	ld [wWY], a
	call Func_6f1f0
.asm_6dad2
	ret

Func_6dad3: ; 6dad3 (1b:5ad3)
	call Func_6dad7
	ret

Func_6dad7: ; 6dad7 (1b:5ad7)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef38
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	callba Func_cef5c
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, [wcac2]
	or a
	jr z, .asm_6db07
	sub $1
	jr nc, .asm_6db03
	xor a
.asm_6db03
	ld [wcac2], a
	ret

.asm_6db07
	ld a, $ff
	ld [wcac2], a
	ret

Func_6db0d: ; 6db0d (1b:5b0d)
	inc c
	ld a, c
	ld [wc9d9], a
	ret

Func_6db13: ; 6db13 (1b:5b13)
	ld a, $0
	ld [wc9d9], a
	dec c
	hlbgcoord 1, 1, VWindow
	ld de, Data_6dba7
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6db2c
	hlbgcoord 1, 5
	ld de, Data_6db6f
.asm_6db2c
	ld a, c
	swap a
	srl a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $7
	sub c
	jr z, .asm_6db65
	ld b, a
.asm_6db3d
	push hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	pop hl
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_6db3d
	ld a, c
	or a
	ret z
.asm_6db65
	xor a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hl], a
	ret

Data_6db6f:
	db $bf, $be, $bd, $bc, $bb, $ba, $b9, $b8
	db $c7, $c6, $c5, $c4, $c3, $c2, $c1, $c0
	db $cf, $ce, $cd, $cc, $cb, $ca, $c9, $c8
	db $d7, $d6, $d5, $d4, $d3, $d2, $d1, $d0
	db $df, $de, $dd, $dc, $db, $da, $d9, $d8
	db $e7, $e6, $e5, $e4, $e3, $e2, $e1, $e0
	db $ef, $ee, $ed, $ec, $eb, $ea, $e9, $e8

Data_6dba7:
	db $80, $81, $82, $83, $84, $85, $86, $87
	db $88, $89, $8a, $8b, $8c, $8d, $8e, $8f
	db $90, $91, $92, $93, $94, $95, $96, $97
	db $98, $99, $9a, $9b, $9c, $9d, $9e, $9f
	db $a0, $a1, $a2, $a3, $a4, $a5, $a6, $a7
	db $a8, $a9, $aa, $ab, $ac, $ad, $ae, $af
	db $b0, $b1, $b2, $b3, $b4, $b5, $b6, $b7

Func_6dbdf:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6dbf5
	dw Func_6dc21
	dw Func_6dc24
	dw Func_6dc35
	dw Func_6dc6b
	dw Func_6dc6e

Func_6dbf5: ; 6dbf5 (1b:5bf5)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6dc08
	ld a, $30
	ld b, $36
	ld c, $44
	jr .asm_6dc0e

.asm_6dc08
	ld a, $60
	ld b, $68
	ld c, $30
.asm_6dc0e
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $10
	call Func_3cb5
	jp NextMoveAnimationSubroutine

Func_6dc21: ; 6dc21 (1b:5c21)
	jp Func_3cd0

Func_6dc24: ; 6dc24 (1b:5c24)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $5
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6dc35: ; 6dc35 (1b:5c35)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6dc4d
	ld a, $30
	ld b, $68
	ld c, $30
	jr .asm_6dc53

.asm_6dc4d
	ld a, $60
	ld b, $38
	ld c, $42
.asm_6dc53
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $11
	call Func_3cb5
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6dc6b: ; 6dc6b (1b:5c6b)
	jp Func_3cd0

Func_6dc6e: ; 6dc6e (1b:5c6e)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld a, $17
	ld [wd401], a
	ret

ScreamAnimation: ; 6dc84 (1b:5c84)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6dc9a
	dw Func_6dd06
	dw Func_6dd21
	dw Func_6dd38
	dw Func_6dd3b
	dw Func_6dd3e

Func_6dc9a: ; 6dc9a (1b:5c9a)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6dcb5
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $c
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $11
	ld [hl], a
	jr .asm_6dcc7

.asm_6dcb5
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6dcc7
	ld c, $0
	callba Func_ccffa
	ld bc, $400
	ld hl, wOAMAnimation01
	call Func_2af4
	ld c, $1
	callba Func_ccffa
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wca60], a
	ld a, $ff
	ld [wcac2], a
	jp NextMoveAnimationSubroutine

Func_6dd06: ; 6dd06 (1b:5d06)
	call Func_6d0a7
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $78
	ret c
	jp NextMoveAnimationSubroutine

Func_6dd21: ; 6dd21 (1b:5d21)
	call Func_6d0a7
	call Func_6d058
	callba Func_cc000
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6dd38: ; 6dd38 (1b:5d38)
	jp NextMoveAnimationSubroutine

Func_6dd3b: ; 6dd3b (1b:5d3b)
	jp NextMoveAnimationSubroutine

Func_6dd3e: ; 6dd3e (1b:5d3e)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld a, $17
	ld [wd401], a
	ret

WingbeatAnimation: ; 6dd4b (1b:5d4b)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6dd5f
	dw Func_6dd91
	dw Func_6dd94
	dw Func_6ddb0
	dw Func_6de46

Func_6dd5f: ; 6dd5f (1b:5d5f)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wd45b], a
	jp NextMoveAnimationSubroutine

Func_6dd91: ; 6dd91 (1b:5d91)
	jp NextMoveAnimationSubroutine

Func_6dd94: ; 6dd94 (1b:5d94)
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, $0
	ld [wOAMAnimation01 + $1a], a
	ld a, $0
	ld [wd45b], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ddb0: ; 6ddb0 (1b:5db0)
	call Func_6ca51
	call Func_6de60
	callba Func_cc000
	ld a, [wOAMAnimation01 + $1a]
	cp $2
	jr nz, .asm_6de2b
	ld a, [wMoveAnimationTimer]
	and $3
	jr nz, .asm_6de2b
	ld a, [wOAMAnimation01 + $9]
	ld b, a
	ld a, [wOAMAnimation01_Duration]
	ld c, a
	ld a, [wOAMAnimation01 + $d]
	ld d, a
	ld a, [wOAMAnimation01 + $c]
	ld e, a
	push bc
	push de
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6ddf0
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	jr .asm_6ddf9

.asm_6ddf0
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
.asm_6ddf9
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $15
	ld [hl], a
	callba Func_ccdea
	ld a, [wMoveAnimationTimer]
	and $c
	jr nz, .asm_6de19
	callba Func_cd12a
.asm_6de19
	pop de
	pop bc
	ld a, b
	ld [wOAMAnimation01 + $9], a
	ld a, c
	ld [wOAMAnimation01_Duration], a
	ld a, d
	ld [wOAMAnimation01 + $d], a
	ld a, e
	ld [wOAMAnimation01 + $c], a
.asm_6de2b
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld a, [wOAMAnimation01 + $1a]
	cp $5
	ret c
	ld a, [wcac2]
	cp $ff
	ret nz
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6de46: ; 6de46 (1b:5e46)
	call Func_6ca51
	call Func_6de60
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6de60: ; 6de60 (1b:5e60)
	ld hl, wOAMAnimation01
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	add a
	ld hl, Pointers_6de80
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

Pointers_6de80:
	dw Func_6de8c
	dw Func_6df00
	dw Func_6df68
	dw Func_6e002
	dw Func_6e0a4
	dw Func_6e0ed

Func_6de8c: ; 6de8c (1b:5e8c)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6dee2
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $1b
	ld [wPrevROMBank], a
	ld bc, $c9
	ld a, $0
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
	ret

.asm_6dee2
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fa
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	callba Func_cc095
	ret

Func_6df00: ; 6df00 (1b:5f00)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld bc, $2
	cp $f5
	jr c, .asm_6df15
	ld bc, hFFFE
.asm_6df15
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ae7
	call ApplyYStepVector_
	callba Func_cc095
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, $18
	add d
	ld [wWY], a
	call Func_6f1f0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wWY]
	cp $18
	jr c, .asm_6df67
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $1b
	ld [wPrevROMBank], a
	ld bc, $c9
	ld a, $0
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, SFX_2D
	ld [H_SFX_ID], a
.asm_6df67
	ret

Func_6df68: ; 6df68 (1b:5f68)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	add a
	add a
	ld d, a
	call Sine8_
	sra d
	sra d
	sra d
	sra d
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6dfab
	ld a, $0
	add d
	cpl
	inc a
	ld [wSCY], a
	ld a, d
	ld [wd45b], a
	ld a, [wSCY]
	ld b, a
	inc b
	ld a, $5f
	sub b
	cp $5f
	jr c, .asm_6dfa6
	ld a, $5f
.asm_6dfa6
	ld [wc460], a
	jr .asm_6dfb8

.asm_6dfab
	ld a, $18
	add d
	ld [wWY], a
	ld a, d
	ld [wd45b], a
	call Func_6f1f0
.asm_6dfb8
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	and $1f
	cp $8
	ret nz
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret nz
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wd45b]
	ld [hl], a
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, SFX_4D
	ld [H_SFX_ID], a
	ret

Func_6e002: ; 6e002 (1b:6002)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, hFFF8
	call Func_2ae7
	call ApplyYStepVector_
	callba Func_cc095
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_6e04b
	cpl
	add $8
	and $f8
	ld c, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp c
	jr z, .asm_6e04b
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, c
	ld [hl], a
	srl c
	srl c
	srl c
	call Func_6db0d
.asm_6e04b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add b
	ld d, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e075
	ld a, $0
	add d
	cpl
	inc a
	ld [wSCY], a
	ld a, d
	ld [wd45b], a
	jr .asm_6e082

.asm_6e075
	ld a, $18
	add d
	ld [wWY], a
	ld a, d
	ld [wd45b], a
	call Func_6f1f0
.asm_6e082
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $38
	jr c, .asm_6e0a3
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_6e0a3
	ret

Func_6e0a4: ; 6e0a4 (1b:60a4)
	ld a, $20
	ld [wcac2], a
	call Func_6dad7
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	ret c
	check_cgb
	jr z, .asm_6e0c8
	ld a, $ff
	ld [wcac2], a
.asm_6e0c8
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld c, $0
	call Func_6db0d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e0e4
	ld a, $0
	ld [wSCY], a
	jr .asm_6e0ec

.asm_6e0e4
	ld a, $0
	ld [wWY], a
	call Func_6f1f0
.asm_6e0ec
	ret

Func_6e0ed: ; 6e0ed (1b:60ed)
	call Func_6dad7
	ret

EmBarrierAnimation: ; 6e0f1 (1b:60f1)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e107
	dw Func_6e166
	dw Func_6e19e
	dw Func_6e2a1
	dw Func_6e2b5
	dw Func_6f229

Func_6e107: ; 6e107 (1b:6107)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e122
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6e134

.asm_6e122
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6e134
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, SFX_30
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wd45b], a
	jp NextMoveAnimationSubroutine

Func_6e166: ; 6e166 (1b:6166)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $50
	jr nc, .asm_6e196
	and $f
	ret nz
	ld a, [wd45b]
	ld c, a
	inc a
	ld [wd45b], a
	callba Func_cd2ce
	ld hl, wOAMAnimation01
	ld bc, $200
	call Func_2af4
	ret

.asm_6e196
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e19e: ; 6e19e (1b:619e)
	call Func_6e2bf
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6e223
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $15
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	ld c, $6a
	callba Func_cc4a1
	ld hl, wOAMAnimation01
	ld bc, $a00
	call Func_2b01
	ld bc, $3c0
	call Func_2af4
	ld c, $69
	callba Func_cc4a1
	ld hl, wOAMBufferEnd
	ld bc, $0
	call Func_2b01
	ld bc, $a00
	call Func_2af4
	ld c, $67
	callba Func_cc4a1
	ld hl, wOAMAnimation01
	ld bc, $f600
	call Func_2b01
	ld bc, $fc80
	call Func_2af4
	ld c, $68
	callba Func_cc4a1
	jr .asm_6e28a

.asm_6e223
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $9
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $d
	ld [hl], a
	ld c, $6a
	callba Func_cc4a1
	ld hl, wOAMAnimation01
	ld bc, $a00
	call Func_2b01
	ld bc, $fc80
	call Func_2af4
	ld c, $69
	callba Func_cc4a1
	ld hl, wOAMAnimations
	ld bc, $0
	call Func_2b01
	ld bc, $a00
	call Func_2af4
	ld c, $67
	callba Func_cc4a1
	ld hl, wOAMAnimation01
	ld bc, $f600
	call Func_2b01
	ld bc, $380
	call Func_2af4
	ld c, $68
	callba Func_cc4a1
.asm_6e28a
	ld a, SFX_39
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e2a1: ; 6e2a1 (1b:62a1)
	call Func_6e2bf
	callba Func_cc000
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6e2b5: ; 6e2b5 (1b:62b5)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6e2bf: ; 6e2bf (1b:62bf)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef41
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	callba Func_cef5c
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6e2fe
	sub $1
	jr nc, .asm_6e2fa
	xor a
.asm_6e2fa
	ld [wcac2], a
	ret

.asm_6e2fe
	ld a, $ff
	ld [wcac2], a
	ret

ForceFieldAnimation: ; 6e304 (1b:6304)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e318
	dw Func_6e37e
	dw Func_6e40d
	dw Func_6e439
	dw Func_6e44d

Func_6e318: ; 6e318 (1b:6318)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e333
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $c
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $11
	ld [hl], a
	jr .asm_6e345

.asm_6e333
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6e345
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, [wBattleTurn]
	xor $1
	ld [wBattleTurn], a
	callba Func_cd491
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld [wd45c], a
	ld [wd45d], a
	jp NextMoveAnimationSubroutine

Func_6e37e: ; 6e37e (1b:637e)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $96
	jr nc, .asm_6e405
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $17
	ret c
	ld a, $0
	ld [wd45b], a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e3bb
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6e3cd

.asm_6e3bb
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $8
	ld [hl], a
.asm_6e3cd
	ld hl, wOAMBufferEnd
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2b01
	call OverworldRandom16_
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2af4
	callba Func_cd3b7
	ret

.asm_6e405
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e40d: ; 6e40d (1b:640d)
	call Func_6e2bf
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $32
	ret c
	ld a, SFX_30
	ld [H_SFX_ID], a
	ld a, $ff
	ld [wd45d], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e439: ; 6e439 (1b:6439)
	call Func_6e2bf
	callba Func_cc000
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6e44d: ; 6e44d (1b:644d)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

ChillAnimation: ; 6e457 (1b:6457)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e46b
	dw Func_6e4b0
	dw Func_6e4e9
	dw Func_6e542
	dw Func_6e570

Func_6e46b: ; 6e46b (1b:646b)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e486
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6e498

.asm_6e486
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6e498
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e4b0: ; 6e4b0 (1b:64b0)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $64
	jr nc, .asm_6e4e1
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $c
	ret c
	xor a
	ld [wd45b], a
	ld c, $77
	callba Func_cd5ca
	ld a, SFX_56
	ld [H_SFX_ID], a
	ret

.asm_6e4e1
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e4e9: ; 6e4e9 (1b:64e9)
	call Func_6e57a
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e519
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6e52b

.asm_6e519
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6e52b
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e542: ; 6e542 (1b:6542)
	call Func_6e57a
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $1e
	jr nc, .asm_6e563
	and $3
	jr nz, .asm_6e563
	callba Func_cc9a0
.asm_6e563
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6e570: ; 6e570 (1b:6570)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6e57a: ; 6e57a (1b:657a)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef59
	callba Func_cef5c
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6e5a9
	sub $1
	jr nc, .asm_6e5a5
	xor a
.asm_6e5a5
	ld [wcac2], a
	ret

.asm_6e5a9
	ld a, $ff
	ld [wcac2], a
	ret

HeatWaveAnimation: ; 6e5af (1b:65af)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e5c3
	dw Func_6e608
	dw Func_6e661
	dw Func_6e6ba
	dw Func_6e6f4

Func_6e5c3: ; 6e5c3 (1b:65c3)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e5de
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6e5f0

.asm_6e5de
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $b
	ld [hl], a
.asm_6e5f0
	call Func_6f382
	callba Func_ce606
	ld a, $0
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e608: ; 6e608 (1b:6608)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $64
	jr nc, .asm_6e659
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $c
	ret c
	xor a
	ld [wd45b], a
	call OverworldRandom8_
	ld a, d
	and $3
	add $7b
	ld c, a
	callba Func_cd5ca
	ld a, SFX_44
	ld [H_SFX_ID], a
	ld a, [wcac2]
	inc a
	ld [wcac2], a
	ld a, [wcac2]
	inc a
	ld [wcac2], a
	ld de, Data_cef3b
	callba Func_cef5c
	ret

.asm_6e659
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e661: ; 6e661 (1b:6661)
	call Func_6e6fe
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e691
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6e6a3

.asm_6e691
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6e6a3
	ld a, SFX_43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e6ba: ; 6e6ba (1b:66ba)
	call Func_6e6fe
	call Func_6d058
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $2
	jr nc, .asm_6e6e7
	callba Func_cd6bc
	callba Func_cd6bc
	callba Func_cd6bc
.asm_6e6e7
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6e6f4: ; 6e6f4 (1b:66f4)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6e6fe: ; 6e6fe (1b:66fe)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef3b
	callba Func_cef5c
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	cp $4
	ret c
	ld a, $0
	ld [wd45c], a
	ld a, [wcac2]
	or a
	jr z, .asm_6e72d
	sub $1
	jr nc, .asm_6e729
	xor a
.asm_6e729
	ld [wcac2], a
	ret

.asm_6e72d
	ld a, $ff
	ld [wcac2], a
	ret

WaterShotAnimation: ; 6e733 (1b:6733)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e749
	dw Func_6e791
	dw Func_6e7d2
	dw Func_6e82b
	dw Func_6e849
	dw Func_6b761 ; wrong bank

Func_6e749: ; 6e749 (1b:6749)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e764
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $11
	ld [hl], a
	jr .asm_6e776

.asm_6e764
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $9
	ld [hl], a
.asm_6e776
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	jp NextMoveAnimationSubroutine

Func_6e791: ; 6e791 (1b:6791)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $40
	jr nc, .asm_6e7ca
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $4
	ret c
	ld a, $0
	ld [wd45b], a
	ld a, [wMoveAnimationTimer]
	ld c, $40
	cpl
	inc a
	add c
	ld c, a
	callba Func_ce043
	ld a, SFX_72
	ld [H_SFX_ID], a
	ret

.asm_6e7ca
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e7d2: ; 6e7d2 (1b:67d2)
	call Func_6e57a
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e802
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
	jr .asm_6e814

.asm_6e802
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $14
	ld [hl], a
.asm_6e814
	ld a, SFX_60
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e82b: ; 6e82b (1b:682b)
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	call Func_6e57a
	call Func_6ca51
	callba Func_cc000
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6e849: ; 6e849 (1b:6849)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

AcidAnimation: ; 6e853 (1b:6853)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e869
	dw Func_6e8b1
	dw Func_6e8fb
	dw Func_6e922
	dw Func_6e940
	dw Func_6b761 ; wrong bank

Func_6e869: ; 6e869 (1b:6869)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e884
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $e
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $11
	ld [hl], a
	jr .asm_6e896

.asm_6e884
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1c
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $8
	ld [hl], a
.asm_6e896
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	jp NextMoveAnimationSubroutine

Func_6e8b1: ; 6e8b1 (1b:68b1)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $50
	jr nc, .asm_6e8f3
	cp $3
	jr z, .asm_6e8de
	cp $20
	jr z, .asm_6e8de
	cp $40
	ret nz
	ld a, SFX_56
	ld [H_SFX_ID], a
	callba Func_ce216
	jr .asm_6e8e3

.asm_6e8de
	ld a, SFX_59
	ld [H_SFX_ID], a
.asm_6e8e3
	ld a, $5
.asm_6e8e5
	push af
	callba Func_ce11a
	pop af
	dec a
	jr nz, .asm_6e8e5
	ret

.asm_6e8f3
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e8fb: ; 6e8fb (1b:68fb)
	call Func_6d6ca
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6e922: ; 6e922 (1b:6922)
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	call Func_6d6ca
	call Func_6ca51
	callba Func_cc000
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6e940: ; 6e940 (1b:6940)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

LickAnimation: ; 6e94a (1b:694a)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6e95e
	dw Func_6e9cb
	dw Func_6ebdc
	dw Func_6ebe8
	dw Func_6b761 ; wrong bank

Func_6e95e: ; 6e95e (1b:695e)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6e96c
	ld a, $54
	ld [wMoveAnimationTimer], a
	jr .asm_6e971

.asm_6e96c
	ld a, $54
	ld [wMoveAnimationTimer], a
.asm_6e971
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, BANK(GFX_e3674)
	ld hl, VTilesOB tile $10
	ld de, GFX_e3674
	ld bc, $11 tiles
	call FarCopy2bpp_2
	ld a, SFX_73
	ld [H_SFX_ID], a
	ld a, $0
	ld [wd45b], a
	ld [wd45c], a
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $14
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	callba Func_ce2ea
	ld a, BANK(LickAnimation)
	ld [wPrevROMBank], a
	ld bc, $db
	ld a, $1
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	jp NextMoveAnimationSubroutine

Func_6e9cb: ; 6e9cb (1b:69cb)
	call Func_6ebf2
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	call Func_6eae7
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6ea62
	ld hl, wPlayerDenjuu1Species
	ld a, [wCurBattleDenjuu]
	call Func_6c8ea
	cp NIGELLA
	jr z, .asm_6ea0a
	cp CHAMERAID
	jr z, .asm_6ea15
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6ea1e

.asm_6ea0a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $14
	ld [hl], a
	jr .asm_6ea1e

.asm_6ea15
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $16
	ld [hl], a
.asm_6ea1e
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $c
	ld [hl], a
	ld hl, wOAMAnimation07_TemplateIdx
	ld a, $12
.asm_6ea2c
	push af
	push hl
	ld de, $6
	add hl, de
	ld d, a
	ld b, a
	call Sine8_
	ld b, d
	ld a, [wMoveAnimationTimer]
	add b
	ld d, a
	call Sine8_
	sra a
	sra a
	add b
	add $3c
	ld [wOAMAnimation01 + $14], a
	call Func_6eb94
	pop hl
	ld a, [wOAMAnimation01 + $14]
	srl a
	and $1f
	add $b0
	ld [hl], a
	ld de, $20
	add hl, de
	pop af
	dec a
	jr nz, .asm_6ea2c
	jr .asm_6ead6

.asm_6ea62
	ld hl, wEnemyDenjuu1Species
	ld a, [wCurEnemyDenjuu]
	call Func_6c8ea
	cp NIGELLA
	jr z, .asm_6ea7e
	cp CHAMERAID
	jr z, .asm_6ea89
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $8
	ld [hl], a
	jr .asm_6ea92

.asm_6ea7e
	ld hl, wOAMAnimation01 + $c
	ld a, $40
	ld [hli], a
	ld a, $c
	ld [hl], a
	jr .asm_6ea92

.asm_6ea89
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $e
	ld [hl], a
.asm_6ea92
	ld hl, wOAMAnimation01_Duration
	ld a, $80
	ld [hli], a
	ld a, $1c
	ld [hl], a
	ld hl, wOAMAnimation07_TemplateIdx
	ld a, $12
.asm_6eaa0
	push af
	push hl
	ld de, $6
	add hl, de
	cpl
	ld d, a
	ld b, a
	call Sine8_
	ld b, d
	ld a, [wMoveAnimationTimer]
	cpl
	add b
	ld d, a
	call Sine8_
	sra a
	sra a
	add b
	add $f0
	ld [wOAMAnimation01 + $14], a
	call Func_6eb94
	pop hl
	ld a, [wOAMAnimation01 + $14]
	srl a
	and $1f
	add $b0
	ld [hl], a
	ld de, $20
	add hl, de
	pop af
	dec a
	jr nz, .asm_6eaa0
.asm_6ead6
	ld a, [wd45c]
	cp $3
	ret nz
	call ClearObjectAnimationBuffers
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6eae7: ; 6eae7 (1b:6ae7)
	ld a, [wd45c]
	cp $0
	jr z, .asm_6eaf7
	cp $1
	jr z, .asm_6eb2e
	cp $2
	jr z, .asm_6eb5c
	ret

.asm_6eaf7
	ld a, [wd45b]
	ld hl, wOAMAnimation07
	ld e, a
	ld d, $0
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
	add hl, de
	ld [hl], $3
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $12
	ret nz
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	ld a, $0
	ld [wd45b], a
	ret

.asm_6eb2e
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $6
	jr z, .asm_6eb51
	cp $86
	jr z, .asm_6eb51
	cp $49
	jr z, .asm_6eb51
	cp $92
	ret nz
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	ld a, $0
	ld [wd45b], a
	ret

.asm_6eb51
	ld a, $1f
	ld [wcac2], a
	ld a, SFX_36
	ld [H_SFX_ID], a
	ret

.asm_6eb5c
	ld a, [wd45b]
	ld hl, wOAMAnimation07
	cpl
	add $12
	ld e, a
	ld d, $0
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
	add hl, de
	ld [hl], $2
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $12
	ret nz
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	call ClearObjectAnimationBuffers
	ret

Func_6eb94: ; 6eb94 (1b:6b94)
	ld a, [wOAMAnimation01 + $14]
	ld d, a
	call Cosine16_
	sla e
	rl d
	ld b, h
	ld c, l
	ld a, [wOAMAnimation01 + $9]
	ld h, a
	ld a, [wOAMAnimation01_Duration]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation01 + $9], a
	ld a, l
	ld [wOAMAnimation01_Duration], a
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	inc bc
	inc bc
	inc bc
	ld a, [wOAMAnimation01 + $14]
	ld d, a
	call Sine16_
	sla e
	rl d
	ld a, [wOAMAnimation01 + $d]
	ld h, a
	ld a, [wOAMAnimation01 + $c]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation01 + $d], a
	ld a, l
	ld [wOAMAnimation01 + $c], a
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	ret

Func_6ebdc: ; 6ebdc (1b:6bdc)
	call Func_6ebf2
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6ebe8: ; 6ebe8 (1b:6be8)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6ebf2: ; 6ebf2 (1b:6bf2)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef53
	callba Func_cef5c
	ld a, [wcac2]
	or a
	jr z, .asm_6ec12
	sub $1
	jr nc, .asm_6ec0e
	xor a
.asm_6ec0e
	ld [wcac2], a
	ret

.asm_6ec12
	ld a, $ff
	ld [wcac2], a
	ret

TentacleAnimation: ; 6ec18 (1b:6c18)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6ec2c
	dw Func_6ec8b
	dw Func_6ee4d
	dw Func_6ee59
	dw Func_6b761 ; wrong bank

Func_6ec2c: ; 6ec2c (1b:6c2c)
	call Func_6f382
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, BANK(GFX_e3674)
	ld hl, VTilesOB tile $10
	ld de, GFX_e3674
	ld bc, $11 tiles
	call FarCopy2bpp_2
	ld a, SFX_73
	ld [H_SFX_ID], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wd45b], a
	ld [wd45c], a
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $14
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	callba Func_ce2ee
	ld a, BANK(TentacleAnimation)
	ld [wPrevROMBank], a
	ld bc, $dc
	ld a, $1
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	jp NextMoveAnimationSubroutine

Func_6ec8b: ; 6ec8b (1b:6c8b)
	call Func_6ee89
	call Func_6ee63
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	srl a
	sub $20
	srl a
	and $3f
	ld d, a
	call Sine8_
	sra d
	sra d
	sra d
	sra d
	ld a, d
	or a
	jr nz, .asm_6ecb5
	inc a
.asm_6ecb5
	ld d, a
	ld a, [wMoveAnimationTimer]
	add d
	ld [wMoveAnimationTimer], a
	call Func_6ed6d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6ed12
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $f
	ld [hl], a
	ld hl, wOAMAnimation01_Duration
	ld a, $40
	ld [hli], a
	ld a, $b
	ld [hl], a
	ld hl, wOAMAnimation07_TemplateIdx
	ld a, $10
.asm_6ecde
	push af
	push hl
	ld de, $6
	add hl, de
	ld d, a
	call Sine8_
	ld b, d
	ld a, [wMoveAnimationTimer]
	add b
	ld d, a
	call Sine8_
	sra a
	sra a
	add $e8
	ld [wOAMAnimation01 + $14], a
	call Func_6edfd
	pop hl
	ld a, [wOAMAnimation01 + $14]
	srl a
	and $1f
	add $b0
	ld [hl], a
	ld de, $20
	add hl, de
	pop af
	dec a
	jr nz, .asm_6ecde
	jr .asm_6ed5c

.asm_6ed12
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $7
	ld [hl], a
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1e
	ld [hl], a
	ld hl, wOAMAnimation07_TemplateIdx
	ld a, $10
.asm_6ed29
	push af
	push hl
	ld de, $6
	add hl, de
	ld d, a
	call Sine8_
	ld b, d
	ld a, [wMoveAnimationTimer]
	add b
	cpl
	ld d, a
	call Sine8_
	sra a
	sra a
	add $4e
	ld [wOAMAnimation01 + $14], a
	call Func_6edfd
	pop hl
	ld a, [wOAMAnimation01 + $14]
	srl a
	and $1f
	add $b0
	ld [hl], a
	ld de, $20
	add hl, de
	pop af
	dec a
	jr nz, .asm_6ed29
.asm_6ed5c
	ld a, [wd45c]
	cp $3
	ret nz
	call ClearObjectAnimationBuffers
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ed6d: ; 6ed6d (1b:6d6d)
	ld a, [wd45c]
	cp $0
	jr z, .asm_6ed7d
	cp $1
	jr z, .asm_6eda8
	cp $2
	jr z, .asm_6edd7
	ret

.asm_6ed7d
	ld a, [wd45b]
	srl a
	ld hl, wOAMAnimation07
	swap a
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	ld [hl], $3
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $20
	ret nz
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	ld a, $0
	ld [wd45b], a
	ret

.asm_6eda8
	ld a, [wMoveAnimationTimer]
	cp $d7
	jr z, .asm_6edbf
	cp $10
	ret nc
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	ld a, $0
	ld [wd45b], a
	ret

.asm_6edbf
	ld a, $c
	ld [wca60], a
	ld a, $1f
	ld [wcac2], a
	callba Func_ce3cf
	ld a, SFX_56
	ld [H_SFX_ID], a
	ret

.asm_6edd7
	ld a, [wd45b]
	ld hl, wOAMAnimation07
	xor $f
	swap a
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	ld [hl], $2
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $10
	ret nz
	ld a, [wd45c]
	inc a
	ld [wd45c], a
	ret

Func_6edfd: ; 6edfd (1b:6dfd)
	ld a, [wOAMAnimation01 + $14]
	ld d, a
	call Cosine16_
	sla e
	rl d
	sla e
	rl d
	ld b, h
	ld c, l
	ld a, [wOAMAnimation01 + $9]
	ld h, a
	ld a, [wOAMAnimation01_Duration]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation01 + $9], a
	ld a, l
	ld [wOAMAnimation01_Duration], a
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	inc bc
	inc bc
	inc bc
	ld a, [wOAMAnimation01 + $14]
	ld d, a
	call Sine16_
	sla e
	rl d
	sla e
	rl d
	ld a, [wOAMAnimation01 + $d]
	ld h, a
	ld a, [wOAMAnimation01 + $c]
	ld l, a
	add hl, de
	ld a, h
	ld [wOAMAnimation01 + $d], a
	ld a, l
	ld [wOAMAnimation01 + $c], a
	ld a, l
	ld [bc], a
	inc bc
	ld a, h
	ld [bc], a
	ret

Func_6ee4d: ; 6ee4d (1b:6e4d)
	call Func_6ee63
	ld a, [wcac2]
	cp $ff
	ret nz
	jp NextMoveAnimationSubroutine

Func_6ee59: ; 6ee59 (1b:6e59)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6ee63: ; 6ee63 (1b:6e63)
	ld a, [wcac2]
	cp $ff
	ret z
	ld de, Data_cef3b
	callba Func_cef5c
	ld a, [wcac2]
	or a
	jr z, .asm_6ee83
	sub $1
	jr nc, .asm_6ee7f
	xor a
.asm_6ee7f
	ld [wcac2], a
	ret

.asm_6ee83
	ld a, $ff
	ld [wcac2], a
	ret

Func_6ee89: ; 6ee89 (1b:6e89)
	ld a, [wMoveAnimationTimer]
	cp $8c
	jr nc, .asm_6ee93
	cp $32
	ret nc
.asm_6ee93
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6eeae
	ld a, [wOAMAnimation21_XCoord]
	sub $58
	jr nc, .asm_6eea2
	xor a
.asm_6eea2
	sra a
	sra a
	add $58
	ld [wWX], a
	jp Func_6f1d2

.asm_6eeae
	ld a, [wOAMAnimation21_XCoord]
	sub $40
	jr c, .asm_6eeb6
	xor a
.asm_6eeb6
	sra a
	sra a
	cpl
	inc a
	ld [wSCX], a
	ret

IceBallAnimation: ; 6eec0 (1b:6ec0)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6eed2
	dw Func_6eeea
	dw Func_6ef04
	dw Func_6b761 ; wrong bank

Func_6eed2: ; 6eed2 (1b:6ed2)
	ld a, SFX_56
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	callba Func_ce5de
	jp NextMoveAnimationSubroutine

Func_6eeea: ; 6eeea (1b:6eea)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $46
	ret c
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ef04: ; 6ef04 (1b:6f04)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6ef0e:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6ef24
	dw Func_6ef50
	dw Func_6ef53
	dw Func_6ef64
	dw Func_6ef9a
	dw Func_6ef9d

Func_6ef24: ; 6ef24 (1b:6f24)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6ef37
	ld a, $30
	ld b, $36
	ld c, $44
	jr .asm_6ef3d

.asm_6ef37
	ld a, $60
	ld b, $68
	ld c, $30
.asm_6ef3d
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $10
	call Func_3cb5
	jp NextMoveAnimationSubroutine

Func_6ef50: ; 6ef50 (1b:6f50)
	jp Func_3cd0

Func_6ef53: ; 6ef53 (1b:6f53)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $5
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ef64: ; 6ef64 (1b:6f64)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6ef7c
	ld a, $30
	ld b, $68
	ld c, $30
	jr .asm_6ef82

.asm_6ef7c
	ld a, $60
	ld b, $38
	ld c, $42
.asm_6ef82
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $11
	call Func_3cb5
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ef9a: ; 6ef9a (1b:6f9a)
	jp Func_3cd0

Func_6ef9d: ; 6ef9d (1b:6f9d)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld a, $17
	ld [wd401], a
	ret

Func_6efb3:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6efc9
	dw Func_6eff5
	dw Func_6eff8
	dw Func_6f009
	dw Func_6f03f
	dw Func_6f042

Func_6efc9: ; 6efc9 (1b:6fc9)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6efdc
	ld a, $30
	ld b, $36
	ld c, $44
	jr .asm_6efe2

.asm_6efdc
	ld a, $60
	ld b, $68
	ld c, $30
.asm_6efe2
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $10
	call Func_3cb5
	jp NextMoveAnimationSubroutine

Func_6eff5: ; 6eff5 (1b:6ff5)
	jp Func_3cd0

Func_6eff8: ; 6eff8 (1b:6ff8)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $5
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6f009: ; 6f009 (1b:7009)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6f021
	ld a, $30
	ld b, $68
	ld c, $30
	jr .asm_6f027

.asm_6f021
	ld a, $60
	ld b, $38
	ld c, $42
.asm_6f027
	ld [wd4ee], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, $11
	call Func_3cb5
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6f03f: ; 6f03f (1b:703f)
	jp Func_3cd0

Func_6f042: ; 6f042 (1b:7042)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld a, $17
	ld [wd401], a
	ret

Func_6f058: ; 6f058 (1b:7058)
	push de
	ld [wcb20], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hli], a
	push hl
	ld a, [wBattleTurn]
	ld hl, Pointers_6f09b
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb20]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	add hl, de
	pop de
	ld a, [hli]
	ld [de], a
	inc de
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [hli]
	pop de
	ld [wStartObjectAnimationIDX], a
	jp StartObjectAnimation_

Pointers_6f09b:
	dw Data_6f09f
	dw Data_6f0cf

Data_6f09f:
	db $40, $28, $40, $80
	db $50, $34, $44, $8e
	db $50, $34, $44, $96
	db $40, $28, $40, $7e
	db $40, $28, $40, $84
	db $40, $28, $40, $86
	db $40, $28, $40, $87
	db $50, $78, $30, $a4
	db $50, $60, $10, $9a
	db $50, $90, $10, $9a
	db $50, $60, $38, $9a
	db $50, $90, $38, $9a

Data_6f0cf:
	db $70, $78, $20, $80
	db $80, $68, $30, $8e
	db $80, $68, $30, $96
	db $70, $78, $20, $7e
	db $70, $78, $20, $84
	db $70, $78, $20, $86
	db $70, $78, $20, $87
	db $80, $28, $30, $a4
	db $80, $10, $30, $9a
	db $80, $40, $30, $9a
	db $80, $10, $58, $9a
	db $80, $40, $58, $9a

Func_6f0ff: ; 6f0ff (1b:70ff)
	push de
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	pop de
	ld hl, $6
	add hl, de
	ld a, [hl]
	cp $0
	ret nz
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	jp NextMoveAnimationSubroutine

Func_6f11a:
	push de
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	pop de
	ld hl, $6
	add hl, de
	ld a, [hl]
	cp $0
	ret nz
	ld hl, $0
	add hl, de
	jp Func_6f1c2

Func_6f133: ; 6f133 (1b:7133)
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6f13c: ; 6f13c (1b:713c)
	push de
	ld [wcb20], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wBattleTurn]
	ld hl, Pointers_6f176
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb20]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	add hl, de
	pop de
	ld a, $1
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ret

Pointers_6f176:
	dw Data_6f17a
	dw Data_6f19e

Data_6f17a:
	db $40, $86, $28, $50
	db $40, $94, $28, $50
	db $50, $00, $28, $50
	db $50, $08, $34, $44
	db $50, $29, $34, $44
	db $50, $2b, $34, $44
	db $50, $2f, $34, $44
	db $50, $30, $34, $44
	db $50, $77, $34, $44

Data_6f19e:
	db $70, $86, $78, $30
	db $70, $94, $78, $30
	db $80, $00, $78, $30
	db $80, $08, $68, $30
	db $80, $29, $68, $30
	db $80, $2b, $68, $30
	db $80, $2f, $68, $30
	db $80, $30, $68, $30
	db $80, $77, $68, $30

Func_6f1c2: ; 6f1c2 (1b:71c2)
	ld bc, $20
.asm_6f1c5
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_6f1c5
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6f1d2: ; 6f1d2 (1b:71d2)
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld b, a
	check_cgb
	jr z, .asm_6f1ea
	ld a, b
	inc a
	and $7
	jr nz, .asm_6f1ea
	inc b
.asm_6f1ea
	ld a, b
	ld [wWX], a
	ld [hli], a
	ret

Func_6f1f0: ; 6f1f0 (1b:71f0)
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hli], a
	ld a, [wWY]
	ld [hl], a
	ret

Func_6f1ff: ; 6f1ff (1b:71ff)
	ld hl, $3
	add hl, de
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	add c
	ld [hli], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6f20f: ; 6f20f (1b:720f)
	ld de, wOAMAnimation02
	jr asm_6f226

Func_6f214:
	ld de, wOAMAnimation03
	jr asm_6f226

Func_6f219:
	ld de, wOAMAnimation04
	jr asm_6f226

Func_6f21e:
	ld de, wOAMAnimation05
	jr asm_6f226

Func_6f223:
	ld de, wOAMAnimation06
asm_6f226
	jp Func_6f0ff

Func_6f229: ; 6f229 (1b:7229)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld hl, wOAMAnimation02
	call Func_6f1c2
	ld hl, wOAMAnimation03
	call Func_6f1c2
	ld hl, wOAMAnimation04
	call Func_6f1c2
	ld hl, wOAMAnimation05
	call Func_6f1c2
	ld hl, wOAMAnimation06
	call Func_6f1c2
	ld hl, wOAMAnimation07
	call Func_6f1c2
	ld hl, wOAMAnimation08
	call Func_6f1c2
	jp EndMoveAnimation

Func_6f25d:
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6f267:
	ld de, wOAMAnimation04
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6f2ad
	ld de, wOAMAnimation05
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6f2d8
	ld de, wOAMAnimation02
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6f2ad
	ld de, wOAMAnimation03
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6f2d8
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6f2ad: ; 6f2ad (1b:72ad)
	push de
	push hl
	ld hl, $19
	add hl, de
	ld a, [hli]
	ld [wcb20], a
	ld a, [hl]
	cp $7
	jr c, .asm_6f2c2
	dec a
	dec a
	ld [hl], a
	jp Func_6f2d5

.asm_6f2c2
	xor a
	push af
	ld hl, $19
	add hl, de
	ld a, [hl]
	cp $f0
	jr nc, .asm_6f2d0
	inc a
	inc a
	inc a
.asm_6f2d0
	ld [hl], a
	ld [wcb20], a
	pop af
Func_6f2d5: ; 6f2d5 (1b:72d5)
	jp Func_6f300

Func_6f2d8: ; 6f2d8 (1b:72d8)
	push de
	push hl
	ld hl, $19
	add hl, de
	ld a, [hli]
	ld [wcb20], a
	ld a, [hl]
	cp $77
	jr nc, .asm_6f2ed
	inc a
	inc a
	ld [hl], a
	jp Func_6f300

.asm_6f2ed
	xor a
	push af
	ld hl, $19
	add hl, de
	ld a, [hl]
	cp $f0
	jr nc, .asm_6f2fb
	inc a
	inc a
	inc a
.asm_6f2fb
	ld [hl], a
	ld [wcb20], a
	pop af
Func_6f300: ; 6f300 (1b:7300)
	pop de
	push af
	lb bc, $30, $40
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6f30f
	lb bc, $70, $28
.asm_6f30f
	call Func_303a
	ld b, a
	pop af
	add b
	and $7f
	ld d, a
	ld a, [wcb20]
	ld e, a
	call Func_302d
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	pop hl
	push hl
	push de
	ld de, $10
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hli], a
	pop de
	ld a, [hl]
	add e
	ld [hli], a
	ld a, [hl]
	adc d
	ld [hl], a
	pop de
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld c, a
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Func_6f35e: ; 6f35e (1b:735e)
	push de
	ld hl, $10
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, $3
	add hl, de
	ld [hl], a
	pop de
	ret

Func_6f370: ; 6f370 (1b:7370)
	push de
	ld hl, $12
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ld hl, $4
	add hl, de
	ld [hl], a
	pop de
	ret

Func_6f382: ; 6f382 (1b:7382)
	ld a, [wBattleTurn]
	or a
	jr nz, asm_6f390
	jr asm_6f39b

Func_6f38a:
	ld a, [wBattleTurn]
	or a
	jr nz, asm_6f39b
asm_6f390
	ld hl, wPlayerDenjuu1Species
	ld a, [wCurBattleDenjuu]
	call Func_6c8ea
	ld c, a
	ret

asm_6f39b
	ld hl, wEnemyDenjuu1Species
	ld a, [wCurEnemyDenjuu]
	call Func_6c8ea
	ld c, a
	ret
