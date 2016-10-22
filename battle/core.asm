DoBattle::
	ld a, [wSubroutine]
	ld hl, Pointers_14425
	call GetHalfwordFromTable
	jp [hl]

Pointers_14425:
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
	ld [wd400], a
	ld a, $1
	ld [wSubroutine], a
	ld a, $f
	ld [wGameRoutine], a
	ret

Func_14460: ; 14460 (5:4460)
	ld a, [wcb3f]
	or a
	jr z, .asm_14483
	ld a, [wd400]
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
	ld [wd400], a
.asm_14483
	ld a, [wd400]
	ld hl, Pointers_1448d
	call GetHalfwordFromTable
	jp [hl]

Pointers_1448d:
	dw Func_1457d
	dw Func_145a9
	dw Func_145f5
	dw Func_1463e
	dw Func_14681
	dw Func_14b07
	dw Func_14bc6
	dw Func_14c34
	dw Func_14d1f
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
	dw Func_16360
	dw Func_163fe
	dw Func_16416
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
	dw Func_163ef
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
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld bc, $c
	ld e, $8a
	xor a
	call Func_04da
	call Func_3f02
	ld c, $74
	call Func_3d02
	jp Func_3cf8

Func_1454a: ; 1454a (5:454a)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	call InitSerialData
	call Func_06bc
	ld a, $10
	ld [wcf96], a
	ld a, $4
	call Func_050a
	jp Func_3cf8

Func_14566: ; 14566 (5:4566)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wd401], a
	ld [wd400], a
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
	call Func_3eb9
	ld bc, $4
	call GetCGB_OBLayout_
	ld bc, $10
	call DecompressGFXByIndex_
	ld a, $20
	ld [wd4ee], a
	xor a
	ld [wd417], a
	ld [wd414], a
	jp Func_3cf8

Func_145a9: ; 145a9 (5:45a9)
	ld bc, $0
	ld e, $f
	xor a
	call Func_04ca
	ld bc, $0
	ld e, $f
	xor a
	call Func_04da
	ld bc, $0
	ld e, $71
	xor a
	call Func_04fa
	ld bc, $0
	ld e, $71
	xor a
	call Func_04ea
	call Func_145d6
	call Func_1400a
	jp Func_3cf8

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

Func_145f5: ; 145f5 (5:45f5)
	ld a, [wEnemyDenjuu1]
	call Func_142df
	ld a, [wPlayerDenjuu1]
	call Func_142ec
	ld a, $60
	ld [wSCX], a
	ld a, $b8
	ld [wWX], a
	call Func_142af
	call Func_14005
	ld a, [wcd00]
	cp $1
	jr z, .asm_14627
	ld a, [wd403]
	cp $1
	jr z, .asm_14623
	ld a, $14
	jr .asm_14635

.asm_14623
	ld a, $15
	jr .asm_14635

.asm_14627
	ld bc, $1f7
	call CheckEventFlag
	jr nz, .asm_14633
	ld a, $16
	jr .asm_14635

.asm_14633
	ld a, $17
.asm_14635
	call GetMusicBank
	ld [H_MusicID], a
	jp Func_3cf8

Func_1463e: ; 1463e (5:463e)
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, $1d
	ld [wd400], a
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
	call Func_14318
	call Func_1404a
	call Func_14062
	ld a, $e
	ld [wd400], a
	ret

Func_14681: ; 14681 (5:4681)
	call Func_3f02
	ld a, [wd47f]
	cp $3
	jr nc, .asm_146b4
	xor a
	ld [wd416], a
	ld a, [wd47f]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, .asm_146ae
.asm_14699
	ld a, [wd47f]
	ld b, a
	ld a, [wd475]
	cp b
	jr z, .asm_146a8
	call Func_1651b
	jr .asm_14699

.asm_146a8
	ld a, $17
	ld [wd400], a
	ret

.asm_146ae
	ld a, $26
	ld [wd400], a
	ret

.asm_146b4
	ld a, $1
	ld [wd416], a
	ld a, [wd47f]
	sub $3
	ld b, a
	ld a, [wd477]
	cp b
	jr z, .asm_146dc
.asm_146c5
	ld a, [wd47f]
	sub $3
	ld b, a
	ld a, [wd478]
	cp b
	jr z, .asm_146d6
	call Func_1654b
	jr .asm_146c5

.asm_146d6
	ld a, $1a
	ld [wd400], a
	ret

.asm_146dc
	ld a, $28
	ld [wd400], a
	ret

Func_146e2: ; 146e2 (5:46e2)
	ld a, [wSCX]
	cp $50
	jr nc, .asm_146ef
	add $8
	ld [wSCX], a
	ret

.asm_146ef
	jp Func_3cf8

Func_146f2: ; 146f2 (5:46f2)
	call Func_1651b
	call Func_1657b
	call Func_1404a
	call Func_1643a
	ld a, [wd474]
	ld [wd417], a
	jp Func_3cf8

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
	ld [wd400], a
	ret

Func_14721: ; 14721 (5:4721)
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wd435], a
	ld a, [wCurDenjuuBufferField0x07]
	cp $5
	jr nz, .asm_14791
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, $3
	call Func_143f9
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd477]
	cp b
	jr z, .asm_1478b
	ld a, [wd4e7]
	cp $3
	jr z, .asm_14767
	cp $2
	jr z, .asm_1475d
	jp .asm_1478b

.asm_1475d
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd478]
	cp b
	jr nz, .asm_1478b
.asm_14767
	ld bc, $101
	ld e, $8b
	xor a
	call Func_04fa
.asm_14770
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd477]
	cp b
	jr z, .asm_1477f
	call Func_1654b
	jr .asm_14770

.asm_1477f
	call Func_1658d
	call Func_14062
	ld a, $3d
	ld [wd400], a
	ret

.asm_1478b
	ld a, $c
	ld [wd400], a
	ret

.asm_14791
	call Func_3d7f
	ld a, [wcb3f]
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
	ld a, [wd474]
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
	call Func_0d4e
	cp $80
	jr nc, Func_14855
Func_147ef: ; 147ef (5:47ef)
	ld a, [wCurDenjuuBufferField0x12]
	call Func_148a3
	call Func_3d02
	ld a, [wd474]
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
	ld [wdc34], a
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
	ld [wd45a], a
	ld a, $27
	ld [wd400], a
	ret

.asm_1484f
	ld a, $30
	ld [wd400], a
	ret

Func_14855: ; 14855 (5:4855)
	ld a, [wd458]
	cp $0
	jp z, Func_14862
	ld a, $e0
	ld [wdc34], a
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
	ld [wdc34], a
Func_1487a: ; 1487a (5:487a)
	ld hl, Data_16368
	call Func_0620
	ld hl, wd4d0
	call Func_14020
	ld a, $5c
	ld [H_FFA1], a
	call Func_3d7f
	ld c, $4
asm_14890
	call Func_3d02
	ld a, $3c
	ld [wd45a], a
	ld a, $27
	ld [wd400], a
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
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, [wd474]
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
	ld [wd400], a
	ret

.asm_148dd
	ld a, $e
	ld [wd400], a
	ret

.asm_148e3
	ld a, $9
	ld [wd400], a
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
	jp Func_3cf8

Func_148fc: ; 148fc (5:48fc)
	call Func_1654b
	call Func_1658d
	call Func_14062
	call Func_16461
	ld a, [wd477]
	ld [wd418], a
	jp Func_3cf8

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
	ld [wd400], a
	ret

Func_1492f: ; 1492f (5:492f)
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wd435], a
	ld a, [wCurDenjuuBufferField0x07]
	cp $5
	jr nz, .asm_1499f
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, $3
	call Func_143f9
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, .asm_14999
	ld a, [wd4e6]
	cp $3
	jr z, .asm_14975
	cp $2
	jr z, .asm_1496b
	jp .asm_14999

.asm_1496b
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd475]
	cp b
	jr nz, .asm_14999
.asm_14975
	ld bc, $105
	ld e, $8b
	xor a
	call Func_04ca
.asm_1497e
	ld a, [wCurDenjuuBufferField0x0b]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, .asm_1498d
	call Func_1651b
	jr .asm_1497e

.asm_1498d
	call Func_1657b
	call Func_1404a
	ld a, $24
	ld [wd400], a
	ret

.asm_14999
	ld a, $c
	ld [wd400], a
	ret

.asm_1499f
	ld a, [wCurDenjuuBuffer]
	call Func_142cd
	ld a, [wcb3f]
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
	ld a, [wd477]
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
	call Func_0d4e
	cp $80
	jr nc, Func_14a67
Func_14a01: ; 14a01 (5:4a01)
	ld a, [wCurDenjuuBufferField0x12]
	call Func_148a3
	call Func_3d02
	ld a, [wd477]
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
	ld [wdc34], a
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
	ld [wd45a], a
	ld a, $29
	ld [wd400], a
	ret

.asm_14a61
	ld a, $30
	ld [wd400], a
	ret

Func_14a67: ; 14a67 (5:4a67)
	ld a, [wd458]
	cp $0
	jp z, Func_14a74
	ld a, $e0
	ld [wdc34], a
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
	ld [wdc34], a
Func_14a8c: ; 14a8c (5:4a8c)
	ld hl, Data_16368
	call Func_0620
	ld hl, wd4d0
	call Func_14020
	ld a, $5d
	ld [H_FFA1], a
	ld c, $4
asm_14a9f
	call Func_3d02
	ld a, $3c
	ld [wd45a], a
	ld a, $29
	ld [wd400], a
	ret

Func_14aad: ; 14aad (5:4aad)
	call Func_0530
	ld a, [wcb3f]
	or a
	jr z, .asm_14abf
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	jr z, .asm_14ac5
.asm_14abf
	ld a, [wc9c9]
	cp $9
	ret nz
