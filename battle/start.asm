StartBattle::
	ld a, [wSubroutine]
	ld hl, Pointers_7000a
	call GetShortFromTable
	jp [hl]

Pointers_7000a:
	dw Func_70016
	dw Func_70279
	dw Func_7027c
	dw Func_7027f
	dw Func_7028f
	dw Func_7029e

Func_70016: ; 70016 (1c:4016)
	ld hl, wPlayerDenjuu1Species
	call ClearBattleStruct
	ld hl, wPlayerDenjuu2
	call ClearBattleStruct
	ld hl, wPlayerDenjuu3Species
	call ClearBattleStruct
	ld hl, wEnemyDenjuu1
	call ClearBattleStruct
	ld hl, wEnemyDenjuu2Species
	call ClearBattleStruct
	ld hl, wEnemyDenjuu3Species
	call ClearBattleStruct
	ld a, $3
	ld [wPlayerDenjuu1ArrivedStatus], a
	ld [wEnemyDenjuu1ArrivedStatus], a
	xor a
	ld [wCurBattleDenjuu], a
	ld [wCurEnemyDenjuu], a
	inc a
	ld [wCurBattleDenjuu2], a
	ld [wCurEnemyDenjuu2], a
	inc a
	ld [wCurBattleDenjuu3], a
	ld [wCurEnemyDenjuu3], a
	call OpenSRAMBank2
	ld hl, sAddressBook
	ld de, $10
	ld a, [wcdb4]
	ld [wPlayerDenjuu1Field0x0d], a
	addntimes_hl_de
	ld a, [hli]
	ld [wPlayerDenjuu1Species], a
	ld a, [hli]
	ld [wPlayerDenjuu1Level], a
	ld a, [hli]
	ld [wPlayerDenjuu1FD], a
	ld a, [hl]
	ld [wPlayerDenjuu1Field0x0c], a
	xor a
	ld [wd5ba], a
	ld [wd5bb], a
	ld [wd5bc], a
	ld [wd5bd], a
	ld [wd5be], a
	ld [wd5bf], a
	ld [wd5c0], a
	ld [wd5c1], a
	ld [wd5c2], a
	ld [wd5c3], a
	ld [wd5c4], a
	ld [wd5c5], a
	ld [wPlayerDenjuu1AttackedOnItsOwn], a
	ld [wPlayerDenjuu2AttackedOnItsOwn], a
	ld [wPlayerDenjuu3AttackedOnItsOwn], a
	ld [wPlayerDenjuu1LastMoveSelection], a
	ld [wPlayerDenjuu2LastMoveSelection], a
	ld [wPlayerDenjuu3LastMoveSelection], a
	ld [wd4a8], a
	ld [wd4a9], a
	ld [wd4aa], a
	ld [wd450], a
	ld [wd451], a
	ld [wd452], a
	ld [wd453], a
	ld [wd430], a
	ld [wd431], a
	ld [wd432], a
	ld [wd433], a
	ld [wd456], a
	ld a, $ff
	ld [wd4ca], a
	ld [wd4cb], a
	ld [wd4cc], a
	ld [wd4cd], a
	ld a, [wd403]
	cp $1
	jr z, .tfanger
	cp $2
	jp z, .scripted_wild
	jp .wild_denjuu

.tfanger
	call LoadEnemyTFangerParty_
	ld hl, wEnemyDenjuu1Level
	ld de, $16
	ld b, $0
.tfanger_level_loop
	add hl, de
	inc b
	ld a, b
	cp $3
	jr z, .got_tfanger_party_size
	ld a, [hl]
	cp $0
	jr nz, .tfanger_level_loop
.got_tfanger_party_size
	ld a, b
	ld [wEnemyPartySize], a
	ld a, [wEnemyPartySize]
	cp $1
	jp z, .enemy_has_only_one
	cp $2
	jr z, .enemy_has_two_denjuu
	ld a, $1
	ld [wEnemyDenjuu3ArrivedStatus], a
	call Func_0671
	ld a, [wEnemyDenjuu3Field0x08]
	ld b, a
	ld a, c
	call Func_05e3
	ld a, [wd4ec]
	sla a
	sla a
	sla a
	sla a
	sla a
	ld a, a
	ld [wEnemyDenjuu3Field0x08], a
	ld a, [wcd00]
	cp $1
	jp z, .skip_field_c_enemy_3
	call Func_702a1
	ld [wEnemyDenjuu3Field0x0c], a
.skip_field_c_enemy_3
	ld b, $0
	ld a, [wEnemyDenjuu3Species]
	ld c, a
	ld hl, DENJUU_DEX_SEEN_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
.enemy_has_two_denjuu
	ld a, $1
	ld [wEnemyDenjuu2ArrivedStatus], a
	call Func_0671
	ld a, [wEnemyDenjuu2Field0x08]
	ld b, a
	ld a, c
	call Func_05e3
	ld a, [wd4ec]
	sla a
	sla a
	sla a
	sla a
	sla a
	ld a, a
	ld [wEnemyDenjuu2Field0x08], a
	ld a, [wcd00]
	cp $1
	jp z, .skip_field_c_enemy_2
	call Func_702a1
	ld [wEnemyDenjuu2Field0x0c], a
.skip_field_c_enemy_2
	ld b, $0
	ld a, [wEnemyDenjuu2]
	ld c, a
	ld hl, DENJUU_DEX_SEEN_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
.enemy_has_only_one
	ld a, [wcd00]
	cp $1
	jp z, .skip_field_c_enemy_1
	call Func_702a1
	ld [wEnemyDenjuu1Field0x0c], a
.skip_field_c_enemy_1
	jp .finish_load_enemy

.scripted_wild
	call LoadScriptedEnemyDenjuu_
	ld a, $1
	ld [wEnemyPartySize], a
	jp .finish_load_enemy

.wild_denjuu
	call ChooseWildDenjuuEncounter_
	ld a, [wTempWildDenjuuSpecies]
	dec a
	ld [wEnemyDenjuu1], a
	ld a, [wTempWildDenjuuLevel]
	ld b, a
	call Random
	cp $40
	jr c, .increase_level
	cp $80
	jr c, .decrease_level
	ld a, b
	jr .done_wild_level_variation

.increase_level
	ld a, b
	inc a
	jr .done_wild_level_variation

.decrease_level
	ld a, b
	dec a
.done_wild_level_variation
	ld [wEnemyDenjuu1Level], a
	call Func_702a1
	ld [wEnemyDenjuu1Field0x0c], a
	ld a, $1
	ld [wEnemyPartySize], a
.finish_load_enemy
	ld b, $0
	ld a, [wEnemyDenjuu1Species]
	ld c, a
	ld hl, DENJUU_DEX_SEEN_FLAGS
	add hl, bc
	ld b, h
	ld c, l
	call SetEventFlag
	ld a, [wc907]
	cp $4
	jr c, .okay
	ld a, $3
.okay
	ld [wd404], a
	cp $0
	jr z, .okay2
	dec a
.okay2
	ld [wd42b], a
	ld [wd429], a
	ld a, $3
	cp $4
	jr c, .okay3
	ld a, $3
.okay3
	ld [wd405], a
	cp $0
	jr z, .okay4
	dec a
.okay4
	ld [wd42c], a
	ld [wd42a], a
	call OpenSRAMBank2
	ld hl, sAddressBook + 1
	ld de, $10
	ld b, $0
	ld a, $fe
	ld c, a
	ld a, b
	cp $0
	jr z, .handleLoop
; b is never not 0 at this point
.load_player_contacts_loop
	add hl, de
.handleLoop
	ld a, [hl]
	cp $0
	jr z, .empty_entry
	inc b
.empty_entry
	dec c
	ld a, c
	jr nz, .load_player_contacts_loop
	ld a, b
	ld [wd40c], a
	ld a, [wd40c]
	ld b, a
	dec b
	ld a, [wd42b]
	cp b
	jr c, .okay5
	ld a, b
	ld [wd42b], a
	ld [wd429], a
.okay5
	ld a, $2
	ld [wd4e5], a
	ld a, $1
	ld [wd4e6], a
	ld a, $1
	ld [wd4e7], a
	xor a
	ld [wd412], a
	ld [wBattleSubroutine], a
	ld [wd43a], a
	ld a, $10
	ld [wcf96], a
	call CloseSRAM
	jp IncrementSubroutine

Func_70279: ; 70279 (1c:4279)
	jp Func_704af

