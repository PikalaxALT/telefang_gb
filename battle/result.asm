BattleResult:
	ld a, [wSubroutine]
	jump_table
	dw .BattleResult
	dw .FinishBattleResult

.BattleResult: ; 7400e (1d:400e)
	jp BattleResult__

.FinishBattleResult: ; 74011 (1d:4011)
	xor a
	ld [MBC3SRamEnable], a
	ld a, $0
	ld [wc46c], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wWX], a
	ld a, $a5
	ld [wWX], a
	ld a, [wLCDC]
	res 5, a
	ld [wLCDC], a
	ld a, [wLCDC]
	res 6, a
	ld [wLCDC], a
	ld a, $0
	ld [wc46c], a
	ld a, [wPlayerDenjuu1CurHP]
	ld [wPartnerDenjuuHPRemaining], a
	ld a, $a
	ld [wSubroutine], a
	ld a, $5
	ld [wGameRoutine], a
	ret

CopyNthDenjuuToBuffer: ; 7404f (1d:404f)
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

CopyDenjuuSpeciesNameToUserNameBuffer:
	ld [wNamedObjectIndexBuffer], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call FixTerminatorCharacter
	call CopyToBattleUserName
	ret

FixTerminatorCharacter: ; 74079 (1d:4079)
	ld hl, wd420
	ld a, $8
	ld [wMoveAnimationTimer], a
.loop
	ld a, [bc]
	cp $c0
	jr z, .done
	ld [hl], a
	inc hl
	inc bc
	ld a, [wMoveAnimationTimer]
	dec a
	ld [wMoveAnimationTimer], a
	jr nz, .loop
.done
	ld a, "$"
	ld [hl], a
	ld hl, wd420
	ret

CopyToBattleUserName: ; 74099 (1d:4099)
	ld de, wBattleUserName
	ld b, $9
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy
	ret

CheckLearnedMove: ; 740a5 (1d:40a5)
	xor a
	ld [wLearnedMove], a
	push hl
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	jr nz, .asm_740cc
	ld b, $0
	dec hl
	ld a, [hl]
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wLearnedMove], a
	jr .asm_740ed

.asm_740cc
	push hl
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop hl
	ld a, [hl]
	cp b
	jr nz, .asm_740ed
	ld b, $0
	dec hl
	ld a, [hl]
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld [wLearnedMove], a
.asm_740ed
	ret

BattleResult__: ; 740ee (1d:40ee)
	ld a, [wBattleSubroutine]
	jump_table
	dw .HandleBattleResult ; 0
	dw .CheckBattleResult ; 1
	; WON
	dw .CheckAnyDenjuuEvolved ; 2
	dw .EvolveDenjuu ; 3
	dw CheckDenjuuWantsToJoinTeam ; 4
	dw DenjuuWantsToJoinTeam ; 5
	dw Func_741e7 ; 6
	dw Func_74216 ; 7
	dw Func_74219 ; 8
	dw Func_74220 ; 9
	dw ReturnToGameOverScreen ; a

.HandleBattleResult: ; 7410e (1d:410e)
	jp HandleBattleResult

.CheckBattleResult: ; 74111 (1d:4111)
	ld a, [wBattleResult]
	or a
	jr z, .lost_battle
	jp NextBattleSubroutine

.lost_battle
	ld a, $6
	ld [wBattleSubroutine], a
	ret

.CheckAnyDenjuuEvolved: ; 74120 (1d:4120)
	xor a
	ld [wd401], a
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $b
	jr z, .no_denjuu_evolved
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $b
	jr z, .no_denjuu_evolved
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $b
	jr z, .no_denjuu_evolved
	ld a, $4
	ld [wBattleSubroutine], a
	ret

.no_denjuu_evolved
	jp NextBattleSubroutine

.EvolveDenjuu: ; 74142 (1d:4142)
	jp EvolveDenjuu

CheckDenjuuWantsToJoinTeam: ; 74145 (1d:4145)
	xor a
	ld [wd401], a
	ld a, [wBattleMode]
	cp $2
	jp z, .skip_recruiting_denjuu
	ld a, [wcd00]
	or a
	jp nz, .skip_recruiting_denjuu
	ld a, [wCurEnemyDenjuu]
	cp $1
	jr z, .denjuu_2
	cp $2
	jr z, .denjuu_3
	ld a, [wEnemyDenjuu1ArrivedStatus]
	cp $8
	jp z, .skip_recruiting_denjuu
	ld a, [wEnemyDenjuu1Species]
	ld b, a
	ld a, [wEnemyDenjuu1Level]
	ld c, a
	ld a, [wEnemyDenjuu1Field0x0c]
	ld d, a
	jr .check_wants_to_join

.denjuu_2
	ld a, [wEnemyDenjuu2ArrivedStatus]
	cp $8
	jr z, .skip_recruiting_denjuu
	ld a, [wEnemyDenjuu2]
	ld b, a
	ld a, [wEnemyDenjuu2Level]
	ld c, a
	ld a, [wEnemyDenjuu2Field0x0c]
	ld d, a
	jr .check_wants_to_join

.denjuu_3
	ld a, [wEnemyDenjuu3ArrivedStatus]
	cp $8
	jr z, .skip_recruiting_denjuu
	ld a, [wEnemyDenjuu3Species]
	ld b, a
	ld a, [wEnemyDenjuu3Level]
	ld c, a
	ld a, [wEnemyDenjuu3Field0x0c]
	ld d, a
.check_wants_to_join
	ld a, b
	ld [wRecruitedDenjuuSpecies], a
	ld a, c
	ld [wRecruitedDenjuuLevel], a
	ld a, 20
	ld [wRecruitedDenjuuInitialFD], a
	ld a, d
	ld [wRecruitedDenjuuField0x03], a
	ld a, $0
	or a
	jp nz, NextBattleSubroutine
	ld a, [wBattleMode]
	or a
	jp nz, NextBattleSubroutine
	ld a, [wNumDenjuuInAddressBook]
	cp ADDRESS_BOOK_SIZE
	jr nc, .skip_recruiting_denjuu
	call CheckIfDenjuuSpeciesInAddressBook
	or a
	jr z, .high_chance
	call Random
	cp $10 ; 6.25%
	jp c, NextBattleSubroutine
	jr .skip_recruiting_denjuu

.high_chance
	call Random
	cp $99 ; 60%
	jp c, NextBattleSubroutine
