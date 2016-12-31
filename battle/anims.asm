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

MegaLauncherAnimation: ; 68fdc (1a:4fdc)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_68ff2
	dw Func_69007
	dw Func_69026
	dw Func_6902c
	dw Func_6903c
	dw Func_6b761

Func_68ff2:
	ld a, $19
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69007:
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $1a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $49
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69026:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_6902c:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6903c:
	ld de, wOAMAnimation02
	jp Func_6b4bb

MegaCannonAnimation: ; 69042 (1a:5042)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69058
	dw Func_6906d
	dw Func_6908c
	dw Func_69092
	dw Func_690a2
	dw Func_6b761

Func_69058:
	ld a, $19
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6906d:
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $1a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $49
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6908c:
	ld de, wOAMAnimation02_PriorityFlags
	jp Func_6b4bb

Func_69092:
	ld a, $c
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_690a2:
	ld de, wOAMAnimation02_PriorityFlags
	jp Func_6b4bb

MegaRifleAnimation: ; 690a8 (1a:50a8)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_690c6
	dw Func_690db
	dw Func_6b747
	dw Func_690fa
	dw Func_6b747
	dw Func_6910a
	dw Func_6b747
	dw Func_69123
	dw Func_6b747
	dw Func_6b761

Func_690c6:
	ld a, $a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_690db:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $49
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_690fa:
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6910a:
	ld a, $b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld bc, $f8
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $49
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69123:
	ld a, $c
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

DrillMissileAnimation: ; 69133 (1a:5133)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69147
	dw Func_69176
	dw Func_691aa
	dw Func_69205
	dw Func_6b761

Func_69147: ; 69147 (1a:5147)
	ld b, $30
	ld c, $40
	ld a, [wBattleTurn]
	and a
	jr z, .asm_69155
	ld b, $70
	ld c, $28
.asm_69155
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, $1b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1b
	ld de, wOAMAnimation03
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_69176: ; 69176 (1a:5176)
	ld a, $0
	ld [wd4c2], a
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld a, $3e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_691aa: ; 691aa (1a:51aa)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	call Func_6b7bf
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_691c8
	ld a, [wOAMAnimation02_XCoord]
	cp $6c
	ret c
	jr .asm_691ce

.asm_691c8
	ld a, [wOAMAnimation02_XCoord]
	cp $34
	ret nc
.asm_691ce
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1c
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $10, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $28
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69205: ; 69205 (1a:5205)
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

HyperMissileAnimation: ; 6921d (1a:521d)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69231
	dw Func_69260
	dw Func_69289
	dw Func_692df
	dw Func_6b761

Func_69231: ; 69231 (1a:5231)
	ld b, $30
	ld c, $40
	ld a, [wBattleTurn]
	and a
	jr z, .asm_6923f
	ld b, $70
	ld c, $28
.asm_6923f
	ld a, b
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld a, c
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld a, $1d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation03
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_69260: ; 69260 (1a:5260)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69289: ; 69289 (1a:5289)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	call Func_6b7bf
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_692a7
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_692ad

.asm_692a7
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_692ad
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1e
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1e
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $10, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_692df: ; 692df (1a:52df)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

DragonMissileAnimation: ; 692eb (1a:52eb)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_692ff
	dw Func_69330
	dw Func_6936b
	dw Func_693c1
	dw Func_6b761

Func_692ff: ; 692ff (1a:52ff)
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_6930b
	ld b, $30
	ld c, $40
	jr .asm_6930f

.asm_6930b
	ld b, $70
	ld c, $28
.asm_6930f
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, $1d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation03
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_69330: ; 69330 (1a:5330)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6936b: ; 6936b (1a:536b)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	call Func_6b7bf
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_69389
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_6938f

.asm_69389
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_6938f
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1e
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1e
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $10, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_693c1: ; 693c1 (1a:53c1)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

PenguinMissileAnimation: ; 693cd (1a:53cd)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_693e1
	dw Func_69412
	dw Func_6944d
	dw Func_694a3
	dw Func_6b761

Func_693e1: ; 693e1 (1a:53e1)
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_693ed
	ld b, $30
	ld c, $40
	jr .asm_693f1

.asm_693ed
	ld b, $70
	ld c, $28
.asm_693f1
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, $1d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation03
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_69412: ; 69412 (1a:5412)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6944d: ; 6944d (1a:544d)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	call Func_6b7bf
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6946b
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_69471

.asm_6946b
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_69471
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1e
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1e
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $10, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_694a3: ; 694a3 (1a:54a3)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

MissilePodAnimation: ; 694af (1a:54af)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_694c3
	dw Func_6950e
	dw Func_6954d
	dw Func_695bb
	dw Func_6b761

Func_694c3: ; 694c3 (1a:54c3)
	ld b, $30
	ld c, $40
	ld a, [wBattleTurn]
	and a
	jr z, .asm_694d1
	ld b, $70
	ld c, $28
