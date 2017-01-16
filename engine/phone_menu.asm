TopPhoneMenu:
	ld a, [wSubroutine]
	jump_table
	dw Func_10054 ; 00
	dw Func_1006e ; 01
	dw Func_10089 ; 02
	dw Func_100bd ; 03
	dw Func_100ea ; 04
	dw Func_100fa ; 05
	dw Func_10108 ; 06
	dw Func_10113 ; 07
	dw TopPhone_JoypadAction ; 08
	dw TopPhone_ScrollDown1 ; 09
	dw TopPhone_ScrollDown2 ; 0a
	dw TopPhone_Scroll3 ; 0b
	dw TopPhone_ScrollUp1 ; 0c
	dw TopPhone_ScrollUp2 ; 0d
	dw TopPhone_Continue ; 0e
	dw TopPhone_NewGame ; 0f
	dw TopPhone_LoadTimeSetLayout ; 10
	dw TopPhone_SetTime ; 11
	dw TopPhone_BlankScreenAfterTimeSet ; 12
	dw TopPhone_LoadNameEntryLayout ; 13
	dw TopPhone_EnterPlayerName ; 14
	dw TopPhone_StorePlayerName ; 15
	dw TopPhone_FadeToGame ; 16
	dw TopPhone_InitGameState ; 17
	dw TopPhone_LoadSoundTest ; 18
	dw TopPhone_SoundTestJoypadAction ; 19
	dw Func_103b4 ; 1a
	dw Func_103e2 ; 1b
	dw Func_10400 ; 1c
	dw Func_1040e ; 1d
	dw Func_10424 ; 1e
	dw Func_1006e ; 1f
	dw Func_10452 ; 20
	dw Func_10546 ; 21
	dw Func_10558 ; 22
	dw Func_1056a ; 23
	dw Phone_Save ; 24

Func_10054: ; 10054 (4:4054)
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	xor a
	ld [wcb28], a
	ld [wPlayerNameEntryKeypadLayout], a
IF DEF(POWER)
	ld a, $0
ELSE
	ld a, $3
ENDC
	ld [wDShotLevel], a
	jp IncrementSubroutine

Func_1006e: ; 1006e (4:406e)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_13f51
	ld bc, $11
	call DecompressGFXByIndex_
	call Func_129c4
	call LoadPhoneKeypad
	jp IncrementSubroutine

Func_10089: ; 10089 (4:4089)
	ld a, $1
	ld [wdd06], a
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld e, $12
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	xor a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld [wDShotDialBufferSize], a
	ld [wcb3c], a
	ld a, $3
	ld [wcb3a], a
	jp IncrementSubroutine

Func_100bd: ; 100bd (4:40bd)
	ld a, $10
	ld [wDShotDialBufferSize], a
	ld b, $0
	ld a, [wSaveFileExists]
	cp $0
	jr z, .asm_100cd
	ld b, $3
.asm_100cd
	ld a, b
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, [wcb3f]
	cp $0
	jr z, .asm_100dd
	ld a, $2
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
.asm_100dd
	xor a
	ld [wcb3f], a
	ld [wPhoneCallSubroutine], a
	call Func_11927
	jp IncrementSubroutine

Func_100ea: ; 100ea (4:40ea)
	call Func_13a1e
	ld a, $a7
	ld [wWX], a
	ld a, $50
	ld [wSCX], a
	jp IncrementSubroutine

Func_100fa: ; 100fa (4:40fa)
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	jp IncrementSubroutine

Func_10108: ; 10108 (4:4108)
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10113: ; 10113 (4:4113)
	ld a, $e3
	ld [wLCDC], a
	xor a
	ld [wSCY], a
	ld a, [wSCX]
	sub $10
	ld [wSCX], a
	ld a, [wWX]
	sub $10
	ld [wWX], a
	cp $58
	ret nc
	ld a, $58
	ld [wWX], a
	xor a
	ld [wSCX], a
	jp IncrementSubroutine

TopPhone_JoypadAction: ; 1013b (4:413b)
	call Func_11913
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_up
	ld a, $9
	jr .scroll_sound

.check_up
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_a
	ld a, $c
.scroll_sound
	ld [wSubroutine], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.check_a
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, .no_action
	xor a
	ld [wcb3f], a
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $0
	jr z, .continue
	cp $3
	jp z, .new_game
	cp $1
	jr z, .sound
	cp $2
	jr z, .link
	ret

.link
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $1
	ld [wcb3f], a
	xor a
	ld [wSubroutine], a
	ld [wBattleSubroutine], a
	ld a, $f
	ld [wGameRoutine], a
	ret

.sound
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld bc, $104
	ld e, $3b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $18
	ld [wSubroutine], a
	jp SoundTest_UpdateMenuCursorPosition

.continue
	ld a, [wSaveFileExists]
	cp $1
	jr z, .no_game_to_load
	ld a, $4
	call StartFade_
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $10
	ld [wcf96], a
	ld a, $e
	ld [wSubroutine], a
	ret

.no_game_to_load
	ld a, SFX_05
	ld [H_SFX_ID], a
	ret

.new_game
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $f
	ld [wSubroutine], a
	xor a
	ld [wDShotDialBufferSize], a
	ld [wcb3a], a
	ret

.no_action: ; 101eb (4:41eb)
	ret

TopPhone_ScrollDown1: ; 101ec (4:41ec)
	ld e, $1e
	call Func_13f3f
	call Func_11799
	jp IncrementSubroutine

TopPhone_ScrollDown2: ; 101f7 (4:41f7)
	ld e, $1f
	call Func_13f3f
	lb bc, 3, 7
	call Func_11939
	jp IncrementSubroutine

TopPhone_Scroll3: ; 10205 (4:4205)
	ld e, $12
	call Func_13f3f
	lb bc, 3, 7
	call Func_11939
	ld a, $8
	ld [wSubroutine], a
	ret

TopPhone_ScrollUp1: ; 10216 (4:4216)
	ld e, $1f
	call Func_13f3f
	call Func_117c4
	jp IncrementSubroutine

TopPhone_ScrollUp2: ; 10221 (4:4221)
	ld e, $1e
	call Func_13f3f
	lb bc, 3, 6
	call Func_11939
	ld a, $b
	ld [wSubroutine], a
	ret

TopPhone_Continue: ; 10232 (4:4232)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wPlayerNameEntryKeypadLayout], a
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	call LoadGame_
	ld b, $1
	call homecall_ret_2e562
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ret

TopPhone_NewGame: ; 10265 (4:4265)
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, [wSaveFileExists]
	cp $0
	jr nz, .wont_delete_old_game
	ld bc, $d
	check_cgb
	jr z, .okay
	ld bc, $56
.okay
	call DecompressGFXByIndex_
	ld a, $1b
	ld [wSubroutine], a
	ret

.wont_delete_old_game
	jp IncrementSubroutine

TopPhone_LoadTimeSetLayout: ; 1028a (4:428a)
	ld bc, $104
	ld e, $14
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_12a4e
	ld a, $5
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wCurOptionHover], a
	call Func_1189e
	jp IncrementSubroutine

TopPhone_SetTime: ; 102aa (4:42aa)
	ld de, wOAMAnimation02
	call AnimateObject_
	jp SelectTime

TopPhone_BlankScreenAfterTimeSet: ; 102b3 (4:42b3)
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld b, $50
	ld c, $50
	ld de, wOAMAnimations
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call PhoneKeypadCursorPositionUpdate
	jp IncrementSubroutine

TopPhone_LoadNameEntryLayout: ; 102cd (4:42cd)
	ld hl, VTilesBG tile $78
	ld b, $8
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	xor a
	ld [wca65], a
	call Func_13fdf
	ld a, $78
	ld [wTextBoxStartTile], a
	xor a
	ld [wCurOptionHover], a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $1
	ld [wPlayerNameEntryKeypadLayout], a
	ld a, $ff
	ld [wcb66], a
	call Func_128ff
	ld a, $2
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $2
	ld [wcb28], a
	call LoadPhoneKeypad
	call InitPlayerNameEntryBuffers
	call RefreshPlayerNameBuffer
	ld bc, $104
	ld e, $35
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_1265a
	jp IncrementSubroutine

TopPhone_EnterPlayerName: ; 1031c (4:431c)
	ld de, wOAMAnimation02
	call AnimateObject_
	call Func_128ff
	jp PlayerName_JoypadAction

TopPhone_StorePlayerName: ; 10328 (4:4328)
	ld b, $9
	ld hl, wPlayerNameEntryBuffer2
	ld de, wPlayerName
.asm_10330
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_10330
	jp IncrementSubroutine

TopPhone_FadeToGame: ; 10339 (4:4339)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

TopPhone_InitGameState: ; 10346 (4:4346)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wPlayerNameEntryKeypadLayout], a
	ld [wFontPaletteMode], a
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wSubroutine], a
	ld b, $1
	call homecall_ret_2e562
	call ClearSRAM
	call DeleteSaveFile
	call InitCustomDMelo
	jp SetRTC

TopPhone_LoadSoundTest: ; 1037f (4:437f)
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $3
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	xor a
	ld [wSoundTestMusicID], a
	ld [wSoundTestSFXID], a
	ld [wSoundTestMenuCursor], a
	call SoundTest_UpdateMenuCursorPosition
	jp IncrementSubroutine

TopPhone_SoundTestJoypadAction: ; 103a5 (4:43a5)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	call AnimateObject_
	jp SoundTestJoypadAction

Func_103b4: ; 103b4 (4:43b4)
	ld bc, $1b
	check_cgb
	jr z, .asm_103c1
	ld bc, $55
.asm_103c1
	call DecompressGFXByIndex_
	ld e, $12
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	call Func_11927
	ld a, $8
	ld [wSubroutine], a
	ret

Func_103e2: ; 103e2 (4:43e2)
	ld bc, $104
	ld e, $5a
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wNumNotesInCurDMelo], a
	call Func_13cf4
	jp IncrementSubroutine

Func_10400: ; 10400 (4:4400)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_13c8f

Func_1040e: ; 1040e (4:440e)
	ld bc, $1b
	check_cgb
	jr z, .asm_1041b
	ld bc, $55
.asm_1041b
	call DecompressGFXByIndex_
	ld a, $10
	ld [wSubroutine], a
	ret

Func_10424: ; 10424 (4:4424)
	ld bc, $1b
	check_cgb
	jr z, .asm_10431
	ld bc, $55
.asm_10431
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld e, $12
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	call Func_11927
	ld a, $8
	ld [wSubroutine], a
	ret

Func_10452: ; 10452 (4:4452)
	ld bc, $17
	check_cgb
	jr z, .asm_1045f
	ld bc, $58
.asm_1045f
	call DecompressGFXByIndex_
	ld hl, VTilesBG tile $70
	ld b, $10
	call ClearTiles
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	ld bc, $104
	ld e, $3a
	call Phone_LoadStdBGMapTileAndAttrLayout
	xor a
	ld [wca65], a
	call Func_13fdf
	ld a, $78
	ld [wTextBoxStartTile], a
	call InitPlayerNameEntryBuffers
	xor a
	ld [wCurOptionHover], a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $ff
	ld [wcb66], a
	call Func_128ff
	ld a, $2
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $2
	ld [wcb28], a
	call LoadPhoneKeypad
	ld a, $1
	ld [wPlayerNameEntryKeypadLayout], a
	call Func_13a1e
	xor a
	ld [wBGPalUpdate], a
	ld a, $e3
	ld [wLCDC], a
	ld a, $58
	ld [wWX], a
	xor a
	ld [wWY], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $4
	ld [wPhoneKeypadCursorPosition], a
	call Func_12921
	call PhoneKeypadCursorPositionUpdate
	ld hl, VTilesBG tile $70
	ld b, $10
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	ld a, $70
	ld [wTextBoxStartTile], a
	ld a, [wRecruitedDenjuuSpecies]
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld d, $c
	call Func_11a80
	ld a, [wRecruitedDenjuuSpecies]
	call Func_13d46
	ld a, $c
	ld [wd411], a
	ld de, wOAMAnimation05
	call Func_0609
	ld a, $28
	ld [wOAMAnimation05_XCoord], a
	ld a, $40
	ld [wOAMAnimation05_YCoord], a
	ld a, $1
	ld [wOAMAnimation05_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation05_TemplateBank], a
	ld a, $78
	ld [wTextBoxStartTile], a
	call InitPlayerNameEntryBuffers
	ld a, [wFirstEmptySlotInAddressBook]
	call Func_13d8c
	call Func_127b7
	ld d, $c
	call RefreshPlayerNameBuffer
	call Func_1265a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_10546: ; 10546 (4:4546)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10558: ; 10558 (4:4558)
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation05
	call AnimateObject_
	call Func_12921
	jp Func_12582

Func_1056a: ; 1056a (4:456a)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wcf96], a
	ld a, [wFirstEmptySlotInAddressBook]
	call Func_13dca
	jp IncrementSubroutine

Phone_Save: ; 1057d (4:457d)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld [wPlayerNameEntryKeypadLayout], a
	ld [wFontPaletteMode], a
	ld a, [wcb3f]
	cp $0
	jr z, .asm_105b0
	ld b, $0
	call homecall_ret_2e562
	call SaveGame_
	xor a
	ld [wSubroutine], a
	ret

.asm_105b0
	ld b, $1
	call homecall_ret_2e562
	ld a, $5
	ld [wGameRoutine], a
	ld a, $a
	ld [wSubroutine], a
	ret

InGamePhoneMenu: ; 105c0 (4:45c0)
	ld a, [wSubroutine]
	jump_table
	dw InGamePhone_ClearInit
	dw InGamePhone_InitLayout
	dw InGamePhone_SetUpSwipeIn
	dw InGamePhone_PlayMusicAndUpdatePals
	dw InGamePhone_SwipeInDisplay
	dw InGamePhone_JoypadAction
	dw InGamePhone_Keypad
	dw InGamePhone_DelayBeforePlacingPhoneCall
	dw InGamePhone_DialManualNumber
	dw InGamePhone_WaitManualNumberDialSFX
	dw InGamePhone_ReturnToMainMenuAfterInvalidPhoneNumber
	dw InGamePhone_ScrollDown1
	dw InGamePhone_ScrollDown2
	dw InGamePhone_ScrollFinish
	dw InGamePhone_ScrollUp1
	dw InGamePhone_ScrollUp2
	dw InGamePhone_AddressBook
	dw InGamePhone_DMelo
	dw InGamePhone_Item
	dw InGamePhone_Mail
	dw InGamePhone_Save
	dw InGamePhone_Options
	dw InGamePhone_RecentCalls
	dw InGamePhone_Quit
	dw InGamePhone_Zukan
	dw InGamePhone_FadeOutKeypadToPhoneCall
	dw InGamePhone_LoadPhoneCallGFXAndFade
	dw InGamePhone_StartPhoneCallText
	dw InGamePhone_WaitPhoneCallText
	dw InGamePhone_FadeFromPhoneCallBackToMainMenu
	dw Func_109a8
	dw Func_109a9
	dw Func_109aa
	dw Func_109dc
	dw Func_109f3
	dw Func_10a09

InGamePhone_ClearInit: ; 10612 (4:4612)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_13a0b
	jp IncrementSubroutine

InGamePhone_InitLayout: ; 10621 (4:4621)
	call Func_13e27
	jp IncrementSubroutine

InGamePhone_SetUpSwipeIn: ; 10627 (4:4627)
	call Func_13a1e
	ld a, $a7
	ld [wWX], a
	xor a
	ld [wWY], a
	ld a, $50
	ld [wSCX], a
	xor a
	ld [wSCY], a
	call Func_119cd
	jp IncrementSubroutine

InGamePhone_PlayMusicAndUpdatePals: ; 10642 (4:4642)
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

InGamePhone_SwipeInDisplay: ; 10658 (4:4658)
	ld a, $e3
	ld [wLCDC], a
	xor a
	ld [wSCY], a
	ld a, [wSCX]
	sub $10
	ld [wSCX], a
	ld a, [wWX]
	sub $10
	ld [wWX], a
	cp $58
	ret nc
	ld a, $58
	ld [wWX], a
	ld a, $0
	ld [wSCX], a
	jp IncrementSubroutine

InGamePhone_JoypadAction: ; 10681 (4:4681)
	call Func_119b9
	call UpdatePhoneClockDisplay
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_up
	ld a, $b
	jr .scroll_action

.check_up
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_a
	ld a, $e
.scroll_action
	ld [wSubroutine], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.check_a
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b
	ld a, [wCurInGamePhoneMenuSelection]
	cp $0
	jr z, .address_book
	cp $1
	jr z, .redial
	cp $2
	jr z, .other
	cp $3
	jr z, .other
	cp $4
	jr z, .other
	cp $5
	jr z, .other
	cp $6
	jr z, .other
	cp $7
	jr z, .quit
	ld a, $18
	jr .launch

.redial
	ld a, $16
	jr .launch

.other
	add $f
	jr .launch

.address_book
	ld a, $10
.launch
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, SFX_03
	ld [H_SFX_ID], a
	ret

.check_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_select
.quit
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	ld a, $17
	ld [wSubroutine], a
	ret

.check_select
	ld a, [hJoyNew]
	and SELECT
	jr z, .no_action
	ld a, $4
	ld [wPhoneKeypadCursorPosition], a
	ld a, $ff
	ld [wcb66], a
	call PhoneKeypadCursorPositionUpdate
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld bc, $d
	ld hl, wDMeloBuffer
	call ClearMemory3
	ld bc, $d
	ld hl, wDMeloBufferBackup
	call ClearMemory3
	xor a
	ld [wEnteredAtLeastOneDigit], a
	ld [wcb43], a
	ld [wDShotDialBufferSize], a
	jp IncrementSubroutine

.no_action
	ret

InGamePhone_Keypad: ; 10743 (4:4743)
	ld a, [wEnteredAtLeastOneDigit]
	cp $0
	call z, UpdatePhoneClockDisplay
	ld a, [hJoyNew]
	and SELECT
	jr z, .check_dpad
	ld a, [wEnteredAtLeastOneDigit]
	cp $0
	jr z, .skip
.exit_keypad
	call Func_13e37
	lb bc, 3, 7
	call Func_119df
	call Func_135ef
.skip
	ld de, wOAMAnimation01
	call DeleteOAMAnimationStruct
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

.check_dpad
	call NavigatePhoneKeypad
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b
	call PlayPhoneKeypadCursorSFX
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	ret z
	cp $1
	ret z
	cp $2
	ret z
	cp $3
	jr nz, .number_button
	call TryPlacePhoneCall
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

.number_button
	ld a, [wEnteredAtLeastOneDigit]
	cp $0
	jr nz, .inject_number
	ld a, $1
	ld [wEnteredAtLeastOneDigit], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call InGamePhone_HideClockDisplay
.inject_number
	jp AppendDigitToPhoneNumber