.asm_14ac5
	ld a, [wd477]
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
	ld [wd45a], a
	ld c, $72
	call Func_3d02
	ld a, $b
	ld [wd400], a
	ret

.asm_14af2
	ld a, $e
	ld [wd400], a
	ret

Func_14af8: ; 14af8 (5:4af8)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $e
	ld [wd400], a
	ret

Func_14b07: ; 14b07 (5:4b07)
	ld a, [wcb3f]
	cp $1
	jr z, .asm_14b35
	ld a, [wCurDenjuuBufferField0x0c]
	cp $4
	jr z, .asm_14b19
	cp $5
	jr nz, .asm_14b35
.asm_14b19
	ld a, [wCurDenjuuBufferField0x0a]
	add $9b
	ld b, a
	call Func_0d4e
	cp b
	jr c, .asm_14b35
	ld a, $0
	ld [wd414], a
	ld c, $1f
	call Func_3d02
	ld a, $2a
	ld [wd400], a
	ret

.asm_14b35
	ld a, [wCurDenjuuBufferField0x0c]
	cp $8
	jr z, .asm_14b40
	cp $9
	jr nz, .asm_14b8d
.asm_14b40
	ld a, [wCurDenjuuBufferField0x0a]
	sla a
	add $37
	ld b, a
	call Func_0d4e
	cp b
	jr c, .asm_14b8d
	ld a, [wd474]
	cp $1
	jr z, .asm_14b60
	cp $2
	jr z, .asm_14b67
	ld a, $1
	ld [wd5ca], a
	jr .asm_14b6c

.asm_14b60
	ld a, $1
	ld [wd5cb], a
	jr .asm_14b6c

.asm_14b67
	ld a, $1
	ld [wd5cc], a
.asm_14b6c
	ld a, $0
	ld [wd414], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wd414]
	call Func_143f9
	ld a, [wd477]
	ld [wd415], a
	xor a
	ld [wd45a], a
	ld a, $2c
	ld [wd400], a
	ret

.asm_14b8d
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld de, BattleString_Fight
	ld hl, VTilesBG tile $60
	call Func_142aa
	ld de, BattleString_Run
	ld hl, VTilesBG tile $68
	call Func_142aa
	ld bc, $30e
	ld e, $8c
	xor a
	call Func_04ca
	xor a
	ld [wd414], a
	xor a
	call Func_142ba
	call Func_1659f
	xor a
	ld [wd411], a
	call Func_3cb5
	jp Func_3cf8

Func_14bc6: ; 14bc6 (5:4bc6)
	call Func_3cd0
	ld a, [wcb3f]
	cp $1
	jr z, .asm_14bfc
	ld a, [hJoyNew]
	and $40
	jr z, .asm_14be3
	ld a, [wd414]
	cp $0
	jr z, .asm_14be3
	dec a
	ld [wd414], a
	jr .asm_14bf4

.asm_14be3
	ld a, [hJoyNew]
	and $80
	jr z, .asm_14bfc
	ld a, [wd414]
	cp $1
	jr z, .asm_14bfc
	inc a
	ld [wd414], a
.asm_14bf4
	ld a, $2
	ld [H_FFA1], a
	call Func_1659f
.asm_14bfc
	ld a, [hJoyNew]
	and $1
	jp z, Func_14c27
	ld a, $3
	ld [H_FFA1], a
	ld a, [wd414]
	cp $0
	jp nz, Func_14c13
	jp Func_3cf8

Func_14c13: ; 14c13 (5:4c13)
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	ld a, $57
	ld [H_FFA1], a
	ld a, $14
	ld [wd400], a
	ret

Func_14c27: ; 14c27 (5:4c27)
	ld a, [wcb3f]
	cp $1
	ret z
	ld a, [hJoyNew]
	and $2
	ret z
	jr Func_14c13

Func_14c34: ; 14c34 (5:4c34)
	ld hl, wc460
	ld a, $3f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	xor a
	ld [wWY], a
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld c, $6 ; move 1
	ld hl, VTilesBG tile $40
	call Func_14d0f
	ld a, [wCurDenjuuBuffer]
	ld c, $7 ; move 2
	ld hl, VTilesBG tile $48
	call Func_14d0f
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, $e
	call GetBaseStat_
	ld a, [wCurBaseStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_14c84
	ld a, [wCurDenjuuBuffer]
	ld c, $8
	ld hl, VTilesBG tile $50
	call Func_14d0f
	ld a, $2
	ld [wd41e], a
	jr .asm_14c93

.asm_14c84
	ld a, $1
	ld [wd41e], a
	ld hl, VTilesBG tile $50
	ld a, $8
	call ClearString
	jr .asm_14cc7

.asm_14c93
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, $f
	call GetBaseStat_
	ld a, [wCurBaseStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_14cc7
	ld a, [wCurDenjuuBuffer]
	ld c, $9
	call GetBaseStat_
	ld a, [wCurBaseStat]
	or a
	jr z, .asm_14cc7
	ld a, [wCurDenjuuBuffer]
	ld c, $9
	ld hl, VTilesBG tile $58
	call Func_14d0f
	ld a, $3
	ld [wd41e], a
	jr .asm_14ccf

.asm_14cc7
	ld hl, VTilesBG tile $58
	ld a, $8
	call ClearString
.asm_14ccf
	ld bc, $909
	ld e, $88
	xor a
	call Func_04ca
	ld bc, $909
	ld e, $80
	xor a
	call Func_04da
	ld a, [wd474]
	cp $1
	jr z, .asm_14cf4
	cp $2
	jr z, .asm_14cfc
	ld a, [wd49d]
	ld [wd414], a
	jr .asm_14d02

.asm_14cf4
	ld a, [wd49e]
	ld [wd414], a
	jr .asm_14d02

.asm_14cfc
	ld a, [wd49f]
	ld [wd414], a
.asm_14d02
	call Func_165c3
	xor a
	ld [wd411], a
	call Func_3cb5
	jp Func_3cf8

Func_14d0f: ; 14d0f (5:4d0f)
	push hl
	ld b, $0
	call GetBaseStat_
	ld a, [wCurBaseStat]
	ld de, MoveNames
	pop bc
	jp GetAndPrintName75LeftAlign_

Func_14d1f: ; 14d1f (5:4d1f)
	call Func_3cd0
	ld a, [wJoyNew]
	and $40
	jr z, .asm_14d3e
	ld a, [wd414]
	cp $0
	jr z, .asm_14d36
	dec a
	ld [wd414], a
	jr .asm_14d59

.asm_14d36
	ld a, [wd41e]
	ld [wd414], a
	jr .asm_14d59

.asm_14d3e
	ld a, [wJoyNew]
	and $80
	jr z, .asm_14d61
	ld a, [wd41e]
	ld b, a
	ld a, [wd414]
	cp b
	jr z, .asm_14d55
	inc a
	ld [wd414], a
	jr .asm_14d59

.asm_14d55
	xor a
	ld [wd414], a
.asm_14d59
	ld a, $2
	ld [H_FFA1], a
	call Func_165c3
.asm_14d61
	ld a, [hJoyNew]
	and $2
	jr z, .asm_14da3
	ld a, $4
	ld [H_FFA1], a
	ld bc, $909
	ld e, $87
	xor a
	call Func_04ca
	ld bc, $909
	ld e, $81
	xor a
	call Func_04da
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wc430], a
	call Func_14062
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, $5
	ld [wd400], a
	ret

.asm_14da3
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, [wd474]
	cp $1
	jr z, .asm_14dbb
	cp $2
	jr z, .asm_14dc3
	ld a, [wd414]
	ld [wd49d], a
	jr .asm_14dc9

.asm_14dbb
	ld a, [wd414]
	ld [wd49e], a
	jr .asm_14dc9

.asm_14dc3
	ld a, [wd414]
	ld [wd49f], a
.asm_14dc9
	ld a, $3
	ld [H_FFA1], a
	xor a
	ld [wOAMAnimation01], a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $1
	ld [wc430], a
	jp Func_3cf8

Func_14ddd: ; 14ddd (5:4ddd)
	ld bc, $909
	ld e, $87
	xor a
	call Func_04ca
	ld bc, $909
	ld e, $81
	xor a
	call Func_04da
	call Func_142af
	ld a, [wd474]
	call GetNthPlayerDenjuu
	call OpenSRAMBank2
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, $a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr nz, .asm_14e23
	xor a
	ld [wd414], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wd414]
	call Func_143f9
	jp Func_14ec6

.asm_14e23
	ld a, [wd414]
	cp $3
	jr nz, .asm_14e4b
	ld a, [wd474]
	cp $1
	jr z, .asm_14e3c
	cp $2
	jr z, .asm_14e43
	ld a, $5
	ld [wPlayerDenjuu1Field0x07], a
	jr .asm_14e48

.asm_14e3c
	ld a, $5
	ld [wPlayerDenjuu2Field0x07], a
	jr .asm_14e48

.asm_14e43
	ld a, $5
	ld [wPlayerDenjuu3Field0x07], a
.asm_14e48
	jp Func_14e9d

.asm_14e4b
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wd414]
	call Func_143f9
	call Func_143df
	cp $1
	jr nz, .asm_14e96
	ld a, [wd4e6]
	cp $2
	jr c, .asm_14e77
	ld c, $8b
	call Func_3d02
	ld a, $1
	ld [wd411], a
	call Func_165fe
	call Func_3cb5
	jr .asm_14e87

.asm_14e77
	ld a, [wd474]
	ld [wd415], a
	ld [wd457], a
	ld c, $94
	call Func_3d02
	jr Func_14ec6

.asm_14e87
	ld a, [wd474]
	ld [wd415], a
	ld [wd457], a
	ld a, $3b
	ld [wd400], a
	ret