.asm_694d1
	ld a, b
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, c
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld a, $1d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation05
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_6950e: ; 6950e (1a:550e)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $20
	ld [wOAMAnimation04 + $18], a
	ld [wOAMAnimation05 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $40
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld [wOAMAnimation04 + $1a], a
	ld [wOAMAnimation05 + $1a], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6954d: ; 6954d (1a:554d)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	call Func_6b79f
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_69577
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_6957d

.asm_69577
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_6957d
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld hl, wOAMAnimation05
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1e
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1e
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $10, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_695bb: ; 695bb (1a:55bb)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

WarCannonAnimation: ; 695c7 (1a:55c7)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_695db
	dw Func_69626
	dw Func_69665
	dw Func_696c2
	dw Func_6b761

Func_695db: ; 695db (1a:55db)
	ld b, $30
	ld c, $40
	ld a, [wBattleTurn]
	and a
	jr z, .asm_695e9
	ld b, $70
	ld c, $28
.asm_695e9
	ld a, b
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, c
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld a, $1d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $1d
	ld de, wOAMAnimation05
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_69626: ; 69626 (1a:5626)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $20
	ld [wOAMAnimation04 + $18], a
	ld [wOAMAnimation05 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $40
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld [wOAMAnimation04 + $1a], a
	ld [wOAMAnimation05 + $1a], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69665: ; 69665 (1a:5665)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	call Func_6b79f
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6968f
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_69695

.asm_6968f
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_69695
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld hl, wOAMAnimation05
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $21
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_696c2: ; 696c2 (1a:56c2)
	ld de, wOAMAnimation02
	jp Func_6b4bb

HarpoonMissileAnimation: ; 696c8 (1a:56c8)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_696dc
	dw Func_696ec
	dw Func_69716
	dw Func_6b747
	dw Func_6b761

Func_696dc: ; 696dc (1a:56dc)
	ld a, $22
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $c
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_696ec: ; 696ec (1a:56ec)
	lb bc, $0, $1
	ld de, wOAMAnimation02
	call Func_6b737
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69716: ; 69716 (1a:5716)
	lb bc, 4, -2
	ld a, [wBattleTurn]
	or a
	jr z, .asm_69722
	lb bc, -4, 2
.asm_69722
	ld de, wOAMAnimation02
	call Func_6b737
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

HornLauncherAnimation: ; 6974c (1a:574c)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6975c
	dw Func_697de
	dw Func_6b761

Func_6975c: ; 6975c (1a:575c)
	ld b, $30
	ld c, $38
	ld d, $70
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6976f
	ld b, $70
	ld c, $20
	ld d, $30
.asm_6976f
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld b, $6f
	ld c, $77
	ld d, $7f
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6979a
	ld b, $2f
	ld c, $37
	ld d, $3f
.asm_6979a
	ld a, b
	ld [wOAMAnimation02 + $18], a
	ld a, c
	ld [wOAMAnimation03 + $18], a
	ld a, d
	ld [wOAMAnimation04 + $18], a
	ld a, $20
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld a, $17
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $18
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $19
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $0
	ld [wd4c4], a
	call Func_69801
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $31
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_697de: ; 697de (1a:57de)
	ld a, $0
	ld [wd4c4], a
	call Func_69801
	ld a, [wOAMAnimation02 + $19]
	inc a
	inc a
	inc a
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	cp $80
	ret c
	ld a, $38
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69801: ; 69801 (1a:5801)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation02
	call Func_69f4d
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation03
	call Func_69f4d
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation04
	call Func_69f4d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

BirdBazookaAnimation: ; 69828 (1a:5828)
	call Func_698c3
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6983d
	dw Func_69852
	dw Func_6988b
	dw Func_6b761

Func_6983d: ; 6983d (1a:583d)
	ld a, $23
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $4d
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69852: ; 69852 (1a:5852)
	lb bc, 2, -1
	ld a, [wBattleTurn]
	or a
	jr z, .asm_6985e
	lb bc, -2, 1
.asm_6985e
	ld de, wOAMAnimation02
	call Func_6b737
	ld de, wOAMAnimation02
	call Func_6b4ef
	call Func_69891
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $21
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6988b: ; 6988b (1a:588b)
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_69891: ; 69891 (1a:5891)
	ld a, [wMoveAnimationTimer]
	and $7
	ret nz
	ld hl, wOAMAnimation04
	lb bc, $0, $20
.asm_6989d
	ld a, [hl]
	cp $0
	jr z, .asm_698a9
	add hl, bc
	ld a, h
	cp $c2
	jr nz, .asm_6989d
	ret

.asm_698a9
	push hl
	pop de
	ld a, [wOAMAnimation02_XCoord]
	ld b, a
	ld a, [wOAMAnimation02_YCoord]
	ld c, a
	lb hl, $40, $16
	ld a, [wBattleTurn]
	or a
	jr z, .asm_698bf
	lb hl, $70, $16
.asm_698bf
	call Func_6b6f6
	ret

Func_698c3: ; 698c3 (1a:58c3)
	ld hl, wOAMAnimation04
.asm_698c6
	push hl
	ld a, [hl]
	cp $0
	call nz, Func_698d8
	pop hl
	lb bc, $0, $20
	add hl, bc
	ld a, h
	cp $c2
	jr nz, .asm_698c6
	ret

Func_698d8: ; 698d8 (1a:58d8)
	push hl
	pop de
	ld hl, $18
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_698f3
	cp $1
	jr z, .asm_698fa
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $0
	ret nz
	push de
	pop hl
	jp Func_6b70d

.asm_698f3
	ld a, $1
	ld [hli], a
	ld a, $8
	ld [hl], a
	ret

.asm_698fa
	inc hl
	ld a, [hl]
	dec a
	ld [hl], a
	cp $0
	ret nz
	ld a, $2
	ld [hl], a
	ld hl, $18
	add hl, de
	ld a, $8
	ld [hl], a
	ld hl, $2
	add hl, de
	ld a, $17
	ld [hl], a
	ret

NoseMagnumAnimation: ; 69913 (1a:5913)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69925
	dw Func_6993d
	dw Func_69957
	dw Func_6b761

Func_69925: ; 69925 (1a:5925)
	ld a, $56
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	callba Func_ce5de
	jp NextMoveAnimationSubroutine

Func_6993d: ; 6993d (1a:593d)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $46
	ret c
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69957: ; 69957 (1a:5957)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

EarVulcanAnimation: ; 69961 (1a:5961)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69975
	dw Func_69995
	dw Func_699a6
	dw Func_699d9
	dw Func_6b761

Func_69975: ; 69975 (1a:5975)
	ld a, $30
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $31
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $33
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $46
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69995: ; 69995 (1a:5995)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld de, wOAMAnimation04
	jp Func_6b4bb

Func_699a6: ; 699a6 (1a:59a6)
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld a, $38
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $38
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $0, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_699d9: ; 699d9 (1a:59d9)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

TuskVulcanAnimation: ; 699e5 (1a:59e5)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_699f9
	dw Func_69a19
	dw Func_69a2a
	dw Func_69a5d
	dw Func_6b761

Func_699f9: ; 699f9 (1a:59f9)
	ld a, $30
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $31
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $33
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $46
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69a19: ; 69a19 (1a:5a19)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld de, wOAMAnimation04
	jp Func_6b4bb

Func_69a2a: ; 69a2a (1a:5a2a)
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld a, $38
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $38
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $0, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69a5d: ; 69a5d (1a:5a5d)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	jp Func_6b4bb

MachineGunAnimation: ; 69a69 (1a:5a69)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69a7d
	dw Func_69a9e
	dw Func_69aac
	dw Func_6b74c
	dw Func_6b761

Func_69a7d: ; 69a7d (1a:5a7d)
	ld a, $30
	ld de, wOAMAnimation02
	call Func_6b4f8
	lb bc, $0, $10
	ld de, wOAMAnimation02
	call Func_6b737
	ld a, $34
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $46
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69a9e: ; 69a9e (1a:5a9e)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld de, wOAMAnimation03
	jp Func_6b4bb

Func_69aac: ; 69aac (1a:5aac)
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld a, $38
	ld de, wOAMAnimation03
	call Func_6b28c
	lb bc, $0, $10
	ld de, wOAMAnimation03
	call Func_6b737
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

FlamethrowerAnimation: ; 69acb (1a:5acb)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69ae1
	dw Func_69b73
	dw Func_69c32
	dw Func_69c5e
	dw Func_69ccd
	dw Func_6b761

Func_69ae1: ; 69ae1 (1a:5ae1)
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $10
	ld [wOAMAnimation03 + $18], a
	ld a, $20
	ld [wOAMAnimation04 + $18], a
	ld a, $30
	ld [wOAMAnimation05 + $18], a
	ld a, $8
	ld [wOAMAnimation02 + $19], a
	add $4
	ld [wOAMAnimation03 + $19], a
	add $4
	ld [wOAMAnimation04 + $19], a
	add $4
	ld [wOAMAnimation05 + $19], a
	lb bc, $38, $40
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_69b15
	lb bc, $68, $20
.asm_69b15
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ld a, $10
	ld [wOAMAnimation02 + $1a], a
	ld a, $12
	ld [wOAMAnimation03 + $1a], a
	ld a, $14
	ld [wOAMAnimation04 + $1a], a
	ld a, $16
	ld [wOAMAnimation05 + $1a], a
	ld a, $39
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $39
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $39
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $39
	ld de, wOAMAnimation05
	call Func_6b28c
	ld a, $0
	ld [wd4c4], a
	call Func_69efb
	ld a, $29
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69b73: ; 69b73 (1a:5b73)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_69bde
	ld a, [wSpriteInitXCoordBuffers + 4]
	sub $8
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wSpriteInitYCoordBuffers + 4]
	add $4
	ld [wSpriteInitYCoordBuffers + 4], a
	ld a, [wSpriteInitXCoordBuffers + 3]
	sub $6
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, [wSpriteInitYCoordBuffers + 3]
	add $3
	ld [wSpriteInitYCoordBuffers + 3], a
	ld a, [wSpriteInitXCoordBuffers + 2]
	sub $4
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, [wSpriteInitYCoordBuffers + 2]
	add $2
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	sub $2
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	add $1
	ld [wSpriteInitYCoordBuffers + 1], a
	cp $26
	jr z, .asm_69c2a
	ld a, $0
	ld [wd4c4], a
	jp Func_69efb

.asm_69bde
	ld a, [wSpriteInitXCoordBuffers + 1]
	add $2
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	sub $1
	ld [wSpriteInitYCoordBuffers + 1], a
	ld a, [wSpriteInitXCoordBuffers + 2]
	add $4
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, [wSpriteInitYCoordBuffers + 2]
	sub $2
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, [wSpriteInitXCoordBuffers + 3]
	add $6
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, [wSpriteInitYCoordBuffers + 3]
	sub $3
	ld [wSpriteInitYCoordBuffers + 3], a
	ld a, [wSpriteInitXCoordBuffers + 4]
	add $8
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wSpriteInitYCoordBuffers + 4]
	sub $4
	ld [wSpriteInitYCoordBuffers + 4], a
	cp $28
	jr z, .asm_69c2a
	ld a, $0
	ld [wd4c4], a
	jp Func_69efb