Func_7027c: ; 7027c (1c:427c)
	jp Func_70afd

Func_7027f: ; 7027f (1c:427f)
	xor a
	ld [wSubroutine], a
	ld [wBattleSubroutine], a
	ld [wd401], a
	ld a, $7
	ld [wGameRoutine], a
	ret

Func_7028f: ; 7028f (1c:428f)
	xor a
	ld [MBC3SRamEnable], a
	ld a, $a
	ld [wSubroutine], a
	ld a, $5
	ld [wGameRoutine], a
	ret

Func_7029e: ; 7029e (1c:429e)
	jp Func_717f7

Func_702a1: ; 702a1 (1c:42a1)
	call Random
	cp $14
	jr c, .asm_702d4
	cp $28
	jr c, .asm_702d8
	cp $3c
	jr c, .asm_702dc
	cp $50
	jr c, .asm_702e0
	cp $64
	jr c, .asm_702e4
	cp $78
	jr c, .asm_702e8
	cp $8c
	jr c, .asm_702ec
	cp $a0
	jr c, .asm_702f0
	cp $b4
	jr c, .asm_702f4
	cp $c8
	jr c, .asm_702f8
	cp $dc
	jr c, .asm_702fc
	cp $f0
	jr c, .asm_70300
.asm_702d4
	ld a, $0
	jr .asm_70302

.asm_702d8
	ld a, $1
	jr .asm_70302

.asm_702dc
	ld a, $2
	jr .asm_70302

.asm_702e0
	ld a, $3
	jr .asm_70302

.asm_702e4
	ld a, $4
	jr .asm_70302

.asm_702e8
	ld a, $5
	jr .asm_70302

.asm_702ec
	ld a, $6
	jr .asm_70302

.asm_702f0
	ld a, $7
	jr .asm_70302

.asm_702f4
	ld a, $8
	jr .asm_70302

.asm_702f8
	ld a, $9
	jr .asm_70302

.asm_702fc
	ld a, $a
	jr .asm_70302

.asm_70300
	ld a, $b
.asm_70302
	ret

ClearBattleStruct: ; 70303 (1c:4303)
	ld a, $16
	ld b, a
	xor a
.asm_70307
	ld [hli], a
	dec b
	jr nz, .asm_70307
	ret

Func_7030c: ; 7030c (1c:430c)
	cp $1
	jr z, .asm_7031d
	cp $2
	jr z, .asm_70322
	cp $3
	jr z, .asm_70327
	cp $4
	jr z, .asm_70340
	ret

.asm_7031d
	ld c, $32
	jp Func_3abb

.asm_70322
	ld c, $33
	jp Func_3abb

.asm_70327
	ld c, $33
	call Func_3abb
	ld a, $1f
	ld b, a
	ld a, l
	sub b
	ld l, a
	ld c, $34
	call Func_3abb
	ld de, $20
	add hl, de
	ld c, $35
	jp Func_3abb

.asm_70340
	ld c, $33
	call Func_3abb
	inc l
	ld c, $36
	call Func_3abb
	dec l
	ld a, $1f
	ld b, a
	ld a, l
	sub b
	ld l, a
	ld c, $37
	jp Func_3abb

Func_70357: ; 70357 (1c:4357)
	ld bc, wStringBuffer
	call Func_70360
	jp Func_70380

Func_70360: ; 70360 (1c:4360)
	ld hl, wd420
	ld a, $8
	ld [wd45a], a
.asm_70368
	ld a, [bc]
	cp $c0
	jr z, .asm_70379
	ld [hl], a
	inc hl
	inc bc
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	jr nz, .asm_70368
.asm_70379
	ld a, $e0
	ld [hl], a
	ld hl, wd420
	ret

Func_70380: ; 70380 (1c:4380)
	ld de, wd4b1
	ld b, $9
.asm_70385
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_70385
	ret

Func_7038c: ; 7038c (1c:438c)
	ld a, $0
	call Func_0543
	jp Func_70394

Func_70394: ; 70394 (1c:4394)
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_703a2: ; 703a2 (1c:43a2)
	ld a, [wd40d]
	cp $1
	jr z, .asm_703ad
	ld a, $18
	jr .asm_703af

.asm_703ad
	ld a, $48
.asm_703af
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $80
	ld [wSpriteInitYCoordBuffers + 0], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_703c4: ; 703c4 (1c:43c4)
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld [wOAMAnimation05_PriorityFlags], a
	ld [wOAMAnimation06_PriorityFlags], a
	ld [wOAMAnimation07_PriorityFlags], a
	ld [wOAMAnimation08_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_703e3: ; 703e3 (1c:43e3)
	ld bc, EVENT_215
	call CheckEventFlag
	jp z, .flag_not_set
	ld a, [wCurBattleDenjuu]
	cp $1
	jr z, .check_2
	cp $2
	jr z, .check_3
	ld a, [wPlayerDenjuu1]
	jr .check_angios_or_gymnos

.check_2
	ld a, [wPlayerDenjuu2Species]
	jr .check_angios_or_gymnos

.check_3
	ld a, [wPlayerDenjuu3Species]
.check_angios_or_gymnos
	cp ANGIOS
	jr z, .angios_or_gymnos_in_party
	cp ANGIORN
	jr z, .angios_or_gymnos_in_party
	cp ANGIEON
	jr z, .angios_or_gymnos_in_party
	cp ANGILANCE
	jr z, .angios_or_gymnos_in_party
	cp ANGIPOWER
	jr z, .angios_or_gymnos_in_party
	cp ANGIGORGO
	jr z, .angios_or_gymnos_in_party
	cp ANGIOROS
	jr z, .angios_or_gymnos_in_party
	cp GYMNOS
	jr z, .angios_or_gymnos_in_party
	cp GYMRACE
	jr z, .angios_or_gymnos_in_party
	cp GYMGANON
	jr z, .angios_or_gymnos_in_party
	cp GYMGARTH
	jr z, .angios_or_gymnos_in_party
	cp GYMBARON
	jr z, .angios_or_gymnos_in_party
	cp GYMZYRUS
	jr z, .angios_or_gymnos_in_party
	cp GYMZATAN
	jr z, .angios_or_gymnos_in_party
.flag_not_set
	ld a, $0
	ld [wd4ab], a
	ret

.angios_or_gymnos_in_party
	ld a, $1
	ld [wd4ab], a
	ret

Func_70448: ; 70448 (1c:4448)
	push bc
	push hl
	ld a, [wCurDenjuuBufferSpecies]
	ld b, a
	ld hl, Data_70480
.is_in_array
	ld a, [hli]
	cp $ff
	jr z, .nope
	cp b
	jr nz, .is_in_array
	ld a, b
	cp DENDEL
	jr c, .not_dendel_or_teletel
	add $2
.not_dendel_or_teletel
	lb bc, $1, $0
	jr .finish

.nope
	ld a, [wd409]
	lb bc, $2, $a0
	sub $14
.finish
	add c
	jr nc, .okay
	inc b
.okay
	ld c, a
	ld a, BANK(Func_70448)
	ld [wPrevROMBank], a
	ld a, [wd459]
	call Func_1196
	pop hl
	pop bc
	ret

Data_70480:
	db ARAKUIDA
	db FUNGBOOST
	db GYPSOPHI
	db GONUM
	db GOLAKING
	db KANZOU
	db GENTIANA
	db YARROW
	db DOOMSDAY
	db DENDEL
	db TELETEL
	db $ff

Func_7048c: ; 7048c (1c:448c)
	ld a, [wBattleTurn]
	cp $1
	jr z, .asm_704a1
	ld d, $0
	ld a, [wCurBattleDenjuu]
	ld e, a
	ld hl, wd5ba
	add hl, de
	ld a, [hl]
	inc a
	ld [hl], a
	ret

.asm_704a1
	ld d, $0
	ld a, [wCurEnemyDenjuu]
	ld e, a
	ld hl, wd5bd
	add hl, de
	ld a, [hl]
	inc a
	ld [hl], a
	ret

Func_704af: ; 704af (1c:44af)
	ld a, [wBattleSubroutine]
	ld hl, Pointers_704b9
	call GetShortFromTable
	jp [hl]

Pointers_704b9:
	dw BattleStart_Reset
	dw BattleStart_Init
	dw Func_70541
	dw Func_70693
	dw Func_706b6
	dw Func_70724
	dw Func_70730
	dw Func_70755
	dw Func_70857
	dw Func_708c2
	dw Func_7091d
	dw Func_70929
	dw Func_70945
	dw Func_70957
	dw Func_70961

BattleStart_Reset:
	jp NextBattleSubroutine

BattleStart_Init:
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $12
	call GetCGB_BGLayout_
	ld bc, $4
	call GetCGB_OBLayout_
	ld bc, $f
	call DecompressGFXByIndex_
	ld a, $28
	call Func_3eb9
	call Func_70500
	jp NextBattleSubroutine

Func_70500: ; 70500 (1c:4500)
	ld a, [wCurBackground]
	call LoadWildBattleBackgroundGFX
	ld a, [wCurBackground]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, $60
	ld a, [wc93b]
	cp $14
	jr nc, .asm_7051e
	cp $4
	jr nc, .asm_70521
.asm_7051e
	ld hl, $380
.asm_70521
	ld a, [wCurBackground]
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	push hl
	pop bc
	push bc
	ld a, $3
	call Func_10ee
	pop bc
	inc bc
	ld a, $4
	call Func_10ee
	ld a, $1
	ld [wdd06], a
	ret

Func_70541:
	ld a, $20
	ld [wd4ee], a
	lb bc, 0, 0
	ld e, $b
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld e, $40
	ld a, [wCurBackground]
	add e
	ld e, a
	lb bc, 0, 4
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $40
	ld a, [wCurBackground]
	add e
	ld e, a
	ld bc, $4
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 2, 1
	ld e, $84
	ld a, $0
	call LoadStdBGMapLayout_
	hlbgcoord 16, 2
	ld a, [wc907]
	call Func_7030c
	ld a, $5
	ld [wca65], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, [wd43a]
	cp $0
	jr z, .asm_705d3
	ld a, [wEnemyDenjuu1Species]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_1764
	ld a, [wEnemyDenjuu1Species]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $50
	call GetAndPrintName75CenterAlign
	ld bc, $b01
	ld e, $97
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wEnemyDenjuu1Level]
	hlbgcoord 11, 2
	ld c, $1
	call Func_1430
	jp Func_7068b