.check_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .no_action
	ld a, [wDShotDialBufferSize]
	cp $0
	jr z, .exit_keypad
	dec a
	ld [wDShotDialBufferSize], a
	ld e, a
	ld d, $0
	ld hl, wDMeloBuffer
	add hl, de
	xor a
	ld [hl], a
	ld a, SFX_04
	ld [H_SFX_ID], a
	jp RefreshDialBufferDisplay

.no_action
	ret

InGamePhone_DelayBeforePlacingPhoneCall: ; 107d9 (4:47d9)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

InGamePhone_DialManualNumber: ; 107ee (4:47ee)
	ld a, $65 ; no call
	ld [H_SFX_ID], a
	ld a, [wcb43]
	cp $0
	jr z, .got_sfx
	ld a, $66 ; ring ring
	ld [H_SFX_ID], a
.got_sfx
	ld a, $80
	ld [wcb2c], a
	jp IncrementSubroutine

InGamePhone_WaitManualNumberDialSFX: ; 10807 (4:4807)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, [wcb43]
	cp $0
	jr z, .invalid
	ld a, $4
	call StartFade_
	ld a, $19
	ld [wSubroutine], a
	ret

.invalid
	jp IncrementSubroutine

InGamePhone_ReturnToMainMenuAfterInvalidPhoneNumber: ; 1082e (4:482e)
	call Func_13e37
	lb bc, 3, 7
	call Func_119df
	call Func_135ef
	ld de, wOAMAnimation01
	call DeleteOAMAnimationStruct
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

InGamePhone_ScrollDown1: ; 1084e (4:484e)
	call Func_13f38
	lb bc, 3, 6
	call Func_119df
	ld a, [wCurInGamePhoneMenuSelection]
	inc a
	cp $9
	jr nz, .asm_10860
	xor a
.asm_10860
	ld [wCurInGamePhoneMenuSelection], a
	jp IncrementSubroutine

InGamePhone_ScrollDown2: ; 10866 (4:4866)
	call Func_13f3d
	lb bc, 3, 8
	call Func_119df
	jp IncrementSubroutine

InGamePhone_ScrollFinish: ; 10872 (4:4872)
	ld e, $12
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	lb bc, 3, 7
	call Func_119df
	ld a, $5
	ld [wSubroutine], a
	ret

InGamePhone_ScrollUp1: ; 10883 (4:4883)
	call Func_13f3d
	lb bc, 3, 8
	call Func_119df
	ld a, [wCurInGamePhoneMenuSelection]
	dec a
	cp $ff
	jr nz, .asm_10896
	ld a, $8
.asm_10896
	ld [wCurInGamePhoneMenuSelection], a
	jp IncrementSubroutine

InGamePhone_ScrollUp2: ; 1089c (4:489c)
	call Func_13f38
	lb bc, 3, 6
	call Func_119df
	ld a, $d
	ld [wSubroutine], a
	ret

InGamePhone_Quit: ; 108ab (4:48ab)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wPhoneIsRinging], a
	ld a, $5
	ld [wGameRoutine], a
	ld a, $a
	ld [wSubroutine], a
	call Func_13e6e
	xor a
	ld [wcb2b], a
	ld [wFontPaletteMode], a
	ret

InGamePhone_FadeOutKeypadToPhoneCall: ; 108cb (4:48cb)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_135ef
	ld a, [wcb43]
	cp $1
	jr z, .asm_10904
	call Func_13b3a
	cp $0
	jr nz, .asm_108e9
	ld a, $20
	ld [wSubroutine], a
	ret

.asm_108e9
	ld a, [wcb01]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	ld [wcb01], a
	ld a, $3
	ld [wcb43], a
.asm_10904
	jp IncrementSubroutine

InGamePhone_LoadPhoneCallGFXAndFade: ; 10907 (4:4907)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call StartFade_
	call Func_13e6e
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	ld a, $2
	ld [wPhoneIsRinging], a
	jp IncrementSubroutine

InGamePhone_StartPhoneCallText: ; 10936 (4:4936)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call Func_13c53
	ld a, [wcb43]
	cp $3
	jr nz, .asm_1094b
	ld c, $fd
	ld b, $1
.asm_1094b
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine

InGamePhone_WaitPhoneCallText: ; 10953 (4:4953)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

InGamePhone_FadeFromPhoneCallBackToMainMenu: ; 10969 (4:4969)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wPhoneIsRinging], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb04]
	jp Func_13fb5

Func_109a8: ; 109a8 (4:49a8)
	ret

Func_109a9: ; 109a9 (4:49a9)
	ret

Func_109aa: ; 109aa (4:49aa)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_13c7e
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call StartFade_
	call Func_13e6e
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	ld a, $2
	ld [wPhoneIsRinging], a
	jp IncrementSubroutine

Func_109dc: ; 109dc (4:49dc)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wcb01]
	add $80
	ld c, a
	ld b, $1
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine

Func_109f3: ; 109f3 (4:49f3)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine

Func_10a09: ; 10a09 (4:4a09)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wPhoneIsRinging], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb01]
	call Func_13b79
	ret

InGamePhone_AddressBook: ; 10a49 (4:4a49)
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_10a86
	dw Func_10a9c
	dw Func_10ad6
	dw Func_10afc
	dw Func_10b92
	dw Func_10bbd
	dw Func_10bc0
	dw Func_10bce
	dw Func_10bf3
	dw Func_10c47
	dw Func_13f47
	dw Func_13f4e
	dw Func_10c4a
	dw Func_10c90
	dw Func_10cb4
	dw Func_10cc9
	dw Func_10d30
	dw Func_10d86
	dw Func_10dd3
	dw Func_10dec
	dw Func_10e37
	dw Func_10e45
	dw Func_10e59
	dw Func_10e5a

Func_10a86:
	call Func_1236b
	ld bc, $12
	check_cgb
	jr z, .asm_10a96
	ld bc, $57
.asm_10a96
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_10a9c:
	ld a, [wcd24]
	ld b, a
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp b
	jr nc, .asm_10aae
	ld a, [wcd24]
	dec a
	ld [wcd24], a
.asm_10aae
	ld a, [wcd24]
	call Func_12473
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, [wcd24]
	call Func_12473
	call GetDenjuuPalette_Pal7
.asm_10ac5
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wcd24]
	call Func_12473
	call Func_11a35
	jp IncrementSubroutine2

Func_10ad6:
	ld e, $2e
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13124
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_10afc:
	call Func_132d9
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr z, .asm_10b2f
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_10b2f
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	ld b, a
	ld a, [wcd24]
	cp b
	jr nz, .asm_10b20
	ld a, $ff
.asm_10b20
	inc a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.asm_10b2f
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr z, .asm_10b57
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_10b57
	ld a, [wcd24]
	cp $0
	jr nz, .asm_10b48
	ld a, [wLastDenjuuSeenOrCaught]
.asm_10b48
	dec a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.asm_10b57
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10b70
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, SFX_04
	ld [H_SFX_ID], a
	call Func_13fc6
	ld a, $a
	ld [wSubroutine2], a
	ret

.asm_10b70
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_10b91
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	xor a
	ld [wPhoneScreenCursorPosition], a
	call Func_13fc6
	ld a, $4
	call StartFade_
	ld a, $7
	ld [wSubroutine2], a
.asm_10b91
	ret

Func_10b92:
	ld bc, $1a
	check_cgb
	jr z, .asm_10b9f
	ld bc, $54
.asm_10b9f
	call DecompressGFXByIndex_
	ld e, $3e
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call Func_1329a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_10bbd:
	jp IncrementSubroutine2

Func_10bc0:
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_131a0

Func_10bce:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	call Func_136d2
	call ClearObjectAnimationBuffers
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld [wcb2b], a
	ld a, $9
	ld [wGameRoutine], a
	xor a
	ld [wMoveAnimationSubroutine], a
	ld [wFontPaletteMode], a
	ret

Func_10bf3:
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, [wcb2b]
	cp $1
	jr nz, .asm_10c3d
	ld bc, $12
	check_cgb
	jr z, .asm_10c2e
	ld bc, $57
.asm_10c2e
	call DecompressGFXByIndex_
	ld a, $1
	ld [wSubroutine2], a
	xor a
	ld [wcb2b], a
	jp Func_1236b

.asm_10c3d
	xor a
	ld [wcb2b], a
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10c47:
	jp Func_12b2b

Func_10c4a:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	call ClearObjectAnimationBuffers
	call Func_13e4c
	ld [wcb04], a
	call Func_13a30
	call Func_1371c
	call Func_13f15
	ld e, $1c
	lb bc, 6, 3
	ld a, $0
	call LoadStdBGMapLayout_
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call StartFade_
	ld a, $2
	ld [wPhoneIsRinging], a
	ld a, [wcb04]
	call Func_13fb5
	jp IncrementSubroutine2

Func_10c90:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	call Func_070c
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine2

Func_10cb4:
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld c, $fe
	ld b, $1
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine2

Func_10cc9:
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld bc, EVENT_SAID_YES
	call CheckEventFlag
	jr nz, .asm_10ce7
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $4
	call StartFade_
	jp IncrementSubroutine2

.asm_10ce7
	ld a, SFX_03
	ld [H_SFX_ID], a
	call GetPartnerDenjuuMaxHP_
	ld a, [wPartnerDenjuuHPRemaining]
	cp c
	jr nz, .asm_10d21
	call Func_13e4c
	ld b, a
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	cp b
	jr z, .asm_10d1d
	ld a, b
	ld [wAddressBookIndexOfPartnerDenjuu], a
	call Func_13a30
	ld [wc912], a
	ld a, $8
	ld [wPhoneCallSubroutine], a
	ld a, $4
	call StartFade_
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

.asm_10d1d
	ld c, $f0
	jr .asm_10d23

.asm_10d21
	ld c, $f1
.asm_10d23
	ld b, $1
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	ld a, $15
	ld [wSubroutine2], a
	ret

Func_10d30:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wPhoneIsRinging], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $12
	check_cgb
	jr z, .asm_10d4e
	ld bc, $57
.asm_10d4e
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld a, $1
	ld [wSubroutine2], a
	jp Func_1236b

Func_10d86:
	ld e, $58
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_13dea
	call Func_13907
	sla a
	sla a
	sla a
	add $38
	ld [wOAMAnimation03_YCoord], a
	ld a, $10
	ld [wOAMAnimation03_XCoord], a
	ld a, $1
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $d
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wPhoneScreenCursorPosition], a
	call Func_138e2
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_10dd3:
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $c
	ld [wcb2c], a
	jp Func_13816

Func_10dec:
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $1
	jr z, .asm_10e2e
	cp $0
	ret nz
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	check_cgb
	jr z, .asm_10e14
	ld bc, $54
	call DecompressGFXByIndex_
	ld bc, $57
	call DecompressGFXByIndex_
	jr .asm_10e20

.asm_10e14
	ld bc, $1a
	call DecompressGFXByIndex_
	ld bc, $12
	call DecompressGFXByIndex_
.asm_10e20
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $1
	ld [wSubroutine2], a
	ret

.asm_10e2e
	call Func_13fc6
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_10e37:
	ld de, wOAMAnimation02
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp Func_1396d

Func_10e45:
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wSubroutine2], a
	ret

Func_10e59:
	ret

Func_10e5a:
	ret

InGamePhone_DMelo: ; 10e5b (4:4e5b)
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw .DMelo1
	dw .DMeloGFX
	dw .DMeloInit
	dw .DMeloJoypad
	dw .ComposeDMelo
	dw Func_13f47
	dw Func_13f4e
	dw .DMeloUpdateNote

.DMelo1:
	jp IncrementSubroutine2

.DMeloGFX:
	ld bc, $13
	check_cgb
	jr z, .asm_10e88
	ld bc, $5a
.asm_10e88
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

.DMeloInit:
	ld e, $30
	call Phone_LoadPhoneScreenBGMap
	ld e, $35
	call Phone_LoadPhoneScreenAttrMap
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wPhoneKeypadCursorPosition], a
	ld [wPhoneScreenCursorPosition], a
	ld [wNumNotesInCurDMelo], a
	ld [wDMeloPage], a
	ld [wcb6a], a
	ld [wcb6b], a
	ld [wDShotPageTop], a
	ld [wDShotPageCursor], a
	ld a, $ff
	ld [wcb66], a
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call DrawDMeloMenu
	jp IncrementSubroutine2

.DMeloJoypad:
	ld de, wOAMAnimation02
	call AnimateObject_
	jp DMeloJoypadAction

.ComposeDMelo:
	jp ComposeDMelo

.DMeloUpdateNote:
	call DMeloUpdateNote
	ld a, $4
	ld [wSubroutine2], a
	ret

InGamePhone_Item: ; 10ee7 (4:4ee7)
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_10f06
	dw Func_10f3a
	dw Func_10f4d
	dw Func_10f82
	dw Func_1100c
	dw Func_11021
	dw Func_11022
	dw Func_13f47
	dw Func_13f4e

Func_10f06:
	xor a
	ld [wcb6f], a
	call Func_12279
	ld a, [wcb37]
	cp $0
	jr z, .asm_10f1b
	xor a
	ld [wcb6f], a
	jp IncrementSubroutine2

.asm_10f1b
	ld c, $43
	ld hl, VTilesBG tile $40
	call Func_0630
	ld b, $43
	call Func_122d6
	ld e, $31
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	xor a
	hlbgcoord 6, 16
	call Phone_Print2DigitBCD
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10f3a:
	ld a, [wcb6f]
	call GetS1B100PlusA
	ld c, b
	ld hl, VTilesBG tile $40
	call Func_0630
	call Func_122d0
	jp IncrementSubroutine2

Func_10f4d:
	ld a, [wcb6f]
	call GetS1B100PlusA
	ld a, b
	call Func_11a59
	ld e, $31
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	lb bc, 1, 13
	ld e, $2f
	ld a, $0
	call LoadStdBGMapLayout_
	call Func_127da
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	jp IncrementSubroutine2

Func_10f82:
	call Func_1336e
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_10fad
	ld a, [wcb37]
	dec a
	ld b, a
	ld a, [wcb6f]
	cp b
	jr nz, .asm_10f9e
	ld a, $ff
.asm_10f9e
	inc a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.asm_10fad
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_10fcd
	ld a, [wcb6f]
	cp $0
	jr nz, .asm_10fbe
	ld a, [wcb37]
.asm_10fbe
	dec a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ret

.asm_10fcd
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10fe6
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_13fc6
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_10fe6
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [wPhoneCallSubroutine], a
	ld a, [wcb6f]
	call GetS1B100PlusA
	ld a, b
	ld [wc90d], a
	ld a, $4
	call StartFade_
	call Func_13fc6
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

Func_1100c:
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11021:
	ret

Func_11022:
	ret

InGamePhone_Save: ; 11023 (4:5023)
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw .Init
	dw .Menu
	dw .Delay
	dw .ButtonPress
	dw Func_13f47
	dw Func_13f4e

.Init: ; 1103c (4:503c)
	ld e, $32
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	xor a
	ld [wPhoneScreenCursorPosition], a
	call Func_12352
	jp IncrementSubroutine2

.Menu: ; 11056 (4:5056)
	ld de, wOAMAnimation02
	call AnimateObject_
	jp Phone_SaveMenu_JoypadAction

.Delay: ; 1105f (4:505f)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld e, $34
	call Phone_LoadPhoneScreenBGMap
	jp IncrementSubroutine2

.ButtonPress: ; 11071 (4:5071)
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	jp IncrementSubroutine2

InGamePhone_Options: ; 1107e (4:507e)
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_1109b
	dw Func_110bb
	dw Func_110d6
	dw Phone_Options
	dw Func_110e8
	dw Func_110eb
	dw Func_13f47
	dw Func_13f4e

Func_1109b:
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $3
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	xor a
	ld [wCurOptionHover], a
	call OptionsMenu_UpdateCursorObjects
	jp IncrementSubroutine2

Func_110bb:
	ld bc, $5
	check_cgb
	jr z, .asm_110c8
	ld bc, $59
.asm_110c8
	call DecompressGFXByIndex_
	ld e, $17
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call UpdateOptionsScreen
	jp IncrementSubroutine2

Func_110d6:
	jp IncrementSubroutine2

Phone_Options:
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	call AnimateObject_
	jp OptionsMenuJoyAction

Func_110e8:
	jp IncrementSubroutine2

Func_110eb:
	jp IncrementSubroutine2

InGamePhone_RecentCalls:
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_11119
	dw Func_11133
	dw Func_11159
	dw Func_11177
	dw Func_111dd
	dw Func_111f3
	dw Func_111f6
	dw Func_1120c
	dw Func_11241
	dw Func_11265
	dw Func_11276
	dw Func_112d7
	dw Func_112d8
	dw Func_13f47
	dw Func_13f4e

Func_11119: ; 11119 (4:5119)
	xor a
	ld [wPhoneScreenCursorPosition], a
	ld [wNumNotesInCurDMelo], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	call Func_13fdf
	ld a, $40
	ld [wTextBoxStartTile], a
	jp IncrementSubroutine2

Func_11133: ; 11133 (4:5133)
	call Func_12f14
	ld a, [wNumNotesInCurDMelo]
	cp $0
	jr nz, .asm_1114b
	call Func_137a1
	ld e, $6
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_12f31
	jp IncrementSubroutine2

.asm_1114b
	ld hl, VTilesBG tile $40
	ld b, $4
	call ClearTiles
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_11159: ; 11159 (4:5159)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11167
	ld a, SFX_04
	ld [H_SFX_ID], a
	jp Func_11171

.asm_11167
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
Func_11171: ; 11171 (4:5171)
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_11177: ; 11177 (4:5177)
	ld bc, $1a
	check_cgb
	jr z, .asm_11184
	ld bc, $54
.asm_11184
	call DecompressGFXByIndex_
	ld e, $3c
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	lb bc, 1, 11
	ld e, $22
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wPhoneScreenCursorPosition]
	call PrintRecentCall
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, [wNumNotesInCurDMelo]
	cp $1
	jr nz, .asm_111da
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_111da
	jp IncrementSubroutine2

Func_111dd: ; 111dd (4:51dd)
	ld a, [wNumNotesInCurDMelo]
	cp $1
	jr z, .asm_111f0
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	call AnimateObject_
.asm_111f0
	jp Func_12f59

Func_111f3: ; 111f3 (4:51f3)
	jp Func_12b6c

Func_111f6: ; 111f6 (4:51f6)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	jp IncrementSubroutine2

Func_1120c: ; 1120c (4:520c)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_137df
	push af
	ld [wcb04], a
	call Func_137fa
	call Func_1371c
	pop af
	call Func_13f18
	ld e, $1c
	lb bc, 6, 3
	ld a, $0
	call LoadStdBGMapLayout_
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call StartFade_
	ld a, $2
	ld [wPhoneIsRinging], a
	jp IncrementSubroutine2

Func_11241: ; 11241 (4:5241)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wTextBoxStartTile], a
	call Func_070c
	ld d, $c
	call AnchorMapAndLoadTextPointer_
	jp IncrementSubroutine2

