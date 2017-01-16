EvolveDenjuu: ; 7548f (1d:548f)
	ld a, [wd401]
	jump_table
	dw EvolveDenjuu_SetUpLayout
	dw EvolveDenjuu_WaitFadeIn
	dw EvolveDenjuu_WaitEvolvedText
	dw EvolveDenjuu_StartFadeOut
	dw EvolveDenjuu_WaitFadeOut
	dw EvolveDenjuu_ReturnFromEvolution
	dw EvolveDenjuu_SetUpCurDenjuuEvolution
	dw EvolveDenjuu_PlaceDenjuuOnBGMap
	dw EvolveDenjuu_LoadEvolvedFormNameAndDescription
	dw EvolveDenjuu_DrawEvolutionCompletedUIAndPrintEvolvedText
	dw EvolveDenjuu_SetInitialStateOfSequence
	dw EvolveDenjuu_RunEvolutionAnimation

EvolveDenjuu_SetUpLayout: ; 754b1 (1d:54b1)
	ld bc, $16
	call DecompressGFXByIndex_
	ld bc, $9
	call DecompressGFXByIndex_
	ld bc, $19
	call DecompressGFXByIndex_
	ld bc, $e
	call GetCGB_BGLayout_
	ld a, $28
	call LoadBackgroundPalette
	ld a, $4
	ld bc, $5
	call LoadNthStdBGPalette
	ld a, BANK(GFX_e1560)
	ld hl, VTilesOB tile $40
	ld de, GFX_e1560
	ld bc, $10 tiles
	call FarCopy2bpp_2
	ld a, $2
	ld bc, $1fe
	call LoadNthStdOBPalette
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	ld a, MUSIC_EVOLUTION
	call GetMusicBank
	ld [H_MusicID], a
	lb bc, $6, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $c
	ld hl, VTilesBG tile $10
	call ClearString
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

EvolveDenjuu_WaitFadeIn: ; 75534 (1d:5534)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $6
	ld [wd401], a
	ret

EvolveDenjuu_SetUpCurDenjuuEvolution: ; 75541 (1d:5541)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $b
	jr nz, .check_denjuu2
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	jr .go_ahead

.check_denjuu2
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $b
	jr nz, .check_denjuu3
	ld a, $1
	ld [BattleResults_CurBattleDenjuu], a
	jr .go_ahead

.check_denjuu3
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $b
	jr nz, .nope
	ld a, $2
	ld [BattleResults_CurBattleDenjuu], a
	jr .go_ahead

.nope
	ld a, $3
	ld [wd401], a
	ret

.go_ahead
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1Species
	call CopyNthDenjuuToBuffer
	ld a, [wCurDenjuuBufferSpecies]
	call CopyDenjuuSpeciesNameToUserNameBuffer
	ld a, [wCurDenjuuBuffer]
	ld de, VTilesBG tile $10
	call GetCurDenjuuKanjiDescription
	lb bc, $6, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wCurDenjuuBuffer]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	ld a, [wCurDenjuuBufferSpecies]
	ld [wCurDenjuu], a
	ld c, DENJUU_EVO_SPECIES
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	dec a
	push af
	ld c, $0
	ld de, VTilesBG tile $20
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal7
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wCurDenjuuBufferSpecies]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $58
	call GetAndPrintName75CenterAlign
	ld a, $0
	ld [wEvolutionTimer], a
	ld a, [wCurDenjuuBufferLevel]
	hlbgcoord 10, 2
	ld c, $1
	call Print2DigitBCD_2
	ld b, $0
	ld a, [wCurDenjuuStat]
	dec a
	ld c, a
	ld hl, DENJUU_DEX_CAUGHT_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld a, $7
	ld [wd401], a
	ret

EvolveDenjuu_PlaceDenjuuOnBGMap: ; 755f6 (1d:55f6)
	lb bc, 0, $4
	ld e, $a0
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, $5
	ld e, $92
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $a
	ld [wd401], a
	ret

EvolveDenjuu_SetInitialStateOfSequence: ; 75610 (1d:5610)
	ld a, $1
	ld [wc46c], a
	ld a, $1
	ld [wc46d], a
	ld hl, wc460
	ld a, $21
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld a, $5f
	ld [hli], a
	ld a, $0
	ld [wd4cf], a
	ld [hl], a
	ld a, $b
	ld [wd401], a
	ret

