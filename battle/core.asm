BattleCore_IncrementD401:
	ld hl, wd401
	inc [hl]
	ret

Func_14005:
	ld a, $4
	jp StartFade_

Func_1400a:
	ld a, $f0
	ld [wTileWhere0IsLoaded], a
	jp LoadSpecialFontTiles

Func_14012: ; 14012 (5:4012)
	ld de, wBattleStringBuffer
	ld c, $9
	jr asm_14025

CopyBattleUserName: ; 14019 (5:4019)
	ld de, wBattleUserName
	ld c, $9
	jr asm_14025

Func_14020:
	ld de, wBattleStringBuffer
	ld c, $11
asm_14025
	ld b, $0
	jp CopyData

Func_1402a: ; 1402a (5:402a)
	ld hl, wd420
	ld a, $8
	ld [wMoveAnimationTimer], a
.asm_14032
	ld a, [bc]
	cp $c0
	jr z, .asm_14043
	ld [hl], a
	inc hl
	inc bc
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	jr nz, .asm_14032
.asm_14043
	ld a, $e0
	ld [hl], a
	ld hl, wd420
	ret

UpdatePlayerHUD:
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call DrawPlayerDenjuuHPBar
	ld a, [wCurBattleDenjuu]
	call DrawPlayerDPBar
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, VTilesBG tile $20
	jp PlacePlayerDenjuuNickname

UpdateEnemyHUD:
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	call DrawEnemyDenjuuHPBar
	ld a, [wCurEnemyDenjuu]
	call DrawEnemyDPBar
	ld a, [wCurDenjuuBufferSpecies]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	jp GetAndPrintName75LeftAlign_

DrawPlayerDenjuuHPBar: ; 1407d (5:407d)
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call CalcHPBarLength
	ld [wCurPlayerHPorDP], a
	or a
	jr nz, .asm_14098
	ld a, [wCurDenjuuBufferCurHP]
	or a
	jr z, .asm_14098
	ld a, $1
	ld [wCurPlayerHPorDP], a
.asm_14098
	ld d, $1
	ld a, [wCurPlayerHPorDP]
	call SetHPBarPalette
	ld a, [wCurPlayerHPorDP]
	ld c, $0
	hlbgcoord 3, 2
	jp DrawHPBar

DrawEnemyDenjuuHPBar: ; 140ab (5:40ab)
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call CalcHPBarLength
	ld [wCurEnemyHPorDP], a
	or a
	jr nz, .asm_140c6
	ld a, [wCurDenjuuBufferCurHP]
	or a
	jr z, .asm_140c6
	ld a, $1
	ld [wCurEnemyHPorDP], a
.asm_140c6
	ld d, $2
	ld a, [wCurEnemyHPorDP]
	call SetHPBarPalette
	ld a, [wCurEnemyHPorDP]
	ld c, $1
	hlbgcoord 6, 10, VWindow
	jp DrawHPBar

DrawPlayerDPBar: ; 140d9 (5:40d9)
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferCurMaxDP]
	ld e, a
	ld a, [wCurDenjuuBufferCurDP]
	call CalcHPBarLength
	ld [wCurPlayerHPorDP], a
	or a
	jr nz, .asm_140f7
	ld a, [wCurDenjuuBufferCurDP]
	or a
	jr z, .asm_140f7
	ld a, $1
	ld [wCurPlayerHPorDP], a
.asm_140f7
	ld a, [wCurPlayerHPorDP]
	ld c, $0
	hlbgcoord 3, 3
	jp DrawHPBar

DrawEnemyDPBar: ; 14102 (5:4102)
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferCurMaxDP]
	ld e, a
	ld a, [wCurDenjuuBufferCurDP]
	call CalcHPBarLength
	ld [wCurEnemyHPorDP], a
	or a
	jr nz, .asm_14120
	ld a, [wCurDenjuuBufferCurDP]
	or a
	jr z, .asm_14120
	ld a, $1
	ld [wCurEnemyHPorDP], a
.asm_14120
	ld a, [wCurEnemyHPorDP]
	ld c, $1
	hlbgcoord 6, 11, VWindow
	jp DrawHPBar

GetNthPlayerDenjuu: ; 1412b (5:412b)
	ld hl, wPlayerDenjuu1
	jp GetNthDenjuuAnySide

GetNthEnemyDenjuu: ; 14131 (5:4131)
	ld hl, wEnemyDenjuu1
	jp GetNthDenjuuAnySide

GetNthDenjuuAnySide: ; 14137 (5:4137)
	ld de, $16
	addntimes_hl_de
	ld de, wCurDenjuuBuffer
	ld bc, $16
	jp CopyData

DrawSupportDenjuuArrivalBar_Pink:
	lb bc, $3, $d
	cp $0
	jr z, .asm_14167
	cp $1
	jr z, .asm_1415f
	cp $2
	jr z, .asm_14164
	lb bc, $d, $f
	jr .asm_14167

.asm_1415f
	lb bc, $3, $f
	jr .asm_14167

.asm_14164
	lb bc, $d, $d
.asm_14167
	push bc
	ld e, $8f
	ld a, $0
	call LoadStdBGMapLayout_
	pop bc
	inc bc
	ld e, $82
	ld a, $0
	jp LoadStdBGMapAttrLayout_

AnimateCurrentArrivalBarFrame:
	cp $1
	jr z, .asm_1418d
	cp $2
	jr z, .asm_14196
	cp $3
	jr z, .asm_1419f
	hlbgcoord 3, 14
	ld a, [wd430]
	jp Func_141a5

.asm_1418d
	hlbgcoord 3, 16
	ld a, [wd431]
	jp Func_141a5

.asm_14196
	hlbgcoord 13, 14
	ld a, [wd432]
	jp Func_141a5

.asm_1419f
	hlbgcoord 13, 16
	ld a, [wd433]
Func_141a5: ; 141a5 (5:41a5)
	ld c, $0
	jp DrawHPBar

DrawSupportDenjuuArrivalBar_Blue:
	lb bc, $3, $e
	cp $0
	jr z, .asm_141c6
	cp $1
	jr z, .asm_141be
	cp $2
	jr z, .asm_141c3
	lb bc, $d, $10
	jr .asm_141c6

.asm_141be
	lb bc, $3, $10
	jr .asm_141c6

.asm_141c3
	lb bc, $d, $e
.asm_141c6
	push bc
	ld e, $8d
	ld a, $0
	call LoadStdBGMapAttrLayout_
	pop bc
	dec bc
	ld e, $93
	ld a, $0
	jp LoadStdBGMapLayout_

AnimateCurrentSupportDenjuuHPBarFrame:
	cp $1
	jr z, .player_2
	cp $2
	jr z, .enemy_1
	cp $3
	jr z, .enemy_2
.player_1
	hlbgcoord 3, 14
	ld a, [wCurBattleDenjuu2]
	jp .animate_player

.player_2
	hlbgcoord 3, 16
	ld a, [wCurBattleDenjuu3]
.animate_player
	push hl
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call CalcHPBarLength
	ld [wCurPlayerHPorDP], a
	cp $0
	jr nz, .player_hp_bar_empty
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .player_hp_bar_empty
	ld a, $1
	ld [wCurPlayerHPorDP], a
.player_hp_bar_empty
	ld a, [wCurPlayerHPorDP]
	ld c, $0
	pop hl
	jp DrawHPBar

.enemy_1
	hlbgcoord 13, 14
	ld a, [wCurEnemyDenjuu2]
	jp .animate_enemy

.enemy_2
	hlbgcoord 13, 16
	ld a, [wCurEnemyDenjuu3]
.animate_enemy
	push hl
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call CalcHPBarLength
	ld [wCurEnemyHPorDP], a
	cp $0
	jr nz, .enemy_hp_bar_empty
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .enemy_hp_bar_empty
	ld a, $1
	ld [wCurEnemyHPorDP], a
.enemy_hp_bar_empty
	ld a, [wCurEnemyHPorDP]
	ld c, $0
	pop hl
	jp DrawHPBar

ShakePlayerDenjuuHUDFrame: ; 14255 (5:4255)
	ld a, [wd42d]
	inc a
	ld [wd42d], a
	cp $1
	jr z, .asm_1426c
	cp $2
	jr z, .asm_14275
	xor a
	ld [wd42d], a
	ld [wSCX], a
	ret

.asm_1426c
	ld a, [wSCX]
	sub $2
	ld [wSCX], a
	ret

.asm_14275
	ld a, [wSCX]
	add $2
	ld [wSCX], a
	ret

ShakeEnemyDenjuuHUDFrame: ; 1427e (5:427e)
	ld a, [wd42d]
	inc a
	ld [wd42d], a
	cp $1
	jr z, .asm_14293
	cp $2
	jr z, .asm_1429d
	xor a
	ld [wd42d], a
	jr .asm_142a7

.asm_14293
	ld a, [wWX]
	sub $2
	ld [wWX], a
	jr .asm_142a7

.asm_1429d
	ld a, [wWX]
	add $2
	ld [wWX], a
	jr .asm_142a7

.asm_142a7
	jp Func_142af

PlaceBattleString:
	ld b, $8
	jp PlaceString_

Func_142af: ; 142af (5:42af)
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	ret

Func_142ba:
	xor a
	call LoadUnknGfx090
	jp Func_142c1

Func_142c1: ; 142c1 (5:42c1)
	ld a, $1
	ld [wOBPalUpdate], a
	xor a
	ld bc, $4
	jp LoadNthStdOBPalette

Func_142cd:
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	jp CopyBattleUserName

LoadEnemyDenjuuBattlePic:
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	jp GetDenjuuPalette_Pal7

LoadPlayerDenjuuBattlePic:
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	jp GetDenjuuPalette_Pal6

PlacePlayerDenjuuNickname: ; 142f9 (5:42f9)
	push hl
	push af
	ld a, $8
	call ClearString
	call OpenSRAMBank2
	pop af
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	pop hl
	ld de, wBattlePlayerDenjuuName
	ld b, $6
	jp PlaceString_

LoadBattleMainLayout:
	lb bc, $1, $0
	ld e, $86
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
	ld e, $87
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, $0, $8
	ld e, $81
	ld a, $0
	call LoadStdWindowLayout_
	ld bc, $108
	ld e, $84
	ld a, $0
	jp LoadStdWindowAttrLayout_

Func_14340:
	call ShakePlayerDenjuuHUDFrame
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1
	jr c, .asm_1435e
	cp $2
	jr c, .asm_1436a
	ld a, $0
	ld [wMoveAnimationTimer], a
.asm_1435e
	lb bc, $1, $5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_14374

.asm_1436a
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
.asm_14374
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd45b]
	cp $a
	ret nz
	xor a
	ld [wd42d], a
	ld [wSCX], a
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ret

Func_1438d:
	call ShakeEnemyDenjuuHUDFrame
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1
	jr c, .asm_143ab
	cp $2
	jr c, .asm_143b7
	ld a, $0
	ld [wMoveAnimationTimer], a
.asm_143ab
	lb bc, $1, $1
	ld e, $91
	ld a, $0
	call LoadStdWindowLayout_
	jr .asm_143c1

.asm_143b7
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdWindowLayout_
.asm_143c1
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd45b]
	cp $a
	ret nz
	ld a, $58
	ld [wWX], a
	call Func_142af
	xor a
	ld [wd42d], a
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ret

Func_143df:
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_143e8
	sub QUICK_STEP - SPEED_UP
.asm_143e8
	cp RECOVER
	jr z, .asm_143f6
	cp RESTORE
	jr z, .asm_143f6
	cp SHIELD
	jr z, .asm_143f6
	xor a
	ret

.asm_143f6
	ld a, $1
	ret

UseMove:
	ld c, DENJUU_MOVE1
	add c
	ld c, a
	ld a, [wCurDenjuu]
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld hl, MoveNames
	ld [wNamedObjectIndexBuffer], a
	ld [wCurMove], a
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	jp Func_14012

DoBattle::
	ld a, [wSubroutine]
	jump_table
	dw Func_1442d
	dw Func_14430
	dw Func_1443b
	dw Func_1444c

Func_1442d: ; 1442d (5:442d)
	jp Func_14460

Func_14430: ; 14430 (5:4430)
	ld a, $0
	ld [wSubroutine], a
	ld a, $8 ; win
	ld [wGameRoutine], a
	ret

Func_1443b: ; 1443b (5:443b)
	ld a, [wPlayerDenjuu1CurHP]
	ld [wPartnerDenjuuHPRemaining], a
	ld a, $a
	ld [wSubroutine], a
	ld a, $5
	ld [wGameRoutine], a
	ret

Func_1444c: ; 1444c (5:444c)
	xor a
	ld [wd401], a
	ld a, $2
	ld [wBattleSubroutine], a
	ld a, $1
	ld [wSubroutine], a
	ld a, $f
	ld [wGameRoutine], a
	ret

Func_14460: ; 14460 (5:4460)
	ld a, [wLinkMode]
	or a
	jr z, .asm_14483
	ld a, [wBattleSubroutine]
	cp $37
	jr z, .asm_14483
	cp $38
	jr z, .asm_14483
	cp $39
	jr z, .asm_14483
	call Func_06b4
	ld a, [wFontSourceBank]
	or a
	jr z, .asm_14483
	ld a, $37
	ld [wBattleSubroutine], a
.asm_14483
	ld a, [wBattleSubroutine]
	jump_table
	dw Func_1457d
	dw Func_145a9
	dw StartBattleMusic
	dw Func_1463e
	dw Func_14681
	dw Battle_DrawMenuOrAttackOnYourOwn
	dw Battle_MenuSelection
	dw Battle_DrawMoveSelectionMenu
	dw Battle_MoveSelectionMenu
	dw Func_14ddd
	dw Func_14f81
	dw Func_1510a
	dw Func_1545c
	dw Func_1545f
	dw Func_157fb
	dw Func_159bc
	dw Func_15f2d
	dw Func_15f57
	dw Func_162cd
	dw Func_16348
	dw Battle_TryToRun
	dw Battle_RunAwayScrollScreen
	dw Battle_FinishRunAway
	dw Func_146e2
	dw Func_146f2
	dw Func_14707
	dw Func_148e9
	dw Func_148fc
	dw Func_14911
	dw Func_1464b
	dw Func_16099
	dw Func_16289
	dw Func_15fd6
	dw Func_16318
	dw Func_161fb
	dw Func_150f5
	dw Func_153ef
	dw Func_15f3d
	dw Func_14721
	dw Func_148ad
	dw Func_1492f
	dw Func_14aad
	dw Func_14f12
	dw Func_15f79
	dw Func_15428
	dw Func_15489
	dw Func_14af8
	dw Battle_DelayBeforeRunAway
	dw Func_163e0
	dw Func_15f66
	dw Func_15fa1
	dw Func_15fb4
	dw Func_15661
	dw Func_15292
	dw Func_15683
	dw Func_1452d
	dw Func_1454a
	dw Func_14566
	dw Func_1561e
	dw Func_15051
	dw Func_150e0
	dw Func_15416
	dw Func_14f32
	dw Func_15810

BattleString_Fight:
	db "たたかう    " ; FIGHT

BattleString_Run:
	db "にげる     " ; RUN

BattleString_Escaped:
	db "にげだした!  " ; Got away safely!

BattleString_Arrived:
	db "とうちゃく!  " ; has arrived!

Func_1452d: ; 1452d (5:452d)
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	lb bc, $0, $c
	ld e, $8a
	xor a
	call LoadStdBGMapAttrLayout_
	call Func_3f02
	ld c, $74
	call StdBattleTextBox
	jp NextBattleSubroutine

Func_1454a: ; 1454a (5:454a)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	call InitSerialData
	call BattleResults_ResetLCDCFlags_
	ld a, $10
	ld [wMusicFade], a
	ld a, $4
	call StartFade_
	jp NextBattleSubroutine

Func_14566: ; 14566 (5:4566)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld a, $3
	ld [wGameRoutine], a
	ret

Func_1457d: ; 1457d (5:457d)
	ld bc, $1
	call DecompressGFXByIndex_
	ld bc, $17
	call GetCGB_BGLayout_
	ld a, $28
	call LoadBackgroundPalette
	ld bc, $4
	call GetCGB_OBLayout_
	ld bc, $10
	call DecompressGFXByIndex_
	ld a, $20
	ld [wd4ee], a
	xor a
	ld [wCurMoveTarget], a
	ld [wBattleMenuSelection], a
	jp NextBattleSubroutine

Func_145a9: ; 145a9 (5:45a9)
	lb bc, $0, $0
	ld e, $f
	xor a
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $f
	xor a
	call LoadStdBGMapAttrLayout_
	lb bc, $0, $0
	ld e, $71
	xor a
	call LoadStdWindowLayout_
	lb bc, $0, $0
	ld e, $71
	xor a
	call LoadStdWindowAttrLayout_
	call Func_145d6
	call Func_1400a
	jp NextBattleSubroutine

Func_145d6: ; 145d6 (5:45d6)
	ld a, $58
	ld [wWX], a
	xor a
	ld [wWY], a
	ld a, [wLCDC]
	set 5, a
	ld [wLCDC], a
	ld a, [wLCDC]
	set 6, a
	ld [wLCDC], a
	ld a, $1
	ld [wc46c], a
	ret

StartBattleMusic: ; 145f5 (5:45f5)
	ld a, [wEnemyDenjuu1]
	call LoadEnemyDenjuuBattlePic
	ld a, [wPlayerDenjuu1]
	call LoadPlayerDenjuuBattlePic
	ld a, $60
	ld [wSCX], a
	ld a, $b8
	ld [wWX], a
	call Func_142af
	call Func_14005
	ld a, [wcd00]
	cp $1
	jr z, .asm_14627
	ld a, [wBattleMode]
	cp $1
	jr z, .asm_14623
	ld a, MUSIC_WILD_DENJUU_BATTLE
	jr .asm_14635

.asm_14623
	ld a, MUSIC_TFANGER_BATTLE
	jr .asm_14635

.asm_14627
	ld bc, EVENT_1F7
	call CheckEventFlag
	jr nz, .asm_14633
	ld a, MUSIC_BOSS_BATTLE
	jr .asm_14635

.asm_14633
	ld a, MUSIC_DOOMSDAY_BATTLE
.asm_14635
	call GetMusicBank
	ld [H_MusicID], a
	jp NextBattleSubroutine

Func_1463e: ; 1463e (5:463e)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $1d
	ld [wBattleSubroutine], a
	ret

Func_1464b: ; 1464b (5:464b)
	ld a, [wSCX]
	or a
	jr z, .asm_14656
	sub $8
	ld [wSCX], a
.asm_14656
	ld a, [wWX]
	cp $60
	jr c, .asm_14666
	sub $8
	ld [wWX], a
	call Func_142af
	ret

.asm_14666
	xor a
	ld [wSCX], a
	ld a, $58
	ld [wWX], a
	call Func_142af
	call LoadBattleMainLayout
	call UpdatePlayerHUD
	call UpdateEnemyHUD
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Func_14681: ; 14681 (5:4681)
	call Func_3f02
	ld a, [wd47f]
	cp $3
	jr nc, .enemy_turn
	xor a
	ld [wBattleTurn], a
	ld a, [wd47f]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, .asm_146ae
.loop
	ld a, [wd47f]
	ld b, a
	ld a, [wCurBattleDenjuu2]
	cp b
	jr z, .asm_146a8
	call Func_1651b
	jr .loop

.asm_146a8
	ld a, $17
	ld [wBattleSubroutine], a
	ret

.asm_146ae
	ld a, $26
	ld [wBattleSubroutine], a
	ret

.enemy_turn
	ld a, $1
	ld [wBattleTurn], a
	ld a, [wd47f]
	sub $3
	ld b, a
	ld a, [wCurEnemyDenjuu]
	cp b
	jr z, .asm_146dc
.asm_146c5
	ld a, [wd47f]
	sub $3
	ld b, a
	ld a, [wCurEnemyDenjuu2]
	cp b
	jr z, .asm_146d6
	call Func_1654b
	jr .asm_146c5

.asm_146d6
	ld a, $1a
	ld [wBattleSubroutine], a
	ret

.asm_146dc
	ld a, $28
	ld [wBattleSubroutine], a
	ret

Func_146e2: ; 146e2 (5:46e2)
	ld a, [wSCX]
	cp $50
	jr nc, .asm_146ef
	add $8
	ld [wSCX], a
	ret

.asm_146ef
	jp NextBattleSubroutine

Func_146f2: ; 146f2 (5:46f2)
	call Func_1651b
	call Func_1657b
	call UpdatePlayerHUD
	call Func_1643a
	ld a, [wCurBattleDenjuu]
	ld [wCurMoveTarget], a
	jp NextBattleSubroutine

Func_14707: ; 14707 (5:4707)
	ld a, [wSCX]
	or a
	jr z, .asm_14717
	cp $f0
	jr nc, .asm_14717
	sub $8
	ld [wSCX], a
	ret

.asm_14717
	xor a
	ld [wSCX], a
	ld a, $26
	ld [wBattleSubroutine], a
	ret

Func_14721: ; 14721 (5:4721)
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wNamedObjectIndexBuffer], a
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jr nz, .asm_14791
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, $3
	call UseMove
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurEnemyDenjuu]
	cp b
	jr z, .asm_1478b
	ld a, [wNumAliveEnemyDenjuu]
	cp $3
	jr z, .asm_14767
	cp $2
	jr z, .asm_1475d
	jp .asm_1478b

.asm_1475d
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurEnemyDenjuu2]
	cp b
	jr nz, .asm_1478b
.asm_14767
	lb bc, $1, $1
	ld e, $8b
	xor a
	call LoadStdWindowLayout_
.asm_14770
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurEnemyDenjuu]
	cp b
	jr z, .asm_1477f
	call Func_1654b
	jr .asm_14770

.asm_1477f
	call Func_1658d
	call UpdateEnemyHUD
	ld a, $3d
	ld [wBattleSubroutine], a
	ret

