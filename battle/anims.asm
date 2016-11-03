ClawAnimation:
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68016
	dw Func_6b747
	dw Func_68025
	dw Func_6802d
	dw Func_6b747
	dw Func_6b761

Func_68016:
	xor a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68025:
	ld a, $2
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6802d:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

RushAnimation: ; 6804c (1a:404c)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68060
	dw Func_68068
	dw Func_68092
	dw Func_6b747
	dw Func_6b761

Func_68060:
	ld a, $4e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68068:
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6807d
	ld b, $8
	ld a, [wSCX]
	sub b
	ld [wSCX], a
	cp $f0
	ret nc
	jr .asm_6808f

.asm_6807d
	ld b, $8
	ld a, [wWX]
	sub b
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $46
	ret nc
.asm_6808f
	jp NextMoveAnimationSubroutine

Func_68092:
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_680a7
	ld b, $8
	ld a, [wSCX]
	add b
	ld [wSCX], a
	cp $0
	ret nz
	jr .asm_680b9

.asm_680a7
	ld b, $8
	ld a, [wWX]
	add b
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $58
	ret c
.asm_680b9
	ld a, $0
	ld [wSCX], a
	ld a, $58
	ld [wWX], a
	call Func_6b71d
	ld a, $2
	ld [wcb31], a
	ld a, $3
	ld [wcb32], a
	ld a, $10
	ld [wcb34], a
	ld [wcb35], a
	ld a, $2
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_680e8:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_6b898
	call Func_6b8e2
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	call Func_6b923
	jp NextMoveAnimationSubroutine

StrikeAnimation: ; 68103 (1a:4103)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6811d
	dw Func_68131
	dw Func_6814f
	dw Func_68167
	dw Func_6817c
	dw Func_6819a
	dw Func_681cb
	dw Func_6b761

Func_6811d:
	xor a
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $8
	ld [wMoveAnimationTimer], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68131:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $1
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6814f:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	jp NextMoveAnimationSubroutine

Func_68167:
	ld a, $2
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $8
	ld [wMoveAnimationTimer], a
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6817c:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $3
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6819a:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $4
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $4
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, 8, 16
	ld de, wOAMAnimation03
	call Func_6b737
	jp NextMoveAnimationSubroutine

Func_681cb:
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation02
	jp Func_6b4bb

CatPunchAnimation: ; 681d7 (1a:41d7)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_681f1
	dw Func_68206
	dw Func_68224
	dw Func_6823c
	dw Func_6824c
	dw Func_68265
	dw Func_6828a
	dw Func_6b761

Func_681f1:
	ld a, $4
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $8
	ld [wMoveAnimationTimer], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68206:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $5
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68224:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	jp NextMoveAnimationSubroutine

Func_6823c:
	ld a, $6
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $8
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6824c:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $7
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_68265:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $5
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6828a:
	ld de, wOAMAnimation02
	jp Func_6b4bb

BisonHammerAnimation: ; 68290 (1a:4290)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_682ae
	dw Func_682be
	dw Func_682c4
	dw Func_682d4
	dw Func_682ff
	dw Func_68319
	dw Func_68344
	dw Func_6835e
	dw Func_68389
	dw Func_6b761

Func_682ae:
	ld a, $d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_682be:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_682c4:
	ld a, $29
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_682d4:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_YCoord]
	inc a
	inc a
	inc a
	inc a
	ld [wOAMAnimation02_YCoord], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_682ff:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $2a
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_68319:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_YCoord]
	inc a
	inc a
	inc a
	inc a
	ld [wOAMAnimation02_YCoord], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_68344:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $2b
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6835e:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_YCoord]
	inc a
	inc a
	inc a
	inc a
	ld [wOAMAnimation02_YCoord], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_68389:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld de, wOAMAnimation02
	call Func_6b70d
	jp NextMoveAnimationSubroutine

KickAnimation: ; 6839c (1a:439c)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_683b2
	dw Func_683c2
	dw Func_683c8
	dw Func_683d0
	dw Func_683ea
	dw Func_6b761

Func_683b2:
	ld a, $6
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_683c2:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_683c8:
	ld a, $5
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_683d0:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $4
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_683ea:
	ld de, wOAMAnimation02
	jp Func_6b4bb

TailAnimation: ; 683f0 (1a:43f0)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68406
	dw Func_68416
	dw Func_6841c
	dw Func_68424
	dw Func_6843e
	dw Func_6b761

Func_68406:
	ld a, $6
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68416:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_6841c:
	ld a, $5
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_68424:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $2
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6843e:
	ld de, wOAMAnimation02
	jp Func_6b4bb

HornAnimation: ; 68444 (1a:4444)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68458
	dw Func_6846d
	dw Func_6847e
	dw Func_6b747
	dw Func_6b761

Func_68458:
	ld a, $8
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $4e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6846d:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6847e:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $38
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

