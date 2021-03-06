HandleRunningMapScript: ; 3c000 (f:4000)
	ld a, [wSubroutine]
	cp $4
	ret nz
	ld a, [wScriptDelay]
	or a
	jr nz, handle_script_delay
RunMapScript: ; 3c00c (f:400c)
	ld a, [wcd00]
	or a
	jp z, CheckActivatedScript
script_command_loop
	ld a, [wScriptDelay]
	or a
	jr z, do_next_script_command
handle_script_delay
	dec a
	ld [wScriptDelay], a
	ret

do_next_script_command
	ld a, [wScriptBank]
	ld b, a
	add a
	add b
	ld hl, ScriptPointerTables
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call CopyScriptToBuffer
	call ExecuteScriptCommand
	jr c, script_command_loop
	ret

ScriptPointerTables:
	dba Pointers_150000
	dba Pointers_154000

ExecuteScriptCommand: ; 3c041 (f:4041)
	ld a, [wScriptBuffer]
	ld c, a
	ld b, $0
	ld hl, ScriptCommandPointers
	add hl, bc
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

CheckActivatedScript: ; 3c050 (f:4050)
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	ret nz
	ld hl, wCurMapScripts
.loop
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, $ff
	cp c
	jr nz, .okay
	cp b
	jr nz, .okay
	ret

.okay
	push hl
	push bc
	ld hl, EVENT_COMPLETED_SCRIPT_000
	add hl, bc
	ld b, h
	ld c, l
	call CheckEventFlag
	pop bc
	push bc
	jp nz, .next
	ld h, b
	ld l, c
	add hl, bc
	add hl, hl
	add hl, bc
	ld bc, MapObjectHeaders + $2
	add hl, bc
	ld b, BANK(MapObjectHeaders)
	call GetMapObjectFlags
	ld a, [wPlayerObjectStruct_Duration + 15]
	bit 0, a
	jr z, .skip_flip_flag
	xor $2
.skip_flip_flag
	ld hl, Data_3c10e
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	and d
	jr z, .next
	ld a, b
	and $1
	jr z, .skip_checks
	ld a, [wc98e]
	or a
	jr nz, .next
	ld a, [wPlayerXTile]
	ld e, a
	ld a, c
	swap a
	and $f
	cp e
	jr nz, .next
	ld a, [wPlayerYTile]
	ld e, a
	ld a, c
	and $f
	cp e
	jr nz, .next
.skip_checks
	ld a, b
	and $2
	jr z, .force_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .next
.force_a_button
	ld a, b
	and $4
	jr nz, .force_script
	pop bc
	push bc
	ld hl, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call CheckEventFlag
	jr z, .next
.force_script
	pop bc
	ld a, b
	ld [wScriptNumber + 1], a
	ld a, c
	ld [wScriptNumber], a
	ld a, $1
	ld [wcd00], a
	ld a, $0
	ld [wScriptDelay], a
	ld a, $0
	ld [wScriptBank], a
	ld hl, wScriptOffset
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	add sp, $2
	callba StopPlayerWalkingAnimation
	ret

.next
	pop bc
	pop hl
	jp .loop

Data_3c10e:
x = 0
REPT 4
	db 1 << x
x = x + 1
ENDR

AdvanceScriptPointer: ; 3c112 (f:4112)
	push hl
	push de
	ld a, [wScriptOffset]
	ld l, a
	ld a, [wScriptOffset + 1]
	ld h, a
	ld d, $0
	ld e, b
	bit 7, b
	jr z, .positive
	dec d
.positive
	add hl, de
	ld a, l
	ld [wScriptOffset], a
	ld a, h
	ld [wScriptOffset + 1], a
	pop de
	pop hl
	ret

