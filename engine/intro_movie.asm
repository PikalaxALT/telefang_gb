PlayIntroMovie: ; 80bf (2:40bf)
	ld a, [hJoyNew]
	and A_BUTTON | START
	jr z, .asm_80d1
	ld a, [wSubroutine]
	cp $20
	jr nc, .asm_80d1
	ld a, $20
	ld [wSubroutine], a
.asm_80d1
	ld a, [wSubroutine]
	jump_table
	dw IntroMovie_LoadGFXForScene1
	dw IntroMovie_FadeIn
	dw IntroMovie_Scene1ScrollScreen
	dw IntroMovie_Scene1AppearEnemyDenjuu
	dw IntroMovie_Scene1WaitStartFadeOut
	dw IntroMovie_FadeOut
	dw IntroMovie_LoadGFXForScene2
	dw IntroMovie_FadeIn
	dw IntroMovie_AnimateShigekiTalking
	dw IntroMovie_FadeOut
	dw IntroMovie_LoadGFXForScene3
	dw IntroMovie_FadeIn
	dw IntroMovie_Scene3ScrollScreen1
	dw IntroMovie_Scene3AnimateFriendlyDenjuu
	dw IntroMovie_Scene3ExitFriendlyDenjuu
	dw IntroMovie_Scene3ScrollScreen2
	dw IntroMovie_Scene3ScrollScreenAndFadeOut
	dw IntroMovie_LoadGFXForScene4
	dw IntroMovie_FadeIn
	dw IntroMovie_AnimateScene4
	dw IntroMovie_FadeOut
	dw IntroMovie_LoadGFXForScene5
	dw IntroMovie_FadeIn
	dw IntroMovie_AnimateScene5
	dw IntroMovie_FadeOut
	dw IntroMovie_LoadGFXForScene6
	dw IntroMovie_FadeIn
	dw IntroMovie_ScrollScene6
	dw IntroMovie_WaitScene6
	dw IntroMovie_FadeOut
	dw IntroMovie_Dummy
	dw IntroMovie_ReturnToTitleScreen
	dw IntroMovie_FadeOutInterrupt
	dw IntroMovie_FadeOut
	dw IntroMovie_ReturnToTitleScreen

Func_8121::
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene1: ; 8124 (2:4124)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $30
	call IntroMovie_DoubleDecompressGFX
	ld bc, $3a
	call DecompressGFXByIndex_
	xor a
	ld [wc463], a
	ld a, $1
	ld [wc46c], a
	ld [wc46d], a
	lb bc, $0, $0
	ld e, $8
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $8
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $20
	call GetCGB_BGLayout_
	ld bc, $5
	call GetCGB_OBLayout_
	ld a, $4
	call StartFade_
	ld a, $40
	ld [wOAMAnimation02_TemplateIdx], a
	ld de, wOAMAnimation02
	lb bc, $b0, $68
	call Func_8638
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wSCX], a
	ld a, MUSIC_OPENING_MOVIE
	call GetMusicBank
	ld [H_MusicID], a
	ld b, $1
	call homecall_ret_2e562
	jp IncrementSubroutine

IntroMovie_FadeIn: ; 8191 (2:4191)
	ld a, $2
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

IntroMovie_Scene1ScrollScreen: ; 819b (2:419b)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wOAMAnimation02 + 3]
	dec a
	ld [wOAMAnimation02 + 3], a
	ld a, [wSCX]
	inc a
	ld [wSCX], a
	cp $40
	ret nz
	ld a, 64
	ld [wIntroMovieSceneTimer], a
	jp IncrementSubroutine

IntroMovie_Scene1AppearEnemyDenjuu: ; 81bf (2:41bf)
	ld a, [wIntroMovieSceneTimer]
	dec a
	ld [wIntroMovieSceneTimer], a
	cp $0
	ret nz
	lb bc, $0, $0
	ld e, $9
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $9
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld a, 128
	ld [wIntroMovieSceneTimer], a
	ld a, $41
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