BeakAnimation: ; 68497 (1a:4497)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_684af
	dw Func_684bf
	dw Func_684d8
	dw Func_684f1
	dw Func_68507
	dw Func_68586
	dw Func_6b761

Func_684af:
	ld a, $9
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_684bf:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $a
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_684d8:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_684f1:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68507:
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68513
	lb bc, -2, 1
.asm_68513
	ld de, wOAMAnimation02
	call Func_6b737
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68525
	lb bc, -2, 1
.asm_68525
	ld de, wOAMAnimation03
	call Func_6b737
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68537
	lb bc, -2, 1
.asm_68537
	ld de, wOAMAnimation04
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation02
	call Func_6b28c
	lb bc, -8, -8
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $f
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, 0, 8
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $f
	ld de, wOAMAnimation04
	call Func_6b28c
	lb bc, 8, 24
	ld de, wOAMAnimation04
	call Func_6b737
	ld a, $38
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68586:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	jp Func_6b4bb

PoisonStingAnimation: ; 68598 (1a:4598)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_685ae
	dw Func_685c3
	dw Func_685f3
	dw Func_685f9
	dw Func_6867d
	dw Func_6b761

Func_685ae:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_685c3:
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_685cf
	lb bc, -2, 1
.asm_685cf
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_685f3:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_685f9:
	ld a, $10
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $60
	ld [$c0d9], a
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68611
	ld a, $18
	ld [$c0d9], a
.asm_68611
	ld a, $10
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $70
	ld [$c0f9], a
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68629
	ld a, $28
	ld [$c0f9], a
.asm_68629
	ld a, $10
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $80
	ld [$c119], a
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68641
	ld a, $38
	ld [$c119], a
.asm_68641
	call Random
	sla a
	ld [$c0d8], a
	call Random
	sla a
	ld [$c0f8], a
	call Random
	sla a
	ld [$c118], a
	ld de, wOAMAnimation02
	call Func_686cd
	ld de, wOAMAnimation03
	call Func_686cd
	ld de, wOAMAnimation04
	call Func_686cd
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $28
	ld [wMoveAnimationTimer], a
	ld a, $23
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6867d:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation02
	call Func_686cd
	ld de, wOAMAnimation03
	call Func_686cd
	ld de, wOAMAnimation04
	call Func_686cd
	lb bc, 0, -1
	ld de, wOAMAnimation02
	call Func_6b737
	lb bc, 0, -1
	ld de, wOAMAnimation03
	call Func_6b737
	lb bc, 0, -1
	ld de, wOAMAnimation04
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_686cd: ; 686cd (1a:46cd)
	push de
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc a
	inc a
	inc a
	inc a
	ld [hl], a
	ld d, a
	call Func_3058
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
	ld hl, $3
	add hl, de
	ld [hl], a
	ret

NumbingStingAnimation: ; 686f2 (1a:46f2)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68708
	dw Func_6871d
	dw Func_6874d
	dw Func_68753
	dw Func_68768
	dw Func_6b761

Func_68708:
	ld a, $d
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6871d:
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68729
	lb bc, -2, 1
.asm_68729
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6874d:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68753:
	ld a, $11
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $28
	ld [wMoveAnimationTimer], a
	ld a, $4b
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68768:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

ScissorAnimation: ; 6877a (1a:477a)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68794
	dw Func_6b747
	dw Func_687a4
	dw Func_687b2
	dw Func_6b747
	dw Func_687d1
	dw Func_6b747
	dw Func_6b761

Func_68794:
	ld a, $0
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_687a4:
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld hl, wOAMAnimation02
	call Func_6b70d
	jp NextMoveAnimationSubroutine

Func_687b2:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $7
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_687d1:
	ld a, $8
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

SabreAnimation: ; 687e1 (1a:47e1)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_687f7
	dw Func_6b747
	dw Func_68807
	dw Func_6880f
	dw Func_6b747
	dw Func_6b761

Func_687f7:
	ld a, $0
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68807:
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6880f:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $12
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

BiteAnimation: ; 68829 (1a:4829)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6883d
	dw Func_6885d
	dw Func_68885
	dw Func_6b747
	dw Func_6b761

Func_6883d:
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_68849
	ld b, $70
	ld c, $30
	jr .asm_6884d

.asm_68849
	ld b, $24
	ld c, $50
.asm_6884d
	ld a, b
	ld [wSpriteInitXCoordBuffers], a
	ld a, c
	ld [wSpriteInitYCoordBuffers], a
	ld a, $4e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6885d:
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_68871
	ld a, [wSCX]
	sub $4
	ld [wSCX], a
	cp $f0
	ret nc
	jr .asm_68882

.asm_68871
	ld a, [wWX]
	sub $4
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $46
	ret nc
.asm_68882
	jp NextMoveAnimationSubroutine

Func_68885:
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6888e
	jr .asm_6889b

.asm_6888e
	ld a, [wSCX]
	add $4
	ld [wSCX], a
	cp $0
	ret nz
	jr .asm_688ac