.asm_69c2a
	ld a, $40
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69c32: ; 69c32 (1a:5c32)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, $3
	ld [wd4c4], a
	call Func_69efb
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_69c5e: ; 69c5e (1a:5c5e)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, $3
	ld [wd4c4], a
	call Func_69efb
	ld a, [wOAMAnimation02 + $1a]
	cp $0
	jr z, .asm_69c8b
	dec a
	ld [wOAMAnimation02 + $1a], a
	jr .asm_69c8f

.asm_69c8b
	xor a
	ld [wOAMAnimation02], a
.asm_69c8f
	ld a, [wOAMAnimation03 + $1a]
	cp $0
	jr z, .asm_69c9c
	dec a
	ld [wOAMAnimation03 + $1a], a
	jr .asm_69ca0

.asm_69c9c
	xor a
	ld [wOAMAnimation03], a
.asm_69ca0
	ld a, [wOAMAnimation04 + $1a]
	cp $0
	jr z, .asm_69cad
	dec a
	ld [wOAMAnimation04 + $1a], a
	jr .asm_69cb1

.asm_69cad
	xor a
	ld [wOAMAnimation04], a
.asm_69cb1
	ld a, [wOAMAnimation05 + $1a]
	cp $0
	jr z, .asm_69cbe
	dec a
	ld [wOAMAnimation05 + $1a], a
	jr .asm_69cc4

.asm_69cbe
	xor a
	ld [wOAMAnimation05], a
	jr .asm_69cc5

.asm_69cc4
	ret

.asm_69cc5
	ld a, $40
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69ccd: ; 69ccd (1a:5ccd)
	jp NextMoveAnimationSubroutine

MiniFlameAnimation: ; 69cd0 (1a:5cd0)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69ce8
	dw Func_69d86
	dw Func_69dc9
	dw Func_69dde
	dw Func_69e8e
	dw Func_69ec0
	dw Func_6b761

Func_69ce8: ; 69ce8 (1a:5ce8)
	ld b, $28
	ld c, $48
	ld d, $78
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_69cfb
	ld b, $78
	ld c, $28
	ld d, $28
.asm_69cfb
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $20
	ld [wOAMAnimation03 + $18], a
	ld a, $40
	ld [wOAMAnimation04 + $18], a
	ld a, $60
	ld [wOAMAnimation05 + $18], a
	xor a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $2c
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $2c
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $2c
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $2c
	ld de, wOAMAnimation05
	call Func_6b4f8
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, $10
	ld [wMoveAnimationTimer], a
	ld a, $29
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69d86: ; 69d86 (1a:5d86)
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, [wOAMAnimation02 + $19]
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	cp $20
	ret nz
	ld a, $2d
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $2d
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $2d
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $2d
	ld de, wOAMAnimation05
	call Func_6b4f8
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69dc9: ; 69dc9 (1a:5dc9)
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

Func_69dde: ; 69dde (1a:5dde)
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, [wd419]
	ld b, a
	ld a, [wSpriteInitXCoordBuffers + 1]
	cp b
	jr z, .asm_69e59
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_69e28
	ld de, wOAMAnimation02
	ld bc, $100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, -$80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_69e28
	ld de, wOAMAnimation02
	ld bc, -$100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, $80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_69e59
	ld a, $31
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $31
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $31
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $31
	ld de, wOAMAnimation05
	call Func_6b28c
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, $0
	ld [wd4c2], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69e8e: ; 69e8e (1a:5e8e)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $a
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_69ec0: ; 69ec0 (1a:5ec0)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld a, [wOAMAnimation02 + $19]
	dec a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	cp $0
	ret nz
	ld a, $29
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_69efb: ; 69efb (1a:5efb)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation02
	call Func_69f4d
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation03
	call Func_69f4d
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation04
	call Func_69f4d
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation05
	call Func_69f4d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_69f2d:
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	call InitBattleMenuCursor
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	call InitBattleMenuCursor
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	call InitBattleMenuCursor
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	jp InitBattleMenuCursor

Func_69f4d: ; 69f4d (1a:5f4d)
	push de
	ld hl, $18
	add hl, de
	ld a, [wd4c4]
	ld b, a
	ld a, [hl]
	add b
	ld b, a
	ld [hl], a
	cp $0
	jr nz, .asm_69f63
	ld a, $1
	ld [wd4c2], a
.asm_69f63
	ld hl, $19
	add hl, de
	ld a, [hl]
	ld [hl], a
	ld c, a
	push bc
	pop de
	ld hl, wSpriteInitXCoordBuffers
	ld a, [wWhichBattleMenuCursor]
	inchlntimes
	ld a, [hl]
	ld b, a
	ld hl, wSpriteInitYCoordBuffers
	ld a, [wWhichBattleMenuCursor]
	inchlntimes
	ld a, [hl]
	ld c, a
	call Func_3020
	pop de
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

MegaFlameAnimation: ; 69f99 (1a:5f99)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_69faf
	dw Func_6a00e
	dw Func_6a045
	dw Func_6a09e
	dw Func_6a0cc
	dw Func_6f229 ; wrong bank

Func_69faf: ; 69faf (1a:5faf)
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_69fca
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
	jr .asm_69fdc

.asm_69fca
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
.asm_69fdc
	call Func_6b9c6
	callba Func_ce606
	ld a, $ff
	ld [wcac2], a
	ld a, $6c
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld c, $0
	ld b, $8
.asm_69ffa
	push bc
	callba Func_cd7e0
	pop bc
	ld a, c
	add $10
	ld c, a
	dec b
	jr nz, .asm_69ffa
	jp NextMoveAnimationSubroutine

Func_6a00e: ; 6a00e (1a:600e)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $78
	jr nc, .asm_6a030
	cp $64
	ret nc
	and $3
	ret nz
	callba Func_cd938
	ret

.asm_6a030
	ld a, $6d
	ld [H_SFX_ID], a
	callba Func_cda6d
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a045: ; 6a045 (1a:6045)
	call Func_6a0d6
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6a075
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
	jr .asm_6a087

