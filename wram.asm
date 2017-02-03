INCLUDE "includes.asm"

SECTION "WRAM 0", WRAM0 [$c000]
wOAMBuffer:: ds 4 * 40 ; c000
wOAMBufferEnd::

wOAMAnimations:: ; c0a0
wOAMAnimation01:: oam_animation_struct wOAMAnimation01 ; c0a0
wOAMAnimation02:: oam_animation_struct wOAMAnimation02 ; c0c0
wOAMAnimation03:: oam_animation_struct wOAMAnimation03 ; c0e0
wOAMAnimation04:: oam_animation_struct wOAMAnimation04 ; c100
wOAMAnimation05:: oam_animation_struct wOAMAnimation05 ; c120
wOAMAnimation06:: oam_animation_struct wOAMAnimation06 ; c140
wOAMAnimation07:: oam_animation_struct wOAMAnimation07 ; c160
wOAMAnimation08:: oam_animation_struct wOAMAnimation08 ; c180
wOAMAnimation09:: oam_animation_struct wOAMAnimation09 ; c1a0
wOAMAnimation10:: oam_animation_struct wOAMAnimation10 ; c1c0
wOAMAnimation11:: oam_animation_struct wOAMAnimation11 ; c1e0
wOAMAnimation12:: oam_animation_struct wOAMAnimation12 ; c200

wOAMAnimation13:: oam_animation_struct wOAMAnimation13 ; c220
wOAMAnimation14:: oam_animation_struct wOAMAnimation14 ; c240
wOAMAnimation15:: oam_animation_struct wOAMAnimation15 ; c260
wOAMAnimation16:: oam_animation_struct wOAMAnimation16 ; c280
wOAMAnimation17:: oam_animation_struct wOAMAnimation17 ; c2a0
wOAMAnimation18:: oam_animation_struct wOAMAnimation18 ; c2c0
wOAMAnimation19:: oam_animation_struct wOAMAnimation19 ; c2e0
wOAMAnimation20:: oam_animation_struct wOAMAnimation20 ; c300
wOAMAnimation21:: oam_animation_struct wOAMAnimation21 ; c320
wOAMAnimation22:: oam_animation_struct wOAMAnimation22 ; c340
wOAMAnimation23:: oam_animation_struct wOAMAnimation23 ; c360
wOAMAnimation24:: oam_animation_struct wOAMAnimation24 ; c380
wOAMAnimationsEnd:: ; c3a0

wPlayerNameEntryBuffer2:: ds 1
wc3a1:: ds 1
wc3a2:: ds 1
wc3a3:: ds 1
wc3a4:: ds 1
wc3a5:: ds 1
wc3a6:: ds 1
wc3a7:: ds 1
wc3a8:: ds 1

wPlayerNameEntryBuffer:: ds 1
wc3aa:: ds 1
wc3ab:: ds 1
wc3ac:: ds 1
wc3ad:: ds 1
wc3ae:: ds 1
wc3af:: ds 1
wc3b0:: ds 1
wc3b1:: ds 1

wc3b2:: ds 1
wc3b3:: ds 1
wc3b4:: ds 1
wc3b5:: ds 1
wc3b6:: ds 1
wc3b7:: ds 1
wc3b8:: ds 1
wc3b9:: ds 1
wc3ba:: ds 1
wc3bb:: ds 1
wc3bc:: ds 1
wc3bd:: ds 1
wc3be:: ds 1
wc3bf:: ds 1
wVBlankCounter:: ds 1
wFinishedCurrentFrame:: ds 1
wSCX:: ds 1
wSCY:: ds 1
wWX:: ds 1
wWY:: ds 1
wBGP:: ds 1 ; c3c6
wOBP0:: ds 1 ; c3c7
wOBP1:: ds 1 ; c3c8
wLCDC:: ds 1 ; c3c9
wLYC:: ds 1
wc3cb:: ds 1
wc3cc:: ds 1
wCurSeconds:: ds 1
wCurMinutes:: ds 1
wCurHours:: ds 1
wCurDays:: ds 2
wc3d2:: ds 1
wc3d3:: ds 1
wc3d4:: ds 1
wc3d5:: ds 1
wc3d6:: ds 1
wc3d7:: ds 1
wCurFadeTimer:: ds 1
wCurFadeTimerReset:: ds 1
wCurFadePosition:: ds 1
wc3db:: ds 1
wc3dc:: ds 1
wc3dd:: ds 1
wc3de:: ds 1
wc3df:: ds 1
wGameRoutine:: ds 1
wSubroutine:: ds 1
wSubroutine2:: ds 1
wc3e3:: ds 1
wLogoAndTitleScreenTimer:: ds 2 ; bigdw
wc3e6:: ds 1
wc3e7:: ds 1
wCGB:: ds 1 ; c3e8
wc3e9:: ds 1
wc3ea:: ds 1
wc3eb:: ds 1
wc3ec:: ds 1
wc3ed:: ds 1
wc3ee:: ds 1
wc3ef:: ds 1
wc3f0:: ds 1
wc3f1:: ds 1
wc3f2:: ds 1
wc3f3:: ds 1
wc3f4:: ds 1
wc3f5:: ds 1
wc3f6:: ds 1
wc3f7:: ds 1
wc3f8:: ds 1
wc3f9:: ds 1
wc3fa:: ds 1
wc3fb:: ds 1
wc3fc:: ds 1
wc3fd:: ds 1
wc3fe:: ds 1
wc3ff:: ds 1
wRandomSample:: ds 1
wc401:: ds 1
wc402:: ds 1

wFontNumBlocks:: ds 1
wFontBlockFlags:: dw
wFontDestAddr:: dw