.asm_6889b
	ld a, [wWX]
	add $4
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $58
	ret c
.asm_688ac
	ld a, $0
	ld [wSCX], a
	ld a, $58
	ld [wWX], a
	call Func_6b71d
	ld a, $13
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2b
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

BodyPressAnimation: ; 688c9 (1a:48c9)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_688dd
	dw Func_688fb
	dw Func_688fe
	dw Func_6b747
	dw Func_6b761

Func_688dd:
	ld b, $70
	ld c, $30
	ld a, [wBattleTurn]
	and a
	jr z, .asm_688eb
	ld b, $24
	ld c, $50
.asm_688eb
	ld a, b
	ld [wSpriteInitXCoordBuffers], a
	ld a, c
	ld [wSpriteInitYCoordBuffers], a
	ld a, $4e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_688fb:
	jp NextMoveAnimationSubroutine

Func_688fe:
	ld a, $32
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

HornDrillAnimation: ; 6890e (1a:490e)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68924
	dw Func_6894f
	dw Func_68961
	dw Func_689ae
	dw Func_68a15
	dw Func_6b761

Func_68924:
	ld b, $70
	ld c, $30
	ld a, [wBattleTurn]
	and a
	jr z, .asm_68932
	ld b, $24
	ld c, $50
.asm_68932
	ld a, b
	ld [wSpriteInitXCoordBuffers], a
	ld a, c
	ld [wSpriteInitYCoordBuffers], a
	ld a, $14
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $3e
	ld [H_SFX_ID], a
	ld a, $20
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6894f:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_68961:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_68988
	ld a, [wOAMAnimation02_XCoord]
	add $4
	ld [wOAMAnimation02_XCoord], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSCX]
	sub $4
	ld [wSCX], a
	cp $f0
	ret nc
	jr .asm_689a6

.asm_68988
	ld a, [wOAMAnimation02_XCoord]
	sub $4
	ld [wOAMAnimation02_XCoord], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wWX]
	sub $4
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $46
	ret nc
.asm_689a6
	ld a, $38
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_689ae:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_689d5
	ld a, [wOAMAnimation02_XCoord]
	sub $4
	ld [wOAMAnimation02_XCoord], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSCX]
	add $4
	ld [wSCX], a
	cp $0
	ret nz
	jr .asm_689f3

.asm_689d5
	ld a, [wOAMAnimation02_XCoord]
	add $4
	ld [wOAMAnimation02_XCoord], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wWX]
	add $4
	ld [wWX], a
	call Func_6b71d
	ld a, [wWX]
	cp $58
	ret c
.asm_689f3
	ld a, $0
	ld [wSCX], a
	ld a, $58
	ld [wWX], a
	call Func_6b71d
	ld a, $15
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $28
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68a15:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BloodsuckAnimation: ; 68a2d (1a:4a2d)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68a43
	dw Func_68a58
	dw Func_68a83
	dw Func_68a89
	dw Func_68b10
	dw Func_6b761

Func_68a43:
	ld a, $2e
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $38
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68a58:
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68a64
	lb bc, -2, 1
.asm_68a64
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation02
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_68a83:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68a89:
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld [wOAMAnimation04 + $18], a
	ld [wOAMAnimation05 + $18], a
	ld a, $2f
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $2f
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $2f
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $2f
	ld de, wOAMAnimation05
	call Func_6b4f8
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02_Duration + 9], a
	ld [wOAMAnimation03_Duration + 9], a
	ld [wOAMAnimation04_Duration + 9], a
	ld [wOAMAnimation05_Duration + 9], a
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
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld [wOAMAnimation05], a
	ld a, $4c
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68b10:
	jp Func_68b55

Func_68b13: ; 68b13 (1a:4b13)
	call Func_68b25
	ld hl, $4
	add hl, de
	ld [hl], a
	ret

Func_68b1c:
	call Func_68b25
	ld hl, $3
	add hl, de
	ld [hl], a
	ret

Func_68b25: ; 68b25 (1a:4b25)
	push de
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc a
	inc a
	inc a
	ld [hl], a
	ld d, a
	call Func_3058
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

Func_68b44: ; 68b44 (1a:4b44)
	ld hl, $3
	add hl, de
	ld a, [hl]
	cp $78
	jr nc, .asm_68b50
	cp $28
	ret nc
.asm_68b50
	push de
	pop hl
	jp Func_6b70d

Func_68b55: ; 68b55 (1a:4b55)
	ld de, wOAMAnimation02
	ld b, $4
.asm_68b5a
	push bc
	push de
	ld hl, $2
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_68b75
	ld hl, $1a
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_68b72
	dec a
	ld [hl], a
	jr .asm_68b75

.asm_68b72
	call Func_68b89
.asm_68b75
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_68b5a
	ld a, [wOAMAnimation05_TemplateIdx]
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