.asm_6a075
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
.asm_6a087
	ld a, $43
	ld [H_SFX_ID], a
	ld a, $1f
	ld [wca60], a
	ld a, $20
	ld [wcac2], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a09e: ; 6a09e (1a:609e)
	call Func_6a0d6
	call Func_6a10b
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	cp $32
	jr nc, .asm_6a0bf
	and $1
	jr nz, .asm_6a0bf
	callba Func_cc9a0
.asm_6a0bf
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $7c
	ret c
	jp NextMoveAnimationSubroutine

Func_6a0cc: ; 6a0cc (1a:60cc)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wMoveAnimationSubroutine], a
	jp EndMoveAnimation

Func_6a0d6: ; 6a0d6 (1a:60d6)
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
	jr z, .asm_6a105
	sub $1
	jr nc, .asm_6a101
	xor a
.asm_6a101
	ld [wcac2], a
	ret

.asm_6a105
	ld a, $ff
	ld [wcac2], a
	ret

Func_6a10b: ; 6a10b (1a:610b)
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld d, a
	sla d
	call Func_3058
	ld e, a
	ld a, [wca60]
	ld c, a
	cp $1
	jr nz, .asm_6a123
	ld c, $0
.asm_6a123
	call Multiply_C_by_E_signed
	sra d
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6a14c
	ld a, d
	ld [wd45d], a
	ld a, $58
	add d
	ld [wWX], a
	call Func_6b71d
.asm_6a13c
	ld a, [wd45b]
	and $3
	ret nz
	ld a, [wca60]
	or a
	ret z
	dec a
	ld [wca60], a
	ret

.asm_6a14c
	ld a, d
	cpl
	inc a
	ld [wd45d], a
	ld a, $0
	add d
	ld [wSCX], a
	jr .asm_6a13c

KamaitachiAnimation: ; 6a15a (1a:615a)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a170
	dw Func_6a20e
	dw Func_6a249
	dw Func_6a2f1
	dw Func_6b747
	dw Func_6b761

Func_6a170: ; 6a170 (1a:6170)
	ld b, $28
	ld c, $48
	ld d, $78
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a183
	ld b, $78
	ld c, $28
	ld d, $28
.asm_6a183
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld [wOAMAnimation05 + $11], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $20
	ld [wOAMAnimation03 + $18], a
	ld a, $40
	ld [wOAMAnimation04 + $18], a
	ld a, $60
	ld [wOAMAnimation05 + $18], a
	xor a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $26
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $26
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $26
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $26
	ld de, wOAMAnimation05
	call Func_6b28c
	ld a, $0
	ld [wd4c4], a
	call Func_69efb
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a20e: ; 6a20e (1a:620e)
	ld a, $0
	ld [wd4c4], a
	call Func_69efb
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wOAMAnimation02 + $19]
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	cp $20
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a249: ; 6a249 (1a:6249)
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wd419]
	ld b, a
	ld a, [wSpriteInitXCoordBuffers + 1]
	cp b
	jr z, .asm_6a2dc
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6a2ab
	ld de, wOAMAnimation02
	ld bc, $100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, -$80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_6a2ab
	ld de, wOAMAnimation02
	ld bc, -$100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, $80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_6a2dc
	ld a, $1
	ld [wd4c4], a
	call Func_69efb
	ld a, $0
	ld [wd4c2], a
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a2f1: ; 6a2f1 (1a:62f1)
	ld a, $1
	ld [wd4c4], a
	call Func_69efb
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld [wOAMAnimation05], a
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wOAMAnimation02 + $19]
	add $4
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	cp $70
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld hl, wOAMAnimation05
	call Func_6b70d
	ld a, $27
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $55
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

HurricaneAnimation: ; 6a35e (1a:635e)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a370
	dw Func_6a39e
	dw Func_6a3fb
	dw Func_6b761

Func_6a370: ; 6a370 (1a:6370)
	ld a, $28
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, [wOAMAnimation02_YCoord]
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $19], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $11], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation02 + $13], a
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a39e: ; 6a39e (1a:639e)
	ld de, wOAMAnimation02
	ld a, [wBattleTurn]
	or a
	jr z, .asm_6a3b5
	ld bc, -$80
	call Func_6b954
	ld bc, $30
	call Func_6b95d
	jr .asm_6a3c1

.asm_6a3b5
	ld bc, $80
	call Func_6b954
	ld bc, -$30
	call Func_6b95d
.asm_6a3c1
	ld hl, $3
	add hl, de
	ld a, [hl]
	ld hl, $19
	add hl, de
	ld [hl], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation02
	call Func_68b1c
	ld de, wOAMAnimation02
	ld hl, $3
	add hl, de
	ld a, [hl]
	cp $7c
	jr nc, .asm_6a3eb
	cp $24
	ret nc
.asm_6a3eb
	ld a, $29
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a3fb: ; 6a3fb (1a:63fb)
	ld de, wOAMAnimation02
	jp Func_6b4bb

MiniSnowAnimation: ; 6a401 (1a:6401)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a421
	dw Func_6a4a3
	dw Func_6a4c8
	dw Func_6a558
	dw Func_6b747
	dw Func_6a5a6
	dw Func_6b747
	dw Func_6a5c5
	dw Func_6b747
	dw Func_6a5e4
	dw Func_6b761

Func_6a421: ; 6a421 (1a:6421)
	ld b, $28
	ld c, $48
	ld d, $78
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a434
	ld b, $78
	ld c, $28
	ld d, $28
.asm_6a434
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld [wOAMAnimation04 + $11], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $55
	ld [wOAMAnimation03 + $18], a
	ld a, $aa
	ld [wOAMAnimation04 + $18], a
	xor a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld a, $1c
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $1c
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $1c
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $0
	ld [wd4c4], a
	call Func_6a5f1
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $2e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a4a3: ; 6a4a3 (1a:64a3)
	ld a, $0
	ld [wd4c4], a
	call Func_6a5f1
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02 + $19]
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	cp $20
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a4c8: ; 6a4c8 (1a:64c8)
	ld a, $4
	ld [wd4c4], a
	call Func_6a5f1
	ld a, [wd419]
	ld b, a
	ld a, [wSpriteInitXCoordBuffers + 1]
	cp b
	jr z, .asm_6a543
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6a512
	ld de, wOAMAnimation02
	ld bc, $100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, -$80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_6a512
	ld de, wOAMAnimation02
	ld bc, -$100
	call Func_6b966
	ld de, wOAMAnimation02
	ld bc, $80
	call Func_6b971
	ld a, [wOAMAnimation02 + $11]
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wOAMAnimation02 + $13]
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	ret

.asm_6a543
	ld a, $1
	ld [wd4c4], a
	call Func_6a5f1
	ld a, $0
	ld [wd4c2], a
	ld a, $10
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a558: ; 6a558 (1a:6558)
	ld a, $0
	ld [wd4c4], a
	call Func_6a5f1
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld a, [wOAMAnimation02 + $19]
	inc a
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	cp $70
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld a, $3a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2f
	ld [H_SFX_ID], a
	ld a, $c
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6a5a6: ; 6a5a6 (1a:65a6)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $3b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $2f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a5c5: ; 6a5c5 (1a:65c5)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, $3c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $c
	ld [wMoveAnimationTimer], a
	ld a, $2f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a5e4: ; 6a5e4 (1a:65e4)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