.asm_14e96
	call Func_14ed6
	cp $0
	jr z, .asm_14e77
Func_14e9d: ; 14e9d (5:4e9d)
	ld a, [wd477]
	ld [wd415], a
	ld a, [wd4e7]
	cp $2
	jr c, .asm_14ebc
	ld c, $95
	call Func_3d02
	ld a, $1
	ld [wd411], a
	call Func_165e8
	call Func_3cb5
	jr .asm_14ec3

.asm_14ebc
	ld c, $94
	call Func_3d02
	jr Func_14ec6

.asm_14ec3
	jp Func_3cf8

Func_14ec6: ; 14ec6 (5:4ec6)
	ld a, [wd477]
	ld [wd415], a
	xor a
	ld [wd45a], a
	ld a, $2c
	ld [wd400], a
	ret

Func_14ed6: ; 14ed6 (5:4ed6)
	ld a, [wd46f]
	cp $38
	jr c, .asm_14f0d
	cp $3e
	jr c, .asm_14f10
	cp $41
	jr c, .asm_14f0d
	cp $44
	jr c, .asm_14f10
	cp $4c
	jr c, .asm_14f0d
	cp $4e
	jr c, .asm_14f10
	cp $4f
	jr c, .asm_14f0d
	cp $51
	jr c, .asm_14f10
	cp $6e
	jr c, .asm_14f0d
	cp $74
	jr c, .asm_14f10
	cp $77
	jr c, .asm_14f0d
	cp $7a
	jr c, .asm_14f10
	cp $86
	jr z, .asm_14f10
.asm_14f0d
	ld a, $1
	ret

.asm_14f10
	xor a
	ret

Func_14f12: ; 14f12 (5:4f12)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, [wd414]
	cp $3
	jr nz, .asm_14f27
	ld a, $58
	ld [H_FFA1], a
.asm_14f27
	ld a, $1e
	ld [wd45a], a
	ld a, $3e
	ld [wd400], a
	ret

Func_14f32: ; 14f32 (5:4f32)
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	ret nz
	ld a, $0
	ld [wd40a], a
	ld a, [wd416]
	cp $1
	jr z, .asm_14f59
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $a
	jr z, .asm_14f71
	ld a, $2d
	ld [wd400], a
	ret

.asm_14f59
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $a
	jr z, .asm_14f71
	ld c, $72
	call Func_3d02
	ld a, $36
	ld [wd400], a
	ret

.asm_14f71
	ld c, $2e
	call Func_3d02
	ld a, $c
	ld [wd400], a
	ld a, $22
	ld [wd401], a
	ret

Func_14f81: ; 14f81 (5:4f81)
	call Func_0530
	ld a, [wd4e7]
	cp $1
	jr z, .asm_14fba
	call Func_3cd0
	ld a, [hJoyNew]
	and $10
	jr z, .asm_14f99
	call Func_1654b
	jr .asm_14fa2

.asm_14f99
	ld a, [hJoyNew]
	and $20
	jr z, .asm_14fba
	call Func_1656b
.asm_14fa2
	ld bc, $101
	ld e, $8b
	xor a
	call Func_04fa
	call Func_1658d
	ld a, [wd477]
	ld [wd415], a
	ld a, $23
	ld [wd400], a
	ret

.asm_14fba
	ld a, [hJoyNew]
	and $1
	jr z, .asm_15016
	ld a, [wd414]
	cp $3
	jr nz, .asm_15003
	ld a, [wd474]
	cp $0
	jr z, .asm_14fd4
	cp $1
	jr z, .asm_14fdc
	jr .asm_14fe4

.asm_14fd4
	ld a, [wd477]
	ld [wPlayerDenjuu1Field0x0b], a
	jr .asm_14fea

.asm_14fdc
	ld a, [wd477]
	ld [wPlayerDenjuu2Field0x0b], a
	jr .asm_14fea

.asm_14fe4
	ld a, [wd477]
	ld [wPlayerDenjuu3Field0x0b], a
.asm_14fea
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	ld a, [wd477]
	ld [wd415], a
	xor a
	ld [wd45a], a
	ld a, $2c
	ld [wd400], a
	ret

.asm_15003
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	xor a
	ld [wd45a], a
	ld a, $2c
	ld [wd400], a
	ret

.asm_15016
	ld a, [hJoyNew]
	and $2
	ret z
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	ld a, [wd474]
	cp $1
	jr z, .asm_15036
	cp $2
	jr z, .asm_1503d
	ld a, $3
	ld [wPlayerDenjuu1Field0x07], a
	jr .asm_15042

.asm_15036
	ld a, $3
	ld [wPlayerDenjuu2Field0x07], a
	jr .asm_15042

.asm_1503d
	ld a, $3
	ld [wPlayerDenjuu3Field0x07], a
.asm_15042
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld a, $7
	ld [wd400], a
	ret

Func_15051: ; 15051 (5:5051)
	call Func_0530
	call Func_14ed6
	cp $0
	jr z, .asm_15091
	ld a, [wd4e6]
	cp $1
	jr z, .asm_15091
	call Func_3cd0
	ld a, [hJoyNew]
	and $10
	jr z, .asm_15070
	call Func_1651b
	jr .asm_15079

.asm_15070
	ld a, [hJoyNew]
	and $20
	jr z, .asm_15091
	call Func_1653b
.asm_15079
	ld bc, $105
	ld e, $8b
	xor a
	call Func_04ca
	call Func_1657b
	ld a, [wd474]
	ld [wd415], a
	ld a, $3c
	ld [wd400], a
	ret

.asm_15091
	ld a, [hJoyNew]
	and $1
	jr z, .asm_150aa
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	xor a
	ld [wd45a], a
	ld a, $2c
	ld [wd400], a
	ret

.asm_150aa
	ld a, [hJoyNew]
	and $2
	ret z
	ld a, [wd474]
	ld b, a
	ld a, [wd457]
	cp b
	jr z, .asm_150c8
.asm_150b9
	ld a, [wd457]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, .asm_15079
	call Func_1651b
	jr .asm_150b9

.asm_150c8
	xor a
	ld [wOAMAnimation01], a
	ld a, $1
	ld [wc430], a
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld a, $7
	ld [wd400], a
	ret

Func_150e0: ; 150e0 (5:50e0)
	ld bc, $105
	ld e, $92
	xor a
	call Func_04ca
	call Func_1404a
	call Func_1643a
	ld a, $3b
	ld [wd400], a
	ret

Func_150f5: ; 150f5 (5:50f5)
	ld bc, $101
	ld e, $91
	xor a
	call Func_04fa
	call Func_14062
	call Func_16461
	ld a, $a
	ld [wd400], a
	ret

Func_1510a: ; 1510a (5:510a)
	ld a, [wcb3f]
	cp $0
	jr z, .asm_15149
	call Func_3eee
	cp $ff
	ret z
	or a
	jr nz, .asm_15129
	ld a, [wd45a]
	cp $0
	jr z, .asm_15126
	dec a
	ld [wd45a], a
	ret

.asm_15126
	jp Func_0530

.asm_15129
	dec a
	ld [wd414], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wd414]
	call Func_143f9
	jp Func_1528c

.asm_15149
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	cp $4
	jr nz, .asm_15173
	ld a, $0
	ld [wd414], a
	ld a, [wd474]
	ld [wd415], a
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	ld a, [wd414]
	call Func_143f9
	ld a, $c
	ld [wd400], a
	ret

.asm_15173
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBuffer]
	ld [wCurDenjuu], a
	call Func_0d4e
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
	ld c, $e
	call GetBaseStat_
	ld a, [wCurBaseStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_151d5
	ld a, $2
	jr .asm_151d6

.asm_151af
	ld a, [wCurDenjuuBuffer]
	ld b, $0
	ld c, $f
	call GetBaseStat_
	ld a, [wCurBaseStat]
	ld b, a
	ld a, [wCurDenjuuBufferLevel]
	cp b
	jr c, .asm_151d5
	ld a, [wCurDenjuuBuffer]
	ld c, $9
	call GetBaseStat_
	ld a, [wCurBaseStat]
	or a
	jr z, .asm_151d5
	ld a, $3
	jr .asm_151d6

.asm_151d5
	xor a
.asm_151d6
	ld [wd414], a
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	jr z, .asm_151e9
	xor a
	ld [wd414], a
.asm_151e9
	ld a, [wd414]
	call Func_143f9
	ld a, [wd477]
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
	ld [wd414], a
	call Func_143f9
	ld a, [wd477]
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
	ld a, [wd46f]
	cp $4d
	jr z, .asm_1523e
	cp $43
	jr z, .asm_1523e
	cp $79
	jr nz, .asm_1525c
.asm_1523e
	ld a, [wd477]
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
	ld a, [wd46f]
	cp $73
	jr z, .asm_15273
	cp $74
	jr z, .asm_15273
	cp $3d
	jr z, .asm_15273
	cp $3e
	jr z, .asm_15273
	cp $3f
	jr nz, Func_1528c
.asm_15273
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferCurHP]
	ld b, a
	ld a, [wCurDenjuuBufferMaxHP]
	srl a
	cp b
	jr nc, Func_1528c
	xor a
	ld [wd414], a
	call Func_143f9
Func_1528c: ; 1528c (5:528c)
	ld a, $35
	ld [wd400], a
	ret

Func_15292: ; 15292 (5:5292)
	ld a, [wcb3f]
	or a
	jr z, .asm_152c0
	call Func_3eee
	or a
	ret z
	dec a
	ld [wd417], a
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld a, [wd414]
	cp $3
	jp z, Func_15345
	call Func_143df
	cp $1
	jp nz, Func_15345
	ld a, [wd417]
	ld [wd418], a
	jr .asm_152ee