Func_68b89: ; 68b89 (1a:4b89)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hl], a
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68ba4
	ld bc, $c0
	call Func_6b954
	ld bc, -$40
	call Func_6b95d
	jr .asm_68bb0

.asm_68ba4
	ld bc, -$c0
	call Func_6b954
	ld bc, $40
	call Func_6b95d
.asm_68bb0
	ld hl, $4
	add hl, de
	ld a, [hl]
	ld hl, $19
	add hl, de
	ld [hl], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	push de
	call Func_68b13
	pop de
	jp Func_68b44

ShurikenAnimation: ; 68bc7 (1a:4bc7)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68bdd
	dw Func_68bfe
	dw Func_68c70
	dw Func_68ce2
	dw Func_68d37
	dw Func_6b761

Func_68bdd:
	ld a, $16
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02_Duration + 9], a
	ld a, [wOAMAnimation02_YCoord]
	ld [$c0d3], a
	jp NextMoveAnimationSubroutine

Func_68bfe:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68c1e
	ld bc, $fe80
	ld de, wOAMAnimation02
	call Func_6b954
	ld bc, $c0
	ld de, wOAMAnimation02
	call Func_6b95d
	jr .asm_68c30

.asm_68c1e
	ld bc, $180
	ld de, wOAMAnimation02
	call Func_6b954
	ld bc, rLCDC
	ld de, wOAMAnimation02
	call Func_6b95d
.asm_68c30
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $e
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $16
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, 16, 8
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	ld a, [wOAMAnimation03_XCoord]
	ld [wOAMAnimation03_Duration + 9], a
	ld a, [wOAMAnimation03_YCoord]
	ld [$c0f3], a
	jp NextMoveAnimationSubroutine

Func_68c70:
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68c90
	ld bc, -$180
	ld de, wOAMAnimation03
	call Func_6b954
	ld bc, $c0
	ld de, wOAMAnimation03
	call Func_6b95d
	jr .asm_68ca2

.asm_68c90
	ld bc, $180
	ld de, wOAMAnimation03
	call Func_6b954
	ld bc, -$c0
	ld de, wOAMAnimation03
	call Func_6b95d
.asm_68ca2
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $f
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $16
	ld de, wOAMAnimation04
	call Func_6b28c
	lb bc, $8, $18
	ld de, wOAMAnimation04
	call Func_6b737
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	ld a, [wOAMAnimation04_XCoord]
	ld [wOAMAnimation04_Duration + 9], a
	ld a, [wOAMAnimation04_YCoord]
	ld [$c113], a
	jp NextMoveAnimationSubroutine

Func_68ce2:
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68d02
	ld bc, -$180
	ld de, wOAMAnimation04
	call Func_6b954
	ld bc, $c0
	ld de, wOAMAnimation04
	call Func_6b95d
	jr .asm_68d14

.asm_68d02
	ld bc, $180
	ld de, wOAMAnimation04
	call Func_6b954
	ld bc, -$c0
	ld de, wOAMAnimation04
	call Func_6b95d
.asm_68d14
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $10
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68d37:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BowgunAnimation: ; 68d43 (1a:4d43)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68d5d
	dw Func_68d72
	dw Func_68da7
	dw Func_68dc5
	dw Func_68dfa
	dw Func_68e18
	dw Func_68e4d
	dw Func_6b761

Func_68d5d:
	ld a, $11
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68d72:
	lb bc, 4, -2
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68d7e
	lb bc, -4, 2
.asm_68d7e
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $12
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68da7:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $13
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68dc5:
	lb bc, 4, -2
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68dd1
	lb bc, -4, 2
.asm_68dd1
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $14
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68dfa:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $15
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68e18:
	lb bc, 4, -2
	ld a, [wBattleTurn]
	or a
	jr z, .asm_68e24
	lb bc, -4, 2
.asm_68e24
	ld de, wOAMAnimation04
	call Func_6b737
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $16
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68e4d:
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BisonBeamAnimation: ; 68e59 (1a:4e59)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68e6f
	dw Func_68e84
	dw Func_6b747
	dw Func_68ea9
	dw Func_6b747
	dw Func_6b761

Func_68e6f:
	ld a, $a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68e84:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $48
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68ea3:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68ea9:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68eb9:
	ld de, wOAMAnimation02
	jp Func_6b4bb

StagBeamAnimation: ; 68ebf (1a:4ebf)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68ed5
	dw Func_68eea
	dw Func_68f09
	dw Func_68f0f
	dw Func_68f1f
	dw Func_6b761

Func_68ed5:
	ld a, $a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68eea:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $48
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68f09:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68f0f:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68f1f:
	ld de, wOAMAnimation02
	jp Func_6b4bb

PulseBeamAnimation: ; 68f25 (1a:4f25)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68f3b
	dw Func_68f50
	dw Func_68f6f
	dw Func_68f75
	dw Func_68f85
	dw Func_6b761

Func_68f3b:
	ld a, $a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68f50:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $48
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68f6f:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68f75:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68f85:
	ld de, wOAMAnimation02
	jp Func_6b4bb