wc408:: ds 1
wc409:: ds 1
wSGB:: ds 1
wc40b:: ds 1
wc40c:: ds 1
wc40d:: ds 1
wc40e:: ds 1
wc40f:: ds 1
wc410:: ds 1
wc411:: ds 1
wc412:: ds 1
wc413:: ds 1
wc414:: ds 1
wc415:: ds 1
wc416:: ds 1
wc417:: ds 1

wCurSpriteTemplateBank:: ds 1
wCurSpriteOAMFlags:: ds 1
wCurSpriteTemplateIdx:: ds 1
wCurSpriteYCoord:: ds 1
wCurSpriteXCoord:: ds 1
wCurSpritePalette:: ds 1

wLoadingStdAttrLayoutToVWindow:: ds 1
wRNGState:: ds 2
wc421:: ds 1
wc422:: ds 1
wPrevROMBank:: ds 1
wc424:: ds 1
wROMBank:: ds 1 ; c425
wc426:: ds 1
wc427:: ds 1
wc428:: ds 1
wc429:: ds 1
wc42a:: ds 1
wc42b:: ds 1
wc42c:: ds 1
wc42d:: ds 1
wc42e:: ds 1
wc42f:: ds 1
wSpriteUpdatesEnabled:: ds 1
wc431:: ds 1
wc432:: ds 1
wc433:: ds 1
wSaveFileExists:: ds 1
wc435:: ds 1
wc436:: ds 1
wOAMUpdate:: ds 1
wc438:: ds 1
wc439:: ds 1
wc43a:: ds 1
wc43b:: ds 1
wc43c:: ds 1
wc43d:: ds 1
wc43e:: ds 1
wc43f:: ds 1
wCGBFade_PalLimit:: ds 1
wc441:: ds 1
wc442:: ds 1
wc443:: ds 1
wc444:: ds 1
wc445:: ds 1
wc446:: ds 1
wc447:: ds 1
wc448:: ds 1
wc449:: ds 1
wc44a:: ds 1
wc44b:: ds 1
wc44c:: ds 1
wc44d:: ds 1

wFontSourceBank:: ds 1 ; c44e
wc44f:: ds 1
wFontSourceAddr:: dw ; c450
wc452:: ds 1
wc453:: ds 1
	ds wFontSourceBank - @

wCGBPalFadeProgram:: ds 1
wNumCGBPalettesToFade:: ds 1
wc450:: ds 1
wCGBPalFadeCurPalRGBBuffer:: ds 3
wCGBPalFadeBufferPointer:: dw
wc456:: ds 1
wc457:: ds 1
wc458:: ds 1
wc459:: ds 1
wc45a:: ds 1
wc45b:: ds 1
wc45c:: ds 1
wc45d:: ds 1
wc45e:: ds 1
wc45f:: ds 1
wc460:: ds 1
wc461:: ds 1
wc462:: ds 1
wc463:: ds 1
wc464:: ds 1
wc465:: ds 1
wc466:: ds 1
wc467:: ds 1
wc468:: ds 1
wc469:: ds 1
wc46a:: ds 1
wc46b:: ds 1
wc46c:: ds 1
wc46d:: ds 1
wc46e:: ds 1
wc46f:: ds 1
wInLinkBattle:: ds 1
wLinkBattleRNIdx:: ds 1
wc472:: ds 1
wJoyNew:: ds 1
wMenuScrollDelay:: ds 1
wc475:: ds 1

SECTION "Player and Partner Structs", WRAM0 [$c480]
wPlayerObjectStruct:: oam_animation_struct wPlayerObjectStruct
wPartnerDenjuuObjectStruct:: oam_animation_struct wPartnerDenjuuObjectStruct
wPlayerAndDenjuuObjectStructsEnd::

SECTION "Event Flags", WRAM0 [$c500]
wEventFlags:: ; c500
	flag_array NUM_EVENTS

SECTION "Overworld RAM", WRAM0 [$c900]
wOverworldData::
wPhoneCallSubroutine:: ds 1
wc901:: ds 1
wc902:: ds 1
wMapNumber3:: ds 1
wMapGroup:: ds 1
wCurTilesetIdx:: ds 1
wMapNumber:: ds 1
wDShotReceptionLevel:: ds 1
wc908:: ds 1
wc909:: ds 1
wPhoneSilentMode:: ds 1
wc90b:: ds 1
wc90c:: ds 1
wc90d:: ds 1
wc90e:: ds 1
wc90f:: ds 1
wMoney:: dw
wc912:: ds 1
wMapNumber2:: ds 1
wMapGroup2:: ds 1
wPlayerXTile:: ds 1
wPlayerYTile:: ds 1
wMapMusic:: ds 1
wc918:: ds 1
wc919:: ds 1
wc91a:: ds 1
wc91b:: ds 1
wc91c:: ds 1
wc91d:: ds 1
wTileWhere0IsLoaded:: ds 1
wTextBoxStartTile:: ds 1
wc920:: ds 1
wc921:: ds 1
wOverworldRandomCounter:: ds 1
wOverworldRandomSeed:: ds 1
wc924:: ds 1
wc925:: ds 1
wc926:: ds 1
wc927:: ds 1
wc928:: ds 1
wc929:: ds 1
wc92a:: ds 1
wc92b:: ds 1
wPlayerName:: ds NAME_LENGTH
wc935:: ds 1
wc936:: ds 1
wc937:: ds 1
wc938:: ds 1
wRTC_Secs:: ds 1
wRTC_Mins:: ds 1
wRTC_Hrs:: ds 1
wRTC_DayLo:: ds 1
wRTC_DayHi:: ds 1
wShowClockInOverworld:: ds 1
wc93f:: ds 1
wOverworldPhoneCallCooldown:: ds 1
wc941:: ds 1
wc942:: ds 1
wc943:: ds 1
wc944:: ds 1
wc945:: ds 1
wc946:: ds 1
wc947:: ds 1
wc948:: ds 1
wc949:: ds 1
wc94a:: ds 1
wc94b:: ds 1
wc94c:: ds 1
wPhoneCallDenjuuAddressBookPointer:: dw
wPhoneCallRingtoneTimer:: ds 1
wEncounterStepCounter:: dw
wc952:: ds 1
wc953:: ds 1
wc954:: ds 1
wPartnerDenjuuHPRemaining:: ds 1
wOverworldIdleHUDPage:: ds 1
wc957:: ds 1
wc958:: ds 1
wPositionOfLastSpaceChar:: ds 1
wc95a:: ds 1
wc95b:: ds 1
wc95c:: ds 1
wc95d:: ds 1
wc95e:: ds 1
wc95f:: ds 1

