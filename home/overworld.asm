; All of these functions are executed in bank E

Func_2122::
	ld hl, VTilesOB
	ld de, RunOverworld
	ld bc, $180 tiles
	call Copy2bpp_2
	ld a, $a
	ld [wSubroutine], a
	ret

Func_2134::
	ld bc, $180
	ld hl, wc980
.erase
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .erase
	ld a, $0
	ld [wcd20], a
	ld a, $0
	ld [wNumIdleFrames], a
	ld a, $0
	ld [wcd21], a
	ld a, [wc92a]
	ld b, a
	ld a, [wc92b]
	ld c, a
	ld a, [wVBlankCounter]
	ld b, a
	ld a, [wOverworldRandomCounter]
	add b
	ld [wOverworldRandomCounter], a
	ld a, [wOverworldRandomSeed]
	add b
	ld [wOverworldRandomSeed], a
	homecall Func_a52b2
	ld a, $0
	ld [wFontPaletteMode], a
	call Func_24f6
	call Func_2264
	call Func_3252
	call ClearObjectAnimationBuffers
	homecall Func_c96ba
	callba Func_3d00e
	ld a, BANK(Func_3394e)
	ld [wPrevROMBank], a
	ld a, BANK(Func_3394e)
	rst Bankswitch
	call Func_3394e
	call Func_3395
	call Func_225b
	ld a, $4
	ld [wSubroutine], a
	ld b, $3
.loop
	push bc
	homecall RunMapScript
	call Func_236c
	homecall Func_30000
	pop bc
	dec b
	jr nz, .loop
	ld a, $0
	ld [wSubroutine], a
	jp IncrementSubroutine

Func_21db::
	ld a, $0
	ld [wc947], a
	ld [wcd20], a
	ld [wNumIdleFrames], a
	call Func_2264
	call Func_3255
	call Func_241e
	ld a, $0
	ld [wTextSubfunction], a
	ld [wOverworldIdleHUDPage], a
	ld [wcd21], a
	ld a, [wc900]
	cp $3
	jr nz, .asm_2213
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 14], a
	ld [wPlayerObjectStruct_Duration + 13], a
	ld a, $10
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $1
	ld [wc900], a
.asm_2213
	cp $8
	jr nz, .asm_221c
	ld a, $0
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
.asm_221c
	call Func_3395
	call Func_225b
	ld a, $ff
	ld [wc9f5], a
	call Func_31c5
	ld a, BANK(Func_30240)
	rst Bankswitch
	ld a, $ff
	ld [wca51], a
	call Func_30240
	ld a, $4
	ld [wSubroutine], a
	call Func_236c
	homecall Func_30000
	ld a, $1
	ld [wSubroutine], a
	homecall RunMapScript
	ret

Func_225b: ; 225b (0:225b)
	xor a
	ld [hJoyLast], a
	ld [hJoyNew], a
	ld [wJoyNew], a
	ret

Func_2264: ; 2264 (0:2264)
	call LoadTilesetRegisters
	ld a, $5e
	ld [wCurTilesetBank], a
	callba Func_2e0d2
	call Func_3388
	call Func_37d5
	ld a, $0
	ld [wc9de], a
	ld [wc935], a
	ld [wc91a], a
	ld a, [wMapGroup]
	cp $b
	jr nz, .asm_2296
	ld a, $1
	ld [wc9de], a
	ld a, $1
	ld [wc935], a
.asm_2296
	ld a, [wMapGroup]
	cp $32
	jr nc, .asm_22a6
	cp $2b
	jr c, .asm_22a6
	ld a, $1
	ld [wc9de], a
.asm_22a6
	call Func_35e0
	homecall Func_a4f6f, Func_a502a
	ld a, $0
	ld [wcad0], a
	ld a, $c
	ld [wPrevROMBank], a
	rst Bankswitch
	ld a, [wPlayerNameEntryBuffer]
	or a
	jp nz, Func_22d2
	ld hl, wPlayerNameEntryBuffer
	ld b, $20
	call Func_2f76
Func_22d2: ; 22d2 (0:22d2)
	call LoadMapScripts
	ld a, $e3
	ld [wLCDC], a
	ld a, $7
	ld [wWX], a
	ld a, $80
	ld [wWY], a
	ld a, $0
	ld [wc95a], a
	ld a, [wc912]
	ld [wd409], a
	call GetDenjuuSprite_
	ld a, [wd409]
	ld [wc9db], a
	xor a
	ld [wc952], a
	ld c, $8
	ld hl, wca48