EvolveDenjuu_RunEvolutionAnimation: ; 75632 (1d:5632)
	call Func_75657
	cp $0
	jr z, .asm_75640
	ld a, $0
	ld [wd4cf], a
	jr .asm_75645

.asm_75640
	ld a, $80
	ld [wd4cf], a
.asm_75645
	ld a, [wd4cf]
	ld [wc463], a
	ld a, [wEvolutionTimer]
	cp $e6
	ret c
	ld a, $8
	ld [wd401], a
	ret

Func_75657: ; 75657 (1d:5657)
	ld c, $0
	ld a, [wEvolutionTimer]
	inc a
	ld [wEvolutionTimer], a
	cp $55
	jr nc, .asm_75669
	and $e
	jr z, .asm_7567b
	ret

.asm_75669
	cp $96
	jr nc, .asm_75672
	and $6
	jr z, .asm_7567b
	ret

.asm_75672
	cp $e6
	jr nc, .asm_7567b
	and $2
	jr z, .asm_7567b
	ret

.asm_7567b
	inc c
	ret

Func_7567d: ; 7567d (1d:567d)
	ld a, [wSubroutine]
	push af
	ld a, $4
	ld [wSubroutine], a
	callba Func_3079c
	pop af
	ld [wSubroutine], a
	ret

EvolveDenjuu_LoadEvolvedFormNameAndDescription: ; 75693 (1d:5693)
	ld a, [wCurDenjuuStat]
	dec a
	ld de, DenjuuNames
	ld bc, VTilesBG tile $58
	call GetAndPrintName75CenterAlign
	ld a, [wCurDenjuuStat]
	dec a
	ld de, VTilesBG tile $10
	call GetCurDenjuuKanjiDescription
	ld a, $9
	ld [wd401], a
	ret

EvolveDenjuu_DrawEvolutionCompletedUIAndPrintEvolvedText: ; 756b0 (1d:56b0)
	lb bc, 0, $4
	ld e, $a2
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $6, $5
	ld e, $a1
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $6, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wCurDenjuuStat]
	dec a
	ld de, $4000 ; overwritten
	call CopyDenjuuSpeciesNameToUserNameBuffer
	ld a, SFX_15
	ld [H_SFX_ID], a
	ld c, $1a
	call StdBattleTextBox
	ld a, $2
	ld [wd401], a
	ret

EvolveDenjuu_WaitEvolvedText: ; 756e8 (1d:56e8)
	call BattlePrintText
	ld a, [wVBlankCounter]
	and $3
	jr nz, .skip
	callba Func_33303
.skip
	call Func_7567d
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	call Func_757b4
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .asm_75718
	cp $1
	jr z, .asm_75736
	jr .asm_75751

.asm_75718
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $0
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [wCurDenjuuStat]
	dec a
	ld [wPlayerDenjuu1Species], a
	ld [hl], a
	ld [wc912], a
	jr .asm_7576a

.asm_75736
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld hl, sAddressBook + $0
	call GetNthAddressBookAttributeAddr
	ld a, [wCurDenjuuStat]
	dec a
	ld [wPlayerDenjuu2Species], a
	ld [hl], a
	jr .asm_7576a

.asm_75751
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld hl, sAddressBook + $0
	call GetNthAddressBookAttributeAddr
	ld a, [wCurDenjuuStat]
	dec a
	ld [wPlayerDenjuu3Species], a
	ld [hl], a
.asm_7576a
	ld a, $6
	ld [wd401], a
	ret

EvolveDenjuu_StartFadeOut: ; 75770 (1d:5770)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

EvolveDenjuu_WaitFadeOut: ; 75782 (1d:5782)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

EvolveDenjuu_ReturnFromEvolution: ; 75791 (1d:5791)
	ld a, $0
	ld [wc46c], a
	ld a, $0
	ld [wc46d], a
	ld hl, wc460
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [wd4cf], a
	ld [hl], a
	xor a
	ld [wd401], a
	jp NextBattleSubroutine

Func_757b4: ; 757b4 (1d:57b4)
	ld b, $c
	ld hl, wOAMAnimation01
	ld de, $20
	xor a
.asm_757bd
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_757bd
	ret