wMiniMapClearedSections:: ds 1 ; flag_array 256
wc961:: ds 1
wc962:: ds 1
wc963:: ds 1
wc964:: ds 1
wc965:: ds 1
wc966:: ds 1
wc967:: ds 1
wc968:: ds 1
wc969:: ds 1
wc96a:: ds 1
wc96b:: ds 1
wc96c:: ds 1
wc96d:: ds 1
wc96e:: ds 1
wc96f:: ds 1
wc970:: ds 1
wc971:: ds 1
wc972:: ds 1
wc973:: ds 1
wc974:: ds 1
wc975:: ds 1
wc976:: ds 1
wc977:: ds 1
wc978:: ds 1
wc979:: ds 1
wc97a:: ds 1
wc97b:: ds 1
wc97c:: ds 1
wc97d:: ds 1
wc97e:: ds 1
wc97f:: ds 1
wMiniMapClearedSectionsEnd::
wOverworldDataEnd::

SECTION "Overworld temp", WRAM0 [$c980]
wc980:: ds 1
wc981:: ds 1
wc982:: ds 1
wc983:: ds 1
wOverworldFrameCounter:: ds 1
wCurXPixel:: ds 1
wCurYPixel:: ds 1
wLoadTextGFX_TileCounter:: ds 1
wLoadTextGFX_StartAddressHi:: ds 1
wc989:: ds 1
wCurObjectStruct:: dw
wc98c:: ds 1
wc98d:: ds 1
wc98e:: ds 1
wTakingAStep:: ds 1
wPartnerDenjuuXCoordBuffer:: ds $10
wPartnerDenjuuYCoordBuffer:: ds $10
wc9b0:: ds 1
wc9b1:: ds 1
wc9b2:: ds 1
wc9b3:: ds 1
wc9b4:: ds 1
wc9b5:: ds 1
wc9b6:: ds 1
wc9b7:: ds 1
wc9b8:: ds 1
wc9b9:: ds 1
wc9ba:: ds 1
wc9bb:: ds 1
wc9bc:: ds 1
wc9bd:: ds 1
wc9be:: ds 1
wc9bf:: ds 1
wc9c0:: ds 1
wc9c1:: ds 1
wc9c2:: ds 1
wc9c3:: ds 1
wc9c4:: ds 1

SECTION "Text RAM", WRAM0 [$c9c5]
wCumulativeTextFrameCounter:: ds 1
wTextPointer:: dw
wTextBank:: ds 1
wTextSubroutine:: ds 1
wTextBGMapTop:: ds 1
wTextBGMapColumn:: ds 1
wTextDelayTimer:: ds 1
wTextDelayTimerReset:: ds 1
wTextLine:: ds 1
wTextSubfunction:: ds 1
	ds 1
wBackupTextPointer:: dw
wc9d3:: ds 1
wc9d4:: ds 1
wc9d5:: ds 1
wc9d6:: ds 1
wTextYesNoSelection:: ds 1
wc9d8:: ds 1
wc9d9:: ds 1
wCurBackground:: ds 1
wc9db:: ds 1
wMapEnemyEventFlag:: dw
wc9de:: ds 1
wc9df:: ds 1
wc9e0:: ds 1
wBattlePlayerDenjuuName:: ds 1
wc9e2:: ds 1
wc9e3:: ds 1
wc9e4:: ds 1
wc9e5:: ds 1
wc9e6:: ds 1
wc9e7:: ds 1
wc9e8:: ds 1
wc9e9:: ds 1
wc9ea:: ds 1
wc9eb:: ds 1
wBlockDataBank:: ds 1
wc9ed:: ds 1
wCurTilesetBank:: ds 1
wCurStandingTile:: ds 1
wc9f0:: ds 1
wc9f1:: ds 1
wc9f2:: ds 1
wc9f3:: ds 1
wCurPlayerFacing:: ds 1
wc9f5:: ds 1
wCurTilesetMetatilesPointer:: dw
wCurTilesetMetaattrsPointer:: dw
wCurTilesetCollisionPointer:: dw
wBGMapAnchor:: dw
wc9fe:: ds 1
wc9ff:: ds 1