.skip_recruiting_denjuu: ; 741de (1d:41de)
	ld a, $8
	ld [wBattleSubroutine], a
	ret

DenjuuWantsToJoinTeam: ; 741e4 (1d:41e4)
	jp DenjuuWantsToJoinTeam_

Func_741e7: ; 741e7 (1d:41e7)
	xor a
	ld [wd401], a
	ld bc, EVENT_1F1
	call CheckEventFlag
	jr nz, .asm_74210
	ld a, [wcd00]
	or a
	jr nz, .asm_7420a
	ld a, [wBattleMode]
	cp $1
	jr z, .asm_7420a
	ld a, [wBattleMode]
	cp $2
	jr z, .asm_7420a
	jp NextBattleSubroutine

.asm_7420a
	ld a, $a
	ld [wBattleSubroutine], a
	ret

.asm_74210
	ld a, $8
	ld [wBattleSubroutine], a
	ret

Func_74216: ; 74216 (1d:4216)
	jp Func_757c3

Func_74219: ; 74219 (1d:4219)
	xor a
	ld [wBattleSubroutine], a
	jp IncrementSubroutine

Func_74220: ; 74220 (1d:4220)
	xor a
	ld [wd401], a
	ld a, [wNumDenjuuInAddressBook]
	or a
	jr z, .asm_74230
	ld a, $8
	ld [wBattleSubroutine], a
	ret

.asm_74230
	jp NextBattleSubroutine

ReturnToGameOverScreen: ; 74233 (1d:4233)
	xor a
	ld [wBattleSubroutine], a
	ld [wSubroutine], a
	ld [wSubroutine2], a
	ld a, $e
	ld [wGameRoutine], a
	ret

HandleBattleResult: ; 74243 (1d:4243)
	ld a, [wd401]
	jump_table
	dw BattleResults_CheckBattleResult ; 00
	; WON
	dw PlayVictoryMusic_LoadWinObject_PrintVictoryMessage ; 01
	dw PrintWonBattleMessageAndCalculateExperienceYield ; 02
	dw WaitWonExperienceText ; 03
	dw PrintLevelUpText ; 04
	dw WaitLevelUpText ; 05

	; LOST
	dw PlayDefeatedMusic_LoadLostObject_PrintDefeatedMessage ; 06
	dw PrintLostBattleMessageAndPenalizePlayer ; 07
	dw LostBattle_StartFadeOut ; 08
	dw LostBattle_WaitFadeOut ; 09
	dw LostBattle_Finish ; 0a

	; MISC
	dw BattleResults_AwardExperiencePoints ; 0b
	dw ShowStatChangesAfterLevelUp ; 0c
	dw PrepareLevelUpScreenLayout ; 0d
	dw ResetBattleResultsLayoutForNextLevelUp ; 0e
	dw BattleResults_CheckLearnedMove ; 0f
	dw WaitLearnedMoveText ; 10
	dw BattleResults_EarnMoneyFromVictory ; 11
	dw BattleResults_WaitPayoutText ; 12
	dw CheckDenjuuEvolved ; 13
	dw HandleDenjuuEvolution ; 14
	dw AskEvolveDenjuu ; 15
	dw WaitDenjuuDidNotEvolveText ; 16
	dw HandleBattleResult_SaveExperienceGained ; 17

String_7427d:
	db "すばやさ"
String_74281:
	db "こうげき"
String_74285:
	db "ぼうぎょ"
String_74289:
	db "でんこう"
String_7428d:
	db "でんぼう"

BattleResults_CheckBattleResult: ; 74291 (1d:4291)
	ld a, $20
	ld [wd4ee], a
	ld bc, $1
	call DecompressGFXByIndex_
	ld bc, $14
	call DecompressGFXByIndex_
	ld a, $0
	ld bc, $4
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, [wBattleResult]
	cp $0
	jr z, .lost
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.lost
	ld a, $6
	ld [wd401], a
	ret

PlayVictoryMusic_LoadWinObject_PrintVictoryMessage: ; 742c4 (1d:42c4)
	ld a, MUSIC_WON_BATTLE
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $10 ; Caught the E-monster!
	call StdBattleTextBox
	call BattleResults_ResetLCDCFlags
	ld a, $7f
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers], a
	ld a, $32
	ld [wSpriteInitYCoordBuffers], a
	ld hl, VTilesOB tile $00
	call InitBattleMenuCursor
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

PrintWonBattleMessageAndCalculateExperienceYield: ; 742f6 (1d:42f6)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wNumAlivePlayerDenjuu]
	ld [BattleResults_CurBattleDenjuu], a
	xor a
	ld [wDenjuu1LeveledUp], a
	ld [wDenjuu2LeveledUp], a
	ld [wDenjuu3LeveledUp], a
	ld a, [wBattleMode]
	cp $0
	jr z, .wild
	cp $1
	jr z, .tfanger
	cp $2
	jp z, .boss_denjuu