Func_11265: ; 11265 (4:5265)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $4
	call StartFade_
	jp IncrementSubroutine2

Func_11276: ; 11276 (4:5276)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wPhoneIsRinging], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld hl, VTilesBG tile $40
	ld b, $38
	call PhoneMenu_FillTilesWithHue01
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $1
	ld [wSubroutine2], a
	call Func_13fdf
	ld a, [wcb04]
	jp Func_13fb5

Func_112d7: ; 112d7 (4:52d7)
	ret

Func_112d8: ; 112d8 (4:52d8)
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_13fc6
	jp IncrementSubroutine2

InGamePhone_Mail:
	call UpdatePhoneClockDisplay
	ld a, [wSubroutine2]
	jump_table
	dw Func_11304
	dw Func_1132a
	dw Func_1133b
	dw Func_11370
	dw Func_113d6
	dw Func_113ec
	dw Func_113f4
	dw Func_1140c
	dw Func_13f47
	dw Func_13f4e

Func_11304: ; 11304 (4:5304)
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	xor a
	ld [wPhoneScreenCursorPosition], a
	ld [wNumNotesInCurDMelo], a
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	call Func_13fdf
	ld a, $40
	ld [wTextBoxStartTile], a
	xor a
	ld [wc90b], a
	jp IncrementSubroutine2

Func_1132a: ; 1132a (4:532a)
	ld e, $6
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_137a1
	call Func_12f3a
	call Func_12f31
	jp IncrementSubroutine2

Func_1133b: ; 1133b (4:533b)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11349
	ld a, SFX_04
	ld [H_SFX_ID], a
	jp Func_1136a

.asm_11349
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wNumNotesInCurDMelo]
	cp $0
	jr z, Func_1136a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld hl, VTilesBG tile $40
	ld b, $6
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	jp IncrementSubroutine2

Func_1136a: ; 1136a (4:536a)
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11370: ; 11370 (4:5370)
	ld bc, $1a
	check_cgb
	jr z, .asm_1137d
	ld bc, $54
.asm_1137d
	call DecompressGFXByIndex_
	ld e, $3d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	lb bc, 1, 11
	ld e, $22
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wPhoneScreenCursorPosition]
	call PrintMailMessageHeader
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, [wNumNotesInCurDMelo]
	cp $1
	jr nz, .asm_113d3
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_113d3
	jp IncrementSubroutine2

Func_113d6: ; 113d6 (4:53d6)
	ld a, [wNumNotesInCurDMelo]
	cp $1
	jr z, .asm_113e9
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	call AnimateObject_
.asm_113e9
	jp Func_13028

Func_113ec: ; 113ec (4:53ec)
	ld e, $57
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	jp IncrementSubroutine2

Func_113f4: ; 113f4 (4:53f4)
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld hl, VTilesBG tile $40
	ld b, $6
	call PhoneMenu_FillTilesWithHue01
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_1140c: ; 1140c (4:540c)
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_13fc6
	jp IncrementSubroutine2

INCLUDE "engine/denjuudex.asm"

SelectTime: ; 117ef (4:57ef)
	call Func_118dd
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_1181f
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wCurOptionHover]
	cp $0
	jr z, .asm_11815
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	jp IncrementSubroutine

.asm_11815
	ld a, [wCurOptionHover]
	inc a
	ld [wCurOptionHover], a
	jp Func_11910

.asm_1181f
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11837
	ld a, [wCurOptionHover]
	cp $0
	ret z
	ld a, SFX_04
	ld [H_SFX_ID], a
	xor a
	ld [wCurOptionHover], a
	jp Func_11910

.asm_11837
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_1186a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wCurOptionHover]
	cp $1
	jr z, .asm_1185a
	ld a, [wCurHours]
	cp 23
	jr nz, .asm_11853
	ld a, $ff
.asm_11853
	inc a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1185a
	ld a, [wCurMinutes]
	cp 59
	jr nz, .asm_11863
	ld a, $ff
.asm_11863
	inc a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1186a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_1189d
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wCurOptionHover]
	cp $1
	jr z, .asm_1188d
	ld a, [wCurHours]
	cp $0
	jr nz, .asm_11886
	ld a, 24
.asm_11886
	dec a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1188d
	ld a, [wCurMinutes]
	cp $0
	jr nz, .asm_11896
	ld a, 60
.asm_11896
	dec a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1189d
	ret

Func_1189e: ; 1189e (4:589e)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call TimeSet_PrintHours
	call TimeSet_PrintMinutes
	jp Func_118c4

TimeSet_PrintHours: ; 118ac (4:58ac)
	ld a, [wCurHours]
	call Get2DigitBCD
	hlbgcoord 2, 13
	jp Print2DigitBCD

TimeSet_PrintMinutes: ; 118b8 (4:58b8)
	ld a, [wCurMinutes]
	call Get2DigitBCD
	hlbgcoord 5, 13
	jp Print2DigitBCD

Func_118c4: ; 118c4 (4:58c4)
	ld b, $15
	ld a, [wCurOptionHover]
	cp $0
	jr z, .asm_118cf
	ld b, $2d
.asm_118cf
	ld c, $68
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_118dd: ; 118dd (4:58dd)
	ld a, [wVBlankCounter]
	and $f
	ret nz
	ld a, [wcb3d]
	xor $1
	ld [wcb3d], a
	cp $1
	jr z, .asm_118fc
	ld a, [wCurOptionHover]
	cp $0
	jr nz, .asm_118f9
	jp TimeSet_PrintHours

.asm_118f9
	jp TimeSet_PrintMinutes

.asm_118fc
	lb bc, 2, 13
	ld a, [wCurOptionHover]
	cp $0
	jr z, .asm_11909
	lb bc, 5, 13
.asm_11909
	ld e, $23
	ld a, $0
	jp LoadStdBGMapLayout_

Func_11910: ; 11910 (4:5910)
	jp Func_1189e

Func_11913: ; 11913 (4:5913)
	ld a, [wJoyNew]
	and D_UP | D_DOWN
	jr nz, asm_11932
	ld a, [wDShotDialBufferSize]
	cp $10
	ret z
	inc a
	ld [wDShotDialBufferSize], a
	cp $10
	ret nz
Func_11927: ; 11927 (4:5927)
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_11936

asm_11932
	xor a
	ld [wDShotDialBufferSize], a
Func_11936: ; 11936 (4:5936)
	lb bc, 3, 7
Func_11939: ; 11939 (4:5939)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	add $36
	call Func_119ac
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	inc a
	cp $4
	jr c, .asm_1194b
	sub $4
.asm_1194b
	add $36
	call Func_119ac
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	inc a
	inc a
	cp $4
	jr c, .asm_1195b
	sub $4
.asm_1195b
	add $36
	jp Func_119ac

Func_11960:
	ld a, [hJoyNew]
	and D_UP | D_DOWN
	jr nz, .asm_1197e
	ld a, [wDShotDialBufferSize]
	cp $10
	ret z
	inc a
	ld [wDShotDialBufferSize], a
	cp $10
	ret nz
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_11982

.asm_1197e
	xor a
	ld [wDShotDialBufferSize], a
Func_11982: ; 11982 (4:5982)
	lb bc, 3, 7
Func_11985: ; 11985 (4:5985)
	ld a, [wcb3a]
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	cp $4
	jr c, .asm_11997
	sub $4
.asm_11997
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	inc a
	cp $4
	jr c, .asm_119a7
	sub $4
.asm_119a7
	add $17
	jp Func_119ac

Func_119ac: ; 119ac (4:59ac)
	push bc
	ld e, a
	ld a, $0
	call LoadStdBGMapLayout_
	pop bc
	ld a, c
	add $3
	ld c, a
	ret

Func_119b9: ; 119b9 (4:59b9)
	ld a, [wJoyNew]
	and D_UP | D_DOWN
	jr nz, asm_119d8
	ld a, [wDShotDialBufferSize]
	cp $10
	ret z
	inc a
	ld [wDShotDialBufferSize], a
	cp $10
	ret nz
Func_119cd: ; 119cd (4:59cd)
	lb bc, 1, 9
	ld e, $13
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp Func_119dc

asm_119d8
	xor a
	ld [wDShotDialBufferSize], a
Func_119dc: ; 119dc (4:59dc)
	lb bc, 3, 7
Func_119df: ; 119df (4:59df)
	ld a, [wCurInGamePhoneMenuSelection]
	add $24
	call Func_119ac
	ld a, [wCurInGamePhoneMenuSelection]
	inc a
	cp $9
	jr c, .asm_119f1
	sub $9
.asm_119f1
	add $24
	call Func_119ac
	ld a, [wCurInGamePhoneMenuSelection]
	inc a
	inc a
	cp $9
	jr c, .asm_11a01
	sub $9
.asm_11a01
	add $24
	jp Func_119ac

ClearTiles: ; 11a06 (4:5a06)
; clear b tiles in VRAM
	push bc
	ld c, $10
.asm_11a09
	xor a
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a09
	pop bc
	dec b
	jr nz, ClearTiles
	ret

PhoneMenu_FillTilesWithHue02:
	ld d, $ff
	ld e, $0
	jr asm_11a20

PhoneMenu_FillTilesWithHue01: ; 11a1c (4:5a1c)
	ld d, $0
	ld e, $ff
asm_11a20
	push bc
	ld c, $8
.asm_11a23
	call WaitStat
	ld a, d
	ld [hli], a
	ld a, e
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a23
	pop bc
	dec b
	jr nz, asm_11a20
	ret

Func_11a35: ; 11a35 (4:5a35)
	ld [wNamedObjectIndexBuffer], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	xor a
	ld [wca65], a
	ld a, $78
	ld [wTextBoxStartTile], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld d, $c
	jp Func_11a80

Func_11a59: ; 11a59 (4:5a59)
	ld [wNamedObjectIndexBuffer], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	xor a
	ld [wca65], a
	ld a, $78
	ld [wTextBoxStartTile], a
	ld hl, ItemNames
	call Get8CharName0B
	ld d, $b
	jp Func_11a80

Func_11a80: ; 11a80 (4:5a80)
	push de
	ld hl, wPlayerNameEntryBuffer2
	ld b, $9
.asm_11a86
	ld a, "$"
	ld [hli], a
	dec b
	jr nz, .asm_11a86
	ld hl, wStringBuffer
	ld de, wPlayerNameEntryBuffer2
	call CenterAlignDenjuuName_
	pop de
	jp RefreshPlayerNameBuffer

DMelo_LoadBlankRingtone:
	xor a
	ld [wDMeloBuffer], a
	ld [wDMeloBuffer + $1], a
	ld bc, $1fe
	ld hl, wDMeloBuffer + $2
.loop
	ld a, $fe
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

ComposeDMelo: ; 11aaf (4:5aaf)
	call NavigatePhoneKeypad
	call PhoneMenu_UpdateVirtualScreenCursor
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .continue
	ld a, SFX_04
	ld [H_SFX_ID], a
	lb bc, 1, 6
	ld e, $30
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 1, 6
	ld e, $35
	ld a, $0
	call LoadStdBGMapAttrLayout_
	call StopRingtone
	call Func_11ee9
	ld a, $3
	ld [wSubroutine2], a
	ld a, $ff
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call DrawDMeloMenu
	xor a
	ld [wcb28], a
	jp LoadPhoneKeypad

.continue
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .no_a_button
	call PlayPhoneKeypadCursorSFX
	ld a, $7
	ld [wSubroutine2], a
	ret

.no_a_button
	ld a, [hJoyNew]
	and SELECT
	jr z, .no_joypad
	ld b, $0
	ld a, [wcb28]
	cp $0
	jr nz, .toggle
	ld b, $3
.toggle
	ld a, b
	ld [wcb28], a
	call LoadPhoneKeypad
.no_joypad
	ret

Func_11b21:
	call Func_13f51
	jp IncrementSubroutine2

Func_11b27:
	call Func_13e37
	call Func_119cd
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

NavigatePhoneKeypad: ; 11b37 (4:5b37)
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, SFX_63
	ld [H_SFX_ID], a
	ld a, [wPhoneKeypadCursorPosition]
	cp $3
	jr nz, .check_wrap_right
	xor a
	jr .update_right

.check_wrap_right
	cp $6
	jr z, .wrap_right
	cp $9
	jr z, .wrap_right
	cp $c
	jr z, .wrap_right
	cp $f
	jr z, .wrap_right
	jr .no_wrap_right

.wrap_right
	sub $3
.no_wrap_right
	inc a
.update_right
	ld [wPhoneKeypadCursorPosition], a
	jp PhoneKeypadCursorPositionUpdate

.check_left
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .check_up
	ld a, SFX_63
	ld [H_SFX_ID], a
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	jr nz, .check_wrap_left
	ld a, $3
	jr .update_left

.check_wrap_left
	cp $4
	jr z, .wrap_left
	cp $7
	jr z, .wrap_left
	cp $a
	jr z, .wrap_left
	cp $d
	jr z, .wrap_left
	jr .no_wrap_left

.wrap_left
	adc $3
.no_wrap_left
	dec a
.update_left
	ld [wPhoneKeypadCursorPosition], a
	jp PhoneKeypadCursorPositionUpdate

.check_up
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_down
	ld a, SFX_63
	ld [H_SFX_ID], a
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	jr nz, .check_up_1
	ld a, $d
	jr .update_up

.check_up_1
	cp $1
	jr nz, .check_up_2
	ld a, $e
	jr .update_up

.check_up_2
	cp $2
	jr nz, .check_up_3
	ld a, $e
	jr .update_up

.check_up_3
	cp $3
	jr nz, .check_up_4
	ld a, $f
	jr .update_up

.check_up_4
	cp $4
	jr nz, .default_up
	ld a, $0
	jr .update_up

.default_up
	sub $3
	and $f
.update_up
	ld [wPhoneKeypadCursorPosition], a
	jp PhoneKeypadCursorPositionUpdate

.check_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .no_dpad
	ld a, SFX_63
	ld [H_SFX_ID], a
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	jr nz, .check_down_1
	ld a, $4
	jr .update_down

.check_down_1
	cp $1
	jr nz, .check_down_2
	ld a, $5
	jr .update_down

.check_down_2
	cp $2
	jr nz, .check_down_3
	ld a, $5
	jr .update_down

.check_down_3
	cp $3
	jr nz, .check_down_4
	ld a, $6
	jr .update_down

.check_down_4
	cp $f
	jr nz, .default_down
	ld a, $3
	jr .update_down

.default_down
	adc $2
	and $f
.update_down
	ld [wPhoneKeypadCursorPosition], a
	jp PhoneKeypadCursorPositionUpdate

.no_dpad
	ret

DMeloUpdateNote:
	ld a, [wPhoneKeypadCursorPosition]
	jump_table
	dw .Test
	dw .RecessPointer
	dw .AdvancePointer
	dw .SaveMelo
	dw .AddNote ; do
	dw .AddNote ; re
	dw .AddNote ; mi
	dw .AddNote ; fa
	dw .AddNote ; sol
	dw .AddNote ; la
	dw .AddNote ; ti
	dw .ToggleTempo
	dw .Delete
	dw .LengthDown
	dw .Rest
	dw .LengthUp

.Test: ; 11c47 (4:5c47)
	ld a, [wRingtoneID]
	cp $0
	jr nz, .something_playing
	ld a, $4f | $80
	ld [H_Ringtone], a
	ld a, BANK(DMeloUpdateNote)
	ld [wMusicBank], a
	ret

.something_playing
	jp StopRingtone

.RecessPointer: ; 11c5c (4:5c5c)
	ld a, [wDMeloPage]
	cp $0
	jr nz, .okay_recess
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr nz, .okay_recess
	ret

.okay_recess
	ld a, [wPhoneScreenCursorPosition]
	dec a
	and $f
	ld [wPhoneScreenCursorPosition], a
	cp $f
	jr nz, .same_page_recess
	ld a, [wDMeloPage]
	cp $0
	jr nz, .prev_page_recess
.same_page_recess
	ld a, $ff
	ld [wcb66], a
	jp PhoneMenu_UpdateVirtualScreenCursor

.prev_page_recess
	dec a
	ld [wDMeloPage], a
	ld a, $ff
	ld [wcb66], a
	call PhoneMenu_UpdateVirtualScreenCursor
	call UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo
	call Func_121bf
	call Func_121fd
	jp Func_072f

.AdvancePointer: ; 11c9f (4:5c9f)
	ld a, [wDMeloPage]
	cp $e
	jr nz, .okay_advance
	ld a, [wPhoneScreenCursorPosition]
	cp $f
	jr nz, .okay_advance
	ret

.okay_advance
	ld a, [wPhoneScreenCursorPosition]
	inc a
	and $f
	ld [wPhoneScreenCursorPosition], a
	jr nz, .same_page_advance
	ld a, [wDMeloPage]
	cp $e
	jr z, .same_page_advance
	inc a
	and $f
	ld [wDMeloPage], a
	xor a
	ld [wPhoneScreenCursorPosition], a
	ld a, $ff
	ld [wcb66], a
	call PhoneMenu_UpdateVirtualScreenCursor
	call UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo
	call Func_121bf
	call Func_121fd
	jp Func_072f

.same_page_advance
	ld a, $ff
	ld [wcb66], a
	call PhoneMenu_UpdateVirtualScreenCursor
	jp Func_072f

.SaveMelo: ; 11ce9 (4:5ce9)
	jp DMelo_SaveRingtone

.AddNote: ; 11cec (4:5cec)
	ld a, [wPhoneKeypadCursorPosition]
	sub $4
	jp DMelo_AddNoteToBuffer

.Rest: ; 11cf4 (4:5cf4)
	ld a, $7
	jp DMelo_AddNoteToBuffer

.LengthUp: ; 11cf9 (4:5cf9)
	call DMelo_GetCurrentNoteAddr
	inc hl
	ld a, [hl]
	inc a
	push af
	and $7
	cp $5
	jr nz, .asm_11d0b
	pop af
	ld a, [hl]
	and $f0
	push af
.asm_11d0b
	pop af
	ld [hl], a
	jp Func_072f

.LengthDown: ; 11d10 (4:5d10)
	call DMelo_GetCurrentNoteAddr
	inc hl
	ld a, [hl]
	push af
	and $7
	cp $0
	jr nz, .asm_11d24
	pop af
	ld a, [hl]
	and $f0
	add $4
	jr .asm_11d26

.asm_11d24
	pop af
	dec a
.asm_11d26
	ld [hl], a
	jp Func_072f

.ToggleTempo: ; 11d2a (4:5d2a)
	ld a, [wDMeloBuffer + $1]
	xor $1
	ld [wDMeloBuffer + $1], a
	jp Func_121fd

.Delete: ; 11d35 (4:5d35)
	call DeleteNoteFromDMeloBuffer
	ld a, $ff
	ld [wcb66], a
	jp Func_072f