.asm_705d3
	xor a
	ld [wd40e], a
	ld [wd40d], a
	ld a, $12
	call GetMusicBank
	ld [H_MusicID], a
	ld a, [wd403]
	cp $0
	jr z, .asm_7062c
	cp $2
	jr z, .asm_7062c
	ld a, [wd406]
	dec a
	push af
	ld de, VTilesShared tile $00
	call LoadTFangerPic_
	pop af
	call Func_1756
	ld a, [wEnemyDenjuu1Species]
	ld c, $0
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	ld a, [wd406]
	dec a
	ld de, TFangerNames + 8
	ld bc, VTilesBG tile $50
	call GetAndPrintName75CenterAlign
	ld a, [wd406]
	dec a
	ld [wd435], a
	ld hl, TFangerNames + 8
	call Get8CharName75
	call Func_70357
	ld c, $71
	call Func_3d02
	jp Func_7068b

.asm_7062c
	ld a, [wEnemyDenjuu1Species]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_1764
	ld a, [wEnemyDenjuu1]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $50
	call GetAndPrintName75CenterAlign
	lb bc, 11, 1
	ld e, $97
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wEnemyDenjuu1Level]
	hlbgcoord 11, 2
	ld c, $1
	call Func_1430
	ld a, [wEnemyDenjuu1]
	ld [wd435], a
	ld hl, DenjuuNames
	call Get8CharName75
	call Func_70357
	ld a, [wd403]
	cp $2
	jr z, .asm_7067b
	ld c, $b
	call Func_3d02
	jp Func_7068b

.asm_7067b
	ld c, $71
	call Func_3d02
	jp Func_7068b

Func_70683:
	ld a, $0
	ld [wd45d], a
	ld [wd45e], a
Func_7068b: ; 7068b (1c:468b)
	ld a, $4
	call Func_050a
	jp NextBattleSubroutine

Func_70693:
	ld a, [wd43a]
	cp $0
	jr z, .asm_706ac
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wd43a], a
	ld a, $6
	ld [wBattleSubroutine], a
	ret

.asm_706ac
	ld a, $2
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_706b6:
	call Func_0530
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, [wd403]
	cp $0
	jp z, Func_7071e
	cp $2
	jp z, Func_7071e
	ld a, [wEnemyDenjuu1]
	call Func_1764
	ld a, $1
	ld [wBGPalUpdate], a
	lb bc, 6, 5
	ld e, $96
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wEnemyDenjuu1Species]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $50
	call GetAndPrintName75CenterAlign
	lb bc, 11, 1
	ld e, $97
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wEnemyDenjuu1Level]
	hlbgcoord 11, 2
	ld c, $1
	call Func_1430
	ld a, [wEnemyDenjuu1Species]
	ld [wd435], a
	ld hl, DenjuuNames
	call Get8CharName75
	call Func_70357
	ld c, $23
	call Func_3d02
	ld a, $52
	ld [H_SFX_ID], a
	jp NextBattleSubroutine

Func_7071e: ; 7071e (1c:471e)
	ld a, $6
	ld [wBattleSubroutine], a
	ret

Func_70724:
	call Func_0530
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	jp NextBattleSubroutine

Func_70730:
	ld c, $26
	call Func_3d02
	ld a, $0
	call Func_0543
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	call Func_70aca
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	jp NextBattleSubroutine

Func_70755:
	call Func_3cd0
	call Func_0530
	ld a, [hJoyNew]
	and D_UP
	jr z, .asm_70784
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd40e]
	cp $0
	jr z, .asm_70775
	ld a, $0
	ld [wd40e], a
	jp Func_70aca

.asm_70775
	ld a, [wd40d]
	cp $1
	jr z, .asm_70784
	ld a, $1
	ld [wd40e], a
	jp Func_70aca

.asm_70784
	ld a, [hJoyNew]
	and D_DOWN
	jr z, .asm_707b2
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd40e]
	cp $1
	jr z, .asm_707aa
	ld a, [wd40d]
	cp $1
	jr nz, .asm_707a2
	ld a, $0
	ld [wd40d], a
.asm_707a2
	ld a, $1
	ld [wd40e], a
	jp Func_70aca

.asm_707aa
	ld a, $0
	ld [wd40e], a
	jp Func_70aca

.asm_707b2
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_707db
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $0
	jr z, .asm_707cc
	ld a, $0
	ld [wd40d], a
	jp Func_70aca

.asm_707cc
	ld a, [wd40e]
	cp $1
	jr z, .asm_707db
	ld a, $1
	ld [wd40d], a
	jp Func_70aca

.asm_707db
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .asm_70802
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $1
	jr z, .asm_707fa
	ld a, $1
	ld [wd40d], a
	ld a, $0
	ld [wd40e], a
	jp Func_70aca

.asm_707fa
	ld a, $0
	ld [wd40d], a
	jp Func_70aca

.asm_70802
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_70832
	ld a, $3
	ld [H_SFX_ID], a
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd40e]
	cp $1
	jr z, .asm_7082a
	ld a, [wd40d]
	cp $1
	jr z, .asm_70838
	ld a, $b
	ld [wBattleSubroutine], a
	ret

.asm_7082a
	ld a, $4
	call Func_050a
	jp NextBattleSubroutine

.asm_70832
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_70856
.asm_70838
	ld a, $57
	ld [H_SFX_ID], a
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, $1e
	ld [wd45a], a
	ld c, $11
	call Func_3d02
	ld a, $9
	ld [wBattleSubroutine], a
	ret

.asm_70856
	ret

Func_70857:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wEnemyDenjuu1]
	ld [wd5b6], a
	ld a, [wEnemyDenjuu1Level]
	ld [wd5b7], a
	ld a, [wEnemyDenjuu1Field0x0c]
	ld [wd5b8], a
	ld a, $1
	ld [wd4b0], a
	ld a, [wEnemyDenjuu2Level]
	cp $0
	jr z, .asm_708b5
	ld a, [wEnemyDenjuu2Species]
	ld [wd5b9], a
	ld a, [wEnemyDenjuu2Level]
	ld [wd5ba], a
	ld a, [wEnemyDenjuu2Field0x0c]
	ld [wd5bb], a
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
	ld a, [wEnemyDenjuu3Level]
	cp $0
	jr z, .asm_708b5
	ld a, [wEnemyDenjuu3]
	ld [wd5bc], a
	ld a, [wEnemyDenjuu3Level]
	ld [wd5bd], a
	ld a, [wEnemyDenjuu3Field0x0c]
	ld [wd5be], a
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.asm_708b5
	xor a
	ld [wMoveAnimationSubroutine], a
	ld [wd415], a
	ld a, $9
	ld [wGameRoutine], a
	ret