.wild
	ld h, $0
	ld a, [wEnemyDenjuu1Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	jp .done

.tfanger
	ld a, [wEnemyDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wEnemyDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	sra b
	rr c
	sra b
	rr c
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	push bc
	pop hl
	ld h, $0
	ld a, [wEnemyDenjuu2Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [wExperiencePointsToNextLevel + 1]
	ld d, a
	ld a, [wExperiencePointsToNextLevel]
	ld e, a
	add hl, de
	ld a, h
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, l
	ld [wExperiencePointsToNextLevel], a
	ld h, $0
	ld a, [wEnemyDenjuu3Level]
	ld l, a
	srl a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [wExperiencePointsToNextLevel + 1]
	ld d, a
	ld a, [wExperiencePointsToNextLevel]
	ld e, a
	add hl, de
	jr .done

.boss_denjuu
	ld a, [wEnemyDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wEnemyDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	sra b
	rr c
	sra b
	rr c
	ld a, b
	ld h, a
	ld a, c
	ld l, a
.done
	ld a, [wNumAlivePlayerDenjuu]
	ld d, $0
	ld e, a
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	call Divide_BC_by_DE_signed_
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $3
	jr z, .okay_denjuu_1
	cp $5
	jr nz, .try_denjuu_2
.okay_denjuu_1
	ld a, [wPlayerDenjuu1Level]
	ld b, a
	ld a, [wEnemyDenjuu1Level]
	cp b
	jr c, .denjuu_1_normal_yield
	sub b
	ld h, $0
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	add hl, bc
	jr .do_denjuu_1_exp

.denjuu_1_normal_yield
	ld a, [wExperiencePointsToNextLevel + 1]
	ld h, a
	ld a, [wExperiencePointsToNextLevel]
	ld l, a
.do_denjuu_1_exp
	ld a, h
	cp $0
	jr nz, .denjuu_1_exp_ok
	ld a, l
	cp $2
	jr nc, .denjuu_1_exp_ok
	ld a, $2
	ld l, a
.denjuu_1_exp_ok
	ld a, h
	ld [wDenjuu1ExpGain + 1], a
	ld a, l
	ld [wDenjuu1ExpGain], a
	ld a, $9
	ld [wPlayerDenjuu1ArrivedStatus], a
.try_denjuu_2
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $3
	jr z, .okay_denjuu_2
	cp $5
	jr nz, .try_denjuu_3
.okay_denjuu_2
	ld a, [wPlayerDenjuu2Level]
	ld b, a
	ld a, [wEnemyDenjuu2Level]
	cp b
	jr c, .denjuu_2_normal_yield
	sub b
	ld h, $0
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	add hl, bc
	jr .do_denjuu_2_exp

.denjuu_2_normal_yield
	ld a, [wExperiencePointsToNextLevel + 1]
	ld h, a
	ld a, [wExperiencePointsToNextLevel]
	ld l, a
.do_denjuu_2_exp
	ld a, h
	cp $0
	jr nz, .denjuu_2_exp_ok
	ld a, l
	cp $2
	jr nc, .denjuu_2_exp_ok
	ld a, $2
	ld l, a
.denjuu_2_exp_ok
	ld a, h
	ld [wDenjuu2ExpGain + 1], a
	ld a, l
	ld [wDenjuu2ExpGain], a
	ld a, $9
	ld [wPlayerDenjuu2ArrivedStatus], a
.try_denjuu_3
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $3
	jr z, .okay_denjuu_3
	cp $5
	jr nz, .done_calculating_exp
.okay_denjuu_3
	ld a, [wPlayerDenjuu3Level]
	ld b, a
	ld a, [wEnemyDenjuu3Level]
	cp b
	jr c, .denjuu_3_normal_yield
	sub b
	ld h, $0
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	add hl, bc
	jr .do_denjuu_3_exp

.denjuu_3_normal_yield
	ld a, [wExperiencePointsToNextLevel + 1]
	ld h, a
	ld a, [wExperiencePointsToNextLevel]
	ld l, a
.do_denjuu_3_exp
	ld a, h
	cp $0
	jr nz, .denju_3_exp_ok
	ld a, l
	cp $2
	jr nc, .denju_3_exp_ok
	ld a, $2
	ld l, a
.denju_3_exp_ok
	ld a, h
	ld [wDenjuu3ExpGain + 1], a
	ld a, l
	ld [wDenjuu3ExpGain], a
	ld a, $9
	ld [wPlayerDenjuu3ArrivedStatus], a
.done_calculating_exp
	ld a, $b
	ld [wd401], a
	ret

BattleResults_AwardExperiencePoints: ; 7449f (1d:449f)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $9
	jp nz, AwardExp_Denjuu2
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1
	call CopyNthDenjuuToBuffer
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + $6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	ld a, [wPlayerDenjuu1Level]
	cp 99
	jp z, .no_level_up
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp 100
	jr nc, .skip_fd_up
	inc a
	ld [hl], a
.skip_fd_up
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wExperiencePointsBeforeAward], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wExperiencePointsBeforeAward + 1], a
	push de
	pop hl
	ld a, [wDenjuu1ExpGain + 1]
	ld b, a
	ld a, [wDenjuu1ExpGain]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	srl h
	rr l
	ld a, [wExperiencePointsBeforeAward + 1]
	ld b, a
	ld a, [wExperiencePointsBeforeAward]
	ld c, a
	srl b
	rr c
	call Subtract_HL_BC
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .no_level_up
	ld a, $1
	ld [wDenjuu1LeveledUp], a
	ld a, $a
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.no_level_up
	jp PrintExperienceGainedMessage

AwardExp_Denjuu2: ; 74598 (1d:4598)
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $9
	jp nz, AwardExp_Denjuu3
	ld a, $1
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1Species
	call CopyNthDenjuuToBuffer
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + $6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	ld a, [wPlayerDenjuu2Level]
	cp 99
	jp z, .no_level_up
	call OpenSRAMBank2
	ld hl, sAddressBook + $2 ; FD
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp 100
	jr nc, .skip_fd_up
	inc a
	ld [hl], a
.skip_fd_up
	call OpenSRAMBank2
	ld hl, sAddressBook + $4 ; exp
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wExperiencePointsBeforeAward], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wExperiencePointsBeforeAward + 1], a
	push de
	pop hl
	ld a, [wDenjuu2ExpGain + 1]
	ld b, a
	ld a, [wDenjuu2ExpGain]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	srl h
	rr l
	ld a, [wExperiencePointsBeforeAward + 1]
	ld b, a
	ld a, [wExperiencePointsBeforeAward]
	ld c, a
	srl b
	rr c
	call Subtract_HL_BC
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .no_level_up
	ld a, $1
	ld [wDenjuu2LeveledUp], a
	ld a, $a
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.no_level_up: ; 7468e (1d:468e)
	jp PrintExperienceGainedMessage

AwardExp_Denjuu3: ; 74691 (1d:4691)
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $9
	jp nz, .done
	ld a, $2
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1
	call CopyNthDenjuuToBuffer
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, sAddressBook + $6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	ld a, [wPlayerDenjuu3Level]
	cp 99
	jp z, .no_level_up
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	cp 100
	jr nc, .asm_746d9
	inc a
	ld [hl], a
.asm_746d9
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	push hl
	ld a, [hli]
	ld e, a
	ld a, e
	ld [wExperiencePointsBeforeAward], a
	ld a, [hl]
	ld d, a
	ld a, d
	ld [wExperiencePointsBeforeAward + 1], a
	push de
	pop hl
	ld a, [wDenjuu3ExpGain + 1]
	ld b, a
	ld a, [wDenjuu3ExpGain]
	ld c, a
	add hl, bc
	ld a, h
	ld b, a
	ld a, l
	ld c, a
	pop hl
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	srl h
	rr l
	ld a, [wExperiencePointsBeforeAward + 1]
	ld b, a
	ld a, [wExperiencePointsBeforeAward]
	ld c, a
	srl b
	rr c
	call Subtract_HL_BC
	push de
	pop hl
	call PrintNumHL
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .no_level_up
	ld a, $1
	ld [wDenjuu3LeveledUp], a
	ld a, $a
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.no_level_up: ; 74787 (1d:4787)
	jr PrintExperienceGainedMessage

