TitleScreen: ; 893f (2:493f)
	ld a, [wSubroutine]
	jump_table
	dw TitleScreen_LoadGraphics
	dw TitleScreen_LoadLayout
	dw TitleScreen_LoadPalettes
	dw TitleScreen_FadeIn
	dw TitleScreen_WaitFadeIn
	dw TitleScreen_PlayPCM_StartMusic_StartTimer
	dw TitleScreen_AnimateObjects_WaitButton
	dw TitleScreen_WaitFadeOut
	dw TitleScreen_GetSaveFileDataAndGoToTopPhoneMenu
	dw TitleScreen_SaveFileCorrupted
	dw TitleScreen_SaveFileCorrupted2
	dw TitleScreen_SaveFileCorrupted3
	dw TitleScreen_FadeIn
	dw TitleScreen_WaitFadeIn
	dw TitleScreen_InvalidSave_WaitButtonThenFadeOut
	dw TitleScreen_WaitFadeOut
	dw TitleScreen_InvalidSave_DeleteSaveAndGoToTopPhoneMenu
	dw TitleScreen_WaitFadeOut
	dw TitleScreen_StartIntroMovie

TitleScreen_LoadGraphics:
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
	ld [wPhoneCallSubroutine], a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld b, $0
	call homecall_ret_2e562
	jp IncrementSubroutine

TitleScreen_LoadLayout:
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
	lb bc, $4c, $60
	ld de, wOAMAnimation02
	call Func_8630
IF DEF(POWER)
	ld a, $1b
ELSE
	ld a, $1c
ENDC
	ld [wOAMAnimation05_TemplateIdx], a
	lb bc, $48, $40
	ld de, wOAMAnimation05
	call Func_8638
	ld de, wOAMAnimation03
	lb bc, $28, $0c
	call Func_8638
	ld de, wOAMAnimation04
	lb bc, $78, $0c
	call Func_8638
	ld a, $9
	ld [wStartObjectAnimationIDX], a
	ld de, wOAMAnimation03
	call StartObjectAnimation_
	ld a, $a
	ld [wStartObjectAnimationIDX], a
	ld de, wOAMAnimation04
	call StartObjectAnimation_
	ld a, $1d
	ld [wOAMAnimation06_TemplateIdx], a
	ld de, wOAMAnimation06
	lb bc, $20, $38
	call Func_8638
	ld a, $1e
	ld [wOAMAnimation07_TemplateIdx], a
	ld de, wOAMAnimation07
	lb bc, $88, $38
	call Func_8638
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

TitleScreen_LoadPalettes:
	ld bc, $13
	call GetCGB_BGLayout_
	ld bc, $a
	call GetCGB_OBLayout_
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

TitleScreen_FadeIn:
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

TitleScreen_WaitFadeIn:
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
	ld [wMusicFade], a
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
	ld [wMusicFade], a
	ld a, $11
	ld [wSubroutine], a
	ret

TitleScreen_WaitFadeOut:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

TitleScreen_GetSaveFileDataAndGoToTopPhoneMenu:
	call ClearObjectAnimationBuffers
	call ValidateSave
	ld [wSaveFileExists], a
	cp $0
	jr z, .save_file_valid
	cp $1
	jr z, .save_file_invalid
	jp IncrementSubroutine

.save_file_valid
	ld a, [sSaveFileExists]
	or a
	jr nz, .next_routine
	ld a, $1
	ld [wSaveFileExists], a
.next_routine
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

.save_file_invalid
	call DeleteSaveFile
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

TitleScreen_SaveFileCorrupted:
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

TitleScreen_SaveFileCorrupted2:
	ld bc, $c
	call DecompressGFXByIndex_
	jp IncrementSubroutine

TitleScreen_SaveFileCorrupted3:
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

TitleScreen_InvalidSave_WaitButtonThenFadeOut:
	ld a, [hJoyNew]
	and A_BUTTON | START
	ret z
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

TitleScreen_InvalidSave_DeleteSaveAndGoToTopPhoneMenu:
	call ClearSRAM
	call DeleteSaveFile
	ld a, $1
	ld [wSaveFileExists], a
	ld a, $3
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

TitleScreen_StartIntroMovie:
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