Func_6a5f1: ; 6a5f1 (1a:65f1)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation02
	call Func_69f4d
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation03
	call Func_69f4d
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld de, wOAMAnimation04
	call Func_69f4d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

BlizzardAnimation: ; 6a618 (1a:6618)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a62e
	dw Func_6a63b
	dw Func_6a668
	dw Func_6a66b
	dw Func_6a678
	dw Func_6b761

Func_6a62e: ; 6a62e (1a:662e)
	ld a, $40
	ld [wMoveAnimationTimer], a
	ld a, $2e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a63b: ; 6a63b (1a:663b)
	call Func_6a684
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
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
	jp NextMoveAnimationSubroutine

Func_6a668: ; 6a668 (1a:6668)
	jp NextMoveAnimationSubroutine

Func_6a66b: ; 6a66b (1a:666b)
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $2f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a678: ; 6a678 (1a:6678)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

Func_6a684: ; 6a684 (1a:6684)
	ld a, [wVBlankCounter]
	and $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld [wOAMAnimation05], a
	ld [wOAMAnimation06], a
	ld de, wOAMAnimation02
	ld b, $5
.asm_6a69d
	push bc
	push de
	jr .asm_6a6ad

.asm_6a6a1
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_6a69d
	ret

.asm_6a6ad
	ld hl, $19
	add hl, de
	ld a, [hl]
	cp $0
	jr nz, .asm_6a6c4
	inc a
	ld [hl], a
	push de
	ld a, $21
	call Func_6b4f8
	pop de
	call Func_6a74d
	jr .asm_6a6a1

.asm_6a6c4
	ld hl, $3
	add hl, de
	ld a, [hl]
	inc a
	inc a
	ld [hli], a
	ld a, [hl]
	inc a
	inc a
	ld [hl], a
	push de
	call Func_6a6dc
	pop de
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jr .asm_6a6a1

Func_6a6dc: ; 6a6dc (1a:66dc)
	lb bc, $98, $40
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a6e9
	lb bc, $48, $60
.asm_6a6e9
	ld hl, $3
	add hl, de
	ld a, [hli]
	cp b
	jr nc, .asm_6a6f6
	ld a, [hl]
	cp c
	jr nc, .asm_6a6f6
	ret

.asm_6a6f6
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld hl, $18
	add hl, de
	ld a, $10
	ld [hli], a
	xor a
	ld [hl], a
	ret

Func_6a706:
	push de
	ld hl, Data_6a72d
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a714
	ld hl, Data_6a73d
.asm_6a714
	push hl
	call Random
	pop hl
	and $e
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop de
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Data_6a72d:
	db $58, $08
	db $58, $18
	db $58, $28
	db $68, $08
	db $78, $08
	db $88, $08
	db $58, $08
	db $58, $18

Data_6a73d:
	db $08, $28
	db $08, $38
	db $08, $48
	db $18, $28
	db $28, $28
	db $38, $28
	db $08, $28
	db $08, $28

Func_6a74d: ; 6a74d (1a:674d)
	push de
	call Random
	and $e
	push af
	ld hl, Data_6a72d
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a761
	ld hl, Data_6a73d
.asm_6a761
	pop af
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	pop de
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

EggBombAnimation: ; 6a774 (1a:6774)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a78c
	dw Func_6a7d7
	dw Func_6a812
	dw Func_6a84d
	dw Func_6a898
	dw Func_6b747
	dw Func_6b761

Func_6a78c: ; 6a78c (1a:678c)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, $a
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wd4c2], a
	ld b, $40
.asm_6a79c
	ld c, $48
	ld a, [wBattleTurn]
	and a
	jr z, .asm_6a7a9
	ld b, $60
	ld c, $28
.asm_6a7a9
	ld a, b
	ld [wSpriteInitXCoordBuffers], a
	ld a, c
	ld [wSpriteInitYCoordBuffers], a
	ld a, $32
	ld de, wOAMAnimation02
	call Func_6b4f8
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, [wSpriteInitXCoordBuffers]
	ld [wOAMAnimation02_XCoord], a
	ld [wOAMAnimation02 + $11], a
	ld a, [wSpriteInitYCoordBuffers]
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation02 + $13], a
	ld a, $36
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a7d7: ; 6a7d7 (1a:67d7)
	ld a, [wd4c2]
	cp $1
	jr z, .asm_6a7f9
	lb bc, $60, $00
	lb hl, $c4, $ff
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a7f1
	lb bc, $c4, $ff
	lb hl, $60, $00
.asm_6a7f1
	ld a, $0
	ld [wd4c3], a
	jp Func_6a8bd

.asm_6a7f9
	ld a, [wOAMAnimation02_XCoord]
	ld [wSpriteInitXCoordBuffers], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wSpriteInitYCoordBuffers], a
	ld a, $0
	ld [wd4c2], a
	ld a, $36
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a812: ; 6a812 (1a:6812)
	ld a, [wd4c2]
	cp $1
	jr z, .asm_6a834
	lb bc, $60, $00
	lb hl, $c4, $ff
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a82c
	lb bc, $c4, $ff
	lb hl, $60, $00
.asm_6a82c
	ld a, $1
	ld [wd4c3], a
	jp Func_6a8bd

.asm_6a834
	ld a, [wOAMAnimation02_XCoord]
	ld [wSpriteInitXCoordBuffers], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wSpriteInitYCoordBuffers], a
	ld a, $0
	ld [wd4c2], a
	ld a, $36
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a84d: ; 6a84d (1a:684d)
	ld a, [wd4c2]
	cp $1
	jr z, .asm_6a86f
	lb bc, $60, $00
	lb hl, $c4, $ff
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a867
	lb bc, $c4, $ff
	lb hl, $60, $00
.asm_6a867
	ld a, $2
	ld [wd4c3], a
	jp Func_6a8bd

.asm_6a86f
	ld a, [wOAMAnimation02_XCoord]
	ld [wSpriteInitXCoordBuffers], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wSpriteInitYCoordBuffers], a
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wd4c2], a
	ld a, $35
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $33
	ld de, wOAMAnimation03
	call Func_6b4f8
	jp NextMoveAnimationSubroutine

Func_6a898: ; 6a898 (1a:6898)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $42
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a8bd: ; 6a8bd (1a:68bd)
	ld de, wOAMAnimation02
	push hl
	call Func_6a8d9
	pop bc
	ld de, wOAMAnimation02
	call Func_6a8eb
	ld de, wOAMAnimation02
	ld b, $40
	call Func_6a8fd
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6a8d9: ; 6a8d9 (1a:68d9)
	push de
	ld hl, $10
	add hl, de
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hl], a
	pop de
	ld hl, $3
	add hl, de
	ld [hl], a
	ret

Func_6a8eb: ; 6a8eb (1a:68eb)
	push de
	ld hl, $12
	add hl, de
	ld a, [hl]
	add b
	ld [hli], a
	ld a, [hl]
	adc c
	ld [hl], a
	pop de
	ld hl, $4
	add hl, de
	ld [hl], a
	ret

Func_6a8fd: ; 6a8fd (1a:68fd)
	push de
	ld hl, $18
	add hl, de
	ld a, [hl]
	inc a
	inc a
	and $3f
	cp $0
	jr nz, .asm_6a912
	push af
	ld a, $1
	ld [wd4c2], a
	pop af