.asm_152c0
	call Func_143df
	cp $1
	jr nz, .asm_1531e
	ld a, [wd4e7]
	cp $3
	jr z, .asm_152d5
	cp $2
	jr z, .asm_152dc
	jp Func_153d4

.asm_152d5
	call Func_0d4e
	and $2
	jr .asm_152eb

.asm_152dc
	call Func_0d4e
	cp $7f
	jr c, .asm_152e8
	ld a, [wd477]
	jr .asm_152eb

.asm_152e8
	ld a, [wd478]
.asm_152eb
	ld [wd418], a
.asm_152ee
	ld a, [wd418]
	ld b, a
	ld a, [wd477]
	cp b
	jp z, Func_153d4
	ld bc, $101
	ld e, $8b
	ld a, $0
	call Func_04fa
.asm_15303
	ld a, [wd418]
	ld b, a
	ld a, [wd477]
	cp b
	jr z, .asm_15312
	call Func_1654b
	jr .asm_15303

.asm_15312
	call Func_1658d
	call Func_14062
	ld a, $3d
	ld [wd400], a
	ret

.asm_1531e
	ld a, [wd4e6]
	cp $3
	jr z, .asm_1532c
	cp $2
	jr z, .asm_15333
	jp Func_15345

.asm_1532c
	call Func_0d4e
	and $2
	jr .asm_15342

.asm_15333
	call Func_0d4e
	cp $7f
	jr c, .asm_1533f
	ld a, [wd474]
	jr .asm_15342

.asm_1533f
	ld a, [wd475]
.asm_15342
	ld [wd417], a
Func_15345: ; 15345 (5:5345)
	ld a, [wd414]
	cp $3
	jr nz, .asm_15383
	ld a, [wd477]
	cp $1
	jr z, .asm_15364
	cp $2
	jr z, .asm_15371
	ld a, $5
	ld [wEnemyDenjuu1Field0x07], a
	ld a, [wd417]
	ld [wEnemyDenjuu1Field0x0b], a
	jr .asm_1537c

.asm_15364
	ld a, $5
	ld [wEnemyDenjuu2Field0x07], a
	ld a, [wd417]
	ld [wEnemyDenjuu2Field0x0b], a
	jr .asm_1537c

.asm_15371
	ld a, $5
	ld [wEnemyDenjuu3Field0x07], a
	ld a, [wd417]
	ld [wEnemyDenjuu3Field0x0b], a
.asm_1537c
	ld a, $1
	ld [wd4ea], a
	jr .asm_153a6

.asm_15383
	ld a, [wd477]
	cp $1
	jr z, .asm_15393
	cp $2
	jr z, .asm_15398
	ld a, [wEnemyDenjuu1]
	jr .asm_1539d

.asm_15393
	ld a, [wEnemyDenjuu2]
	jr .asm_1539d

.asm_15398
	ld a, [wEnemyDenjuu3]
	jr .asm_1539d

.asm_1539d
	call Func_142cd
	call Func_14ed6
	or a
	jr z, Func_153d4
.asm_153a6
	ld a, [wd417]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, Func_153d4
	ld bc, $105
	ld e, $8b
	xor a
	call Func_04ca
.asm_153b9
	ld a, [wd417]
	ld b, a
	ld a, [wd474]
	cp b
	jr z, .asm_153c8
	call Func_1651b
	jr .asm_153b9

.asm_153c8
	call Func_1657b
	call Func_1404a
	ld a, $24
	ld [wd400], a
	ret

Func_153d4: ; 153d4 (5:53d4)
	ld a, [wd4ea]
	or a
	jr z, .asm_153e9
	xor a
	ld [wd4ea], a
	ld c, $c
	call Func_3d02
	ld a, $2a
	ld [wd400], a
	ret

.asm_153e9
	ld a, $c
	ld [wd400], a
	ret

Func_153ef: ; 153ef (5:53ef)
	ld bc, $105
	ld e, $92
	xor a
	call Func_04ca
	call Func_1643a
	ld a, [wd4ea]
	or a
	jr z, .asm_15410
	xor a
	ld [wd4ea], a
	ld c, $c
	call Func_3d02
	ld a, $2a
	ld [wd400], a
	ret

.asm_15410
	ld a, $c
	ld [wd400], a
	ret

Func_15416: ; 15416 (5:5416)
	ld bc, $101
	ld e, $91
	xor a
	call Func_04fa
	call Func_16461
	ld a, $c
	ld [wd400], a
	ret

Func_15428: ; 15428 (5:5428)
	ld a, [wd45a]
	or a
	jr nz, .asm_1543d
	ld a, [wd414]
	inc a
	ld [wdc34], a
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	ret

.asm_1543d
	ld a, [wd415]
	inc a
	ld [wdc34], a
	ld a, [wd414]
	cp $3
	jr z, .asm_15451
	ld a, $c
	ld [wd400], a
	ret

.asm_15451
	ld c, $c
	call Func_3d02
	ld a, $2a
	ld [wd400], a
	ret

Func_1545c: ; 1545c (5:545c)
	jp Func_16643

Func_1545f: ; 1545f (5:545f)
	ld a, [wd412]
	cp $1
	jr z, .asm_15483
	ld a, $0
	ld [wd40a], a
	ld a, [wd416]
	cp $1
	jr z, .asm_15478
	ld a, $2d
	ld [wd400], a
	ret

.asm_15478
	ld c, $72
	call Func_3d02
	ld a, $36
	ld [wd400], a
	ret

.asm_15483
	ld a, $13
	ld [wd400], a
	ret

Func_15489: ; 15489 (5:5489)
	ld a, [wcb3f]
	cp $1
	jp z, Func_15606
	ld a, [wd40a]
	cp $1
	jr z, .asm_154f7
	ld a, [wPlayerDenjuu2Field0x07]
	cp $0
	jp z, Func_155ed
	cp $4
	jr nz, .asm_154ab
	call Func_0d4e
	cp $c8
	jr c, .asm_154ef
.asm_154ab
	ld a, [wPlayerDenjuu2Field0x07]
	cp $1
	jp nz, Func_155ed
	ld a, [wd450]
	cp $1
	jp z, Func_155ed
	ld a, [wPlayerDenjuu2Field0x0c]
	cp $4
	jp nc, Func_155ed
	ld a, [wPlayerDenjuu2Field0x0a]
	sla a
	add $37
	ld b, a
	call Func_0d4e
	cp b
	jr c, .asm_154ef
	ld a, $4
	ld [wPlayerDenjuu2Field0x07], a
	ld a, [wPlayerDenjuu2Species]
	ld [wd4ca], a
	ld a, [wPlayerDenjuu2Field0x0c]
	ld [wd46a], a
	ld a, $f2
	ld [wdc34], a
	ld a, $1
	ld [wd450], a
	jp Func_15556

.asm_154ef
	ld a, $1
	ld [wPlayerDenjuu2Field0x07], a
	jp Func_155ed

.asm_154f7
	ld a, [wPlayerDenjuu3Field0x07]
	cp $0
	jp z, Func_155ed
	cp $4
	jr nz, .asm_1550a
	call Func_0d4e
	cp $c8
	jr c, .asm_1554e
.asm_1550a
	ld a, [wPlayerDenjuu3Field0x07]
	cp $1
	jp nz, Func_155ed
	ld a, [wd451]
	cp $1
	jp z, Func_155ed
	ld a, [wPlayerDenjuu3Field0x0c]
	cp $4
	jp nc, Func_155ed
	ld a, [wPlayerDenjuu3Field0x0a]
	sla a
	add $37
	ld b, a
	call Func_0d4e
	cp b
	jr c, .asm_1554e
	ld a, $4
	ld [wPlayerDenjuu3Field0x07], a
	ld a, [wPlayerDenjuu3Species]
	ld [wd4cb], a
	ld a, [wPlayerDenjuu3Field0x0c]
	ld [wd46b], a
	ld a, $f3
	ld [wdc34], a
	ld a, $1
	ld [wd451], a
	jp Func_15556

.asm_1554e
	ld a, $1
	ld [wPlayerDenjuu3Field0x07], a
	jp Func_155ed

Func_15556: ; 15556 (5:5556)
	ld a, [wd4ca]
	cp $ff
	jr z, .asm_15585
	call OpenSRAMBank2
	ld a, [wPlayerDenjuu2]
	ld [wd4ce], a
	ld a, [wPlayerDenjuu2Field0x0d]
	ld [wd43c], a
	ld hl, s2_a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
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
	ld a, [wPlayerDenjuu3Field0x0d]
	ld [wd43c], a
	ld hl, s2_a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
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
	ld a, [wEnemyDenjuu2Field0x0d]
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
	ld a, [wEnemyDenjuu3Field0x0d]
	ld [wd43c], a
	ld a, [wd46d]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cd], a
	jr Func_1560c

Func_155ed: ; 155ed (5:55ed)
	ld a, [wd40a]
	cp $1
	jr z, .asm_15601
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ld a, $1
	ld [wdc34], a
	ret

.asm_15601
	ld a, $1
	ld [wdc34], a
Func_15606: ; 15606 (5:5606)
	ld a, $e
	ld [wd400], a
	ret

Func_1560c: ; 1560c (5:560c)
	xor a
	ld [wd401], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $3a
	ld [wd400], a
	ret

Func_1561e: ; 1561e (5:561e)
	ld a, [wc90a]
	cp $1
	jr z, .asm_1564c
	ld hl, s2_b800
	ld d, $0
	ld a, [wd43c]
	ld e, a
	add hl, de
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s2_b800)
	ld [MBC3SRamBank], a
	ld a, [hl]
	push af
	xor a
	ld [MBC3SRamEnable], a
	pop af
	set 7, a
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	jr .asm_15651

.asm_1564c
	ld a, $3c
	ld [wd45a], a
