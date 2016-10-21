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
	ld a, [wd502]
	ld [wc955], a
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

Data_1450d:
	dr $1450d, $1452d

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
	ld a, [wd542]
	call Func_142df
	ld a, [wd500]
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
	call Func_1412b
	ld a, [wd584]
	ld [wd435], a
	ld a, [wd58b]
	cp $5
	jr nz, .asm_14791
	ld a, [wd584]
	call Func_142cd
	ld a, [wd584]
	ld [wd497], a
	ld a, $3
	call Func_143f9
	ld a, [wd58f]
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
	ld a, [wd58f]
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
	ld a, [wd58f]
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
	call Func_1412b
	ld a, [wd596]
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
	ld a, [wd595]
	ld b, a
	ld a, $cd
	add b
	ld b, a
	call Func_0d4e
	cp $80
	jr nc, Func_14855
Func_147ef: ; 147ef (5:47ef)
	ld a, [wd596]
	call Func_148a3
	call Func_3d02
	ld a, [wd474]
	cp $1
	jr z, .asm_1480c
	cp $2
	jr z, .asm_14815
	xor a
	ld [wd512], a
	ld [wd506], a
	jr .asm_1481c

.asm_1480c
	xor a
	ld [wd528], a
	ld [wd51c], a
	jr .asm_1481c

.asm_14815
	xor a
	ld [wd53e], a
	ld [wd532], a
.asm_1481c
	ld hl, VTilesBG tile $18
	ld a, $4
	call Func_3d5c
	ld a, [wd458]
	cp $0
	jp z, Func_14831
	ld a, $ee
	ld [wdc34], a
Func_14831: ; 14831 (5:4831)
	ld a, [wd596]
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
	ld a, [wd596]
	call Func_1489e
	jr asm_14890

Func_1486d: ; 1486d (5:486d)
	ld a, [wd458]
	cp $0
	jp z, Func_1487a
	ld a, $e8
	ld [wdc34], a
Func_1487a: ; 1487a (5:487a)
	ld hl, $6368
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
	call Func_1412b
	ld a, [wd596]
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

Func_1492f:
	dr $1492f, $14aad

Func_14aad:
	dr $14aad, $14af8

Func_14af8:
	dr $14af8, $14b07

Func_14b07:
	dr $14b07, $14bc6

Func_14bc6:
	dr $14bc6, $14c34

Func_14c34:
	dr $14c34, $14d1f

Func_14d1f:
	dr $14d1f, $14ddd

Func_14ddd:
	dr $14ddd, $14f12

Func_14f12:
	dr $14f12, $14f32

Func_14f32:
	dr $14f32, $14f81

Func_14f81:
	dr $14f81, $15051

Func_15051:
	dr $15051, $150e0

Func_150e0:
	dr $150e0, $150f5

Func_150f5:
	dr $150f5, $1510a

Func_1510a:
	dr $1510a, $15292

Func_15292:
	dr $15292, $153ef

Func_153ef:
	dr $153ef, $15416

Func_15416:
	dr $15416, $15428

Func_15428:
	dr $15428, $1545c

Func_1545c:
	dr $1545c, $1545f

Func_1545f:
	dr $1545f, $15489

Func_15489:
	dr $15489, $1561e

Func_1561e:
	dr $1561e, $15661

Func_15661:
	dr $15661, $15683

Func_15683:
	dr $15683, $157fb

Func_157fb:
	dr $157fb, $15810

Func_15810:
	dr $15810, $159bc

Func_159bc:
	dr $159bc, $15f2d

Func_15f2d:
	dr $15f2d, $15f3d

Func_15f3d:
	dr $15f3d, $15f57

Func_15f57:
	dr $15f57, $15f66

Func_15f66:
	dr $15f66, $15f79

Func_15f79:
	dr $15f79, $15fa1

Func_15fa1:
	dr $15fa1, $15fb4

Func_15fb4:
	dr $15fb4, $15fd6

Func_15fd6:
	dr $15fd6, $16099

Func_16099:
	dr $16099, $161fb

Func_161fb:
	dr $161fb, $16289

Func_16289:
	dr $16289, $162cd

Func_162cd:
	dr $162cd, $16318

Func_16318:
	dr $16318, $16348

Func_16348:
	dr $16348, $16360

Func_16360:
	dr $16360, $163e0

Func_163e0:
	dr $163e0, $163ef

Func_163ef:
	dr $163ef, $163fe

Func_163fe:
	dr $163fe, $16416

Func_16416:
	dr $16416, $1643a

Func_1643a:
	dr $1643a, $16461

Func_16461:
	dr $16461, $1651b

Func_1651b:
	dr $1651b, $1654b

Func_1654b:
	dr $1654b, $1657b

Func_1657b:
	dr $1657b, $1658d

Func_1658d:
	dr $1658d, $16614

Func_16614:
	dr $16614, $17ff8