.asm_6a912
	ld [hl], a
	add b
	ld d, a
	call Func_3058
	sra a
	push af
	ld a, [wd4c3]
	cp $0
	jr z, .asm_6a92a
	cp $1
	jr z, .asm_6a92f
	cp $2
	jr z, .asm_6a936
.asm_6a92a
	pop af
	sra a
	jr .asm_6a93f

.asm_6a92f
	pop af
	sra a
	sra a
	jr .asm_6a93f

.asm_6a936
	pop af
	sra a
	sra a
	sra a
	jr .asm_6a93f

.asm_6a93f
	ld c, a
	pop de
	ld hl, $11
	add hl, de
	ld a, [hli]
	ld b, a
	inc hl
	ld a, [hl]
	add c
	ld c, a
	ld hl, $3
	add hl, de
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

WhirlpoolAnimation: ; 6a954 (1a:6954)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6a96a
	dw Func_6a9f0
	dw Func_6aa2b
	dw Func_6aab6
	dw Func_6ab05
	dw Func_6b761

Func_6a96a: ; 6a96a (1a:696a)
	ld b, $30
	ld c, $58
	ld d, $70
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6a97d
	ld b, $70
	ld c, $20
	ld d, $30
.asm_6a97d
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $20
	ld [wOAMAnimation03 + $18], a
	ld a, $40
	ld [wOAMAnimation04 + $18], a
	ld a, $60
	ld [wOAMAnimation05 + $18], a
	xor a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	ld a, $0
	ld [wd4c4], a
	call Func_69efb
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $36
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $36
	ld de, wOAMAnimation03
	call Func_6b28c
	ld a, $36
	ld de, wOAMAnimation04
	call Func_6b28c
	ld a, $36
	ld de, wOAMAnimation05
	call Func_6b28c
	ld a, $25
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6a9f0: ; 6a9f0 (1a:69f0)
	ld a, $0
	ld [wd4c4], a
	call Func_69efb
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wOAMAnimation02 + $19]
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld [wOAMAnimation05 + $19], a
	cp $20
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6aa2b: ; 6aa2b (1a:6a2b)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wd419]
	ld b, a
	ld a, [wSpriteInitXCoordBuffers + 1]
	cp b
	jr z, .asm_6aaa1
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6aa56
	jr .asm_6aa78

.asm_6aa56
	ld a, [wSpriteInitXCoordBuffers + 1]
	inc a
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	dec a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
	jr .asm_6aa98

.asm_6aa78
	ld a, [wSpriteInitXCoordBuffers + 1]
	dec a
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	inc a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	ld [wSpriteInitYCoordBuffers + 4], a
.asm_6aa98
	ld a, $4
	ld [wd4c4], a
	call Func_69efb
	ret

.asm_6aaa1
	ld a, $1
	ld [wd4c4], a
	call Func_69efb
	ld a, $0
	ld [wd4c2], a
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6aab6: ; 6aab6 (1a:6ab6)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation04
	call Func_6b4ef
	ld de, wOAMAnimation05
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld hl, wOAMAnimation05
	call Func_6b70d
	ld a, $37
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $37
	ld [H_SFX_ID], a
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ab05: ; 6ab05 (1a:6b05)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	jp NextMoveAnimationSubroutine

TsunamiAnimation: ; 6ab1e (1a:6b1e)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6ab32
	dw Func_6ab42
	dw Func_6ab48
	dw Func_6ab58
	dw Func_6b761

Func_6ab32: ; 6ab32 (1a:6b32)
	ld a, $2a
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $37
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6ab42: ; 6ab42 (1a:6b42)
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_6ab48: ; 6ab48 (1a:6b48)
	ld a, $2b
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $37
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6ab58: ; 6ab58 (1a:6b58)
	ld de, wOAMAnimation02
	jp Func_6b4bb

MiniBoltAnimation: ; 6ab5e (1a:6b5e)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6ab74
	dw Func_6abe5
	dw Func_6ac05
	dw Func_6ac58
	dw Func_6ac92
	dw Func_6b761

Func_6ab74: ; 6ab74 (1a:6b74)
	ld b, $30
	ld c, $58
	ld d, $70
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6ab87
	ld b, $70
	ld c, $20
	ld d, $30
.asm_6ab87
	ld a, d
	ld [wd419], a
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld a, $55
	ld [wOAMAnimation03 + $18], a
	ld a, $aa
	ld [wOAMAnimation04 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	ld a, $4
	ld [wd4c4], a
	call Func_6a5f1
	ld a, $18
	ld [wMoveAnimationTimer], a
	ld a, $24
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $24
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $24
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $3a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6abe5: ; 6abe5 (1a:6be5)
	ld a, $4
	ld [wd4c4], a
	call Func_6a5f1
	ld a, [wOAMAnimation02 + $19]
	dec a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	cp $20
	ret nz
	ld a, $18
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ac05: ; 6ac05 (1a:6c05)
	ld a, [wd419]
	ld b, a
	ld a, [wSpriteInitXCoordBuffers + 1]
	cp b
	jr z, .asm_6ac55
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6ac32
	ld a, [wSpriteInitXCoordBuffers + 1]
	inc a
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	dec a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
	jr .asm_6ac4c

.asm_6ac32
	ld a, [wSpriteInitXCoordBuffers + 1]
	dec a
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	inc a
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld [wSpriteInitYCoordBuffers + 3], a
.asm_6ac4c
	ld a, $4
	ld [wd4c4], a
	call Func_6a5f1
	ret

.asm_6ac55
	jp NextMoveAnimationSubroutine

Func_6ac58: ; 6ac58 (1a:6c58)
	ld a, $8
	ld [wd4c4], a
	call Func_6a5f1
	ld a, [wOAMAnimation02 + $19]
	inc a
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld [wOAMAnimation04 + $19], a
	cp $70
	ret nz
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld hl, wOAMAnimation04
	call Func_6b70d
	ld a, $2c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $39
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6ac92: ; 6ac92 (1a:6c92)
	ld de, wOAMAnimation02
	jp Func_6b4bb

MegaBoltAnimation: ; 6ac98 (1a:6c98)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6acac
	dw Func_6acdb
	dw Func_6ad16
	dw Func_6ad60
	dw Func_6b761

Func_6acac: ; 6acac (1a:6cac)
	ld b, $30
	ld c, $40
	ld a, [wBattleTurn]
	and a
	jr z, .asm_6acba
	ld b, $70
	ld c, $28
.asm_6acba
	ld a, b
	ld [wSpriteInitXCoordBuffers + 1], a
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, c
	ld [wSpriteInitYCoordBuffers + 1], a
	ld [wSpriteInitYCoordBuffers + 2], a
	ld a, $2d
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $2d
	ld de, wOAMAnimation03
	call Func_6b28c
	jp NextMoveAnimationSubroutine

Func_6acdb: ; 6acdb (1a:6cdb)
	ld a, $0
	ld [wd4c2], a
	ld a, $5a
	ld [wMoveAnimationTimer], a
	ld a, [wSpriteInitXCoordBuffers + 1]
	ld [wOAMAnimation02 + $11], a
	ld [wOAMAnimation03 + $11], a
	ld a, [wSpriteInitYCoordBuffers + 1]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	xor a
	ld [wOAMAnimation02 + $18], a
	ld [wOAMAnimation03 + $18], a
	ld a, $70
	ld [wOAMAnimation02 + $19], a
	ld [wOAMAnimation03 + $19], a
	ld a, $3f
	ld [wOAMAnimation02 + $1a], a
	ld [wOAMAnimation03 + $1a], a
	ld a, $3a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6ad16: ; 6ad16 (1a:6d16)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	call Func_6b7bf
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_6ad34
	ld a, [wOAMAnimation02_XCoord]
	cp $70
	ret c
	jr .asm_6ad3a

.asm_6ad34
	ld a, [wOAMAnimation02_XCoord]
	cp $32
	ret nc
.asm_6ad3a
	ld hl, wOAMAnimation02
	call Func_6b70d
	ld hl, wOAMAnimation03
	call Func_6b70d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $2c
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $20
	ld [wMoveAnimationTimer], a
	ld a, $39
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6ad60: ; 6ad60 (1a:6d60)
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

EarthquakeAnimation: ; 6ad72 (1a:6d72)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6ad86
	dw Func_6ad98
	dw Func_6adfd
	dw Func_6ae43
	dw Func_6b761

Func_6ad86: ; 6ad86 (1a:6d86)
	ld a, $0
	ld [wOAMAnimation01_YCoord], a
	ld a, $31
	ld [H_SFX_ID], a
	ld a, $3c
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6ad98: ; 6ad98 (1a:6d98)
	ld a, [wOAMAnimation01_YCoord]
	ld c, a
	ld b, a
	ld a, $8
	sub b
	sra a
	add c
	ld [wOAMAnimation01_YCoord], a
	ld b, $0
	ld c, a
	call Func_6ae79
	ld a, [wOAMAnimation01_YCoord]
	cp $7
	jp c, Func_6adfc
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6adcf
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $1a
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6ade1

.asm_6adcf
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $6
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $16
	ld [hl], a
.asm_6ade1
	ld a, $2
.asm_6ade3
	push af
	callba Func_cdc68
	ld hl, wOAMAnimation01
	ld bc, $700
	call Func_2b01
	pop af
	dec a
	jr nz, .asm_6ade3
	jp NextMoveAnimationSubroutine

Func_6adfc: ; 6adfc (1a:6dfc)
	ret

Func_6adfd: ; 6adfd (1a:6dfd)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	or a
	jr nz, .asm_6ae3e
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $4
	jr c, .asm_6ae26
	ld a, $0
	ld [wd45b], a
	ld b, $0
	call Func_30a7
	and $7
	ld c, a
	call Func_6ae9e
.asm_6ae26
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wOAMAnimation01_YCoord]
	or a
	jp z, NextMoveAnimationSubroutine
	dec a
	ld [wOAMAnimation01_YCoord], a
	ld b, $0
	ld c, a
	call Func_6ae79
	ret

