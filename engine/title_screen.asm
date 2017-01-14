TitleScreen: ; 893f (2:493f)
	ld a, [wSubroutine]
	jump_table
	dw Func_896f
	dw Func_899e
	dw Func_8a1a
	dw Func_8a2e
	dw Func_8a36
	dw TitleScreen_PlayPCM_StartMusic_StartTimer
	dw TitleScreen_AnimateObjects_WaitButton
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
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld b, $0
	call homecall_ret_2e562
	jp IncrementSubroutine

Func_899e:
	lb bc, $0, $0
	ld e, $c
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $9
	ld a, $0
	call LoadStdBGMapAttrLayout_
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
	ld [wSpriteUpdatesEnabled], a
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
	call StartFade_
	jp IncrementSubroutine

Func_8a36:
	ld a, $2
	call PaletteFade_
	or a
	ret z
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

TitleScreen_PlayPCM_StartMusic_StartTimer:
	ld a, $1
	ld [H_PCM_ID], a
	di
	call PlayPCM_
	ei
	ld a, MUSIC_TITLE_SCREEN
	call GetMusicBank
	ld [H_MusicID], a
	ld a, 512 / $100
	ld [wLogoAndTitleScreenTimer], a
	xor a
	ld [wLogoAndTitleScreenTimer + 1], a
	jp IncrementSubroutine

TitleScreen_AnimateObjects_WaitButton:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld de, wOAMAnimation03
	call AnimateObject_
	ld de, wOAMAnimation04
	call AnimateObject_
	ld a, $1
	ld [wOAMAnimation05_PriorityFlags], a
	ld a, [wVBlankCounter]
	and $7
	jr nz, .no_flash
	ld a, [wOAMAnimation02_PriorityFlags]
	xor $1
	ld [wOAMAnimation02_PriorityFlags], a
.no_flash
	ld a, [hJoyNew]
	and A_BUTTON | START
	jr z, .count_down
	ld a, SFX_09
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

.count_down
	ld a, [wLogoAndTitleScreenTimer]
	ld b, a
	ld a, [wLogoAndTitleScreenTimer + 1]
	ld c, a
	dec bc
	ld a, b
	ld [wLogoAndTitleScreenTimer], a
	ld a, c
	ld [wLogoAndTitleScreenTimer + 1], a
	or b
	ret nz
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wcf96], a
	ld a, $11
	ld [wSubroutine], a
	ret

Func_8ac3:
	ld a, $1
	call PaletteFade_
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
	lb bc, $0, $0
	ld e, $5
	ld a, $0
	call LoadStdBGMapLayout_
Func_8b24: ; 8b24 (2:4b24)
	lb bc, $0, $0
	ld e, $5
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $18
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_8b37:
	ld a, [hJoyNew]
	and A_BUTTON | START
	ret z
	ld a, $4
	call StartFade_
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
	call Random
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