wTextboxBuffer::
wMapHeader:: ds 1
wca01:: ds 1
wca02:: ds 1
wca03:: ds 1
wca04:: ds 1
wca05:: ds 1
wca06:: ds 1
wca07:: ds 1
wca08:: ds 1
wca09:: ds 1
wca0a:: ds 1
wca0b:: ds 1
wca0c:: ds 1
wca0d:: ds 1
wca0e:: ds 1
wca0f:: ds 1
wPhoneNumberBuffer:: ds 1
wca11:: ds 1
wca12:: ds 1
wca13:: ds 1
wca14:: ds 1
wca15:: ds 1
wca16:: ds 1
wca17:: ds 1
wca18:: ds 1
wca19:: ds 1
wca1a:: ds 1
wca1b:: ds 1
wca1c:: ds 1
wca1d:: ds 1
wca1e:: ds 1
wca1f:: ds 1
wca20:: ds 1
wca21:: ds 1
wca22:: ds 1
wca23:: ds 1
wca24:: ds 1
wca25:: ds 1
wca26:: ds 1
wca27:: ds 1
wca28:: ds 1
wca29:: ds 1
wca2a:: ds 1
wca2b:: ds 1
wca2c:: ds 1
wca2d:: ds 1
wca2e:: ds 1
wca2f:: ds 1
wca30:: ds 1
wca31:: ds 1
wca32:: ds 1
wca33:: ds 1
wca34:: ds 1
wca35:: ds 1
wca36:: ds 1
wca37:: ds 1
wca38:: ds 1
wca39:: ds 1
wca3a:: ds 1
wca3b:: ds 1
wca3c:: ds 1
wca3d:: ds 1
wca3e:: ds 1
wca3f:: ds 1
wca40:: ds 1
wca41:: ds 1
wca42:: ds 1
wca43:: ds 1
wca44:: ds 1
wca45:: ds 1
wca46:: ds 1
wca47:: ds 1
wca48:: ds 1
wca49:: ds 1
wca4a:: ds 1
wca4b:: ds 1
wca4c:: ds 1
wca4d:: ds 1
wca4e:: ds 1
wca4f:: ds 1
wRequestedPartnerDenjuuSprite:: ds 1
wLoadedPartnerDenjuuSprite:: ds 1
wca52:: ds 1

wSpeciesNameBuffer:: ds 10
wNumIdleFrames:: ds 1
wca5e:: ds 1
wca5f:: ds 1
wca60:: ds 1
wca61:: ds 1
wPartnerDenjuuSpriteBank:: ds 1
wPartnerDenjuuSpriteAddr:: dw
wca65:: ds 1
wSpecialID:: ds 1
wca67:: ds 1
wScriptCount:: ds 1
wWhichPhoneNumberSymbolCode:: ds 1
wMathBuffer3:: ds 1
wCustomSpriteDest:: ds 2
wSpriteDestIsCustom:: ds 1
wca6e:: ds 1
wOverworldFrameCounterHi:: ds 1

SECTION "Overworld Map", WRAM0 [$ca70]
wOverworldMap:: ; ca70
	ds (SCREEN_WIDTH / 2) * ((SCREEN_HEIGHT +- 2) / 2)
wOverworldMapEnd:: ; cac0

wPlayerIsRunning:: ds 1
wcac1:: ds 1
wcac2:: ds 1
wcac3:: ds 1
wcac4:: ds 1
wcac5:: ds 1
wcac6:: ds 1
wcac7:: ds 1
wcac8:: ds 1
wcac9:: ds 1
wcaca:: ds 1
wcacb:: ds 1
wcacc:: ds 1
wcacd:: ds 1
wcace:: ds 1
wcacf:: ds 1
wPhoneIsRinging:: ds 1
wcad1:: ds 1
wcad2:: ds 1
wcad3:: ds 1
wScreenShakeMagnitude:: ds 1
wScreenShakePhase:: ds 1
wScreenShakeDirection:: ds 1
wScreenShakeXOffset:: ds 1
wScreenShakeYOffset:: ds 1
wScriptVar:: ds 1
wcada:: ds 1
wcadb:: ds 1
wcadc:: ds 1
wcadd:: ds 1
wcade:: ds 1

wBackupObjectVisibilityFlags:: ds 1
wcae0:: ds 1
wcae1:: ds 1
wcae2:: ds 1
wcae3:: ds 1
wcae4:: ds 1
wcae5:: ds 1
wcae6:: ds 1
wcae7:: ds 1
wcae8:: ds 1

wcae9:: ds 1
wcaea:: ds 1
wcaeb:: ds 1
wcaec:: ds 1
wcaed:: ds 1
wcaee:: ds 1
wcaef:: ds 1
wcaf0:: ds 1
wcaf1:: ds 1
wcaf2:: ds 1
wcaf3:: ds 1
wcaf4:: ds 1
wcaf5:: ds 1
wcaf6:: ds 1

wcaf7:: ds 1
wcaf8:: ds 1
wcaf9:: ds 1
wcafa:: ds 1
wPhoneCallPointerOrIdxs:: dw
wCallerID:: ds 1
wOverworldRingtoneSubroutine:: ds 1
wcaff:: ds 1
wcb00:: ds 1
wcb01:: ds 1
wDenjuuPicBank:: ds 1
wcb03:: ds 1
wcb04:: ds 1

	ds 3

wcb08:: ds 14

SECTION "CB20", WRAM0 [$cb20]
wcb20:: ds 1
wcb21:: ds 1
wcb22:: ds 1
wcb23:: ds 1
wcb24:: ds 1
wcb25:: ds 1
wStdLayoutIndexBuffer:: ds 1
wCurFadeProgram:: ds 1
wcb28:: ds 1
wEnteredAtLeastOneDigit:: ds 1
wPlayerNameEntryKeypadLayout:: ds 1
wcb2b:: ds 1
wIntroMovieSceneTimer::
wcb2c:: ds 1
wTFangerPicIndexOffset:: ds 1
wTFangerPicBank:: ds 1
wcb2f:: ds 1
wcb30:: ds 1
wcb31:: ds 1
wcb32:: ds 1
wcb33:: ds 1
wcb34:: ds 1
wcb35:: ds 1
wcb36:: ds 1
wcb37:: ds 1
wCurrentPlayerOrDenjuuNameBufferLength:: ds 1
wDShotDialBufferSize:: ds 1
wcb3a:: ds 1
wcb3b:: ds 1
wcb3c:: ds 1
wcb3d:: ds 1
wCurOptionHover:: ds 1
wLinkMode:: ds 1
wSoundTestSFXID:: ds 1
wSoundTestMusicID:: ds 1
wSoundTestMenuCursor:: ds 1
wcb43:: ds 1