Func_708c2:
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	cp $0
	jr z, .asm_708d9
	jp Func_0530

.asm_708d9
	ld a, [wcb3f]
	cp $1
	jr z, .asm_70915
	ld a, [wd403]
	cp $0
	jr nz, .asm_70915
	call Func_70a99
	cp $0
	jr z, .asm_70915
	call OpenSRAMBank2
	ld hl, sAddressBook + $02
	ld a, [wcdb4]
	call Func_3d0e
	ld a, [hl]
	cp $1
	jr c, .asm_70902
	sub $1
	ld [hl], a
.asm_70902
	call CloseSRAM
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, $d
	ld [wBattleSubroutine], a
	ret

.asm_70915
	ld c, $12
	call Func_3d02
	jp NextBattleSubroutine

Func_7091d:
	call Func_0530
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	jp NextBattleSubroutine

Func_70929:
	ld a, [wd40c]
	cp $50
	jr c, .asm_7093d
	ld a, $1
	ld [wd45a], a
	ld c, $96
	call Func_3d02
	jp NextBattleSubroutine

.asm_7093d
	ld a, $1
	ld [wd45a], a
	jp NextBattleSubroutine

Func_70945:
	call Func_0530
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	ret nz
	xor a
	ld [wBattleSubroutine], a
	jp IncrementSubroutine

Func_70957:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_70961:
	xor a
	ld [wBattleSubroutine], a
	ld a, $4
	ld [wSubroutine], a
	ret

Func_7096b:
	ld a, [wd406]
	hlbgcoord 0, 0
	ld c, $0
	call Func_1430
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_709a9
	ld a, [wd406]
	cp $24
	jp z, Func_709db
	inc a
	ld [wd406], a
	ld a, [wd406]
	push af
	ld de, VTilesShared tile $00
	call LoadTFangerPic_
	pop af
	call Func_1756
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wd406]
	ld de, $4578
	ld bc, VTilesBG tile $50
	call GetAndPrintName75LeftAlign_
	ret

.asm_709a9
	ld a, [wJoyNew]
	and D_LEFT
	jr z, Func_709db
	ld a, [wd406]
	cp $0
	jp z, Func_709db
	dec a
	ld [wd406], a
	ld a, [wd406]
	push af
	ld de, VTilesShared tile $00
	call LoadTFangerPic_
	pop af
	call Func_1756
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wd406]
	ld de, $4578
	ld bc, VTilesBG tile $50
	call GetAndPrintName75LeftAlign_
Func_709db: ; 709db (1c:49db)
	ret

Func_709dc:
	ld a, [wEnemyDenjuu1Species]
	inc a
	hlbgcoord 0, 0
	ld c, $0
	call Func_1430
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_70a1a
	ld a, [wEnemyDenjuu1]
	cp $ad
	jp z, Func_70a4c
	inc a
	ld [wEnemyDenjuu1Species], a
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_1764
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wEnemyDenjuu1Species]
	ld de, $4000
	ld bc, VTilesBG tile $50
	call GetAndPrintName75LeftAlign_
	ret

.asm_70a1a
	ld a, [wJoyNew]
	and D_LEFT
	jr z, Func_70a4c
	ld a, [wEnemyDenjuu1Species]
	cp $0
	jp z, Func_70a4c
	dec a
	ld [wEnemyDenjuu1], a
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_1764
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wEnemyDenjuu1]
	ld de, $4000
	ld bc, VTilesBG tile $50
	call GetAndPrintName75LeftAlign_
	ret

Func_70a4c: ; 70a4c (1c:4a4c)
	ret

Func_70a4d:
	ld a, [hJoyNew]
	and START
	jr z, .asm_70a98
	ld a, $4
	ld [sAddressBook + $00], a
	ld a, $5
	ld [sAddressBook + $01], a
	ld a, $0
	ld [sAddressBook + $04], a
	ld a, $64
	ld [sAddressBook + $02], a
	ld a, $0
	ld [sAddressBook + $10], a
	ld [sAddressBook + $20], a
	ld [sAddressBook + $30], a
	ld a, $0
	ld [sAddressBook + $14], a
	ld [sAddressBook + $24], a
	ld [sAddressBook + $34], a
	ld a, $0
	ld [sAddressBook + $11], a
	ld [sAddressBook + $21], a
	ld [sAddressBook + $31], a
	ld a, $0
	ld [sAddressBook + $12], a
	ld [sAddressBook + $22], a
	ld [sAddressBook + $32], a
	ld a, $0
	ld a, [wPlayerDenjuu1Field0x0d]
.asm_70a98
	ret

Func_70a99: ; 70a99 (1c:4a99)
	ld a, [wPlayerDenjuu1Level]
	ld b, a
	ld a, [wEnemyDenjuu1Level]
	cp b
	jr nc, .asm_70ab6
	ld a, [wPlayerDenjuu1Speed]
	ld b, a
	ld a, [wEnemyDenjuu1Speed]
	cp b
	jr nc, .asm_70ab6
	call Random
	cp $55
	jr c, .asm_70ac4
	jr .asm_70abe

.asm_70ab6
	call Random
	cp $c8
	jp c, .asm_70ac4
.asm_70abe
	ld a, $1
	ld [wd5cd], a
	ret

.asm_70ac4
	ld a, $0
	ld [wd5cd], a
	ret

Func_70aca: ; 70aca (1c:4aca)
	ld a, [wd40e]
	cp $1
	jr z, .asm_70ad8
	ld a, $70
	ld [wSpriteInitYCoordBuffers + 0], a
	jr .asm_70add

.asm_70ad8
	ld a, $80
	ld [wSpriteInitYCoordBuffers + 0], a
.asm_70add
	ld a, [wd40d]
	cp $1
	jr z, .asm_70aeb
	ld a, $e
	ld [wSpriteInitXCoordBuffers + 0], a
	jr .asm_70af0

.asm_70aeb
	ld a, $4e
	ld [wSpriteInitXCoordBuffers + 0], a
.asm_70af0
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_70afd: ; 70afd (1c:4afd)
	ld a, [wBattleSubroutine]
	ld hl, Pointers_70b07
	call GetShortFromTable
	jp [hl]

Pointers_70b07:
	dw Func_70b53
	dw Func_70bb6
	dw Func_70bca
	dw Func_70d22
	dw Func_70d39
	dw Func_70d63
	dw Func_70d81
	dw Func_70ffd
	dw Func_71033
	dw Func_7106c
	dw Func_71097
	dw Func_710ae
	dw Func_711cf
	dw Func_711d9

String_70b23: db "よベるでんじゅう"
String_70b2b: db "がいません!  "
String_70b33: db "ひき よベます "
String_70b3b: db " よベません! "
String_70b43: db "だれもよベません"
String_70b4b: db "リスト  /  "

Func_70b53:
	ld a, [wd43a]
	cp $1
	jp z, Func_70bae
	xor a
	ld [wBattleMenuSelection], a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	ld [wd408], a
	ld [wcb00], a
	ld [wd44e], a
	ld [wd4a0], a
	ld [wd4a1], a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd40a], a
	ld [wd435], a
	ld [wd45a], a
	ld a, $1
	ld [wd415], a
	ld a, $1
	ld [wd42e], a
	ld a, [wd40c]
	cp $1
	jp z, Func_70bae
	ld a, [wd404]
	cp $1
	jp z, Func_70bae
	call Func_7122c
	call CloseSRAM
	call Func_71408
	jr Func_70bae

Func_70bae: ; 70bae (1c:4bae)
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_70bb6:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd43a]
	or a
	jp z, Func_70bc7
	call Func_712c9
Func_70bc7: ; 70bc7 (1c:4bc7)
	jp NextBattleSubroutine

