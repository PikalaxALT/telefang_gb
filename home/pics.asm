LoadDenjuuPic: ; 1620 (0:1620)
	push de
	cp $12
	jp nc, Func_162c
	push af
	ld a, DENJUU_00
	jp Func_1699

Func_162c: ; 162c (0:162c)
	cp $24
	jp nc, Func_1639
	sub $12
	push af
	ld a, DENJUU_01
	jp Func_1699

Func_1639: ; 1639 (0:1639)
	cp $36
	jp nc, Func_1646
	sub $24
	push af
	ld a, DENJUU_02
	jp Func_1699

Func_1646: ; 1646 (0:1646)
	cp $48
	jp nc, Func_1653
	sub $36
	push af
	ld a, DENJUU_03
	jp Func_1699

Func_1653: ; 1653 (0:1653)
	cp $5a
	jp nc, Func_1660
	sub $48
	push af
	ld a, DENJUU_04
	jp Func_1699

Func_1660: ; 1660 (0:1660)
	cp $6c
	jp nc, Func_166d
	sub $5a
	push af
	ld a, DENJUU_05
	jp Func_1699

Func_166d: ; 166d (0:166d)
	cp $7e
	jp nc, Func_167a
	sub $6c
	push af
	ld a, DENJUU_06
	jp Func_1699

Func_167a: ; 167a (0:167a)
	cp $90
	jp nc, Func_1687
	sub $7e
	push af
	ld a, DENJUU_07
	jp Func_1699

Func_1687: ; 1687 (0:1687)
	cp $a2
	jp nc, Func_1694
	sub $90
	push af
	ld a, DENJUU_08
	jp Func_1699

Func_1694: ; 1694 (0:1694)
	sub $a2
	push af
	ld a, DENJUU_09
Func_1699: ; 1699 (0:1699)
	ld [wDenjuuPicBank], a
	pop af
	ld hl, DenjuuAndTFangerPicPointers
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wDenjuuPicBank]
	rst Bankswitch
	pop de
	ld a, c
	cp $1
	jp z, Func_16bc
	ld bc, (7 * 8) tiles
	jp WaitStatCopy

Func_16bc: ; 16bc (0:16bc)
	ld bc, (7 * 8) tiles
	jp WaitStatCopyInverted

LoadTFangerPic: ; 16c2 (0:16c2)
	push de
	cp $12
	jp nc, Func_16d0
	ld [wTFangerPicIndexOffset], a
	ld a, TFANGER_00
	jp Func_16e6

Func_16d0: ; 16d0 (0:16d0)
	cp $24
	jp nc, Func_16df
	sub $12
	ld [wTFangerPicIndexOffset], a
	ld a, TFANGER_01
	jp Func_16e6

Func_16df: ; 16df (0:16df)
	sub $24
	ld [wTFangerPicIndexOffset], a
	ld a, TFANGER_02
Func_16e6: ; 16e6 (0:16e6)
	ld [wTFangerPicBank], a
	ld a, [wTFangerPicIndexOffset]
	ld hl, DenjuuAndTFangerPicPointers
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wTFangerPicBank]
	rst Bankswitch
	pop de
	ld bc, (7 * 8) tiles
	jp WaitStatCopy

WaitStatCopy: ; 1705 (0:1705)
	ld a, [hli]
	di
	call WaitStat
	ld [de], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, WaitStatCopy
	ret

WaitStatCopy2::
.asm_1713
	di
	call WaitStat
	ld a, [hli]
	ld [de], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_1713
	ret

WaitStatCopyInverted: ; 1721 (0:1721)
	ld a, [hli]
	call InvertBits
	di
	call WaitStat
	ld [de], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, WaitStatCopyInverted
	ret

DenjuuAndTFangerPicPointers::
	dw Denjuu_001
	dw Denjuu_002
	dw Denjuu_003
	dw Denjuu_004
	dw Denjuu_005
	dw Denjuu_006
	dw Denjuu_007
	dw Denjuu_008
	dw Denjuu_009
	dw Denjuu_010
	dw Denjuu_011
	dw Denjuu_012
	dw Denjuu_013
	dw Denjuu_014
	dw Denjuu_015
	dw Denjuu_016
	dw Denjuu_017
	dw Denjuu_018