PlasmaLaserAnimation: ; 68f8b (1a:4f8b)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68f9f
	dw Func_68faf
	dw Func_68fb5
	dw Func_68fca
	dw Func_6b761

Func_68f9f:
	ld a, $18
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68faf:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68fb5:
	ld a, $17
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $39
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68fca:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

MegaLauncherAnimation::
	dr $68fdc, $69042

MegaCannonAnimation::
	dr $69042, $690a8

MegaRifleAnimation::
	dr $690a8, $69133

DrillMissileAnimation::
	dr $69133, $6921d

HyperMissileAnimation::
	dr $6921d, $692eb

DragonMissileAnimation::
	dr $692eb, $693cd

PenguinMissileAnimation::
	dr $693cd, $694af

MissilePodAnimation::
	dr $694af, $695c7

WarCannonAnimation::
	dr $695c7, $696c8

HarpoonMissileAnimation::
	dr $696c8, $6974c

HornLauncherAnimation::
	dr $6974c, $69828

BirdBazookaAnimation::
	dr $69828, $69913

NoseMagnumAnimation::
	dr $69913, $69961

EarVulcanAnimation::
	dr $69961, $699e5

TuskVulcanAnimation::
	dr $699e5, $69a69

MachineGunAnimation::
	dr $69a69, $69acb

FlamethrowerAnimation::
	dr $69acb, $69cd0

MiniFlameAnimation::
	dr $69cd0, $69f99

MegaFlameAnimation::
	dr $69f99, $6a15a

KamaitachiAnimation::
	dr $6a15a, $6a35e

HurricaneAnimation::
	dr $6a35e, $6a401

MiniSnowAnimation::
	dr $6a401, $6a618

BlizzardAnimation::
	dr $6a618, $6a774

EggBombAnimation::
	dr $6a774, $6a954

WhirlpoolAnimation::
	dr $6a954, $6ab1e

TsunamiAnimation::
	dr $6ab1e, $6ab5e

MiniBoltAnimation::
	dr $6ab5e, $6ac98

MegaBoltAnimation::
	dr $6ac98, $6ad72

EarthquakeAnimation::
	dr $6ad72, $6aea7

MegaQuakeAnimation::
	dr $6aea7, $6afdc

RockAnimation::
	dr $6afdc, $6b1ad

MegaRockAnimation::
	dr $6b1ad, $6b28c

Func_6b28c: ; 6b28c (1a:728c)
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
	ld hl, Pointers_6b2cf
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
	ld [wd411], a
.asm_6b2cb
	jp Func_0609

Pointers_6b2cf:
	dw Data_6b2d3
	dw Data_6b3c7

Data_6b2d3:
	db $30, $34, $44, $10
	db $30, $70, $28, $11
	db $30, $70, $20, $13
	db $40, $34, $44, $80
	db $30, $70, $18, $15
	db $30, $68, $30, $17
	db $30, $34, $44, $1a
	db $30, $34, $44, $26
	db $30, $68, $30, $27
	db $30, $68, $30, $29
	db $30, $28, $48, $36
	db $30, $50, $40, $37
	db $30, $68, $30, $c4
	db $30, $40, $40, $18
	db $30, $88, $38, $19
	db $30, $70, $20, $1e
	db $30, $68, $38, $22
	db $30, $78, $20, $24
	db $30, $70, $38, $29
	db $30, $78, $28, $2b
	db $30, $40, $30, $2e
	db $30, $70, $28, $2f
	db $30, $30, $30, $32
	db $60, $78, $28, $3c
	db $30, $50, $40, $3d
	db $30, $28, $48, $3e
	db $30, $50, $40, $3f
	db $30, $28, $48, $44
	db $30, $68, $28, $45
	db $30, $28, $48, $46
	db $30, $68, $28, $c4
	db $30, $34, $44, $48
	db $30, $34, $44, $49
	db $30, $70, $28, $4d
	db $40, $20, $44, $50
	db $40, $34, $44, $54
	db $40, $34, $44, $55
	db $40, $28, $48, $56
	db $40, $34, $44, $64
	db $40, $78, $28, $65
	db $40, $28, $48, $66
	db $40, $78, $28, $67
	db $40, $28, $48, $70
	db $40, $78, $28, $71
	db $30, $78, $38, $c6
	db $40, $34, $44, $74
	db $40, $68, $30, $75
	db $40, $78, $28, $76
	db $40, $78, $28, $77
	db $40, $68, $30, $60
	db $30, $78, $30, $2c
	db $40, $50, $38, $58
	db $40, $50, $40, $5c
	db $40, $68, $30, $6c
	db $40, $34, $44, $6e
	db $40, $78, $30, $6f
	db $30, $70, $18, $15
	db $40, $28, $48, $5e
	db $40, $68, $28, $68
	db $40, $78, $28, $68
	db $40, $88, $28, $68