.done
	call CloseSRAM
	ld a, $11
	ld [wd401], a
	ret

PrintExperienceGainedMessage: ; 74792 (1d:4792)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .denjuu1
	cp $1
	jr z, .denjuu2
	jr .denjuu3

.denjuu1
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $9
	jr nz, .print
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .print

.denjuu2
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $9
	jr nz, .print
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .print

.denjuu3
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $9
	jr nz, .print
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
	jr .print

.print
	call CloseSRAM
	ld c, $17
	call StdBattleTextBox
	ld a, $3
	ld [wd401], a
	ret

WaitWonExperienceText: ; 747d7 (1d:47d7)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $b
	ld [wd401], a
	ret

BattleResults_EarnMoneyFromVictory: ; 747e6 (1d:47e6)
	ld b, $0
	ld a, [wEnemyDenjuu1Level]
	ld c, a
	ld d, $0
	ld e, $8
	call Multiply_DE_by_BC
	push de
	ld a, d
	ld h, a
	ld a, e
	ld l, a
	call PrintNumHL
	ld c, $68
	call StdBattleTextBox
	pop de
	ld a, d
	ld b, a
	ld a, e
	ld c, a
	call AddOrSubtractMoney_
	ld a, SFX_06
	ld [H_SFX_ID], a
	ld a, $12
	ld [wd401], a
	ret

BattleResults_WaitPayoutText: ; 74813 (1d:4813)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	call Func_75456
	ld a, $4
	ld [wd401], a
	ret

PrintLevelUpText: ; 74827 (1d:4827)
	ld a, [wPlayerDenjuu1ArrivedStatus]
	cp $a
	jr nz, .asm_74860
	ld a, [wPlayerDenjuu1Level]
	inc a
	ld [wPlayerDenjuu1Level], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [wPlayerDenjuu1Level]
	ld [hl], a
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_74859
	ld [hl], a
	ld [wPlayerDenjuu1FD], a
.asm_74859
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	jr .asm_748df

.asm_74860
	ld a, [wPlayerDenjuu2ArrivedStatus]
	cp $a
	jr nz, .asm_74899
	ld a, [wPlayerDenjuu2Level]
	inc a
	ld [wPlayerDenjuu2Level], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld hl, sAddressBook + $1
	call GetNthAddressBookAttributeAddr
	ld a, [wPlayerDenjuu2Level]
	ld [hl], a
	ld a, [wPlayerDenjuu2AddressBookLocation]
	ld hl, sAddressBook + $2
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_74892
	ld [hl], a
	ld [wPlayerDenjuu2FD], a
.asm_74892
	ld a, $1
	ld [BattleResults_CurBattleDenjuu], a
	jr .asm_748df

.asm_74899
	ld a, [wPlayerDenjuu3ArrivedStatus]
	cp $a
	jr nz, .asm_748d2
	ld a, [wPlayerDenjuu3Level]
	inc a
	ld [wPlayerDenjuu3Level], a
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld hl, sAddressBook + $1
	call GetNthAddressBookAttributeAddr
	ld a, [wPlayerDenjuu3Level]
	ld [hl], a
	ld a, [wPlayerDenjuu3AddressBookLocation]
	ld hl, sAddressBook + $2
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	inc a
	inc a
	cp 100
	jr nc, .asm_748cb
	ld [hl], a
	ld [wPlayerDenjuu3FD], a
.asm_748cb
	ld a, $2
	ld [BattleResults_CurBattleDenjuu], a
	jr .asm_748df

.asm_748d2
	xor a
	ld [BattleResults_CurBattleDenjuu], a
	call CloseSRAM
	ld a, $13
	ld [wd401], a
	ret

.asm_748df
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1Species
	call CopyNthDenjuuToBuffer
	lb bc, 1, 5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wCurDenjuuBufferSpecies]
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal6
	ld a, $1
	ld [wBGPalUpdate], a
	lb bc, 0, 0
	ld e, $9e
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $90
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $8
	ld hl, VTilesBG tile $20
	call ClearString
	ld a, [wCurDenjuuBufferAddressBookLocation]
	ld hl, VTilesBG tile $20
	call PrintStringWithPlayerDenjuuAsBattleUser
	ld c, $18
	call StdBattleTextBox
	ld a, MUSIC_LEVEL_UP
	call GetMusicBank
	ld [H_MusicID], a
	call CloseSRAM
	ld a, $e
	ld [wd401], a
	ret

ResetBattleResultsLayoutForNextLevelUp: ; 74942 (1d:4942)
	lb bc, 1, 5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, SFX_14
	ld [H_SFX_ID], a
	ld a, $5
	ld [wd401], a
	ret

WaitLevelUpText: ; 74957 (1d:4957)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $7
	ld bc, $b
	call LoadNthStdBGPalette
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $28
	call LoadBackgroundPalette
	ld a, $38
	call LoadBackgroundPalette
	ld a, $d
	ld [wd401], a
	ret

PrepareLevelUpScreenLayout: ; 7497d (1d:497d)
	ld de, String_7427d
	ld hl, VTilesBG tile $40
	ld b, $4
	call PlaceString_
	ld de, String_74281
	ld hl, VTilesBG tile $44
	ld b, $4
	call PlaceString_
	ld de, String_74285
	ld hl, VTilesBG tile $48
	ld b, $4
	call PlaceString_
	ld de, String_74289
	ld hl, VTilesBG tile $4c
	ld b, $4
	call PlaceString_
	ld de, String_7428d
	ld hl, VTilesBG tile $50
	ld b, $4
	call PlaceString_
	lb bc, 10, 0
	ld e, $9d
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 10, 0
	ld e, $8f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [BattleResults_CurBattleDenjuu]
	ld hl, wPlayerDenjuu1
	call CopyNthDenjuuToBuffer
	ld a, [wCurDenjuuBufferLevel]
	hlbgcoord 16, 2
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 4
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74a22
	push af
	lb bc, 15, 5
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 5
	ld c, $1
	call Func_1499
.asm_74a22
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 7
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74a68
	push af
	lb bc, 15, 8
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 8
	ld c, $1
	call Func_1499
