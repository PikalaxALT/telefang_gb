StatsScreen: ; 8b8b (2:4b8b)
	ld a, [wMoveAnimationSubroutine]
	jump_table
	dw StatsScreen_LoadGFX
	dw StatsScreen_LoadLayout
	dw StatsScreen_LoadCurDenjuuDescription
	dw StatsScreen_InitCursor
	dw StatsScreen_JoypadAction
	dw StatsScreen_WaitFadeOut
	dw LoadStatsScreen
	dw Func_8e98
	dw Func_8f1d

String_8ba7:
	db "せんとうわざ  "

UnknownMoveString:
	db "  ????  "

LandmarkNames:
	db "トロンコむら$" ; Toronko Village
	db "クリノンむら$" ; Kurinon Village
	db "うみのみえるまち イーリス$" ; The town with a view of the see - Iris
	db "パームかい$" ; Palm Sea
	db "キカイのまち フリジア$" ; Machine Town Freesia
	db "すなのまち バーラン$" ; Barran Desert
	db "イオンとう$" ; Ion Island
	db "パパルナこ$" ; Paparuna Lake
	db "パンセスむら$" ; Panses Village
	db "トリパむら$" ; Tripa Village
	db "フラウラむら$" ; Flaura Village
	db "あくまのやま ぺぺリやま$" ; Devil's Mountain: Peperi Mountain
	db "イクソスのもリ$" ; Ixos Forest
	db "カクトスいせき$" ; Cactos Ruins
	db "ブリオンいせき$" ; Burion Ruins
	db "トロンコむら すいげん$" ; Toronoko Village Spring
	db "クリノンむら ちか1かい$" ; Kurinon Village B1F
	db "クラフトけんきゅうじょ$" ; Craft Research Center
	db "ディメンザのやしき$" ; Dimenza's Mansion
	db "アンテナのき 1かい$" ; Antenna Tree 1F
	db "ぺぺリやま ふもと$" ; Peperi Mountain Foothills
	db "カクトスいせき$" ; Cactos Ruins

StatsScreen_LoadGFX: ; 8c81 (2:4c81)
	ld bc, $e
	call DecompressGFXByIndex_
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld bc, $16
	call GetCGB_BGLayout_
	ld a, $0
	call LoadBackgroundPalette
	ld a, $0
	call LoadUnknGfx090
	ld a, [wcb2b]
	cp $0
	jp z, Func_8cac
	call Func_8fe8
	jr asm_8cc7

Func_8cac: ; 8cac (2:4cac)
	ld a, [wd456]
	cp $0
	jr z, .asm_8cb8
	call Func_8fe8
	jr asm_8cc7

.asm_8cb8
	ld a, [wSubroutine]
	cp $1
	jr nz, .asm_8cc4
	call Func_9013
	jr asm_8cc7

.asm_8cc4
	call Func_8fe8
asm_8cc7
	ld a, [wCurDenjuu]
	push af
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	xor a
	ld [wcb30], a
	jp NextMoveAnimationSubroutine

StatsScreen_LoadLayout: ; 8cde (2:4cde)
	lb bc, $0, $0
	ld e, $1
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $1
	ld a, $0
	call LoadStdBGMapAttrLayout_
	jp NextMoveAnimationSubroutine

StatsScreen_LoadCurDenjuuDescription: ; 8cf5 (2:4cf5)
	ld a, [wCurDenjuu]
	ld de, VTilesBG tile $20
	call GetCurDenjuuKanjiDescription
	ld a, [wd499]
	call LoadButtonGFX_
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call ClearString
	ld a, [wd456]
	cp $1
	jr z, .battle
	ld a, [wSubroutine]
	cp $1
	jr z, .not_battle
.battle
	ld a, [wd496]
	ld hl, VTilesBG tile $30
	call PrintStringWithPlayerDenjuuAsBattleUser
	jr .got_name