ScriptCommandPointers:
	dw Script_End ; 00
	dw Script_PrintText ; 01
	dw Script_PrintText ; 02
	dw ScriptCommand_03 ; 03
	dw Script_Sleep ; 04
	dw Script_WaitButton ; 05
	dw Script_End ; 06
	dw ScriptCommand_0b ; 07
	dw ScriptCommand_0b ; 08
	dw ScriptCommand_0b ; 09
	dw ScriptCommand_0b ; 0a
	dw ScriptCommand_0b ; 0b
	dw Script_SetPlayerFacing ; 0c
	dw Script_SetPlayerFacing ; 0d
	dw Script_HopPlayer ; 0e
	dw ScriptCommand_0f ; 0f
	dw Script_WalkPlayer ; 10
	dw Script_UnlockScript ; 11
	dw Script_UnlockScript ; 12
	dw Script_SetScriptComplete ; 13
	dw Script_LockAndCompleteEvent ; 14
	dw Script_LockEvent ; 15
	dw Script_SetScriptComplete_ ; 16
	dw ScriptCommand_17 ; 17
	dw ScriptCommand_18 ; 18
	dw ScriptCommand_19 ; 19
	dw ScriptCommand_1b ; 1a
	dw ScriptCommand_1b ; 1b
	dw Script_SetPartnerFacing ; 1c
	dw ScriptCommand_1d ; 1d
	dw ScriptCommand_1e ; 1e
	dw Script_SpawnPerson ; 1f
	dw Script_SpawnPerson ; 20
	dw Script_SpawnPerson ; 21
	dw ScriptCommand_22 ; 22
	dw Script_WalkNPC ; 23
	dw Script_Disappear ; 24
	dw Script_Disappear ; 25
	dw ScriptCommand_26 ; 26
	dw Script_HopNPC ; 27
	dw Script_HopNPC ; 28
	dw ScriptCommand_2f ; 29
	dw Script_WaitPlayerWalk ; 2a
	dw ScriptCommand_2f ; 2b
	dw ScriptCommand_2c ; 2c
	dw ScriptCommand_2f ; 2d
	dw Script_HopAndDisplaceNPC ; 2e
	dw ScriptCommand_2f ; 2f
	dw Script_Jump ; 30
	dw Script_StartBattle ; 31
	dw Script_StartBattle ; 32
	dw Script_StartBattle ; 33
	dw Script_SetEvent ; 34
	dw Script_ResetEvent ; 35
	dw Script_GiveItemQuantity ; 36
	dw Script_TakeItemQuantity ; 37
	dw Script_IfEvent ; 38
	dw Script_IfNotEvent ; 39
	dw Script_GiveMoney ; 3a
	dw Script_TakeMoney ; 3b
	dw Script_WalkPartner ; 3c
	dw Script_FacePlayer ; 3d
	dw Script_SpawnPlayer ; 3e
	dw Script_SpawnPartner ; 3f
	dw Script_ShakeScreen ; 40
	dw Script_ShakeScreen ; 41
	dw Script_ShakeScreen ; 42
	dw Script_ShakeScreen ; 43
	dw Script_PlaySFX ; 44
	dw Script_PlayMusic ; 45
	dw ScriptCommand_4a ; 46
	dw ScriptCommand_4a ; 47
	dw ScriptCommand_4a ; 48
	dw ScriptCommand_4a ; 49
	dw ScriptCommand_4a ; 4a
	dw Script_IfWonBattle ; 4b
	dw ScriptCommand_4c ; 4c
	dw Script_Special ; 4d
	dw Script_IfWonBattle ; 4e
	dw Script_IfWonBattle ; 4f
	dw ScriptCommand_56 ; 50
	dw Script_IncVar ; 51
	dw Script_DecVar ; 52
	dw Script_SetVar ; 53
	dw Script_IfEqual ; 54
	dw Script_IfNotEqual ; 55
	dw ScriptCommand_56 ; 56
	dw ScriptCommand_57 ; 57
	dw Script_WaitPartnerWalk ; 58
	dw Script_GiveDenjuu ; 59
	dw Script_IfHaveItem ; 5a
	dw Script_AntennaTreeMapName ; 5b
	dw Script_StartRingingPhone ; 5c
	dw Script_StopRingingPhone ; 5d
	dw Script_SetDShotSignalStrength ; 5e
	dw ScriptCommand_5f ; 5f
	dw ScriptCommand_60 ; 60
	dw ScriptCommand_61 ; 61
	dw ScriptCommand_62 ; 62
	dw ScriptCommand_63 ; 63
	dw Script_FaceAwayFromPlayer ; 64
	dw ScriptCommand_65 ; 65
	dw ScriptCommand_66 ; 66
	dw ScriptCommand_67 ; 67
	dw Script_WarpWavy ; 68
	dw Script_IfRecruited ; 69
	dw ScriptCommand_6a ; 6a
	dw Script_SetDShotLevel ; 6b
	dw Script_ResetEventState ; 6c
	dw Script_IfPhoneSilent ; 6d
	dw Script_IfRecruitedAllSpecies ; 6e
	dw ScriptCommand_78 ; 6f
	dw ScriptCommand_78 ; 70
	dw ScriptCommand_78 ; 71
	dw ScriptCommand_78 ; 72
	dw ScriptCommand_78 ; 73
	dw ScriptCommand_78 ; 74
	dw ScriptCommand_78 ; 75
	dw ScriptCommand_78 ; 76
	dw ScriptCommand_78 ; 77
	dw ScriptCommand_78 ; 78

Script_PrintText: ; 3c222 (f:4222)
	ld hl, wScriptBuffer + 1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call PrintMapObjectText_
	ld b, $3
	call AdvanceScriptPointer
	ld a, [wScriptDelay]
	or a
	jr nz, .start_delay
	ld a, $8
	ld [wScriptDelay], a
.start_delay
	xor a
	ret

ScriptCommand_03: ; 3c23d (f:423d)
	call Func_2ba9
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_Sleep: ; 3c247 (f:4247)
	ld a, [wScriptBuffer + 1]
	ld [wScriptDelay], a
	ld b, $2
	call AdvanceScriptPointer
	xor a
	ret

Script_WaitButton: ; 3c254 (f:4254)
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	jr nz, .asm_3c25c
	xor a
	ret

.asm_3c25c
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_End: ; 3c263 (f:4263)
	ld a, $0
	ld [wEncounterStepCounter], a
	ld [wEncounterStepCounter + 1], a
	ld a, $3
	ld [wc918], a
	call Func_225b
	ld a, $8
	ld [wScriptDelay], a
	ld a, [wOverworldPhoneCallCooldown]
	or a
	jr nz, .asm_3c282
	inc a
	ld [wOverworldPhoneCallCooldown], a
.asm_3c282
	ld a, [wPlayerObjectStruct_Duration + 17]
	and $fd
	ld [wPlayerObjectStruct_Duration + 17], a
	xor a
	ld [wcd00], a
	ret

ScriptCommand_0b: ; 3c28f (f:428f)
	ld a, [wScriptBuffer + 1]
	ld [wMapGroup], a
	ld a, [wScriptBuffer + 2]
	ld [wMapNumber], a
	ld a, [wScriptBuffer + 3]
	ld b, a
	inc a
	ld c, a
	and $f0
	add $8
	ld [wc901], a
	ld a, c
	swap a
	and $f0
	ld [wc902], a
	ld a, [wSubroutine]
	cp $1
	jr z, .set_subroutine_zero
	ld a, $7
	ld [wSubroutine], a
	ld a, BANK(ScriptCommand_0b)
	ld [wPrevROMBank], a
	ld a, $4
	call StartFade_
	ld b, $4
	call AdvanceScriptPointer
	xor a
	ret

.set_subroutine_zero
	ld a, $0
	ld [wSubroutine], a
	ld b, $4
	call AdvanceScriptPointer
	xor a
	ret