PhoneKeypadCursorPositionUpdate: ; 11d40 (4:5d40)
	ld hl, Data_11d5e
	ld a, [wPhoneKeypadCursorPosition]
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld de, wOAMAnimation01
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_11d5e:
	db $68, $28 ; note
	db $78, $28 ; left
	db $88, $28 ; right
	db $98, $28 ; OK
	db $68, $40 ; 1
	db $80, $40 ; 2
	db $98, $40 ; 3
	db $68, $50 ; 4
	db $80, $50 ; 5
	db $98, $50 ; 6
	db $68, $60 ; 7
	db $80, $60 ; 8
	db $98, $60 ; 9
	db $68, $70 ; *
	db $80, $70 ; 0
	db $98, $70 ; #

PhoneMenu_UpdateVirtualScreenCursor: ; 11d7e (4:5d7e)
	ld hl, Data_11dab
	ld a, [wPhoneScreenCursorPosition]
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $a
	ld [wOAMAnimation02_TemplateIdx], a
	ld de, wOAMAnimation02
	call Func_11781
	ld a, [wVBlankCounter]
	and $f
	jr nz, .asm_11da5
	ld a, [wOAMAnimation02_PriorityFlags]
	xor $1
	ld [wOAMAnimation02_PriorityFlags], a
.asm_11da5
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_11dab:
	db $10, $38
	db $20, $38
	db $30, $38
	db $40, $38
	db $10, $48
	db $20, $48
	db $30, $48
	db $40, $48
	db $10, $58
	db $20, $58
	db $30, $58
	db $40, $58
	db $10, $68
	db $20, $68
	db $30, $68
	db $40, $68

DMelo_AddNoteToBuffer: ; 11dcb (4:5dcb)
	ld [wcb20], a
	call DMelo_GetCurrentNoteAddr
	ld a, [wcb66]
	ld b, a
	ld a, [wPhoneKeypadCursorPosition]
	cp b
	jp z, .UpdateCurrentNote
	ld a, [wNumNotesInCurDMelo]
	cp $f0
	ret z
	ld a, [wcb66]
	cp $ff
	jr z, .check_empty_slot
	ld a, [wPhoneScreenCursorPosition]
	inc a
	and $f
	ld [wPhoneScreenCursorPosition], a
	jr nz, .same_page
	ld a, [wDMeloPage]
	inc a
	and $f
	ld [wDMeloPage], a
	cp $f
	jr nz, .new_page
	ld a, $f
	ld [wPhoneScreenCursorPosition], a
	ld a, $e
	ld [wDMeloPage], a
	ret

.new_page
	lb bc, 1, 6
	ld e, $30
	ld a, $0
	call LoadStdBGMapLayout_
	call Func_121bf
	call Func_121fd
.same_page
	call Func_11efa
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	push af
	call DMelo_GetCurrentNoteAddr
	pop af
	ld [hli], a
	ld a, $2
	ld [hl], a
	call Func_072f
	ld a, [wPhoneKeypadCursorPosition]
	ld [wcb66], a
	call PhoneMenu_UpdateVirtualScreenCursor
	jp UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo

.check_empty_slot
	push hl
	ld a, [hl]
	cp $fe
	jr z, .empty_slot
	call Func_11efa
	pop hl
	push hl
.empty_slot
	inc hl
	ld a, $2
	jr .load_note_from_table

.UpdateCurrentNote: ; 11e54 (4:5e54)
	push hl
	inc hl
	ld a, [hl]
	add $10
	cp $60
	jr c, .load_note_from_table
	ld a, [hl]
	and $7
.load_note_from_table
	ld [hl], a
	swap a
	and $f
	push af
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	call Func_072f
	ld a, [wPhoneKeypadCursorPosition]
	ld [wcb66], a
	jp UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo

Data_11e86:
	dw Data_11e96
	dw Data_11e9c
	dw Data_11ea2
	dw Data_11ea8
	dw Data_11eae
	dw Data_11eb4
	dw Data_11eba
	dw Data_11ec0

	;  1nat 1shp 0nat 0shp 2nat 2shp
Data_11e96:
	db $01, $11, $02, $12, $00, $10 ; C
Data_11e9c:
	db $21, $31, $22, $32, $20, $30
Data_11ea2:
	db $41, $42, $40, $41, $42, $40
Data_11ea8:
	db $51, $61, $52, $62, $50, $60
Data_11eae:
	db $71, $81, $72, $82, $70, $80
Data_11eb4:
	db $91, $a1, $92, $a2, $90, $a0
Data_11eba:
	db $b1, $b2, $b0, $b1, $b2, $b0
Data_11ec0:
	db $c0, $c0, $c0, $c0, $c0, $c0

DMelo_GetCurrentNoteAddr: ; 11ec6 (4:5ec6)
	ld a, [wDMeloPage]
	swap a
	and $f0
	ld b, a
	ld a, [wPhoneScreenCursorPosition]
	add b
	ld hl, wDMeloBuffer + $2
	jp Rom4_PointToWordInTable

DeleteNoteFromDMeloBuffer: ; 11ed8 (4:5ed8)
	call DMelo_GetCurrentNoteAddr
	ld a, [hl]
	cp $fe
	jr z, .end_of_buffer
	call DeleteNoteAndShiftRemainderBack
	jp UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo

.end_of_buffer
	jp DeleteNoteAndShiftRemainderBack

Func_11ee9: ; 11ee9 (4:5ee9)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld de, wOAMAnimation01
	call DeleteOAMAnimationStruct
	ld de, wOAMAnimation02
	jp DeleteOAMAnimationStruct

Func_11efa: ; 11efa (4:5efa)
	call DMelo_GetCurrentNoteAddr
	ld a, l
	cp wd1e0 % $100
	jr nz, .buffer_not_full
	ld a, h
	cp wd1e0 / $100
	jr nz, .buffer_not_full
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.buffer_not_full
	push hl
	ld hl, wDMeloBuffer
	ld de, wDMeloBufferBackup
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	pop hl
	ld a, $fe
	ld [hli], a
	ld [hli], a
.loop
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp wd1e2 % $100
	jr nz, .loop
	ld a, h
	cp wd1e2 / $100
	jr nz, .loop
	ret

DeleteNoteAndShiftRemainderBack: ; 11f37 (4:5f37)
	call DMelo_GetCurrentNoteAddr
	ld a, l
	cp wd1e0 % $100
	jr nz, .delete
	ld a, h
	cp wd1e0 / $100
	jr nz, .delete
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.delete
	push hl
	ld hl, wDMeloBuffer
	ld de, wDMeloBufferBackup
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	inc de
	inc de
	pop hl
.loop
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp wd1e0 % $100
	jr nz, .loop
	ld a, h
	cp wd1e0 / $100
	jr nz, .loop
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

DMelo_LoadRingtone:
	ld b, BANK(sDMelo)
	call Rom4_GetSRAMBankB
	ld a, [wDShotPageTop]
	ld b, a
	ld a, [wDShotPageCursor]
	add b
	sub $47 ; Orijinaru 01
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, sDMelo
	add hl, de
	ld a, [hl]
	cp $1
	jr z, .load_ringtone
	jp DMelo_LoadBlankRingtone

.load_ringtone
	ld a, [wDShotPageTop]
	ld b, a
	ld a, [wDShotPageCursor]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, sDMelo
	add hl, de
	ld de, wDMeloBuffer
	ld bc, $200
	call CopyData
	call Rom4_CloseSRAM
	jp CountSizeOfDMeloBuffer

DMelo_SaveRingtone: ; 11fbc (4:5fbc)
	ld a, $1
	ld [wDMeloBuffer], a
	ld b, BANK(sDMelo)
	call Rom4_GetSRAMBankB
	ld a, [wDShotPageTop]
	ld b, a
	ld a, [wDShotPageCursor]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, sDMelo
	add hl, de
	push hl
	pop de
	ld hl, wDMeloBuffer
	ld bc, $200
	call CopyData
	jp Rom4_CloseSRAM

DrawDMeloMenu: ; 11fe9 (4:5fe9)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, [wDShotPageCursor]
	and $7
	sla a
	sla a
	sla a
	add $50
	ld [wOAMAnimation02_YCoord], a
	xor a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld [wOAMAnimation03_XCoord], a
	ld [wOAMAnimation04_XCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld [wOAMAnimation04_YCoord], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld [wOAMAnimation04_TemplateBank], a
	ld b, $6
	ld a, [wDShotPageTop]
	debgcoord 2, 10
.loop
	push af
	ld c, a
	cp $47
	jr nc, .original
	xor a
	jr .got_whether_original

.original
	ld a, $1
.got_whether_original
	push bc
	push de
	call PrintDMeloSelectionMenuOption
	pop de
	pop bc
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop af
	inc a
	dec b
	jr nz, .loop
	ret

PrintDMeloSelectionMenuOption: ; 1204e (4:604e)
	push de
	push bc
	push de
	ld hl, Data_1207d
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ld b, $5
.loop
	di
	ld a, [hli]
	call WaitStat
	ld [de], a
	ei
	inc de
	dec b
	jr nz, .loop
	pop bc
	ld a, c
	cp $47
	jr c, .got_whether_original
	sub $47
.got_whether_original
	inc a
	ld c, a
	call Get2DigitBCD
	pop de
	ld hl, $5
	add hl, de
	jp DMelo_Print2DigitBCD

Data_1207d:
	dw Data_12081
	dw Data_12086

Data_12081:
	db $60, $61, $62, $63, $52 ; MELODY
Data_12086:
	db $64, $65, $66, $67, $52 ; ORIGINAL

DMeloJoypadAction: ; 1208b (4:608b)
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_down
	call StopRingtone
	ld a, [wDShotPageCursor]
	cp $0
	jr nz, .d_melo_menu_up
	ld a, [wDShotPageTop]
	cp $0
	ret z
	ld a, [wDShotPageTop]
	dec a
	ld [wDShotPageTop], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.d_melo_menu_up
	dec a
	ld [wDShotPageCursor], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.check_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_b
	call StopRingtone
	ld a, [wDShotPageCursor]
	cp $5
	jr nz, .d_melo_menu_down
	ld a, [wDShotPageTop]
	cp $49
	ret z
	ld a, [wDShotPageTop]
	inc a
	ld [wDShotPageTop], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.d_melo_menu_down
	inc a
	ld [wDShotPageCursor], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.check_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_a
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	call StopRingtone
	call Func_11ee9
	ld a, MUSIC_DSHOT_MENU
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine2], a
	ret

.check_a
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_right
	ld a, [wDShotPageTop]
	ld b, a
	ld a, [wDShotPageCursor]
	add b
	ld [wcb20], a
	cp $47
	jr nc, .original
	ld a, [wRingtoneID]
	cp $0
	jr z, .play_std
	call StopRingtone
.play_std
	ld a, [wcb20]
	add $81
	ld [H_Ringtone], a
	ld a, $4
	ld [wMusicBank], a
	ret

.original
	ld e, $30
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	xor a
	ld [wPhoneScreenCursorPosition], a
	ld [wDMeloPage], a
	ld a, $4
	ld [wPhoneKeypadCursorPosition], a
	ld a, $ff
	ld [wcb66], a
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	call DMelo_LoadRingtone
	call Func_072f
	call PhoneKeypadCursorPositionUpdate
	call UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo
	call Func_121bf
	call Func_121fd
	jp IncrementSubroutine2

.check_right
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, [wDShotPageTop]
	add $6
	cp $47
	jr nc, .check_left
	ld [wDShotPageTop], a
	call StopRingtone
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.check_left
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .no_joypad
	ld a, [wDShotPageTop]
	sub $6
	bit 7, a
	jr nz, .no_joypad
	ld [wDShotPageTop], a
	call StopRingtone
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp DrawDMeloMenu

.no_joypad
	ret

Func_121bf: ; 121bf (4:61bf)
	ld a, $74
	hlbgcoord 2, 14
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $75
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wDMeloPage]
	inc a
Func_121db:
	push hl
	call Get2DigitBCD
	pop hl
DMelo_Print2DigitBCD: ; 121e0 (4:61e0)
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $76
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Func_121fd: ; 121fd (4:61fd)
	ld a, $53
	hlbgcoord 2, 15
	call WaitStatAndLoad
	ld a, $73
	call WaitStatAndLoad
	ld a, $54
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wDMeloBuffer + $1]
	inc a
	jp Func_121db

UpdateDisplayedNumberOfNotesInCurrentlyLoadedDMelo: ; 1221c (4:621c)
	call CountSizeOfDMeloBuffer
	ld a, $56
	hlbgcoord 2, 16
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $71
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	ld a, [wNumNotesInCurDMelo]
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	jp DMelo_Print2DigitBCD

CountSizeOfDMeloBuffer: ; 1224e (4:624e)
; Count 240 halfwords starting at wDMeloBuffer + $2, skipping any that are equal to $fefe
	xor a
	ld [wNumNotesInCurDMelo], a
	ld hl, wDMeloBuffer + $2
	ld bc, $f0
.loop
	ld a, [hli]
	cp $fe
	jr nz, .count
	ld a, [hl]
	cp $fe
	jr z, .next
.count
	ld a, [wNumNotesInCurDMelo]
	inc a
	ld [wNumNotesInCurDMelo], a
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Rom4_PointToWordInTable: ; 12270 (4:6270)
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ret

Func_12279: ; 12279 (4:6279)
	xor a
	ld [wcb37], a
	ld [wcb21], a
	enable_sram
	ld hl, wcdbc
	ld b, $44
	ld de, s1_b000
.loop
	push bc
	ld a, [hli]
	ld [wcb20], a
	cp $0
	jr z, .next
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb20]
	ld [de], a
	inc de
	ld a, [wcb21]
	ld [de], a
	inc de
	ld a, [wcb37]
	inc a
	ld [wcb37], a
.next
	ld a, [wcb21]
	inc a
	ld [wcb21], a
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

GetS1B100PlusA: ; 122ba (4:62ba)
	push af
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop af
	ld hl, s1_b000
	call Rom4_PointToWordInTable
	ld a, [hli]
	push af
	ld a, [hli]
	ld b, a
	call Rom4_CloseSRAM
	pop af
	ret

Func_122d0: ; 122d0 (4:62d0)
	ld a, [wcb6f]
	call GetS1B100PlusA
Func_122d6: ; 122d6 (4:62d6)
	ld e, b
	ld d, $0
	ld hl, $1e0
	add hl, de
	push hl
	pop bc
	ld a, $7
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Phone_SaveMenu_JoypadAction: ; 122ea (4:62ea)
	ld a, [hJoyNew]
	and B_BUTTON
	jr nz, .dont_save
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_d_down
.d_up_down
	ld a, [wPhoneScreenCursorPosition]
	xor $1
	ld [wPhoneScreenCursorPosition], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp Func_12352

.check_d_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_a_button
	jr .d_up_down

.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .no_a_button
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr z, .save
.dont_save
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld a, $4
	ld [wSubroutine2], a
	ret

.save
	call SaveGame_
	lb bc, 1, 6
	ld e, $33
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $40
	ld [wcb2c], a
	jp IncrementSubroutine2

.no_a_button
	ret

Func_12352: ; 12352 (4:6352)
	ld c, $68
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr z, .asm_1235d
	ld c, $78
.asm_1235d
	ld b, $c
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_1236b: ; 1236b (4:636b)
	xor a
	ld [wcb70], a
	ld [wcb71], a
	enable_sram
	ld hl, sAddressBook
	ld bc, ADDRESS_BOOK_SIZE
.asm_1237d
	ld a, BANK(sAddressBook)
	ld [MBC3SRamBank], a
	push bc
	push hl
	ld a, [hli]
	ld [wcb20], a
	ld a, [hli]
	ld [wcb21], a
	cp $0
	jr z, .asm_123c3
	inc hl
	ld a, [hli]
	ld [wcb22], a
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, s1_b000
	add hl, de
	ld a, [wcb20]
	ld [hli], a
	ld a, [wcb21]
	ld [hli], a
	ld a, [wcb71]
	ld [hli], a
	ld a, [wcb22]
	ld [hli], a
	ld a, [wcb70]
	inc a
	ld [wcb70], a
.asm_123c3
	pop hl
	ld de, $10
	add hl, de
	ld a, [wcb71]
	inc a
	ld [wcb71], a
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_1237d
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	cp $1
	jr z, asm_12417
	ld a, [wcb70]
	ld c, a
asm_123e5
	push bc
	ld a, [wcb70]
	dec a
	ld b, a
	ld hl, s1_b000
	ld de, s1_b000 + 4
asm_123f1
	push bc
	ld a, [hl]
	ld b, a
	ld a, [de]
	cp b
	jr nc, .asm_12407
	call Func_1241d
	call Func_1241d
	call Func_1241d
	call Func_1241d
	jp Func_1240f

.asm_12407
	inc hl
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
	inc de
Func_1240f: ; 1240f (4:640f)
	pop bc
	dec b
	jr nz, asm_123f1
	pop bc
	dec c
	jr nz, asm_123e5
asm_12417
	call Rom4_CloseSRAM
	jp Func_12426

Func_1241d: ; 1241d (4:641d)
	ld a, [hl]
	ld b, a
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	inc hl
	inc de
	ret

Func_12426: ; 12426 (4:6426)
	ld hl, wDMeloBuffer
	ld bc, $200
	call FillMemoryWithFF
	ld a, [wcb70]
	ld b, a
	ld hl, s1_b000
	ld a, $ff
	ld [wcb20], a
	xor a
	ld [wLastDenjuuSeenOrCaught], a
	push bc
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop bc
.loop
	push bc
	push hl
	ld a, [wcb20]
	ld b, a
	ld a, [hl]
	cp b
	jr z, .asm_12467
	ld [wcb20], a
	push af
	ld hl, wDMeloBuffer
	ld a, [wLastDenjuuSeenOrCaught]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
	ld [wLastDenjuuSeenOrCaught], a
.asm_12467
	pop hl
	ld de, $4
	add hl, de
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

Func_12473: ; 12473 (4:6473)
	ld e, a
	ld d, $0
	ld hl, wDMeloBuffer
	add hl, de
	ld a, [hl]
	ret

Func_1247c:
	call Func_13e08
	ld bc, $10
	call ClearMemory3
	jp Rom4_CloseSRAM

InitPlayerNameEntryBuffers: ; 12488 (4:6488)
	ld hl, wPlayerNameEntryBuffer
	ld de, wPlayerNameEntryBuffer2
	ld b, $9
.loop
	ld a, "$"
	ld [de], a
	inc de
	xor a
	ld [hli], a
	dec b
	jr nz, .loop
	ret

RefreshPlayerNameBuffer: ; 1249a (4:649a)
	ld b, $0
	ld c, $30
	ld d, $c
	call LoadAndStartStdTextPointer__
	call BattlePrintText
	jp BattlePrintText

PlayerName_JoypadAction: ; 124a9 (4:64a9)
	call NavigatePhoneKeypad
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_start_or_a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wCurOptionHover], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call CountEnteredCharactersAndCopyNameEntryBuffer
	call RefreshPlayerNameBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $0
	ret z
	dec a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, SFX_04
	ld [H_SFX_ID], a
	ret