.asm_1478b
	ld a, $c
	ld [wBattleSubroutine], a
	ret

.asm_14791
	call CopyPlayerDenjuuNameToBattleUserName
	ld a, [wLinkMode]
	or a
	jp z, Func_147bb
	ld a, [wd458]
	cp $1
	jp z, Func_147bb
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $ee
	jp z, Func_147ef
	cp $e0
	jp z, Func_14855
Func_147bb: ; 147bb (5:47bb)
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $0
	jp z, Func_1486d
	cp $1
	jr z, Func_147ef
	cp $2
	jr z, Func_147ef
	cp $8
	jr z, Func_147ef
	cp $b
	jr z, Func_147ef
	call Func_16614
	cp $1
	jr z, Func_147ef
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	ld a, $cd
	add b
	ld b, a
	call Random
	cp $80
	jr nc, Func_14855
Func_147ef: ; 147ef (5:47ef)
	ld a, [wCurDenjuuBufferField0x12]
	call Func_148a3
	call StdBattleTextBox
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_1480c
	cp $2
	jr z, .asm_14815
	xor a
	ld [wPlayerDenjuu1Field0x12], a
	ld [wPlayerDenjuu1Field0x06], a
	jr .asm_1481c

.asm_1480c
	xor a
	ld [wPlayerDenjuu2Field0x12], a
	ld [wPlayerDenjuu2Field0x06], a
	jr .asm_1481c

.asm_14815
	xor a
	ld [wPlayerDenjuu3Field0x12], a
	ld [wPlayerDenjuu3Field0x06], a
.asm_1481c
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	ld a, [wd458]
	cp $0
	jp z, Func_14831
	ld a, $ee
	ld [wSerialSend], a
Func_14831: ; 14831 (5:4831)
	ld a, [wCurDenjuuBufferField0x12]
	cp $5
	jr z, .asm_1484f
	cp $7
	jr z, .asm_1484f
	cp $8
	jr z, .asm_1484f
	cp $b
	jr z, .asm_1484f
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld a, $27
	ld [wBattleSubroutine], a
	ret

.asm_1484f
	ld a, $30
	ld [wBattleSubroutine], a
	ret

Func_14855: ; 14855 (5:4855)
	ld a, [wd458]
	cp $0
	jp z, Func_14862
	ld a, $e0
	ld [wSerialSend], a
Func_14862: ; 14862 (5:4862)
	call Func_3f22
	ld a, [wCurDenjuuBufferField0x12]
	call Func_1489e
	jr asm_14890

Func_1486d: ; 1486d (5:486d)
	ld a, [wd458]
	cp $0
	jp z, Func_1487a
	ld a, $e8
	ld [wSerialSend], a
Func_1487a: ; 1487a (5:487a)
	ld hl, DenjuuBattleMessages
	call LoadDenjuuBattleCatchphrase_
	ld hl, wd4d0
	call Func_14020
	ld a, SFX_5C
	ld [H_SFX_ID], a
	call CopyPlayerDenjuuNameToBattleUserName
	ld c, $4
asm_14890
	call StdBattleTextBox
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld a, $27
	ld [wBattleSubroutine], a
	ret

Func_1489e: ; 1489e (5:489e)
	ld c, $35
	add c
	ld c, a
	ret

Func_148a3: ; 148a3 (5:48a3)
	ld c, $44
	add c
	ld c, a
	ret

Func_148a8:
	ld c, $53
	add c
	ld c, a
	ret

Func_148ad: ; 148ad (5:48ad)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr z, .asm_148e3
	cp $5
	jr z, .asm_148dd
	cp $7
	jr z, .asm_148dd
	cp $8
	jr z, .asm_148dd
	cp $b
	jr z, .asm_148dd
	cp $3
	jr z, .asm_148dd
	ld a, $5
	ld [wBattleSubroutine], a
	ret

.asm_148dd
	ld a, $e
	ld [wBattleSubroutine], a
	ret

.asm_148e3
	ld a, $9
	ld [wBattleSubroutine], a
	ret

Func_148e9: ; 148e9 (5:48e9)
	ld a, [wWX]
	cp $b9
	jr nc, .asm_148f9
	add $8
	ld [wWX], a
	call Func_142af
	ret

.asm_148f9
	jp NextBattleSubroutine

Func_148fc: ; 148fc (5:48fc)
	call Func_1654b
	call Func_1658d
	call UpdateEnemyHUD
	call Func_16461
	ld a, [wCurEnemyDenjuu]
	ld [wd418], a
	jp NextBattleSubroutine

Func_14911: ; 14911 (5:4911)
	ld a, [wWX]
	cp $59
	jr c, .asm_14921
	sub $8
	ld [wWX], a
	call Func_142af
	ret

.asm_14921
	ld a, $58
	ld [wWX], a
	call Func_142af
	ld a, $28
	ld [wBattleSubroutine], a
	ret

Func_1492f: ; 1492f (5:492f)
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wNamedObjectIndexBuffer], a
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jr nz, .asm_1499f
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, $3
	call UseMove
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, .asm_14999
	ld a, [wNumAlivePlayerDenjuu]
	cp $3
	jr z, .asm_14975
	cp $2
	jr z, .asm_1496b
	jp .asm_14999

.asm_1496b
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurBattleDenjuu2]
	cp b
	jr nz, .asm_14999
.asm_14975
	lb bc, $1, $5
	ld e, $8b
	xor a
	call LoadStdBGMapLayout_
.asm_1497e
	ld a, [wCurDenjuuBufferMoveTarget]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, .asm_1498d
	call Func_1651b
	jr .asm_1497e

.asm_1498d
	call Func_1657b
	call UpdatePlayerHUD
	ld a, $24
	ld [wBattleSubroutine], a
	ret

.asm_14999
	ld a, $c
	ld [wBattleSubroutine], a
	ret

.asm_1499f
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wLinkMode]
	cp $0
	jp z, Func_149cd
	ld a, [wd458]
	cp $1
	jp z, Func_149cd
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $ee
	jp z, Func_14a01
	cp $e0
	jp z, Func_14a67
Func_149cd: ; 149cd (5:49cd)
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $0
	jp z, Func_14a7f
	cp $1
	jr z, Func_14a01
	cp $2
	jr z, Func_14a01
	cp $8
	jr z, Func_14a01
	cp $b
	jr z, Func_14a01
	call Func_16614
	cp $1
	jr z, Func_14a01
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	ld a, $cd
	add b
	ld b, a
	call Random
	cp $80
	jr nc, Func_14a67
Func_14a01: ; 14a01 (5:4a01)
	ld a, [wCurDenjuuBufferField0x12]
	call Func_148a3
	call StdBattleTextBox
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_14a1e
	cp $2
	jr z, .asm_14a27
	xor a
	ld [wEnemyDenjuu1Field0x12], a
	ld [wEnemyDenjuu1Field0x06], a
	jr .asm_14a2e

.asm_14a1e
	xor a
	ld [wEnemyDenjuu2Field0x12], a
	ld [wEnemyDenjuu2Field0x06], a
	jr .asm_14a2e

.asm_14a27
	xor a
	ld [wEnemyDenjuu3Field0x12], a
	ld [wEnemyDenjuu3Field0x06], a
.asm_14a2e
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
	ld a, [wd458]
	cp $0
	jp z, Func_14a43
	ld a, $ee
	ld [wSerialSend], a
Func_14a43: ; 14a43 (5:4a43)
	ld a, [wCurDenjuuBufferField0x12]
	cp $5
	jr z, .asm_14a61
	cp $7
	jr z, .asm_14a61
	cp $8
	jr z, .asm_14a61
	cp $b
	jr z, .asm_14a61
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld a, $29
	ld [wBattleSubroutine], a
	ret

.asm_14a61
	ld a, $30
	ld [wBattleSubroutine], a
	ret

Func_14a67: ; 14a67 (5:4a67)
	ld a, [wd458]
	cp $0
	jp z, Func_14a74
	ld a, $e0
	ld [wSerialSend], a
Func_14a74: ; 14a74 (5:4a74)
	call Func_3f22
	ld a, [wCurDenjuuBufferField0x12]
	call Func_1489e
	jr asm_14a9f

Func_14a7f: ; 14a7f (5:4a7f)
	ld a, [wd458]
	cp $0
	jp z, Func_14a8c
	ld a, $e8
	ld [wSerialSend], a
Func_14a8c: ; 14a8c (5:4a8c)
	ld hl, DenjuuBattleMessages
	call LoadDenjuuBattleCatchphrase_
	ld hl, wd4d0
	call Func_14020
	ld a, SFX_5D
	ld [H_SFX_ID], a
	ld c, $4
asm_14a9f
	call StdBattleTextBox
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld a, $29
	ld [wBattleSubroutine], a
	ret

Func_14aad: ; 14aad (5:4aad)
	call BattlePrintText
	ld a, [wLinkMode]
	or a
	jr z, .asm_14abf
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	jr z, .asm_14ac5
.asm_14abf
	ld a, [wTextSubroutine]
	cp $9
	ret nz
.asm_14ac5
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $5
	jr z, .asm_14af2
	cp $7
	jr z, .asm_14af2
	cp $8
	jr z, .asm_14af2
	cp $b
	jr z, .asm_14af2
	cp $3
	jr z, .asm_14af2
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld c, $72
	call StdBattleTextBox
	ld a, $b
	ld [wBattleSubroutine], a
	ret

.asm_14af2
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Func_14af8: ; 14af8 (5:4af8)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Battle_DrawMenuOrAttackOnYourOwn: ; 14b07 (5:4b07)
	ld a, [wLinkMode]
	cp $1
	jr z, .check_2
	ld a, [wCurDenjuuBufferField0x0c]
	cp $4
	jr z, .roll_1
	cp $5
	jr nz, .check_2
.roll_1
	ld a, [wCurDenjuuBufferFD]
	add (-101 & $ff)
	ld b, a
	call Random
	cp b
	jr c, .check_2
	ld a, $0
	ld [wBattleMenuSelection], a
	ld c, $1f
	call StdBattleTextBox
	ld a, $2a
	ld [wBattleSubroutine], a
	ret

.check_2
	ld a, [wCurDenjuuBufferField0x0c]
	cp $8
	jr z, .roll_2
	cp $9
	jr nz, .show_menu
.roll_2
	ld a, [wCurDenjuuBufferFD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, .show_menu
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .denjuu_2
	cp $2
	jr z, .denjuu_3
	ld a, $1
	ld [wPlayerDenjuu1AttackedOnItsOwn], a
	jr .done

.denjuu_2
	ld a, $1
	ld [wPlayerDenjuu2AttackedOnItsOwn], a
	jr .done

.denjuu_3
	ld a, $1
	ld [wPlayerDenjuu3AttackedOnItsOwn], a
.done
	ld a, $0
	ld [wBattleMenuSelection], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wBattleMenuSelection]
	call UseMove
	ld a, [wCurEnemyDenjuu]
	ld [wCurStatsScreenDenjuu], a
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $2c
	ld [wBattleSubroutine], a
	ret

.show_menu
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	ld de, BattleString_Fight
	ld hl, VTilesBG tile $60
	call PlaceBattleString
	ld de, BattleString_Run
	ld hl, VTilesBG tile $68
	call PlaceBattleString
	lb bc, $3, $e
	ld e, $8c
	xor a
	call LoadStdBGMapLayout_
	xor a
	ld [wBattleMenuSelection], a
	xor a
	call Func_142ba
	call InitBattleTopMenuCursor
	xor a
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
	jp NextBattleSubroutine

Battle_MenuSelection: ; 14bc6 (5:4bc6)
	call Func_3cd0
	ld a, [wLinkMode]
	cp $1
	jr z, .check_a_button
	ld a, [hJoyNew]
	and D_UP
	jr z, .check_down
	ld a, [wBattleMenuSelection]
	cp $0
	jr z, .check_down
	dec a
	ld [wBattleMenuSelection], a
	jr .asm_14bf4

.check_down
	ld a, [hJoyNew]
	and D_DOWN
	jr z, .check_a_button
	ld a, [wBattleMenuSelection]
	cp $1 ; run
	jr z, .check_a_button
	inc a
	ld [wBattleMenuSelection], a
.asm_14bf4
	ld a, SFX_02
	ld [H_SFX_ID], a
	call InitBattleTopMenuCursor
.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, .check_b_button
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wBattleMenuSelection]
	cp $0
	jp nz, .try_to_run
	jp NextBattleSubroutine

.try_to_run
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, SFX_57
	ld [H_SFX_ID], a
	ld a, $14
	ld [wBattleSubroutine], a
	ret

.check_b_button
	ld a, [wLinkMode]
	cp $1
	ret z
	ld a, [hJoyNew]
	and B_BUTTON
	ret z
	jr .try_to_run

Battle_DrawMoveSelectionMenu: ; 14c34 (5:4c34)
	ld hl, wc460
	ld a, $3f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	xor a
	ld [wWY], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE1
	ld hl, VTilesBG tile $40
	call Battle_PrintDenjuuMove
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE2
	ld hl, VTilesBG tile $48
	call Battle_PrintDenjuuMove
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .skip_move_3
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE3
	ld hl, VTilesBG tile $50
	call Battle_PrintDenjuuMove
	ld a, $2
	ld [wCurDenjuuMaxMoveIndex], a
	jr .check_move_4

.skip_move_3
	ld a, $1
	ld [wCurDenjuuMaxMoveIndex], a
	ld hl, VTilesBG tile $50
	ld a, $8
	call ClearString
	jr .skip_move_4

.check_move_4
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .skip_move_4
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	or a
	jr z, .skip_move_4
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE4
	ld hl, VTilesBG tile $58
	call Battle_PrintDenjuuMove
	ld a, $3
	ld [wCurDenjuuMaxMoveIndex], a
	jr .init_cursor

.skip_move_4
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
.init_cursor
	lb bc, $9, $9
	ld e, $88
	xor a
	call LoadStdBGMapLayout_
	lb bc, $9, $9
	ld e, $80
	xor a
	call LoadStdBGMapAttrLayout_
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .get_denjuu_2
	cp $2
	jr z, .get_denjuu_3
	ld a, [wPlayerDenjuu1LastMoveSelection]
	ld [wBattleMenuSelection], a
	jr .set_cursor_position

.get_denjuu_2
	ld a, [wPlayerDenjuu2LastMoveSelection]
	ld [wBattleMenuSelection], a
	jr .set_cursor_position

.get_denjuu_3
	ld a, [wPlayerDenjuu3LastMoveSelection]
	ld [wBattleMenuSelection], a
.set_cursor_position
	call InitMoveSelectionMenuCursor
	xor a
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
	jp NextBattleSubroutine

Battle_PrintDenjuuMove: ; 14d0f (5:4d0f)
	push hl
	ld b, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	pop bc
	jp GetAndPrintName75LeftAlign_

Battle_MoveSelectionMenu: ; 14d1f (5:4d1f)
	call Func_3cd0
	ld a, [wJoyNew]
	and D_UP
	jr z, .check_down
	ld a, [wBattleMenuSelection]
	cp $0
	jr z, .wrap_up
	dec a
	ld [wBattleMenuSelection], a
	jr .done_dpad

.wrap_up
	ld a, [wCurDenjuuMaxMoveIndex]
	ld [wBattleMenuSelection], a
	jr .done_dpad

.check_down
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .check_b_button
	ld a, [wCurDenjuuMaxMoveIndex]
	ld b, a
	ld a, [wBattleMenuSelection]
	cp b
	jr z, .wrap_down
	inc a
	ld [wBattleMenuSelection], a
	jr .done_dpad

.wrap_down
	xor a
	ld [wBattleMenuSelection], a
.done_dpad
	ld a, SFX_02
	ld [H_SFX_ID], a
	call InitMoveSelectionMenuCursor
.check_b_button
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_a_button
	ld a, SFX_04
	ld [H_SFX_ID], a
	lb bc, $9, $9
	ld e, $87
	xor a
	call LoadStdBGMapLayout_
	lb bc, $9, $9
	ld e, $81
	xor a
	call LoadStdBGMapAttrLayout_
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call UpdateEnemyHUD
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, $5
	ld [wBattleSubroutine], a
	ret

.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .store_denjuu_2
	cp $2
	jr z, .store_denjuu_3
	ld a, [wBattleMenuSelection]
	ld [wPlayerDenjuu1LastMoveSelection], a
	jr .done_storage

.store_denjuu_2
	ld a, [wBattleMenuSelection]
	ld [wPlayerDenjuu2LastMoveSelection], a
	jr .done_storage

.store_denjuu_3
	ld a, [wBattleMenuSelection]
	ld [wPlayerDenjuu3LastMoveSelection], a
.done_storage
	ld a, SFX_03
	ld [H_SFX_ID], a
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	jp NextBattleSubroutine

Func_14ddd: ; 14ddd (5:4ddd)
	lb bc, $9, $9
	ld e, $87
	xor a
	call LoadStdBGMapLayout_
	lb bc, $9, $9
	ld e, $81
	xor a
	call LoadStdBGMapAttrLayout_
	call Func_142af
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr nz, .asm_14e23
	xor a
	ld [wBattleMenuSelection], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wBattleMenuSelection]
	call UseMove
	jp Func_14ec6

.asm_14e23
	ld a, [wBattleMenuSelection]
	cp $3
	jr nz, .asm_14e4b
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_14e3c
	cp $2
	jr z, .asm_14e43
	ld a, $5
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_14e48

.asm_14e3c
	ld a, $5
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_14e48

.asm_14e43
	ld a, $5
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_14e48
	jp Func_14e9d

.asm_14e4b
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wBattleMenuSelection]
	call UseMove
	call Func_143df
	cp $1
	jr nz, .asm_14e96
	ld a, [wNumAlivePlayerDenjuu]
	cp $2
	jr c, .asm_14e77
	ld c, $8b
	call StdBattleTextBox
	ld a, $1
	ld [wStartObjectAnimationIDX], a
	call Func_165fe
	call Func_3cb5
	jr .asm_14e87