SECTION "CB65", WRAM0 [$cb65]
wPhoneKeypadCursorPosition:: ds 1
wcb66:: ds 1
wPhoneScreenCursorPosition:: ds 1
wNumMailMessages::
wNumRecentCalls::
wNumNotesInCurDMelo:: ds 1
wDMeloPage:: ds 1
wcb6a:: ds 1
wcb6b:: ds 1
wDShotPageTop:: ds 1
wDShotPageCursor:: ds 1
wcb6e:: ds 1
wcb6f:: ds 1
wcb70:: ds 1
wcb71:: ds 1
wLastDenjuuSeenOrCaught:: ds 1
wcb73:: ds 1
wcb74:: ds 1
wcb75:: ds 1
wNumDenjuuSeen:: ds 1

SECTION "CB80", WRAM0 [$cb80]
wcb80:: ds $40
wcbc0:: ds 8

SECTION "SGB RAM", WRAM0 [$cc00]
wcc00:: ds 1
wcc01:: ds 1
wcc02:: ds 1
wcc03:: ds 1
wcc04:: ds 1
wcc05:: ds 1
wcc06:: ds 1
wcc07:: ds 1
wcc08:: ds 1
wcc09:: ds 1
wcc0a:: ds 1
wcc0b:: ds 1
wcc0c:: ds 1
wcc0d:: ds 1
wcc0e:: ds 1
wcc0f:: ds 1

SECTION "Script RAM", WRAM0 [$cd00]
wScriptData::
wcd00:: ds 1
wScriptBank:: ds 1
wScriptNumber:: dw
wcd04:: ds 1
wcd05:: ds 1
wScriptOffset:: dw

wScriptBuffer:: ds 8

wScriptDelay:: ds 1

SECTION "Misc RAM CD20", WRAM0 [$cd20]
wcd20:: ds 1
wIdleHUDVisible:: ds 1
wCurInGamePhoneMenuSelection:: ds 1
wDexCurDenjuu:: ds 1
wcd24:: ds 1
wcd25:: ds 1
wcd26:: ds 1
wBattleAnimations:: ds 1
wcd28:: ds 1
wIdleHUDOnBottomOfScreen:: ds 1
	ds $e
wcd38:: ds 12
wcd44:: ds 12
wCurMapScripts:: ds 15 * 2

SECTION "DShot history", WRAM0 [$cd70]
wRecentCalls:: ds 4 * 8
wMailMessages:: ds 4 * 8

wcdb0:: ds 1
wFontPaletteMode:: ds 1
wcdb2:: ds 1
wUIColor:: ds 1
wAddressBookIndexOfPartnerDenjuu:: ds 1
wDShotLevel:: ds 1
wcdb6:: ds 1
wTextJoyNew:: ds 1
wNumFramesHoldingADuringText:: ds 1
wcdb9:: ds 1
wcdba:: ds 1
wcdbb:: ds 1
wItems:: ds 1
wcdbd:: ds 1
wcdbe:: ds 1
wcdbf:: ds 1
wcdc0:: ds 1
wcdc1:: ds 1
wcdc2:: ds 1
wcdc3:: ds 1
wcdc4:: ds 1
wcdc5:: ds 1
wcdc6:: ds 1
wcdc7:: ds 1
wcdc8:: ds 1
wcdc9:: ds 1
wcdca:: ds 1
wcdcb:: ds 1
wcdcc:: ds 1
wcdcd:: ds 1
wcdce:: ds 1
wcdcf:: ds 1
wcdd0:: ds 1
wcdd1:: ds 1
wcdd2:: ds 1
wcdd3:: ds 1
wcdd4:: ds 1
wcdd5:: ds 1
wcdd6:: ds 1
wcdd7:: ds 1
wcdd8:: ds 1
wcdd9:: ds 1
wcdda:: ds 1
wcddb:: ds 1
wcddc:: ds 1
wcddd:: ds 1
wcdde:: ds 1
wcddf:: ds 1
wcde0:: ds 1
wcde1:: ds 1
wcde2:: ds 1
wcde3:: ds 1
wcde4:: ds 1
wcde5:: ds 1
wcde6:: ds 1
wcde7:: ds 1
wcde8:: ds 1
wcde9:: ds 1
wcdea:: ds 1
wcdeb:: ds 1
wcdec:: ds 1
wcded:: ds 1
wcdee:: ds 1
wcdef:: ds 1
wcdf0:: ds 1
wcdf1:: ds 1
wcdf2:: ds 1
wcdf3:: ds 1
wcdf4:: ds 1
wcdf5:: ds 1
wcdf6:: ds 1
wcdf7:: ds 1
wcdf8:: ds 1
wcdf9:: ds 1
wcdfa:: ds 1
wcdfb:: ds 1
wcdfc:: ds 1
wcdfd:: ds 1
wcdfe:: ds 1
wcdff:: ds 1
wScriptDataEnd::

SECTION "Sound Channels", WRAM0 [$ce00]
wChannel1:: channel_struct wChannel1
wChannel2:: channel_struct wChannel2
wChannel3:: channel_struct wChannel3
wChannel4:: channel_struct wChannel4
wChannel5:: channel_struct wChannel5
wChannel6:: channel_struct wChannel6