IntroMovie_Scene1WaitStartFadeOut: ; 81ef (2:41ef)
	ld a, [wIntroMovieSceneTimer]
	dec a
	ld [wIntroMovieSceneTimer], a
	cp $0
	ret nz
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

IntroMovie_FadeOut: ; 8201 (2:4201)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene2: ; 820b (2:420b)
	call ClearObjectAnimationBuffers
	ld bc, $32
	call DecompressGFXByIndex_
	ld bc, $3c
	call DecompressGFXByIndex_
	lb bc, $0, $0
	ld e, $a
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $a
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $21
	call GetCGB_BGLayout_
	ld bc, $6
	call GetCGB_OBLayout_
	ld a, $4
	call StartFade_
	xor a
	ld [wSCX], a
	ld a, 192
	ld [wIntroMovieSceneTimer], a
	ld de, wOAMAnimation02
	lb bc, $58, $48
	call Func_8638
	ld a, $6
	ld [wStartObjectAnimationIDX], a
	ld de, wOAMAnimation02
	call StartObjectAnimation_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

IntroMovie_AnimateShigekiTalking: ; 8264 (2:4264)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, [wIntroMovieSceneTimer]
	cp $0
	jr z, .asm_8276
	dec a
	ld [wIntroMovieSceneTimer], a
	ret

.asm_8276
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene3: ; 827e (2:427e)
	call ClearObjectAnimationBuffers
	ld bc, $33
	call DecompressGFXByIndex_
	ld bc, $3d
	call DecompressGFXByIndex_
	lb bc, $0, $0
	ld e, $b
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $b
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $22
	call GetCGB_BGLayout_
	ld bc, INTRO_MOVIE_DENJUU_OB_LAYOUT
	call GetCGB_OBLayout_
	ld a, $4
	call StartFade_
	ld a, $44
	ld [wOAMAnimation02_TemplateIdx], a
	ld de, wOAMAnimation02
	lb bc, $c0, $68
	call Func_8638
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, 160
	ld [wIntroMovieSceneTimer], a
	jp IncrementSubroutine

IntroMovie_Scene3ScrollScreen1: ; 82cd (2:42cd)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wIntroMovieSceneTimer]
	cp $0
	jr z, .asm_82e6
	dec a
	ld [wIntroMovieSceneTimer], a
	ld a, [wSCX]
	add $4
	ld [wSCX], a
	ret

.asm_82e6
	ld a, [wOAMAnimation02 + 3]
	dec a
	ld [wOAMAnimation02 + 3], a
	cp $84
	ret nc
	ld a, $8
	ld [wStartObjectAnimationIDX], a
	ld de, wOAMAnimation02
	call StartObjectAnimation_
	ld a, 160
	ld [wIntroMovieSceneTimer], a
	jp IncrementSubroutine

IntroMovie_Scene3AnimateFriendlyDenjuu: ; 8303 (2:4303)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, [wIntroMovieSceneTimer]
	cp $0
	jr z, .asm_8315
	dec a
	ld [wIntroMovieSceneTimer], a
	ret

.asm_8315
	jp IncrementSubroutine

IntroMovie_Scene3ExitFriendlyDenjuu: ; 8318 (2:4318)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wOAMAnimation02 + 3]
Func_8320:
	inc a
	ld [wOAMAnimation02 + 3], a
	cp $c0
	ret c
	ld a, 128
	ld [wIntroMovieSceneTimer], a
	jp IncrementSubroutine

IntroMovie_Scene3ScrollScreen2: ; 832f (2:432f)
	ld a, [wIntroMovieSceneTimer]
	cp $0
	jr z, .asm_8343
	dec a
	ld [wIntroMovieSceneTimer], a
	ld a, [wSCX]
	sub $4
	ld [wSCX], a
	ret

.asm_8343
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