.not_battle
	ld a, [wCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
.got_name
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
	call GetAndPrintName75CenterAlign
	call PrintCurDenjuuTypeName_
	call StatsScreen_PrintDenjuuMoveNames
	ld de, String_8ba7
	ld hl, VTilesShared tile $60
	ld b, $8
	call PlaceString_
	ld a, [wcb30]
	cp $0
	jr nz, .skip
	call LoadStatsScreenBGLayout
	call DrawStatsScreen_Page1
	call Func_904a
.skip
	ld a, [wcb30]
	add $2
	ld e, a
	lb bc, $0, $9
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $4
	call StartFade_
	jp NextMoveAnimationSubroutine

StatsScreen_InitCursor: ; 8d7a (2:4d7a)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wd456]
	cp $1
	jr z, @ + 2
	ld a, [wd4b0]
	cp $1
	jr z, .skip
	ld a, $20
	ld [wd4ee], a
	ld a, $d7
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $28
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $0
	ld [wSpriteInitYCoordBuffers + 0], a
	call InitBattleMenuCursor
	ld a, $0
	ld bc, $4
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
.skip
	jp NextMoveAnimationSubroutine

StatsScreen_JoypadAction: ; 8dbb (2:4dbb)
	ld a, [wVBlankCounter]
	and $3
	jr nz, .asm_8dc8
	ld hl, VTilesBG tile $1b
	call Func_17ef
.asm_8dc8
	ld a, [wd456]
	cp $1
	jr z, @ + 2
	ld a, [wd4b0]
	cp $1
	jr z, .check_right
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_down
	ld a, [wd415]
	cp $0
	jr z, .wrap_up
	dec a
	ld [wd415], a
	jr .play_up_down_sfx

.wrap_up
	ld a, [wd4b0]
	dec a
	ld [wd415], a
	jr .play_up_down_sfx

.check_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_right
	ld a, [wd4b0]
	ld b, a
	ld a, [wd415]
	inc a
	cp b
	jr z, .wrap_down
	ld [wd415], a
	jr .play_up_down_sfx

.wrap_down
	ld a, $0
	ld [wd415], a
.play_up_down_sfx
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, $7
	ld [wMoveAnimationSubroutine], a
	ret

.check_right
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, [wcb30]
	inc a
	cp $3
	jr nz, .wrap_right
	xor a
.wrap_right
	ld [wcb30], a
	jp .play_left_right_sfx

.check_left
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .check_a
	ld a, [wcb30]
	cp $0
	jr nz, .wrap_left
	ld a, $3
.wrap_left
	dec a
	ld [wcb30], a
.play_left_right_sfx
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, $6
	ld [wMoveAnimationSubroutine], a
	ret

.check_a
	ld a, [wcb2b]
	cp $0
	jp z, .check_b
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b
	ld a, $2
	ld [wcb2b], a
	jr .play_a_b_sfx

.check_b
	ld a, [wcb2b]
	cp $0
	jp z, .check_a_or_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_a_or_b
	ld a, SFX_04
	ld [H_SFX_ID], a
	jr .fade_out

.check_a_or_b
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
.play_a_b_sfx
	ld a, SFX_03
	ld [H_SFX_ID], a
.fade_out
	ld a, $4
	call StartFade_
	ld a, [wcb2b]
	cp $0
	jp nz, .wait_fade
	ld a, $1
	ld [wd43a], a
.wait_fade
	jp NextMoveAnimationSubroutine

Func_8e98: ; 8e98 (2:4e98)
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wLinkMode]
	cp $1
	jr z, .asm_8eb5
	ld a, [wSubroutine]
	cp $1
	jr nz, .asm_8eb5
	call Func_9013
	jr .asm_8eb8

.asm_8eb5
	call Func_8fe8