Script_WarpWavy: ; 3c2d9 (f:42d9)
	ld a, [wMapGroup]
	ld [wWhichPhoneNumberSymbolCode], a
	ld a, $0
	ld [wc958], a
	callba StartWavyWarpAnimation
	ld a, [wScriptBuffer + 1]
	ld [wMapGroup], a
	ld a, [wScriptBuffer + 2]
	ld [wMapNumber], a
	ld a, [wScriptBuffer + 3]
	ld b, a
	inc a
	ld c, a
	and $f0
	add $8
	ld [wc901], a
	ld a, c
	swap a
	and $f0
	ld [wc902], a
	ld b, $4
	call AdvanceScriptPointer
	xor a
	ret

Script_SetPlayerFacing: ; 3c314 (f:4314)
	ld d, $0
	ld a, [wScriptBuffer + 1]
	ld b, a
	or a
	jr nz, .skip
	ld d, $1
.skip
	ld a, d
	ld [wPlayerObjectStruct_TemplateIdx], a
	ld a, b
	ld hl, Data_3c356
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wCurPlayerSpriteImage], a
	ld a, [wPlayerObjectStruct_Duration + 17]
	bit 2, a
	jp z, .skip2
	ld a, [wCurPlayerSpriteImage]
	add 45 ; holding something in midair
	ld [wCurPlayerSpriteImage], a
.skip2
	ld a, b
	ld hl, Data_3c35a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wPlayerObjectStruct_Duration + 15], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Data_3c356:
	db $06, $00, $06, $03

Data_3c35a:
	db $00, $03, $02, $01

Script_HopPlayer: ; 3c35e (f:435e)
	ld hl, wPlayerObjectStruct_Duration + 2
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld hl, wPlayerObjectStruct_Duration + 6
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld b, $1
	call AdvanceScriptPointer
asm_3c375
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 14], a
	ld a, $14
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $0
	ld [wCurStandingTile], a
	scf
	ret

ScriptCommand_0f: ; 3c38b (f:438b)
	ld hl, Data_3c3b7
	ld a, [wScriptBuffer + 1]
	sla a
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wPlayerObjectStruct_Duration + 2], a
	ld a, [hli]
	ld [wPlayerObjectStruct_Duration + 3], a
	ld a, [hli]
	ld [wPlayerObjectStruct_Duration + 6], a
	ld a, [hl]
	ld [wPlayerObjectStruct_Duration + 7], a
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld b, $2
	call AdvanceScriptPointer
	jr asm_3c375

Data_3c3b7
	db $40, $00, $00, $00
	db $00, $00, $40, $00
	db $c0, $ff, $00, $00
	db $00, $00, $c0, $ff

Script_WalkPlayer: ; 3c3c7 (f:43c7)
	ld a, [wScriptBuffer + 1]
	ld [wPlayerObjectStruct_Duration + 12], a
	ld a, [wScriptBuffer + 2]
	ld [wPlayerObjectStruct_Duration + 14], a
	ld a, $15
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $ff
	ld [wPlayerObjectStruct_Duration + 15], a
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_62: ; 3c3e4 (f:43e4)
	ld a, [wPlayerObjectStruct_Duration + 17]
	or $20
	ld [wPlayerObjectStruct_Duration + 17], a
	jr Script_WalkPlayer

Script_UnlockScript: ; 3c3ee (f:43ee)
	ld a, [wScriptBuffer + 1]
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld l, a
	ld bc, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_SetScriptComplete: ; 3c406 (f:4406)
	ld a, [wScriptBuffer + 1]
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld l, a
	ld bc, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call ResetEventFlag
	ld a, [wScriptBuffer + 1]
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld l, a
	ld bc, EVENT_COMPLETED_SCRIPT_000
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_ResetEventState: ; 3c42f (f:442f)
	ld a, [wScriptBuffer + 1]
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld l, a
	ld bc, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call ResetEventFlag
	ld a, [wScriptBuffer + 1]
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld l, a
	ld bc, EVENT_COMPLETED_SCRIPT_000
	add hl, bc
	ld b, h
	ld c, l
	call ResetEventFlag
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_LockAndCompleteEvent: ; 3c458 (f:4458)
	ld a, [wScriptNumber]
	ld l, a
	ld a, [wScriptNumber + 1]
	ld h, a
	ld bc, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call ResetEventFlag
	ld a, [wScriptNumber]
	ld l, a
	ld a, [wScriptNumber + 1]
	ld h, a
	ld bc, EVENT_COMPLETED_SCRIPT_000
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_LockEvent: ; 3c481 (f:4481)
	ld a, [wScriptNumber]
	ld l, a
	ld a, [wScriptNumber + 1]
	ld h, a
	ld bc, EVENT_PERSON_VISIBLE_000
	add hl, bc
	ld b, h
	ld c, l
	call ResetEventFlag
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_SetScriptComplete_: ; 3c499 (f:4499)
	jp Script_SetScriptComplete

ScriptCommand_17: ; 3c49c (f:449c)
	ld a, [wScriptBuffer + 1]
	ld [wcd26], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_18: ; 3c4a9 (f:44a9)
	ld a, [wcd26]
	inc a
	ld [wcd26], a
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_19: ; 3c4b7 (f:44b7)
	ld a, $0
	ld [wScriptOffset + 1], a
	ld a, $0
	ld [wScriptOffset], a
	ld a, [wScriptBuffer + 1]
	ld [wScriptNumber + 1], a
	ld a, [wScriptBuffer + 2]
	ld [wScriptNumber], a
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_1b: ; 3c4d4 (f:44d4)
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	ld hl, wPartnerDenjuuObjectStruct
	call GetDirectionFromObjectToPlayer_
	ld d, $2
	ld a, b
	cp $3 ; left
	jr nz, .skip
	ld b, $2
	ld d, $3
.skip
	ld a, d
	ld [wPartnerDenjuuObjectStruct_TemplateIdx], a
	ld hl, Data_3c356
	ld a, b
	add a
	add b
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, $ff
	ld [wLoadedPartnerDenjuuSprite], a
	call RequestPartnerDenjuuSprite_
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_SetPartnerFacing: ; 3c50a (f:450a)
	ld d, $2
	ld a, [wScriptBuffer + 1]
	ld b, a
	or a
	jr nz, .asm_3c515
	ld d, $3