Data_6b3c7:
	db $60, $68, $30, $10
	db $60, $30, $48, $11
	db $60, $30, $40, $13
	db $70, $68, $30, $80
	db $60, $38, $40, $15
	db $60, $34, $44, $17
	db $60, $68, $30, $1a
	db $60, $68, $30, $26
	db $60, $34, $44, $27
	db $60, $34, $58, $29
	db $60, $78, $18, $36
	db $60, $50, $30, $37
	db $60, $34, $44, $c4
	db $60, $60, $30, $18
	db $60, $40, $50, $19
	db $60, $30, $40, $1e
	db $60, $34, $58, $22
	db $60, $28, $40, $24
	db $60, $30, $48, $29
	db $30, $28, $48, $2b
	db $60, $60, $28, $2e
	db $60, $34, $44, $2f
	db $60, $60, $18, $32
	db $30, $28, $48, $3c
	db $60, $50, $30, $3d
	db $60, $78, $18, $3e
	db $60, $50, $30, $3f
	db $60, $78, $28, $44
	db $60, $34, $38, $45
	db $60, $78, $28, $46
	db $60, $34, $38, $c4
	db $60, $68, $38, $48
	db $60, $34, $44, $49
	db $60, $34, $44, $4d
	db $70, $78, $30, $50
	db $70, $68, $28, $54
	db $70, $68, $38, $55
	db $70, $78, $28, $56
	db $70, $68, $38, $64
	db $70, $28, $48, $65
	db $70, $78, $28, $66
	db $70, $28, $48, $67
	db $70, $78, $28, $70
	db $70, $28, $48, $71
	db $60, $28, $58, $c6
	db $70, $68, $30, $74
	db $70, $34, $44, $75
	db $70, $28, $40, $76
	db $70, $28, $48, $77
	db $70, $34, $44, $60
	db $60, $28, $50, $2c
	db $70, $50, $38, $58
	db $70, $50, $48, $5c
	db $70, $48, $48, $6c
	db $70, $68, $30, $6e
	db $70, $28, $44, $6f
	db $60, $30, $38, $15
	db $70, $78, $28, $5e
	db $70, $18, $48, $68
	db $70, $28, $48, $68
	db $70, $38, $48, $68

Func_6b4bb: ; 6b4bb (1a:74bb)
	push de
	call Func_0616
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

Func_6b4d6:
	push de
	call Func_0616
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
	jp Func_6b70d

Func_6b4ef: ; 6b4ef (1a:74ef)
	call Func_0616
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6b4f8: ; 6b4f8 (1a:74f8)
	push de
	ld [wcb20], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wBattleTurn]
	ld hl, Pointers_6b532
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

Pointers_6b532:
	dw Data_6b536
	dw Data_6b616

Data_6b536:
	db $30, $0e, $40, $38
	db $30, $0e, $48, $48
	db $30, $0f, $70, $18
	db $30, $0f, $78, $28
	db $30, $0e, $40, $38
	db $30, $0e, $48, $48
	db $30, $0f, $68, $18
	db $30, $0f, $70, $28
	db $30, $29, $40, $38
	db $30, $29, $38, $30
	db $30, $29, $40, $40
	db $30, $29, $48, $50
	db $30, $29, $40, $38
	db $30, $31, $40, $38
	db $30, $61, $60, $18
	db $30, $61, $70, $20
	db $30, $61, $68, $30
	db $30, $62, $30, $30
	db $30, $63, $60, $18
	db $30, $62, $40, $38
	db $30, $63, $70, $20
	db $30, $63, $38, $48
	db $30, $63, $68, $30
	db $40, $0f, $38, $30
	db $40, $10, $40, $40
	db $40, $11, $40, $50
	db $40, $1b, $40, $38
	db $40, $1b, $60, $28
	db $40, $4d, $40, $48
	db $40, $4d, $40, $48
	db $40, $4d, $40, $48
	db $40, $4e, $78, $30
	db $40, $4f, $78, $30
	db $40, $52, $60, $18
	db $40, $52, $70, $20
	db $40, $52, $68, $30
	db $40, $6b, $40, $48
	db $40, $6b, $40, $48
	db $40, $6b, $40, $48
	db $40, $70, $28, $40
	db $40, $70, $78, $08
	db $30, $1d, $68, $10
	db $30, $1d, $78, $10
	db $30, $1d, $88, $10
	db $40, $2f, $28, $48
	db $40, $30, $28, $48
	db $30, $5d, $40, $30
	db $30, $5e, $60, $28
	db $40, $1c, $38, $28
	db $40, $1c, $38, $38
	db $40, $56, $40, $48
	db $40, $55, $60, $08
	db $40, $7c, $78, $08
	db $30, $54, $28, $48
	db $30, $4e, $28, $48
	db $40, $2c, $28, $48