.asm_15651
	ld a, $1
	ld [wcad0], a
	ld c, $6d
	call Func_3d02
	ld a, $34
	ld [wd400], a
	ret

Func_15661: ; 15661 (5:5661)
	call Func_0530
	ld a, [wc90a]
	cp $1
	jr z, .asm_15672
	ld a, [wcfc0]
	or a
	ret nz
	jr .asm_1567a

.asm_15672
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	ret nz
.asm_1567a
	call Func_1bd1
	ld a, $11
	ld [wd400], a
	ret

Func_15683: ; 15683 (5:5683)
	ld a, [wcb3f]
	cp $1
	jp z, Func_157ef
	ld a, [wcb3f]
	or a
	jr z, .asm_156ae
	call Func_0530
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
	ld a, [wd40a]
	cp $1
	jr z, asm_1570f
	ld a, [wEnemyDenjuu2Field0x07]
	cp $0
	jp z, Func_157e0
	cp $4
	jr nz, .asm_156c8
	call Func_0d4e
	cp $c8
	jr c, asm_15707
.asm_156c8
	ld a, [wEnemyDenjuu2Field0x07]
	cp $1
	jp nz, Func_157e0
	ld a, [wd452]
	cp $1
	jp z, Func_157e0
	ld a, [wEnemyDenjuu2Field0x0c]
	cp $4
	jp nc, Func_157e0
	ld a, [wEnemyDenjuu2Field0x0a]
	sla a
	add $37
	ld b, a
	call Func_0d4e
	cp b
	jr c, asm_15707
Func_156ee: ; 156ee (5:56ee)
	ld a, $4
	ld [wEnemyDenjuu2Field0x07], a
	ld a, [wEnemyDenjuu2Species]
	ld [wd4cc], a
	ld a, [wEnemyDenjuu2Field0x0c]
	ld [wd46c], a
	ld a, $1
	ld [wd452], a
	jp Func_15766

asm_15707
	ld a, $1
	ld [wEnemyDenjuu2Field0x07], a
	jp Func_157e0

asm_1570f
	ld a, [wEnemyDenjuu3Field0x07]
	cp $0
	jp z, Func_157e0
	cp $4
	jr nz, .asm_15722
	call Func_0d4e
	cp $c8
	jr c, asm_1575e
.asm_15722
	ld a, [wEnemyDenjuu3Field0x07]
	cp $1
	jr nz, Func_15766
	ld a, [wd453]
	cp $1
	jr z, Func_15766
	ld a, [wEnemyDenjuu3Field0x0c]
	cp $4
	jr nc, Func_15766
	ld a, [wEnemyDenjuu3Field0x0a]
	sla a
	add $37
	ld b, a
	call Func_0d4e
	cp b
	jr c, asm_1575e
Func_15745: ; 15745 (5:5745)
	ld a, $4
	ld [wEnemyDenjuu3Field0x07], a
	ld a, [wEnemyDenjuu3]
	ld [wd4cd], a
	ld a, [wEnemyDenjuu3Field0x0c]
	ld [wd46d], a
	ld a, $1
	ld [wd453], a
	jp Func_15766

asm_1575e
	ld a, $1
	ld [wEnemyDenjuu3Field0x07], a
	jp Func_157e0

Func_15766: ; 15766 (5:5766)
	ld a, [wd4ca]
	cp $ff
	jr z, .asm_15783
	ld [wd4ce], a
	ld a, [wPlayerDenjuu2Field0x0d]
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
	ld a, [wPlayerDenjuu3Field0x0d]
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
	ld a, [wEnemyDenjuu2Field0x0d]
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
	ld a, [wEnemyDenjuu3Field0x0d]
	ld [wd43c], a
	ld a, [wd46d]
	ld [wd46e], a
	ld a, $ff
	ld [wd4cd], a
	jr asm_157f5

Func_157e0: ; 157e0 (5:57e0)
	ld a, [wd40a]
	cp $1
	jr z, Func_157ef
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ret

Func_157ef: ; 157ef (5:57ef)
	ld a, $e
	ld [wd400], a
	ret

asm_157f5
	ld a, $32
	ld [wd400], a
	ret

Func_157fb: ; 157fb (5:57fb)
	ld a, $aa
	ld [wdc34], a
	ld a, $1e
	ld [wd45a], a
	ld c, $72
	call Func_3d02
	ld a, $3f
	ld [wd400], a
	ret

Func_15810: ; 15810 (5:5810)
	call Func_142c1
	ld a, [wcb3f]
	or a
	jr z, .asm_1583e
	call Func_3eee
	cp $aa
	jr z, .asm_1582f
	ld a, [wd45a]
	cp $0
	jr z, .asm_1582c
	dec a
	ld [wd45a], a
	ret

.asm_1582c
	jp Func_0530

.asm_1582f
	ld a, [wdc45]
	inc a
	ld [wdc45], a
	ld hl, VTilesBG tile $60
	ld a, $20
	call ClearString
.asm_1583e
	ld a, [wd475]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, .asm_1587f
	cp $2
	jr z, .asm_15854
	xor a
	call Func_1414b
	jr .asm_15858

.asm_15854
	xor a
	call Func_141aa
.asm_15858
	ld a, $0
	ld [wd43e], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $0
	call Func_16487
	ld a, $4
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d0
	ld [wd411], a
	call Func_3cb5
.asm_1587f
	ld a, [wd476]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, .asm_158c2
	cp $2
	jr z, .asm_15896
	ld a, $1
	call Func_1414b
	jr .asm_1589b

.asm_15896
	ld a, $1
	call Func_141aa
.asm_1589b
	ld a, $1
	ld [wd43e], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $1
	call Func_16487
	ld a, $5
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d1
	ld [wd411], a
	call Func_3cb5
.asm_158c2
	ld a, [wd478]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, .asm_15905
	cp $2
	jr z, .asm_158d9
	ld a, $2
	call Func_1414b
	jr .asm_158de

.asm_158d9
	ld a, $2
	call Func_141aa
.asm_158de
	ld a, $2
	ld [wd43e], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $2
	call Func_16487
	ld a, $6
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d2
	ld [wd411], a
	call Func_3cb5
.asm_15905
	ld a, [wd479]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, .asm_15948
	cp $2
	jr z, .asm_1591c
	ld a, $3
	call Func_1414b
	jr .asm_15921

.asm_1591c
	ld a, $3
	call Func_141aa
.asm_15921
	ld a, $3
	ld [wd43e], a
	ld a, [wCurDenjuuBufferSpecies]
	ld b, $3
	call Func_16487
	ld a, $7
	ld [wd459], a
	callba Func_70448
	ld a, BANK(Func_15810)
	ld [wPrevROMBank], a
	ld a, $d3
	ld [wd411], a
	call Func_3cb5
.asm_15948
	call Func_1643a
	call Func_16461
	ld a, [wPlayerDenjuu1Speed]
	ld b, a
	ld [wd43f], a
	ld a, [wd4e6]
	cp $1
	jr z, .asm_15979
	ld a, [wPlayerDenjuu2Speed]
	cp b
	jr c, .asm_15965
	ld [wd43f], a
.asm_15965
	ld a, [wd4e6]
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
	ld a, [wd4e7]
	cp $1
	jr z, .asm_159ae
	ld a, [wd43f]
	ld b, a
	ld a, [wEnemyDenjuu2Speed]
	cp b
	jr c, .asm_1599a
	ld [wd43f], a
.asm_1599a
	ld a, [wd4e7]
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
	ld [wd400], a
	ret

Func_159bc: ; 159bc (5:59bc)
	ld a, [wcb3f]
	or a
	jr nz, .asm_159cf
	ld a, [hJoyLast]
	and $1
	jr z, .asm_159cf
	ld a, $1
	ld [wd4ad], a
	jr .asm_159d3

.asm_159cf
	xor a
	ld [wd4ad], a