.asm_3c515
	ld a, d
	ld [wPartnerDenjuuObjectStruct_TemplateIdx], a
	ld a, b
	ld hl, Data_3c356
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wRequestedPartnerDenjuuSprite], a
	ld a, $ff
	ld [wLoadedPartnerDenjuuSprite], a
	call RequestPartnerDenjuuSprite_
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_1d: ; 3c536 (f:4536)
	ld hl, wPartnerDenjuuObjectStruct_Duration + 2
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld hl, wPartnerDenjuuObjectStruct_Duration + 6
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld b, $1
	call AdvanceScriptPointer
	ld a, SFX_10
	ld [H_SFX_ID], a
Func_3c552: ; 3c552 (f:4552)
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_2e76
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	call Func_2e67
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc98c]
	cpl
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc98d]
	cpl
	inc a
	ld [hl], a
	ld a, $0
	ld [wPartnerDenjuuObjectStruct_Duration + 14], a
	ld a, $7
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	scf
	ret

ScriptCommand_1e: ; 3c596 (f:4596)
	ld a, [wScriptBuffer + 1]
	or a
	jr z, .asm_3c5b3
	ld a, $0
	ld [wPartnerDenjuuObjectStruct_Duration + 13], a
	ld a, [wScriptBuffer + 1]
	ld [wPartnerDenjuuObjectStruct_Duration + 14], a
	ld a, $8
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.asm_3c5b3
	ld a, [wPartnerDenjuuObjectStruct_PriorityFlags]
	or $1
	ld [wPartnerDenjuuObjectStruct_PriorityFlags], a
	ld a, $1
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_SpawnPerson: ; 3c5c7 (f:45c7)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr nz, .skip
	ld a, c
	ld hl, wMapHeader
	ld [hli], a
	ld a, [wScriptBuffer + 3]
	ld [hli], a
	ld a, [wScriptBuffer + 2]
	ld [hli], a
	xor a
	ld [hli], a
	ld [hl], a
	call Func_33f0
	call Func_2e85
.skip
	ld b, $4
	call AdvanceScriptPointer
	scf
	ret

ScriptEngine_GetObjectStruct: ; 3c5ef (f:45ef)
	ld b, $8
	ld hl, wOAMAnimation17
	ld de, $20
.loop
	ld a, [hl]
	and $2
	jr z, .next
	push hl
	ld a, $10
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp c
	pop hl
	jr z, .got_it
.next
	add hl, de
	dec b
	jr nz, .loop
	xor a
	ret

.got_it
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	or $1
	ret

ScriptCommand_22: ; 3c61b (f:461b)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .not_found
	ld a, [wScriptBuffer + 2]
	ld de, Data_3c641
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [de]
	ld [hl], a
.not_found
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Data_3c641:
	db 9, 0, 6, 3

Script_WalkNPC: ; 3c645 (f:4645)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3c680
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [wScriptBuffer + 2]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [wScriptBuffer + 3]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $bf
	ld [hl], a
.asm_3c680
	ld b, $4
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_63: ; 3c687 (f:4687)
	call Script_WalkNPC
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $20
	ld [hl], a
	scf
	ret

Script_Disappear: ; 3c696 (f:4696)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3c6a3
	xor a
	ld [hl], a
.asm_3c6a3
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_26: ; 3c6aa (f:46aa)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3c6d7
	ld a, [wScriptBuffer + 2]
	or a
	jr z, .asm_3c6de
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [wScriptBuffer + 2]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
.asm_3c6d7
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

.asm_3c6de
	ld a, [hl]
	or $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	jr .asm_3c6d7

Script_HopNPC: ; 3c6ed (f:46ed)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, asm_3c72e
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld b, $2
	call AdvanceScriptPointer
Script_HopNPC_Finish: ; 3c71a (f:471a)
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $4
	ld [hl], a
	scf
	ret

asm_3c72e
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_2f: ; 3c73a (f:473a)
	ld a, [wcd26]
	ld hl, wScriptBuffer + 1
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

Script_Jump: ; 3c74e (f:474e)
	ld a, [wScriptBuffer + 1]
	ld d, a
	ld a, [wScriptBuffer + 2]
	ld e, a
	inc de
	ld a, [wScriptOffset]
	ld l, a
	ld a, [wScriptOffset + 1]
	ld h, a
	add hl, de
	ld a, l
	ld [wScriptOffset], a
	ld a, h
	ld [wScriptOffset + 1], a
	scf
	ret

Script_StartBattle: ; 3c76a (f:476a)
	ld a, [wScriptBuffer + 2]
	ld a, $1
	ld [wc91d], a
	ld a, [wScriptBuffer + 1]
	ld [wCurWildDenjuuEncounterTableIndex], a
	ld a, [wScriptBuffer + 2]
	ld [wOtherTFangerClass], a
	ld a, [wScriptBuffer + 3]
	ld [wBattleMode], a
	ld b, $4
	call AdvanceScriptPointer
	xor a
	ret