Func_70bca:
	ld bc, $12
	call GetCGB_BGLayout_
	ld a, $28
	call Func_3eb9
	ld bc, $15
	call DecompressGFXByIndex_
	ld hl, VTilesShared tile $00
	call Func_717c8
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, $390
	add hl, de
	push hl
	pop bc
	xor a
	call Func_10ee
	ld hl, VTilesBG tile $40
	ld a, $20
	call ClearString
	ld bc, $0
	ld e, $d
	ld a, $0
	call LoadStdBGMapLayout_
	ld bc, $0
	ld e, $d
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $0
	ld e, $b7
	ld a, $0
	call LoadStdBGMapLayout_
	hlbgcoord 2, 4
	ld a, [wc907]
	call Func_7030c
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, [wd40c]
	cp $1
	jp z, Func_70cb9
	ld a, [wd404]
	cp $1
	jp z, Func_70cb9
	ld a, [wd4b0]
	cp $0
	jp z, Func_70cb9
	ld a, [wd4b0]
	ld b, a
	ld a, [wd429]
	cp b
	jr c, .asm_70c56
	ld a, [wd4b0]
	ld [wd42b], a
	ld a, [wd42b]
	ld [wd429], a
.asm_70c56
	ld h, $0
	ld a, [wd42b]
	ld l, a
	call PrintNumHL
	ld c, $6a
	call Func_3d02
	ld bc, $0
	ld e, $95
	ld a, $0
	call LoadStdBGMapAttrLayout_
	call OpenSRAMBank2
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_71738
	ld hl, sAddressBook + $00
	call Func_3d0e
	ld a, [hl]
	ld [wd490], a
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call Func_175f
	ld a, [wd4b0]
	dec a
	ld b, $0
	ld a, a
	ld c, a
	ld d, $0
	ld a, $3
	ld e, a
	call Func_0628
	ld a, c
	ld [wd4a1], a
	ld a, $1
	ld [wd415], a
	call Func_71301
	call Func_7131f
	call Func_71374
	call Func_715ce
	call Func_71744
	jr asm_70cf4

Func_70cb9: ; 70cb9 (1c:4cb9)
	ld hl, VTilesShared tile $38
	ld a, $38
	call ClearString
	ld bc, $b06
	ld e, $83
	ld a, $0
	call LoadStdBGMapLayout_
	ld de, String_70b43
	ld hl, VTilesBG tile $18
	ld b, $8
	call PlaceString_
	ld a, [wd40c]
	cp $1
	jr z, .asm_70ceb
	ld a, [wd404]
	cp $1
	jr z, .asm_70cef
	ld a, [wd4b0]
	cp $0
	jr z, .asm_70cef
.asm_70ceb
	ld c, $33
	jr .asm_70cf1

.asm_70cef
	ld c, $6b
.asm_70cf1
	call Func_3d02
asm_70cf4
	ld de, String_70b4b
	ld hl, VTilesBG tile $10
	ld b, $8
	call PlaceString_
	ld a, [wd4a1]
	inc a
	hlbgcoord 17, 1
	ld c, $1
	call Func_1430
	ld a, [wd4a0]
	inc a
	hlbgcoord 14, 1
	ld c, $1
	call Func_1430
	call CloseSRAM
	ld a, $1
	call Func_050a
	jp NextBattleSubroutine

Func_70d22:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	call Func_7038c
	ld a, [wd4a1]
	cp $1
	jr c, .asm_70d36
	call Func_712aa
.asm_70d36
	jp NextBattleSubroutine

Func_70d39:
	ld a, [wd40c]
	cp $1
	jr z, .asm_70d60
	ld a, [wd404]
	cp $1
	jr z, .asm_70d60
	ld a, [wd4b0]
	cp $0
	jp z, .asm_70d60
	call Func_713de
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, $6
	ld [wBattleSubroutine], a
	ret

.asm_70d60
	jp NextBattleSubroutine

Func_70d63:
	call Func_0530
	ld a, [wTextSubroutine]
	cp $9
	ret nz
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, $c
	ld [wBattleSubroutine], a
	ret

Func_70d81:
	call Func_0530
	call Func_3cd0
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_70db0
	ld a, [wd4a1]
	cp $0
	jp z, Func_70e18
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd4a0]
	cp $0
	jr z, .asm_70da8
	dec a
	ld [wd4a0], a
	jr .asm_70dda

.asm_70da8
	ld a, [wd4a1]
	ld [wd4a0], a
	jr .asm_70dda

.asm_70db0
	ld a, [wJoyNew]
	and D_RIGHT
	jp z, Func_70e18
	ld a, [wd4a1]
	cp $0
	jp z, Func_70e18
	ld a, $2
	ld [H_SFX_ID], a
	ld a, [wd4a1]
	ld b, a
	ld a, [wd4a0]
	cp b
	jr z, .asm_70dd5
	inc a
	ld [wd4a0], a
	jr .asm_70dda

.asm_70dd5
	ld a, $0
	ld [wd4a0], a
.asm_70dda
	xor a
	ld [wBattleMenuSelection], a
	ld a, $0
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld hl, VTilesBG tile $40
	ld a, $18
	call ClearString
	call Func_7131f
	call Func_71301
	call Func_71374
	call Func_715ce
	call Func_71744
	call CloseSRAM
	xor a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_71467
	call Func_712c9
	ld a, $7
	ld [wBattleSubroutine], a
	ret

Func_70e18: ; 70e18 (1c:4e18)
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_70e35
	ld a, [wBattleMenuSelection]
	cp $0
	jr z, .asm_70e35
	dec a
	ld [wBattleMenuSelection], a
	ld a, $2
	ld [H_SFX_ID], a
	ld a, $7
	ld [wBattleSubroutine], a
	ret

.asm_70e35
	ld a, [wJoyNew]
	and D_DOWN
	jp z, Func_70e59
	ld a, [wd413]
	sub $1
	ld b, a
	ld a, [wBattleMenuSelection]
	cp b
	jp z, Func_70e59
	inc a
	ld [wBattleMenuSelection], a
	ld a, $2
	ld [H_SFX_ID], a
	ld a, $7
	ld [wBattleSubroutine], a
	ret

Func_70e59: ; 70e59 (1c:4e59)
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_70f60
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wd40c]
	cp $1
	jr nz, .asm_70e83
	ld a, [wd429]
	cp $0
	jr nz, .asm_70e83
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	ld a, $4
	ld [wBattleSubroutine], a
	ret

.asm_70e83
	ld a, $1
	ld [wd4ba], a
	ld a, [wd4a0]
	ld [wd4bb], a
	ld a, [wBattleMenuSelection]
	ld [wd4bc], a
	ld a, $4
	call Func_050a
	ld a, [wBattleMenuSelection]
	cp $0
	jp z, Func_70eab
	cp $1
	jp z, Func_70ed7
	cp $2
	jp z, Func_70f03
Func_70eab: ; 70eab (1c:4eab)
	ld a, [wd47c]
	cp $1
	jp z, Func_70fe3
	ld a, $1
	ld [wd47c], a
	ld a, $0
	call Func_71446
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_71477
	ld a, [wd42e]
	inc a
	ld [wd42e], a
	jp Func_70f2c

Func_70ed7: ; 70ed7 (1c:4ed7)
	ld a, [wd47d]
	cp $1
	jp z, Func_70fe3
	ld a, $1
	ld [wd47d], a
	ld a, $1
	call Func_71446
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_71477
	ld a, [wd42e]
	inc a
	ld [wd42e], a
	jp Func_70f2c

Func_70f03: ; 70f03 (1c:4f03)
	ld a, [wd47e]
	cp $1
	jp z, Func_70fe3
	ld a, $1
	ld [wd47e], a
	ld a, $2
	call Func_71446
	ld a, [wcb00]
	ld [wd415], a
	ld a, [wd429]
	dec a
	ld [wd429], a
	call Func_71477
	ld a, [wd42e]
	inc a
	ld [wd42e], a
Func_70f2c: ; 70f2c (1c:4f2c)
	ld a, [wd429]
	cp $0
	jp z, Func_70fe3
	ld a, [wd413]
	cp $1
	jr z, .asm_70f5f
	cp $2
	jr z, .asm_70f43
	cp $3
	jr z, .asm_70f4c
.asm_70f43
	ld a, [wBattleMenuSelection]
	cp $1
	jr z, .asm_70f5f
	jr .asm_70f53

.asm_70f4c
	ld a, [wBattleMenuSelection]
	cp $2
	jr z, .asm_70f5f
.asm_70f53
	ld a, [wBattleMenuSelection]
	inc a
	ld [wBattleMenuSelection], a
	ld a, $7
	ld [wBattleSubroutine], a