.asm_14e77
	ld a, [wCurBattleDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld [wd457], a
	ld c, $94
	call StdBattleTextBox
	jr Func_14ec6

.asm_14e87
	ld a, [wCurBattleDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld [wd457], a
	ld a, $3b
	ld [wBattleSubroutine], a
	ret

.asm_14e96
	call GetMoveTargetSide
	cp $0
	jr z, .asm_14e77
Func_14e9d: ; 14e9d (5:4e9d)
	ld a, [wCurEnemyDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld a, [wNumAliveEnemyDenjuu]
	cp $2
	jr c, .asm_14ebc
	ld c, $95
	call StdBattleTextBox
	ld a, $1
	ld [wStartObjectAnimationIDX], a
	call Func_165e8
	call Func_3cb5
	jr .asm_14ec3

.asm_14ebc
	ld c, $94
	call StdBattleTextBox
	jr Func_14ec6

.asm_14ec3
	jp NextBattleSubroutine

Func_14ec6: ; 14ec6 (5:4ec6)
	ld a, [wCurEnemyDenjuu]
	ld [wCurStatsScreenDenjuu], a
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $2c
	ld [wBattleSubroutine], a
	ret

GetMoveTargetSide: ; 14ed6 (5:4ed6)
	ld a, [wCurMove]
	cp SPEED_UP
	jr c, .enemy
	cp RECOVER
	jr c, .player
	cp PROTECT
	jr c, .enemy
	cp ULTRASONIC
	jr c, .player
	cp JUMP
	jr c, .enemy
	cp SCREAM
	jr c, .player
	cp WINGBEAT
	jr c, .enemy
	cp FORCE_FIELD
	jr c, .player
	cp QUICK_STEP
	jr c, .enemy
	cp REPAIR
	jr c, .player
	cp DEFEND
	jr c, .enemy
	cp EM_PULSE
	jr c, .player
	cp ELECTRO_SCREEN
	jr z, .player
.enemy
	ld a, $1
	ret

.player
	xor a
	ret

Func_14f12: ; 14f12 (5:4f12)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wBattleMenuSelection]
	cp $3
	jr nz, .asm_14f27
	ld a, SFX_58
	ld [H_SFX_ID], a
.asm_14f27
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld a, $3e
	ld [wBattleSubroutine], a
	ret

Func_14f32: ; 14f32 (5:4f32)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_14f59
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $a
	jr z, .asm_14f71
	ld a, $2d
	ld [wBattleSubroutine], a
	ret

.asm_14f59
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $a
	jr z, .asm_14f71
	ld c, $72
	call StdBattleTextBox
	ld a, $36
	ld [wBattleSubroutine], a
	ret

.asm_14f71
	ld c, $2e
	call StdBattleTextBox
	ld a, $c
	ld [wBattleSubroutine], a
	ld a, $22
	ld [wd401], a
	ret

Func_14f81: ; 14f81 (5:4f81)
	call BattlePrintText
	ld a, [wNumAliveEnemyDenjuu]
	cp $1
	jr z, .asm_14fba
	call Func_3cd0
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_14f99
	call Func_1654b
	jr .asm_14fa2

.asm_14f99
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_14fba
	call Func_1656b
.asm_14fa2
	lb bc, $1, $1
	ld e, $8b
	xor a
	call LoadStdWindowLayout_
	call Func_1658d
	ld a, [wCurEnemyDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld a, $23
	ld [wBattleSubroutine], a
	ret

.asm_14fba
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_15016
	ld a, [wBattleMenuSelection]
	cp $3
	jr nz, .asm_15003
	ld a, [wCurBattleDenjuu]
	cp $0
	jr z, .asm_14fd4
	cp $1
	jr z, .asm_14fdc
	jr .asm_14fe4

.asm_14fd4
	ld a, [wCurEnemyDenjuu]
	ld [wPlayerDenjuu1MoveTarget], a
	jr .asm_14fea

.asm_14fdc
	ld a, [wCurEnemyDenjuu]
	ld [wPlayerDenjuu2MoveTarget], a
	jr .asm_14fea

.asm_14fe4
	ld a, [wCurEnemyDenjuu]
	ld [wPlayerDenjuu3MoveTarget], a
.asm_14fea
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wCurEnemyDenjuu]
	ld [wCurStatsScreenDenjuu], a
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $2c
	ld [wBattleSubroutine], a
	ret

.asm_15003
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $2c
	ld [wBattleSubroutine], a
	ret

.asm_15016
	ld a, [hJoyNew]
	and B_BUTTON
	ret z
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_15036
	cp $2
	jr z, .asm_1503d
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_15042

.asm_15036
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_15042

.asm_1503d
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_15042
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	ld a, $7
	ld [wBattleSubroutine], a
	ret

Func_15051: ; 15051 (5:5051)
	call BattlePrintText
	call GetMoveTargetSide
	cp $0
	jr z, .asm_15091
	ld a, [wNumAlivePlayerDenjuu]
	cp $1
	jr z, .asm_15091
	call Func_3cd0
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_15070
	call Func_1651b
	jr .asm_15079

.asm_15070
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_15091
	call Func_1653b
.asm_15079
	lb bc, $1, $5
	ld e, $8b
	xor a
	call LoadStdBGMapLayout_
	call Func_1657b
	ld a, [wCurBattleDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld a, $3c
	ld [wBattleSubroutine], a
	ret

.asm_15091
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_150aa
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $2c
	ld [wBattleSubroutine], a
	ret

.asm_150aa
	ld a, [hJoyNew]
	and B_BUTTON
	ret z
	ld a, [wCurBattleDenjuu]
	ld b, a
	ld a, [wd457]
	cp b
	jr z, .asm_150c8
.asm_150b9
	ld a, [wd457]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, .asm_15079
	call Func_1651b
	jr .asm_150b9

.asm_150c8
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	ld a, $7
	ld [wBattleSubroutine], a
	ret

Func_150e0: ; 150e0 (5:50e0)
	lb bc, $1, $5
	ld e, $92
	xor a
	call LoadStdBGMapLayout_
	call UpdatePlayerHUD
	call Func_1643a
	ld a, $3b
	ld [wBattleSubroutine], a
	ret

Func_150f5: ; 150f5 (5:50f5)
	lb bc, $1, $1
	ld e, $91
	xor a
	call LoadStdWindowLayout_
	call UpdateEnemyHUD
	call Func_16461
	ld a, $a
	ld [wBattleSubroutine], a
	ret

Func_1510a: ; 1510a (5:510a)
	ld a, [wLinkMode]
	cp $0
	jr z, .asm_15149
	call Func_3eee
	cp $ff
	ret z
	or a
	jr nz, .asm_15129
	ld a, [wMoveAnimationTimer]
	cp $0
	jr z, .asm_15126
	dec a
	ld [wMoveAnimationTimer], a
	ret

.asm_15126
	jp BattlePrintText

.asm_15129
	dec a
	ld [wBattleMenuSelection], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wBattleMenuSelection]
	call UseMove
	jp Func_1528c

.asm_15149
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr nz, .asm_15173
	ld a, $0
	ld [wBattleMenuSelection], a
	ld a, [wCurBattleDenjuu]
	ld [wCurStatsScreenDenjuu], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wBattleMenuSelection]
	call UseMove
	ld a, $c
	ld [wBattleSubroutine], a
	ret

.asm_15173
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	call Random
	cp $78
	jr c, .asm_15190
	cp $b4
	jr c, .asm_15193
	cp $dc
	jr c, .asm_15197
	jr .asm_151af

.asm_15190
	xor a
	jr .asm_151d6

.asm_15193
	ld a, $1
	jr .asm_151d6

.asm_15197
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_151d5
	ld a, $2
	jr .asm_151d6

.asm_151af
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_151d5
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	or a
	jr z, .asm_151d5
	ld a, $3
	jr .asm_151d6

.asm_151d5
	xor a
.asm_151d6
	ld [wBattleMenuSelection], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	jr z, .asm_151e9
	xor a
	ld [wBattleMenuSelection], a
.asm_151e9
	ld a, [wBattleMenuSelection]
	call UseMove
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_151ff
	cp $2
	jr z, .asm_15204
	ld a, [wd4a8]
	jr .asm_15207

.asm_151ff
	ld a, [wd4a9]
	jr .asm_15207

.asm_15204
	ld a, [wd4aa]
.asm_15207
	cp $1
	jr nz, .asm_1522f
	xor a
	ld [wBattleMenuSelection], a
	call UseMove
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_15223
	cp $2
	jr z, .asm_15229
	xor a
	ld [wd4a8], a
	jr .asm_1525c

.asm_15223
	xor a
	ld [wd4a9], a
	jr .asm_1525c

.asm_15229
	xor a
	ld [wd4aa], a
	jr .asm_1525c

.asm_1522f
	ld a, [wCurMove]
	cp FLIGHT
	jr z, .asm_1523e
	cp CAMOUFLAGE
	jr z, .asm_1523e
	cp CONCEAL
	jr nz, .asm_1525c
.asm_1523e
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_15250
	cp $2
	jr z, .asm_15257
	ld a, $1
	ld [wd4a8], a
	jr .asm_1525c

.asm_15250
	ld a, $1
	ld [wd4a9], a
	jr .asm_1525c

.asm_15257
	ld a, $1
	ld [wd4aa], a
.asm_1525c
	ld a, [wCurMove]
	cp FIRST_AID
	jr z, .asm_15273
	cp REPAIR
	jr z, .asm_15273
	cp HEAL
	jr z, .asm_15273
	cp RECOVER
	jr z, .asm_15273
	cp RESTORE
	jr nz, Func_1528c
.asm_15273
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	ld b, a
	ld a, [wCurDenjuuBufferMaxHP]
	srl a
	cp b
	jr nc, Func_1528c
	xor a
	ld [wBattleMenuSelection], a
	call UseMove
Func_1528c: ; 1528c (5:528c)
	ld a, $35
	ld [wBattleSubroutine], a
	ret

Func_15292: ; 15292 (5:5292)
	ld a, [wLinkMode]
	or a
	jr z, .asm_152c0
	call Func_3eee
	or a
	ret z
	dec a
	ld [wCurMoveTarget], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wBattleMenuSelection]
	cp $3
	jp z, Func_15345
	call Func_143df
	cp $1
	jp nz, Func_15345
	ld a, [wCurMoveTarget]
	ld [wd418], a
	jr .asm_152ee

.asm_152c0
	call Func_143df
	cp $1
	jr nz, .asm_1531e
	ld a, [wNumAliveEnemyDenjuu]
	cp $3
	jr z, .asm_152d5
	cp $2
	jr z, .asm_152dc
	jp Func_153d4

.asm_152d5
	call Random
	and $2
	jr .asm_152eb

.asm_152dc
	call Random
	cp $7f
	jr c, .asm_152e8
	ld a, [wCurEnemyDenjuu]
	jr .asm_152eb

.asm_152e8
	ld a, [wCurEnemyDenjuu2]
.asm_152eb
	ld [wd418], a
.asm_152ee
	ld a, [wd418]
	ld b, a
	ld a, [wCurEnemyDenjuu]
	cp b
	jp z, Func_153d4
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdWindowLayout_
.asm_15303
	ld a, [wd418]
	ld b, a
	ld a, [wCurEnemyDenjuu]
	cp b
	jr z, .asm_15312
	call Func_1654b
	jr .asm_15303

.asm_15312
	call Func_1658d
	call UpdateEnemyHUD
	ld a, $3d
	ld [wBattleSubroutine], a
	ret

.asm_1531e
	ld a, [wNumAlivePlayerDenjuu]
	cp $3
	jr z, .asm_1532c
	cp $2
	jr z, .asm_15333
	jp Func_15345

.asm_1532c
	call Random
	and $2
	jr .set_target

.asm_15333
	call Random
	cp $7f
	jr c, .enemy_targets_denjuu_2
	ld a, [wCurBattleDenjuu]
	jr .set_target

.enemy_targets_denjuu_2
	ld a, [wCurBattleDenjuu2]
.set_target
	ld [wCurMoveTarget], a
Func_15345: ; 15345 (5:5345)
	ld a, [wBattleMenuSelection]
	cp $3
	jr nz, .asm_15383
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_15364
	cp $2
	jr z, .asm_15371
	ld a, $5
	ld [wEnemyDenjuu1ArrivedStatus], a
	ld a, [wCurMoveTarget]
	ld [wEnemyDenjuu1MoveTarget], a
	jr .asm_1537c

.asm_15364
	ld a, $5
	ld [wEnemyDenjuu2ArrivedStatus], a
	ld a, [wCurMoveTarget]
	ld [wEnemyDenjuu2MoveTarget], a
	jr .asm_1537c

.asm_15371
	ld a, $5
	ld [wEnemyDenjuu3ArrivedStatus], a
	ld a, [wCurMoveTarget]
	ld [wEnemyDenjuu3MoveTarget], a
.asm_1537c
	ld a, $1
	ld [wd4ea], a
	jr .asm_153a6

.asm_15383
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .enemy_denjuu_2
	cp $2
	jr z, .enemy_denjuu_3
	ld a, [wEnemyDenjuu1]
	jr .got_enemy_denjuu

.enemy_denjuu_2
	ld a, [wEnemyDenjuu2]
	jr .got_enemy_denjuu

.enemy_denjuu_3
	ld a, [wEnemyDenjuu3]
	jr .got_enemy_denjuu

.got_enemy_denjuu
	call Func_142cd
	call GetMoveTargetSide
	or a
	jr z, Func_153d4
.asm_153a6
	ld a, [wCurMoveTarget]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, Func_153d4
	lb bc, $1, $5
	ld e, $8b
	xor a
	call LoadStdBGMapLayout_
.asm_153b9
	ld a, [wCurMoveTarget]
	ld b, a
	ld a, [wCurBattleDenjuu]
	cp b
	jr z, .asm_153c8
	call Func_1651b
	jr .asm_153b9

.asm_153c8
	call Func_1657b
	call UpdatePlayerHUD
	ld a, $24
	ld [wBattleSubroutine], a
	ret

Func_153d4: ; 153d4 (5:53d4)
	ld a, [wd4ea]
	or a
	jr z, .asm_153e9
	xor a
	ld [wd4ea], a
	ld c, $c
	call StdBattleTextBox
	ld a, $2a
	ld [wBattleSubroutine], a
	ret

.asm_153e9
	ld a, $c
	ld [wBattleSubroutine], a
	ret

Func_153ef: ; 153ef (5:53ef)
	lb bc, $1, $5
	ld e, $92
	xor a
	call LoadStdBGMapLayout_
	call Func_1643a
	ld a, [wd4ea]
	or a
	jr z, .asm_15410
	xor a
	ld [wd4ea], a
	ld c, $c
	call StdBattleTextBox
	ld a, $2a
	ld [wBattleSubroutine], a
	ret

.asm_15410
	ld a, $c
	ld [wBattleSubroutine], a
	ret

Func_15416: ; 15416 (5:5416)
	lb bc, $1, $1
	ld e, $91
	xor a
	call LoadStdWindowLayout_
	call Func_16461
	ld a, $c
	ld [wBattleSubroutine], a
	ret

Func_15428: ; 15428 (5:5428)
	ld a, [wMoveAnimationTimer]
	or a
	jr nz, .asm_1543d
	ld a, [wBattleMenuSelection]
	inc a
	ld [wSerialSend], a
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	ret

.asm_1543d
	ld a, [wCurStatsScreenDenjuu]
	inc a
	ld [wSerialSend], a
	ld a, [wBattleMenuSelection]
	cp $3
	jr z, .asm_15451
	ld a, $c
	ld [wBattleSubroutine], a
	ret

.asm_15451
	ld c, $c
	call StdBattleTextBox
	ld a, $2a
	ld [wBattleSubroutine], a
	ret

Func_1545c: ; 1545c (5:545c)
	jp Func_16643

Func_1545f: ; 1545f (5:545f)
	ld a, [wBattleEnded]
	cp $1
	jr z, .asm_15483
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_15478
	ld a, $2d
	ld [wBattleSubroutine], a
	ret

.asm_15478
	ld c, $72
	call StdBattleTextBox
	ld a, $36
	ld [wBattleSubroutine], a
	ret

.asm_15483
	ld a, $13
	ld [wBattleSubroutine], a
	ret

Func_15489: ; 15489 (5:5489)
	ld a, [wLinkMode]
	cp $1
	jp z, Func_15606
	ld a, [BattleResults_CurBattleDenjuu]
	cp $1
	jr z, .asm_154f7
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $0
	jp z, Func_155ed
	cp $4
	jr nz, .asm_154ab
	call Random
	cp $c8
	jr c, .asm_154ef
.asm_154ab
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $1
	jp nz, Func_155ed
	ld a, [wd450]
	cp $1
	jp z, Func_155ed
	ld a, [wPlayerDenjuu2Field0x0c]
	cp $4
	jp nc, Func_155ed
	ld a, [wPlayerDenjuu2FD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, .asm_154ef
	ld a, $4
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld a, [wPlayerDenjuu2Species]
	ld [wd4ca], a
	ld a, [wPlayerDenjuu2Field0x0c]
	ld [wd46a], a
	ld a, $f2
	ld [wSerialSend], a
	ld a, $1
	ld [wd450], a
	jp Func_15556

.asm_154ef
	ld a, $1
	ld [wPlayerDenjuu2ArrivedStatus], a
	jp Func_155ed

.asm_154f7
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $0
	jp z, Func_155ed
	cp $4
	jr nz, .asm_1550a
	call Random
	cp $c8
	jr c, .asm_1554e
.asm_1550a
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $1
	jp nz, Func_155ed
	ld a, [wd451]
	cp $1
	jp z, Func_155ed
	ld a, [wPlayerDenjuu3Field0x0c]
	cp $4
	jp nc, Func_155ed
	ld a, [wPlayerDenjuu3FD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, .asm_1554e
	ld a, $4
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, [wPlayerDenjuu3Species]
	ld [wd4cb], a
	ld a, [wPlayerDenjuu3Field0x0c]
	ld [wd46b], a
	ld a, $f3
	ld [wSerialSend], a
	ld a, $1
	ld [wd451], a
	jp Func_15556

.asm_1554e
	ld a, $1
	ld [wPlayerDenjuu3ArrivedStatus], a
	jp Func_155ed

Func_15556: ; 15556 (5:5556)
	ld a, [wd4ca]
	cp $ff
	jr z, .asm_15585
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2]
	ld [wd4ce], a
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld [wd43c], a
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	ld a, [wd46a]
	ld [wd46e], a
	ld a, $ff
	ld [wd4ca], a
	jp Func_1560c

.asm_15585
	ld a, [wd4cb]
	cp $ff
	jr z, .asm_155b3
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu3Species]
	ld [wd4ce], a
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld [wd43c], a
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	ld a, [wd46b]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cb], a
	jr Func_1560c

.asm_155b3
	ld a, [wd4cc]
	cp $ff
	jr z, .asm_155d0
	ld [wd4ce], a
	ld a, [wEnemyDenjuu2AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46c]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cc], a
	jr Func_1560c

.asm_155d0
	ld a, [wd4cd]
	cp $ff
	jr z, Func_155ed
	ld [wd4ce], a
	ld a, [wEnemyDenjuu3AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46d]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cd], a
	jr Func_1560c

Func_155ed: ; 155ed (5:55ed)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $1
	jr z, .asm_15601
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ld a, $1
	ld [wSerialSend], a
	ret

.asm_15601
	ld a, $1
	ld [wSerialSend], a
Func_15606: ; 15606 (5:5606)
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Func_1560c: ; 1560c (5:560c)
	xor a
	ld [wd401], a
	ld a, MUSIC_NONE
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $3a
	ld [wBattleSubroutine], a
	ret

Func_1561e: ; 1561e (5:561e)
	ld a, [wPhoneSilentMode]
	cp $1
	jr z, .asm_1564c
	ld hl, sAddressBookRingtones
	ld d, $0
	ld a, [wd43c]
	ld e, a
	add hl, de
	enable_sram sAddressBookRingtones
	ld a, [hl]
	push af
	xor a
	ld [MBC3SRamEnable], a
	pop af
	set 7, a
	ld [H_Ringtone], a
	ld a, $4
	ld [wMusicBank], a
	jr .asm_15651

.asm_1564c
	ld a, $3c
	ld [wMoveAnimationTimer], a
.asm_15651
	ld a, $1
	ld [wPhoneIsRinging], a
	ld c, $6d
	call StdBattleTextBox
	ld a, $34
	ld [wBattleSubroutine], a
	ret

Func_15661: ; 15661 (5:5661)
	call BattlePrintText
	ld a, [wPhoneSilentMode]
	cp $1
	jr z, .asm_15672
	ld a, [wRingtoneID]
	or a
	ret nz
	jr .asm_1567a

.asm_15672
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
.asm_1567a
	call StopRingtone
	ld a, $11
	ld [wBattleSubroutine], a
	ret

Func_15683: ; 15683 (5:5683)
	ld a, [wLinkMode]
	cp $1
	jp z, Func_157ef
	ld a, [wLinkMode]
	or a
	jr z, .asm_156ae
	call BattlePrintText
	call Func_3eee
	or a
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $f2
	jp z, Func_156ee
	cp $f3
	jp z, Func_15745
	jp Func_157e0

.asm_156ae
	ld a, [BattleResults_CurBattleDenjuu]
	cp $1
	jr z, asm_1570f
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $0
	jp z, Func_157e0
	cp $4
	jr nz, .asm_156c8
	call Random
	cp $c8
	jr c, asm_15707
.asm_156c8
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $1
	jp nz, Func_157e0
	ld a, [wd452]
	cp $1
	jp z, Func_157e0
	ld a, [wEnemyDenjuu2Field0x0c]
	cp $4
	jp nc, Func_157e0
	ld a, [wEnemyDenjuu2FD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, asm_15707
Func_156ee: ; 156ee (5:56ee)
	ld a, $4
	ld [wEnemyDenjuu2ArrivedStatus], a
	ld a, [wEnemyDenjuu2Species]
	ld [wd4cc], a
	ld a, [wEnemyDenjuu2Field0x0c]
	ld [wd46c], a
	ld a, $1
	ld [wd452], a
	jp Func_15766

asm_15707
	ld a, $1
	ld [wEnemyDenjuu2ArrivedStatus], a
	jp Func_157e0

asm_1570f
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $0
	jp z, Func_157e0
	cp $4
	jr nz, .asm_15722
	call Random
	cp $c8
	jr c, asm_1575e
.asm_15722
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $1
	jr nz, Func_15766
	ld a, [wd453]
	cp $1
	jr z, Func_15766
	ld a, [wEnemyDenjuu3Field0x0c]
	cp $4
	jr nc, Func_15766
	ld a, [wEnemyDenjuu3FD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, asm_1575e
Func_15745: ; 15745 (5:5745)
	ld a, $4
	ld [wEnemyDenjuu3ArrivedStatus], a
	ld a, [wEnemyDenjuu3]
	ld [wd4cd], a
	ld a, [wEnemyDenjuu3Field0x0c]
	ld [wd46d], a
	ld a, $1
	ld [wd453], a
	jp Func_15766

asm_1575e
	ld a, $1
	ld [wEnemyDenjuu3ArrivedStatus], a
	jp Func_157e0

Func_15766: ; 15766 (5:5766)
	ld a, [wd4ca]
	cp $ff
	jr z, .asm_15783
	ld [wd4ce], a
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46a]
	ld [wd46e], a
	ld a, $ff
	ld [wd4ca], a
	jr asm_157f5

.asm_15783
	ld a, [wd4cb]
	cp $ff
	jr z, .asm_157a0
	ld [wd4ce], a
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46b]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cb], a
	jr asm_157f5

.asm_157a0
	ld a, [wd4cc]
	cp $ff
	jr z, .asm_157c0
	ld a, [wEnemyDenjuu2Species]
	ld [wd4ce], a
	ld a, [wEnemyDenjuu2AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46c]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cc], a
	jr asm_157f5

.asm_157c0
	ld a, [wd4cd]
	cp $ff
	jr z, Func_157e0
	ld a, [wEnemyDenjuu3]
	ld [wd4ce], a
	ld a, [wEnemyDenjuu3AddressBookLocation]
	ld [wd43c], a
	ld a, [wd46d]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cd], a
	jr asm_157f5

Func_157e0: ; 157e0 (5:57e0)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $1
	jr z, Func_157ef
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ret

Func_157ef: ; 157ef (5:57ef)
	ld a, $e
	ld [wBattleSubroutine], a
	ret

asm_157f5
	ld a, $32
	ld [wBattleSubroutine], a
	ret

Func_157fb: ; 157fb (5:57fb)
	ld a, $aa
	ld [wSerialSend], a
	ld a, $1e
	ld [wMoveAnimationTimer], a
	ld c, $72
	call StdBattleTextBox
	ld a, $3f
	ld [wBattleSubroutine], a
	ret

Func_15810: ; 15810 (5:5810)
	call Func_142c1
	ld a, [wLinkMode]
	or a
	jr z, .asm_1583e
	call Func_3eee
	cp $aa
	jr z, .asm_1582f
	ld a, [wMoveAnimationTimer]
	cp $0
	jr z, .asm_1582c
	dec a
	ld [wMoveAnimationTimer], a
	ret

.asm_1582c
	jp BattlePrintText

.asm_1582f
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld hl, VTilesBG tile $60
	ld a, $20
	call ClearString
.asm_1583e
	ld a, [wCurBattleDenjuu2]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, .asm_1587f
	cp $2
	jr z, .asm_15854
	xor a
	call DrawSupportDenjuuArrivalBar_Pink
	jr .asm_15858

.asm_15854
	xor a
	call DrawSupportDenjuuArrivalBar_Blue