.asm_159d3
	ld a, [wd474]
	call Func_140d9
	ld a, [wd477]
	call Func_14102
	ld a, [wPlayerDenjuu1Field0x07]
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
	ld a, [wPlayerDenjuu1Field0x05]
	inc a
	ld [wPlayerDenjuu1Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a26
	ld a, [wPlayerDenjuu1Field0x05]
	inc a
	ld [wPlayerDenjuu1Field0x05], a
	ld a, [wPlayerDenjuu1Field0x05]
	inc a
	ld [wPlayerDenjuu1Field0x05], a
.asm_15a26
	ld a, [wPlayerDenjuu2Field0x07]
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
	ld a, [wPlayerDenjuu2Field0x05]
	inc a
	ld [wPlayerDenjuu2Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15a71
	ld a, [wPlayerDenjuu2Field0x05]
	inc a
	ld [wPlayerDenjuu2Field0x05], a
	ld a, [wPlayerDenjuu2Field0x05]
	inc a
	ld [wPlayerDenjuu2Field0x05], a
.asm_15a71
	ld a, [wPlayerDenjuu3Field0x07]
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
	ld a, [wPlayerDenjuu3Field0x05]
	inc a
	ld [wPlayerDenjuu3Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15abc
	ld a, [wPlayerDenjuu3Field0x05]
	inc a
	ld [wPlayerDenjuu3Field0x05], a
	ld a, [wPlayerDenjuu3Field0x05]
	inc a
	ld [wPlayerDenjuu3Field0x05], a
.asm_15abc
	ld a, [wEnemyDenjuu1Field0x07]
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
	ld a, [wEnemyDenjuu1Field0x05]
	inc a
	ld [wEnemyDenjuu1Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b03
	ld a, [wEnemyDenjuu1Field0x05]
	inc a
	ld [wEnemyDenjuu1Field0x05], a
	ld a, [wEnemyDenjuu1Field0x05]
	inc a
	ld [wEnemyDenjuu1Field0x05], a
.asm_15b03
	ld a, [wEnemyDenjuu2Field0x07]
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
	ld a, [wEnemyDenjuu2Field0x05]
	inc a
	ld [wEnemyDenjuu2Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b4e
	ld a, [wEnemyDenjuu2Field0x05]
	inc a
	ld [wEnemyDenjuu2Field0x05], a
	ld a, [wEnemyDenjuu2Field0x05]
	inc a
	ld [wEnemyDenjuu2Field0x05], a
.asm_15b4e
	ld a, [wEnemyDenjuu3Field0x07]
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
	ld a, [wEnemyDenjuu3Field0x05]
	inc a
	ld [wEnemyDenjuu3Field0x05], a
	ld a, [wd4ad]
	or a
	jr z, .asm_15b99
	ld a, [wEnemyDenjuu3Field0x05]
	inc a
	ld [wEnemyDenjuu3Field0x05], a
	ld a, [wEnemyDenjuu3Field0x05]
	inc a
	ld [wEnemyDenjuu3Field0x05], a
.asm_15b99
	ld a, [wd475]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, asm_15bc8
	cp $2
	jr z, .asm_15bbd
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call Func_3980
	ld [wd430], a
	xor a
	call Func_14178
	jp Func_15bc1

.asm_15bbd
	xor a
	call Func_141d7
Func_15bc1: ; 15bc1 (5:5bc1)
	xor a
	ld [wd43e], a
	call Func_3cd0
asm_15bc8
	ld a, [wd476]
	call GetNthPlayerDenjuu
	call Func_3f2a
	or a
	jr z, asm_15bfa
	cp $2
	jr z, .asm_15bed
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call Func_3980
	ld [wd431], a
	ld a, $1
	call Func_14178
	jp Func_15bf2

.asm_15bed
	ld a, $1
	call Func_141d7
Func_15bf2: ; 15bf2 (5:5bf2)
	ld a, $1
	ld [wd43e], a
	call Func_3cd0
asm_15bfa
	ld a, [wd478]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, asm_15c2c
	cp $2
	jr z, .asm_15c1f
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call Func_3980
	ld [wd432], a
	ld a, $2
	call Func_14178
	jp Func_15c24

.asm_15c1f
	ld a, $2
	call Func_141d7
Func_15c24: ; 15c24 (5:5c24)
	ld a, $2
	ld [wd43e], a
	call Func_3cd0
asm_15c2c
	ld a, [wd479]
	call GetNthEnemyDenjuu
	call Func_3f2a
	or a
	jr z, asm_15c5e
	cp $2
	jr z, .asm_15c51
	ld a, [wCurDenjuuBufferField0x08]
	ld e, a
	ld a, [wCurDenjuuBufferField0x06]
	call Func_3980
	ld [wd433], a
	ld a, $3
	call Func_14178
	jp Func_15c56

.asm_15c51
	ld a, $3
	call Func_141d7
Func_15c56: ; 15c56 (5:5c56)
	ld a, $3
	ld [wd43e], a
	call Func_3cd0
asm_15c5e
	ld a, [wcb3f]
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
	ld a, [wPlayerDenjuu1Field0x07]
	cp $3
	jr z, .asm_15cfc
	cp $5
	jr nz, .asm_15d15
	ld a, [wPlayerDenjuu1Field0x09]
	ld b, a
	ld a, [wPlayerDenjuu1Field0x05]
	cp b
	jp c, .asm_15d15
	xor a
	ld [wPlayerDenjuu1Field0x05], a
	ld a, $59
	ld [H_FFA1], a
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
	ld a, [wPlayerDenjuu2Field0x07]
	cp $3
	jr z, asm_15d68
	cp $1
	jr z, .asm_15d3f
	cp $5
	jr nz, asm_15d83
	ld a, [wPlayerDenjuu2Field0x09]
	ld b, a
	ld a, [wPlayerDenjuu2Field0x05]
	cp b
	jr c, asm_15d83
	xor a
	ld [wPlayerDenjuu2Field0x05], a
	ld a, $59
	ld [H_FFA1], a
	ld a, $1
	ld [wd47f], a
	jp Func_15f0f

.asm_15d3f
	ld a, [wPlayerDenjuu2Field0x08]
	ld e, a
	ld a, [wPlayerDenjuu2Field0x06]
	call Func_3980
	cp $30
	jr c, asm_15d83
	ld a, $a
	ld [wdc34], a
Func_15d52: ; 15d52 (5:5d52)
	ld a, $2
	ld [wPlayerDenjuu2Field0x07], a
	ld a, $30
	ld [wd430], a
	xor a
	ld [wPlayerDenjuu2Field0x06], a
	ld a, $52
	ld [H_FFA1], a
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
	ld a, [wPlayerDenjuu3Field0x07]
	cp $3
	jr z, asm_15dd6
	cp $1
	jr z, .asm_15dad
	cp $5
	jr nz, asm_15df1
	ld a, [wPlayerDenjuu3Field0x09]
	ld b, a
	ld a, [wPlayerDenjuu3Field0x05]
	cp b
	jr c, asm_15df1
	xor a
	ld [wPlayerDenjuu3Field0x05], a
	ld a, $59
	ld [H_FFA1], a
	ld a, $2
	ld [wd47f], a
	jp Func_15f0f

.asm_15dad
	ld a, [wPlayerDenjuu3Field0x08]
	ld e, a
	ld a, [wPlayerDenjuu3Field0x06]
	call Func_3980
	cp $30
	jr c, asm_15df1
	ld a, $b
	ld [wdc34], a
Func_15dc0: ; 15dc0 (5:5dc0)
	ld a, $2
	ld [wPlayerDenjuu3Field0x07], a
	ld a, $30
	ld [wd431], a
	xor a
	ld [wPlayerDenjuu3Field0x06], a
	ld a, $52
	ld [H_FFA1], a
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
	ld a, [wEnemyDenjuu1Field0x07]
	cp $3
	jr z, .asm_15e17
	cp $5
	jr nz, .asm_15e32
	ld a, [wEnemyDenjuu1Field0x09]
	ld b, a
	ld a, [wEnemyDenjuu1Field0x05]
	cp b
	jr c, .asm_15e32
	xor a
	ld [wEnemyDenjuu1Field0x05], a
	ld a, $59
	ld [H_FFA1], a
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
	ld a, [wEnemyDenjuu2Field0x07]
	cp $3
	jr z, asm_15e85
	cp $1
	jr z, .asm_15e5c
	cp $5
	jr nz, asm_15ea0
	ld a, [wEnemyDenjuu2Field0x09]
	ld b, a
	ld a, [wEnemyDenjuu2Field0x05]
	cp b
	jr c, asm_15ea0
	xor a
	ld [wEnemyDenjuu2Field0x05], a
	ld a, $59
	ld [H_FFA1], a
	ld a, $4
	ld [wd47f], a
	jp Func_15f0f

.asm_15e5c
	ld a, [wEnemyDenjuu2Field0x08]
	ld e, a
	ld a, [wEnemyDenjuu2Field0x06]
	call Func_3980
	cp $30
	jr c, asm_15ea0
	ld a, $14
	ld [wdc34], a
Func_15e6f: ; 15e6f (5:5e6f)
	ld a, $2
	ld [wEnemyDenjuu2Field0x07], a
	ld a, $30
	ld [wd432], a
	xor a
	ld [wEnemyDenjuu2Field0x06], a
	ld a, $52
	ld [H_FFA1], a
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
	ld a, [wEnemyDenjuu3Field0x07]
	cp $3
	jr z, asm_15ef3
	cp $1
	jr z, .asm_15eca
	cp $5
	jr nz, asm_15f0e
	ld a, [wEnemyDenjuu3Field0x09]
	ld b, a
	ld a, [wEnemyDenjuu3Field0x05]
	cp b
	jr c, asm_15f0e
	xor a
	ld [wEnemyDenjuu3Field0x05], a
	ld a, $59
	ld [H_FFA1], a
	ld a, $5
	ld [wd47f], a
	jp Func_15f0f

.asm_15eca
	ld a, [wEnemyDenjuu3Field0x08]
	ld e, a
	ld a, [wEnemyDenjuu3Field0x06]
	call Func_3980
	cp $30
	jr c, asm_15f0e
	ld a, $15
	ld [wdc34], a
Func_15edd: ; 15edd (5:5edd)
	ld a, $2
	ld [wEnemyDenjuu3Field0x07], a
	ld a, $30
	ld [wd433], a
	xor a
	ld [wEnemyDenjuu3Field0x06], a
	ld a, $52
	ld [H_FFA1], a
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
	ld [wdc34], a
Func_15f16: ; 15f16 (5:5f16)
	xor a
	ld [wd45a], a
	ld a, $10
	ld [wd400], a
	ret

Func_15f20: ; 15f20 (5:5f20)
	xor a
	ld [wd45a], a
	ld [wd45b], a
	ld a, $20
	ld [wd400], a
	ret

Func_15f2d: ; 15f2d (5:5f2d)
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp $15
	ret nz
	ld a, $25
	ld [wd400], a
	ret

Func_15f3d: ; 15f3d (5:5f3d)
	ld bc, $c
	ld e, $80
	ld a, $0
	call Func_04ca
	ld bc, $30e
	ld e, $83
	ld a, $0
	call Func_04da
	ld a, $4
	ld [wd400], a
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
	call Func_050f
	or a
	ret z
	call Func_1404a
	call Func_14062
	ld a, $2b
	ld [wd400], a
	ret

Func_15f79: ; 15f79 (5:5f79)
	ld a, [wd40a]
	cp $1
	jr z, asm_15f9b
	ld a, [wd40a]
	inc a
	ld [wd40a], a
	ld a, [wd416]
	cp $1
	jp z, Func_15f95
	ld a, $2d
	ld [wd400], a
	ret

Func_15f95: ; 15f95 (5:5f95)
	ld a, $36
	ld [wd400], a
	ret

asm_15f9b
	ld a, $e
	ld [wd400], a
	ret

Func_15fa1: ; 15fa1 (5:5fa1)
	ld a, [wd4ce]
	call Func_142cd
	ld a, $3c
	ld [wd45a], a
	ld c, $69
	call Func_3d02
	jp Func_3cf8

Func_15fb4: ; 15fb4 (5:5fb4)
	call Func_0530
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	ret nz
	ld a, $2b
	ld [wd400], a
	ret

Func_15fc5: ; 15fc5 (5:5fc5)
	ld a, [wd45a]
	cp $a
	jr nc, .asm_15fd0
	ld e, $8e
	jr .asm_15fd2

.asm_15fd0
	ld e, $82
.asm_15fd2
	xor a
	jp Func_04da

Func_15fd6: ; 15fd6 (5:5fd6)
	ld a, [wd45b]
	cp $5
	jr nc, .asm_1603f
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp $14
	jr z, .asm_16033
	ld a, [wd475]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $2
	jr nz, .asm_15ffb
	ld bc, $30e
	jp Func_15fc5

.asm_15ffb
	ld a, [wd476]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $2
	jr nz, .asm_1600e
	ld bc, $310
	jp Func_15fc5

.asm_1600e
	ld a, [wd478]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $2
	jr nz, .asm_16021
	ld bc, $d0e
	jp Func_15fc5

.asm_16021
	ld a, [wd479]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $2
	ret nz
	ld bc, $d10
	jp Func_15fc5

.asm_16033
	xor a
	ld [wd45a], a
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ret

.asm_1603f
	call Func_3f02
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld bc, $30e
	ld e, $83
	xor a
	call Func_04da
	ld a, [wPlayerDenjuu2Field0x07]
	cp $2
	jp z, Func_16076
	ld a, [wPlayerDenjuu3Field0x07]
	cp $2
	jp z, Func_16076
	ld a, [wEnemyDenjuu2Field0x07]
	cp $2
	jp z, Func_16085
	ld a, [wEnemyDenjuu3Field0x07]
	cp $2
	jp z, Func_16085
	jr asm_16093

Func_16076: ; 16076 (5:6076)
	xor a
	ld [wd470], a
	ld bc, $105
	ld e, $8b
	xor a
	call Func_04ca
	jr asm_16093

Func_16085: ; 16085 (5:6085)
	ld a, $1
	ld [wd470], a
	ld bc, $101
	ld e, $8b
	xor a
	call Func_04fa
asm_16093
	ld a, $1e
	ld [wd400], a
	ret

Func_16099: ; 16099 (5:6099)
	ld bc, $c
	ld e, $80
	xor a
	call Func_04ca
	ld bc, $30e
	ld e, $83
	xor a
	call Func_04da
	ld a, [wPlayerDenjuu2Field0x07]
	cp $2
	jp z, Func_160cb
	ld a, [wPlayerDenjuu3Field0x07]
	cp $2
	jp z, Func_16108
	ld a, [wEnemyDenjuu2Field0x07]
	cp $2
	jp z, Func_1615f
	ld a, [wEnemyDenjuu3Field0x07]
	cp $2
	jp z, Func_1619e
Func_160cb: ; 160cb (5:60cb)
	ld a, [wPlayerDenjuu2]
	ld [wd435], a
	ld hl, DenjuuNames
	call GetName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wd435]
	call Func_142ec
	ld a, [wPlayerDenjuu2Field0x0d]
	ld hl, VTilesBG tile $20
	call Func_142f9
	ld a, [wPlayerDenjuu2MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call Func_1407d
	ld a, $1
	call Func_140d9
	ld a, $3
	ld [wPlayerDenjuu2Field0x07], a
	jp Func_161f5

Func_16108: ; 16108 (5:6108)
	ld a, $1
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $4
	jr z, .asm_16118
	cp $1
	jr nz, .asm_16122
.asm_16118
	ld a, $2
	ld [wd475], a
	ld a, $1
	ld [wd476], a
.asm_16122
	ld a, [wPlayerDenjuu3Species]
	ld [wd435], a
	ld hl, DenjuuNames
	call GetName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wd435]
	call Func_142ec
	ld a, [wPlayerDenjuu3Field0x0d]
	ld hl, VTilesBG tile $20
	call Func_142f9
	ld a, [wPlayerDenjuu3MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call Func_1407d
	ld a, $2
	call Func_140d9
	ld a, $3
	ld [wPlayerDenjuu3Field0x07], a
	jp Func_161f5

Func_1615f: ; 1615f (5:615f)
	ld a, [wEnemyDenjuu2]
	ld [wd435], a
	ld hl, DenjuuNames
	call GetName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wd435]
	call Func_142df
	ld a, [wd435]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	call GetAndPrintName75LeftAlign_
	ld a, [wEnemyDenjuu2MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call Func_140ab
	ld a, $1
	call Func_14102
	ld a, $3
	ld [wEnemyDenjuu2Field0x07], a
	jr Func_161f5

Func_1619e: ; 1619e (5:619e)
	ld a, $1
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x07]
	cp $4
	jr z, .asm_161ae
	cp $1
	jr nz, .asm_161b8
.asm_161ae
	ld a, $2
	ld [wd478], a
	ld a, $1
	ld [wd479], a
.asm_161b8
	ld a, [wEnemyDenjuu3Species]
	ld [wd435], a
	ld hl, DenjuuNames
	call GetName75
	ld bc, wStringBuffer
	call Func_1402a
	call Func_14012
	ld a, [wd435]
	call Func_142df
	ld a, [wd435]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	call GetAndPrintName75LeftAlign_
	ld a, [wEnemyDenjuu3MaxHP]
	ld [wCurDenjuuBufferCurHP], a
	ld [wCurDenjuuBufferMaxHP], a
	call Func_140ab
	ld a, $2
	call Func_14102
	ld a, $3
	ld [wEnemyDenjuu3Field0x07], a
Func_161f5: ; 161f5 (5:61f5)
	ld a, $22
	ld [wd400], a
	ret

Func_161fb: ; 161fb (5:61fb)
	ld a, $10
	ld hl, VTilesBG tile $70
	call ClearString
	ld de, BattleString_Arrived
	ld hl, VTilesBG tile $78
	call Func_142aa
	ld a, [wd470]
	cp $1
	jr z, .asm_16239
	ld bc, $105
	ld e, $92
	xor a
	call Func_04ca
	ld bc, $20e
	ld e, $99
	xor a
	call Func_04ca
	ld a, $28
	ld [wd4f4], a
	ld a, $3c
	ld [wd4fa], a
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	jr .asm_1625d

.asm_16239
	ld bc, $101
	ld e, $91
	xor a
	call Func_04fa
	ld bc, $20e
	ld e, $9c
	xor a
	call Func_04ca
	ld a, $78
	ld [wd4f4], a
	ld a, $28
	ld [wd4fa], a
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
.asm_1625d
	ld bc, $105
	ld e, $8c
	xor a
	call Func_04da
	ld bc, $4
	call GetCGB_OBLayout_
	call Func_142c1
	ld a, $4
	ld [wd43e], a
	ld hl, VTilesOB tile $00
	ld a, $7d
	ld [wd41d], a
	call Func_3d18
	xor a
	ld [wd45a], a
	ld a, $1f
	ld [wd400], a
	ret

Func_16289: ; 16289 (5:6289)
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp $1e
	ret c
	xor a
	ld [wOAMAnimation05], a
	ld a, $1
	ld [wc430], a
	ld a, $10
	ld hl, VTilesBG tile $70
	call ClearString
	ld hl, Data_1d5888
	call Func_0620
	ld hl, wd4d0
	call Func_14020
	ld a, [wd470]
	cp $1
	jr z, .asm_162bc
	call Func_3d7f
	jr .asm_162c2

.asm_162bc
	ld a, [wd435]
	call Func_142cd
.asm_162c2
	ld c, $2
	call Func_3d02
	ld a, $12
	ld [wd400], a
	ret

Func_162cd: ; 162cd (5:62cd)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, [wd470]
	cp $1
	jr z, .asm_162f5
	ld a, [wd4e6]
	inc a
	ld [wd4e6], a
	ld bc, $105
	ld e, $8b
	xor a
	call Func_04ca
	call Func_1657b
	call Func_1643a
	jr .asm_1630b

.asm_162f5
	ld a, [wd4e7]
	inc a
	ld [wd4e7], a
	ld bc, $101
	ld e, $8b
	xor a
	call Func_04fa
	call Func_1658d
	call Func_16461
.asm_1630b
	ld a, [wd4e5]
	inc a
	ld [wd4e5], a
	ld a, $21
	ld [wd400], a
	ret

Func_16318: ; 16318 (5:6318)
	ld a, [wd470]
	cp $1
	jr z, .asm_1632d
	ld bc, $105
	ld e, $92
	xor a
	call Func_04ca
	call Func_1404a
	jr .asm_16339

.asm_1632d
	ld bc, $101
	ld e, $91
	xor a
	call Func_04fa
	call Func_14062
.asm_16339
	ld bc, $20e
	ld e, $9a
	xor a
	call Func_04ca
	ld a, $e
	ld [wd400], a
	ret

Func_16348: ; 16348 (5:6348)
	xor a
	ld [wd400], a
	ld a, [wcb3f]
	cp $1
	jr z, .asm_16356
	jp IncrementSubroutine

.asm_16356
	xor a
	ld [wd456], a
	ld a, $3
	ld [wSubroutine], a
	ret

Func_16360: ; 16360 (5:6360)
	ld a, [wcb3f]
	cp $1
	jp z, Func_163d0
Data_16368: ; 16368 (5:6368)
	ld a, [wd403]
	cp $0
	jp nz, Func_163d0
	call Func_3f0a
	ld a, [wd5cd]
	or a
	jr z, Func_163d0
	call OpenSRAMBank2
	ld hl, s2_a002
	ld a, [wcdb4]
	call Func_3d0e
	ld a, [hl]
	cp $1
	jr c, .asm_1638d
	sub $1
	ld [hl], a
.asm_1638d
	call CloseSRAM
	ld bc, $20d
	ld e, $95
	xor a
	call Func_04ca
	ld de, BattleString_Escaped
	ld hl, VTilesBG tile $78
	call Func_142aa
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBuffer]
	ld c, $0
	ld de, VTilesBG tile $40
	call Func_0516
	ld bc, $105
	ld e, $94
	xor a
	call Func_04ca
	ld bc, $105
	ld e, $8c
	xor a
	call Func_04da
	ld a, $a
	ld [wd45a], a
	ld a, $2f
	ld [wd400], a
	ret

Func_163d0: ; 163d0 (5:63d0)
	ld a, $a
	ld [wd45a], a
	ld c, $24
	call Func_3d02
	ld a, $30
	ld [wd400], a
	ret

Func_163e0: ; 163e0 (5:63e0)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $e
	ld [wd400], a
	ret

Func_163ef: ; 163ef (5:63ef)
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	or a
	ret nz
	ld a, $15
	ld [wd400], a
	ret

Func_163fe: ; 163fe (5:63fe)
	ld a, [wSCX]
	cp $64
	jr nc, .asm_1640b
	add $8
	ld [wSCX], a
	ret

.asm_1640b
	call Func_14005
	ld a, $10
	ld [wcf96], a
	jp Func_3cf8

Func_16416: ; 16416 (5:6416)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wc46c], a
	ld [wSCX], a
	ld [wWX], a
	call Func_142af
	xor a
	ld [wd401], a
	ld [wd400], a
	ld [wSCX], a
	ld a, $2
	ld [wSubroutine], a
	ret

Func_1643a: ; 1643a (5:643a)
	ld hl, VTilesBG tile $18
	ld a, $4
	call ClearString
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	ret z
	ld bc, $100
	ld e, $ba
	ld a, $0
	call Func_04ca
	ld a, [wCurDenjuuBufferField0x12]
	ld b, a
	ld hl, VTilesBG tile $18
	jp Func_059f

Func_16461: ; 16461 (5:6461)
	ld hl, VTilesBG tile $1c
	ld a, $4
	call ClearString
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x12]
	or a
	ret z
	ld bc, $108
	ld e, $bb
	xor a
	call Func_04fa
	ld a, [wCurDenjuuBufferField0x12]
	ld b, a
	ld hl, VTilesBG tile $1c
	jp Func_059f

Func_16487: ; 16487 (5:6487)
	push af
	ld a, b
	cp $1
	jr z, .asm_164a4
	cp $2
	jr z, .asm_164b3
	cp $3
	jr z, .asm_164c2
	ld a, $10
	ld [wd4f0], a
	ld a, $70
	ld [wd4f6], a
	ld hl, VTilesOB tile $50
	jr .asm_164cf

.asm_164a4
	ld a, $10
	ld [wd4f1], a
	ld a, $80
	ld [wd4f7], a
	ld hl, VTilesOB tile $5c
	jr .asm_164cf

.asm_164b3
	ld a, $60
	ld [wd4f2], a
	ld a, $70
	ld [wd4f8], a
	ld hl, VTilesOB tile $68
	jr .asm_164cf

.asm_164c2
	ld a, $60
	ld [wd4f3], a
	ld a, $80
	ld [wd4f9], a
	ld hl, VTilesOB tile $74
.asm_164cf
	pop af
	push hl
	ld [wd409], a
	call Func_05d1
	pop hl
	ld a, [wd409]
	jp GetOverworldSprite_SizeHL

Func_164de:
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

Func_164f5:
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

Func_16504:
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
	ld bc, wd474
	ld a, [wd4e6]
	cp $3
	jr z, .asm_16528
	jp Func_164f5

.asm_16528
	jp Func_164de

	ld bc, wd474
	ld a, [wd5c6]
	cp $3
	jr z, .asm_16538
	jp Func_164f5

.asm_16538
	jp Func_164de

Func_1653b: ; 1653b (5:653b)
	ld bc, wd474
	ld a, [wd4e6]
	cp $3
	jr z, .asm_16548
	jp Func_164f5

.asm_16548
	jp Func_16504

Func_1654b: ; 1654b (5:654b)
	ld bc, wd477
	ld a, [wd4e7]
	cp $3
	jr z, .asm_16558
	jp Func_164f5

.asm_16558
	jp Func_164de

	ld bc, wd477
	ld a, [wd5c7]
	cp $3
	jr z, .asm_16568
	jp Func_164f5

.asm_16568
	jp Func_164de

Func_1656b: ; 1656b (5:656b)
	ld bc, wd477
	ld a, [wd4e7]
	cp $3
	jr z, .asm_16578
	jp Func_164f5

.asm_16578
	jp Func_16504

Func_1657b: ; 1657b (5:657b)
	ld a, [wd474]
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142ec
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_1658d: ; 1658d (5:658d)
	ld a, [wd477]
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferSpecies]
	call Func_142df
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_1659f: ; 1659f (5:659f)
	ld a, [wd414]
	cp $1
	jr z, .asm_165ad
	ld a, $70
	ld [wd4f6], a
	jr .asm_165b2