.asm_70f5f
	ret

Func_70f60: ; 70f60 (1c:4f60)
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_70fba
	ld a, $4
	ld [H_SFX_ID], a
	ld a, [wd42e]
	cp $1
	jp z, Func_70fe3
	ld a, $0
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $1
	ld [wd42e], a
	xor a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_71467
	xor a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld c, $6a
	call Func_3d02
	ld a, [wd429]
	cp $1
	jr nz, .asm_70fb9
	ld a, [wd42b]
	cp $1
	jr z, .asm_70fb9
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, [wd429]
	inc a
	ld [wd429], a
.asm_70fb9
	ret

.asm_70fba
	ld a, [hJoyNew]
	and START
	jp z, Func_70fc8
	ld a, $3
	ld [H_SFX_ID], a
	jr Func_70fe3

Func_70fc8: ; 70fc8 (1c:4fc8)
	ld a, [hJoyNew]
	and SELECT
	jp z, Func_70fdf
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $9
	ld [wBattleSubroutine], a
	ret

Func_70fdf: ; 70fdf (1c:4fdf)
	call Func_0530
	ret

Func_70fe3: ; 70fe3 (1c:4fe3)
	ld c, $1e
	call Func_3d02
	xor a
	ld [wd40d], a
	call Func_703a2
	ld a, $0
	ld [wd411], a
	call Func_3cb5
	ld a, $a
	ld [wBattleSubroutine], a
	ret

Func_70ffd:
	lb bc, 1, 5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
	call OpenSRAMBank2
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_71738
	ld hl, sAddressBook + $00
	call Func_3d0e
	ld a, [hl]
	ld [wd490], a
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call Func_175f
	ld a, $1
	ld [wBGPalUpdate], a
	call CloseSRAM
	jp NextBattleSubroutine

Func_71033:
	lb bc, 1, 5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 1, 5
	ld e, $8c
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wd40c]
	cp $1
	jr z, .asm_71066
	ld a, [wd404]
	cp $1
	jr z, .asm_71066
	ld a, [wd4b0]
	cp $0
	jp z, .asm_71066
	call Func_713de
	ld a, $6
	ld [wBattleSubroutine], a
	ret

.asm_71066
	ld a, $5
	ld [wBattleSubroutine], a
	ret

Func_7106c:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wOAMAnimation01], a
	ld [wOAMAnimation05], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_71467
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_71704
	ld [wd415], a
	xor a
	ld [wMoveAnimationSubroutine], a
	ld a, $9
	ld [wGameRoutine], a
	ret

Func_71097:
	call Func_0530
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp 10
	ret c
	xor a
	ld [wd45a], a
	ld a, $b
	ld [wBattleSubroutine], a
	ret

Func_710ae:
	call Func_3cd0
	call Func_0530
	ld a, [wd47c]
	cp $1
	jr nz, .okay1
	ld a, $0
	call Func_71446
.okay1
	ld a, [wd47d]
	cp $1
	jr nz, .okay2
	ld a, $1
	call Func_71446
.okay2
	ld a, [wd47e]
	cp $1
	jr nz, .okay3
	ld a, $2
	call Func_71446
.okay3
	ld a, [wd42b]
	cp $0
	jp z, .check_a_b
	ld a, [wd40c]
	cp $0
	jp z, .check_a_b
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .check_d_right
	ld a, [wd40d]
	cp $0
	jr z, .set_cursor_pos_1_left
	ld a, $0
	ld [wd40d], a
	jr .done_left_right

.set_cursor_pos_1_left
	ld a, $1
	ld [wd40d], a
	jr .done_left_right

.check_d_right
	ld a, [hJoyNew]
	and D_RIGHT
	jr z, .check_b_button
	ld a, [wd40d]
	cp $1
	jr z, .set_cursor_pos_0_right
	ld a, $1
	ld [wd40d], a
	jr .done_left_right

.set_cursor_pos_0_right
	ld a, $0
	ld [wd40d], a
.done_left_right
	ld a, $2
	ld [H_SFX_ID], a
	jp Func_703a2

.check_b_button
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .check_a_button
	jr .cancel

.check_a_button
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wd40d]
	cp $1
	jr z, .cancel
	jp .set_summoned_denjuu

.cancel
	ld a, $4
	ld [H_SFX_ID], a
	call Func_713de
	ld a, $0
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
	ld a, $1
	ld [wd42e], a
	xor a
	ld [wd4ba], a
	ld [wd4bb], a
	ld [wd4bc], a
	ld [wd47c], a
	ld [wd47d], a
	ld [wd47e], a
	call Func_71467
	ld a, [wd42b]
	ld [wd429], a
	ld c, $6a
	call Func_3d02
	ld a, $6
	ld [wBattleSubroutine], a
	ret

.check_a_b
	ld a, [hJoyNew]
	and A_BUTTON | B_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wd40d]
	cp $1
	jr z, .cancel
.set_summoned_denjuu
	ld a, $3
	ld [H_SFX_ID], a
	ld a, [wd42e]
	cp $1
	jr z, .done
	cp $2
	jr z, .one_denjuu_chosen
	cp $3
	jr z, .two_denjuu_chosen
.one_denjuu_chosen
	ld a, $1
	ld [wPlayerDenjuu2ArrivedStatus], a
	jr .done

.two_denjuu_chosen
	ld a, $1
	ld [wPlayerDenjuu2ArrivedStatus], a
	ld [wPlayerDenjuu3ArrivedStatus], a
.done
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation05], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	call Func_71467
	ld a, $10
	ld [wcf96], a
	ld a, $c
	ld [wBattleSubroutine], a
	ret

Func_711cf:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	jp NextBattleSubroutine

Func_711d9:
	ld a, [wd42e]
	ld [wPlayerPartySize], a
	ld hl, wPlayerDenjuu1
	call Func_71550
	ld a, [wPlayerDenjuu2Level]
	cp $0
	jr z, .asm_711ff
	ld hl, wPlayerDenjuu2
	call Func_71550
	ld a, [wPlayerDenjuu3Level]
	cp $0
	jr z, .asm_711ff
	ld hl, wPlayerDenjuu3Species
	call Func_71550
.asm_711ff
	ld hl, wEnemyDenjuu1Species
	call Func_71550
	ld a, [wEnemyDenjuu2Level]
	cp $0
	jr z, .asm_7121f
	ld hl, wEnemyDenjuu2
	call Func_71550
	ld a, [wEnemyDenjuu3Level]
	cp $0
	jr z, .asm_7121f
	ld hl, wEnemyDenjuu3
	call Func_71550
.asm_7121f
	ld a, [wPartnerDenjuuHPRemaining]
	ld [wPlayerDenjuu1CurHP], a
	xor a
	ld [wBattleSubroutine], a
	jp IncrementSubroutine

Func_7122c: ; 7122c (1c:522c)
	call Func_0671
	ld a, c
	ld [wd5a8], a
	xor a
	ld [wd4b0], a
	ld a, $fe
	ld b, a
	ld hl, wd000
.asm_7123d
	ld a, [wcdb4]
	cp b
	jr z, .asm_7129f
	push hl
	push bc
	call OpenSRAMBank2
	ld hl, sAddressBook + $01
	ld a, b
	call Func_3d0e
	ld a, [hl]
	ld [wCurDenjuuLevel], a
	pop bc
	pop hl
	ld a, [wCurDenjuuLevel]
	cp $0
	jr z, .asm_7129f
	push hl
	push bc
	ld a, b
	ld hl, sAddressBook + $08
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	pop bc
	pop hl
	cp $8
	jr nc, .asm_7129f
	push hl
	ld hl, wd200
	ld d, $0
	ld a, [wd4b0]
	ld e, a
	add hl, de
	ld a, [wd4ec]
	ld [hl], a
	pop hl
	push hl
	ld hl, wd100
	ld d, $0
	ld a, [wd4b0]
	ld e, a
	add hl, de
	ld a, [wCurDenjuuLevel]
	ld [hl], a
	pop hl
	ld a, b
	ld [hli], a
	ld a, [wd4b0]
	inc a
	ld [wd4b0], a
.asm_7129f
	ld a, $0
	cp b
	jr z, .asm_712a7
	dec b
	jr .asm_7123d

.asm_712a7
	jp Func_3f12

