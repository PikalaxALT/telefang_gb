GameOverScreen: ; 858e (2:458e)
	ld a, [wSubroutine]
	jump_table
	dw Func_85a8
	dw Func_85c6
	dw Func_85dd
	dw Func_85ed
	dw Func_85f7
	dw Func_85ff
	dw Func_8611
	dw GameOver_ReturnToOpeningLogos

Func_85a8:
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $42
	call DecompressGFXByIndex_
	ld bc, $43
	call DecompressGFXByIndex_
	ld bc, $7
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_85c6:
	lb bc, $0, $0
	ld e, $72
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $72
	ld a, $0
	call LoadStdBGMapAttrLayout_
	jp IncrementSubroutine

Func_85dd:
	ld a, MUSIC_GAME_OVER
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_85ed:
	ld a, $2
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

Func_85f7:
	ld a, [hJoyNew]
	and START
	ret z
	jp IncrementSubroutine

Func_85ff:
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	jp IncrementSubroutine

Func_8611:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

GameOver_ReturnToOpeningLogos:
	ld a, $0
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ret