Script_GiveItemQuantity: ; 3c78b (f:478b)
	ld a, [wScriptBuffer + 1]
	ld hl, wItems
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld b, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_TakeItemQuantity: ; 3c7a5 (f:47a5)
	ld a, [wScriptBuffer + 1]
	ld hl, wItems
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld b, a
	ld a, [hl]
	sub b
	ld [hl], a
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_GiveMoney: ; 3c7bf (f:47bf)
	ld a, [wScriptBuffer + 2]
	ld b, a
	ld a, [wScriptBuffer + 1]
	ld c, a
	callba AddOrSubtractMoney
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_TakeMoney: ; 3c7d6 (f:47d6)
	ld a, [wScriptBuffer + 1]
	cpl
	ld c, a
	ld a, [wScriptBuffer + 2]
	cpl
	ld b, a
	inc bc
	callba AddOrSubtractMoney
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_ShakeScreen: ; 3c7f0 (f:47f0)
	ld a, [wScriptBuffer + 1]
	ld c, a
	ld a, [wScriptBuffer + 2]
	ld b, a
	call SetUpScreenShake_
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_PlaySFX: ; 3c802 (f:4802)
	ld a, [wScriptBuffer + 1]
	ld [H_SFX_ID], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_PlayMusic: ; 3c80f (f:480f)
	ld a, [wScriptBuffer + 1]
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_4a: ; 3c822 (f:4822)
	ld a, [wScriptBuffer + 1]
	ld b, a
	ld a, [wPlayerObjectStruct_Duration + 15]
	bit 0, a
	jr z, .no_xor
	xor $2
.no_xor
	cp b
	jr z, .jump
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

.jump
	ld a, [wScriptBuffer + 2]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

Script_IfWonBattle: ; 3c843 (f:4843)
	ld a, [wBattleResult]
	or a
	jr nz, .jump
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.jump
	ld a, [wScriptBuffer + 1]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_56: ; 3c85a (f:485a)
	ld hl, wScriptBuffer + 1
	ld a, [hli]
	ld b, a
	ld c, [hl]
	call PrintMapObjectText_
	ld a, [wcadc]
	cpl
	ld e, a
	ld a, [wcadd]
	cpl
	ld d, a
	inc de
	ld a, [wMoney + 1]
	ld h, a
	ld a, [wMoney]
	ld l, a
	add hl, de
	jr c, .asm_3c881
	ld bc, EVENT_C3B
	call SetEventFlag
	jr .asm_3c887

.asm_3c881
	ld bc, EVENT_C3B
	call ResetEventFlag
.asm_3c887
	ld a, [wcadc]
	ld l, a
	ld a, [wcadd]
	ld h, a
	call DecimalConvertTwoByteFiveDigitNumber
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

DecimalConvertTwoByteFiveDigitNumber: ; 3c899 (f:4899)
; unsigned short hl
; return to wMapHeader (6-byte buffer)
	ld de, wMapHeader
	ld b, $0
	push de
	ld c, $0
	ld de, -10000
.ten_thousand
	inc c
	add hl, de
	jr c, .ten_thousand
	ld de, 10000
	add hl, de
	pop de
	ld a, c
	dec a
	or a
	jr z, .less_than_10000
	add "0"
	ld [de], a
	inc de
	ld b, $1
.less_than_10000
	push de
	ld c, $0
	ld de, -1000
.thousand
	inc c
	add hl, de
	jr c, .thousand
	ld de, 1000
	add hl, de
	pop de
	ld a, c
	dec a
	bit 0, b
	jr nz, .force_thousands
	or a
	jr z, .less_than_1000
.force_thousands
	add "0"
	ld [de], a
	inc de
	ld b, $1
.less_than_1000
	push de
	ld c, $0
	ld de, -100
.hundreds
	inc c
	add hl, de
	jr c, .hundreds
	ld de, 100
	add hl, de
	pop de
	ld a, c
	dec a
	bit 0, b
	jr nz, .force_hundreds
	or a
	jr z, .less_than_100
.force_hundreds
	add "0"
	ld [de], a
	inc de
	ld b, $1
.less_than_100
	push de
	ld c, $0
	ld de, -10
.tens
	inc c
	add hl, de
	jr c, .tens
	ld de, 10
	add hl, de
	pop de
	ld a, c
	dec a
	bit 0, b
	jr nz, .force_tens
	or a
	jr z, .less_than_10
.force_tens
	add "0"
	ld [de], a
	inc de
	ld b, $1
.less_than_10
	ld a, l
	add "0"
	ld [de], a
	inc de
	ld a, "$"
	ld [de], a
	ret

DecimalConvertAndRightAlignTwoByteFiveDigitNumber: ; 3c91b (f:491b)
	call DecimalConvertTwoByteFiveDigitNumber
	ld hl, wMapHeader
	ld b, $6
	ld c, $0
.find_terminator
	ld a, [hli]
	inc c
	dec b
	cp "$"
	jr nz, .find_terminator
	ld a, b
	or a
	ret z
	dec hl
	ld de, wMapHeader + 5
.right_align_loop
	ld a, [hld]
	ld [de], a
	dec de
	dec c
	jr nz, .right_align_loop
	ld hl, wMapHeader
	ld a, $0
.clear_beginning
	ld [hli], a
	dec b
	jr nz, .clear_beginning
	ret

ScriptCommand_57: ; 3c943 (f:4943)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3c95b
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $ff
	jr z, .asm_3c95b
	xor a
	ret

.asm_3c95b
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_WaitPartnerWalk: ; 3c962 (f:4962)
	ld a, [wPartnerDenjuuObjectStruct_Duration + 12]
	cp $ff
	jr z, .asm_3c96b
	xor a
	ret

.asm_3c96b
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_78: ; 3c972 (f:4972)
	xor a
	ld [wcd00], a
	ret

Script_WaitPlayerWalk: ; 3c977 (f:4977)
	ld a, [wPlayerObjectStruct_Duration + 12]
	cp $ff
	jr z, .asm_3c980
	xor a
	ret

.asm_3c980
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_2c: ; 3c987 (f:4987)
	ld hl, Data_3c3b7
	ld a, [wScriptBuffer + 1]
	sla a
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wPartnerDenjuuObjectStruct_Duration + 2], a
	ld a, [hli]
	ld [wPartnerDenjuuObjectStruct_Duration + 3], a
	ld a, [hli]
	ld [wPartnerDenjuuObjectStruct_Duration + 6], a
	ld a, [hl]
	ld [wPartnerDenjuuObjectStruct_Duration + 7], a
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld b, $2
	call AdvanceScriptPointer
	jp Func_3c552