.asm_74a68
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 9
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74aae
	push af
	lb bc, $f, $a
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 10
	ld c, $1
	call Func_1499
.asm_74aae
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 11
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74af4
	push af
	lb bc, $f, $c
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 12
	ld c, $1
	call Func_1499
.asm_74af4
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 13
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74b3a
	push af
	lb bc, $f, $e
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 14
	ld c, $1
	call Func_1499
.asm_74b3a
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	ld a, [wCurDenjuuBuffer]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 16, 15
	ld c, $0
	call Print2DigitBCD_2
	ld a, [wCurDenjuuStat]
	push af
	ld a, [wCurDenjuuBufferLevel]
	ld b, a
	dec b
	ld a, [wCurDenjuuBufferSpecies]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	pop af
	sub b
	cp $0
	jr z, .asm_74b80
	push af
	lb bc, $f, $10
	ld e, $b8
	ld a, $0
	call LoadStdBGMapLayout_
	pop af
	hlbgcoord 18, 16
	ld c, $1
	call Func_1499
.asm_74b80
	ld a, $c
	ld [wd401], a
	ret

ShowStatChangesAfterLevelUp: ; 74b86 (1d:4b86)
	ld a, [wVBlankCounter]
	and $7
	jr nz, .no_animate
	ld hl, VTilesBG tile $10
	call AnimateStatUpArrows
.no_animate
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .denjuu1
	cp $1
	jr z, .denjuu2
	jr .denjuu3

.denjuu1
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .done

.denjuu2
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .done

.denjuu3
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
.done
	lb bc, 10, 0
	ld e, $9f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 10, 0
	ld e, $91
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, $c
	ld e, $80
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $f
	ld [wd401], a
	ret

BattleResults_CheckLearnedMove: ; 74bdc (1d:4bdc)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .Denjuu1
	cp $1
	jr z, .Denjuu2
	jr .Denjuu3

.Denjuu1
	ld hl, wPlayerDenjuu1Level
	call CheckLearnedMove
	jr .okay

.Denjuu2
	ld hl, wPlayerDenjuu2Level
	call CheckLearnedMove
	jr .okay

.Denjuu3
	ld hl, wPlayerDenjuu3Level
	call CheckLearnedMove
.okay
	ld a, [wLearnedMove]
	cp $0
	jr z, .skip_learn_move
	ld [wNamedObjectIndexBuffer], a
	ld hl, MoveNames
	call Get8CharName75
	ld bc, wStringBuffer
	call FixTerminatorCharacter
	call CopyToBattleUserName
	ld c, $34
	call StdBattleTextBox
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.skip_learn_move
	ld a, $17
	ld [wd401], a
	ret

WaitLearnedMoveText: ; 74c2b (1d:4c2b)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $17
	ld [wd401], a
	ret

HandleBattleResult_SaveExperienceGained: ; 74c3a (1d:4c3a)
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .denjuu1
	cp $1
	jr z, .denjuu2
	jp .denjuu3

.denjuu1
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wPlayerDenjuu1]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu1Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .done
	ld a, $a
	ld [wPlayerDenjuu1ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.done
	jp .finished

.denjuu2
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wPlayerDenjuu2]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu2Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .done2
	ld a, $a
	ld [wPlayerDenjuu2ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu2AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.done2
	jr .finished

.denjuu3: ; 74d23 (1d:4d23)
	call OpenSRAMBank2
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld c, a
	ld a, [hl]
	ld b, a
	ld a, b
	ld [wExperiencePointsAfterAward + 1], a
	ld a, c
	ld [wExperiencePointsAfterAward], a
	push bc
	ld a, [wPlayerDenjuu3Species]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wPlayerDenjuu3Level]
	ld b, a
	ld a, [wCurDenjuuStat]
	call GetExpToNextLevel
	ld a, b
	ld [wExperiencePointsToNextLevel + 1], a
	ld a, c
	ld [wExperiencePointsToNextLevel], a
	ld a, b
	ld d, a
	ld a, c
	ld e, a
	pop bc
	call Divide_BC_by_DE_signed_
	ld a, c
	cp $0
	jr z, .finished
	ld a, $a
	ld [wPlayerDenjuu3ArrivedStatus], a
	call OpenSRAMBank2
	ld a, [wExperiencePointsAfterAward + 1]
	ld h, a
	ld a, [wExperiencePointsAfterAward]
	ld l, a
	ld a, [wExperiencePointsToNextLevel + 1]
	ld b, a
	ld a, [wExperiencePointsToNextLevel]
	ld c, a
	call Subtract_HL_BC
	push de
	ld hl, sAddressBook + $4
	ld a, [wPlayerDenjuu3AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	pop de
	ld a, e
	ld [hli], a
	ld a, d
	ld [hl], a
.finished
	call CloseSRAM
	ld a, $4
	ld [wd401], a
	ret

CheckDenjuuEvolved: ; 74d96 (1d:4d96)
	call OpenSRAMBank2
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .denjuu_1
	cp $1
	jr z, .denjuu_2
	cp $2
	jr z, .denjuu_3
	jp .finish

.denjuu_1
	ld a, [wDenjuu1LeveledUp]
	cp $0
	jp z, .finish
	ld a, [wPlayerDenjuu1]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jp z, .finish
	ld a, [wPlayerDenjuu1Level]
	cp b
	jp c, .finish
	ld a, $b
	ld [wPlayerDenjuu1ArrivedStatus], a
	ld a, [wPlayerDenjuu1AddressBookLocation]
	jr .prep_text

.denjuu_2
	ld a, [wDenjuu2LeveledUp]
	cp $0
	jr z, .finish
	ld a, [wPlayerDenjuu2]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jr z, .finish
	ld a, [wPlayerDenjuu2Level]
	cp b
	jr c, .finish
	ld a, $b
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld a, $1
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [wPlayerDenjuu2AddressBookLocation]
	jr .prep_text

.denjuu_3
	ld a, [wDenjuu3LeveledUp]
	cp $0
	jr z, .finish
	ld a, [wPlayerDenjuu3Species]
	ld c, DENJUU_EVO_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp $0
	jr z, .finish
	ld a, [wPlayerDenjuu3Level]
	cp b
	jr c, .finish
	ld a, $b
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $2
	ld [BattleResults_CurBattleDenjuu], a
	ld a, [wPlayerDenjuu3AddressBookLocation]
.prep_text
	call OpenSRAMBank2
	ld hl, sAddressBook + $6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call CopyPlayerDenjuuNameToBattleUserName
	call CloseSRAM
	ld c, $8c
	call StdBattleTextBox
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.finish
	ld a, [BattleResults_CurBattleDenjuu]
	cp $2
	jr nc, .next
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ret

.next
	call CloseSRAM
	ld a, $8
	ld [wd401], a
	ret

HandleDenjuuEvolution: ; 74e64 (1d:4e64)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld c, $8d
	call StdBattleTextBox
	xor a
	ld [wd40d], a
	call Func_7546d
	ld a, $0
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

AskEvolveDenjuu: ; 74e89 (1d:4e89)
	call Func_3cd0
	call BattlePrintText
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .check_right
	ld a, [wd40d]
	cp $0
	jr z, .check_right
	ld a, $0
	ld [wd40d], a
	jr .move_cursor

.check_right
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .check_b_button
	ld a, [wd40d]
	cp $1
	jr z, .check_b_button
	ld a, $1
	ld [wd40d], a
.move_cursor
	ld a, SFX_02
	ld [H_SFX_ID], a
	jp Func_7546d

.check_b_button
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_a_button
	ld a, SFX_03
	ld [H_SFX_ID], a
	jr .dont_evolve_denjuu

.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $0
	jr z, .go_ahead_and_evolve
.dont_evolve_denjuu
	ld a, [BattleResults_CurBattleDenjuu]
	cp $0
	jr z, .Denjuu1
	cp $1
	jr z, .Denjuu2
	jr .Denjuu3

.Denjuu1
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	jr .done_no_evolve

.Denjuu2
	ld a, $3
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .done_no_evolve

.Denjuu3
	ld a, $3
	ld [wPlayerDenjuu3ArrivedStatus], a
.done_no_evolve
	ld c, $8e
	call StdBattleTextBox
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.go_ahead_and_evolve
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ld a, $13
	ld [wd401], a
	ret

WaitDenjuuDidNotEvolveText: ; 74f27 (1d:4f27)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [BattleResults_CurBattleDenjuu]
	inc a
	ld [BattleResults_CurBattleDenjuu], a
	ld a, $13
	ld [wd401], a
	ret

PlayDefeatedMusic_LoadLostObject_PrintDefeatedMessage: ; 74f3d (1d:4f3d)
	ld a, MUSIC_LOST_BATTLE
	call GetMusicBank
	ld [H_MusicID], a
	ld c, $13
	call StdBattleTextBox
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
	ld e, $85
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $7e
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers], a
	ld a, $32
	ld [wSpriteInitYCoordBuffers], a
	ld hl, VTilesOB tile $00
	call InitBattleMenuCursor
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