Data_6b616:
	db $60, $0e, $68, $20
	db $60, $0e, $70, $30
	db $60, $0f, $38, $40
	db $60, $0f, $40, $50
	db $60, $0e, $60, $28
	db $60, $0e, $68, $38
	db $60, $0f, $38, $38
	db $60, $0f, $40, $48
	db $60, $29, $60, $28
	db $60, $29, $68, $18
	db $60, $29, $70, $28
	db $60, $29, $78, $38
	db $60, $29, $60, $28
	db $60, $31, $60, $28
	db $60, $61, $30, $30
	db $60, $61, $40, $38
	db $60, $61, $38, $48
	db $60, $62, $60, $18
	db $60, $63, $30, $30
	db $60, $62, $70, $20
	db $60, $63, $40, $38
	db $60, $63, $68, $30
	db $60, $63, $38, $48
	db $70, $0f, $70, $38
	db $70, $10, $60, $28
	db $70, $11, $60, $18
	db $70, $1b, $60, $28
	db $70, $1b, $40, $38
	db $70, $4d, $60, $10
	db $70, $4d, $60, $10
	db $70, $4d, $60, $10
	db $70, $4e, $30, $48
	db $70, $4f, $30, $48
	db $70, $52, $30, $30
	db $70, $52, $40, $38
	db $70, $52, $38, $48
	db $70, $6b, $60, $10
	db $70, $6b, $60, $10
	db $70, $6b, $60, $10
	db $70, $70, $78, $20
	db $70, $70, $28, $28
	db $60, $1d, $18, $30
	db $60, $1d, $28, $30
	db $60, $1d, $38, $30
	db $70, $2f, $78, $28
	db $70, $30, $78, $28
	db $60, $5d, $60, $28
	db $60, $5e, $40, $48
	db $70, $1c, $68, $20
	db $70, $1c, $68, $30
	db $70, $56, $60, $28
	db $70, $54, $40, $28
	db $70, $7c, $28, $28
	db $60, $54, $78, $28
	db $60, $4e, $78, $28
	db $70, $2c, $78, $28

Func_6b6f6:
	push hl
	ld hl, $0
	add hl, de
	pop de
	ld a, $1
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, e
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6b70d: ; 6b70d (1a:770d)
	ld bc, $20
.asm_6b710
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_6b710
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6b71d: ; 6b71d (1a:771d)
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hli], a
	ret

Func_6b728:
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hli], a
	ld a, [wWY]
	ld [hl], a
	ret

Func_6b737: ; 6b737 (1a:7737)
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

Func_6b747: ; 6b747 (1a:7747)
	ld de, wOAMAnimation02
	jr asm_6b75e

Func_6b74c:
	ld de, wOAMAnimation03
	jr asm_6b75e

Func_6b751:
	ld de, wOAMAnimation04
	jr asm_6b75e

Func_6b756:
	ld de, wOAMAnimation05
	jr asm_6b75e

Func_6b75b:
	ld de, wOAMAnimation06
asm_6b75e
	jp Func_6b4bb

Func_6b761: ; 6b761 (1a:7761)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld hl, wOAMAnimation05
	call Func_6b70d
	ld hl, wOAMAnimation06
	call Func_6b70d
	ld hl, wOAMAnimation07
	call Func_6b70d
	ld hl, wOAMAnimation08
	call Func_6b70d
	jp EndMoveAnimation

Func_6b795:
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6b79f:
	ld de, wOAMAnimation04
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6b7e5
	ld de, wOAMAnimation05
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6b811
	ld de, wOAMAnimation02
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6b7e5
	ld de, wOAMAnimation03
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	ld l, a
	ld h, b
	call Func_6b811
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6b7e5: ; 6b7e5 (1a:77e5)
	push de
	push hl
	ld hl, $19
	add hl, de
	ld a, [hli]
	ld [wcb20], a
	ld a, [hl]
	cp $7
	jr c, .asm_6b7fa
	dec a
	dec a
	ld [hl], a
	jp Func_6b80e

.asm_6b7fa
	xor a
	push af
	ld hl, $19
	add hl, de
	ld a, [hl]
	cp $f0
	jr nc, .asm_6b809
	inc a
	inc a
	inc a
	inc a
.asm_6b809
	ld [hl], a
	ld [wcb20], a
	pop af
Func_6b80e: ; 6b80e (1a:780e)
	jp Func_6b83a

Func_6b811: ; 6b811 (1a:7811)
	push de
	push hl
	ld hl, $19
	add hl, de
	ld a, [hli]
	ld [wcb20], a
	ld a, [hl]
	cp $77
	jr nc, .asm_6b826
	inc a
	inc a
	ld [hl], a
	jp Func_6b83a

.asm_6b826
	xor a
	push af
	ld hl, $19
	add hl, de
	ld a, [hl]
	cp $f0
	jr nc, .asm_6b835
	inc a
	inc a
	inc a
	inc a
.asm_6b835
	ld [hl], a
	ld [wcb20], a
	pop af