.check_start_or_a
	ld a, [hJoyNew]
	and START
	jr nz, .submit_name
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, .no_button
	call PlayPhoneKeypadCursorSFX
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	jp z, .note_button
	cp $1
	jp z, .move_cursor_left
	cp $2
	jp z, .move_cursor_right
	cp $3
	jp z, .submit_name
	cp $d
	jp z, .asterisk_or_pound
	cp $f
	jp z, .asterisk_or_pound
	jp UpdateCurrentCharacterInPlayerName

.note_button: ; 12519 (4:6519)
	xor a
	ld [wCurOptionHover], a
	ld a, [wPlayerNameEntryKeypadLayout]
	inc a
	cp $3
	jr nz, .wrap_around
	xor a
.wrap_around
	ld [wPlayerNameEntryKeypadLayout], a
	add $1
	cp $3
	jr nz, .load_keypad
	xor a
.load_keypad
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

.submit_name
	ld a, SFX_03
	ld [H_SFX_ID], a
	call CountEnteredCharactersAndCopyNameEntryBuffer
	cp $0
	jr nz, .store_name
	ld a, "シ"
	ld [wPlayerNameEntryBuffer + 0], a
	ld a, "ゲ"
	ld [wPlayerNameEntryBuffer + 1], a
	ld a, "キ"
	ld [wPlayerNameEntryBuffer + 2], a
	ld a, $3
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	call CountEnteredCharactersAndCopyNameEntryBuffer
	jp RefreshPlayerNameBuffer

.store_name
	jp IncrementSubroutine

.asterisk_or_pound: ; 12562 (4:6562)
	jp ModifyCurrentCharacterInPlayerNameEntryBuffer

.move_cursor_left: ; 12565 (4:6565)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $0
	ret z
	dec a
	jr .finish_move_cursor

.move_cursor_right: ; 1256e (4:656e)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $7
	ret z
	inc a
.finish_move_cursor
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wCurOptionHover], a
.no_button: ; 12581 (4:6581)
	ret

Func_12582: ; 12582 (4:6582)
	call NavigatePhoneKeypad
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_125be
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wCurOptionHover], a
	ld hl, VTilesBG tile $78
	ld b, $6
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call Func_127b7
	call RefreshPlayerNameBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $0
	ret z
	dec a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, SFX_04
	ld [H_SFX_ID], a
	ret

.asm_125be
	ld a, [hJoyNew]
	and START
	jr nz, asm_12612
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_12659
	call PlayPhoneKeypadCursorSFX
	ld a, [wPhoneKeypadCursorPosition]
	cp $0
	jp z, Func_125f2
	cp $1
	jp z, Func_12632
	cp $2
	jp z, Func_12646
	cp $3
	jp z, asm_12612
	cp $d
	jp z, Func_1262f
	cp $f
	jp z, Func_1262f
	jp Func_1272a

Func_125f2: ; 125f2 (4:65f2)
	xor a
	ld [wCurOptionHover], a
	ld a, [wPlayerNameEntryKeypadLayout]
	inc a
	cp $3
	jr nz, .asm_125ff
	xor a
.asm_125ff
	ld [wPlayerNameEntryKeypadLayout], a
	add $1
	cp $3
	jr nz, .asm_12609
	xor a
.asm_12609
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

asm_12612
	ld a, SFX_03
	ld [H_SFX_ID], a
	call Func_127b7
	cp $0
	jr nz, .asm_1262c
	ld a, [wFirstEmptySlotInAddressBook]
	call Func_13d8c
	call CountEnteredCharactersAndCopyNameEntryBuffer
	ld d, $c
	jp RefreshPlayerNameBuffer

.asm_1262c
	jp IncrementSubroutine

Func_1262f: ; 1262f (4:662f)
	jp Func_1268a

Func_12632: ; 12632 (4:6632)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $0
	ret z
	dec a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wCurOptionHover], a
	ret

Func_12646: ; 12646 (4:6646)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $5
	ret z
	inc a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wCurOptionHover], a
Func_12659: ; 12659 (4:6659)
	ret

Func_1265a: ; 1265a (4:665a)
	ld e, $15
	ld a, [wPlayerNameEntryKeypadLayout]
	cp $0
	jr z, .asm_1266b
	ld e, $16
	cp $1
	jr z, .asm_1266b
	ld e, $1b
.asm_1266b
	ld bc, $111
	ld a, $0
	jp LoadStdBGMapLayout_

ModifyCurrentCharacterInPlayerNameEntryBuffer: ; 12673 (4:6673)
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call CycleDakuten
	pop hl
	ld [hl], a
	call CountEnteredCharactersAndCopyNameEntryBuffer
	jp RefreshPlayerNameBuffer

Func_1268a: ; 1268a (4:668a)
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call CycleDakuten
	pop hl
	ld [hl], a
	call Func_127b7
	jp RefreshPlayerNameBuffer

PlayPhoneKeypadCursorSFX: ; 126a1 (4:66a1)
	ld a, [wPhoneKeypadCursorPosition]
	ld e, a
	ld d, $0
	ld hl, Data_126b0
	add hl, de
	ld a, [hl]
	ld [H_SFX_ID], a
	ret

Data_126b0:
	db SFX_63, SFX_63, SFX_63, SFX_63
	db    SFX_16, SFX_17, SFX_18
	db    SFX_19, SFX_1A, SFX_1B
	db    SFX_1C, SFX_1D, SFX_1E
	db    SFX_1F, SFX_20, SFX_21

UpdateCurrentCharacterInPlayerName: ; 126c0 (4:66c0)
	ld a, [wcb66]
	cp $ff
	jr z, .skip
	ld b, a
	ld a, [wPhoneKeypadCursorPosition]
	cp b
	jr nz, .not_the_same_character
	ld a, [wCurOptionHover]
	inc a
	ld [wCurOptionHover], a
	jr .skip

.not_the_same_character
	xor a
	ld [wCurOptionHover], a
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $7
	jr z, .skip
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	inc a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
.skip
	ld a, [wPhoneKeypadCursorPosition]
	ld [wcb66], a
	ld a, [wPlayerNameEntryKeypadLayout]
	ld hl, Pointers_1280d
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPhoneKeypadCursorPosition]
	sub $4
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wCurOptionHover]
	cp b
	jr nz, .wrap_around
	xor a
	ld [wCurOptionHover], a
.wrap_around
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call CountEnteredCharactersAndCopyNameEntryBuffer
	jp RefreshPlayerNameBuffer

Func_1272a: ; 1272a (4:672a)
	ld a, [wcb66]
	cp $ff
	jr z, .asm_12753
	ld b, a
	ld a, [wPhoneKeypadCursorPosition]
	cp b
	jr nz, .asm_12741
	ld a, [wCurOptionHover]
	inc a
	ld [wCurOptionHover], a
	jr .asm_12753

.asm_12741
	xor a
	ld [wCurOptionHover], a
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	cp $5
	jr z, .asm_12753
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	inc a
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
.asm_12753
	ld a, [wPhoneKeypadCursorPosition]
	ld [wcb66], a
	ld a, [wPlayerNameEntryKeypadLayout]
	ld hl, Pointers_1280d
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wPhoneKeypadCursorPosition]
	sub $4
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wCurOptionHover]
	cp b
	jr nz, .asm_1277c
	xor a
	ld [wCurOptionHover], a
.asm_1277c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wPlayerNameEntryBuffer
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call Func_127b7
	jp RefreshPlayerNameBuffer

CountEnteredCharactersAndCopyNameEntryBuffer: ; 12794 (4:6794)
	ld hl, wc3a7
	ld de, wc3b0
	ld b, $8
	ld c, $0
.loop
	ld a, c
	cp $0
	jr nz, .copy
	ld a, [de]
	cp $0
	jr nz, .at_least_one
	ld a, "$"
	ld [hld], a
	jr .next

.at_least_one
	ld c, $1
.copy
	ld a, [de]
	ld [hld], a
.next
	dec de
	dec b
	jr nz, .loop
	ld a, c
	ret

Func_127b7: ; 127b7 (4:67b7)
	ld hl, wc3a5
	ld de, wc3ae
	ld b, $6
	ld c, $0
.asm_127c1
	ld a, c
	cp $0
	jr nz, .asm_127d2
	ld a, [de]
	cp $0
	jr nz, .asm_127d0
	ld a, $e0
	ld [hld], a
	jr .asm_127d4

.asm_127d0
	ld c, $1
.asm_127d2
	ld a, [de]
	ld [hld], a
.asm_127d4
	dec de
	dec b
	jr nz, .asm_127c1
	ld a, c
	ret

Func_127da: ; 127da (4:67da)
	ld a, [wcb6f]
	call GetS1B100PlusA
	hlbgcoord 6, 16
Phone_Print2DigitBCD: ; 127e3 (4:67e3)
	push hl
	call Get2DigitBCD
	pop hl
	jp Dex_Print2DigitBCD

Func_127eb:
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $f0
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Pointers_1280d:
	dw Pointers_12813
	dw Pointers_12872
	dw Pointers_128d1

Pointers_12813:
	dw Data_1282b
	dw Data_12836
	dw Data_1283c
	dw Data_12842
	dw Data_12849
	dw Data_1284f
	dw Data_12855
	dw Data_1285b
	dw Data_12862
	dw Data_12868
	dw Data_12869
	dw Data_12871

Data_1282b:
	db 10
	db "あ", "い", "う", "え", "お", "ぁ", "ぃ", "ぅ", "ぇ", "ぉ"

Data_12836:
	db 5
	db "か", "き", "く", "け", "こ"

Data_1283c:
	db 5
	db "さ", "し", "す", "せ", "そ"

Data_12842:
	db 6
	db "た", "ち", "つ", "て", "と", "っ"

Data_12849:
	db 5
	db "な", "に", "ぬ", "ね", "の"

Data_1284f:
	db 5
	db "は", "ひ", "ふ", "へ", "ほ"

Data_12855:
	db 5
	db "ま", "み", "む", "め", "も"

Data_1285b:
	db 6
	db "や", "ゆ", "よ", "ゃ", "ゅ", "ょ"

Data_12862:
	db 5
	db "ら", "リ", "る", "れ", "ろ"

Data_12868:
	db $ff

Data_12869:
	db 7
	db "わ", "を", "ん", "ー", ".", "!", "?"

Data_12871:
	db $ff

Pointers_12872:
	dw Data_1288a
	dw Data_12895
	dw Data_1289b
	dw Data_128a1
	dw Data_128a8
	dw Data_128ae
	dw Data_128b4
	dw Data_128ba
	dw Data_128c1
	dw Data_128c7
	dw Data_128c8
	dw Data_128d0

Data_1288a:
	db 10
	db "ア", "イ", "ウ", "エ", "オ", "ァ", "ィ", "ゥ", "ェ", "ォ"

Data_12895:
	db 5
	db "カ", "キ", "ク", "ケ", "コ"

Data_1289b:
	db 5
	db "サ", "シ", "ス", "セ", "ソ"

Data_128a1:
	db 6
	db "タ", "チ", "ツ", "テ", "ト", "ッ"

Data_128a8:
	db 5
	db "ナ", "ニ", "ヌ", "ネ", "ノ"

Data_128ae:
	db 5
	db "ハ", "ヒ", "フ", "へ", "ホ"

Data_128b4:
	db 5
	db "マ", "ミ", "ム", "メ", "モ"

Data_128ba:
	db 6
	db "ヤ", "ユ", "ヨ", "ャ", "ュ", "ョ"

Data_128c1:
	db 5
	db "ラ", "リ", "ル", "レ", "ロ"

Data_128c7:
	db $ff

Data_128c8:
	db 7
	db "ワ", "ヲ", "ン", "ー", ".", "!", "?"

Data_128d0:
	db $ff

Pointers_128d1:
	dw Data_128e9
	dw Data_128eb
	dw Data_128ed
	dw Data_128ef
	dw Data_128f1
	dw Data_128f3
	dw Data_128f5
	dw Data_128f7
	dw Data_128f9
	dw Data_128fb
	dw Data_128fc
	dw Data_128fe

Data_128e9:
	db 1
	db "1"

Data_128eb:
	db 1
	db "2"

Data_128ed:
	db 1
	db "3"

Data_128ef:
	db 1
	db "4"

Data_128f1:
	db 1
	db "5"

Data_128f3:
	db 1
	db "6"

Data_128f5:
	db 1
	db "7"

Data_128f7:
	db 1
	db "8"

Data_128f9:
	db 1
	db "9"

Data_128fb:
	db $ff

Data_128fc:
	db 1
	db "0"

Data_128fe:
	db $ff

Func_128ff: ; 128ff (4:68ff)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	ld e, a
	ld d, $0
	ld hl, Data_12919
	add hl, de
	ld a, [hl]
	ld b, a
	ld c, $68
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Data_12919:
x = 8
REPT 8
	db x
x = x + 8
ENDR

Func_12921: ; 12921 (4:6921)
	ld a, [wCurrentPlayerOrDenjuuNameBufferLength]
	sla a
	sla a
	sla a
	add $10
	ld b, a
	ld c, $70
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

LoadPhoneKeypad: ; 1293b (4:693b)
	ld hl, Pointers_12970
	check_cgb
	jr z, .asm_12948
	ld hl, Pointers_1299a
.asm_12948
	ld a, [wDShotLevel]
	call Rom4_PointToWordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb28]
	call Rom4_PointToWordInTable
	ld a, [hli]
.asm_12958
	ld h, [hl]
	ld l, a
	check_cgb
	jr z, .asm_12965
	ld a, BANK(GFX_1e4000)
	jr .asm_12967

.asm_12965
	ld a, BANK(GFX_1ec000)
.asm_12967
	ld de, VTilesShared tile $20
	ld bc, $40 tiles
	jp Copy2bpp

Pointers_12970:
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_12992
	dw Pointers_12992
	dw Pointers_12992

Pointers_12982:
	dw GFX_1e4000
	dw GFX_1e4400
	dw GFX_1e4800
	dw GFX_1e4c00

Pointers_1298a:
	dw GFX_1e5000
	dw GFX_1e5400
	dw GFX_1e5800
	dw GFX_1e5c00

Pointers_12992:
	dw GFX_1e6000
	dw GFX_1e6400
	dw GFX_1e6800
	dw GFX_1e6c00

Pointers_1299a:
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129bc
	dw Pointers_129bc
	dw Pointers_129bc

Pointers_129ac:
	dw GFX_1ec000
	dw GFX_1ec400
	dw GFX_1ec800
	dw GFX_1ecc00

Pointers_129b4:
	dw GFX_1ed000
	dw GFX_1ed400
	dw GFX_1ed800
	dw GFX_1edc00

Pointers_129bc:
	dw GFX_1ee000
	dw GFX_1ee400
	dw GFX_1ee800
	dw GFX_1eec00

Func_129c4: ; 129c4 (4:69c4)
	ld a, [wDShotLevel]
	ld e, a
	ld d, $0
	sla e
	rl d
	push de
	ld hl, Pointers_12a18
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG
	ld bc, $40 tiles
	ld a, BANK(Phone1GFX)
	call Copy2bpp
	pop de
	push de
	ld hl, Pointers_12a2a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesShared
	ld bc, $20 tiles
	ld a, $7a
	call Copy2bpp
	pop de
	ld hl, Pointers_12a3c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG tile $21
	ld bc, $3 tiles
	ld a, BANK(GFX_dee5f)
	jp Copy2bpp

Func_12a08:
	ld a, [wDShotLevel]
	ld e, a
	ld d, $0
	ld hl, $39 tiles
	add hl, de
	push hl
	pop bc
	xor a
	jp LoadNthStdBGPalette

Pointers_12a18:
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Pointers_12a2a:
	dw GFX_1e8000
	dw GFX_1e8200
	dw GFX_1e8400
	dw GFX_1e8600
	dw GFX_1e8800
	dw GFX_1e8a00
	dw GFX_1e8c00
	dw GFX_1e8e00
	dw GFX_1e9000

Pointers_12a3c:
	dw GFX_dee5f
	dw GFX_dee8f
	dw GFX_deebf
	dw GFX_deeef
	dw GFX_def1f
	dw GFX_def4f
	dw GFX_def7f
	dw GFX_defaf
	dw GFX_defdf

Func_12a4e: ; 12a4e (4:6a4e)
	xor a
	ld [wCurSeconds], a
	ld [wCurMinutes], a
	ld [wCurHours], a
	ld [wCurDays], a
	ld [wCurDays + 1], a
	ret

SetRTC: ; 12a5f (4:6a5f)
	enable_sram
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, RTC_S
	ld [MBC3SRamBank], a
	xor a
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_M
	ld [MBC3SRamBank], a
	ld a, [wCurMinutes]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_H
	ld [MBC3SRamBank], a
	ld a, [wCurHours]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DL
	ld [MBC3SRamBank], a
	ld a, [wCurDays]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	ld a, [wCurDays + 1]
	ld [MBC3RTC], a
	jp Rom4_CloseSRAM

GetRTC: ; 12ab9 (4:6ab9)
	enable_sram
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, RTC_S
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurSeconds], a
	ld a, RTC_M
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurMinutes], a
	ld a, RTC_H
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurHours], a
	jp Rom4_CloseSRAM

Func_12aef:
	ld hl, wMapHeader
	ld de, wcb08
	ld b, $e
.loop
	ld a, [hli]
	cp $7a
	jr z, .next
	sub $60
	srl a
	ld [de], a
	inc de
.next
	dec b
	jr nz, .loop
	ld b, $c
	ld hl, wcb08
.loop2
	push bc
	ld a, [hl]
	push hl
	ld hl, Data_12b1c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	pop bc
	dec b
	jr nz, .loop2
	ret

Data_12b1c:
	db 10
	db  0
	db  1
	db  2
	db  3
	db  4
	db  5
	db  6
	db  7
	db  8
	db  0
	db  0
	db 11
	db  0
	db  9

Func_12b2b: ; 12b2b (4:6b2b)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wPhoneScreenCursorPosition]
	cp $c
	jr z, .asm_12b59
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wPhoneScreenCursorPosition]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	inc a
	ld [wPhoneScreenCursorPosition], a
	ret

.asm_12b59
	ld a, $4
	call StartFade_
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_12b6c: ; 12b6c (4:6b6c)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wDShotPageCursor]
	cp $c
	jr z, .asm_12b9a
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wDShotPageCursor]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_SFX_ID], a
	ld a, [wDShotPageCursor]
	inc a
	ld [wDShotPageCursor], a
	ret

.asm_12b9a
	ld a, $4
	call StartFade_
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_12baa: ; 12baa (4:6baa)
	ld a, [wDShotReceptionLevel]
	dec a
	add $2f
	ld [wOAMAnimation16_TemplateIdx], a
	ld de, wOAMAnimation16
	lb bc, $10, $28
	jp Func_11789