.asm_8eb8
	ld a, [wCurDenjuu]
	push af
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wCurDenjuu]
	ld de, VTilesBG tile $20
	call GetCurDenjuuKanjiDescription
	ld a, [wd499]
	call LoadButtonGFX_
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call ClearString
	ld a, [wSubroutine]
	cp $1
	jr nz, .asm_8eff
	ld a, [wCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
	jr .asm_8f08

.asm_8eff
	ld a, [wd496]
	ld hl, VTilesBG tile $30
	call PrintStringWithPlayerDenjuuAsBattleUser
.asm_8f08
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
	call GetAndPrintName75CenterAlign
	call PrintCurDenjuuTypeName_
	call StatsScreen_PrintDenjuuMoveNames
	jp NextMoveAnimationSubroutine

Func_8f1d: ; 8f1d (2:4f1d)
	lb bc, $1, $1
	ld e, $b9
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $6
	ld [wMoveAnimationSubroutine], a
	ret

StatsScreen_WaitFadeOut: ; 8f2d (2:4f2d)
	ld a, [wcb2b]
	cp $0
	jr nz, .wait_fade
	ld a, [wSubroutine]
	cp $1
	jr nz, .check_where_to_return
	ld a, [wLinkMode]
	cp $1
	jr z, .check_where_to_return
.wait_fade
	ld a, $1
	call PaletteFade_
	or a
	ret z
.check_where_to_return
	xor a
	ld [wMoveAnimationSubroutine], a
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wcb2b]
	cp $0
	jr z, .return_check_2
	ld a, [wSubroutine2]
	inc a
	ld [wSubroutine2], a
	ld a, $c ; InGamePhoneMenu
	ld [wGameRoutine], a
	ret

.return_check_2
	ld a, [wLinkMode]
	cp $1
	jr z, .link_mode_1
	cp $2
	jr z, .link_mode_2
	ld a, $6 ; StartBattle
	ld [wGameRoutine], a
	ld a, $0
	ld [wBattleSubroutine], a
	ret

.link_mode_1
	ld a, $f ; LinkMode
	ld [wGameRoutine], a
	ld a, $0
	ld [wd401], a
	ret

.link_mode_2
	ld a, $f ; LinkMode
	ld [wGameRoutine], a
	ld a, $0
	ld [wd401], a
	ret

LoadStatsScreen: ; 8f96 (2:4f96)
	call LoadStatsScreenBGLayout
	ld a, [wcb30]
	cp $0
	jr z, .asm_8fa6
	cp $1
	jr z, .asm_8fab
	jr .asm_8fb0

.asm_8fa6
	call LoadStatsScreen_Page1
	jr .asm_8fb3

.asm_8fab
	call LoadStatsScreen_Page2
	jr .asm_8fb3

.asm_8fb0
	call LoadStatsScreen_Page3
.asm_8fb3
	ld a, $4
	ld [wMoveAnimationSubroutine], a
	ret

Func_8fb9:
	enable_sram s1_b000
	ld de, wd000
	ld hl, s1_b000
	ld a, [wcb70]
	ld b, $0
	ld c, a
	sla c
	rl b
	sla c
	rl b
.asm_8fd7
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_8fd7
	disable_sram
	ret

Func_8fe8: ; 8fe8 (2:4fe8)
	ld hl, wd000
	ld d, $0
	ld a, [wd415]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd496], a
	call OpenSRAMBank2
	ld a, [wd496]
	ld hl, sAddressBook
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	inc hl
	ld a, [hl]
	ld [wd499], a
	call CloseSRAM
	ret

Func_9013: ; 9013 (2:5013)
	ld hl, wd5b6
	ld d, $0
	ld a, [wd415]
	ld b, a
	sla a
	add b
	ld e, a
	add hl, de
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	ld a, [hl]
	ld [wd499], a
	ret

LoadStatsScreenBGLayout: ; 902e (2:502e)
	ld a, [wcb30]
	add $2
	ld e, a
	lb bc, $0, $9
	ld a, $0
	call LoadStdBGMapLayout_
	ret

LoadStatsScreen_Page2: ; 903d (2:503d)
	jp LoadStatsScreen_Page2_

LoadStatsScreen_Page3: ; 9040 (2:5040)
	jp LoadStatsScreen_Page3_

LoadStatsScreen_Page1: ; 9043 (2:5043)
	call Func_904a
	call DrawStatsScreen_Page1
	ret