Script_HopAndDisplaceNPC: ; 3c9b4 (f:49b4)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .skip
	ld a, SFX_10
	ld [H_SFX_ID], a
	ld de, Data_3c3b7
	ld a, [wScriptBuffer + 2]
	sla a
	sla a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [de]
	ld [hl], a
	ld b, $3
	call AdvanceScriptPointer
	jp Script_HopNPC_Finish

.skip
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_FacePlayer: ; 3ca06 (f:4a06)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, asm_3ca2b
	call GetDirectionFromObjectToPlayer_
asm_3ca14
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $12
	jr nc, .asm_3ca23
	ld a, b
	add a
	add b
	ld b, a
.asm_3ca23
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, b
	ld [hl], a
asm_3ca2b
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_FaceAwayFromPlayer: ; 3ca32 (f:4a32)
	ld a, [wScriptBuffer + 1]
	add $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, asm_3ca2b
	call GetDirectionFromObjectToPlayer_
	ld a, b
	xor $1
	ld b, a
	jr asm_3ca14

Script_WalkPartner: ; 3ca46 (f:4a46)
	call Func_3c552
	ld a, [wScriptBuffer + 1]
	ld [wPartnerDenjuuObjectStruct_Duration + 12], a
	ld a, [wScriptBuffer + 2]
	ld [wPartnerDenjuuObjectStruct_Duration + 14], a
	ld a, $9
	ld [wPartnerDenjuuObjectStruct_Duration + 18], a
	ld a, $ff
	ld [wPartnerDenjuuObjectStruct_Duration + 15], a
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_SetEvent: ; 3ca66 (f:4a66)
	ld a, [wScriptBuffer + 2]
	ld c, a
	ld a, [wScriptBuffer + 1]
	ld b, a
	call SetEventFlag
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_ResetEvent: ; 3ca78 (f:4a78)
	ld a, [wScriptBuffer + 2]
	ld c, a
	ld a, [wScriptBuffer + 1]
	ld b, a
	call ResetEventFlag
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_IfEvent: ; 3ca8a (f:4a8a)
	ld a, [wScriptBuffer + 2]
	ld c, a
	ld a, [wScriptBuffer + 1]
	ld b, a
	call CheckEventFlag
	jr nz, asm_3ca9e
	ld b, $4
	call AdvanceScriptPointer
	scf
	ret

asm_3ca9e
	ld a, [wScriptBuffer + 3]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

Script_IfNotEvent: ; 3caa8 (f:4aa8)
	ld a, [wScriptBuffer + 2]
	ld c, a
	ld a, [wScriptBuffer + 1]
	ld b, a
	call CheckEventFlag
	jr z, asm_3ca9e
	ld b, $4
	call AdvanceScriptPointer
	scf
	ret

Script_SpawnPartner: ; 3cabc (f:4abc)
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	ld hl, wPartnerDenjuuObjectStruct
	ld a, [wScriptBuffer + 1]
	ld b, a
	inc a
	ld c, a
	and $f0
	add $8
	ld b, a
	ld a, c
	swap a
	and $f0
	ld c, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_SpawnPlayer: ; 3caf0 (f:4af0)
	ld hl, wCurObjectStruct
	ld a, wPlayerObjectStruct % $100
	ld [hli], a
	ld a, wPlayerObjectStruct / $100
	ld [hl], a
	ld hl, wPlayerObjectStruct
	ld de, wScriptBuffer + 1
	call Func_2d4c
	ld de, wPlayerObjectStruct_XCoord
	ld hl, wPlayerObjectStruct_Duration
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
	inc de
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	sla c
	rl a
	sla c
	rl a
	ld [de], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_4c: ; 3cb2a (f:4b2a)
	ld a, [wScriptBuffer + 1]
	cp $2
	jr c, .asm_3cb35
	add $9
	jr .asm_3cb37

.asm_3cb35
	add $0
.asm_3cb37
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3cb3f
	xor a
	ld [hl], a
.asm_3cb3f
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_Special: ; 3cb46 (f:4b46)
	ld a, [wScriptBuffer + 1]
	cp $14
	jr c, .okay
	cp $32
	jr nc, .okay
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.okay
	ld a, [wScriptBuffer + 1]
	cp $0
	jp z, .special_0
	cp $1
	jp z, .special_1
	cp $2
	jr z, .baseball
	cp $64
	jp z, .special_64
	cp $65
	jr z, .special_65
	cp $66
	jr z, .special_66
	cp $67
	jp z, .special_67
	cp $68
	jr z, .special_3_68
	cp $96
	jp z, .special_96
	cp $9
	jp z, .special_9
	cp $3
	jp nc, .special_default
.special_3_68
	ld a, [wPartnerDenjuuObjectStruct_XCoord]
	ld d, a
	ld a, [wPartnerDenjuuObjectStruct_YCoord]
	sub $8
	ld e, a
	callba Func_3375f
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.baseball
	ld b, $1d
	callba Func_33886
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.special_65
	ld b, $1e
	callba Func_33886
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.special_66
	ld c, $10
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3cbe9
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
.asm_3cbe9
	ld c, $11
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3cc09
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
.asm_3cc09
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.special_67: ; 3cc10 (f:4c10)
	ld c, $11
	call ScriptEngine_GetObjectStruct
	jr z, .asm_3cc28
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
.asm_3cc28
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.special_96: ; 3cc2f (f:4c2f)
	call BackupMapObjects_
IF DEF(POWER)
	ld a, CRYPTO
ELSE
	ld a, FUNGUS
ENDC
	ld [wRecruitedDenjuuSpecies], a
	ld a, $5
	ld [wRecruitedDenjuuLevel], a
	ld a, $34
	ld [wSubroutine], a
	ld b, $2
	call AdvanceScriptPointer
	ret