PrintLostBattleMessageAndPenalizePlayer: ; 74f80 (1d:4f80)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wMoney + 1]
	ld b, a
	ld a, [wMoney]
	ld c, a
	srl b
	rr c
	ld a, b
	ld [wMoney + 1], a
	ld a, c
	ld [wMoney], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $2
	ld a, [wPlayerDenjuu1AddressBookLocation]
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	srl a
	ld [hl], a
	call CloseSRAM
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

LostBattle_StartFadeOut: ; 74fc2 (1d:4fc2)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

LostBattle_WaitFadeOut: ; 74fd4 (1d:4fd4)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wc46c], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

LostBattle_Finish: ; 74fe8 (1d:4fe8)
	xor a
	ld [wd401], a
	call BattleResults_ResetLCDCFlags
	jp NextBattleSubroutine

BattleResults_ResetLCDCFlags: ; 74ff2 (1d:4ff2)
	ld a, [wLCDC]
	res 5, a
	ld [wLCDC], a
	ld a, [wLCDC]
	res 6, a
	ld [wLCDC], a
	xor a
	ld [wc46c], a
	ret

Subtract_HL_BC: ; 75007 (1d:5007)
	ld a, l
	sub c
	ld e, a
	ld a, h
	sbc b
	ld d, a
	ret

Func_7500e: ; 7500e (1d:500e)
	ld d, $0
	push de
	call GetStatOffsetMultiplier_
	pop de
	ld b, $0
	ld a, [wd494]
	ld c, a
	call Multiply_DE_by_BC
	sra d
	rr e
	ld a, e
	ret

Func_75024:
	push bc
	ld a, [wCurDenjuuBufferLevel]
	ld e, a
	ld a, [wCurDenjuuBuffer]
	call Func_7500e
	pop bc
	push af
	ld a, [wCurDenjuuBufferLevel]
	dec a
	ld e, a
	ld a, [wCurDenjuuBuffer]
	call Func_7500e
	ld b, a
	pop af
	sub b
	ret

DenjuuWantsToJoinTeam_: ; 75040 (1d:5040)
	ld a, [wd401]
	jump_table
	dw SetUpRecruitmentScreenLayout
	dw Func_75113
	dw Func_75158
	dw Func_75169
	dw Func_751dc
	dw Func_75202
	dw Func_75297
	dw Func_752d3
	dw Func_752e7
	dw Func_75144
	dw Func_751c8
	dw Func_752f1
	dw Func_7538e

Data_75064:
	db 70, 140, 240
	db 70, 140, 240
	db 70, 140, 240

SetUpRecruitmentScreenLayout:
	ld bc, $16
	call DecompressGFXByIndex_
	ld bc, $9
	call DecompressGFXByIndex_
	ld bc, $e
	call GetCGB_BGLayout_
	ld a, $28
	call LoadBackgroundPalette
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, $4
	ld e, $ad
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $6, $5
	ld e, $91
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $6, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wRecruitedDenjuuSpecies]
	ld de, VTilesBG tile $10
	call GetCurDenjuuKanjiDescription
	ld a, [wRecruitedDenjuuSpecies]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal7
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
	ld a, [wRecruitedDenjuuSpecies]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $58
	call GetAndPrintName75CenterAlign
	ld a, [wRecruitedDenjuuSpecies]
	call CopyDenjuuSpeciesNameToUserNameBuffer
	ld c, $6c
	call StdBattleTextBox
	ld a, MUSIC_GOT_PHONE_NUMBER
	call GetMusicBank
	ld [H_MusicID], a
	ld a, [wRecruitedDenjuuLevel]
	hlbgcoord 10, 2
	ld c, $1
	call Print2DigitBCD_2
	ld a, $0
	call Func_75456
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_75113:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call CheckIfDenjuuSpeciesInAddressBook
	cp $0
	jr z, .asm_7512b
	lb bc, $2, $1
	ld e, $a3
	ld a, $0
	call LoadStdBGMapLayout_
