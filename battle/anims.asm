ClawAnimation:
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_6800a
	call GetWordFromTable
	jp [hl]

Pointers_6800a:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_6802d:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $1
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $10
	ld [wd45a], a
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

RushAnimation: ; 6804c (1a:404c)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_68056
	call GetWordFromTable
	jp [hl]

Pointers_68056:
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	call Func_6b923
	jp NextMoveAnimationSubroutine

StrikeAnimation: ; 68103 (1a:4103)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_6810d
	call GetWordFromTable
	jp [hl]

Pointers_6810d:
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
	ld [wd45a], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68131:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $1
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wd45a], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6814f:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6817c:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $3
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wd45a], a
	ld a, $41
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6819a:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_681e1
	call GetWordFromTable
	jp [hl]

Pointers_681e1:
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
	ld [wd45a], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68206:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $5
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wd45a], a
	ld a, $3f
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68224:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_6824c:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $7
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $10
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_68265:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_6829a
	call GetWordFromTable
	jp [hl]

Pointers_6829a:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_682ff:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $2a
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $a
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_68344:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $2b
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $a
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $1e
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $47
	ld [H_SFX_ID], a
	ld a, $10
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_68389:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld de, wOAMAnimation02
	call Func_6b70d
	jp NextMoveAnimationSubroutine

KickAnimation: ; 6839c (1a:439c)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_683a6
	call GetWordFromTable
	jp [hl]

Pointers_683a6:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_683d0:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_683fa
	call GetWordFromTable
	jp [hl]

Pointers_683fa:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_68424:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_6844e
	call GetWordFromTable
	jp [hl]

Pointers_6844e:
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
	ld [wd45a], a
	ld a, $4e
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6846d:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $18
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_6847e:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_684a1
	call GetWordFromTable
	jp [hl]

Pointers_684a1:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_684bf:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $a
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $18
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_684d8:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $b
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $18
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_684f1:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $18
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_685a2
	call GetWordFromTable
	jp [hl]

Pointers_685a2:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_686fc
	call GetWordFromTable
	jp [hl]

Pointers_686fc:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
	ld a, $4b
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68768:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

ScissorAnimation: ; 6877a (1a:477a)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_68784
	call GetWordFromTable
	jp [hl]

Pointers_68784:
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
	ld [wd45a], a
	ld hl, wOAMAnimation02
	call Func_6b70d
	jp NextMoveAnimationSubroutine

Func_687b2:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	ret nz
	ld a, $7
	ld de, wOAMAnimation02
	call Func_6b28c
	ld a, $10
	ld [wd45a], a
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
	ld hl, Pointers_687eb
	call GetWordFromTable
	jp [hl]

Pointers_687eb:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_6880f:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Func_68833
	call GetWordFromTable
	jp [hl]

Func_68833:
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
	ld hl, Pointers_688d3
	call GetWordFromTable
	jp [hl]

Pointers_688d3:
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
	ld hl, Pointers_68918
	call GetWordFromTable
	jp [hl]

Pointers_68918:
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
	ld [wd45a], a
	jp NextMoveAnimationSubroutine

Func_6894f:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
	ld a, $28
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68a15:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BloodsuckAnimation: ; 68a2d (1a:4a2d)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_68a37
	call GetWordFromTable
	jp [hl]

Pointers_68a37:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
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
	ld hl, Pointers_68bd1
	call GetWordFromTable
	jp [hl]

Pointers_68bd1:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $10
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $20
	ld [wd45a], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68d37:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BowgunAnimation: ; 68d43 (1a:4d43)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_68d4d
	call GetWordFromTable
	jp [hl]

Pointers_68d4d:
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
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $12
	ld de, wOAMAnimation02
	call Func_6b4f8
	ld a, $c
	ld [wd45a], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68da7:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $13
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $c
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $14
	ld de, wOAMAnimation03
	call Func_6b4f8
	ld a, $c
	ld [wd45a], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68dfa:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $15
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $c
	ld [wd45a], a
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
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $16
	ld de, wOAMAnimation04
	call Func_6b4f8
	ld a, $20
	ld [wd45a], a
	ld a, $32
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68e4d:
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	jp NextMoveAnimationSubroutine

BisonBeamAnimation: ; 68e59 (1a:4e59)
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_68e63
	call GetWordFromTable
	jp [hl]

Pointers_68e63:
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
	ld [wd45a], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68e84:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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
	ld hl, Pointers_68ec9
	call GetWordFromTable
	jp [hl]

Pointers_68ec9:
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
	ld [wd45a], a
	ld a, $35
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_68eea:
	ld de, wOAMAnimation02
	call Func_6b4ef
	ld a, [wd45a]
	dec a
	ld [wd45a], a
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

PulseBeamAnimation::
	dr $68f25, $68f8b

PlasmaLaserAnimation::
	dr $68f8b, $68fdc

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

Func_6b28c:
	dr $6b28c, $6b4bb

Func_6b4bb:
	dr $6b4bb, $6b4ef

Func_6b4ef:
	dr $6b4ef, $6b4f8

Func_6b4f8:
	dr $6b4f8, $6b70d

Func_6b70d:
	dr $6b70d, $6b71d

Func_6b71d:
	dr $6b71d, $6b737

Func_6b737:
	dr $6b737, $6b747

Func_6b747:
	dr $6b747, $6b761

Func_6b761:
	dr $6b761, $6b898

Func_6b898:
	dr $6b898, $6b8e2

Func_6b8e2:
	dr $6b8e2, $6b923

Func_6b923:
	dr $6b923, $6b954

Func_6b954:
	dr $6b954, $6b95d

Func_6b95d:
	dr $6b95d, $6b9f7