Func_904a: ; 904a (2:504a)
	call OpenSRAMBank2
	ld a, [wcb2b]
	cp $1
	jr z, .asm_9062
	ld a, [wd456]
	cp $1
	jr z, .asm_9062
	ld a, [wSubroutine]
	cp $2
	jr nz, .load_std_layout
.asm_9062
	ld hl, sAddressBook + 10
	ld a, [wd496]
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	hlbgcoord 4, 12
	call PrintPhoneNumber_
	jr .quit

.load_std_layout
	lb bc, $8, $c
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
.quit
	call CloseSRAM
	ret

Func_908a:
	ld bc, wCurDenjuuBuffer
	ld de, $16
	addntimes_hl_de
	ld d, $10
.copy
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .copy
	ret

Func_90a1:
	ld hl, wd000
	call Func_90b1
	inchlntimes
	ld a, [hl]
	ret

Func_90b1: ; 90b1 (2:50b1)
	ld a, [wd4a0]
	cp $0
	jr z, .skip_add
	ld b, a
	ld a, d
.add_3_times
	add $3
	dec b
	jr nz, .add_3_times
	ld d, a
.skip_add
	ld a, d
	ret

StatsScreen_PrintDenjuuMoveNames: ; 90c2 (2:50c2)
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE1
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $38
	call GetAndPrintName75LeftAlign_
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE2
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $40
	call GetAndPrintName75LeftAlign_
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .third_move_unknown
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $48
	call GetAndPrintName75LeftAlign_
	jr .done_third_move

.third_move_unknown
	ld de, UnknownMoveString
	ld hl, VTilesShared tile $48
	ld b, $8
	call PlaceString_
.done_third_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp MAX_LEVEL
	jr z, .no_last_move
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .fourth_move_unknown
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $50
	call GetAndPrintName75LeftAlign_
	jr .done_fouth_move

.fourth_move_unknown
	ld de, UnknownMoveString
	ld hl, VTilesShared tile $50
	ld b, $8
	call PlaceString_
.done_fouth_move
	ret

.no_last_move
	ld hl, VTilesShared tile $50
	ld a, $8
	call ClearString
	ret

LoadStatsScreen_Page3_: ; 916a (2:516a)
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE1
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE2
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .no_extra_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .no_extra_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
.no_extra_move
	ret

LoadStatsScreen_Page2_: ; 91c7 (2:51c7)
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 12
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 14
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 16
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 15, 12
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 15, 14
	ld c, $0
	call PrintDenjuuStat
	ret

DrawStatsScreen_Page1: ; 923b (2:523b)
	enable_sram sAddressBook
	ld a, [wCurDenjuuLevel]
	hlbgcoord 5, 15
	ld c, $1
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 5, 16
	ld c, $0
	call PrintDenjuuStat
	ld a, [wcb2b]
	cp $1
	jr z, .asm_927d
	ld a, [wd456]
	cp $1
	jr z, .asm_927d
	ld a, [wSubroutine]
	cp $2
	jp nz, Func_9289
.asm_927d
	ld a, [wd496]
	ld hl, sAddressBook + 2
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	jr asm_928b

Func_9289: ; 9289 (2:5289)
	ld a, $0
asm_928b
	hlbgcoord 14, 15
	ld c, DENJUU_HP
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	cp 99
	jp z, Func_92eb
	ld a, [wcb2b]
	cp $1
	jr z, .asm_92b1
	ld a, [wd456]
	cp $1
	jr z, .asm_92b1
	ld a, [wSubroutine]
	cp $2
	jp nz, Func_92eb
.asm_92b1
	ld a, [wd496]
	ld hl, sAddressBook + 4
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld c, a
	ld b, [hl]
	sra b
	rr c
	push bc
	pop hl
	bcbgcoord 11, 16
	call Func_14b1
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	sra b
	rr c
	push bc
	pop hl
	bcbgcoord 15, 16
	call Func_14b1
	jr asm_92ff

Func_92eb: ; 92eb (2:52eb)
	lb bc, $c, $10
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $10, $10
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
asm_92ff
	ret