SoundTestJoypadAction: ; 12bbc (4:6bbc)
	ld a, [hJoyNew]
	and B_BUTTON
	jp nz, .Quit
	ld a, [hJoyNew]
	and D_UP
	jr z, .check_down
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestMenuCursor]
	dec a
	cp $ff
	jr nz, .top
	ld a, $2
.top
	ld [wSoundTestMenuCursor], a
	jp SoundTest_UpdateMenuCursorPosition

.check_down
	ld a, [hJoyNew]
	and D_DOWN
	jr z, .check_left_right_a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestMenuCursor]
	inc a
	cp $3
	jr nz, .bottom
	xor a
.bottom
	ld [wSoundTestMenuCursor], a
	jp SoundTest_UpdateMenuCursorPosition

.check_left_right_a
	ld a, [wSoundTestMenuCursor]
	cp $1
	jr z, .sfx_menu
	cp $2
	jp z, .QuitIfA
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .check_right_music
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestMusicID]
	dec a
	cp $ff
	jr nz, .min_music
	ld a, $27
.min_music
	ld [wSoundTestMusicID], a
	jp SoundTest_UpdateMenuCursorPosition

.check_right_music
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_a_music
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestMusicID]
	inc a
	cp $28
	jr c, .max_music
	xor a
.max_music
	ld [wSoundTestMusicID], a
	jp SoundTest_UpdateMenuCursorPosition

.check_a_music
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .no_action1
	ld a, [wSoundTestMusicID]
	call SoundTest_LoadSelectedMusicID
	call GetMusicBank
	ld [H_MusicID], a
	ret

.no_action1
	ret

.sfx_menu
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .check_right_sfx
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestSFXID]
	cp $0
	jr nz, .min_sfx
	ld a, $74
.min_sfx
	dec a
	ld [wSoundTestSFXID], a
	jp SoundTest_UpdateMenuCursorPosition

.check_right_sfx
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_a_sfx
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wSoundTestSFXID]
	cp $73
	jr c, .max_sfx
	ld a, $ff
.max_sfx
	inc a
	ld [wSoundTestSFXID], a
	jp SoundTest_UpdateMenuCursorPosition

.check_a_sfx
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b_sfx
	ld a, [wSoundTestSFXID]
	inc a
	ld [H_SFX_ID], a
	ret

.check_b_sfx
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .no_action2
	ld a, SFX_01
	ld [H_SFX_ID], a
.no_action2
	ret

.QuitIfA: ; 12cb1 (4:6cb1)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .no_action3
.Quit: ; 12cb7 (4:6cb7)
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	call ClearObjectAnimationBuffers
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp IncrementSubroutine

.no_action3
	ret

SoundTest_UpdateMenuCursorPosition: ; 12cd3 (4:6cd3)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wSoundTestMenuCursor]
	cp $0
	jr z, .got_coords
	cp $1
	jr z, .hovering_over_sfx
	ld b, $78
	ld c, $80
	ld d, $0
	jr .got_coords

.hovering_over_sfx
	ld b, $60
	ld c, $68
	ld d, $1
.got_coords
	ld a, $10
	ld [wOAMAnimation02_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld a, $30
	ld [wOAMAnimation03_XCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wSoundTestMusicID]
	hlbgcoord 5, 10
	call Phone_Print2DigitBCD
	ld a, [wSoundTestSFXID]
	hlbgcoord 4, 13
	jp Dex_Print3DigitBCD

SoundTest_LoadSelectedMusicID: ; 12d32 (4:6d32)
	ld e, a
	ld hl, Data_12d3b
	ld d, $0
	add hl, de
	ld a, [hl]
	ret

Data_12d3b:
	db MUSIC_OVERWORLD
	db MUSIC_CACTOS_RUINS
	db MUSIC_ION_ISLAND
	db MUSIC_BARRAN_DESERT
	db MUSIC_PALM_SEA
	db MUSIC_PEPPERI_MOUNTAIN
	db MUSIC_CAVES
	db MUSIC_CRAFT_RESEARCH_CENTER
	db MUSIC_BURION_RUINS
	db MUSIC_BATTLE_START
	db MUSIC_13
	db MUSIC_WILD_DENJUU_BATTLE
	db MUSIC_TFANGER_BATTLE
	db MUSIC_BOSS_BATTLE
	db MUSIC_DOOMSDAY_BATTLE
	db MUSIC_WON_BATTLE
	db MUSIC_LOST_BATTLE
	db MUSIC_LEVEL_UP
	db MUSIC_GAME_OVER
	db MUSIC_KAI_ENCOUNTER
	db MUSIC_MIYO
	db MUSIC_SHOP
	db MUSIC_25
	db MUSIC_26
	db MUSIC_27
	db MUSIC_GOT_PHONE_NUMBER
	db MUSIC_29
	db MUSIC_2A
	db MUSIC_EVOLUTION
	db MUSIC_2C
	db MUSIC_2D
	db MUSIC_2E
	db MUSIC_DSHOT_MENU
	db MUSIC_HOUSE
	db MUSIC_34
	db MUSIC_WARP
	db MUSIC_TITLE_SCREEN
	db MUSIC_OPENING_MOVIE
	db MUSIC_THE_END
	db MUSIC_39

OptionsMenu_UpdateCursorObjects: ; 12d63 (4:6d63)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wCurOptionHover]
	cp $0
	jr z, .zero
	cp $1
	jr z, .one
	cp $2
	jr z, .two
	cp $3
	jr z, .three
	ld b, $88
	ld c, $90
	ld d, $0
	jr .zero

.three
	ld b, $78
	ld c, $80
	ld d, $1
	jr .zero

.two
	ld b, $68
	ld c, $70
	ld d, $1
	jr .zero

.one
	ld b, $58
	ld c, $60
	ld d, $1
.zero
	; b - first arrow Y coord
	; c - left/right arrows Y coord
	; d - left/right arrows visible
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld a, $28
	ld [wOAMAnimation03_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

UpdateOptionsScreen: ; 12dc7 (4:6dc7)
	ld e, $19
	ld a, [wPhoneSilentMode]
	cp $0
	jr z, .silent_no
	ld e, $18
.silent_no
	lb bc, 4, 10
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $19
	ld a, [wShowClockInOverworld]
	cp $0
	jr z, .clock_no
	ld e, $18
.clock_no
	lb bc, 4, 12
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $19
	ld a, [wBattleAnimations]
	cp $0
	jr z, .anims_no
	ld e, $18
.anims_no
	lb bc, 4, 16
	ld a, $0
	jp LoadStdBGMapLayout_

OptionsMenuJoyAction: ; 12e00 (4:6e00)
	ld a, [hJoyNew]
	and B_BUTTON
	jp nz, .QuitOptionsMenu
	ld a, [wJoyNew]
	and D_UP
	jr z, .not_up
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wCurOptionHover]
	cp $0
	jr nz, .wrap_up
	ld a, $5
.wrap_up
	dec a
	ld [wCurOptionHover], a
	jp OptionsMenu_UpdateCursorObjects

.not_up
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .not_down
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wCurOptionHover]
	cp $4
	jr nz, .wrap_down
	ld a, $ff
.wrap_down
	inc a
	ld [wCurOptionHover], a
	jp OptionsMenu_UpdateCursorObjects

.not_down
	ld a, [wCurOptionHover]
	cp $1
	jr z, .ShowClockInOverworld
	cp $2
	jr z, .ChangeColor
	cp $3
	jp z, .BattleAnimation
	cp $4
	jp z, .PressAToQuit
	; $0
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .SilentMode_check_right
	jr .ToggleSilentMode

.SilentMode_check_right
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.ToggleSilentMode
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wPhoneSilentMode]
	xor $1
	ld [wPhoneSilentMode], a
	jp UpdateOptionsScreen

.ShowClockInOverworld
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .ShowClockInOverworld_check_right
	jr .ToggleOverworldClock

.ShowClockInOverworld_check_right
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.ToggleOverworldClock
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wShowClockInOverworld]
	xor $1
	ld [wShowClockInOverworld], a
	jp UpdateOptionsScreen

.ChangeColor
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .ChangeColor_check_right
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wUIColor]
	inc a
	and $3
	ld [wUIColor], a
	call OptionsMenu_ReloadUIColor
	ret

.ChangeColor_check_right
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wUIColor]
	dec a
	and $3
	ld [wUIColor], a
	call OptionsMenu_ReloadUIColor
	ret

.BattleAnimation: ; 12ec3 (4:6ec3)
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .BattleAnimation_check_right
	jr .ToggleBattleAnimations

.BattleAnimation_check_right
	ld a, [wJoyNew]
	and D_RIGHT
	ret z
.ToggleBattleAnimations
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wBattleAnimations]
	xor $1
	ld [wBattleAnimations], a
	jp UpdateOptionsScreen

.PressAToQuit: ; 12ee2 (4:6ee2)
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	jr .quit

.QuitOptionsMenu: ; 12eee (4:6eee)
	ld a, SFX_04
	ld [H_SFX_ID], a
.quit
	call Func_13fc6
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	jp IncrementSubroutine2

OptionsMenu_ReloadUIColor: ; 12efe (4:6efe)
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wUIColor]
	ld e, a
	ld d, $0
	ld hl, $320
	add hl, de
	push hl
	pop bc
	ld a, $5
	jp LoadNthStdBGPalette

Func_12f14: ; 12f14 (4:6f14)
	xor a
	ld [wNumRecentCalls], a
	ld hl, wRecentCalls
	ld de, $4
	ld b, $8
.loop
	ld a, [hl]
	cp $0
	jr z, .next
	ld a, [wNumRecentCalls]
	inc a
	ld [wNumRecentCalls], a
.next
	add hl, de
	dec b
	jr nz, .loop
	ret

Func_12f31: ; 12f31 (4:6f31)
	ld a, [wNumMailMessages]
	hlbgcoord 2, 10
	jp Func_127eb

Func_12f3a: ; 12f3a (4:6f3a)
	xor a
	ld [wNumMailMessages], a
	ld hl, wMailMessages
	ld de, $4
	ld b, $8
.loop
	push hl
	ld a, [hli]
	cp $0
	jr z, .next
	ld a, [wNumMailMessages]
	inc a
	ld [wNumMailMessages], a
.next
	pop hl
	add hl, de
	dec b
	jr nz, .loop
	ret

Func_12f59: ; 12f59 (4:6f59)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b
	ld a, SFX_03
	ld [H_SFX_ID], a
	call Func_137d9
	xor a
	ld [wDShotPageCursor], a
	ld a, $8
	ld [wcb2c], a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	call Func_13fc6
	jp IncrementSubroutine2

.check_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_right
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

.check_right
	ld a, [wNumRecentCalls]
	cp $1
	ret z
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumRecentCalls]
	dec a
	ld b, a
	ld a, [wPhoneScreenCursorPosition]
	cp b
	jr nz, .wrap_right
	ld a, $ff
.wrap_right
	inc a
	ld [wPhoneScreenCursorPosition], a
	jp PrintRecentCall

.check_left
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .no_joypad
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumRecentCalls]
	dec a
	ld b, a
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr nz, .wrap_left
	ld a, [wNumRecentCalls]
.wrap_left
	dec a
	ld [wPhoneScreenCursorPosition], a
	jp PrintRecentCall

.no_joypad
	ret

PrintRecentCall: ; 12fd8 (4:6fd8)
	ld b, a
	ld a, [wNumRecentCalls]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wRecentCalls
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call PrintNameOfCallerOrSender
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wPhoneScreenCursorPosition]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wNumRecentCalls]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_13028: ; 13028 (4:7028)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .check_b
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	call Func_13fc6
	ld hl, VTilesBG tile $40
	ld b, $20
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	call LoadSpecialFontTiles
	ld a, $85
	ld [wca65], a
	call Func_13fdf
	ld a, $40
	ld [wTextBoxStartTile], a
	call Func_137af
	jp IncrementSubroutine2

.check_b
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_right
	ld a, SFX_04
	ld [H_SFX_ID], a
	xor a
	ld [wFontPaletteMode], a
	ld a, $7
	ld [wSubroutine2], a
	ret

.check_right
	ld a, [wNumMailMessages]
	cp $1
	ret z
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .check_left
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumMailMessages]
	dec a
	ld b, a
	ld a, [wPhoneScreenCursorPosition]
	cp b
	jr nz, .wrap_right
	ld a, $ff
.wrap_right
	inc a
	ld [wPhoneScreenCursorPosition], a
	jp PrintMailMessageHeader

.check_left
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .no_joypad
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumMailMessages]
	dec a
	ld b, a
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr nz, .wrap_left
	ld a, [wNumMailMessages]
.wrap_left
	dec a
	ld [wPhoneScreenCursorPosition], a
	jp PrintMailMessageHeader

.no_joypad
	ret

PrintMailMessageHeader: ; 130bc (4:70bc)
	ld b, a
	ld a, [wNumMailMessages]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wMailMessages
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call PrintNameOfCallerOrSender
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wPhoneScreenCursorPosition]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wNumMailMessages]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_1310c:
	ld a, [wcd24]
	inc a
	hlbgcoord 2, 16
	call Dex_Print3DigitBCD
	ld a, $ee
	call WaitStatAndLoad
	ld a, [wcb70]
	hlbgcoord 6, 16
	jp Dex_Print3DigitBCD

Func_13124: ; 13124 (4:7124)
	ld a, [wcd24]
	call Func_13d38
	hlbgcoord 4, 14
	call Dex_Print3DigitBCD
	ld a, [wcb70]
	hlbgcoord 4, 17
	jp Dex_Print3DigitBCD

Func_13139:
	ld a, [wDexCurDenjuu]
	inc a
	hlbgcoord 2, 14
	call Dex_Print3DigitBCD
	ld a, $ee ; "/" in this context
	call WaitStatAndLoad
	ld a, [wLastDenjuuSeenOrCaught]
	inc a
	hlbgcoord 6, 14
	call Dex_Print3DigitBCD
	ld a, [wNumDenjuuSeen]
	hlbgcoord 3, 17
	jp Dex_Print3DigitBCD

Dex_Print3DigitBCD: ; 1315b (4:715b)
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
Dex_Print2DigitBCD: ; 1316d (4:716d)
	ld a, [wNumCGBPalettesToFade]
	and $f0
	swap a
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wNumCGBPalettesToFade]
	and $f
LoadBCDDigit:
	add $e0 ; "0" in this context
	di
	call WaitStat
	ld [hli], a
	ei
	ret

Func_1318a:
	call Func_13e4c
	ld d, a
	call Rom4_CloseSRAM
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	cp d
	jr z, .asm_1319d
	ld c, d
	call Func_06a4
	xor a
	ret

.asm_1319d
	ld a, $1
	ret

Func_131a0: ; 131a0 (4:71a0)
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_131bd
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr nz, .asm_131b6
	ld a, $3
.asm_131b6
	dec a
	ld [wPhoneScreenCursorPosition], a
	jp Func_1329a

Func_131bd: ; 131bd (4:71bd)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_131da
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	cp $2
	jr nz, .asm_131d3
	ld a, $ff
.asm_131d3
	inc a
	ld [wPhoneScreenCursorPosition], a
	jp Func_1329a

Func_131da: ; 131da (4:71da)
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, Func_13209
	ld a, SFX_04
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $12
	check_cgb
	jr z, .asm_131f8
	ld bc, $57
.asm_131f8
	call DecompressGFXByIndex_
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld a, $1
	ld [wSubroutine2], a
	jp Func_1236b

Func_13209: ; 13209 (4:7209)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_13266
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jp z, Func_13243
	cp $1
	jp z, Func_13267
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $13
	check_cgb
	jr z, .asm_1323a
	ld bc, $5a
.asm_1323a
	call DecompressGFXByIndex_
	ld a, $11
	ld [wSubroutine2], a
	ret

Func_13243: ; 13243 (4:7243)
	call Func_13e4c
	call Func_132b0
	xor a
	ld [wPhoneScreenCursorPosition], a
	ld a, $10
	ld [wcb2c], a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $9
	ld [wSubroutine2], a
	ret

Func_13261:
	ld a, SFX_05
	ld [H_SFX_ID], a
	ret

Func_13266: ; 13266 (4:7266)
	ret

Func_13267: ; 13267 (4:7267)
	call Func_1318a
	cp $0
	jr z, .asm_13274
	ld a, SFX_05
	ld [H_SFX_ID], a
	ret

.asm_13274
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld bc, $109
	ld e, $59
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wNumNotesInCurDMelo], a
	call Func_139e7
	ld a, $14
	ld [wSubroutine2], a
	ret

Func_1329a: ; 1329a (4:729a)
	ld b, $10
	ld a, [wPhoneScreenCursorPosition]
	sla a
	sla a
	sla a
	sla a
	add $58
Func_132a9:
	ld c, a
	ld de, wOAMAnimation02
	jp Func_11789

Func_132b0:
	push af
	and $f0
	swap a
	ld d, a
	pop af
	and $f
	swap a
	ld e, a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook + 10
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	call GetPhoneNumber_
	jp Func_12aef

Func_132d9: ; 132d9 (4:72d9)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld b, $1
	ld a, [wLastDenjuuSeenOrCaught]
	dec a
	cp $0
	jr nz, .asm_132f7
	ld b, $0
.asm_132f7
	ld a, b
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	jp AnimateObject_

Func_13312: ; 13312 (4:7312)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	jp AnimateObject_

Func_13340: ; 13340 (4:7340)
	ld a, $90
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	jp AnimateObject_

Func_1336e: ; 1336e (4:736e)
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $50
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, [wcb37]
	dec a
	cp $0
	jr nz, .asm_13397
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_13397
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld de, wOAMAnimation02
	call AnimateObject_
	ld de, wOAMAnimation03
	jp AnimateObject_

CycleDakuten: ; 133ab (4:73ab)
	ld hl, .keys
	ld de, .values
	ld c, $5a
	ld b, a
.loop
	ld a, [hli]
	cp b
	jr z, .found
	inc de
	dec c
	jr nz, .loop
	ld a, b
	ret

.found
	ld a, [de]
	ret

.keys:
	db "か", "き", "く", "け", "こ"
	db "さ", "し", "す", "せ", "そ"
	db "た", "ち", "つ", "て", "と"
	db "は", "ひ", "ふ", "へ", "ほ"
	db "ば", "び", "ぶ", "ベ", "ぼ"
	db "カ", "キ", "ク", "ケ", "コ"
	db "サ", "シ", "ス", "セ", "ソ"
	db "タ", "チ", "ツ", "テ", "ト"
	db "ハ", "ヒ", "フ", "へ", "ホ"
	db "バ", "ビ", "ブ", "ベ", "ボ"
	db "が", "ぎ", "ぐ", "げ", "ご"
	db "ざ", "じ", "ず", "ぜ", "ぞ"
	db "だ", "ぢ", "づ", "で", "ど"
	db "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"
	db "ガ", "ギ", "グ", "ゲ", "ゴ"
	db "ザ", "ジ", "ズ", "ゼ", "ゾ"
	db "ダ", "ヂ", "ヅ", "デ", "ド"
	db "パ", "ピ", "プ", "ぺ", "ポ"