.special_default: ; 3cc47 (f:4c47)
	sub $3
	ld [wSpecialID], a
	call BackupMapObjects_
	ld a, $29
	ld [wSubroutine], a
	ld a, $4
	call StartFade
	ld b, $2
	jp AdvanceScriptPointer

.special_0: ; 3cc5e (f:4c5e)
	ld a, $18
	ld [wSubroutine], a
	ld a, $4
	call StartFade
	ld b, $2
	jp AdvanceScriptPointer

.special_1: ; 3cc6d (f:4c6d)
	call BackupMapObjects_
	ld a, $19
	ld [wSubroutine], a
	ld a, $4
	call StartFade
	ld b, $2
	jp AdvanceScriptPointer

.special_9: ; 3cc7f (f:4c7f)
	call BackupMapObjects_
	ld a, $36
	ld [wSubroutine], a
	ld a, $4
	call StartFade
	ld b, $2
	jp AdvanceScriptPointer

.special_64: ; 3cc91 (f:4c91)
	ld a, $16
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $9
	ld [wCurPlayerSpriteImage], a
	ld hl, wPlayerObjectStruct_Duration + 4
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld hl, wPlayerObjectStruct_Duration
	ld a, $0
	ld [hli], a
	ld a, $16
	ld [hl], a
	ld hl, wPlayerObjectStruct_XCoord
	ld a, $58
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, $20
	ld [wPlayerObjectStruct_Duration + 6], a
	ld a, $52
	ld [wPlayerObjectStruct_Duration + 2], a
	callba Func_39c2f
	ld a, $1
	ld [wTakingAStep], a
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_IncVar: ; 3ccd9 (f:4cd9)
	ld a, [wScriptVar]
	inc a
	ld [wScriptVar], a
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_DecVar: ; 3cce7 (f:4ce7)
	ld a, [wScriptVar]
	dec a
	ld [wScriptVar], a
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_SetVar: ; 3ccf5 (f:4cf5)
	ld a, [wScriptBuffer + 1]
	ld [wScriptVar], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_IfEqual: ; 3cd02 (f:4d02)
	ld a, [wScriptBuffer + 1]
	ld b, a
	ld a, [wScriptVar]
	cp b
	jr nz, .asm_3cd16
	ld a, [wScriptBuffer + 2]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.asm_3cd16
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_IfNotEqual: ; 3cd1d (f:4d1d)
	ld a, [wScriptBuffer + 1]
	ld b, a
	ld a, [wScriptVar]
	cp b
	jr z, .asm_3cd31
	ld a, [wScriptBuffer + 2]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.asm_3cd31
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

Script_GiveDenjuu: ; 3cd38 (f:4d38)
	enable_sram sAddressBook
	ld bc, EVENT_C01
	call ResetEventFlag
	call BankF_FindFirstAddressBookSlotAtLevel0AndClearItIfItExists
	jr z, .found_empty_denjuu_slot
	ld bc, EVENT_C01
	call SetEventFlag
	jp .did_not_find_empty_slot

.found_empty_denjuu_slot
	ld a, [wScriptBuffer + 2]
	ld [hli], a
	ld a, [wScriptBuffer + 3]
	ld [hli], a
	ld a, [wScriptBuffer + 4]
	ld [hli], a
	ld a, [wScriptBuffer + 5]
	ld [hli], a
	ld a, $0
	ld [hli], a
	ld [hli], a
	push hl
	ld hl, $400
	ld b, $0
	ld a, [wScriptBuffer + 1]
	ld c, a
	add hl, bc
	ld d, h
	ld a, l
	pop hl
	ld [hli], a
	ld e, a
	ld a, d
	ld [hli], a
	push hl
	ld bc, -8
	add hl, bc
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ld a, l
	and $ff
	ld c, a
	ld [wFirstEmptySlotInAddressBook], a
	push bc
	callba Func_a40ef
	pop bc
	ld a, [wScriptBuffer + 1]
	cp $5
	jr nz, .skip_nickname
	ld b, $0
	sla c
	rl b
	ld hl, sOwnedDenjuuNicknames
	add hl, bc
	add hl, bc
	add hl, bc
	ld d, h
	ld e, l
	ld hl, Data_2f90e
	ld c, BANK(Data_2f90e)
	ld b, $6
	call FarCopyData_Under256Bytes
.skip_nickname
	pop hl
	push hl
	callba Func_a8539
	pop hl
	ld a, c
	ld [hli], a
	ld a, [wMapNumber]
	ld [hli], a
	ld a, [wScriptBuffer + 1]
	ld c, a
	push hl
	callba CompressStandardPhoneNumber
	pop hl
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, [wWhichPhoneNumberSymbolCode]
	ld [hli], a
	ld a, $2
	ld [hl], a
	call BackupMapObjects_
	ld a, [wScriptBuffer + 2]
	ld [wRecruitedDenjuuSpecies], a
	ld a, [wScriptBuffer + 3]
	ld [wRecruitedDenjuuLevel], a
	ld a, $34
	ld [wSubroutine], a
.did_not_find_empty_slot
	disable_sram
	ld b, $6
	call AdvanceScriptPointer
	xor a
	ret

Script_IfHaveItem: ; 3ce0f (f:4e0f)
	ld a, [wScriptBuffer + 1]
	ld hl, wItems
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wScriptBuffer + 2]
	ld b, a
	ld a, [hl]
	cp b
	jr c, .nope
	ld a, [wScriptBuffer + 3]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.nope
	ld b, $4
	call AdvanceScriptPointer
	scf
	ret

Script_AntennaTreeMapName: ; 3ce34 (f:4e34)
	callba GetCurrentLandmark
	callba GetLandmarkName
	ld b, $0
	ld c, $a6
	callba Func_2c7ce
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld b, $1
	call AdvanceScriptPointer
	ld a, [wScriptDelay]
	or a
	jr nz, .start_delay
	ld a, $8
	ld [wScriptDelay], a
.start_delay
	xor a
	ret