.asm_165ad
	ld a, $80
	ld [wd4f6], a
.asm_165b2
	ld a, $c
	ld [wd4f0], a
	xor a
	ld [wd43e], a
	ld a, $d0
	ld [wd41d], a
	jp Func_3d18

Func_165c3: ; 165c3 (5:65c3)
	ld hl, wd4f7
	ld [hl], $50
	ld a, [wd414]
	ld b, a
	or a
	jr z, .asm_165d6
.asm_165cf
	ld a, [hl]
	add $10
	ld [hl], a
	dec b
	jr nz, .asm_165cf
.asm_165d6
	ld a, $50
	ld [wd4f1], a
	ld a, $1
	ld [wd43e], a
	ld a, $d0
	ld [wd41d], a
	jp Func_3d18

Func_165e8: ; 165e8 (5:65e8)
	xor a
	ld [wd43e], a
	ld a, $50
	ld [wd4f0], a
	ld a, $48
	ld [wd4f6], a
	ld a, $d2
	ld [wd41d], a
	jp Func_3d18

Func_165fe: ; 165fe (5:65fe)
	xor a
	ld [wd43e], a
	ld a, $8
	ld [wd4f0], a
	ld a, $58
	ld [wd4f6], a
	ld a, $d2
	ld [wd41d], a
	jp Func_3d18

