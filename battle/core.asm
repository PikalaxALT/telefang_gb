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

String_1450d:
	db "たたかう    "

String_14515:
	db "にげる     "

String_1451d:
	db "にげだした!  "

String_14525:
	db "とうちゃく!  "

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
	call ClearString
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

Func_1492f: ; 1492f (5:492f)
	ld a, [wd477]
	call Func_14131
	ld a, [wd584]
	ld [wd435], a
	ld a, [wd58b]
	cp $5
	jr nz, .asm_1499f
	ld a, [wd584]
	call Func_142cd
	ld a, [wd584]
	ld [wd497], a
	ld a, $3
	call Func_143f9
	ld a, [wd58f]
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
	ld a, [wd58f]
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
	ld a, [wd58f]
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
	ld a, [wd584]
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
	call Func_14131
	ld a, [wd596]
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
	ld a, [wd595]
	ld b, a
	ld a, $cd
	add b
	ld b, a
	call Func_0d4e
	cp $80
	jr nc, Func_14a67
Func_14a01: ; 14a01 (5:4a01)
	ld a, [wd596]
	call Func_148a3
	call Func_3d02
	ld a, [wd477]
	cp $1
	jr z, .asm_14a1e
	cp $2
	jr z, .asm_14a27
	xor a
	ld [wd554], a
	ld [wd548], a
	jr .asm_14a2e

.asm_14a1e
	xor a
	ld [wd56a], a
	ld [wd55e], a
	jr .asm_14a2e

.asm_14a27
	xor a
	ld [wd580], a
	ld [wd574], a
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
	ld a, [wd596]
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
	ld a, [wd596]
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
	call Func_14131
	ld a, [wd596]
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
	ld a, [wd590]
	cp $4
	jr z, .asm_14b19
	cp $5
	jr nz, .asm_14b35
.asm_14b19
	ld a, [wd58e]
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
	ld a, [wd590]
	cp $8
	jr z, .asm_14b40
	cp $9
	jr nz, .asm_14b8d
.asm_14b40
	ld a, [wd58e]
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
	ld a, [wd584]
	ld [wd497], a
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
	ld de, String_1450d
	ld hl, VTilesBG tile $60
	call Func_142aa
	ld de, String_14515
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
	call Func_1412b
	ld a, [wd584]
	ld c, $6
	ld hl, VTilesBG tile $40
	call Func_14d0f
	ld a, [wd584]
	ld c, $7
	ld hl, VTilesBG tile $48
	call Func_14d0f
	ld a, [wd584]
	ld b, $0
	ld c, $e
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd585]
	cp b
	jr c, .asm_14c84
	ld a, [wd584]
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
	ld a, [wd584]
	ld b, $0
	ld c, $f
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd585]
	cp b
	jr c, .asm_14cc7
	ld a, [wd584]
	ld c, $9
	call Func_058d
	ld a, [wd45f]
	or a
	jr z, .asm_14cc7
	ld a, [wd584]
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
	call Func_058d
	ld a, [wd45f]
	ld de, AttackNames
	pop bc
	jp Func_0565

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
	call Func_1412b
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
	call Func_1412b
	call OpenSRAMBank2
	ld a, [wd591]
	ld hl, $a006
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	ld a, [wd596]
	cp $4
	jr nz, .asm_14e23
	xor a
	ld [wd414], a
	ld a, [wd584]
	ld [wd497], a
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
	ld [wd507], a
	jr .asm_14e48

.asm_14e3c
	ld a, $5
	ld [wd51d], a
	jr .asm_14e48

.asm_14e43
	ld a, $5
	ld [wd533], a
.asm_14e48
	jp Func_14e9d

.asm_14e4b
	ld a, [wd584]
	ld [wd497], a
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
	call Func_1412b
	ld a, [wd596]
	cp $a
	jr z, .asm_14f71
	ld a, $2d
	ld [wd400], a
	ret

.asm_14f59
	ld a, [wd477]
	call Func_14131
	ld a, [wd596]
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
	ld [wd50b], a
	jr .asm_14fea

.asm_14fdc
	ld a, [wd477]
	ld [wd521], a
	jr .asm_14fea

.asm_14fe4
	ld a, [wd477]
	ld [wd537], a
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
	ld [wd507], a
	jr .asm_15042

.asm_15036
	ld a, $3
	ld [wd51d], a
	jr .asm_15042

.asm_1503d
	ld a, $3
	ld [wd533], a
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
	call Func_14131
	ld a, [wd584]
	ld [wd497], a
	ld a, [wd414]
	call Func_143f9
	jp Func_1528c

.asm_15149
	ld a, [wd477]
	call Func_14131
	ld a, [wd596]
	cp $4
	jr nz, .asm_15173
	ld a, $0
	ld [wd414], a
	ld a, [wd474]
	ld [wd415], a
	ld a, [wd584]
	ld [wd497], a
	ld a, [wd414]
	call Func_143f9
	ld a, $c
	ld [wd400], a
	ret

.asm_15173
	ld a, [wd477]
	call Func_14131
	ld a, [wd584]
	ld [wd497], a
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
	ld a, [wd584]
	ld b, $0
	ld c, $e
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd585]
	cp b
	jr c, .asm_151d5
	ld a, $2
	jr .asm_151d6

.asm_151af
	ld a, [wd584]
	ld b, $0
	ld c, $f
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd585]
	cp b
	jr c, .asm_151d5
	ld a, [wd584]
	ld c, $9
	call Func_058d
	ld a, [wd45f]
	or a
	jr z, .asm_151d5
	ld a, $3
	jr .asm_151d6

.asm_151d5
	xor a
.asm_151d6
	ld [wd414], a
	ld a, [wd474]
	call Func_1412b
	ld a, [wd596]
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
	call Func_14131
	ld a, [wd586]
	ld b, a
	ld a, [wd587]
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
	ld [wd549], a
	ld a, [wd417]
	ld [wd54d], a
	jr .asm_1537c

.asm_15364
	ld a, $5
	ld [wd55f], a
	ld a, [wd417]
	ld [wd563], a
	jr .asm_1537c

.asm_15371
	ld a, $5
	ld [wd575], a
	ld a, [wd417]
	ld [wd579], a
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
	ld a, [wd542]
	jr .asm_1539d

.asm_15393
	ld a, [wd558]
	jr .asm_1539d

.asm_15398
	ld a, [wd56e]
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
	dr $16360, $16368

Data_16368:
	dr $16368, $163e0

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
	dr $1651b, $1653b

Func_1653b:
	dr $1653b, $1654b

Func_1654b:
	dr $1654b, $1656b

Func_1656b:
	dr $1656b, $1657b

Func_1657b:
	dr $1657b, $1658d

Func_1658d:
	dr $1658d, $1659f

Func_1659f:
	dr $1659f, $165c3

Func_165c3:
	dr $165c3, $165e8

Func_165e8:
	dr $165e8, $165fe

Func_165fe:
	dr $165fe, $16614

Func_16614:
	dr $16614, $16643

Func_16643:
	dr $16643, $17ff8