Func_6b83a: ; 6b83a (1a:783a)
	pop de
	push af
	lb bc, $28, $48
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6b849
	lb bc, $78, $28
.asm_6b849
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

Func_6b898: ; 6b898 (1a:7898)
	ld a, [wcb34]
	dec a
	ld [wcb34], a
	ret nz
	ld a, [wcb35]
	ld [wcb34], a
	call Func_6b90c
	cp $0
	ret nz
	push hl
	pop de
	push de
	ld a, [wcb31]
	call Func_6b28c
	call Random
	and $f
	ld e, a
	ld d, $0
	ld hl, Data_6b8fc
	add hl, de
	ld a, [hl]
	ld b, a
	call Random
	and $f
	ld e, a
	ld d, $0
	ld hl, Data_6b8fc
	add hl, de
	ld a, [hl]
	ld c, a
	pop de
	call Func_6b737
	ld a, [wcb32]
	dec a
	ld [wcb32], a
	ld a, $42
	ld [H_SFX_ID], a
	ret

Func_6b8e2: ; 6b8e2 (1a:78e2)
	ld hl, wOAMAnimation09
.asm_6b8e5
	push hl
	ld a, [hl]
	cp $0
	call nz, Func_6b8f7
	pop hl
	ld bc, $20
	add hl, bc
	ld a, h
	cp $c2
	jr nz, .asm_6b8e5
	ret

Func_6b8f7: ; 6b8f7 (1a:78f7)
	push hl
	pop de
	jp Func_6b4d6

Data_6b8fc:
	db  -4
	db   2
	db -16
	db   8
	db -12
	db   0
	db  -8
	db  12
	db   6
	db   4
	db  -6
	db -14
	db -10
	db -14
	db  16
	db   0

Func_6b90c: ; 6b90c (1a:790c)
	ld hl, wOAMAnimation09
	ld bc, $20
.asm_6b912
	ld a, [hl]
	cp $0
	jr z, .asm_6b920
	add hl, bc
	ld a, h
	cp wOAMAnimation12 / $100
	jr nz, .asm_6b912
	ld a, $1
	ret

.asm_6b920
	ld a, $0
	ret

Func_6b923: ; 6b923 (1a:7923)
	ld hl, wOAMAnimation09
	call Func_6b70d
	ld hl, wOAMAnimation10
	call Func_6b70d
	ld hl, wOAMAnimation11
	call Func_6b70d
	ld hl, wOAMAnimation12
	call Func_6b70d
	ld hl, wOAMAnimation13
	call Func_6b70d
	ld hl, wOAMAnimation14
	call Func_6b70d
	ld hl, wOAMAnimation15
	call Func_6b70d
	ld hl, wOAMAnimation16
	call Func_6b70d
	ret

Func_6b954: ; 6b954 (1a:7954)
	call Func_6b966
	ld hl, $3
	add hl, de
	ld [hl], a
	ret

Func_6b95d: ; 6b95d (1a:795d)
	call Func_6b971
	ld hl, $4
	add hl, de
	ld [hl], a
	ret

Func_6b966: ; 6b966 (1a:7966)
	ld hl, $10
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ret

Func_6b971: ; 6b971 (1a:7971)
	ld hl, $12
	add hl, de
	ld a, [hl]
	add c
	ld [hli], a
	ld a, [hl]
	adc b
	ld [hl], a
	ret

Func_6b97c:
	ld hl, wOAMAnimation02
	ld bc, $10
.asm_6b982
	push bc
	push hl
	push hl
	pop de
	ld bc, $1f
	add hl, bc
	ld a, [hl]
	cp $0
	jr z, .asm_6b992
	call Func_6b99e
.asm_6b992
	pop hl
	ld de, $20
	add hl, de
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_6b982
	ret

Func_6b99e: ; 6b99e (1a:799e)
	jump_table
	dw Func_6b9c5
	dw Func_6b9af
	dw Func_6b9af
	dw Func_6b9af
	dw Func_6b9af

Func_6b9af:
	ld hl, $18
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6b9c4
	cp $1
	jr z, .asm_6b9c4
	cp $2
	jr z, .asm_6b9c4
	cp $3
	jr z, .asm_6b9c4
.asm_6b9c4
	ret

Func_6b9c5:
	ret

Func_6b9c6:
	ld a, [wBattleTurn]
	or a
	jr nz, asm_6b9d4
	jr asm_6b9df

Func_6b9ce:
	ld a, [wBattleTurn]
	or a
	jr nz, asm_6b9df
asm_6b9d4
	ld hl, wPlayerDenjuu1Species
	ld a, [wCurBattleDenjuu]
	call Func_6b9ea
	ld c, a
	ret

asm_6b9df
	ld hl, wEnemyDenjuu1Species
	ld a, [wCurEnemyDenjuu]
	call Func_6b9ea
	ld c, a
	ret

Func_6b9ea: ; 6b9ea (1a:79ea)
	ld de, $16
	addntimes_hl_de
	ld a, [hl]
	ret