SECTION "Sound Engine", WRAM0 [$cf00]
wcf00:: ds $40
wcf40:: ds $40

SECTION "PCM", WRAM0 [$cf8a]
wcf8a:: ds 1
wcf8b:: ds 1
wcf8c:: ds 1

SECTION "Audio RAM", WRAM0 [$cf90]
wSoundUpdatesDisabled:: ds 1
wcf91:: ds 1
wChannelFlagsBuffer:: ds 1
wCurChannelFlags:: ds 1
wcf94:: ds 1
wcf95:: ds 1
wMusicFade:: ds 1
wCurMusicFade:: ds 1
wVolume:: ds 1
wcf99:: ds 1
wcf9a:: ds 1
wcf9b:: ds 1

SECTION "Audio RAM 2", WRAM0 [$cfb0]
wcfb0:: ds 1
wcfb1:: ds 1
wcfb2:: ds 1
wcfb3:: ds 1
wcfb4:: ds 1
wcfb5:: ds 1

SECTION "Audio RAM 3", WRAM0 [$cfc0]
wRingtoneID:: ds 1
wRingtonePointer:: dw
wcfc3:: ds 1
wcfc4:: ds 1
wcfc5:: ds 1
wcfc6:: ds 1
wcfc7:: ds 1
wcfc8:: ds 1
wAudioSRAMBank:: ds 1

SECTION "Sound Top", WRAM0 [$cff0]
wcff0:: ds 6

	ds 2
wMusicBank:: ds 1

SECTION "WRAM 1", WRAMX, BANK [1]
wDMeloBuffer::
wBattleRecruitRateBuffer::
wd000:: ds $ff
wd0ff:: ds $1
wd100:: ds $e2
wDMeloBufferEnd::

SECTION "D200", WRAMX [$d200], BANK [1]
wDMeloBufferBackup::
wd200:: ds $100
wd300:: ds $100

SECTION "Battle RAM", WRAMX [$d400], BANK [1]
wBattleSubroutine:: ds 1
wd401:: ds 1
wCurWildDenjuuEncounterTableIndex:: ds 1
wBattleMode::
; 0 - wild
; 1 - tfanger
; 2 - boss denjuu
	ds 1
wd404:: ds 1
wd405:: ds 1
wOtherTFangerClass:: ds 1
wBattleResult:: ds 1
wd408:: ds 1
wd409:: ds 1
BattleResults_CurBattleDenjuu:: ds 1
wd40b:: ds 1
wNumDenjuuInAddressBook:: ds 1
wd40d:: ds 1
wd40e:: ds 1
wd40f:: ds 1
wd410:: ds 1
wStartObjectAnimationIDX:: ds 1
wBattleEnded:: ds 1
wd413:: ds 1
wBattleMenuSelection:: ds 1
wd415:: ds 1
wBattleTurn:: ds 1
wCurMoveTarget:: ds 1
wd418:: ds 1
wd419:: ds 1
wd41a:: ds 1
wd41b:: ds 1
wd41c:: ds 1
wBattleMenuCursorObjectTemplateIDX:: ds 1
wCurDenjuuMaxMoveIndex:: ds 1
wMoveAnimationSubroutine:: ds 1
wd420:: ds 1
wd421:: ds 1
wd422:: ds 1
wd423:: ds 1
wd424:: ds 1
wd425:: ds 1
wd426:: ds 1
wd427:: ds 1
wd428:: ds 1
wd429:: ds 1
wd42a:: ds 1
wd42b:: ds 1
wd42c:: ds 1
wd42d:: ds 1
wd42e:: ds 1
wd42f:: ds 1
wd430:: ds 1
wd431:: ds 1
wd432:: ds 1
wd433:: ds 1
wd434:: ds 1
wNamedObjectIndexBuffer:: ds 1
wd436:: ds 1
wd437:: ds 1
wd438:: ds 1
wd439:: ds 1
wd43a:: ds 1
wd43b:: ds 1
wd43c:: ds 1
wd43d:: ds 1
wWhichBattleMenuCursor:: ds 1
wd43f:: ds 1
wStringBuffer:: ds 8


wBattleTargetName:: ; ds DENJUU_NAME_LENGTH
	ds 4
wEvolutionTimer::
	ds 2
wd44e::
	ds 1