.asm_15858
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	call Func_16487
	ld a, $4
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d0
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
.asm_1587f
	ld a, [wCurBattleDenjuu3]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, .asm_158c2
	cp $2
	jr z, .asm_15896
	ld a, $1
	call DrawSupportDenjuuArrivalBar_Pink
	jr .asm_1589b

.asm_15896
	ld a, $1
	call DrawSupportDenjuuArrivalBar_Blue
.asm_1589b
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $1
	call Func_16487
	ld a, $5
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d1
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
.asm_158c2
	ld a, [wCurEnemyDenjuu2]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, .asm_15905
	cp $2
	jr z, .asm_158d9
	ld a, $2
	call DrawSupportDenjuuArrivalBar_Pink
	jr .asm_158de

.asm_158d9
	ld a, $2
	call DrawSupportDenjuuArrivalBar_Blue
.asm_158de
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $2
	call Func_16487
	ld a, $6
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d2
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
.asm_15905
	ld a, [wCurEnemyDenjuu3]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, .asm_15948
	cp $2
	jr z, .asm_1591c
	ld a, $3
	call DrawSupportDenjuuArrivalBar_Pink
	jr .asm_15921

.asm_1591c
	ld a, $3
	call DrawSupportDenjuuArrivalBar_Blue
.asm_15921
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $3
	call Func_16487
	ld a, $7
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d3
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
.asm_15948
	call Func_1643a
	call Func_16461
	ld a, [wPlayerDenjuu1Speed]
	ld b, a
	ld [wd43f], a
	ld a, [wNumAlivePlayerDenjuu]
	cp $1
	jr z, .asm_15979
	ld a, [wPlayerDenjuu2Speed]
	cp b
	jr c, .asm_15965
	ld [wd43f], a
.asm_15965
	ld a, [wNumAlivePlayerDenjuu]
	cp $2
	jr z, .asm_15979
	ld a, [wd43f]
	ld b, a
	ld a, [wPlayerDenjuu3Speed]
	cp b
	jr c, .asm_15979
	ld [wd43f], a
.asm_15979
	ld a, [wd43f]
	ld b, a
	ld a, [wEnemyDenjuu1Speed]
	cp b
	jr c, .asm_15986
	ld [wd43f], a
.asm_15986
	ld a, [wNumAliveEnemyDenjuu]
	cp $1
	jr z, .asm_159ae
	ld a, [wd43f]
	ld b, a
	ld a, [wEnemyDenjuu2Speed]
	cp b
	jr c, .asm_1599a
	ld [wd43f], a
.asm_1599a
	ld a, [wNumAliveEnemyDenjuu]
	cp $2
	jr z, .asm_159ae
	ld a, [wd43f]
	ld b, a
	ld a, [wEnemyDenjuu3Speed]
	cp b
	jr c, .asm_159ae
	ld [wd43f], a
.asm_159ae
	ld a, [wd43f]
	add $28
	ld [wd43f], a
	ld a, $f
	ld [wBattleSubroutine], a
	ret

Func_159bc: ; 159bc (5:59bc)
	ld a, [wLinkMode]
	or a
	jr nz, .asm_159cf
	ld a, [hJoyLast]
	and A_BUTTON
	jr z, .asm_159cf
	ld a, $1
	ld [wd4ad], a
	jr .asm_159d3

.asm_159cf
	xor a
	ld [wd4ad], a