IntroMovie_Scene3ScrollScreenAndFadeOut: ; 834b (2:434b)
	ld a, [wSCX]
	sub $4
	ld [wSCX], a
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene4: ; 835d (2:435d)
	call ClearObjectAnimationBuffers
	ld bc, $34
	call IntroMovie_DoubleDecompressGFX
	ld bc, $3e
	call DecompressGFXByIndex_
	lb bc, $0, $0
	ld e, $c
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $c
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $23
	call GetCGB_BGLayout_
	ld bc, $8
	call GetCGB_OBLayout_
	ld a, $4
	call StartFade_
	ld a, 192
	ld [wIntroMovieSceneTimer], a
	xor a
	ld [wSCX], a
	ld de, wOAMAnimation02
	lb bc, $80, $68
	call Func_8638
	ld a, $7
	ld [wStartObjectAnimationIDX], a
	ld de, wOAMAnimation02
	call StartObjectAnimation_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

IntroMovie_AnimateScene4: ; 83b6 (2:43b6)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, [wIntroMovieSceneTimer]
	dec a
	ld [wIntroMovieSceneTimer], a
	cp $0
	ret nz
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene5: ; 83ce (2:43ce)
	call ClearObjectAnimationBuffers
	ld bc, $36
	call IntroMovie_DoubleDecompressGFX
	lb bc, $0, $0
	ld e, $d
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $d
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $24
	call GetCGB_BGLayout_
	ld a, $4
	call StartFade_
	ld a, 255
	ld [wIntroMovieSceneTimer], a
	ld a, $8
	ld [wc463], a
	jp IncrementSubroutine

IntroMovie_AnimateScene5: ; 8403 (2:4403)
	ld a, [wVBlankCounter]
	and $7
	jr nz, .asm_8411
	ld a, [wc463]
	dec a
	ld [wc463], a
.asm_8411
	ld a, [wIntroMovieSceneTimer]
	dec a
	ld [wIntroMovieSceneTimer], a
	cp $0
	ret nz
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

IntroMovie_LoadGFXForScene6: ; 8423 (2:4423)
	call ClearObjectAnimationBuffers
	ld bc, $38
	call IntroMovie_DoubleDecompressGFX
	lb bc, $0, $0
	ld e, $e
	ld a, $1
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $e
	ld a, $1
	call LoadStdBGMapAttrLayout_
	ld bc, $25
	call GetCGB_BGLayout_
	ld a, $4
	call StartFade_
	ld a, 160
	ld [wIntroMovieSceneTimer], a
	xor a
	ld [wc463], a
	ld a, $40
	ld [wSCX], a
	jp IncrementSubroutine

IntroMovie_ScrollScene6: ; 845c (2:445c)
	ld a, [wVBlankCounter]
	and $3
	ret nz
	ld a, [wSCX]
	dec a
	ld [wSCX], a
	cp $0
	ret nz
	ld a, 64
	ld [wIntroMovieSceneTimer], a
	jp IncrementSubroutine

IntroMovie_WaitScene6: ; 8474 (2:4474)
	ld a, [wIntroMovieSceneTimer]
	dec a
	ld [wIntroMovieSceneTimer], a
	cp $0
	ret nz
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	jp IncrementSubroutine

IntroMovie_Dummy: ; 848b (2:448b)
	ld a, $1f
	ld [wSubroutine], a
	ret

IntroMovie_ReturnToTitleScreen: ; 8491 (2:4491)
	call ClearObjectAnimationBuffers
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $1
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ld [wSCX], a
	ld [wSCY], a
	ld [wc46d], a
	ld [wc46c], a
	ld b, $0
	jp homecall_ret_2e562

IntroMovie_FadeOutInterrupt: ; 84b9 (2:44b9)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	jp IncrementSubroutine

IntroMovie_DoubleDecompressGFX: ; 84c6 (2:44c6)
	push bc
	call DecompressGFXByIndex_
	pop bc
	inc bc
	jp DecompressGFXByIndex_