.values:
	db "が", "ぎ", "ぐ", "げ", "ご"
	db "ざ", "じ", "ず", "ぜ", "ぞ"
	db "だ", "ぢ", "づ", "で", "ど"
	db "ば", "び", "ぶ", "ベ", "ぼ"
	db "ぱ", "ぴ", "ぷ", "ぺ", "ぽ"
	db "ガ", "ギ", "グ", "ゲ", "ゴ"
	db "ザ", "ジ", "ズ", "ゼ", "ゾ"
	db "ダ", "ヂ", "ヅ", "デ", "ド"
	db "バ", "ビ", "ブ", "ベ", "ボ"
	db "パ", "ピ", "プ", "ぺ", "ポ"
	db "か", "き", "く", "け", "こ"
	db "さ", "し", "す", "せ", "そ"
	db "た", "ち", "つ", "て", "と"
	db "は", "ひ", "ふ", "へ", "ほ"
	db "カ", "キ", "ク", "ケ", "コ"
	db "サ", "シ", "ス", "セ", "ソ"
	db "タ", "チ", "ツ", "テ", "ト"
	db "ハ", "ヒ", "フ", "へ", "ホ"

AppendDigitToPhoneNumber: ; 13474 (4:7474)
	ld a, [wDShotDialBufferSize]
	cp $d
	ret z
	ld a, [wPhoneKeypadCursorPosition]
	cp $4
	ret c
	sub $4
	ld e, a
	ld d, $0
	ld hl, InGamePhone_Digit2Tile
	add hl, de
	ld a, [hl]
	ld b, a
	ld hl, InGamePhone_Digit2OAM
	add hl, de
	ld a, [hl]
	ld c, a
	ld a, [wDShotDialBufferSize]
	ld e, a
	ld d, $0
	ld hl, wDMeloBuffer
	add hl, de
	ld a, b
	ld [hl], a
	ld hl, wDMeloBufferBackup
	add hl, de
	ld a, c
	ld [hl], a
	ld a, [wDShotDialBufferSize]
	inc a
	ld [wDShotDialBufferSize], a
RefreshDialBufferDisplay: ; 134aa (4:74aa)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld b, $c
	ld hl, wOAMAnimation02
	call ClearCurOAMAnimationStruct
	ld a, [wDShotDialBufferSize]
	cp $0
	ret z
	dec a
	ld b, a
	ld a, $c
	sub b
	ld c, a
	ld b, $0
	ld de, $20
	call Multiply_DE_by_BC
	ld hl, wOAMAnimation01
	add hl, de
	ld a, [wDShotDialBufferSize]
	ld b, a
	xor a
	ld [wcb22], a
.loop
	push bc
	push hl
	push hl
	ld de, $0
	add hl, de
	ld a, $1
	ld [hl], a
	pop hl
	ld de, $2
	add hl, de
	push hl
	ld hl, wDMeloBufferBackup
	ld a, [wcb22]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	pop hl
	ld de, $20
	add hl, de
	ld a, [wcb22]
	inc a
	ld [wcb22], a
	pop bc
	dec b
	jr nz, .loop
	ld a, $50
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld [wOAMAnimation04_YCoord], a
	add $10
	ld [wOAMAnimation05_YCoord], a
	ld [wOAMAnimation06_YCoord], a
	ld [wOAMAnimation07_YCoord], a
	ld [wOAMAnimation08_YCoord], a
	add $10
	ld [wOAMAnimation09_YCoord], a
	ld [wOAMAnimation10_YCoord], a
	ld [wOAMAnimation11_YCoord], a
	ld [wOAMAnimation12_YCoord], a
	ld [wOAMAnimation13_YCoord], a
	ld a, $10
	ld [wOAMAnimation02_XCoord], a
	ld a, $18
	ld [wOAMAnimation03_XCoord], a
	ld [wOAMAnimation05_XCoord], a
	ld a, $20
	ld [wOAMAnimation04_XCoord], a
	ld [wOAMAnimation06_XCoord], a
	ld [wOAMAnimation09_XCoord], a
	ld a, $28
	ld [wOAMAnimation07_XCoord], a
	ld [wOAMAnimation10_XCoord], a
	ld a, $30
	ld [wOAMAnimation08_XCoord], a
	ld [wOAMAnimation11_XCoord], a
	ld a, $38
	ld [wOAMAnimation12_XCoord], a
	ld a, $40
	ld [wOAMAnimation13_XCoord], a
	ld a, $0
	ld b, $c
	ld hl, wOAMAnimation02_TemplateBank
	call ClearCurOAMAnimationStruct
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wDShotDialBufferSize]
	cp $c
	jp z, .try_dial
	ret

.try_dial
	call TryPlacePhoneCall
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

InGamePhone_Digit2Tile:
	db $62, $64, $66
	db $68, $6a, $6c
	db $6e, $70, $72
	db $7c, $60, $78

InGamePhone_Digit2OAM:
	db $21, $22, $23
	db $24, $25, $26
	db $27, $28, $29
	db $2e, $20, $2c

InsertDashesIntoUserEnteredPhoneNumber: ; 1359c (4:759c)
	ld a, [wDMeloBuffer]
	ld [wDMeloBufferBackup], a
	ld a, [wDMeloBuffer + $1]
	ld [wDMeloBufferBackup + $1], a
	ld a, [wDMeloBuffer + $2]
	ld [wDMeloBufferBackup + $2], a
	ld a, $7a
	ld [wDMeloBufferBackup + $3], a
	ld a, [wDMeloBuffer + $3]
	ld [wDMeloBufferBackup + $4], a
	ld a, [wDMeloBuffer + $4]
	ld [wDMeloBufferBackup + $5], a
	ld a, [wDMeloBuffer + $5]
	ld [wDMeloBufferBackup + $6], a
	ld a, [wDMeloBuffer + $6]
	ld [wDMeloBufferBackup + $7], a
	ld a, $7a
	ld [wDMeloBufferBackup + $8], a
	ld a, [wDMeloBuffer + $7]
	ld [wDMeloBufferBackup + $9], a
	ld a, [wDMeloBuffer + $8]
	ld [wDMeloBufferBackup + $a], a
	ld a, [wDMeloBuffer + $9]
	ld [wDMeloBufferBackup + $b], a
	ld a, [wDMeloBuffer + $a]
	ld [wDMeloBufferBackup + $c], a
	ld a, [wDMeloBuffer + $b]
	ld [wDMeloBufferBackup + $d], a
	ret

Func_135ef: ; 135ef (4:75ef)
	ld b, $c
	ld de, wOAMAnimation02
.asm_135f4
	push bc
	push de
	call DeleteOAMAnimationStruct
	pop de
	ld hl, $20
	add hl, de
	push hl
	pop de
	pop bc
	dec b
	jr nz, .asm_135f4
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

TryPlacePhoneCall: ; 1360a (4:760a)
; Make sure the number compresses to a valid combination. If not, bail.
; Make sure the number is in your address book. If so, place the call.
; If number is not in your address book, look it up in the Special table.
	xor a
	ld [wcb43], a
	ld [wcb03], a
	ld [wcb22], a
	call InsertDashesIntoUserEnteredPhoneNumber
	ld hl, wDMeloBufferBackup
	call CompressPhoneNumber_
	ld a, e
	cp $0
	jr nz, .number_valid
	ld a, d
	cp $0
	jr nz, .number_valid
	ld a, c
	cp $0
	jr nz, .number_valid
	ld a, b
	cp $0
	jr nz, .number_valid
	jr .number_invalid

.number_valid
	ld hl, wd300
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	set 7, b
	ld a, b
	ld [hli], a
	ld a, [wWhichPhoneNumberSymbolCode]
	ld [hli], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld b, ADDRESS_BOOK_SIZE
	ld hl, sAddressBook
	ld c, $0
.loop
	push bc
	push hl
	ld de, $1
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .next
	pop hl
	push hl
	ld de, $a
	add hl, de
	ld de, wd300
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .next
	inc de
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .next
	inc de
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .next
	inc de
	ld a, [hli]
	ld [wcb22], a
	and $3
	ld b, a
	ld a, [de]
	and $3
	cp b
	jr nz, .next
	inc de
	ld a, [hl]
	ld b, a
	ld a, [de]
	cp b
	jr z, .denjuu_in_address_book
.next
	pop hl
	ld de, $10
	add hl, de
	pop bc
	inc c
	dec b
	jr nz, .loop
	call Rom4_CloseSRAM
.number_invalid
	call IsSpecialPhoneNumber_
	ld a, c
	cp $0
	jr z, .special
	xor a
	ld [wcb43], a
	ret

.denjuu_in_address_book
	pop hl
	pop bc
	ld a, c
	ld [wcb04], a
	ld a, [hl]
	ld [wcb01], a
	ld a, [wcb22]
	bit 7, a
	jr z, .done_good
	ld a, $1
	ld [wcb03], a
.done_good
	call Rom4_CloseSRAM
	ld a, $1
	ld [wcb43], a
	ret

.special
	ld a, $2
	ld [wcb43], a
	ld a, [wcb20]
	ld [wcb01], a
	ret

Func_136d2: ; 136d2 (4:76d2)
	xor a
	ld [wd415], a
	ld [wd4b0], a
	ld hl, wDMeloBuffer
	ld a, [wcd24]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	ld [wcb20], a
	ld hl, s1_b000
	ld de, wDMeloBuffer
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	ld a, [wcb70]
	ld b, a
.loop
	push bc
	push hl
	ld a, [hl]
	push af
	ld a, [wcb20]
	ld b, a
	pop af
	cp b
	jr nz, .skip
	inc hl
	inc hl
	ld a, [hl]
	ld [de], a
	inc de
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.skip
	pop hl
	push de
	ld de, $4
	add hl, de
	pop de
	pop bc
	dec b
	jr nz, .loop
	jp Rom4_CloseSRAM

Func_1371c: ; 1371c (4:771c)
	push af
	call LoadPhoneGFX_BGTile00_
	ld a, [wCurBackground]
	call LoadPhoneBackground_BGTile20_
	pop af
	push af
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld hl, GFX_de95f
	ld de, VTilesShared tile $00
	ld bc, $10 tiles
	ld a, BANK(GFX_de95f)
	call Copy2bpp
	ld a, [wCurBackground]
	add $50
	ld e, a
	ld bc, $0
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $c
	ld e, $1a
	call Phone_LoadStdBGMapTileAndAttrLayout
	pop af
	call GetDenjuuPalette_Pal6
	ld hl, $60
	ld a, [wCurHours]
	cp 20 ; 9 PM
	jr nc, .asm_13764
	cp 4 ; 5 AM
	jr nc, .asm_13767
.asm_13764
	ld hl, $380
.asm_13767
	ld a, [wCurBackground]
	call Rom4_PointToWordInTable
	push hl
	pop bc
	push bc
	ld a, $3
	call LoadNthStdBGPalette
	pop bc
	inc bc
	ld a, $4
	call LoadNthStdBGPalette
	ld bc, $36
	ld a, $1
	call LoadNthStdBGPalette
	ld a, [wUIColor]
	ld c, a
	ld b, $0
	ld hl, $324
	add hl, bc
	push hl
	pop bc
	ld a, $5
	call LoadNthStdBGPalette
	jp Func_12a08

ClearCurOAMAnimationStruct: ; 13798 (4:7798)
	ld [hl], a
	ld de, $20
	add hl, de
	dec b
	jr nz, ClearCurOAMAnimationStruct
	ret

Func_137a1: ; 137a1 (4:77a1)
	ld hl, GFX_dea5f
	ld de, VTilesBG tile $40
	ld bc, $38 tiles
	ld a, BANK(GFX_dea5f)
	jp Copy2bpp

Func_137af: ; 137af (4:77af)
	ld a, [wPhoneScreenCursorPosition]
	ld b, a
	ld a, [wNumNotesInCurDMelo]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wMailMessages
	add hl, de
	inc hl
	inc hl
	inc hl
	ld a, [hl]
	ld c, a
	ld b, $1
	ld d, $c
	call LoadAndStartStdTextPointer__
	call BattlePrintText
	jp BattlePrintText

Func_137d9: ; 137d9 (4:77d9)
	call Func_137df
	jp Func_132b0

Func_137df: ; 137df (4:77df)
	ld a, [wPhoneScreenCursorPosition]
	ld b, a
	ld a, [wNumNotesInCurDMelo]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wRecentCalls
	add hl, de
	ld a, [hli]
	dec a
	ret

Func_137fa: ; 137fa (4:77fa)
	push af
	and $f0
	swap a
	ld d, a
	pop af
	and $f
	swap a
	ld e, a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	add hl, de
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	ret

Func_13816: ; 13816 (4:7816)
	ld a, [hJoyNew]
	and D_RIGHT
	jp z, Func_13850
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr z, .asm_1382e
	cp $1
	jr z, .asm_13832
	sub $2
	add $50
	jr .asm_13835

.asm_1382e
	ld a, $47
	jr .asm_13835

.asm_13832
	ld a, [wcb73]
.asm_13835
	ld [wcb20], a
	ld a, [wRingtoneID]
	cp $0
	jr z, .asm_13842
	call StopRingtone
.asm_13842
	ld a, [wcb20]
	add $80
	ld [H_Ringtone], a
	ld a, $4
	ld [wMusicBank], a
	ret

Func_13850: ; 13850 (4:7850)
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_13870
	call StopRingtone
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jr nz, .asm_13869
	ld a, $a
.asm_13869
	dec a
	ld [wPhoneScreenCursorPosition], a
	jp Func_138e2

Func_13870: ; 13870 (4:7870)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_13890
	call StopRingtone
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wPhoneScreenCursorPosition]
	cp $9
	jr nz, .asm_13889
	ld a, $ff
.asm_13889
	inc a
	ld [wPhoneScreenCursorPosition], a
	jp Func_138e2

Func_13890: ; 13890 (4:7890)
	ld a, [hJoyNew]
	and B_BUTTON
	jp z, Func_138a5
	call StopRingtone
	ld a, SFX_04
	ld [H_SFX_ID], a
	call Func_1236b
	jp IncrementSubroutine2

Func_138a5: ; 138a5 (4:78a5)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_138e1
	call StopRingtone
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld b, $47
	ld a, [wPhoneScreenCursorPosition]
	cp $0
	jp z, Func_138d1
	cp $1
	jp z, Func_138cd
	ld a, [wPhoneScreenCursorPosition]
	sub $2
	add $50
	ld b, a
	jr Func_138d1

Func_138cd: ; 138cd (4:78cd)
	ld a, [wcb73]
	ld b, a
Func_138d1: ; 138d1 (4:78d1)
	ld a, b
	call RegisterRingtoneToDenjuu
	ld a, [wOAMAnimation02_YCoord]
	ld [wOAMAnimation03_YCoord], a
	call Func_1236b
	jp IncrementSubroutine2

Func_138e1: ; 138e1 (4:78e1)
	ret

Func_138e2: ; 138e2 (4:78e2)
	ld b, $8
	ld a, [wPhoneScreenCursorPosition]
	sla a
	sla a
	sla a
	add $38
	jp Func_132a9

RegisterRingtoneToDenjuu: ; 138f2 (4:78f2)
	push af
	call Func_13e4c
	ld e, a
	ld d, $0
	ld hl, sAddressBookRingtones
	add hl, de
	ld b, BANK(sAddressBookRingtones)
	call Rom4_GetSRAMBankB
	pop af
	ld [hl], a
	jp Rom4_CloseSRAM

Func_13907: ; 13907 (4:7907)
	call Func_13e4c
	ld e, a
	ld d, $0
	ld hl, sAddressBookRingtones
	add hl, de
	ld b, BANK(sAddressBookRingtones)
	call Rom4_GetSRAMBankB
	ld a, [hl]
	ld b, a
	call Rom4_CloseSRAM
	ld a, b
	cp $47
	jr z, .asm_1392d
	cp $50
	jr c, .asm_13929
	sub $4e
	ld b, a
	jr .asm_1392f

.asm_13929
	ld b, $1
	jr .asm_1392f

.asm_1392d
	ld b, $0
.asm_1392f
	ld a, b
	ret

Phone_LoadPhoneScreenBGMap: ; 13931 (4:7931)
	lb bc, 1, 6
Phone_LoadBGMapLayout: ; 13934 (4:7934)
	ld a, $0
	jp LoadStdBGMapLayout_

Phone_LoadPhoneScreenAttrMap: ; 13939 (4:7939)
	lb bc, 1, 6
Phone_LoadAttrMapLayout: ; 1393c (4:793c)
	ld a, $0
	jp LoadStdBGMapAttrLayout_

Phone_LoadPhoneScreenBGWindow:
	lb bc, 1, 6
Phone_LoadBGWindowLayout: ; 13944 (4:7944)
	ld a, $0
	jp LoadStdWindowLayout_

Phone_LoadPhoneScreenAttrWindow:
	lb bc, 1, 6
Phone_LoadAttrWindowLayout: ; 1394c (4:794c)
	ld a, $0
	jp LoadStdWindowAttrLayout_

Phone_LoadPhoneScreenBGMapTileAndAttrLayout: ; 13951 (4:7951)
	push de
	call Phone_LoadPhoneScreenBGMap
	pop de
	jp Phone_LoadPhoneScreenAttrMap

Phone_LoadStdBGMapTileAndAttrLayout: ; 13959 (4:7959)
	push bc
	push de
	call Phone_LoadBGMapLayout
	pop de
	pop bc
	jp Phone_LoadAttrMapLayout

Phone_LoadStdBGWindowTileAndAttrLayout: ; 13963 (4:7963)
	push bc
	push de
	call Phone_LoadBGWindowLayout
	pop de
	pop bc
	jp Phone_LoadAttrWindowLayout

Func_1396d: ; 1396d (4:796d)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_139a8
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wNumNotesInCurDMelo]
	cp $0
	jr nz, .asm_139b3
	call Func_13e4c
	call Func_1247c
	call Func_1236b
	ld e, $2d
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $1
	ld [wSubroutine2], a
	ld bc, $12
	check_cgb
	jr z, .asm_1399f
	ld bc, $57
.asm_1399f
	call DecompressGFXByIndex_
	ld de, wOAMAnimation02
	jp DeleteOAMAnimationStruct

.asm_139a8
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_139c4
	ld a, SFX_04
	ld [H_SFX_ID], a
.asm_139b3
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $4
	ld [wSubroutine2], a
	ret

.asm_139c4
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_139ce
	jr asm_139d6

Func_139ce: ; 139ce (4:79ce)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_139e6
asm_139d6
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumNotesInCurDMelo]
	xor $1
	ld [wNumNotesInCurDMelo], a
	jp Func_139e7

Func_139e6: ; 139e6 (4:79e6)
	ret