.asm_159d3
	ld a, [wCurBattleDenjuu]
	call DrawPlayerDPBar
	ld a, [wCurEnemyDenjuu]
	call DrawEnemyDPBar
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $0
	jr z, .asm_15a26
	cp $8
	jr z, .asm_15a26
	cp $5
	jr z, .asm_15a0b
	ld a, [wPlayerDenjuu1Field0x06]
	inc a
	ld [wPlayerDenjuu1Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a26
	ld a, [wPlayerDenjuu1Field0x06]
	inc a
	ld [wPlayerDenjuu1Field0x06], a
	ld a, [wPlayerDenjuu1Field0x06]
	inc a
	ld [wPlayerDenjuu1Field0x06], a
	jr .asm_15a26

.asm_15a0b
	ld a, [wPlayerDenjuu1CurDP]
	inc a
	ld [wPlayerDenjuu1CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a26
	ld a, [wPlayerDenjuu1CurDP]
	inc a
	ld [wPlayerDenjuu1CurDP], a
	ld a, [wPlayerDenjuu1CurDP]
	inc a
	ld [wPlayerDenjuu1CurDP], a
.asm_15a26
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $0
	jr z, .asm_15a71
	cp $8
	jr z, .asm_15a71
	cp $4
	jr z, .asm_15a71
	cp $5
	jr z, .asm_15a56
	ld a, [wPlayerDenjuu2Field0x06]
	inc a
	ld [wPlayerDenjuu2Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a71
	ld a, [wPlayerDenjuu2Field0x06]
	inc a
	ld [wPlayerDenjuu2Field0x06], a
	ld a, [wPlayerDenjuu2Field0x06]
	inc a
	ld [wPlayerDenjuu2Field0x06], a
	jr .asm_15a71

.asm_15a56
	ld a, [wPlayerDenjuu2CurDP]
	inc a
	ld [wPlayerDenjuu2CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a71
	ld a, [wPlayerDenjuu2CurDP]
	inc a
	ld [wPlayerDenjuu2CurDP], a
	ld a, [wPlayerDenjuu2CurDP]
	inc a
	ld [wPlayerDenjuu2CurDP], a
.asm_15a71
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $0
	jr z, .asm_15abc
	cp $8
	jr z, .asm_15abc
	cp $4
	jr z, .asm_15abc
	cp $5
	jr z, .asm_15aa1
	ld a, [wPlayerDenjuu3Field0x06]
	inc a
	ld [wPlayerDenjuu3Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15abc
	ld a, [wPlayerDenjuu3Field0x06]
	inc a
	ld [wPlayerDenjuu3Field0x06], a
	ld a, [wPlayerDenjuu3Field0x06]
	inc a
	ld [wPlayerDenjuu3Field0x06], a
	jr .asm_15abc

.asm_15aa1
	ld a, [wPlayerDenjuu3CurDP]
	inc a
	ld [wPlayerDenjuu3CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15abc
	ld a, [wPlayerDenjuu3CurDP]
	inc a
	ld [wPlayerDenjuu3CurDP], a
	ld a, [wPlayerDenjuu3CurDP]
	inc a
	ld [wPlayerDenjuu3CurDP], a
.asm_15abc
	ld a, [wEnemyDenjuu1ArrivedStatus]
	cp $0
	jr z, .asm_15b03
	cp $8
	jr z, .asm_15b03
	cp $5
	jr z, .asm_15ae8
	ld a, [wEnemyDenjuu1Field0x06]
	inc a
	ld [wEnemyDenjuu1Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b03
	ld a, [wEnemyDenjuu1Field0x06]
	inc a
	ld [wEnemyDenjuu1Field0x06], a
	ld a, [wEnemyDenjuu1Field0x06]
	inc a
	ld [wEnemyDenjuu1Field0x06], a
	jr .asm_15b03

.asm_15ae8
	ld a, [wEnemyDenjuu1CurDP]
	inc a
	ld [wEnemyDenjuu1CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b03
	ld a, [wEnemyDenjuu1CurDP]
	inc a
	ld [wEnemyDenjuu1CurDP], a
	ld a, [wEnemyDenjuu1CurDP]
	inc a
	ld [wEnemyDenjuu1CurDP], a
.asm_15b03
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $0
	jr z, .asm_15b4e
	cp $8
	jr z, .asm_15b4e
	cp $4
	jr z, .asm_15b4e
	cp $5
	jr z, .asm_15b33
	ld a, [wEnemyDenjuu2Field0x06]
	inc a
	ld [wEnemyDenjuu2Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b4e
	ld a, [wEnemyDenjuu2Field0x06]
	inc a
	ld [wEnemyDenjuu2Field0x06], a
	ld a, [wEnemyDenjuu2Field0x06]
	inc a
	ld [wEnemyDenjuu2Field0x06], a
	jr .asm_15b4e

.asm_15b33
	ld a, [wEnemyDenjuu2CurDP]
	inc a
	ld [wEnemyDenjuu2CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b4e
	ld a, [wEnemyDenjuu2CurDP]
	inc a
	ld [wEnemyDenjuu2CurDP], a
	ld a, [wEnemyDenjuu2CurDP]
	inc a
	ld [wEnemyDenjuu2CurDP], a
.asm_15b4e
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $0
	jr z, .asm_15b99
	cp $8
	jr z, .asm_15b99
	cp $4
	jr z, .asm_15b99
	cp $5
	jr z, .asm_15b7e
	ld a, [wEnemyDenjuu3Field0x06]
	inc a
	ld [wEnemyDenjuu3Field0x06], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b99
	ld a, [wEnemyDenjuu3Field0x06]
	inc a
	ld [wEnemyDenjuu3Field0x06], a
	ld a, [wEnemyDenjuu3Field0x06]
	inc a
	ld [wEnemyDenjuu3Field0x06], a
	jr .asm_15b99

.asm_15b7e
	ld a, [wEnemyDenjuu3CurDP]
	inc a
	ld [wEnemyDenjuu3CurDP], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b99
	ld a, [wEnemyDenjuu3CurDP]
	inc a
	ld [wEnemyDenjuu3CurDP], a
	ld a, [wEnemyDenjuu3CurDP]
	inc a
	ld [wEnemyDenjuu3CurDP], a
.asm_15b99
	ld a, [wCurBattleDenjuu2]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, asm_15bc8
	cp $2
	jr z, .asm_15bbd
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call CalcHPBarLength
	ld [wd430], a
	xor a
	call AnimateCurrentArrivalBarFrame
	jp Func_15bc1

.asm_15bbd
	xor a
	call AnimateCurrentSupportDenjuuHPBarFrame
Func_15bc1: ; 15bc1 (5:5bc1)
	xor a
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
asm_15bc8
	ld a, [wCurBattleDenjuu3]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, asm_15bfa
	cp $2
	jr z, .asm_15bed
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call CalcHPBarLength
	ld [wd431], a
	ld a, $1
	call AnimateCurrentArrivalBarFrame
	jp Func_15bf2

.asm_15bed
	ld a, $1
	call AnimateCurrentSupportDenjuuHPBarFrame
Func_15bf2: ; 15bf2 (5:5bf2)
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
asm_15bfa
	ld a, [wCurEnemyDenjuu2]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, asm_15c2c
	cp $2
	jr z, .asm_15c1f
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call CalcHPBarLength
	ld [wd432], a
	ld a, $2
	call AnimateCurrentArrivalBarFrame
	jp Func_15c24

.asm_15c1f
	ld a, $2
	call AnimateCurrentSupportDenjuuHPBarFrame
Func_15c24: ; 15c24 (5:5c24)
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
asm_15c2c
	ld a, [wCurEnemyDenjuu3]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, asm_15c5e
	cp $2
	jr z, .asm_15c51
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call CalcHPBarLength
	ld [wd433], a
	ld a, $3
	call AnimateCurrentArrivalBarFrame
	jp Func_15c56

.asm_15c51
	ld a, $3
	call AnimateCurrentSupportDenjuuHPBarFrame
Func_15c56: ; 15c56 (5:5c56)
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	call Func_3cd0
asm_15c5e
	ld a, [wLinkMode]
	or a
	jp z, Func_15cd6
	ld a, [wd458]
	cp $1
	jp z, Func_15cd6
	call Func_3eee
	or a
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $1
	jr z, .asm_15ca7
	cp $2
	jr z, .asm_15caf
	cp $3
	jr z, .asm_15cb7
	cp $4
	jr z, .asm_15cbf
	cp $5
	jr z, .asm_15cc6
	cp $6
	jr z, .asm_15cce
	cp $14
	jp z, Func_15d52
	cp $15
	jp z, Func_15dc0
	cp $a
	jp z, Func_15e6f
	cp $b
	jp z, Func_15edd
	ret

.asm_15ca7
	ld a, $3
	ld [wd47f], a
	jp Func_15f16

.asm_15caf
	ld a, $4
	ld [wd47f], a
	jp Func_15f16

.asm_15cb7
	ld a, $5
	ld [wd47f], a
	jp Func_15f16

.asm_15cbf
	xor a
	ld [wd47f], a
	jp Func_15f16

.asm_15cc6
	ld a, $1
	ld [wd47f], a
	jp Func_15f16

.asm_15cce
	ld a, $2
	ld [wd47f], a
	jp Func_15f16

Func_15cd6: ; 15cd6 (5:5cd6)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $3
	jr z, .asm_15cfc
	cp $5
	jr nz, .asm_15d15
	ld a, [wPlayerDenjuu1CurMaxDP]
	ld b, a
	ld a, [wPlayerDenjuu1CurDP]
	cp b
	jp c, .asm_15d15
	xor a
	ld [wPlayerDenjuu1CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	xor a
	ld [wd47f], a
	jp Func_15f0f

.asm_15cfc
	ld a, [wPlayerDenjuu1Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wPlayerDenjuu1Field0x06]
	cp b
	jr c, .asm_15d15
	xor a
	ld [wPlayerDenjuu1Field0x06], a
	ld [wd47f], a
	jp Func_15f0f

.asm_15d15
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $3
	jr z, asm_15d68
	cp $1
	jr z, .asm_15d3f
	cp $5
	jr nz, asm_15d83
	ld a, [wPlayerDenjuu2CurMaxDP]
	ld b, a
	ld a, [wPlayerDenjuu2CurDP]
	cp b
	jr c, asm_15d83
	xor a
	ld [wPlayerDenjuu2CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	ld a, $1
	ld [wd47f], a
	jp Func_15f0f

.asm_15d3f
	ld a, [wPlayerDenjuu2Field0x08]
	ld e, a
	ld a, [wPlayerDenjuu2Field0x06]
	call CalcHPBarLength
	cp $30
	jr c, asm_15d83
	ld a, $a
	ld [wSerialSend], a
Func_15d52: ; 15d52 (5:5d52)
	ld a, $2
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld a, $30
	ld [wd430], a
	xor a
	ld [wPlayerDenjuu2Field0x06], a
	ld a, SFX_52
	ld [H_SFX_ID], a
	jp Func_15f20

asm_15d68
	ld a, [wPlayerDenjuu2Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wPlayerDenjuu2Field0x06]
	cp b
	jr c, asm_15d83
	xor a
	ld [wPlayerDenjuu2Field0x06], a
	ld a, $1
	ld [wd47f], a
	jp Func_15f0f

asm_15d83
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $3
	jr z, asm_15dd6
	cp $1
	jr z, .asm_15dad
	cp $5
	jr nz, asm_15df1
	ld a, [wPlayerDenjuu3CurMaxDP]
	ld b, a
	ld a, [wPlayerDenjuu3CurDP]
	cp b
	jr c, asm_15df1
	xor a
	ld [wPlayerDenjuu3CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	ld a, $2
	ld [wd47f], a
	jp Func_15f0f

.asm_15dad
	ld a, [wPlayerDenjuu3Field0x08]
	ld e, a
	ld a, [wPlayerDenjuu3Field0x06]
	call CalcHPBarLength
	cp $30
	jr c, asm_15df1
	ld a, $b
	ld [wSerialSend], a
Func_15dc0: ; 15dc0 (5:5dc0)
	ld a, $2
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $30
	ld [wd431], a
	xor a
	ld [wPlayerDenjuu3Field0x06], a
	ld a, SFX_52
	ld [H_SFX_ID], a
	jp Func_15f20

asm_15dd6
	ld a, [wPlayerDenjuu3Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wPlayerDenjuu3Field0x06]
	cp b
	jr c, asm_15df1
	xor a
	ld [wPlayerDenjuu3Field0x06], a
	ld a, $2
	ld [wd47f], a
	jp Func_15f0f

asm_15df1
	ld a, [wEnemyDenjuu1ArrivedStatus]
	cp $3
	jr z, .asm_15e17
	cp $5
	jr nz, .asm_15e32
	ld a, [wEnemyDenjuu1CurMaxDP]
	ld b, a
	ld a, [wEnemyDenjuu1CurDP]
	cp b
	jr c, .asm_15e32
	xor a
	ld [wEnemyDenjuu1CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	ld a, $3
	ld [wd47f], a
	jp Func_15f0f

.asm_15e17
	ld a, [wEnemyDenjuu1Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wEnemyDenjuu1Field0x06]
	cp b
	jr c, .asm_15e32
	xor a
	ld [wEnemyDenjuu1Field0x06], a
	ld a, $3
	ld [wd47f], a
	jp Func_15f0f

.asm_15e32
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $3
	jr z, asm_15e85
	cp $1
	jr z, .asm_15e5c
	cp $5
	jr nz, asm_15ea0
	ld a, [wEnemyDenjuu2CurMaxDP]
	ld b, a
	ld a, [wEnemyDenjuu2CurDP]
	cp b
	jr c, asm_15ea0
	xor a
	ld [wEnemyDenjuu2CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	ld a, $4
	ld [wd47f], a
	jp Func_15f0f

.asm_15e5c
	ld a, [wEnemyDenjuu2Field0x08]
	ld e, a
	ld a, [wEnemyDenjuu2Field0x06]
	call CalcHPBarLength
	cp $30
	jr c, asm_15ea0
	ld a, $14
	ld [wSerialSend], a
Func_15e6f: ; 15e6f (5:5e6f)
	ld a, $2
	ld [wEnemyDenjuu2ArrivedStatus], a
	ld a, $30
	ld [wd432], a
	xor a
	ld [wEnemyDenjuu2Field0x06], a
	ld a, SFX_52
	ld [H_SFX_ID], a
	jp Func_15f20

asm_15e85
	ld a, [wEnemyDenjuu2Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wEnemyDenjuu2Field0x06]
	cp b
	jr c, asm_15ea0
	xor a
	ld [wEnemyDenjuu2Field0x06], a
	ld a, $4
	ld [wd47f], a
	jp Func_15f0f

asm_15ea0
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $3
	jr z, asm_15ef3
	cp $1
	jr z, .asm_15eca
	cp $5
	jr nz, asm_15f0e
	ld a, [wEnemyDenjuu3CurMaxDP]
	ld b, a
	ld a, [wEnemyDenjuu3CurDP]
	cp b
	jr c, asm_15f0e
	xor a
	ld [wEnemyDenjuu3CurDP], a
	ld a, SFX_59
	ld [H_SFX_ID], a
	ld a, $5
	ld [wd47f], a
	jp Func_15f0f

.asm_15eca
	ld a, [wEnemyDenjuu3Field0x08]
	ld e, a
	ld a, [wEnemyDenjuu3Field0x06]
	call CalcHPBarLength
	cp $30
	jr c, asm_15f0e
	ld a, $15
	ld [wSerialSend], a
Func_15edd: ; 15edd (5:5edd)
	ld a, $2
	ld [wEnemyDenjuu3ArrivedStatus], a
	ld a, $30
	ld [wd433], a
	xor a
	ld [wEnemyDenjuu3Field0x06], a
	ld a, SFX_52
	ld [H_SFX_ID], a
	jp Func_15f20

asm_15ef3
	ld a, [wEnemyDenjuu3Speed]
	ld b, a
	ld a, [wd43f]
	sub b
	ld b, a
	ld a, [wEnemyDenjuu3Field0x06]
	cp b
	jr c, asm_15f0e
	xor a
	ld [wEnemyDenjuu3Field0x06], a
	ld a, $5
	ld [wd47f], a
	jp Func_15f0f

asm_15f0e
	ret

Func_15f0f: ; 15f0f (5:5f0f)
	ld a, [wd47f]
	inc a
	ld [wSerialSend], a
Func_15f16: ; 15f16 (5:5f16)
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $10
	ld [wBattleSubroutine], a
	ret

Func_15f20: ; 15f20 (5:5f20)
	xor a
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld a, $20
	ld [wBattleSubroutine], a
	ret

Func_15f2d: ; 15f2d (5:5f2d)
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $15
	ret nz
	ld a, $25
	ld [wBattleSubroutine], a
	ret

Func_15f3d: ; 15f3d (5:5f3d)
	lb bc, $0, $c
	ld e, $80
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $3, $e
	ld e, $83
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $4
	ld [wBattleSubroutine], a
	ret

Func_15f57: ; 15f57 (5:5f57)
	xor a
	ld [wd401], a
	ld a, $5
	ld [wSubroutine], a
	ld a, $6
	ld [wGameRoutine], a
	ret

Func_15f66: ; 15f66 (5:5f66)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call UpdatePlayerHUD
	call UpdateEnemyHUD
	ld a, $2b
	ld [wBattleSubroutine], a
	ret

Func_15f79: ; 15f79 (5:5f79)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $1
	jr z, asm_15f9b
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [wBattleTurn]
	cp $1
	jp z, Func_15f95
	ld a, $2d
	ld [wBattleSubroutine], a
	ret

Func_15f95: ; 15f95 (5:5f95)
	ld a, $36
	ld [wBattleSubroutine], a
	ret

asm_15f9b
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Func_15fa1: ; 15fa1 (5:5fa1)
	ld a, [wd4ce]
	call Func_142cd
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld c, $69
	call StdBattleTextBox
	jp NextBattleSubroutine

Func_15fb4: ; 15fb4 (5:5fb4)
	call BattlePrintText
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, $2b
	ld [wBattleSubroutine], a
	ret

Func_15fc5: ; 15fc5 (5:5fc5)
	ld a, [wMoveAnimationTimer]
	cp $a
	jr nc, .asm_15fd0
	ld e, $8e
	jr .asm_15fd2

.asm_15fd0
	ld e, $82
.asm_15fd2
	xor a
	jp LoadStdBGMapAttrLayout_

Func_15fd6: ; 15fd6 (5:5fd6)
	ld a, [wd45b]
	cp $5
	jr nc, .asm_1603f
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $14
	jr z, .asm_16033
	ld a, [wCurBattleDenjuu2]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $2
	jr nz, .asm_15ffb
	ld bc, $30e
	jp Func_15fc5

.asm_15ffb
	ld a, [wCurBattleDenjuu3]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $2
	jr nz, .asm_1600e
	ld bc, $310
	jp Func_15fc5

.asm_1600e
	ld a, [wCurEnemyDenjuu2]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $2
	jr nz, .asm_16021
	ld bc, $d0e
	jp Func_15fc5

.asm_16021
	ld a, [wCurEnemyDenjuu3]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $2
	ret nz
	ld bc, $d10
	jp Func_15fc5

.asm_16033
	xor a
	ld [wMoveAnimationTimer], a
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ret

.asm_1603f
	call Func_3f02
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	lb bc, $3, $e
	ld e, $83
	xor a
	call LoadStdBGMapAttrLayout_
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $2
	jp z, Func_16076
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $2
	jp z, Func_16076
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $2
	jp z, Func_16085
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $2
	jp z, Func_16085
	jr asm_16093

Func_16076: ; 16076 (5:6076)
	xor a
	ld [wd470], a
	lb bc, $1, $5
	ld e, $8b
	xor a
	call LoadStdBGMapLayout_
	jr asm_16093

Func_16085: ; 16085 (5:6085)
	ld a, $1
	ld [wd470], a
	lb bc, $1, $1
	ld e, $8b
	xor a
	call LoadStdWindowLayout_
asm_16093
	ld a, $1e
	ld [wBattleSubroutine], a
	ret

Func_16099: ; 16099 (5:6099)
	lb bc, $0, $c
	ld e, $80
	xor a
	call LoadStdBGMapLayout_
	lb bc, $3, $e
	ld e, $83
	xor a
	call LoadStdBGMapAttrLayout_
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $2
	jp z, Func_160cb
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $2
	jp z, Func_16108
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $2
	jp z, Func_1615f
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $2
	jp z, Func_1619e
Func_160cb: ; 160cb (5:60cb)
	ld a, [wPlayerDenjuu2]
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wNamedObjectIndexBuffer]
	call LoadPlayerDenjuuBattlePic
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld hl, VTilesBG tile $20
	call PlacePlayerDenjuuNickname
	ld a, [wPlayerDenjuu2MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call DrawPlayerDenjuuHPBar
	ld a, $1
	call DrawPlayerDPBar
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jp Func_161f5

Func_16108: ; 16108 (5:6108)
	ld a, $1
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $4
	jr z, .asm_16118
	cp $1
	jr nz, .asm_16122
.asm_16118
	ld a, $2
	ld [wCurBattleDenjuu2], a
	ld a, $1
	ld [wCurBattleDenjuu3], a
.asm_16122
	ld a, [wPlayerDenjuu3Species]
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wNamedObjectIndexBuffer]
	call LoadPlayerDenjuuBattlePic
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld hl, VTilesBG tile $20
	call PlacePlayerDenjuuNickname
	ld a, [wPlayerDenjuu3MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call DrawPlayerDenjuuHPBar
	ld a, $2
	call DrawPlayerDPBar
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	jp Func_161f5

Func_1615f: ; 1615f (5:615f)
	ld a, [wEnemyDenjuu2]
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wNamedObjectIndexBuffer]
	call LoadEnemyDenjuuBattlePic
	ld a, [wNamedObjectIndexBuffer]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	call GetAndPrintName75LeftAlign_
	ld a, [wEnemyDenjuu2MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call DrawEnemyDenjuuHPBar
	ld a, $1
	call DrawEnemyDPBar
	ld a, $3
	ld [wEnemyDenjuu2ArrivedStatus], a
	jr Func_161f5

Func_1619e: ; 1619e (5:619e)
	ld a, $1
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $4
	jr z, .asm_161ae
	cp $1
	jr nz, .asm_161b8
.asm_161ae
	ld a, $2
	ld [wCurEnemyDenjuu2], a
	ld a, $1
	ld [wCurEnemyDenjuu3], a
.asm_161b8
	ld a, [wEnemyDenjuu3Species]
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wNamedObjectIndexBuffer]
	call LoadEnemyDenjuuBattlePic
	ld a, [wNamedObjectIndexBuffer]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	call GetAndPrintName75LeftAlign_
	ld a, [wEnemyDenjuu3MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call DrawEnemyDenjuuHPBar
	ld a, $2
	call DrawEnemyDPBar
	ld a, $3
	ld [wEnemyDenjuu3ArrivedStatus], a
Func_161f5: ; 161f5 (5:61f5)
	ld a, $22
	ld [wBattleSubroutine], a
	ret

Func_161fb: ; 161fb (5:61fb)
	ld a, $10
	ld hl, VTilesBG tile $70
	call ClearString
	ld de, BattleString_Arrived
	ld hl, VTilesBG tile $78
	call PlaceBattleString
	ld a, [wd470]
	cp $1
	jr z, .asm_16239
	lb bc, $1, $5
	ld e, $92
	xor a
	call LoadStdBGMapLayout_
	lb bc, $2, $e
	ld e, $99
	xor a
	call LoadStdBGMapLayout_
	ld a, $28
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, $3c
	ld [wSpriteInitYCoordBuffers + 4], a
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	jr .asm_1625d

.asm_16239
	lb bc, $1, $1
	ld e, $91
	xor a
	call LoadStdWindowLayout_
	lb bc, $2, $e
	ld e, $9c
	xor a
	call LoadStdBGMapLayout_
	ld a, $78
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, $28
	ld [wSpriteInitYCoordBuffers + 4], a
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
.asm_1625d
	lb bc, $1, $5
	ld e, $8c
	xor a
	call LoadStdBGMapAttrLayout_
	ld bc, $4
	call GetCGB_OBLayout_
	call Func_142c1
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	ld hl, VTilesOB tile $00
	ld a, $7d
	ld [wBattleMenuCursorObjectTemplateIDX], a
	call InitBattleMenuCursor
	xor a
	ld [wMoveAnimationTimer], a
	ld a, $1f
	ld [wBattleSubroutine], a
	ret

Func_16289: ; 16289 (5:6289)
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	xor a
	ld [wOAMAnimation05_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $10
	ld hl, VTilesBG tile $70
	call ClearString
	ld hl, DenjuuArrivalMessages
	call LoadDenjuuBattleCatchphrase_
	ld hl, wd4d0
	call Func_14020
	ld a, [wd470]
	cp $1
	jr z, .asm_162bc
	call CopyPlayerDenjuuNameToBattleUserName
	jr .asm_162c2

.asm_162bc
	ld a, [wNamedObjectIndexBuffer]
	call Func_142cd
.asm_162c2
	ld c, $2
	call StdBattleTextBox
	ld a, $12
	ld [wBattleSubroutine], a
	ret

Func_162cd: ; 162cd (5:62cd)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd470]
	cp $1
	jr z, .asm_162f5
	ld a, [wNumAlivePlayerDenjuu]
	inc a
	ld [wNumAlivePlayerDenjuu], a
	lb bc, $1, $5
	ld e, $8b
	xor a
	call LoadStdBGMapLayout_
	call Func_1657b
	call Func_1643a
	jr .asm_1630b

.asm_162f5
	ld a, [wNumAliveEnemyDenjuu]
	inc a
	ld [wNumAliveEnemyDenjuu], a
	lb bc, $1, $1
	ld e, $8b
	xor a
	call LoadStdWindowLayout_
	call Func_1658d
	call Func_16461
.asm_1630b
	ld a, [wd4e5]
	inc a
	ld [wd4e5], a
	ld a, $21
	ld [wBattleSubroutine], a
	ret

Func_16318: ; 16318 (5:6318)
	ld a, [wd470]
	cp $1
	jr z, .asm_1632d
	lb bc, $1, $5
	ld e, $92
	xor a
	call LoadStdBGMapLayout_
	call UpdatePlayerHUD
	jr .asm_16339

.asm_1632d
	lb bc, $1, $1
	ld e, $91
	xor a
	call LoadStdWindowLayout_
	call UpdateEnemyHUD
.asm_16339
	lb bc, $2, $e
	ld e, $9a
	xor a
	call LoadStdBGMapLayout_
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Func_16348: ; 16348 (5:6348)
	xor a
	ld [wBattleSubroutine], a
	ld a, [wLinkMode]
	cp $1
	jr z, .asm_16356
	jp IncrementSubroutine

.asm_16356
	xor a
	ld [wd456], a
	ld a, $3
	ld [wSubroutine], a
	ret

Battle_TryToRun: ; 16360 (5:6360)
	ld a, [wLinkMode]
	cp $1
	jp z, Func_163d0
	ld a, [wBattleMode]
	cp $0
	jp nz, Func_163d0
	call Func_3f0a
	ld a, [wd5cd]
	or a
	jr z, Func_163d0
	call OpenSRAMBank2
	ld hl, sAddressBook + 2
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp $1
	jr c, .asm_1638d
	sub $1
	ld [hl], a
.asm_1638d
	call CloseSRAM
	lb bc, $2, $d
	ld e, $95
	xor a
	call LoadStdBGMapLayout_
	ld de, BattleString_Escaped
	ld hl, VTilesBG tile $78
	call PlaceBattleString
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, $0
	ld de, VTilesBG tile $40
	call LoadDenjuuPic_
	lb bc, $1, $5
	ld e, $94
	xor a
	call LoadStdBGMapLayout_
	lb bc, $1, $5
	ld e, $8c
	xor a
	call LoadStdBGMapAttrLayout_
	ld a, $a
	ld [wMoveAnimationTimer], a
	ld a, $2f
	ld [wBattleSubroutine], a
	ret

Func_163d0: ; 163d0 (5:63d0)
	ld a, $a
	ld [wMoveAnimationTimer], a
	ld c, $24
	call StdBattleTextBox
	ld a, $30
	ld [wBattleSubroutine], a
	ret

Func_163e0: ; 163e0 (5:63e0)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $e
	ld [wBattleSubroutine], a
	ret

Battle_DelayBeforeRunAway: ; 163ef (5:63ef)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	or a
	ret nz
	ld a, $15
	ld [wBattleSubroutine], a
	ret

Battle_RunAwayScrollScreen: ; 163fe (5:63fe)
	ld a, [wSCX]
	cp $64
	jr nc, .asm_1640b
	add $8
	ld [wSCX], a
	ret

.asm_1640b
	call Func_14005
	ld a, $10
	ld [wMusicFade], a
	jp NextBattleSubroutine

Battle_FinishRunAway: ; 16416 (5:6416)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	xor a
	ld [wc46c], a
	ld [wSCX], a
	ld [wWX], a
	call Func_142af
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld [wSCX], a
	ld a, $2
	ld [wSubroutine], a
	ret

Func_1643a: ; 1643a (5:643a)
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	ret z
	lb bc, $1, $0
	ld e, $ba
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wCurDenjuuBufferField0x12]
	ld b, a
	ld hl, VTilesBG tile $18
	jp Func_059f

Func_16461: ; 16461 (5:6461)
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	ret z
	lb bc, $1, $8
	ld e, $bb
	xor a
	call LoadStdWindowLayout_
	ld a, [wCurDenjuuBufferField0x12]
	ld b, a
	ld hl, VTilesBG tile $1c
	jp Func_059f

Func_16487: ; 16487 (5:6487)
	push af
	ld a, b
	cp $1
	jr z, .denjuu_1
	cp $2
	jr z, .denjuu_2
	cp $3
	jr z, .denjuu_3
	ld a, $10
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $70
	ld [wSpriteInitYCoordBuffers + 0], a
	ld hl, VTilesOB tile $50
	jr .get_sprite

.denjuu_1
	ld a, $10
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, $80
	ld [wSpriteInitYCoordBuffers + 1], a
	ld hl, VTilesOB tile $5c
	jr .get_sprite

.denjuu_2
	ld a, $60
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, $70
	ld [wSpriteInitYCoordBuffers + 2], a
	ld hl, VTilesOB tile $68
	jr .get_sprite

.denjuu_3
	ld a, $60
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, $80
	ld [wSpriteInitYCoordBuffers + 3], a
	ld hl, VTilesOB tile $74
.get_sprite
	pop af
	push hl
	ld [wd409], a
	call GetDenjuuSprite_
	pop hl
	ld a, [wd409]
	jp GetOverworldSprite_SizeHL

RotateThreeValuesAtBCBackwards:
	ld h, b
	ld l, c
	ld a, [hl]
	ld d, a
	inc hl
	ld a, [hl]
	ld h, b
	ld l, c
	ld [hl], a
	inc hl
	inc hl
	ld a, [hl]
	ld h, b
	ld l, c
	inc hl
	ld [hl], a
	ld a, d
	ld h, b
	ld l, c
	inc hl
	inc hl
	ld [hl], a
	ret

SwapTwoValuesAtBC:
	ld h, b
	ld l, c
	ld a, [hl]
	ld d, a
	inc hl
	ld a, [hl]
	ld h, b
	ld l, c
	ld [hl], a
	ld a, d
	ld h, b
	ld l, c
	inc hl
	ld [hl], a
	ret

RotateThreeValuesAtBCForwards:
	ld h, b
	ld l, c
	ld a, [hl]
	ld d, a
	inc hl
	inc hl
	ld a, [hl]
	ld h, b
	ld l, c
	ld [hl], a
	inc hl
	ld a, [hl]
	ld h, b
	ld l, c
	inc hl
	inc hl
	ld [hl], a
	ld a, d
	ld h, b
	ld l, c
	inc hl
	ld [hl], a
	ret

Func_1651b: ; 1651b (5:651b)
	ld bc, wCurBattleDenjuu
	ld a, [wNumAlivePlayerDenjuu]
	cp $3
	jr z, .asm_16528
	jp SwapTwoValuesAtBC

.asm_16528
	jp RotateThreeValuesAtBCBackwards

Func_1652b:
	ld bc, wCurBattleDenjuu
	ld a, [wPlayerPartySize]
	cp $3
	jr z, .asm_16538
	jp SwapTwoValuesAtBC

.asm_16538
	jp RotateThreeValuesAtBCBackwards

Func_1653b: ; 1653b (5:653b)
	ld bc, wCurBattleDenjuu
	ld a, [wNumAlivePlayerDenjuu]
	cp $3
	jr z, .asm_16548
	jp SwapTwoValuesAtBC

.asm_16548
	jp RotateThreeValuesAtBCForwards

Func_1654b: ; 1654b (5:654b)
	ld bc, wCurEnemyDenjuu
	ld a, [wNumAliveEnemyDenjuu]
	cp $3
	jr z, .asm_16558
	jp SwapTwoValuesAtBC

.asm_16558
	jp RotateThreeValuesAtBCBackwards

Func_1655b:
	ld bc, wCurEnemyDenjuu
	ld a, [wEnemyPartySize]
	cp $3
	jr z, .asm_16568
	jp SwapTwoValuesAtBC

.asm_16568
	jp RotateThreeValuesAtBCBackwards

Func_1656b: ; 1656b (5:656b)
	ld bc, wCurEnemyDenjuu
	ld a, [wNumAliveEnemyDenjuu]
	cp $3
	jr z, .asm_16578
	jp SwapTwoValuesAtBC

.asm_16578
	jp RotateThreeValuesAtBCForwards

Func_1657b: ; 1657b (5:657b)
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call LoadPlayerDenjuuBattlePic
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_1658d: ; 1658d (5:658d)
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call LoadEnemyDenjuuBattlePic
	ld a, $1
	ld [wBGPalUpdate], a
	ret

InitBattleTopMenuCursor: ; 1659f (5:659f)
	ld a, [wBattleMenuSelection]
	cp $1
	jr z, .asm_165ad
	ld a, $70
	ld [wSpriteInitYCoordBuffers + 0], a
	jr .asm_165b2

.asm_165ad
	ld a, $80
	ld [wSpriteInitYCoordBuffers + 0], a
.asm_165b2
	ld a, $c
	ld [wSpriteInitXCoordBuffers + 0], a
	xor a
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

InitMoveSelectionMenuCursor: ; 165c3 (5:65c3)
	ld hl, wSpriteInitYCoordBuffers + 1
	ld [hl], $50
	ld a, [wBattleMenuSelection]
	ld b, a
	or a
	jr z, .skip
.loop
	ld a, [hl]
	add $10
	ld [hl], a
	dec b
	jr nz, .loop
.skip
	ld a, $50
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_165e8: ; 165e8 (5:65e8)
	xor a
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $48
	ld [wSpriteInitYCoordBuffers + 0], a
	ld a, $d2
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_165fe: ; 165fe (5:65fe)
	xor a
	ld [wWhichBattleMenuCursor], a
	ld a, $8
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $58
	ld [wSpriteInitYCoordBuffers + 0], a
	ld a, $d2
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_16614: ; 16614 (5:6614)
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_1662c
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	ld hl, wd5ba
	add hl, de
	ld a, [hl]
	cp $2
	jr z, .asm_1663d
	xor a
	ret

.asm_1662c
	ld d, $0
	ld a, [wCurEnemyDenjuu]
	ld e, a
	ld hl, wd5bd
	add hl, de
	ld a, [hl]
	cp $2
	jr z, .asm_1663d
	xor a
	ret

.asm_1663d
	ld a, $0
	ld [hl], a
	ld a, $1
	ret

Func_16643:
	ld a, [wd401]
	jump_table
	dw Func_166a5
	dw Func_16709
	dw Func_16724
	dw Func_168d6
	dw Func_16c11
	dw Func_16c6e
	dw Func_16e82
	dw FaintPlayerDenjuu
	dw Func_16f84
	dw Func_16f97
	dw Func_17122
	dw Func_1717f
	dw Func_17347
	dw FaintEnemyDenjuu
	dw Func_1740c
	dw Func_1741f
	dw Func_174b9
	dw Func_17521
	dw Func_17589
	dw Func_175ce
	dw Func_17612
	dw Func_17aea
	dw Func_17df4
	dw Func_17e09
	dw Func_17f13
	dw Func_16e1d
	dw Func_16e29
	dw Func_172dd
	dw Func_172e9
	dw Func_17dd6
	dw Func_17689
	dw Func_175bd
	dw Func_176b9
	dw Func_16801
	dw Func_1747e
	dw Func_17ef6
	dw Func_16cba
	dw Func_17de5
	dw Func_170c5
	dw Func_16aa7
	dw Func_170d8
	dw Func_16c7f
	dw Func_16cda
	dw Func_17190

Func_166a5: ; 166a5 (5:66a5)
	call Func_143df
	cp $1
	jr z, .asm_166d9
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_166dd
	call CopyPlayerDenjuuNameToBattleUserName
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jr z, .asm_166fc
	ld hl, wPlayerDenjuu1AttackedOnItsOwn
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	add hl, de
	ld a, [hl]
	cp $1
	jr z, .asm_166ee
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr z, .asm_166f8
.asm_166d9
	ld c, $1d
	jr .asm_166fe

.asm_166dd
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jr z, .asm_166fc
	ld c, $1d
	jr .asm_166fe

.asm_166ee
	xor a
	ld [wPlayerDenjuu1AttackedOnItsOwn], a
	ld [wPlayerDenjuu2AttackedOnItsOwn], a
	ld [wPlayerDenjuu3AttackedOnItsOwn], a
.asm_166f8
	ld c, $20
	jr .asm_166fe

.asm_166fc
	ld c, $d
.asm_166fe
	call StdBattleTextBox
	ld a, $32
	ld [wMoveAnimationTimer], a
	jp BattleCore_IncrementD401

Func_16709: ; 16709 (5:6709)
	call BattlePrintText
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_1671e
	jp BattleCore_IncrementD401

.asm_1671e
	ld a, $21
	ld [wd401], a
	ret

Func_16724: ; 16724 (5:6724)
	ld bc, EVENT_1F1
	call CheckEventFlag
	jr z, .asm_1672f
	jp Func_167c5

.asm_1672f
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpeedCopy2]
	ld [wd49b], a
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_16744
	sub QUICK_STEP - SPEED_UP
.asm_16744
	cp RECOVER
	jr z, asm_167af
	cp SHIELD
	jr z, asm_167af
	cp JUMP
	jp z, asm_167af
	cp FLIGHT
	jp z, asm_167af
	cp EM_BARRIER
	jp z, asm_167af
	cp SPEED_UP
	jr c, .asm_16763
	cp ULTRASONIC
	jr c, asm_167af
.asm_16763
	ld a, [wCurDenjuuBufferField0x12]
	cp $1
	jr z, Func_167c5
	cp $2
	jr z, Func_167c5
	cp $3
	jr z, Func_167c5
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jp nz, Func_1679b
	ld a, [wCurDenjuuBufferField0x12]
	cp $d
	jp nz, Func_1679b
	call Func_170e4
	ld c, $a
	call StdBattleTextBox
	ld a, $f4
	ld [wSerialSend], a
	ld a, $25
	ld [wd401], a
	ret

Func_1679b: ; 1679b (5:679b)
	ld a, [wCurDenjuuBufferField0x12]
	cp $6
	jr z, .asm_167a6
	cp $9
	jr nz, asm_167af
.asm_167a6
	call Random
	cp $50
	jr c, asm_167c1
	jr Func_167c5

asm_167af
	ld a, [wCurDenjuuBufferLevel]
	cp $63
	jr z, asm_167c1
	call Func_167e9
	call Random
	cp b
	jr c, asm_167c1
	jr Func_167c5

asm_167c1
	ld a, $1
	jr asm_167c7

Func_167c5: ; 167c5 (5:67c5)
	ld a, $0
asm_167c7
	cp $1
	jr z, .asm_167de
	ld a, $1e
	ld [wMoveAnimationTimer], a
	call Func_170e4
	ld a, $f4
	ld [wSerialSend], a
	ld a, $12
	ld [wd401], a
	ret

.asm_167de
	ld a, $1
	ld [wSerialSend], a
	ld a, $14
	ld [wd401], a
	ret

Func_167e9: ; 167e9 (5:67e9)
	ld a, $f5
	ld b, a
	ld a, [wCurDenjuuBufferSpeedCopy1]
	srl a
	srl a
	srl a
	add b
	ld b, a
	ld a, [wd49b]
	srl a
	ld c, a
	ld a, b
	sub c
	ld b, a
	ret

Func_16801: ; 16801 (5:6801)
	ld bc, EVENT_1F1
	call CheckEventFlag
	jr z, .asm_1680c
	jp Func_168d0

.asm_1680c
	ld a, [wLinkMode]
	cp $0
	jr z, .asm_1682b
	call Func_3eee
	cp $0
	jr nz, .asm_1681b
	ret

.asm_1681b
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $1
	jp z, Func_168d0
	jp Func_168c2

.asm_1682b
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpeedCopy2]
	ld [wd49b], a
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_16840
	sub QUICK_STEP - SPEED_UP
.asm_16840
	cp RECOVER
	jr z, asm_168a6
	cp SHIELD
	jr z, asm_168a6
	cp JUMP
	jp z, asm_168a6
	cp FLIGHT
	jp z, asm_168a6
	cp EM_BARRIER
	jp z, asm_168a6
	cp SPEED_UP
	jr c, .asm_1685f
	cp ULTRASONIC
	jr c, asm_168a6
.asm_1685f
	ld a, [wCurDenjuuBufferField0x12]
	cp $1
	jr z, asm_168bc
	cp $2
	jr z, asm_168bc
	cp $3
	jr z, asm_168bc
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jp nz, Func_16892
	ld a, [wCurDenjuuBufferField0x12]
	cp $d
	jp nz, Func_16892
	call Func_16bd3
	ld c, $a
	call StdBattleTextBox
	ld a, $25
	ld [wd401], a
	ret

Func_16892: ; 16892 (5:6892)
	ld a, [wCurDenjuuBufferField0x12]
	cp $6
	jr z, .asm_1689d
	cp $9
	jr nz, asm_168a6
.asm_1689d
	call Random
	cp $50
	jr c, asm_168b8
	jr asm_168bc

asm_168a6
	ld a, [wCurDenjuuBufferLevel]
	cp $63
	jr z, asm_168b8
	call Func_167e9
	call Random
	cp b
	jr c, asm_168b8
	jr asm_168bc

asm_168b8
	ld a, $1
	jr asm_168be

asm_168bc
	ld a, $0
asm_168be
	cp $1
	jr z, Func_168d0
Func_168c2: ; 168c2 (5:68c2)
	ld a, $1e
	ld [wMoveAnimationTimer], a
	call Func_16bd3
	ld a, $12
	ld [wd401], a
	ret

Func_168d0: ; 168d0 (5:68d0)
	ld a, $14
	ld [wd401], a
	ret

Func_168d6: ; 168d6 (5:68d6)
	ld a, [wLinkMode]
	cp $0
	jp z, Func_168ed
	ld hl, wSerialReceiveQueue
	ld a, [wdc45]
	inc a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	cp $0
	ret z
Func_168ed: ; 168ed (5:68ed)
	call Func_14340
	cp $0
	ret nz
	ld a, [wLinkMode]
	cp $0
	jp z, Func_1697c
	call Func_3eee
	cp $f0
	jr z, .asm_1693f
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	call Func_3eee
	ld [wd434], a
	ld [wd4ef], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call CalcTypeMatchup
	call Func_16bd3
	jp Func_16a87

.asm_1693f
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	call Func_3eee
	ld [wd434], a
	ld [wd4ef], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call CalcTypeMatchup
	call Func_16bd3
	jp Func_16a9c

Func_1697c: ; 1697c (5:697c)
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jp nz, Func_169e0
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wCurDenjuuBufferSpAtk]
	ld b, a
	ld a, [wd495]
	add b
	ld b, a
	cp 170 ; 66.6%
	jr c, .asm_169a0
	ld a, 170
	ld b, a
.asm_169a0
	srl a
	add b
	ld [wd434], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	srl a
	srl a
	add b
	ld b, a
	ld a, [wd434]
	cp b
	jr c, .asm_169d2
	sub b
	ld [wd434], a
	cp $0
	jr nz, .asm_169d7
.asm_169d2
	ld a, $1
	ld [wd434], a
.asm_169d7
	ld [wd4ef], a
	call Func_16bd3
	jp Func_16a4b

Func_169e0: ; 169e0 (5:69e0)
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wCurDenjuuBufferAttack]
	ld b, a
	ld a, [wd495]
	add b
	ld b, a
	cp 200
	jr c, .asm_169f6
	ld a, 200
	ld b, a
.asm_169f6
	ld a, [wCurDenjuuBufferField0x12]
	cp $f
	jr z, .asm_16a06
	ld a, b
	srl a
	srl a
	srl a
	add b
	ld b, a
.asm_16a06
	ld a, b
	ld [wd434], a
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurDenjuuBufferDefense]
	ld b, a
	srl a
	srl a
	srl a
	add b
	ld b, a
	ld a, [wCurDenjuuBufferField0x12]
	cp $e
	jr nz, .asm_16a35
	ld a, b
	srl a
	ld b, a
.asm_16a35
	ld a, [wd434]
	cp b
	jr c, .asm_16a43
	sub b
	ld [wd434], a
	cp $0
	jr nz, .asm_16a48
.asm_16a43
	ld a, $1
	ld [wd434], a
.asm_16a48
	ld [wd4ef], a
Func_16a4b: ; 16a4b (5:6a4b)
	call Func_16aba
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_16add
	ld bc, EVENT_1F1
	call CheckEventFlag
	jr z, .asm_16a6a
	ld a, $ff
	ld [wd434], a
	ld [wd4ef], a
.asm_16a6a
	call Random
	cp $10
	jr nc, Func_16a9c
	ld a, [wd434]
	cp $80
	jr nc, .asm_16a7f
	sla a
	ld [wd434], a
	jr .asm_16a84

.asm_16a7f
	ld a, $ff
	ld [wd434], a
.asm_16a84
	ld [wd4ef], a
Func_16a87: ; 16a87 (5:6a87)
	ld c, $90
	call StdBattleTextBox
	ld a, SFX_53
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, $27
	ld [wd401], a
	ret

Func_16a9c: ; 16a9c (5:6a9c)
	ld a, SFX_53
	ld [H_SFX_ID], a
	ld a, $4
	ld [wd401], a
	ret

Func_16aa7: ; 16aa7 (5:6aa7)
	call BattlePrintText
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, $4
	ld [wd401], a
	ret

Func_16aba: ; 16aba (5:6aba)
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuBufferField0x0c]
	ld c, a
	call Func_0681
	ld a, [wd43d]
	ld b, a
	ld a, [wd434]
	add b
	ret c
	ld [wd434], a
	ld [wd4ef], a
	ret

Func_16add: ; 16add (5:6add)
	call CalcTypeMatchup
	ld a, [wSuperEffective]
	cp $1
	jr z, .asm_16aef
	ld a, [wNotVeryEffective]
	cp $1
	jr z, .asm_16b06
	ret

.asm_16aef
	ld a, [wd434]
	cp $80
	jr nc, .asm_16afd
	sla a
	ld [wd434], a
	jr .asm_16b02

.asm_16afd
	ld a, $ff
	ld [wd434], a
.asm_16b02
	ld [wd4ef], a
	ret

.asm_16b06
	ld a, [wd434]
	srl a
	cp $0
	jr nz, .asm_16b11
	ld a, $1
.asm_16b11
	ld [wd434], a
	ld [wd4ef], a
	ret

CalcTypeMatchup: ; 16b18 (5:6b18)
	ld [wCurDenjuu], a
	call IsLegendaryInParty_
	ld a, [wLegendaryInParty]
	cp $1
	jp nz, .normal_calc
	ld a, [wBattleTurn]
	cp $1
	jr z, .enemy_turn
	jp SetSuperEffective

.enemy_turn
	jp SetNotVeryEffective

.normal_calc
	ld a, [wCurDenjuu]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	cp GRASSLAND
	jp z, .grassland
	cp FOREST
	jp z, .forest
	cp AQUATIC
	jp z, .aquatic
	cp SKY
	jp z, .sky
	cp DESERT
	jp z, .desert
.mountain
	ld a, [wDefendingDenjuuType]
	cp GRASSLAND
	jp z, SetNotVeryEffective
	cp SKY
	jp z, SetSuperEffective
	jp SetNormalDamage

.grassland
	ld a, [wDefendingDenjuuType]
	cp MOUNTAIN
	jp z, SetSuperEffective
	cp DESERT
	jp z, SetNotVeryEffective
	jp SetNormalDamage

.forest
	ld a, [wDefendingDenjuuType]
	cp AQUATIC
	jp z, SetSuperEffective
	cp SKY
	jp z, SetNotVeryEffective
	jp SetNormalDamage

.aquatic
	ld a, [wDefendingDenjuuType]
	cp FOREST
	jp z, SetNotVeryEffective
	cp DESERT
	jp z, SetSuperEffective
	jp SetNormalDamage

.sky
	ld a, [wDefendingDenjuuType]
	cp MOUNTAIN
	jp z, SetNotVeryEffective
	cp FOREST
	jp z, SetSuperEffective
	jp SetNormalDamage

.desert
	ld a, [wDefendingDenjuuType]
	cp GRASSLAND
	jp z, SetSuperEffective
	cp AQUATIC
	jp z, SetNotVeryEffective
	jp SetNormalDamage

SetSuperEffective:
	ld a, $1
	ld [wSuperEffective], a
	xor a
	ld [wNotVeryEffective], a
	ret

SetNotVeryEffective:
	ld a, $1
	ld [wNotVeryEffective], a
	xor a
	ld [wSuperEffective], a
	ret

SetNormalDamage:
	xor a
	ld [wNotVeryEffective], a
	ld [wSuperEffective], a
	ret

Func_16bd3: ; 16bd3 (5:6bd3)
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_16bef
	cp $2
	jr z, .asm_16c00
	ld a, [wEnemyDenjuu1ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wEnemyDenjuu1ArrivedStatus], a
	ld a, $0
	ld [wEnemyDenjuu1CurDP], a
	ret

.asm_16bef
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wEnemyDenjuu2ArrivedStatus], a
	ld a, $0
	ld [wEnemyDenjuu2CurDP], a
	ret

.asm_16c00
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wEnemyDenjuu3ArrivedStatus], a
	ld a, $0
	ld [wEnemyDenjuu3CurDP], a
	ret

Func_16c11: ; 16c11 (5:6c11)
	ld a, [wVBlankCounter]
	and $1
	ret nz
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_16c2b
	cp $2
	jr z, .asm_16c34
	ld a, [wPlayerDenjuu1CurHP]
	dec a
	ld [wPlayerDenjuu1CurHP], a
	jr .asm_16c3b

.asm_16c2b
	ld a, [wPlayerDenjuu2CurHP]
	dec a
	ld [wPlayerDenjuu2CurHP], a
	jr .asm_16c3b

.asm_16c34
	ld a, [wPlayerDenjuu3CurHP]
	dec a
	ld [wPlayerDenjuu3CurHP], a
.asm_16c3b
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call DrawPlayerDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_16c58
	ld a, [wd434]
	cp $0
	ret nz
.asm_16c58
	ld h, $0
	ld a, [wd4ef]
	ld l, a
	call PrintNumHL
	ld c, $14
	call StdBattleTextBox
	ld a, $3c
	ld [wd45c], a
	jp BattleCore_IncrementD401

Func_16c6e: ; 16c6e (5:6c6e)
	call BattlePrintText
	ld a, [wd45c]
	dec a
	ld [wd45c], a
	ret nz
	ld a, $29
	ld [wd401], a
	ret

Func_16c7f: ; 16c7f (5:6c7f)
	ld a, [wSuperEffective]
	cp $0
	jr z, .asm_16c91
	ld c, $70
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

.asm_16c91
	ld a, [wNotVeryEffective]
	cp $0
	jr z, .asm_16ca3
	ld c, $6f
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

.asm_16ca3
	ld a, [wBattleTurn]
	or a
	jr z, .asm_16caf
	ld a, $2a
	ld [wd401], a
	ret

.asm_16caf
	ld c, $72
	call StdBattleTextBox
	ld a, $2b
	ld [wd401], a
	ret

Func_16cba: ; 16cba (5:6cba)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wBattleTurn]
	or a
	jr z, .asm_16ccf
	ld a, $2a
	ld [wd401], a
	ret

.asm_16ccf
	ld c, $72
	call StdBattleTextBox
	ld a, $2b
	ld [wd401], a
	ret

Func_16cda: ; 16cda (5:6cda)
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr nz, .asm_16cf2
	ld a, $f4
	ld [wSerialSend], a
	ld a, $6
	ld [wd401], a
	ret

.asm_16cf2
	ld a, [wCurDenjuuBufferField0x12]
	cp $5
	jp z, Func_16d5c
	ld a, [wCurDenjuuBufferMaxHP]
	srl a
	srl a
	ld b, a
	ld a, [wCurDenjuuBufferCurHP]
	cp b
	jp nc, Func_16d5c
	ld a, [wCurDenjuuBufferField0x0c]
	cp $6
	jr z, .asm_16d14
	cp $7
	jr nz, Func_16d5c
.asm_16d14
	ld a, [wCurDenjuuBufferFD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, Func_16d5c
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_16d38
	cp $2
	jr z, .asm_16d43
	xor a
	ld [wPlayerDenjuu1CurHP], a
	ld a, $8
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .asm_16d4c

.asm_16d38
	xor a
	ld [wPlayerDenjuu2CurHP], a
	ld a, $8
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .asm_16d4c

.asm_16d43
	xor a
	ld [wPlayerDenjuu3CurHP], a
	ld a, $8
	ld [wPlayerDenjuu3ArrivedStatus], a
.asm_16d4c
	ld a, $f2
	ld [wSerialSend], a
	ld c, $6
	call StdBattleTextBox
	ld a, $19
	ld [wd401], a
	ret

Func_16d5c: ; 16d5c (5:6d5c)
	ld a, $f0
	ld [wSerialSend], a
	ld a, [wCurBattleDenjuu]
	cp $0
	jr z, .asm_16d73
	cp $1
	jr z, .asm_16d93
	cp $2
	jr z, .asm_16db2
	jp Func_16e17

.asm_16d73
	ld a, [wPlayerDenjuu1AddressBookLocation]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wPlayerDenjuu1Field0x12]
	cp $7
	jr z, .asm_16d87
	cp $4
	jr z, .asm_16d8d
	jp Func_16e17

.asm_16d87
	xor a
	ld [wPlayerDenjuu1Field0x12], a
	jr .asm_16dd1

.asm_16d8d
	xor a
	ld [wPlayerDenjuu1Field0x12], a
	jr .asm_16df4

.asm_16d93
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wPlayerDenjuu2Field0x12]
	cp $7
	jr z, .asm_16da6
	cp $4
	jr z, .asm_16dac
	jr Func_16e17

.asm_16da6
	xor a
	ld [wPlayerDenjuu2Field0x12], a
	jr .asm_16dd1

.asm_16dac
	xor a
	ld [wPlayerDenjuu2Field0x12], a
	jr .asm_16df4

.asm_16db2
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wPlayerDenjuu3Field0x12]
	cp $7
	jr z, .asm_16dc5
	cp $4
	jr z, .asm_16dcb
	jr Func_16e17

.asm_16dc5
	xor a
	ld [wPlayerDenjuu3Field0x12], a
	jr .asm_16dd1

.asm_16dcb
	xor a
	ld [wPlayerDenjuu3Field0x12], a
	jr .asm_16df4

.asm_16dd1
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld a, a
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call CopyPlayerDenjuuNameToBattleUserName
	call CloseSRAM
	ld c, $4b
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

.asm_16df4
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld a, a
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call CopyPlayerDenjuuNameToBattleUserName
	call CloseSRAM
	ld c, $48
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

Func_16e17: ; 16e17 (5:6e17)
	ld a, $f
	ld [wd401], a
	ret

Func_16e1d: ; 16e1d (5:6e1d)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	jp BattleCore_IncrementD401

Func_16e29: ; 16e29 (5:6e29)
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
	ld e, $85
	ld a, $0
	call LoadStdBGMapLayout_
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142cd
	call CopyPlayerDenjuuNameToBattleUserName
	ld c, $7
	call StdBattleTextBox
	ld a, SFX_57
	ld [H_SFX_ID], a
	call Func_1652b
	ld a, [wCurBattleDenjuu]
	ld [wCurMoveTarget], a
	ld a, [wNumAlivePlayerDenjuu]
	dec a
	ld [wNumAlivePlayerDenjuu], a
	ld a, [wPlayerPartySize]
	dec a
	ld [wPlayerPartySize], a
	ld a, [wd4e5]
	dec a
	ld [wd4e5], a
	ld a, $7
	ld [wd401], a
	ret

Func_16e82: ; 16e82 (5:6e82)
	ld a, SFX_5A
	ld [H_SFX_ID], a
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
	ld e, $85
	ld a, $0
	call LoadStdBGMapLayout_
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_16ecb
	cp $2
	jr z, .asm_16ee8
	ld a, $0
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld hl, sAddressBook + 2
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp $0
	jr z, .asm_16ec6
	dec a
	ld [hl], a
.asm_16ec6
	call CloseSRAM
	jr .asm_16f03

.asm_16ecb
	ld a, $0
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld hl, sAddressBook + 2
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp $0
	jr z, .asm_16ee3
	dec a
	ld [hl], a
.asm_16ee3
	call CloseSRAM
	jr .asm_16f03

.asm_16ee8
	ld a, $0
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld hl, sAddressBook + 2
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp $0
	jr z, .asm_16f00
	dec a
	ld [hl], a
.asm_16f00
	call CloseSRAM
.asm_16f03
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142cd
	call CopyPlayerDenjuuNameToBattleUserName
	ld c, $5
	call StdBattleTextBox
	ld a, [wPlayerPartySize]
	ld b, a
	ld a, [wNumAlivePlayerDenjuu]
	cp b
	jr z, .asm_16f26
	call Func_1652b
	jr .asm_16f29

.asm_16f26
	call Func_1651b
.asm_16f29
	ld a, [wCurBattleDenjuu]
	ld [wCurMoveTarget], a
	ld a, [wNumAlivePlayerDenjuu]
	dec a
	ld [wNumAlivePlayerDenjuu], a
	ld a, [wPlayerPartySize]
	dec a
	ld [wPlayerPartySize], a
	ld a, [wd4e5]
	dec a
	ld [wd4e5], a
	jp BattleCore_IncrementD401

FaintPlayerDenjuu: ; 16f47 (5:6f47)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wNumAlivePlayerDenjuu]
	cp $0
	jr nz, .still_got_one_alive
	ld a, $1
	ld [wBattleEnded], a
	ld a, $0
	ld [wBattleResult], a
	xor a
	ld [wd401], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

.still_got_one_alive
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call LoadPlayerDenjuuBattlePic
	lb bc, $1, $0
	ld e, $86
	ld a, $0
	call LoadStdBGMapLayout_
	jp BattleCore_IncrementD401

Func_16f84: ; 16f84 (5:6f84)
	call UpdatePlayerHUD
	lb bc, $1, $5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $13
	ld [wd401], a
	ret

Func_16f97: ; 16f97 (5:6f97)
	call Func_1438d
	cp $0
	ret nz
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jp nz, Func_17001
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wCurDenjuuBufferSpAtk]
	ld b, a
	ld a, [wd495]
	add b
	ld b, a
	cp 170
	jr c, .asm_16fc1
	ld a, 170
	ld b, a
.asm_16fc1
	srl a
	add b
	ld [wd434], a
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	srl a
	srl a
	add b
	ld b, a
	ld a, [wd434]
	cp b
	jr c, .asm_16ff3
	sub b
	ld [wd434], a
	cp $0
	jr nz, .asm_16ff8
.asm_16ff3
	ld a, $1
	ld [wd434], a
.asm_16ff8
	ld [wd4ef], a
	call Func_170e4
	jp Func_1706c

Func_17001: ; 17001 (5:7001)
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wCurDenjuuBufferAttack]
	ld b, a
	ld a, [wd495]
	add b
	ld b, a
	cp 200
	jr c, .asm_17017
	ld a, 200
	ld b, a
