Func_68000:
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

Func_6804c: ; 6804c (1a:404c)
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

Func_68103: ; 68103 (1a:4103)
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
	ld bc, $810
	ld de, wOAMAnimation03
	call Func_6b737
	jp NextMoveAnimationSubroutine

Func_681cb:
	ld de, wOAMAnimation03
	call Func_6b4ef
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_681d7: ; 681d7 (1a:41d7)
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
	ld de, wOAMAnimation03_PriorityFlags
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
	ld de, wOAMAnimation02_PriorityFlags
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
	ld de, wOAMAnimation03_PriorityFlags
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
	ld hl, wOAMAnimation03_PriorityFlags
	call Func_6b70d
	ld a, $5
	ld de, wOAMAnimation02_PriorityFlags
	call Func_6b28c
	ld a, $2a
	ld [H_SFX_ID], a
	jp NextMoveAnimationSubroutine

Func_6828a:
	ld de, wOAMAnimation02
	jp Func_6b4bb

Func_68290::
	dr $68290, $6839c

Func_6839c::
	dr $6839c, $683f0

Func_683f0::
	dr $683f0, $68444

Func_68444::
	dr $68444, $68497

Func_68497::
	dr $68497, $68598

Func_68598::
	dr $68598, $686f2

Func_686f2::
	dr $686f2, $6877a

Func_6877a::
	dr $6877a, $687e1

Func_687e1::
	dr $687e1, $68829

Func_68829::
	dr $68829, $688c9

Func_688c9::
	dr $688c9, $6890e

Func_6890e::
	dr $6890e, $68a2d

Func_68a2d::
	dr $68a2d, $68bc7

Func_68bc7::
	dr $68bc7, $68d43

Func_68d43::
	dr $68d43, $68e59

Func_68e59::
	dr $68e59, $68ebf

Func_68ebf::
	dr $68ebf, $68f25

Func_68f25::
	dr $68f25, $68f8b

Func_68f8b::
	dr $68f8b, $68fdc

Func_68fdc::
	dr $68fdc, $69042

Func_69042::
	dr $69042, $690a8

Func_690a8::
	dr $690a8, $69133

Func_69133::
	dr $69133, $6921d

Func_6921d::
	dr $6921d, $692eb

Func_692eb::
	dr $692eb, $693cd

Func_693cd::
	dr $693cd, $694af

Func_694af::
	dr $694af, $695c7

Func_695c7::
	dr $695c7, $696c8

Func_696c8::
	dr $696c8, $6974c

Func_6974c::
	dr $6974c, $69828

Func_69828::
	dr $69828, $69913

Func_69913::
	dr $69913, $69961

Func_69961::
	dr $69961, $699e5

Func_699e5::
	dr $699e5, $69a69

Func_69a69::
	dr $69a69, $69acb

Func_69acb::
	dr $69acb, $69cd0

Func_69cd0::
	dr $69cd0, $69f99

Func_69f99::
	dr $69f99, $6a15a

Func_6a15a::
	dr $6a15a, $6a35e

Func_6a35e::
	dr $6a35e, $6a401

Func_6a401::
	dr $6a401, $6a618

Func_6a618::
	dr $6a618, $6a774

Func_6a774::
	dr $6a774, $6a954

Func_6a954::
	dr $6a954, $6ab1e

Func_6ab1e::
	dr $6ab1e, $6ab5e

Func_6ab5e::
	dr $6ab5e, $6ac98

Func_6ac98::
	dr $6ac98, $6ad72

Func_6ad72::
	dr $6ad72, $6aea7

Func_6aea7::
	dr $6aea7, $6afdc

Func_6afdc::
	dr $6afdc, $6b1ad

Func_6b1ad::
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
	dr $6b923, $6b9f7