.asm_6ae3e
	dec a
	ld [wMoveAnimationTimer], a
	ret

Func_6ae43: ; 6ae43 (1a:6e43)
	callba Func_cc000
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $4
	jr c, .asm_6ae66
	ld a, $0
	ld [wd45b], a
	ld b, $0
	call Func_30a7
	and $7
	ld c, a
	call Func_6ae9e
.asm_6ae66
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret nz
	ld bc, $0
	call Func_6ae9e
	jp NextMoveAnimationSubroutine

Func_6ae79: ; 6ae79 (1a:6e79)
	ld a, [wBattleTurn]
	cp $0
	jr nz, asm_6ae8e
asm_6ae80
	ld a, $0
	add c
	cpl
	inc a
	ld [wSCY], a
	ld a, b
	ld [wSCX], a
	jr asm_6ae9d

asm_6ae8e
	ld a, $0
	add c
	ld [wWY], a
	ld a, $58
	add b
	ld [wWX], a
	call Func_6b728
asm_6ae9d
	ret

Func_6ae9e: ; 6ae9e (1a:6e9e)
	ld a, [wBattleTurn]
	cp $0
	jr nz, asm_6ae80
	jr asm_6ae8e

MegaQuakeAnimation: ; 6aea7 (1a:6ea7)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6aebb
	dw Func_6aecd
	dw Func_6af32
	dw Func_6af78
	dw Func_6b761

Func_6aebb: ; 6aebb (1a:6ebb)
	ld a, $0
	ld [wOAMAnimation01_YCoord], a
	ld a, $31
	ld [H_SFX_ID], a
	ld a, $3c
	ld [wMoveAnimationTimer], a
	jp NextMoveAnimationSubroutine

Func_6aecd: ; 6aecd (1a:6ecd)
	ld a, [wOAMAnimation01_YCoord]
	ld c, a
	ld b, a
	ld a, $10
	sub b
	sra a
	add c
	ld [wOAMAnimation01_YCoord], a
	ld b, $0
	ld c, a
	call Func_6afae
	ld a, [wOAMAnimation01_YCoord]
	cp $f
	jp c, Func_6af31
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_6af04
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $18
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $10
	ld [hl], a
	jr .asm_6af16

.asm_6af04
	ld hl, wOAMAnimation01_Duration
	ld a, $0
	ld [hli], a
	ld a, $4
	ld [hl], a
	ld hl, wOAMAnimation01 + $c
	ld a, $80
	ld [hli], a
	ld a, $16
	ld [hl], a
.asm_6af16
	ld a, $4
.asm_6af18
	push af
	callba Func_cdc68
	ld hl, wOAMAnimation01
	ld bc, $400
	call Func_2b01
	pop af
	dec a
	jr nz, .asm_6af18
	jp NextMoveAnimationSubroutine

Func_6af31: ; 6af31 (1a:6f31)
	ret

Func_6af32: ; 6af32 (1a:6f32)
	callba Func_cc000
	ld a, [wMoveAnimationTimer]
	or a
	jr nz, .asm_6af73
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $4
	jr c, .asm_6af5b
	ld a, $0
	ld [wd45b], a
	ld b, $0
	call Func_30a7
	and $f
	ld c, a
	call Func_6afd3
.asm_6af5b
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wOAMAnimation01_YCoord]
	or a
	jp z, NextMoveAnimationSubroutine
	dec a
	ld [wOAMAnimation01_YCoord], a
	ld b, $0
	ld c, a
	call Func_6afae
	ret

.asm_6af73
	dec a
	ld [wMoveAnimationTimer], a
	ret

Func_6af78: ; 6af78 (1a:6f78)
	callba Func_cc000
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	cp $4
	jr c, .asm_6af9b
	ld a, $0
	ld [wd45b], a
	ld b, $0
	call Func_30a7
	and $f
	ld c, a
	call Func_6afd3
.asm_6af9b
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $3c
	ret nz
	ld bc, $0
	call Func_6afd3
	jp NextMoveAnimationSubroutine

Func_6afae: ; 6afae (1a:6fae)
	ld a, [wBattleTurn]
	cp $0
	jr nz, asm_6afc3
asm_6afb5
	ld a, $0
	add c
	cpl
	inc a
	ld [wSCY], a
	ld a, b
	ld [wSCX], a
	jr asm_6afd2

asm_6afc3
	ld a, $0
	add c
	ld [wWY], a
	ld a, $58
	add b
	ld [wWX], a
	call Func_6b728
asm_6afd2
	ret

Func_6afd3: ; 6afd3 (1a:6fd3)
	ld a, [wBattleTurn]
	cp $0
	jr nz, asm_6afb5
	jr asm_6afc3

RockAnimation: ; 6afdc (1a:6fdc)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6aff0
	dw Func_6b0c3
	dw Func_6b0c6
	dw Func_6b0c9
	dw Func_6b761