Script_StartRingingPhone: ; 3ce70 (f:4e70)
	ld a, [wPhoneSilentMode]
	or a
	jr nz, .skip_music_and_sfx
	ld a, MUSIC_02
	ld [wMapMusic], a
	call GetMusicBank
	ld [H_MusicID], a
	ld a, SFX_54
	ld [H_SFX_ID], a
.skip_music_and_sfx
	ld a, $4
	ld [wOverworldPhoneCallCooldown], a
	ld a, $1
	ld [wPhoneIsRinging], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_StopRingingPhone: ; 3ce97 (f:4e97)
	ld a, [wPhoneSilentMode]
	or a
	jr nz, .skip_music_and_sfx
	ld a, SFX_01
	ld [H_SFX_ID], a
	ld a, $ff
	ld [wMapMusic], a
	call PlayMapMusic_
.skip_music_and_sfx
	ld a, $0
	ld [wPhoneIsRinging], a
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_SetDShotSignalStrength: ; 3ceb6 (f:4eb6)
	ld a, [wScriptBuffer + 1]
	ld [wDShotReceptionLevel], a
	ld b, $0
	callba Func_a503b
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_5f: ; 3cecd (f:4ecd)
	ld hl, $100
	ld d, $3
asm_3ced2
	push de
	ld a, [wScriptBuffer + 1]
	ld e, a
	ld d, $0
	add hl, de
	ld a, l
	ld [wcdba], a
	ld a, h
	ld [wcdbb], a
	ld a, BANK(ScriptCommand_5f)
	ld [wPrevROMBank], a
	ld c, l
	ld b, h
	pop de
	ld a, d
	call LoadNthStdOBPalette
	ld a, [wcd20]
	or a
	jr z, .okay
	ld a, $1
	ld [wOBPalUpdate], a
.okay
	ld a, $10
	ld c, a
	call ScriptEngine_GetObjectStruct
	jr z, .finish
	ld a, [wCurObjectStruct]
	add $5 ; palette
	ld l, a
	ld a, $3
	ld [hl], a
	jr .finish ; insert trihex's face here

.finish
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_60: ; 3cf13 (f:4f13)
	ld hl, $28c
	ld d, $3
	jr asm_3ced2

ScriptCommand_65: ; 3cf1a (f:4f1a)
	ld hl, $28c
	ld d, $2
	jr asm_3ced2

ScriptCommand_66: ; 3cf21 (f:4f21)
	ld hl, $28c
	ld d, $1
	jr asm_3ced2

ScriptCommand_61: ; 3cf28 (f:4f28)
	ld a, [wScriptBuffer + 1]
	ld b, a
	ld a, [wc912]
	inc a
	cp b
	jr nz, .nope
	ld a, [wScriptBuffer + 2]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.nope
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_67: ; 3cf44 (f:4f44)
	call Func_2928
	ld a, [hJoyNew]
	and ($FF ^ A_BUTTON)
	ld [hJoyNew], a
	ld b, $1
	call AdvanceScriptPointer
	scf
	ret

Script_IfRecruited: ; 3cf54 (f:4f54)
	ld a, [wScriptBuffer + 1]
	ld c, a
	enable_sram sAddressBook
	ld hl, sAddressBook + $1
	ld de, $11
	ld b, ADDRESS_BOOK_SIZE
.loop
	ld a, [hld]
	or a
	jr z, .level_zero
	ld a, [hl]
	cp c
	jr z, .species_matched
.level_zero
	add hl, de
	dec b
	jr nz, .loop
	jr .asm_3cf87

.species_matched
	disable_sram
	ld a, [wScriptBuffer + 2]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.asm_3cf87
	disable_sram
	ld b, $3
	call AdvanceScriptPointer
	scf
	ret

ScriptCommand_6a: ; 3cf93 (f:4f93)
	call BackupMapObjects_
	ld a, $30
	ld [wSubroutine], a
	ld a, $4
	call StartFade
	ld b, $1
	call AdvanceScriptPointer
	ret

Script_SetDShotLevel: ; 3cfa6 (f:4fa6)
	ld a, [wScriptBuffer + 1]
	ld [wDShotLevel], a
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

Script_IfPhoneSilent: ; 3cfb3 (f:4fb3)
	ld a, [wPhoneSilentMode]
	or a
	jr nz, .yup
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

.yup
	ld a, [wScriptBuffer + 1]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

Script_IfRecruitedAllSpecies: ; 3cfca (f:4fca)
	ld hl, wEventFlags + (DENJUU_DEX_CAUGHT_FLAGS >> 3)
	ld b, $15
.loop
	ld a, [hli]
	cp $ff
	jr nz, .nope
	dec b
	jr nz, .loop
	ld a, [hl]
	and $3f
	cp $3f
	jr nz, .nope
	ld a, [wScriptBuffer + 1]
	inc a
	ld b, a
	call AdvanceScriptPointer
	scf
	ret

.nope
	ld b, $2
	call AdvanceScriptPointer
	scf
	ret

BankF_FindFirstAddressBookSlotAtLevel0AndClearItIfItExists: ; 3cfef (f:4fef)
	ld hl, sAddressBook + $1
	ld c, ADDRESS_BOOK_SIZE
	ld de, $10
.loop
	ld a, [hl]
	or a
	jr z, .level_0
	add hl, de
	dec c
	jr nz, .loop
	or $1
	ret

.level_0
	dec hl
	push hl
	ld b, $10
	xor a
.clear_loop
	ld [hli], a
	dec b
	jr nz, .clear_loop
	pop hl
	xor a
	ret

Func_3d00e: ; 3d00e (f:500e)
	ld bc, EVENT_C3C
	call CheckEventFlag
	ret nz
	ld bc, EVENT_C39
	call ResetEventFlag
	ld bc, EVENT_C3A
	call ResetEventFlag
	ld bc, EVENT_C3D
	jp ResetEventFlag