.asm_7512b
	ld a, [wBattleMode]
	cp $1
	jp z, Func_75139
	ld a, $9
	ld [wd401], a
	ret

Func_75139: ; 75139 (1d:5139)
	ld c, $3
	call StdBattleTextBox
	ld a, $2
	ld [wd401], a
	ret

Func_75144: ; 75144 (1d:5144)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld c, $3
	call StdBattleTextBox
	ld a, $2
	ld [wd401], a
	ret

Func_75158: ; 75158 (1d:5158)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_75169: ; 75169 (1d:5169)
	lb bc, $2, $e
	ld e, $ab
	ld a, $0
	call LoadStdBGMapLayout_
	ld hl, Data_75064
	ld a, [wDShotLevel]
	inchlntimes
	ld a, [hl]
	ld b, a
	ld a, [wNumDenjuuInAddressBook]
	cp b
	jr nc, .asm_751bd
	ld bc, $18
	call DecompressGFXByIndex_
	call CopyRecruitedDenjuuToAddressBook
	ld a, $0
	ld [wcd24], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $a
	ld a, [wFirstEmptySlotInAddressBook]
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
	hlbgcoord 3, 14
	call PrintPhoneNumber_
	call CloseSRAM
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.asm_751bd
	ld c, $6e
	call StdBattleTextBox
	ld a, $a
	ld [wd401], a
	ret

Func_751c8: ; 751c8 (1d:51c8)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $1
	ld [wd40d], a
	ld a, $6
	ld [wd401], a
	ret

Func_751dc: ; 751dc (1d:51dc)
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld c, $63
	call StdBattleTextBox
	xor a
	ld [wd40d], a
	call Func_7546d
	ld a, $0
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_75202: ; 75202 (1d:5202)
	call Func_3cd0
	call BattlePrintText
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_75229
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $0
	jr z, .asm_75221
	xor a
	ld [wd40d], a
	jp Func_7546d

.asm_75221
	ld a, $1
	ld [wd40d], a
	jp Func_7546d

.asm_75229
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_7524a
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_75243
	ld a, $1
	ld [wd40d], a
	jp Func_7546d

.asm_75243
	xor a
	ld [wd40d], a
	jp Func_7546d

.asm_7524a
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_75257
	ld a, SFX_03
	ld [H_SFX_ID], a
	jr .asm_7526c

.asm_75257
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_7526c
	ld c, $64
	jr .asm_75282

.asm_7526c
	ld a, $1
	ld [wd40d], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld a, [wFirstEmptySlotInAddressBook]
	call GetNthAddressBookAttributeAddr
	ld a, $0
	ld [hl], a
	ld c, $65
.asm_75282
	call StdBattleTextBox
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_75297: ; 75297 (1d:5297)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd40d]
	cp $0
	jr nz, .asm_752c1
	ld c, $8f
	call StdBattleTextBox
	xor a
	ld [wd40d], a
	call Func_7546d
	ld a, $0
	ld [wStartObjectAnimationIDX], a
	call Func_3cb5
	ld a, $b
	ld [wd401], a
	ret

.asm_752c1
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_752d3: ; 752d3 (1d:52d3)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wc46c], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_752e7: ; 752e7 (1d:52e7)
	xor a
	ld [wd401], a
	ld a, $8
	ld [wBattleSubroutine], a
	ret

Func_752f1: ; 752f1 (1d:52f1)
	call Func_3cd0
	call BattlePrintText
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_75318
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $0
	jr z, .asm_75310
	xor a
	ld [wd40d], a
	jp Func_7546d

.asm_75310
	ld a, $1
	ld [wd40d], a
	jp Func_7546d

.asm_75318
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_75339
	ld a, SFX_02
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_75332
	ld a, $1
	ld [wd40d], a
	jp Func_7546d

.asm_75332
	xor a
	ld [wd40d], a
	jp Func_7546d

.asm_75339
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_75353
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, SFX_03
	ld [H_SFX_ID], a
	jr .asm_7537e

.asm_75353
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, SFX_03
	ld [H_SFX_ID], a
	ld a, $0
	ld [wOAMAnimation01_PriorityFlags], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_7537e
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

.asm_7537e
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	ld a, $7
	ld [wd401], a
	ret

Func_7538e: ; 7538e (1d:538e)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wPlayerDenjuu1CurHP]
	ld [wPartnerDenjuuHPRemaining], a
	xor a
	ld [wd401], a
	ld [wBattleSubroutine], a
	ld a, $1f
	ld [wSubroutine], a
	ld a, $3
	ld [wGameRoutine], a
	ret

CopyRecruitedDenjuuToAddressBook: ; 753ad (1d:53ad)
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld de, $10
	ld b, $0
.loop
	add hl, de
	inc b
	ld a, [hl]
	cp $0
	jr nz, .loop
	ld a, b
	ld [wFirstEmptySlotInAddressBook], a
	ld a, [wFirstEmptySlotInAddressBook]
	ld hl, sAddressBook + $0
	call GetNthAddressBookAttributeAddr
	push hl
	ld a, [wRecruitedDenjuuSpecies]
	ld [hli], a
	ld a, [wRecruitedDenjuuLevel]
	ld [hli], a
	ld a, [wRecruitedDenjuuInitialFD]
	ld [hli], a
	ld a, [wRecruitedDenjuuField0x03]
	ld [hli], a
	pop hl
	call Func_0648
	call OpenSRAMBank2
	ld a, [wFirstEmptySlotInAddressBook]
	ld hl, sAddressBook + $8
	call GetNthAddressBookAttributeAddr
	push hl
	call Func_0671
	pop hl
	ld a, c
	ld [hl], a
	call CloseSRAM
	ret

CheckIfDenjuuSpeciesInAddressBook: ; 753f8 (1d:53f8)
	ld b, $0
	ld hl, wBattleRecruitRateBuffer
	ld a, $0
	ld [wStatsScreen_NumDenjuu], a
.loop
	ld a, [wLinkMode]
	cp $0
	jr z, .go
	ld a, [wFirstEmptySlotInAddressBook]
	cp b
	jr z, .next