Func_16614: ; 16614 (5:6614)
	ld a, [wd416]
	cp $1
	jr z, .asm_1662c
	ld d, $0
	ld a, [wd474]
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
	ld a, [wd477]
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
	ld hl, Pointers_1664d
	call GetHalfwordFromTable
	jp [hl]

Pointers_1664d:
	dw Func_166a5
	dw Func_16709
	dw Func_16724
	dw Func_168d6
	dw Func_16c11
	dw Func_16c6e
	dw Func_16e82
	dw Func_16f47
	dw Func_16f84
	dw Func_16f97
	dw Func_17122
	dw Func_1717f
	dw Func_17347
	dw Func_173cf
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

Func_166a5:
	dr $166a5, $16709

Func_16709:
	dr $16709, $16724

Func_16724:
	dr $16724, $16801

Func_16801:
	dr $16801, $168d6

Func_168d6:
	dr $168d6, $16aa7

Func_16aa7:
	dr $16aa7, $16c11

Func_16c11:
	dr $16c11, $16c6e

Func_16c6e:
	dr $16c6e, $16c7f

Func_16c7f:
	dr $16c7f, $16cba

Func_16cba:
	dr $16cba, $16cda

Func_16cda:
	dr $16cda, $16e1d

Func_16e1d:
	dr $16e1d, $16e29

Func_16e29:
	dr $16e29, $16e82

Func_16e82:
	dr $16e82, $16f47

Func_16f47:
	dr $16f47, $16f84

Func_16f84:
	dr $16f84, $16f97

Func_16f97:
	dr $16f97, $170c5

Func_170c5:
	dr $170c5, $170d8

Func_170d8:
	dr $170d8, $17122

Func_17122:
	dr $17122, $1717f

Func_1717f:
	dr $1717f, $17190

Func_17190:
	dr $17190, $172dd

Func_172dd:
	dr $172dd, $172e9

Func_172e9:
	dr $172e9, $17347

Func_17347:
	dr $17347, $173cf

Func_173cf:
	dr $173cf, $1740c

Func_1740c:
	dr $1740c, $1741f

Func_1741f:
	dr $1741f, $1747e

Func_1747e:
	dr $1747e, $174b9

Func_174b9:
	dr $174b9, $17521

Func_17521:
	dr $17521, $17589

Func_17589:
	dr $17589, $175bd

Func_175bd:
	dr $175bd, $175ce

Func_175ce:
	dr $175ce, $17612

Func_17612:
	dr $17612, $17689

Func_17689:
	dr $17689, $176b9

Func_176b9:
	dr $176b9, $17aea

Func_17aea:
	dr $17aea, $17dd6

Func_17dd6:
	dr $17dd6, $17de5

Func_17de5:
	dr $17de5, $17df4

Func_17df4:
	dr $17df4, $17e09

Func_17e09:
	dr $17e09, $17ef6

Func_17ef6:
	dr $17ef6, $17f13

Func_17f13:
	dr $17f13, $17ff8