Func_6aff0: ; 6aff0 (1a:6ff0)
	ld a, $34
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation05
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation06
	call Func_6b4f8
	ld a, [wOAMAnimation02_XCoord]
	adc $c
	ld [wOAMAnimation03_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $18
	ld [wOAMAnimation04_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $f4
	ld [wOAMAnimation05_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $e8
	ld [wOAMAnimation06_XCoord], a
	call Random
	and $1f
	inc a
	ld [wOAMAnimation02 + $18], a
	call Random
	and $f
	inc a
	ld [wOAMAnimation03 + $18], a
	call Random
	and $f
	inc a
	ld [wOAMAnimation04 + $18], a
	call Random
	and $f
	inc a
	ld [wOAMAnimation05 + $18], a
	call Random
	and $f
	inc a
	ld [wOAMAnimation06 + $18], a
	ld a, $1c
	ld [wOAMAnimation02 + $1c], a
	ld [wOAMAnimation03 + $1c], a
	ld [wOAMAnimation04 + $1c], a
	ld [wOAMAnimation05 + $1c], a
	ld [wOAMAnimation06 + $1c], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $11], a
	ld a, [wOAMAnimation03_XCoord]
	ld [wOAMAnimation03 + $11], a
	ld a, [wOAMAnimation04_XCoord]
	ld [wOAMAnimation04 + $11], a
	ld a, [wOAMAnimation05_XCoord]
	ld [wOAMAnimation05 + $11], a
	ld a, [wOAMAnimation06_XCoord]
	ld [wOAMAnimation06 + $11], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation06 + $13], a
	xor a
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld [wOAMAnimation05], a
	ld [wOAMAnimation06], a
	ld a, $14
	ld [wMoveAnimationTimer], a
	ld a, $11
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6b0c3: ; 6b0c3 (1a:70c3)
	jp Func_6b0cc

Func_6b0c6: ; 6b0c6 (1a:70c6)
	jp NextMoveAnimationSubroutine

Func_6b0c9: ; 6b0c9 (1a:70c9)
	jp NextMoveAnimationSubroutine

Func_6b0cc: ; 6b0cc (1a:70cc)
	ld de, wOAMAnimation02
	ld b, $5
.asm_6b0d1
	push bc
	push de
	ld hl, $18
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6b0df
	dec [hl]
	jr .asm_6b0ee

.asm_6b0df
	ld hl, $2
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6b0ee
	ld a, $1
	ld [de], a
	call Func_6b148
.asm_6b0ee
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_6b0d1
	ld a, [wOAMAnimation02_TemplateIdx]
	cp $0
	ret nz
	ld a, [wOAMAnimation03_TemplateIdx]
	cp $0
	ret nz
	ld a, [wOAMAnimation04_TemplateIdx]
	cp $0
	ret nz
	ld a, [wOAMAnimation05_TemplateIdx]
	cp $0
	ret nz
	ld a, [wOAMAnimation06_TemplateIdx]
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

Func_6b11a: ; 6b11a (1a:711a)
	call Func_6b13b
	ld hl, $e
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	call Func_6b95d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_6b12e:
	ld hl, $c
	add hl, de
	ld a, [hl]
	add $20
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	ret

Func_6b13b: ; 6b13b (1a:713b)
	ld hl, $e
	add hl, de
	ld a, [hl]
	add $20
	ld [hli], a
	ld a, [hl]
	adc $0
	ld [hl], a
	ret

Func_6b148: ; 6b148 (1a:7148)
	ld hl, $1b
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_6b157
	cp $1
	jr z, .asm_6b194
	jr .asm_6b19f

.asm_6b157
	call Func_6b11a
	ld hl, $1c
	add hl, de
	dec [hl]
	ret nz
	ld a, $1c
	ld [hl], a
	ld hl, $1b
	add hl, de
	push de
	push hl
	call Random
	pop hl
	pop de
	and $1
	jr z, .asm_6b17f
	inc [hl]
	inc [hl]
	ld hl, $e
	add hl, de
	ld a, $80
	ld [hli], a
	ld a, $fe
	ld [hl], a
	ret

.asm_6b17f
	inc [hl]
	ld hl, $2
	add hl, de
	ld a, $80
	ld [hl], a
	ld a, $43
	ld [H_SFX_ID], a
	ld hl, $1c
	add hl, de
	ld a, $10
	ld [hl], a
	ret

.asm_6b194
	ld hl, $1c
	add hl, de
	dec [hl]
	ret nz
	push de
	pop hl
	jp Func_6b70d

.asm_6b19f
	call Func_6b11a
	ld hl, $1c
	add hl, de
	dec [hl]
	ret nz
	push de
	pop hl
	jp Func_6b70d

MegaRockAnimation: ; 6b1ad (1a:71ad)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw Func_6b1c1
	dw Func_6b280
	dw Func_6b286
	dw Func_6b289
	dw Func_6b761

Func_6b1c1: ; 6b1c1 (1a:71c1)
	ld a, $34
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation05
	call Func_6b4f8
	ld a, $34
	ld de, wOAMAnimation06
	call Func_6b4f8
	ld a, [wOAMAnimation02_XCoord]
	adc $8
	ld [wOAMAnimation03_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $10
	ld [wOAMAnimation04_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $f8
	ld [wOAMAnimation05_XCoord], a
	ld a, [wOAMAnimation02_XCoord]
	adc $f0
	ld [wOAMAnimation06_XCoord], a
	ld a, $1
	ld [wOAMAnimation02 + $18], a
	ld a, $10
	ld [wOAMAnimation03 + $18], a
	ld a, $4
	ld [wOAMAnimation04 + $18], a
	ld a, $c
	ld [wOAMAnimation05 + $18], a
	ld a, $8
	ld [wOAMAnimation06 + $18], a
	ld a, $1c
	ld [wOAMAnimation02 + $1c], a
	ld [wOAMAnimation03 + $1c], a
	ld [wOAMAnimation04 + $1c], a
	ld [wOAMAnimation05 + $1c], a
	ld [wOAMAnimation06 + $1c], a
	ld a, [wOAMAnimation02_XCoord]
	ld [wOAMAnimation02 + $11], a
	ld a, [wOAMAnimation03_XCoord]
	ld [wOAMAnimation03 + $11], a
	ld a, [wOAMAnimation04_XCoord]
	ld [wOAMAnimation04 + $11], a
	ld a, [wOAMAnimation05_XCoord]
	ld [wOAMAnimation05 + $11], a
	ld a, [wOAMAnimation06_XCoord]
	ld [wOAMAnimation06 + $11], a
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation02 + $13], a
	ld [wOAMAnimation03 + $13], a
	ld [wOAMAnimation04 + $13], a
	ld [wOAMAnimation05 + $13], a
	ld [wOAMAnimation06 + $13], a
	xor a
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04], a
	ld [wOAMAnimation05], a
	ld [wOAMAnimation06], a
	ld a, $14
	ld [wMoveAnimationTimer], a
	ld a, $11
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6b280: ; 6b280 (1a:7280)
	jp Func_6b0cc

Func_6b283:
	jp NextMoveAnimationSubroutine

Func_6b286: ; 6b286 (1a:7286)
	jp NextMoveAnimationSubroutine

Func_6b289: ; 6b289 (1a:7289)
	jp NextMoveAnimationSubroutine

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
Func_6b7bf:
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