wDefendingDenjuuType:: ds 1
wd450:: ds 1
wd451:: ds 1
wd452:: ds 1
wd453:: ds 1
wd454:: ds 1
wd455:: ds 1
wd456:: ds 1
wd457:: ds 1
wd458:: ds 1
wd459:: ds 1
wMoveAnimationTimer:: ds 1
wd45b:: ds 1
wd45c:: ds 1
wd45d:: ds 1
wd45e:: ds 1
wCurDenjuuStat:: ds 1
wBattleUserName:: ds DENJUU_NAME_LENGTH
wd467:: ds 1
wd468:: ds 1
wNotVeryEffective:: ds 1
wd46a:: ds 1
wd46b:: ds 1
wd46c:: ds 1
wd46d:: ds 1
wd46e:: ds 1
wCurMove:: ds 1
wd470:: ds 1
wd471:: ds 1
wd472:: ds 1
wd473:: ds 1
wCurBattleDenjuu:: ds 1
wCurBattleDenjuu2:: ds 1
wCurBattleDenjuu3:: ds 1
wCurEnemyDenjuu:: ds 1
wCurEnemyDenjuu2:: ds 1
wCurEnemyDenjuu3:: ds 1
wd47a:: ds 1
wd47b:: ds 1
wd47c:: ds 1
wd47d:: ds 1
wd47e:: ds 1
wd47f:: ds 1
wRecruitedDenjuuSpecies:: ds 1
wRecruitedDenjuuLevel:: ds 1
wRecruitedDenjuuInitialFD:: ds 1
wRecruitedDenjuuField0x03:: ds 1
wd484:: ds 1
wd485:: ds 1
wd486:: ds 1
wd487:: ds 1
wd488:: ds 1
wd489:: ds 1
wd48a:: ds 1
wd48b:: ds 1
wd48c:: ds 1
wd48d:: ds 1
wd48e:: ds 1
wd48f:: ds 1
wd490:: ds 1
wd491:: ds 1
wd492:: ds 1
wd493:: ds 1
wd494:: ds 1
wd495:: ds 1
wd496:: ds 1
wCurDenjuu:: ds 1
wCurDenjuuLevel:: ds 1
wd499:: ds 1
wSuperEffective:: ds 1
wd49b:: ds 1
wTempWildDenjuuLevel:: ds 1
wPlayerDenjuu1LastMoveSelection:: ds 1
wPlayerDenjuu2LastMoveSelection:: ds 1
wPlayerDenjuu3LastMoveSelection:: ds 1
wd4a0:: ds 1
wd4a1:: ds 1
wd4a2:: ds 1
wd4a3:: ds 1
wd4a4:: ds 1
wExperiencePointsToNextLevel:: dw
wFirstEmptySlotInAddressBook:: ds 1
wd4a8:: ds 1
wd4a9:: ds 1
wd4aa:: ds 1
wLegendaryInParty:: ds 1
wd4ac:: ds 1
wd4ad:: ds 1
wExperiencePointsAfterAward:: dw
wd4b0:: ds 1
wBattleStringBuffer:: ds 1
wd4b2:: ds 1
wd4b3:: ds 1
wd4b4:: ds 1
wd4b5:: ds 1
wd4b6:: ds 1
wd4b7:: ds 1
wd4b8:: ds 1
wd4b9:: ds 1
wd4ba:: ds 1
wd4bb:: ds 1
wd4bc:: ds 1
wd4bd:: ds 1
wd4be:: ds 1
wd4bf:: ds 1
wd4c0:: ds 1
wd4c1:: ds 1
wd4c2:: ds 1
wd4c3:: ds 1
wd4c4:: ds 1
wd4c5:: ds 1
wd4c6:: ds 1
wd4c7:: ds 1
wd4c8:: ds 1
wLearnedMove:: ds 1
wd4ca:: ds 1
wd4cb:: ds 1
wd4cc:: ds 1
wd4cd:: ds 1
wd4ce:: ds 1
wd4cf:: ds 1
wd4d0:: ds 1
wd4d1:: ds 1
wd4d2:: ds 1
wd4d3:: ds 1
wd4d4:: ds 1
wd4d5:: ds 1
wd4d6:: ds 1
wd4d7:: ds 1
wd4d8:: ds 1
wd4d9:: ds 1
wd4da:: ds 1
wd4db:: ds 1
wd4dc:: ds 1
wd4dd:: ds 1
wd4de:: ds 1
wd4df:: ds 1
wTempWildDenjuuSpecies:: ds 1
wd4e1:: ds 1
wd4e2:: ds 1
wd4e3:: ds 1
wd4e4:: ds 1
wd4e5:: ds 1
wNumAlivePlayerDenjuu:: ds 1
wNumAliveEnemyDenjuu:: ds 1
wCurPlayerHPorDP:: ds 1
wCurEnemyHPorDP:: ds 1
wd4ea:: ds 1
wd4eb:: ds 1
wd4ec:: ds 1
wd4ed:: ds 1
wd4ee:: ds 1
wd4ef:: ds 1

wSpriteInitXCoordBuffers:: ds 6
wSpriteInitYCoordBuffers:: ds 6

wd4fc:: ds 1
wd4fd:: ds 1
wd4fe:: ds 1
wd4ff:: ds 1

wPlayerDenjuu1:: battle_struct wPlayerDenjuu1
wPlayerDenjuu2:: battle_struct wPlayerDenjuu2
wPlayerDenjuu3:: battle_struct wPlayerDenjuu3

wEnemyDenjuu1:: battle_struct wEnemyDenjuu1
wEnemyDenjuu2:: battle_struct wEnemyDenjuu2
wEnemyDenjuu3:: battle_struct wEnemyDenjuu3

wCurDenjuuBuffer:: battle_struct wCurDenjuuBuffer

wd59a:: ds 1
wd59b:: ds 1
wd59c:: ds 1
wd59d:: ds 1
wd59e:: ds 1
wd59f:: ds 1
wd5a0:: ds 1
wd5a1:: ds 1
wd5a2:: ds 1
wd5a3:: ds 1
wd5a4:: ds 1
wd5a5:: ds 1
wd5a6:: ds 1
wd5a7:: ds 1
wd5a8:: ds 1
wd5a9:: ds 1
wd5aa:: ds 1
wd5ab:: ds 1
wDenjuu1LeveledUp:: ds 1
wDenjuu2LeveledUp:: ds 1
wDenjuu3LeveledUp:: ds 1
wd5af:: ds 1
wDenjuu1ExpGain:: dw
wDenjuu2ExpGain:: dw
wDenjuu3ExpGain:: dw
wd5b6:: ds 1
wd5b7:: ds 1
wd5b8:: ds 1
wd5b9:: ds 1
wd5ba:: ds 1
wd5bb:: ds 1
wd5bc:: ds 1
wd5bd:: ds 1
wd5be:: ds 1
wd5bf:: ds 1
wd5c0:: ds 1
wd5c1:: ds 1
wd5c2:: ds 1
wd5c3:: ds 1
wd5c4:: ds 1
wd5c5:: ds 1
wPlayerPartySize:: ds 1
wEnemyPartySize:: ds 1
wExperiencePointsBeforeAward:: dw
wPlayerDenjuu1AttackedOnItsOwn:: ds 1
wPlayerDenjuu2AttackedOnItsOwn:: ds 1
wPlayerDenjuu3AttackedOnItsOwn:: ds 1
wd5cd:: ds 1
wd5ce:: ds 1
wd5cf:: ds 1
wd5d0:: ds 1
wd5d1:: ds 1
wd5d2:: ds 1
wd5d3:: ds 1
wd5d4:: ds 1
wd5d5:: ds 1
wd5d6:: ds 1
wd5d7:: ds 1
wd5d8:: ds 1
wd5d9:: ds 1
wd5da:: ds 1
wd5db:: ds 1
wd5dc:: ds 1
wd5dd:: ds 1
wd5de:: ds 1
wd5df:: ds 1