.asm_17017
	ld a, [wCurDenjuuBufferField0x12]
	cp $f
	jr z, .asm_17027
	ld a, b
	srl a
	srl a
	srl a
	add b
	ld b, a
.asm_17027
	ld a, b
	ld [wd434], a
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wDefendingDenjuuType], a
	ld a, [wCurDenjuuBufferDefense]
	ld b, a
	srl a
	srl a
	srl a
	add b
	ld b, a
	ld a, [wCurDenjuuBufferField0x12]
	cp $e
	jr nz, .asm_17056
	ld a, b
	srl a
	ld b, a
.asm_17056
	ld a, [wd434]
	cp b
	jr c, .asm_17064
	sub b
	ld [wd434], a
	cp $0
	jr nz, .asm_17069
.asm_17064
	ld a, $1
	ld [wd434], a
.asm_17069
	ld [wd4ef], a
Func_1706c: ; 1706c (5:706c)
	call Func_16aba
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_16add
	call Random
	cp $10
	jr nc, .asm_170b5
	ld a, [wd434]
	cp $80
	jr nc, .asm_17093
	ld a, [wd434]
	sla a
	ld [wd434], a
	jr .asm_17098

.asm_17093
	ld a, $ff
	ld [wd434], a
.asm_17098
	ld [wd4ef], a
	ld a, $1
	ld [wSerialSend], a
	ld c, $90
	call StdBattleTextBox
	ld a, SFX_53
	ld [H_SFX_ID], a
	ld a, $0
	ld [wMoveAnimationTimer], a
	ld a, $26
	ld [wd401], a
	ret

.asm_170b5
	ld a, $f0
	ld [wSerialSend], a
	ld a, SFX_53
	ld [H_SFX_ID], a
	ld a, $28
	ld [wd401], a
	ret

Func_170c5: ; 170c5 (5:70c5)
	call BattlePrintText
	ld a, [wMoveAnimationTimer]
	inc a
	ld [wMoveAnimationTimer], a
	cp $1e
	ret c
	ld a, $28
	ld [wd401], a
	ret