.asm_2301
	ld [hli], a
	dec c
	jr nz, .asm_2301
	ld a, [wCurTilesetIdx]
	cp $4
	jr nz, .asm_231a
	ld bc, EVENT_COMPLETED_SCRIPT_048
	call CheckEventFlag
	ret z
	ld bc, EVENT_210
	call CheckEventFlag
	ret nz
.asm_231a
	call Func_3435
	ret

Func_231e::
	call Func_33a2
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine

Func_2329::
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $1
	ld [wcd20], a
	ld a, [wc958]
	or a
	jr z, .asm_234b
	ld a, [wMapGroup]
	ld [wWhichPhoneNumberSymbolCode], a
	callba Func_c99ac
	ret

.asm_234b
	ld a, $5
	call StartFade
	jp IncrementSubroutine

Func_2353::
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $0
	call PaletteFade
	or a
	ret z
	ld a, [wTextSubfunction]
	or a
	jp z, IncrementSubroutine
	ld a, $5
	ld [wSubroutine], a
	ret

Func_236c: ; 236c (0:236c)
	ld a, BANK(Func_38f8d)
	ld [wPrevROMBank], a
	ld a, [wPlayerObjectStruct_Duration + 19]
	ld b, a
	ld a, [wPlayerObjectStruct_XCoord]
	sub b
	ld [wPlayerObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_Duration + 20]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	sub b
	ld [wPlayerObjectStruct_YCoord], a
	homecall Func_38f8d
	ld a, [wSubroutine]
	cp $4
	jr nz, .asm_23bc
	ld a, [wPlayerObjectStruct_Duration + 19]
	ld b, a
	ld a, [wPlayerObjectStruct_XCoord]
	add b
	ld [wPlayerObjectStruct_XCoord], a
	ld a, [wPlayerObjectStruct_Duration + 20]
	ld b, a
	ld a, [wPlayerObjectStruct_YCoord]
	add b
	ld [wPlayerObjectStruct_YCoord], a
	homecall Func_30000
.asm_23bc
	rst MemBankswitch
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_23c3::
	call Func_23e2
	ld a, $6
	ld [wGameRoutine], a
	ld a, $0
	ld [wSubroutine], a
	ret

Func_23d1::
	call Func_2411
	call Func_23e2
	ld a, $c
	ld [wGameRoutine], a
	ld a, $0
	ld [wSubroutine], a
	ret

Func_23e2: ; 23e2 (0:23e2)
	ld a, [wPlayerObjectStruct_XCoord]
	ld [wc901], a
	ld a, [wPlayerObjectStruct_YCoord]
	ld [wc902], a
	ld a, $7
	ld [wWX], a
	ld a, $90
	ld [wWY], a
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wSCY], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_2411: ; 2411 (0:2411)
	homecall Func_2df1e
	ret

Func_241e: ; 241e (0:241e)
	homecall Func_2df55
	ret

Func_242b::
	homecall PrintText
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .asm_2464
	ld a, $4
	ld [wSubroutine], a
	ld a, [wc900]
	cp $4
	jr nz, .asm_2464
	ld a, $2
	ld [wcad0], a
	callba Func_2ccb9
	call Func_2411
	ld a, $24
	ld [wSubroutine], a
	ld a, $4
	jp StartFade

.asm_2464
	ret

Func_2465::
	homecall Func_c9875
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wCustomSpriteDest]
	cp $1
	jr nz, .asm_2481
	ld a, SFX_50
	ld [hSFX_ID], a
.asm_2481
	cp $ff
	ret nz
	ld a, [wWhichPhoneNumberSymbolCode]
	or a
	jr nz, .asm_24a5
	ld bc, $1
	call GetCGB_BGLayout_
	ld bc, $f
	call GetCGB_OBLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld [wWhichPhoneNumberSymbolCode], a
	call BlackDMGPals
	ret

.asm_24a5
	ld a, $0
	ld [wc917], a
	jp Func_23c3

Func_24ad::
	ld a, $1
	call PaletteFade
	or a
	ret z
	call LoadTilesetRegisters
	homecall Func_c981a
	ld a, $0
	ld [wSubroutine], a
	ret

Func_24c9::
	ld a, $1
	call PaletteFade
	or a
	ret z
	ld a, $0
	ld [wc917], a
	jp Func_23d1

Func_24d8::
	ld a, $1
	call PaletteFade
	or a
	ret z
	ld a, $b
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ld a, [wLCDC]
	res 5, a
	ld [wLCDC], a
	ld a, $0
	ld [wc917], a
	ret