SECTION "Serial RAM", WRAMX [$da00], BANK [1]
wSerialSendQueue:: ds $100
wSerialReceiveQueue:: ds $100
wdc00:: ds 1
wdc01:: ds 1
wdc02:: ds 1
wdc03:: ds 1
wdc04:: ds 1
wdc05:: ds 1
wdc06:: ds 1
wdc07:: ds 1
wdc08:: ds 1
wdc09:: ds 1
wdc0a:: ds 1
wdc0b:: ds 1
wdc0c:: ds 1
wdc0d:: ds 1
wdc0e:: ds 1
wdc0f:: ds 1
wdc10:: ds 1
wInternalSerialReceiveBuffer:: ds 1
wdc12:: ds 1
wdc13:: ds 1
wdc14:: ds 1
wdc15:: ds 1
wdc16:: ds 1
wdc17:: ds 1
wdc18:: ds 1
wdc19:: ds 1
wdc1a:: ds 1
wdc1b:: ds 1
wdc1c:: ds 1
wdc1d:: ds 1
wdc1e:: ds 1
wdc1f:: ds 1
wdc20:: ds 1
wdc21:: ds 1
wdc22:: ds 1
wdc23:: ds 1
wdc24:: ds 1
wdc25:: ds 1
wdc26:: ds 1
wInternalSerialSendBuffer:: ds 1
wdc28:: ds 1
wdc29:: ds 1
wdc2a:: ds 1
wdc2b:: ds 1
wdc2c:: ds 1
wdc2d:: ds 1
wSerialReceive:: ds 1
wdc2f:: ds 1
wdc30:: ds 1
wdc31:: ds 1
wdc32:: ds 1
wdc33:: ds 1
wSerialSend:: ds 1
wdc35:: ds 1
wdc36:: ds 1
wdc37:: ds 1
wdc38:: ds 1
wdc39:: ds 1
wSerialSendQueueSize:: ds 1
wdc3b:: ds 1
wSerialSendQueuePointer:: ds 1
wdc3d:: ds 1
wDataStagedForSerialSend:: ds 1
wSerialReceiveQueueSize:: ds 1
wdc40:: ds 1
wSerialReceiveQueuePointer:: ds 1
wdc42:: ds 1
wDataStagedForSerialReceive:: ds 1
wdc44:: ds 1
wdc45:: ds 1
wdc46:: ds 1
wdc47:: ds 1
wdc48:: ds 1
wdc49:: ds 1
wdc4a:: ds 1
wdc4b:: ds 1
wdc4c:: ds 1
wdc4d:: ds 1
wdc4e:: ds 1
wdc4f:: ds 1
wdc50:: ds 1
wdc51:: ds 1
wdc52:: ds 1
wdc53:: ds 1
wdc54:: ds 1
wdc55:: ds 1
wdc56:: ds 1
wdc57:: ds 1
wdc58:: ds 1
wdc59:: ds 1
wdc5a:: ds 1
wdc5b:: ds 1
wdc5c:: ds 1
wdc5d:: ds 1
wdc5e:: ds 1
wdc5f:: ds 1
wdc60:: ds 1
wdc61:: ds 1
wdc62:: ds 1
wdc63:: ds 1
wdc64:: ds 1
wdc65:: ds 1
wdc66:: ds 1
wdc67:: ds 1
wdc68:: ds 1
wdc69:: ds 1
wdc6a:: ds 1
wdc6b:: ds 1
wdc6c:: ds 1
wdc6d:: ds 1
wdc6e:: ds 1
wdc6f:: ds 1
wdc70:: ds $6

SECTION "CGB Palettes", WRAMX [$dd00], BANK [1]
wBGPalUpdate:: ds 1
wCGB_BGLayoutIndex:: ds 2 ; bigdw
wOBPalUpdate:: ds 1
wCGB_OBLayoutIndex:: ds 2 ; bigdw
wLoadStdAttrMap:: ds 1

SECTION "Palette Buffers", WRAMX [$dd10], BANK [$1]
wCGB_BGPalsBuffer::
	ds 8 palettes
wCGB_OBPalsBuffer::
	ds 8 palettes

SECTION "BG Fade Component Buffer", WRAMX [$de00], BANK [$1]
wCGB_BGPalFadeComponentBuffer:: ds 1

SECTION "OB Fade Component Buffer", WRAMX [$de60], BANK [$1]
wCGB_OBPalFadeComponentBuffer::
	ds 8 * 12

SECTION "CGB Palette Fade Buffer", WRAMX [$dec0], BANK [1]
wCGBPalFadeBuffer::
	ds 8 * 8

SECTION "Stack", WRAMX [$df00], BANK [1]
wStackBottom::
	ds $ff
wStackTop::