Func_139e7: ; 139e7 (4:79e7)
	ld b, $10
	ld a, [wNumNotesInCurDMelo]
	sla a
	sla a
	sla a
	sla a
	add $68
	jp Func_132a9

Print2DigitBCD: ; 139f9 (4:79f9)
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	call LoadBCDDigit
	ld a, [wNumCGBPalettesToFade]
	and $f
	jp LoadBCDDigit

Func_13a0b: ; 13a0b (4:7a0b)
	call Func_13f51
	ld bc, $11
	call DecompressGFXByIndex_
	xor a
	ld [wcb28], a
	call Func_129c4
	jp LoadPhoneKeypad

Func_13a1e: ; 13a1e (4:7a1e)
	ld bc, $15
	call GetCGB_BGLayout_
	ld bc, $3
	call GetCGB_OBLayout_
	call OptionsMenu_ReloadUIColor
	jp Func_12a08

Func_13a30: ; 13a30 (4:7a30)
	call Func_13e08
	ld a, [hl]
	push af
	call Rom4_CloseSRAM
	pop af
	ret

CheckCaughtDenjuu: ; 13a3a (4:7a3a)
	ld e, a
	ld d, $0
	ld hl, DENJUU_DEX_CAUGHT_FLAGS
	jr DexFlagAction

CheckSeenDenjuu: ; 13a42 (4:7a42)
	ld e, a
	ld d, $0
	ld hl, DENJUU_DEX_SEEN_FLAGS
DexFlagAction:
	add hl, de
	ld b, h
	ld c, l
	jp CheckEventFlag

GetDexCounts: ; 13a4e (4:7a4e)
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_CAUGHT_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld de, (EVENT_FF8 - DENJUU_DEX_CAUGHT_FLAGS) >> 3
	add hl, de
	ld c, (EVENT_FF8 - DENJUU_DEX_CAUGHT_FLAGS) >> 3
.asm_13a67
	ld a, [hld]
	cp $0
	jr nz, .asm_13a6f
	dec c
	jr .asm_13a67

.asm_13a6f
	sla c
	sla c
	sla c
	ld b, $8
	bit 7, a
	jr nz, .asm_13aa1
	ld b, $7
	bit 6, a
	jr nz, .asm_13aa1
	ld b, $6
	bit 5, a
	jr nz, .asm_13aa1
	ld b, $5
	bit 4, a
	jr nz, .asm_13aa1
	ld b, $4
	bit 3, a
	jr nz, .asm_13aa1
	ld b, $3
	bit 2, a
	jr nz, .asm_13aa1
	ld b, $2
	bit 1, a
	jr nz, .asm_13aa1
	ld b, $1
.asm_13aa1
	ld a, c
	add b
	dec a
	ld [wLastDenjuuSeenOrCaught], a
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_SEEN_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld de, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
	add hl, de
	ld c, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
.asm_13ac0
	ld a, [hld]
	cp $0
	jr nz, .asm_13ac8
	dec c
	jr .asm_13ac0

.asm_13ac8
	sla c
	sla c
	sla c
	ld b, $8
	bit 7, a
	jr nz, .asm_13afa
	ld b, $7
	bit 6, a
	jr nz, .asm_13afa
	ld b, $6
	bit 5, a
	jr nz, .asm_13afa
	ld b, $5
	bit 4, a
	jr nz, .asm_13afa
	ld b, $4
	bit 3, a
	jr nz, .asm_13afa
	ld b, $3
	bit 2, a
	jr nz, .asm_13afa
	ld b, $2
	bit 1, a
	jr nz, .asm_13afa
	ld b, $1
.asm_13afa
	ld a, c
	add b
	dec a
	ld b, a
	ld a, [wLastDenjuuSeenOrCaught]
	cp b
	jr nc, .asm_13b08
	ld a, b
	ld [wLastDenjuuSeenOrCaught], a
.asm_13b08
	xor a
	ld [wNumDenjuuSeen], a
	ld hl, wEventFlags
	ld bc, DENJUU_DEX_SEEN_FLAGS
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	add hl, bc
	ld b, (EVENT_EF8 - DENJUU_DEX_SEEN_FLAGS) >> 3
.asm_13b21
	ld c, $8
	ld a, [hli]
.asm_13b24
	bit 0, a
	jr z, .asm_13b31
	push af
	ld a, [wNumDenjuuSeen]
	inc a
	ld [wNumDenjuuSeen], a
	pop af
.asm_13b31
	srl a
	dec c
	jr nz, .asm_13b24
	dec b
	jr nz, .asm_13b21
	ret

Func_13b3a: ; 13b3a (4:7b3a)
	ld a, [wDShotLevel]
	ld e, a
	ld d, $0
	ld hl, Data_13b70
	add hl, de
	ld a, [hl]
	push af
	ld [wcb33], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook + 1
	ld c, $fe
	ld b, $0
	ld de, $10
.asm_13b58
	ld a, [hl]
	cp $0
	jr z, .asm_13b5e
	inc b
.asm_13b5e
	add hl, de
	dec c
	jr nz, .asm_13b58
	call Rom4_CloseSRAM
	pop af
	cp b
	jr z, .asm_13b6b
	jr nc, .asm_13b6e
.asm_13b6b
	ld a, $1
	ret

.asm_13b6e
	xor a
	ret

Data_13b70:
	db $46, $96, $f0
	db $46, $96, $f0
	db $46, $96, $f0

Func_13b79: ; 13b79 (4:7b79)
	push af
	xor a
	ld [wcb21], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	ld b, $fe
	ld c, $0
.asm_13b8a
	push hl
	ld de, $1
	add hl, de
	ld a, [hl]
	cp $0
	jr z, .asm_13ba1
	pop hl
	ld de, $10
	add hl, de
	inc c
	dec b
	jr nz, .asm_13b8a
	pop af
	jp Rom4_CloseSRAM

.asm_13ba1
	ld a, c
	ld [wcb21], a
	pop de
	pop af
	push af
	push de
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	pop de
	ld [de], a
	ld [wcb20], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	xor a
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld [de], a
	inc de
	pop af
	push de
	ld e, a
	ld d, $0
	ld hl, Data_13c45
	add hl, de
	ld a, [hli]
	pop de
	ld [de], a
	inc de
	ld [de], a
	inc de
	ld hl, wd300
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, $2
	ld [de], a
	ld h, $0
	ld b, $0
	ld a, [wcb21]
	ld c, a
	ld a, [wcb01]
	ld l, a
	ld de, $420
	add hl, de
	push hl
	pop de
	call Func_06cc
	jp Rom4_CloseSRAM

Data_13c0d:
	db $2f, $14, $1e, $01
	db $64, $14, $1e, $0b
	db $94, $14, $1e, $07
	db $6b, $14, $1e, $05
	db $82, $0a, $28, $02
	db $92, $0a, $28, $0a
	db $84, $0a, $28, $03
	db $69, $0a, $28, $08
	db $36, $1e, $14, $02
	db $83, $1e, $14, $06
	db $67, $1e, $14, $04
	db $6c, $1e, $14, $02
	db $a5, $32, $0a, $04
	db $a6, $32, $0a, $09

Data_13c45:
	db $00
	db $07
	db $06
	db $0e
	db $00
	db $00
	db $00
	db $00
	db $04
	db $04
	db $04
	db $04
	db $0b
	db $0b

Func_13c53: ; 13c53 (4:7c53)
	xor a
	ld [wcb22], a
	ld a, [wcb01]
	ld b, a
	ld c, $e
	ld hl, Data_13c0d
.asm_13c60
	ld a, [hl]
	cp b
	jr z, .asm_13c75
	inc hl
	inc hl
	inc hl
	inc hl
	ld a, [wcb22]
	inc a
	ld [wcb22], a
	dec c
	jr nz, .asm_13c60
	jp Func_070c

.asm_13c75
	ld a, [wcb22]
	add $8e
	ld c, a
	ld b, $1
	ret

Func_13c7e: ; 13c7e (4:7c7e)
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Data_13c0d
	add hl, de
	ld a, [hli]
	ret

Func_13c8f: ; 13c8f (4:7c8f)
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_13cb2
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wNumNotesInCurDMelo]
	cp $0
	jr nz, .asm_13cbd
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	jp IncrementSubroutine

.asm_13cb2
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_13cd1
	ld a, SFX_04
	ld [H_SFX_ID], a
.asm_13cbd
	ld bc, $104
	ld e, $5b
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld a, $1e
	ld [wSubroutine], a
	ret

.asm_13cd1
	ld a, [wJoyNew]
	and D_UP
	jp z, Func_13cdb
	jr asm_13ce3

Func_13cdb: ; 13cdb (4:7cdb)
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_13cf3
asm_13ce3
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wNumNotesInCurDMelo]
	xor $1
	ld [wNumNotesInCurDMelo], a
	jp Func_13cf4

Func_13cf3: ; 13cf3 (4:7cf3)
	ret

Func_13cf4: ; 13cf4 (4:7cf4)
	ld b, $10
	ld a, [wNumNotesInCurDMelo]
	sla a
	sla a
	sla a
	add $78
	jp Func_132a9

Func_13d04: ; 13d04 (4:7d04)
	ld [wcb20], a
	xor a
	ld [wcb21], a
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	ld hl, sAddressBook
	ld b, $fe
.asm_13d15
	push bc
	push hl
	ld a, [wcb20]
	ld b, a
	ld a, [hli]
	cp b
	jr nz, .asm_13d2b
	ld a, [hli]
	cp $0
	jr z, .asm_13d2b
	ld a, [wcb21]
	inc a
	ld [wcb21], a
.asm_13d2b
	pop hl
	ld de, $10
	add hl, de
	pop bc
	dec b
	jr nz, .asm_13d15
	ld a, [wcb21]
	ret

Func_13d38: ; 13d38 (4:7d38)
	ld hl, wDMeloBuffer
	ld a, [wcd24]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	jp Func_13d04

Func_13d46: ; 13d46 (4:7d46)
	push af
	ld hl, VTilesOB tile $50
	push hl
	ld [wd409], a
	call GetDenjuuSprite_
	pop hl
	ld a, [wd409]
	call GetOverworldSprite_SizeHL
	pop af
	ld d, $4
	jp Func_13d5e

Func_13d5e: ; 13d5e (4:7d5e)
	ld b, a
	ld hl, Data_13d81
.is_in_array
	ld a, [hli]
	cp $ff
	jr z, .not_in_array
	cp b
	jr nz, .is_in_array
	ld a, b
	ld bc, $100
	jr .okay

.not_in_array
	ld a, [wd409]
	ld bc, $2a0
	sub $14
.okay
	add c
	jr nc, .asm_13d7c
	inc b
.asm_13d7c
	ld c, a
	ld a, d
	jp LoadNthStdOBPalette

Data_13d81:
	db $5f
	db $71
	db $91
	db $95
	db $a4
	db $a5
	db $a7
	db $a8
	db $ab
	db $ad
	db $ff

Func_13d8c: ; 13d8c (4:7d8c)
	ld c, a
	ld b, $0
	ld de, $6
	call Multiply_DE_by_BC
	ld hl, sOwnedDenjuuNicknames
	add hl, de
	ld b, BANK(sOwnedDenjuuNicknames)
	call Rom4_GetSRAMBankB
	ld de, wPlayerNameEntryBuffer
	ld bc, $6
	call CopyData
	call Rom4_CloseSRAM
	ld hl, wPlayerNameEntryBuffer
	ld b, $0
	ld c, $6
.asm_13db1
	ld a, [hl]
	cp $e0
	jr z, .asm_13db9
	inc b
	jr .asm_13dbb

.asm_13db9
	xor a
	ld [hl], a
.asm_13dbb
	inc hl
	dec c
	jr nz, .asm_13db1
	ld a, b
	cp $5
	jr c, .asm_13dc6
	ld a, $5
.asm_13dc6
	ld [wCurrentPlayerOrDenjuuNameBufferLength], a
	ret

Func_13dca: ; 13dca (4:7dca)
	ld c, a
	ld b, $0
	ld de, $6
	call Multiply_DE_by_BC
	ld hl, sOwnedDenjuuNicknames
	add hl, de
	push hl
	pop de
	ld b, BANK(sOwnedDenjuuNicknames)
	call Rom4_GetSRAMBankB
	ld hl, wPlayerNameEntryBuffer2
	ld bc, $6
	call CopyData
	jp Rom4_CloseSRAM

Func_13dea: ; 13dea (4:7dea)
	call Func_13e4c
	call Func_13e08
	ld a, [hl]
	ld [wd409], a
	call GetDenjuuSprite_
	ld a, [wd409]
	sub $13
	ld [wcb73], a
	hlbgcoord 7, 8
	call Phone_Print2DigitBCD
	jp Rom4_CloseSRAM

Func_13e08: ; 13e08 (4:7e08)
	push af
	ld b, BANK(sAddressBook)
	call Rom4_GetSRAMBankB
	pop af
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld hl, sAddressBook
	add hl, de
	ret

Func_13e27: ; 13e27 (4:7e27)
	ld bc, $0
	ld e, $10
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $0
	ld e, $11
	call Phone_LoadStdBGWindowTileAndAttrLayout
Func_13e37: ; 13e37 (4:7e37)
	ld e, $12
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld bc, $30f
	ld e, $20
	call Phone_LoadStdBGMapTileAndAttrLayout
	ld bc, $310
	ld e, $21
	jp Phone_LoadStdBGMapTileAndAttrLayout

Func_13e4c: ; 13e4c (4:7e4c)
	ld a, [wd415]
	ld e, a
	ld d, $0
	ld hl, wDMeloBuffer
	add hl, de
	ld a, [hl]
	ret

Func_13e58: ; 13e58 (4:7e58)
	ld a, $e3
	ld [wLCDC], a
	ld a, $58
	ld [wWX], a
	xor a
	ld [wWY], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ret

Func_13e6e: ; 13e6e (4:7e6e)
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ret

Func_13e81:
	ld a, [wDexCurDenjuu]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, TypeNames
	ld bc, VTilesBG tile $38
	jp Func_056a

Func_13e97: ; 13e97 (4:7e97)
	xor a
	ld [wcb20], a
	ld a, [wDexCurDenjuu]
	call CheckCaughtDenjuu
	jr nz, .asm_13eaf
	ld a, [wDexCurDenjuu]
	call CheckSeenDenjuu
	jr z, .asm_13eb4
	ld a, $1
	jr .asm_13eb1

.asm_13eaf
	ld a, $2
.asm_13eb1
	ld [wcb20], a
.asm_13eb4
	ret

Func_13eb5: ; 13eb5 (4:7eb5)
	call Func_13e97
	cp $0
	jr z, .asm_13ed3
	ld a, [wDexCurDenjuu]
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, [wDexCurDenjuu]
	call GetDenjuuPalette_Pal7
	ld a, [wDexCurDenjuu]
	jp Func_11a35

.asm_13ed3
	ld a, $ae
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	ld a, $ae
	call GetDenjuuPalette_Pal7
	ld a, $ae
	jp Func_11a35

Rom4_GetSRAMBankB: ; 13ee7 (4:7ee7)
	enable_sram
	ld a, b
	ld [MBC3SRamBank], a
	ret

Rom4_CloseSRAM: ; 13ef1 (4:7ef1)
	xor a
	ld [MBC3SRamEnable], a
	ret

PrintNameOfCallerOrSender: ; 13ef6 (4:7ef6)
	call GetDenjuuNicknameC_
	ld hl, wBattlePlayerDenjuuName
	ld de, wPlayerNameEntryBuffer2
	call CenterAlignDenjuuName_
	ld hl, VTilesBG tile $40
	ld b, $6
	call PhoneMenu_FillTilesWithHue01IfCGBElseHue02
	ld de, wc3a1
	ld b, $6
	ld hl, VTilesBG tile $40
	jp PlaceString_

Func_13f15: ; 13f15 (4:7f15)
	call Func_13e4c
Func_13f18: ; 13f18 (4:7f18)
	ld c, a
	call GetDenjuuNicknameC_
	ld hl, wBattlePlayerDenjuuName
	ld de, wPlayerNameEntryBuffer2
	call CenterAlignDenjuuName_
	ld hl, VTilesBG tile $78
	ld b, $6
	call ClearTiles
	ld de, wc3a1
	ld b, $6
	ld hl, VTilesBG tile $78
	jp PlaceString_

Func_13f38: ; 13f38 (4:7f38)
	ld e, $1e
	jp Func_13f3f

Func_13f3d: ; 13f3d (4:7f3d)
	ld e, $1f
Func_13f3f: ; 13f3f (4:7f3f)
	call Phone_LoadPhoneScreenBGMap
	ld e, $12
	jp Phone_LoadPhoneScreenAttrMap

Func_13f47: ; 13f47 (4:7f47)
	xor a
	ld [wFontPaletteMode], a
	jp Func_11b21

Func_13f4e: ; 13f4e (4:7f4e)
	jp Func_11b27

Func_13f51: ; 13f51 (4:7f51)
	check_cgb
	jr z, .asm_13f64
	ld bc, $54
	call DecompressGFXByIndex_
	ld bc, $55
	jp DecompressGFXByIndex_

.asm_13f64
	ld bc, $1a
	call DecompressGFXByIndex_
	ld bc, $1b
	jp DecompressGFXByIndex_

Func_13f70: ; 13f70 (4:7f70)
	call Func_13e97
	cp $1
	jr z, .asm_13f7d
	ld a, [wDexCurDenjuu]
	ld c, a
	jr .asm_13f7f

.asm_13f7d
	ld c, $ae
.asm_13f7f
	ld b, $11
	ld d, $a
	call LoadAndStartStdTextPointer__
	call BattlePrintText
	jp BattlePrintText

Func_13f8c: ; 13f8c (4:7f8c)
	ld e, $5c
	call Phone_LoadPhoneScreenBGMapTileAndAttrLayout
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13312
	call Func_13139
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp IncrementSubroutine2

Func_13fb5: ; 13fb5 (4:7fb5)
	call Func_13e08
	ld de, $2
	add hl, de
	ld a, [hl]
	cp $64
	jr nc, .asm_13fc3
	inc a
	ld [hl], a
.asm_13fc3
	jp Rom4_CloseSRAM

Func_13fc6: ; 13fc6 (4:7fc6)
	ld de, wOAMAnimation02
	call DeleteOAMAnimationStruct
	ld de, wOAMAnimation03
	jp DeleteOAMAnimationStruct

PhoneMenu_FillTilesWithHue01IfCGBElseHue02: ; 13fd2 (4:7fd2)
	check_cgb
	jr nz, .asm_13fdc
	jp PhoneMenu_FillTilesWithHue01

.asm_13fdc
	jp PhoneMenu_FillTilesWithHue02

Func_13fdf: ; 13fdf (4:7fdf)
	check_cgb
	jr nz, .asm_13fea
	ld a, $1
	jr .asm_13fec

.asm_13fea
	ld a, $3
.asm_13fec
	ld [wFontPaletteMode], a
	ret
