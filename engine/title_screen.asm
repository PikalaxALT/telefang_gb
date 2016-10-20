TitleScreen: ; 893f (2:493f)
	ld a, [wSubroutine]
	ld hl, Pointers_8949
	call GetHalfwordFromTable
	jp [hl]

Pointers_8949:
	dw Func_896f
	dw Func_899e
	dw Func_8a1a
	dw Func_8a2e
	dw Func_8a36
	dw Func_8a45
	dw Func_8a63
	dw Func_8ac3
	dw Func_8acd
	dw Func_8b03
	dw Func_8b11
	dw Func_8b1a
	dw Func_8a2e
	dw Func_8a36
	dw Func_8b37
	dw Func_8ac3
	dw Func_8b44
	dw Func_8ac3
	dw Func_8b59

Func_896f:
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $a
	call DecompressGFXByIndex_
	ld bc, $b
	call DecompressGFXByIndex_
	ld bc, $6
	call DecompressGFXByIndex_
	xor a
	ld [wc900], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld b, $0
	call Func_3768
	jp IncrementSubroutine

Func_899e:
	ld bc, $0
	ld e, $c
	ld a, $0
	call Func_04ca
	ld bc, $0
	ld e, $9
	ld a, $0
	call Func_04da
	ld a, $6
	ld [wOAMAnimation02_TemplateIdx], a
	ld bc, $4c60
	ld de, wOAMAnimation02
	call Func_8630
IF DEF(POWER)
	ld a, $1b
ELSE
	ld a, $1c
ENDC
	ld [wOAMAnimation05_TemplateIdx], a
	ld bc, $4840
	ld de, wOAMAnimation05
	call Func_8638
	ld de, wOAMAnimation03
	ld bc, $280c
	call Func_8638
	ld de, wOAMAnimation04
	ld bc, $780c
	call Func_8638
	ld a, $9
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $a
	ld [wd411], a
	ld de, wOAMAnimation04
	call Func_0609
	ld a, $1d
	ld [wOAMAnimation06_TemplateIdx], a
	ld de, wOAMAnimation06
	ld bc, $2038
	call Func_8638
	ld a, $1e
	ld [wOAMAnimation07_TemplateIdx], a
	ld de, wOAMAnimation07
	ld bc, $8838
	call Func_8638
	ld a, $1
	ld [wc430], a
	jp IncrementSubroutine

Func_8a1a:
	ld bc, $13
	call GetCGB_BGLayout_
	ld bc, $a
	call GetCGB_OBLayout_
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

Func_8a2e:
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_8a36:
	ld a, $2
	call Func_050f
	or a
	ret z
	ld a, $1
	ld [wc430], a
	jp IncrementSubroutine

Func_8a45:
	ld a, $1
	ld [H_FFA9], a
	di
	call Func_0588
	ei
	ld a, $36
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [wc3e4], a
	xor a
	ld [wc3e5], a
	jp IncrementSubroutine

Func_8a63:
	ld a, $1
	ld [wc430], a
	ld de, wOAMAnimation03
	call Func_0616
	ld de, wOAMAnimation04
	call Func_0616
	ld a, $1
	ld [wOAMAnimation05], a
	ld a, [wc3c0]
	and $7
	jr nz, .asm_8a88
	ld a, [wOAMAnimation02]
	xor $1
	ld [wOAMAnimation02], a
.asm_8a88
	ld a, [hJoyNew]
	and $9
	jr z, .asm_8aa0
	ld a, $9
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

.asm_8aa0
	ld a, [wc3e4]
	ld b, a
	ld a, [wc3e5]
	ld c, a
	dec bc
	ld a, b
	ld [wc3e4], a
	ld a, c
	ld [wc3e5], a
	or b
	ret nz
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, $11
	ld [wSubroutine], a
	ret

Func_8ac3:
	ld a, $1
	call Func_050f
	or a
	ret z
	jp IncrementSubroutine

Func_8acd:
	call ClearObjectAnimationBuffers
	call ValidateSave
	ld [wc434], a
	cp $0
	jr z, .asm_8ae1
	cp $1
	jr z, .asm_8af6
	jp IncrementSubroutine

.asm_8ae1
	ld a, [$bffd]
	or a
	jr nz, .asm_8aec
	ld a, $1
	ld [wc434], a
.asm_8aec
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

.asm_8af6
	call DeleteSaveFile
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

Func_8b03:
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_8b11:
	ld bc, $c
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_8b1a:
	ld bc, $0
	ld e, $5
	ld a, $0
	call Func_04ca
Func_8b24: ; 8b24 (2:4b24)
	ld bc, $0
	ld e, $5
	ld a, $0
	call Func_04da
	ld bc, $18
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_8b37:
	ld a, [hJoyNew]
	and A_BUTTON | START
	ret z
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_8b44:
	call ClearSRAM
	call DeleteSaveFile
	ld a, $1
	ld [wc434], a
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

Func_8b59:
	ld a, $4
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

Func_8b63:
	ld de, $8e0 ; RGB 00, 07, 02
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	jr nz, .asm_8b7e
.asm_8b6f
	call Func_0d4e
	and $7f
	cp $30
	jr c, .asm_8b6f
	ld [wcb2c], a
	ld de, $7fff ; RGB 31, 31, 31
.asm_8b7e
	ld hl, wCGB_BGPalsBuffer + 2 palettes + 4
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, $1
	ld [wBGPalUpdate], a
	ret