Func_170d8: ; 170d8 (5:70d8)
	ld a, [wd434]
	ld [wSerialSend], a
	ld a, $a
	ld [wd401], a
	ret

Func_170e4: ; 170e4 (5:70e4)
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17100
	cp $2
	jr z, .asm_17111
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	ld a, $0
	ld [wPlayerDenjuu1CurDP], a
	ret

.asm_17100
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld a, $0
	ld [wPlayerDenjuu2CurDP], a
	ret

.asm_17111
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $5
	ret nz
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $0
	ld [wPlayerDenjuu3CurDP], a
	ret

Func_17122: ; 17122 (5:7122)
	ld a, [wVBlankCounter]
	and $1
	ret nz
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_1713c
	cp $2
	jr z, .asm_17145
	ld a, [wEnemyDenjuu1CurHP]
	dec a
	ld [wEnemyDenjuu1CurHP], a
	jr .asm_1714c

.asm_1713c
	ld a, [wEnemyDenjuu2CurHP]
	dec a
	ld [wEnemyDenjuu2CurHP], a
	jr .asm_1714c

.asm_17145
	ld a, [wEnemyDenjuu3CurHP]
	dec a
	ld [wEnemyDenjuu3CurHP], a
.asm_1714c
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	call DrawEnemyDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_17169
	ld a, [wd434]
	cp $0
	ret nz
.asm_17169
	ld h, $0
	ld a, [wd4ef]
	ld l, a
	call PrintNumHL
	ld a, $3c
	ld [wd45c], a
	ld c, $14
	call StdBattleTextBox
	jp BattleCore_IncrementD401

Func_1717f: ; 1717f (5:717f)
	call BattlePrintText
	ld a, [wd45c]
	dec a
	ld [wd45c], a
	ret nz
	ld a, $29
	ld [wd401], a
	ret

Func_17190: ; 17190 (5:7190)
	ld a, [wLinkMode]
	or a
	jr z, asm_171c6
	call BattlePrintText
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [hl]
	cp $f4
	jp z, Func_171d3
	cp $f0
	jp z, Func_17246
	cp $f2
	jp z, Func_171b7
	ret

Func_171b7: ; 171b7 (5:71b7)
	ld a, [wCurEnemyDenjuu]
	cp $0
	jr z, asm_1721c
	cp $1
	jp z, Func_17227
	jp Func_17232

asm_171c6
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr nz, asm_171d9
Func_171d3: ; 171d3 (5:71d3)
	ld a, $c
	ld [wd401], a
	ret

asm_171d9
	ld a, [wBattleMode]
	cp $0
	jp nz, Func_17246
	ld a, [wCurDenjuuBufferField0x12]
	cp $5
	jp z, Func_17246
	ld a, [wCurDenjuuBufferMaxHP]
	srl a
	srl a
	ld b, a
	ld a, [wCurDenjuuBufferCurHP]
	cp b
	jp nc, Func_17246
	ld a, [wCurDenjuuBufferField0x0c]
	cp $6
	jr z, .asm_17203
	cp $7
	jr nz, Func_17246
.asm_17203
	ld a, [wCurDenjuuBufferFD]
	sla a
	add (-201 & $ff)
	ld b, a
	call Random
	cp b
	jr c, Func_17246
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, Func_17227
	cp $2
	jr z, Func_17232
asm_1721c
	xor a
	ld [wEnemyDenjuu1CurHP], a
	ld a, $8
	ld [wEnemyDenjuu1ArrivedStatus], a
	jr asm_1723b

Func_17227: ; 17227 (5:7227)
	xor a
	ld [wEnemyDenjuu2CurHP], a
	ld a, $8
	ld [wEnemyDenjuu2ArrivedStatus], a
	jr asm_1723b

Func_17232: ; 17232 (5:7232)
	xor a
	ld [wEnemyDenjuu3CurHP], a
	ld a, $8
	ld [wEnemyDenjuu3ArrivedStatus], a
asm_1723b
	ld c, $6
	call StdBattleTextBox
	ld a, $1b
	ld [wd401], a
	ret

Func_17246: ; 17246 (5:7246)
	ld a, [wCurEnemyDenjuu]
	cp $0
	jr z, .asm_17258
	cp $1
	jr z, .asm_17277
	cp $2
	jr z, .asm_17296
	jp Func_172d7

.asm_17258
	ld a, [wEnemyDenjuu1]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wEnemyDenjuu1Field0x12]
	cp $7
	jr z, .asm_1726b
	cp $4
	jr z, .asm_17271
	jr Func_172d7

.asm_1726b
	xor a
	ld [wEnemyDenjuu1Field0x12], a
	jr .asm_172b5

.asm_17271
	xor a
	ld [wEnemyDenjuu1Field0x12], a
	jr .asm_172c6

.asm_17277
	ld a, [wEnemyDenjuu2]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wEnemyDenjuu2Field0x12]
	cp $7
	jr z, .asm_1728a
	cp $4
	jr z, .asm_17290
	jr Func_172d7

.asm_1728a
	xor a
	ld [wEnemyDenjuu2Field0x12], a
	jr .asm_172b5

.asm_17290
	xor a
	ld [wEnemyDenjuu2Field0x12], a
	jr .asm_172c6

.asm_17296
	ld a, [wEnemyDenjuu3]
	ld [wCurDenjuuBufferAddressBookLocation], a
	ld a, [wEnemyDenjuu3Field0x12]
	cp $7
	jr z, .asm_172a9
	cp $4
	jr z, .asm_172af
	jr Func_172d7

.asm_172a9
	xor a
	ld [wEnemyDenjuu3Field0x12], a
	jr .asm_172b5

.asm_172af
	xor a
	ld [wEnemyDenjuu3Field0x12], a
	jr .asm_172c6

.asm_172b5
	ld a, [wCurDenjuuBufferAddressBookLocation]
	call Func_142cd
	ld c, $4b
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

.asm_172c6
	ld a, [wCurDenjuuBufferAddressBookLocation]
	call Func_142cd
	ld c, $48
	call StdBattleTextBox
	ld a, $24
	ld [wd401], a
	ret

Func_172d7: ; 172d7 (5:72d7)
	ld a, $f
	ld [wd401], a
	ret

Func_172dd: ; 172dd (5:72dd)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	jp BattleCore_IncrementD401

Func_172e9: ; 172e9 (5:72e9)
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdWindowLayout_
	lb bc, $0, $8
	ld e, $85
	ld a, $0
	call LoadStdWindowLayout_
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld c, $7
	call StdBattleTextBox
	ld a, SFX_57
	ld [H_SFX_ID], a
	ld a, [wNumAliveEnemyDenjuu]
	dec a
	cp $0
	jr z, .asm_1732c
	call Func_1655b
	ld a, [wCurEnemyDenjuu]
	ld [wd418], a
.asm_1732c
	ld a, [wNumAliveEnemyDenjuu]
	dec a
	ld [wNumAliveEnemyDenjuu], a
	ld a, [wEnemyPartySize]
	dec a
	ld [wEnemyPartySize], a
	ld a, [wd4e5]
	dec a
	ld [wd4e5], a
	ld a, $d
	ld [wd401], a
	ret

Func_17347: ; 17347 (5:7347)
	ld a, SFX_5A
	ld [H_SFX_ID], a
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdWindowLayout_
	lb bc, $0, $8
	ld e, $85
	ld a, $0
	call LoadStdWindowLayout_
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_1737a
	cp $2
	jr z, .asm_17381
	ld a, $0
	ld [wEnemyDenjuu1ArrivedStatus], a
	jr .asm_17386

.asm_1737a
	ld a, $0
	ld [wEnemyDenjuu2ArrivedStatus], a
	jr .asm_17386

.asm_17381
	ld a, $0
	ld [wEnemyDenjuu3ArrivedStatus], a
.asm_17386
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142cd
	ld c, $5
	call StdBattleTextBox
	ld a, [wNumAliveEnemyDenjuu]
	dec a
	cp $0
	jr z, .asm_173b7
	ld a, [wEnemyPartySize]
	ld b, a
	ld a, [wNumAliveEnemyDenjuu]
	cp b
	jr z, .asm_173ae
	call Func_1655b
	jr .asm_173b1

.asm_173ae
	call Func_1654b
.asm_173b1
	ld a, [wCurEnemyDenjuu]
	ld [wd418], a
.asm_173b7
	ld a, [wNumAliveEnemyDenjuu]
	dec a
	ld [wNumAliveEnemyDenjuu], a
	ld a, [wEnemyPartySize]
	dec a
	ld [wEnemyPartySize], a
	ld a, [wd4e5]
	dec a
	ld [wd4e5], a
	jp BattleCore_IncrementD401

FaintEnemyDenjuu: ; 173cf (5:73cf)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wNumAliveEnemyDenjuu]
	cp $0
	jr nz, .still_got_one_alive
	ld a, $1
	ld [wBattleEnded], a
	ld a, $1
	ld [wBattleResult], a
	xor a
	ld [wd401], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

.still_got_one_alive
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	call LoadEnemyDenjuuBattlePic
	lb bc, $0, $8
	ld e, $81
	ld a, $0
	call LoadStdWindowLayout_
	jp BattleCore_IncrementD401

Func_1740c: ; 1740c (5:740c)
	call UpdateEnemyHUD
	lb bc, $1, $1
	ld e, $91
	ld a, $0
	call LoadStdWindowLayout_
	ld a, $13
	ld [wd401], a
	ret

Func_1741f: ; 1741f (5:741f)
	ld a, [wCurMove]
	cp BLOODSUCK
	jp z, Func_1745b
	cp DRAIN
	jp z, Func_1745b
	cp POISON_STING
	jr z, asm_17466
	cp NUMBING_STING
	jr z, asm_17466
	cp FLAMETHROWER
	jr z, asm_17466
	cp MINI_FLAME
	jr z, asm_17466
	cp MEGA_FLAME
	jr z, asm_17466
	cp MINI_SNOW
	jr z, asm_17466
	cp BLIZZARD
	jr z, asm_17466
	cp MINI_BOLT
	jr z, asm_17466
	cp MEGA_BOLT
	jr z, asm_17466
	cp TOXIC_STING
	jr z, asm_17466
	cp ELECTRIC_STING
	jr z, asm_17466
	jp Func_17478

Func_1745b: ; 1745b (5:745b)
	ld a, $a
	ld [wd434], a
	ld a, $18
	ld [wd401], a
	ret

asm_17466
	ld a, [wLinkMode]
	cp $1
	jr z, Func_17478
	ld c, $72
	call StdBattleTextBox
	ld a, $20
	ld [wd401], a
	ret

Func_17478: ; 17478 (5:7478)
	ld a, $13
	ld [wd401], a
	ret

Func_1747e: ; 1747e (5:747e)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $5
	ld [wd434], a
	ld a, [wCurMove]
	cp POISON_GAS
	jr nz, .asm_174a6
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_174a0
	ld a, $11
	ld [wd401], a
	ret

.asm_174a0
	ld a, $10
	ld [wd401], a
	ret

.asm_174a6
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_174b3
	ld a, $10
	ld [wd401], a
	ret

.asm_174b3
	ld a, $11
	ld [wd401], a
	ret

Func_174b9: ; 174b9 (5:74b9)
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_174cd
	cp $2
	jr z, .asm_174d6
	ld a, [wPlayerDenjuu1CurHP]
	dec a
	ld [wPlayerDenjuu1CurHP], a
	jr .asm_174dd

.asm_174cd
	ld a, [wPlayerDenjuu2CurHP]
	dec a
	ld [wPlayerDenjuu2CurHP], a
	jr .asm_174dd

.asm_174d6
	ld a, [wPlayerDenjuu3CurHP]
	dec a
	ld [wPlayerDenjuu3CurHP], a
.asm_174dd
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call DrawPlayerDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_17516
	ld a, [wd434]
	cp $0
	ret nz
	ld a, [wCurMove]
	cp POISON_GAS
	jr nz, .asm_1750c
	ld a, $0
	ld [wCurMove], a
	ld a, $13
	ld [wd401], a
	ret

.asm_1750c
	xor a
	ld [wd401], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

.asm_17516
	ld a, $0
	ld [wCurMove], a
	ld a, $6
	ld [wd401], a
	ret

Func_17521: ; 17521 (5:7521)
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17535
	cp $2
	jr z, .asm_1753e
	ld a, [wEnemyDenjuu1CurHP]
	dec a
	ld [wEnemyDenjuu1CurHP], a
	jr .asm_17545

.asm_17535
	ld a, [wEnemyDenjuu2CurHP]
	dec a
	ld [wEnemyDenjuu2CurHP], a
	jr .asm_17545

.asm_1753e
	ld a, [wEnemyDenjuu3CurHP]
	dec a
	ld [wEnemyDenjuu3CurHP], a
.asm_17545
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	call DrawEnemyDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_1757e
	ld a, [wd434]
	cp $0
	ret nz
	ld a, [wCurMove]
	cp POISON_GAS
	jr nz, .asm_17574
	ld a, $0
	ld [wCurMove], a
	ld a, $13
	ld [wd401], a
	ret

.asm_17574
	xor a
	ld [wd401], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

.asm_1757e
	ld a, $0
	ld [wCurMove], a
	ld a, $c
	ld [wd401], a
	ret

Func_17589: ; 17589 (5:7589)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, [wCurMove]
	cp SPEED_UP
	jr c, .asm_175a4
	cp WATER_SHOT
	jr c, .asm_175a0
	cp QUICK_STEP
	jr c, .asm_175a4
.asm_175a0
	ld c, $2f
	jr .asm_175a6

.asm_175a4
	ld c, $1b
.asm_175a6
	call StdBattleTextBox
	ld a, SFX_5B
	ld [H_SFX_ID], a
	xor a
	ld [wCurMove], a
	ld a, $3c
	ld [wMoveAnimationTimer], a
	ld a, $1f
	ld [wd401], a
	ret

Func_175bd: ; 175bd (5:75bd)
	call BattlePrintText
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	ret nz
	ld a, $13
	ld [wd401], a
	ret

Func_175ce: ; 175ce (5:75ce)
	ld a, [wBattleEnded]
	cp $1
	jr z, .asm_17608
	ld a, [wCurMove]
	cp POISON_GAS
	jr z, .asm_175f8
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_175eb
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	jr .asm_175f1

.asm_175eb
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
.asm_175f1
	ld a, [wCurDenjuuBufferField0x12]
	cp $a
	jr nz, .asm_17608
.asm_175f8
	xor a
	ld [wd42d], a
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld a, $1e
	ld [wd401], a
	ret

.asm_17608
	xor a
	ld [wd401], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

Func_17612: ; 17612 (5:7612)
	lb bc, $1, $0
	ld e, $85
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $8
	ld e, $85
	ld a, $0
	call LoadStdWindowLayout_
	lb bc, $0, $c
	ld e, $80
	ld a, $0
	call LoadStdBGMapLayout_
	ld hl, VTilesBG tile $18
	ld a, $8
	call ClearString
	ld a, [wCurMove]
	cp SPEED_UP
	jr c, .asm_17649
	cp IRON_CLAW
	jr c, .asm_1764e
	cp QUICK_STEP
	jr c, .asm_17658
	jr .asm_1765f

.asm_17649
	ld [wd4fc], a
	jr .asm_17669

.asm_1764e
	sub SPEED_UP
	ld [wd4fc], a
	ld a, [wCurMove]
	jr .asm_17669

.asm_17658
	sub IRON_CLAW - 1
	ld [wd4fc], a
	jr .asm_17669

.asm_1765f
	sub QUICK_STEP
	ld [wd4fc], a
	ld a, [wCurMove]
	sub QUICK_STEP - SPEED_UP
.asm_17669
	call Func_053e
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, [wLinkMode]
	or a
	jr nz, .asm_1767d
	ld a, [wBattleAnimations]
	or a
	jr z, .asm_17683
.asm_1767d
	ld a, $16
	ld [wd401], a
	ret

.asm_17683
	ld a, $17
	ld [wd401], a
	ret

Func_17689: ; 17689 (5:7689)
	ld a, [wCurMove]
	cp POISON_GAS
	jr nz, .asm_17699
	ld a, [wBattleTurn]
	cp $0
	jr z, .asm_176a8
	jr .asm_176a0

.asm_17699
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_176a8
.asm_176a0
	call Func_14340
	cp $0
	ret nz
	jr .asm_176ae

.asm_176a8
	call Func_1438d
	cp $0
	ret nz
.asm_176ae
	ld c, $2e
	call StdBattleTextBox
	ld a, $22
	ld [wd401], a
	ret

Func_176b9: ; 176b9 (5:76b9)
	ld a, [wLinkMode]
	cp $0
	jp z, Func_17705
	ld a, [wd458]
	cp $1
	jp z, Func_17705
	call Func_3eee
	cp $0
	ret z
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_176df
	sub QUICK_STEP - SPEED_UP
.asm_176df
	cp FLIGHT
	jp z, Func_17785
	cp SCREAM
	jp z, Func_17785
	cp EM_BARRIER
	jp z, Func_17785
	cp LICK
	jp z, Func_17785
	cp CAMOUFLAGE
	jr c, .asm_176fc
	cp WATER_SHOT
	jp c, Func_17785
.asm_176fc
	ld a, [hl]
	cp $f0
	jp z, Func_1798f
	jp Func_17785

Func_17705: ; 17705 (5:7705)
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_1770e
	sub QUICK_STEP - SPEED_UP
.asm_1770e
	cp FLIGHT
	jp z, Func_17785
	cp SCREAM
	jp z, Func_17785
	cp EM_BARRIER
	jp z, Func_17785
	cp LICK
	jr z, Func_17785
	cp CAMOUFLAGE
	jr c, .asm_17729
	cp WATER_SHOT
	jr c, Func_17785
.asm_17729
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_1775b
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	push bc
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpAtk]
	pop bc
	cp b
	jr c, .asm_17751
	call Random
	cp $c0
	jr c, Func_17785
	jp Func_1798f

.asm_17751
	call Random
	cp $40
	jr c, Func_17785
	jp Func_1798f

.asm_1775b
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpDef]
	ld b, a
	push bc
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpAtk]
	pop bc
	cp b
	jr c, .asm_1777d
	call Random
	cp $c0
	jr c, Func_17785
	jp Func_1798f

.asm_1777d
	call Random
	cp $40
	jp nc, Func_1798f
Func_17785: ; 17785 (5:7785)
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_1778e
	sub QUICK_STEP - SPEED_UP
.asm_1778e
	cp CAMOUFLAGE
	jp z, Func_1781b
	cp ULTRASONIC
	jp z, Func_17826
	cp EM_WAVE
	jp z, Func_17831
	cp CURSE_SONG
	jp z, Func_1783c
	cp LULLABY
	jp z, Func_17847
	cp GLARE
	jp z, Func_17852
	cp SLEEP_GAS
	jp z, Func_1785d
	cp SMOKESCREEN
	jp z, Func_17868
	cp POISON_GAS
	jp z, Func_17873
	cp JUMP
	jp z, Func_1787e
	cp FLIGHT
	jp z, Func_17889
	cp SCREAM
	jp z, Func_17894
	cp WINGBEAT
	jp z, Func_1789f
	cp EM_BARRIER
	jp z, Func_178aa
	cp FORCE_FIELD
	jp z, Func_178b5
	cp CHILL
	jp z, Func_178c0
	cp HEAT_WAVE
	jp z, Func_178cb
	cp LICK
	jp z, Func_17852
	cp POISON_STING
	jp z, Func_17873
	cp NUMBING_STING
	jp z, Func_17831
	cp FLAMETHROWER
	jp z, Func_178cb
	cp MINI_FLAME
	jp z, Func_178cb
	cp MEGA_FLAME
	jp z, Func_178cb
	cp MINI_SNOW
	jp z, Func_178c0
	cp BLIZZARD
	jp z, Func_178c0
	cp MINI_BOLT
	jr z, Func_17831
	cp MEGA_BOLT
	jr z, Func_17831
	cp TOXIC_STING
	jr z, Func_17873
	cp ELECTRIC_STING
	jr z, Func_17831
Func_1781b: ; 1781b (5:781b)
	call Func_179a2
	ld a, $1
	call Func_17a0c
	jp Func_178d3

Func_17826: ; 17826 (5:7826)
	call Func_179d7
	ld a, $4
	call Func_17a4c
	jp Func_178d3

Func_17831: ; 17831 (5:7831)
	call Func_179d7
	ld a, $5
	call Func_17a4c
	jp Func_178d3

Func_1783c: ; 1783c (5:783c)
	call Func_179d7
	ld a, $6
	call Func_17a4c
	jp Func_178d3

Func_17847: ; 17847 (5:7847)
	call Func_179d7
	ld a, $7
	call Func_17a4c
	jp Func_178d3

Func_17852: ; 17852 (5:7852)
	call Func_179d7
	ld a, $8
	call Func_17a4c
	jp Func_178d3

Func_1785d: ; 1785d (5:785d)
	call Func_179d7
	ld a, $7
	call Func_17a4c
	jp Func_178d3

Func_17868: ; 17868 (5:7868)
	call Func_179d7
	ld a, $9
	call Func_17a4c
	jp Func_178d3

Func_17873: ; 17873 (5:7873)
	call Func_179d7
	ld a, $a
	call Func_17a4c
	jp Func_178d3

Func_1787e: ; 1787e (5:787e)
	call Func_179a2
	ld a, $2
	call Func_17a0c
	jp Func_178d3

Func_17889: ; 17889 (5:7889)
	call Func_179a2
	ld a, $3
	call Func_17a0c
	jp Func_178d3

Func_17894: ; 17894 (5:7894)
	call Func_179d7
	ld a, $8
	call Func_17a4c
	jp Func_178d3

Func_1789f: ; 1789f (5:789f)
	call Func_179d7
	ld a, $b
	call Func_17a4c
	jp Func_178d3