Func_712aa: ; 712aa (1c:52aa)
	ld a, $d6
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $4
	ld [wWhichBattleMenuCursor], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers + 4], a
	ld a, $8
	ld [wSpriteInitYCoordBuffers + 4], a
	jp InitBattleMenuCursor

Func_712c1:
	ld hl, wd000
	ld d, $0
	ld e, a
	add hl, de
	ret

Func_712c9: ; 712c9 (1c:52c9)
	ld a, [wd4ba]
	cp $0
	ret z
	ld a, [wd4bb]
	ld b, a
	ld a, [wd4a0]
	cp b
	ret nz
	ld a, [wd4bc]
	cp $1
	jr z, .asm_712ed
	cp $2
	jr z, .asm_712f7
	ld a, $1
	ld [wd47c], a
	ld a, $0
	jp Func_71446

.asm_712ed
	ld a, $1
	ld [wd47d], a
	ld a, $1
	jp Func_71446

.asm_712f7
	ld a, $1
	ld [wd47e], a
	ld a, $2
	jp Func_71446

Func_71301: ; 71301 (1c:5301)
	ld a, [wd4a0]
	ld b, a
	ld a, [wd4a1]
	cp b
	jr z, .asm_7130f
	ld a, $3
	jr .asm_7131b

.asm_7130f
	ld a, [wd4a1]
	ld b, a
	ld a, [wd4b0]
.asm_71316
	sub $3
	dec b
	jr nz, .asm_71316
.asm_7131b
	ld [wd413], a
	ret

Func_7131f: ; 7131f (1c:531f)
	call OpenSRAMBank2
	ld d, $0
	call Func_71738
	ld hl, sAddressBook + $08
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	ld [wd4a2], a
	call OpenSRAMBank2
	ld d, $1
	call Func_71738
	ld hl, sAddressBook + $08
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	ld [wd4a3], a
	call OpenSRAMBank2
	ld d, $2
	call Func_71738
	ld hl, sAddressBook + $08
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	ld [wd4a4], a
	ret

Func_71374: ; 71374 (1c:5374)
	ld a, [wd413]
	cp $1
	jr c, .asm_713dd
	lb bc, 11, 4
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 15, 4
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $2
	jr c, .asm_713ac
	lb bc, 11, 7
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 15, 7
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_713b6

.asm_713ac
	lb bc, 11, 7
	ld e, $aa
	ld a, $0
	call LoadStdBGMapLayout_
.asm_713b6
	ld a, [wd413]
	cp $3
	jr c, .asm_713d3
	lb bc, 11, 10
	ld e, $a5
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 15, 10
	ld e, $a6
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_713dd

.asm_713d3
	lb bc, 11, 10
	ld e, $aa
	ld a, $0
	call LoadStdBGMapLayout_
.asm_713dd
	ret

Func_713de: ; 713de (1c:53de)
	ld a, [wBattleMenuSelection]
	cp $1
	jr z, .asm_713ed
	cp $2
	jr z, .asm_713f1
	ld a, $18
	jr .asm_713f3

.asm_713ed
	ld a, $30
	jr .asm_713f3

.asm_713f1
	ld a, $48
.asm_713f3
	ld [wSpriteInitYCoordBuffers + 0], a
	ld a, $50
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $d0
	ld [wBattleMenuCursorObjectTemplateIDX], a
	jp InitBattleMenuCursor

Func_71408: ; 71408 (1c:5408)
	ld a, $d4
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $1
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 1], a
	ld a, $10
	ld [wSpriteInitYCoordBuffers + 1], a
	call InitBattleMenuCursor
	ld a, $2
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 2], a
	ld a, $28
	ld [wSpriteInitYCoordBuffers + 2], a
	call InitBattleMenuCursor
	ld a, $3
	ld [wWhichBattleMenuCursor], a
	ld a, $64
	ld [wSpriteInitXCoordBuffers + 3], a
	ld a, $40
	ld [wSpriteInitYCoordBuffers + 3], a
	call InitBattleMenuCursor
	jp Func_71467

Func_71446: ; 71446 (1c:5446)
	cp $1
	jr z, .asm_71455
	cp $2
	jr z, .asm_7145c
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	jr .asm_71461

.asm_71455
	ld a, $1
	ld [wOAMAnimation03_PriorityFlags], a
	jr .asm_71461

.asm_7145c
	ld a, $1
	ld [wOAMAnimation04], a
.asm_71461
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_71467: ; 71467 (1c:5467)
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
	ld [wOAMAnimation04], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_71477: ; 71477 (1c:5477)
	ld a, [wd42e]
	cp $2
	jr z, .asm_714c9
	ld a, [wd490]
	ld [wPlayerDenjuu2Species], a
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_71738
	ld [wPlayerDenjuu2Field0x0d], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $01
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld [wPlayerDenjuu2Level], a
	ld a, [hli]
	ld [wPlayerDenjuu2FD], a
	ld a, [hl]
	ld [wPlayerDenjuu2Field0x0c], a
	ld hl, sAddressBook + $08
	ld a, [wPlayerDenjuu2Field0x0d]
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	sla a
	sla a
	sla a
	sla a
	sla a
	ld [wPlayerDenjuu2Field0x08], a
	jr .asm_71512

.asm_714c9
	ld a, [wd490]
	ld [wPlayerDenjuu3Species], a
	ld a, [wBattleMenuSelection]
	ld d, a
	call Func_71738
	ld [wPlayerDenjuu3Field0x0d], a
	call OpenSRAMBank2
	ld hl, sAddressBook + $01
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	ld a, [hli]
	ld [wPlayerDenjuu3Level], a
	ld a, [hli]
	ld [wPlayerDenjuu3FD], a
	ld a, [hl]
	ld [wPlayerDenjuu3Field0x0c], a
	ld hl, sAddressBook + $08
	ld a, [wPlayerDenjuu3Field0x0d]
	call Func_3d0e
	ld a, [hl]
	ld b, a
	ld a, [wd5a8]
	call Func_05e3
	ld a, [wd4ec]
	sla a
	sla a
	sla a
	sla a
	sla a
	ld [wPlayerDenjuu3Field0x08], a
.asm_71512
	call CloseSRAM
	ret

Data_71516:
	db $01, $01, $02, $02, $02, $00, $00
	db $02, $01, $01, $01, $01, $00, $00
	db $01, $02, $01, $01, $01, $00, $00
	db $01, $01, $01, $01, $01, $02, $00
	db $02, $01, $00, $00, $00, $02, $02
	db $01, $01, $01, $01, $01, $00, $02

Func_71540: ; 71540 (1c:5540)
	push hl
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	pop hl
	ret

Func_71550: ; 71550 (1c:5550)
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	ld c, $0
	call Func_71540
	ld [hli], a
	ld [hli], a
	ld c, $1
	call Func_71540
	ld [wd491], a
	ld c, $d
	call Func_71540
	push hl
	ld hl, Data_71516
	ld de, $7
	addntimes_hl_de
	ld d, $0
	ld a, [wCurBackground]
	ld e, a
	add hl, de
	ld a, [hl]
	cp $2
	jr z, .asm_7158c
	ld a, [wd491]
	jr .asm_71595

.asm_7158c
	ld a, [wd491]
	ld b, a
	srl a
	add b
	jr .asm_71595

.asm_71595
	pop hl
	ld [hli], a
	inc hl
	ld c, $a
	call Func_71540
	inc hl
	inc hl
	inc hl
	ld [hli], a
	inc hl
	inc hl
	inc hl
	inc hl
	ld c, $2
	call Func_71540
	ld [hli], a
	ld c, $3
	call Func_71540
	ld [hli], a
	ld c, $4
	call Func_71540
	ld [hli], a
	ld c, $5
	call Func_71540
	ld [hli], a
	inc hl
	ld c, $1
	call Func_71540
	ld [hli], a
	ld [hl], a
	ret

Func_715c6:
	hlbgcoord 1, 3
	ld c, $1
	jp Func_1499

Func_715ce: ; 715ce (1c:55ce)
	call OpenSRAMBank2
	ld a, [wd4a0]
	inc a
	hlbgcoord 14, 1
	ld c, $1
	call Func_1430
	ld a, [wd44e]
	cp $1
	jr z, .asm_71657
	ld a, [wd413]
	cp $1
	jr c, .asm_71656
	ld d, $0
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 4
	ld c, $1
	call Func_1430
	ld a, [wd4a2]
	hlbgcoord 17, 4
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $2
	jr c, .asm_71656
	ld d, $1
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 7
	ld c, $1
	call Func_1430
	ld a, [wd4a3]
	hlbgcoord 17, 7
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $3
	jr c, .asm_71656
	ld d, $2
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 13, 10
	ld c, $1
	call Func_1430
	ld a, [wd4a4]
	hlbgcoord 17, 10
	ld c, $1
	call Func_1430