.go
	push hl
	push bc
	call OpenSRAMBank2
	ld hl, sAddressBook + $0
	ld a, b
	call GetNthAddressBookAttributeAddr
	ld a, [hli]
	ld d, a
	ld a, [hl]
	pop bc
	pop hl
	cp $0
	jr z, .next
	ld a, d
	ld [hli], a
	ld a, [wStatsScreen_NumDenjuu]
	inc a
	ld [wStatsScreen_NumDenjuu], a
.next
	inc b
	ld a, ADDRESS_BOOK_SIZE
	cp b
	jr nz, .loop
	ld hl, wBattleRecruitRateBuffer
	ld a, [wRecruitedDenjuuSpecies]
	ld b, a
	ld a, [wStatsScreen_NumDenjuu]
	ld c, a
.loop2
	ld a, [hl]
	cp b
	jr z, .found_it
	inc hl
	dec c
	jr nz, .loop2
	ld a, $0
	ld [BattleResults_CurBattleDenjuu], a
	jr .done

.found_it
	ld a, $1
	ld [BattleResults_CurBattleDenjuu], a
.done
	call CloseSRAM
	ret

Func_75456: ; 75456 (1d:5456)
	ld a, $0
	call LoadUnknGfx090
	call .LoadPalette
	ret

.LoadPalette: ; 7545f (1d:545f)
	ld a, $0
	ld bc, $4
	call LoadNthStdOBPalette
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_7546d: ; 7546d (1d:546d)
	ld a, [wd40d]
	cp $1
	jr z, .asm_75478
	ld a, $18
	jr .asm_7547a

.asm_75478
	ld a, $48
.asm_7547a
	ld [wSpriteInitXCoordBuffers], a
	ld a, $80
	ld [wSpriteInitYCoordBuffers], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

INCLUDE "battle/evolution.asm"

Func_757c3: ; 757c3 (1d:57c3)
	ld a, [wd401]
	jump_table
	dw Func_757d9
	dw Func_758ad
	dw Func_758bc
	dw Func_758cd
	dw Func_758df
	dw Func_758ee

Func_757d9: ; 757d9 (1d:57d9)
	ld bc, $16
	call DecompressGFXByIndex_
	ld bc, $9
	call DecompressGFXByIndex_
	ld bc, $e
	call GetCGB_BGLayout_
	ld a, $28
	call LoadBackgroundPalette
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, $0
	ld e, $70
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, $6, $5
	ld e, $91
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $6, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wNumDenjuuInAddressBook]
	cp $1
	jr z, .asm_75824
	call GetAddressBookDenjuuWithHighestFD
	jr .asm_7582a

.asm_75824
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	ld [wd4eb], a
.asm_7582a
	call OpenSRAMBank2
	ld hl, sAddressBook + $0
	ld a, [wd4eb]
	call GetNthAddressBookAttributeAddr
	push hl
	ld a, [hli]
	ld [wd492], a
	ld a, [hl]
	ld [wd493], a
	pop hl
	ld a, $10
.asm_75842
	ld [hl], $0
	inc hl
	dec a
	jr nz, .asm_75842
	call CloseSRAM
	ld a, [wNumDenjuuInAddressBook]
	dec a
	ld [wNumDenjuuInAddressBook], a
	ld a, [wd4eb]
	ld c, a
	call Func_06a4
	ld a, $0
	ld [wcd24], a
	ld a, [wd492]
	ld de, VTilesBG tile $10
	call GetCurDenjuuKanjiDescription
	ld a, [wd492]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call GetDenjuuPalette_Pal7
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
	ld hl, VTilesBG tile $58
	ld a, [wd4eb]
	call PrintStringWithPlayerDenjuuAsBattleUser
	ld c, $9
	call StdBattleTextBox
	ld a, [wd493]
	hlbgcoord 10, 2
	ld c, $1
	call Print2DigitBCD_2
	ld a, MUSIC_2E
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $4
	call StartFade_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_758ad: ; 758ad (1d:58ad)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_758bc: ; 758bc (1d:58bc)
	call BattlePrintText
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_758cd: ; 758cd (1d:58cd)
	ld a, $4
	call StartFade_
	ld a, $10
	ld [wMusicFade], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_758df: ; 758df (1d:58df)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_758ee: ; 758ee (1d:58ee)
	xor a
	ld [wd401], a
	ld a, $9
	ld [wBattleSubroutine], a
	ret

GetAddressBookDenjuuWithHighestFD: ; 758f8 (1d:58f8)
	ld b, ADDRESS_BOOK_SIZE
	ld hl, wBattleRecruitRateBuffer
.clear
	ld a, $0
	ld [hli], a
	dec b
	jr nz, .clear
	ld b, $0
	ld hl, wBattleRecruitRateBuffer
.loop
	ld a, [wAddressBookIndexOfPartnerDenjuu]
	cp b
	jr z, .next
	push hl
	push bc
	call OpenSRAMBank2
	ld hl, sAddressBook + $1
	ld a, b
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	pop bc
	pop hl
	cp $0
	jr z, .next
	ld a, b
	ld [hli], a
.next
	inc b
	ld a, ADDRESS_BOOK_SIZE
	cp b
	jr nz, .loop
	ld c, $0
	ld a, $0
	ld [wd4eb], a
	ld a, [wNumDenjuuInAddressBook]
	cp $2
	jp z, .grab
	dec a
	ld [BattleResults_CurBattleDenjuu], a
.loop2
	push bc
	ld hl, wBattleRecruitRateBuffer
	ld d, $0
	ld a, [wd4eb]
	ld e, a
	add hl, de
	ld a, [hl]
	ld hl, sAddressBook + $2
	call GetNthAddressBookAttributeAddr
	ld a, [hl]
	ld [wd40b], a
	pop bc
	push bc
	ld a, c
	ld hl, wBattleRecruitRateBuffer
.slow_add_hl_a
	inc hl
	dec a
	jr nz, .slow_add_hl_a
	ld a, [hl]
	ld hl, sAddressBook + $2
	call GetNthAddressBookAttributeAddr
	pop bc
	ld a, [wd40b]
	ld b, a
	ld a, [hl]
	cp b
	jr c, .new_max
	jr .next_max

.new_max
	ld a, c
	ld [wd4eb], a
.next_max
	inc c
	ld a, [BattleResults_CurBattleDenjuu]
	ld b, a
	ld a, c
	cp b
	jr nz, .loop2
.grab
	ld hl, wBattleRecruitRateBuffer
	ld d, $0
	ld a, [wd4eb]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd4eb], a
	ret