Func_178aa: ; 178aa (5:78aa)
	call Func_179a2
	call Func_17a8c
	ld a, $c
	jp Func_178d3

Func_178b5: ; 178b5 (5:78b5)
	call Func_179d7
	ld a, $d
	call Func_17a4c
	jp Func_178d3

Func_178c0: ; 178c0 (5:78c0)
	call Func_179d7
	ld a, $e
	call Func_17a4c
	jp Func_178d3

Func_178cb: ; 178cb (5:78cb)
	call Func_179d7
	ld a, $f
	call Func_17a4c
Func_178d3: ; 178d3 (5:78d3)
	push af
	call Func_1643a
	call Func_16461
	pop af
	call Func_148a8
	call StdBattleTextBox
	ld a, [wBattleTurn]
	and a
	jr z, asm_17933
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jp z, Func_1797c
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jp z, Func_17911
	cp $5
	jp z, Func_17911
	cp $7
	jp z, Func_17911
	cp $8
	jp z, Func_17911
	cp $b
	jp nz, Func_1797c
Func_17911: ; 17911 (5:7911)
	ld a, [wCurBattleDenjuu]
	cp $0
	jr z, .asm_1791e
	cp $1
	jr z, .asm_17925
	jr .asm_1792c

.asm_1791e
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr Func_1797c

.asm_17925
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr Func_1797c

.asm_1792c
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	jr Func_1797c

asm_17933
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, Func_1797c
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jp z, Func_1795c
	cp $5
	jp z, Func_1795c
	cp $7
	jp z, Func_1795c
	cp $8
	jp z, Func_1795c
	cp $b
	jp nz, Func_1797c
Func_1795c: ; 1795c (5:795c)
	ld a, [wCurEnemyDenjuu]
	cp $0
	jr z, .asm_17969
	cp $1
	jr z, .asm_17970
	jr .asm_17977

.asm_17969
	ld a, $3
	ld [wEnemyDenjuu1ArrivedStatus], a
	jr Func_1797c

.asm_17970
	ld a, $3
	ld [wEnemyDenjuu2ArrivedStatus], a
	jr Func_1797c

.asm_17977
	ld a, $3
	ld [wEnemyDenjuu3ArrivedStatus], a
Func_1797c: ; 1797c (5:797c)
	ld a, [wd458]
	cp $0
	jp z, Func_17989
	ld a, $1
	ld [wSerialSend], a
Func_17989: ; 17989 (5:7989)
	ld a, $25
	ld [wd401], a
	ret

Func_1798f: ; 1798f (5:798f)
	ld a, [wd458]
	cp $0
	jp z, Func_1799c
	ld a, $f4
	ld [wSerialSend], a
Func_1799c: ; 1799c (5:799c)
	ld a, $13
	ld [wd401], a
	ret

Func_179a2: ; 179a2 (5:79a2)
	call OpenSRAMBank2
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_179c7
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	jr .asm_179d3

.asm_179c7
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142cd
.asm_179d3
	call CloseSRAM
	ret

Func_179d7: ; 179d7 (5:79d7)
	call OpenSRAMBank2
	ld a, [wBattleTurn]
	and a
	jr z, .asm_179fc
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	jr .asm_17a08

.asm_179fc
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
.asm_17a08
	call CloseSRAM
	ret

Func_17a0c: ; 17a0c (5:7a0c)
	push af
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_17a2f
	ld a, [wCurBattleDenjuu]
	cp $0
	jr z, .asm_17a20
	cp $1
	jr z, .asm_17a25
	jr .asm_17a2a

.asm_17a20
	ld hl, wPlayerDenjuu1Field0x12
	jr .asm_17a49

.asm_17a25
	ld hl, wPlayerDenjuu2Field0x12
	jr .asm_17a49

.asm_17a2a
	ld hl, wPlayerDenjuu3Field0x12
	jr .asm_17a49

.asm_17a2f
	ld a, [wCurEnemyDenjuu]
	cp $0
	jr z, .asm_17a3c
	cp $1
	jr z, .asm_17a41
	jr .asm_17a46

.asm_17a3c
	ld hl, wEnemyDenjuu1Field0x12
	jr .asm_17a49

.asm_17a41
	ld hl, wEnemyDenjuu2Field0x12
	jr .asm_17a49

.asm_17a46
	ld hl, wEnemyDenjuu3Field0x12
.asm_17a49
	pop af
	ld [hl], a
	ret

Func_17a4c: ; 17a4c (5:7a4c)
	push af
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_17a6f
	ld a, [wCurEnemyDenjuu]
	cp $0
	jr z, .asm_17a60
	cp $1
	jr z, .asm_17a65
	jr .asm_17a6a

.asm_17a60
	ld hl, wEnemyDenjuu1Field0x12
	jr .asm_17a89

.asm_17a65
	ld hl, wEnemyDenjuu2Field0x12
	jr .asm_17a89

.asm_17a6a
	ld hl, wEnemyDenjuu3Field0x12
	jr .asm_17a89

.asm_17a6f
	ld a, [wCurBattleDenjuu]
	cp $0
	jr z, .asm_17a7c
	cp $1
	jr z, .asm_17a81
	jr .asm_17a86

.asm_17a7c
	ld hl, wPlayerDenjuu1Field0x12
	jr .asm_17a89

.asm_17a81
	ld hl, wPlayerDenjuu2Field0x12
	jr .asm_17a89

.asm_17a86
	ld hl, wPlayerDenjuu3Field0x12
.asm_17a89
	pop af
	ld [hl], a
	ret

Func_17a8c: ; 17a8c (5:7a8c)
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_17a9f
	ld hl, wd5c0
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	add hl, de
	ld [hl], $1
	ret

.asm_17a9f
	ld hl, wd5c3
	ld d, $0
	ld a, [wCurEnemyDenjuu]
	ld e, a
	add hl, de
	ld [hl], $1
	ret

Func_17aac: ; 17aac (5:7aac)
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_17abf
	ld hl, wd5c3
	ld d, $0
	ld a, [wCurEnemyDenjuu]
	ld e, a
	add hl, de
	ld [hl], $0
	ret

.asm_17abf
	ld hl, wd5c0
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	add hl, de
	ld [hl], $0
	ret

Func_17acc: ; 17acc (5:7acc)
	ld a, [wBattleTurn]
	and a
	jr nz, .asm_17ade
	ld hl, wd5c3
	ld d, $0
	ld a, [wCurEnemyDenjuu]
	ld e, a
	add hl, de
	jr .asm_17ae8

.asm_17ade
	ld hl, wd5c0
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	add hl, de
.asm_17ae8
	ld a, [hl]
	ret

Func_17aea: ; 17aea (5:7aea)
	call OpenSRAMBank2
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_17b10
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	jr .asm_17b1c

.asm_17b10
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142cd
.asm_17b1c
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_17b2b
	sub QUICK_STEP - SPEED_UP
.asm_17b2b
	cp SPEED_UP
	jp z, Func_17b49
	cp FOCUS
	jp z, Func_17ba6
	cp AVOID
	jp z, Func_17c1b
	cp INVIGORATE
	jp z, Func_17c90
	cp CHARGE_UP
	jp z, Func_17ced
	cp SHIELD
	jp nc, Func_17d73
Func_17b49: ; 17b49 (5:7b49)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17b7a
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17b68
	cp $2
	jr z, .asm_17b71
	ld a, [wPlayerDenjuu1Speed]
	add b
	ld [wPlayerDenjuu1Speed], a
	jr .asm_17b9e

.asm_17b68
	ld a, [wPlayerDenjuu2Speed]
	add b
	ld [wPlayerDenjuu2Speed], a
	jr .asm_17b9e

.asm_17b71
	ld a, [wPlayerDenjuu3Speed]
	add b
	ld [wPlayerDenjuu3Speed], a
	jr .asm_17b9e

.asm_17b7a
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17b8e
	cp $2
	jr z, .asm_17b97
	ld a, [wEnemyDenjuu1Speed]
	add b
	ld [wEnemyDenjuu1Speed], a
	jr .asm_17b9e

.asm_17b8e
	ld a, [wEnemyDenjuu2Speed]
	add b
	ld [wEnemyDenjuu2Speed], a
	jr .asm_17b9e

.asm_17b97
	ld a, [wEnemyDenjuu3Speed]
	add b
	ld [wEnemyDenjuu3Speed], a
.asm_17b9e
	ld c, $27
	call StdBattleTextBox
	jp Func_17dcd

Func_17ba6: ; 17ba6 (5:7ba6)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17be3
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17bc9
	cp $2
	jr z, .asm_17bd6
	ld a, [wPlayerDenjuu1SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wPlayerDenjuu1SpeedCopy1], a
	jr .asm_17c13

.asm_17bc9
	ld a, [wPlayerDenjuu2SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wPlayerDenjuu2SpeedCopy1], a
	jr .asm_17c13

.asm_17bd6
	ld a, [wPlayerDenjuu3SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wPlayerDenjuu3SpeedCopy1], a
	jr .asm_17c13

.asm_17be3
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17bfb
	cp $2
	jr z, .asm_17c08
	ld a, [wEnemyDenjuu1SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wEnemyDenjuu1SpeedCopy1], a
	jr .asm_17c13

.asm_17bfb
	ld a, [wEnemyDenjuu2SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wEnemyDenjuu2SpeedCopy1], a
	jr .asm_17c13

.asm_17c08
	ld a, [wEnemyDenjuu3SpeedCopy1]
	add b
	cp $64
	jr nc, .asm_17c13
	ld [wEnemyDenjuu3SpeedCopy1], a
.asm_17c13
	ld c, $28
	call StdBattleTextBox
	jp Func_17dcd

Func_17c1b: ; 17c1b (5:7c1b)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17c58
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17c3e
	cp $2
	jr z, .asm_17c4b
	ld a, [wPlayerDenjuu1SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wPlayerDenjuu1SpeedCopy2], a
	jr .asm_17c88

.asm_17c3e
	ld a, [wPlayerDenjuu2SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wPlayerDenjuu2SpeedCopy2], a
	jr .asm_17c88

.asm_17c4b
	ld a, [wPlayerDenjuu3SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wPlayerDenjuu3SpeedCopy2], a
	jr .asm_17c88

.asm_17c58
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17c70
	cp $2
	jr z, .asm_17c7d
	ld a, [wEnemyDenjuu1SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wEnemyDenjuu1SpeedCopy2], a
	jr .asm_17c88

.asm_17c70
	ld a, [wEnemyDenjuu2SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wEnemyDenjuu2SpeedCopy2], a
	jr .asm_17c88

.asm_17c7d
	ld a, [wEnemyDenjuu3SpeedCopy2]
	add b
	cp $64
	jr nc, .asm_17c88
	ld [wEnemyDenjuu3SpeedCopy2], a
.asm_17c88
	ld c, $29
	call StdBattleTextBox
	jp Func_17dcd

Func_17c90: ; 17c90 (5:7c90)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17cc1
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17caf
	cp $2
	jr z, .asm_17cb8
	ld a, [wPlayerDenjuu1Attack]
	add b
	ld [wPlayerDenjuu1Attack], a
	jr .asm_17ce5

.asm_17caf
	ld a, [wPlayerDenjuu2Attack]
	add b
	ld [wPlayerDenjuu2Attack], a
	jr .asm_17ce5

.asm_17cb8
	ld a, [wPlayerDenjuu3Attack]
	add b
	ld [wPlayerDenjuu3Attack], a
	jr .asm_17ce5

.asm_17cc1
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17cd5
	cp $2
	jr z, .asm_17cde
	ld a, [wEnemyDenjuu1Attack]
	add b
	ld [wEnemyDenjuu1Attack], a
	jr .asm_17ce5

.asm_17cd5
	ld a, [wEnemyDenjuu2Attack]
	add b
	ld [wEnemyDenjuu2Attack], a
	jr .asm_17ce5

.asm_17cde
	ld a, [wEnemyDenjuu3Attack]
	add b
	ld [wEnemyDenjuu3Attack], a
.asm_17ce5
	ld c, $2a
	call StdBattleTextBox
	jp Func_17dcd

Func_17ced: ; 17ced (5:7ced)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17d33
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17d13
	cp $2
	jr z, .asm_17d23
	ld a, [wPlayerDenjuu1SpAtk]
	add b
	ld [wPlayerDenjuu1SpAtk], a
	ld a, [wPlayerDenjuu1SpDef]
	add b
	ld [wPlayerDenjuu1SpDef], a
	jr .asm_17d6c

.asm_17d13
	ld a, [wPlayerDenjuu2SpAtk]
	add b
	ld [wPlayerDenjuu2SpAtk], a
	ld a, [wPlayerDenjuu2SpDef]
	add b
	ld [wPlayerDenjuu2SpDef], a
	jr .asm_17d6c

.asm_17d23
	ld a, [wPlayerDenjuu3SpAtk]
	add b
	ld [wPlayerDenjuu3SpAtk], a
	ld a, [wPlayerDenjuu3SpDef]
	add b
	ld [wPlayerDenjuu3SpDef], a
	jr .asm_17d6c

.asm_17d33
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17d4e
	cp $2
	jr z, .asm_17d5e
	ld a, [wEnemyDenjuu1SpAtk]
	add b
	ld [wEnemyDenjuu1SpAtk], a
	ld a, [wEnemyDenjuu1SpDef]
	add b
	ld [wEnemyDenjuu1SpDef], a
	jr .asm_17d6c

.asm_17d4e
	ld a, [wEnemyDenjuu2SpAtk]
	add b
	ld [wEnemyDenjuu2SpAtk], a
	ld a, [wEnemyDenjuu2SpDef]
	add b
	ld [wEnemyDenjuu2SpDef], a
	jr .asm_17d6c

.asm_17d5e
	ld a, [wEnemyDenjuu3SpAtk]
	add b
	ld [wEnemyDenjuu3SpAtk], a
	ld a, [wEnemyDenjuu3SpDef]
	add b
	ld [wEnemyDenjuu3SpDef], a
.asm_17d6c
	ld c, $2b
	call StdBattleTextBox
	jr Func_17dcd

Func_17d73: ; 17d73 (5:7d73)
	ld a, [wd495]
	ld b, a
	ld a, [wBattleTurn]
	cp $0
	jr nz, .asm_17da4
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17d92
	cp $2
	jr z, .asm_17d9b
	ld a, [wPlayerDenjuu1Defense]
	add b
	ld [wPlayerDenjuu1Defense], a
	jr .asm_17dc8

.asm_17d92
	ld a, [wPlayerDenjuu2Defense]
	add b
	ld [wPlayerDenjuu2Defense], a
	jr .asm_17dc8

.asm_17d9b
	ld a, [wPlayerDenjuu3Defense]
	add b
	ld [wPlayerDenjuu3Defense], a
	jr .asm_17dc8

.asm_17da4
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17db8
	cp $2
	jr z, .asm_17dc1
	ld a, [wEnemyDenjuu1Defense]
	add b
	ld [wEnemyDenjuu1Defense], a
	jr .asm_17dc8

.asm_17db8
	ld a, [wEnemyDenjuu2Defense]
	add b
	ld [wEnemyDenjuu2Defense], a
	jr .asm_17dc8

.asm_17dc1
	ld a, [wEnemyDenjuu3Defense]
	add b
	ld [wEnemyDenjuu3Defense], a
.asm_17dc8
	ld c, $2c
	call StdBattleTextBox
Func_17dcd: ; 17dcd (5:7dcd)
	call CloseSRAM
	ld a, $1d
	ld [wd401], a
	ret

Func_17dd6: ; 17dd6 (5:7dd6)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $f
	ld [wd401], a
	ret

Func_17de5: ; 17de5 (5:7de5)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $13
	ld [wd401], a
	ret

Func_17df4: ; 17df4 (5:7df4)
	ld a, [wCurMove]
	cp SPEED_UP
	jp c, PlayMoveAnimation_grp1_
	cp IRON_CLAW
	jp c, PlayMoveAnimation_grp2_
	cp QUICK_STEP
	jp c, PlayMoveAnimation_grp1_
	jp PlayMoveAnimation_grp2_

Func_17e09: ; 17e09 (5:7e09)
	ld bc, $1
	call DecompressGFXByIndex_
	lb bc, $1, $0
	ld e, $86
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $8
	ld e, $81
	ld a, $0
	call LoadStdWindowLayout_
	call UpdatePlayerHUD
	call UpdateEnemyHUD
	call Func_1643a
	call Func_16461
	xor a
	ld [wMoveAnimationTimer], a
	ld [wd45b], a
	ld a, [wCurMove]
	cp SPEED_UP
	jp c, Func_17ea0
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_17e47
	sub QUICK_STEP - SPEED_UP
.asm_17e47
	cp SPEED_UP
	jr c, .asm_17e5d
	cp HEAL
	jr c, .asm_17e57
	cp SHIELD
	jr c, .asm_17e5d
	cp CAMOUFLAGE
	jr nc, .asm_17e5d
.asm_17e57
	ld a, $15
	ld [wd401], a
	ret

.asm_17e5d
	ld a, [wCurMove]
	cp QUICK_STEP
	jr c, .asm_17e66
	sub QUICK_STEP - SPEED_UP
.asm_17e66
	cp HEAL
	jr c, .asm_17e80
	cp SHIELD
	jr nc, .asm_17e80
	ld a, [wCurMove]
	call Func_05f7
	ld a, [wd495]
	ld [wd434], a
	ld a, $18
	ld [wd401], a
	ret

.asm_17e80
	ld a, [wCurMove]
	cp LICK
	jr z, .asm_17e95
	cp QUICK_STEP
	jr c, .asm_17e8d
	sub QUICK_STEP - SPEED_UP
.asm_17e8d
	cp CAMOUFLAGE
	jr c, Func_17ea0
	cp WATER_SHOT
	jr nc, Func_17ea0
.asm_17e95
	ld c, $72
	call StdBattleTextBox
	ld a, $20
	ld [wd401], a
	ret

Func_17ea0: ; 17ea0 (5:7ea0)
	ld a, $a
	ld [wMoveAnimationTimer], a
	ld a, $0
	ld [wd42d], a
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_17eca
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jr nz, .asm_17ef0
	call Func_17acc
	cp $1
	jr nz, .asm_17ef0
	call Func_170e4
	jr .asm_17ee2

.asm_17eca
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $5
	jp nz, .asm_17ef0
	call Func_17acc
	cp $1
	jr nz, .asm_17ef0
	call Func_16bd3
.asm_17ee2
	call Func_17aac
	ld c, $22
	call StdBattleTextBox
	ld a, $25
	ld [wd401], a
	ret

.asm_17ef0
	ld a, $23
	ld [wd401], a
	ret

Func_17ef6: ; 17ef6 (5:7ef6)
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	cp $0
	ret nz
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_17f0d
	ld a, $9
	ld [wd401], a
	ret

.asm_17f0d
	ld a, $3
	ld [wd401], a
	ret

Func_17f13: ; 17f13 (5:7f13)
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_17f7d
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .asm_17f3c
	cp $2
	jr z, .asm_17f53
	ld a, [wPlayerDenjuu1Species]
	ld [wCurDenjuuBufferSpecies], a
	ld a, [wPlayerDenjuu1MaxHP]
	ld b, a
	ld a, [wPlayerDenjuu1CurHP]
	cp b
	jp z, Func_17fdd
	inc a
	ld [wPlayerDenjuu1CurHP], a
	jr .asm_17f68

.asm_17f3c
	ld a, [wPlayerDenjuu2]
	ld [wCurDenjuuBufferSpecies], a
	ld a, [wPlayerDenjuu2MaxHP]
	ld b, a
	ld a, [wPlayerDenjuu2CurHP]
	cp b
	jp z, Func_17fdd
	inc a
	ld [wPlayerDenjuu2CurHP], a
	jr .asm_17f68

.asm_17f53
	ld a, [wPlayerDenjuu3Species]
	ld [wCurDenjuuBuffer], a
	ld a, [wPlayerDenjuu3MaxHP]
	ld b, a
	ld a, [wPlayerDenjuu3CurHP]
	cp b
	jp z, Func_17fdd
	inc a
	ld [wPlayerDenjuu3CurHP], a
.asm_17f68
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call DrawPlayerDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	cp $0
	jr z, Func_17fdd
	ret

.asm_17f7d
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .asm_17f9e
	cp $2
	jr z, .asm_17fb4
	ld a, [wEnemyDenjuu1]
	ld [wCurDenjuuBufferSpecies], a
	ld a, [wEnemyDenjuu1MaxHP]
	ld b, a
	ld a, [wEnemyDenjuu1CurHP]
	cp b
	jr z, Func_17fdd
	inc a
	ld [wEnemyDenjuu1CurHP], a
	jr .asm_17fc8

.asm_17f9e
	ld a, [wEnemyDenjuu2Species]
	ld [wCurDenjuuBuffer], a
	ld a, [wEnemyDenjuu2MaxHP]
	ld b, a
	ld a, [wEnemyDenjuu2CurHP]
	cp b
	jr z, Func_17fdd
	inc a
	ld [wEnemyDenjuu2CurHP], a
	jr .asm_17fc8

.asm_17fb4
	ld a, [wEnemyDenjuu3]
	ld [wCurDenjuuBuffer], a
	ld a, [wEnemyDenjuu3MaxHP]
	ld b, a
	ld a, [wEnemyDenjuu3CurHP]
	cp b
	jr z, Func_17fdd
	inc a
	ld [wEnemyDenjuu3CurHP], a
.asm_17fc8
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	call DrawEnemyDenjuuHPBar
	ld a, [wd434]
	dec a
	ld [wd434], a
	cp $0
	jr z, Func_17fdd
	ret

Func_17fdd: ; 17fdd (5:7fdd)
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_17fed
	call CopyPlayerDenjuuNameToBattleUserName
.asm_17fed
	ld c, $2d
	call StdBattleTextBox
	ld a, $25
	ld [wd401], a
	ret