.asm_71656
	ret

.asm_71657
	ld a, [wd413]
	cp $1
	jp c, Func_71703
	ld d, $0
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 4
	ld c, $1
	call Func_1430
	ld d, $0
	call Func_71738
	ld hl, sAddressBook + $02
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 4
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $2
	jr c, Func_71703
	ld d, $1
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 7
	ld c, $1
	call Func_1430
	ld d, $1
	call Func_71738
	ld hl, sAddressBook + $02
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 7
	ld c, $1
	call Func_1430
	ld a, [wd413]
	cp $3
	jr c, Func_71703
	ld d, $2
	call Func_71738
	ld hl, sAddressBook + $01
	call Func_3d0e
	ld a, [hld]
	ld b, a
	ld a, [hl]
	ld c, $0
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 13, 10
	ld c, $1
	call Func_1430
	ld d, $2
	call Func_71738
	ld hl, sAddressBook + $02
	call Func_3d0e
	ld a, [hl]
	hlbgcoord 17, 10
	ld c, $1
	call Func_1430
Func_71703: ; 71703 (1c:5703)
	ret

Func_71704: ; 71704 (1c:5704)
	ld a, [wd4a0]
	cp $0
	jr z, .asm_71713
	ld b, a
	ld a, d
.asm_7170d
	add $3
	dec b
	jr nz, .asm_7170d
	ld d, a
.asm_71713
	ld a, d
	ret

Func_71715:
	ld a, [wPlayerDenjuu1Level]
	ld hl, $0
	add hl, de
	hlbgcoord 13, 4
	ld c, $1
	call Func_1430
	ld a, [wPlayerDenjuu1Field0x08]
	ld bc, $4
	ld hl, $0
	add hl, de
	add hl, bc
	hlbgcoord 17, 4
	ld c, $1
	call Func_1430
	ret

Func_71738: ; 71738 (1c:5738)
	call Func_71704
	ld d, $0
	ld e, a
	ld hl, wd000
	add hl, de
	ld a, [hl]
	ret

Func_71744: ; 71744 (1c:5744)
	call OpenSRAMBank2
	ld d, $0
	call Func_71738
	ld hl, sAddressBook + $06
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	ld hl, VTilesBG tile $40
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	lb bc, 11, 3
	ld e, $a7
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $2
	ret c
	call OpenSRAMBank2
	ld d, $1
	call Func_71738
	ld hl, sAddressBook + $06
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	ld hl, VTilesBG tile $48
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	lb bc, 11, 6
	ld e, $a8
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, [wd413]
	cp $3
	ret c
	call OpenSRAMBank2
	ld d, $2
	call Func_71738
	ld hl, sAddressBook + $06
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	ld hl, VTilesBG tile $50
	ld de, wc9e1
	ld b, $6
	call PlaceString_
	lb bc, 11, 9
	ld e, $a9
	ld a, $0
	jp LoadStdBGMapLayout_

Func_717c8: ; 717c8 (1c:57c8)
	push hl
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, Pointers_717e5
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	pop de
	ld bc, $20 tiles
	ld a, BANK(Phone1GFX)
	jp Copy2bpp

Pointers_717e5:
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Func_717f7: ; 717f7 (1c:57f7)
	ld a, [wd401]
	ld hl, Pointers_71801
	call GetShortFromTable
	jp [hl]

Pointers_71801:
	dw Func_71815
	dw Func_71822
	dw Func_71831
	dw Func_71907
	dw Func_7191b
	dw Func_7192e
	dw Func_71948
	dw Func_71957
	dw Func_719e0
	dw Func_71a11

Func_71815:
	ld a, $1
	call Func_050a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71822:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71831:
	ld bc, $17
	call GetCGB_BGLayout_
	ld a, $28
	call Func_3eb9
	call Func_06bc
	call Func_71a2f
	call Func_057e
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, $390
	add hl, de
	push hl
	pop bc
	xor a
	call Func_10ee
	lb bc, 0, 12
	ld e, $80
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $b
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld e, $b0
	ld a, [wCurBackground]
	add e
	ld e, a
	lb bc, 0, 0
	ld a, $0
	call LoadStdBGMapLayout_
	ld e, $a0
	ld a, [wCurBackground]
	add e
	ld e, a
	lb bc, 0, 0
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 5, 0
	ld e, $ae
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 5, 0
	ld e, $93
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, [wd4ce]
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call Func_175f
	ld hl, VTilesBG tile $20
	ld a, [wd43c]
	call Func_3e19
	ld a, [wd46e]
	cp $2
	jr c, .asm_718bf
	cp $4
	jr c, .asm_718c6
.asm_718bf
	ld c, $66
	call Func_3d02
	jr .asm_718cb

.asm_718c6
	ld c, $67
	call Func_3d02
.asm_718cb
	ld a, $1
	call Func_050a
	ld a, [wcd00]
	cp $1
	jr z, .asm_718e6
	ld a, [wd403]
	cp $1
	jr z, .asm_718e2
	ld a, $14
	jr .asm_718f4

.asm_718e2
	ld a, $15
	jr .asm_718f4

.asm_718e6
	ld bc, EVENT_1F7
	call CheckEventFlag
	jr nz, .asm_718f2
	ld a, $16
	jr .asm_718f4

.asm_718f2
	ld a, $17
.asm_718f4
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [wcad0], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71907:
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $3c
	ld [wd45a], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_7191b:
	call Func_0530
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	ret nz
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_7192e:
	call Func_0530
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $1
	call Func_050a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71948:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71957:
	lb bc, 0, 0
	ld e, $f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 0, 0
	ld e, $f
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld bc, $17
	call GetCGB_BGLayout_
	ld a, $28
	call Func_3eb9
	ld a, [wCurBattleDenjuu]
	ld hl, wPlayerDenjuu1
	call Func_71a70
	ld a, [wCurDenjuuBuffer]
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	call Func_175f
	ld a, [wCurEnemyDenjuu]
	ld hl, wEnemyDenjuu1Species
	call Func_71a70
	ld a, [wCurDenjuuBuffer]
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_1764
	ld hl, VTilesBG tile $20
	ld a, $8
	call ClearString
	lb bc, 1, 0
	ld e, $86
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, 1, 0
	ld e, $87
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, 0, 8
	ld e, $81
	ld a, $0
	call LoadStdWindowLayout_
	lb bc, 1, 8
	ld e, $84
	ld a, $0
	call LoadStdWindowAttrLayout_
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_719e0:
	ld a, $58
	ld [wWX], a
	ld a, $0
	ld [wWY], a
	ld a, [wLCDC]
	set 5, a
	ld [wLCDC], a
	ld a, [wLCDC]
	set 6, a
	ld [wLCDC], a
	ld a, $1
	ld [wc46c], a
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	ld a, [wd401]
	inc a
	ld [wd401], a
	ret

Func_71a11:
	xor a
	ld [wcad0], a
	ld a, $1
	call Func_050a
	ld a, $0
	ld [wd401], a
	ld a, $31
	ld [wBattleSubroutine], a
	ld a, $0
	ld [wSubroutine], a
	ld a, $7
	ld [wGameRoutine], a
	ret

Func_71a2f: ; 71a2f (1c:5a2f)
	ld a, [wCurBackground]
	call Func_0574
	ld a, [wCurBackground]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, $60
	ld a, [wc93b]
	cp $14
	jr nc, .asm_71a4d
	cp $4
	jr nc, .asm_71a50
.asm_71a4d
	ld hl, $380
.asm_71a50
	ld a, [wCurBackground]
	ld e, a
	ld d, $0
	sla e
	rl d
	add hl, de
	push hl
	pop bc
	push bc
	ld a, $3
	call Func_10ee
	pop bc
	inc bc
	ld a, $4
	call Func_10ee
	ld a, $1
	ld [wdd06], a
	ret

Func_71a70: ; 71a70 (1c:5a70)
	ld bc, wCurDenjuuBufferSpecies
	ld de, $16
	addntimes_hl_de
	ld d, $10
.asm_71a80
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .asm_71a80
	ret
