INCLUDE "includes.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

INCLUDE "home.asm"

SECTION "bank 02", ROMX, BANK [$2]
Func_8000::
	ld a, [wc3e1]
	ld hl, Pointers_800a
	call GetHalfwordFromTable
	jp [hl]

Pointers_800a::
	dw Func_801a
	dw Func_8032
	dw Func_8061
	dw Func_8069
	dw Func_807c
	dw Func_808e
	dw Func_80a0
	dw Func_80b5

Func_801a::
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $7
	call DecompressGFXByIndex_
	ld bc, $8
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_8032::
	ld bc, $0
	ld e, $3f
	ld a, $0
	call Func_04ca
	ld bc, $0
	ld e, $3f
	ld a, $0
	call Func_04da
	ld bc, $f
	call GetCGB_BGLayout_
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	jp IncrementSubroutine

Func_8061::
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_8069::
	ld a, $2
	call Func_050f
	or a
	ret z
	ld c, $2
	ld b, $0
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_807c::
	ld a, [hJoyNew]
	and START
	jr nz, .start
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
.start
	jp IncrementSubroutine

Func_808e::
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_80a0::
	ld a, $1
	call Func_050f
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_80b5::
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wc3e1], a
	ret

INCLUDE "engine/intro_movie.asm"

Func_84cf: ; 84cf (2:44cf)
	ld a, [wc3e1]
	ld hl, Pointers_84d9
	call GetHalfwordFromTable
	jp [hl]

Pointers_84d9::
	dw Func_84e9
	dw Func_8501
	dw Func_8530
	dw Func_8538
	dw Func_854b
	dw Func_855d
	dw Func_856f
	dw Func_8584

Func_84e9::
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $7
	call DecompressGFXByIndex_
	ld bc, $8
	call DecompressGFXByIndex_
	jp IncrementSubroutine

Func_8501::
	ld bc, $0
	ld e, $3f
	ld a, $0
	call Func_04ca
	ld bc, $0
	ld e, $3f
	ld a, $0
	call Func_04da
	ld bc, $f
	call GetCGB_BGLayout_
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	jp IncrementSubroutine

Func_8530::
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_8538::
	ld a, $2
	call Func_050f
	or a
	ret z
	ld c, $2
	ld b, $0
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_854b::
	ld a, [hJoyNew]
	and START
	jr nz, .asm_855a
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
.asm_855a
	jp IncrementSubroutine

Func_855d::
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_856f::
	ld a, $1
	call Func_050f
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_8584::
	ld a, $5
	ld [wGameRoutine], a
	xor a
	ld [wc3e1], a
	ret

Func_858e: ; 858e (2:458e)
	ld a, [wc3e1]
	ld hl, Pointers_8598
	call GetHalfwordFromTable
	jp [hl]

Pointers_8598:
	dw Func_85a8
	dw Func_85c6
	dw Func_85dd
	dw Func_85ed
	dw Func_85f7
	dw Func_85ff
	dw Func_8611
	dw Func_8626

Func_85a8:
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld bc, $42
	call DecompressGFXByIndex_
	ld bc, $43
	call DecompressGFXByIndex_
	ld bc, $7
	call GetCGB_BGLayout_
	jp IncrementSubroutine

Func_85c6:
	ld bc, $0
	ld e, $72
	ld a, $0
	call Func_04ca
	ld bc, $0
	ld e, $72
	ld a, $0
	call Func_04da
	jp IncrementSubroutine

Func_85dd:
	ld a, $1b
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_85ed:
	ld a, $2
	call Func_050f
	or a
	ret z
	jp IncrementSubroutine

Func_85f7:
	ld a, [hJoyNew]
	and $8
	ret z
	jp IncrementSubroutine

Func_85ff:
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_8611:
	ld a, $1
	call Func_050f
	or a
	ret z
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine

Func_8626:
	ld a, $0
	ld [wGameRoutine], a
	xor a
	ld [wc3e1], a
	ret

Func_8630::
	ld hl, $0
	add hl, de
	inc hl
	jp Func_863f

Func_8638: ; 8638 (2:4638)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hli], a
Func_863f: ; 863f (2:463f)
	ld a, $0
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Func_8648: ; 8648 (2:4648)
	ld a, [wc3e1]
	cp $1c
	ret z
	cp $22
	ret z
	cp $10
	jr nz, .asm_8663
	ld a, [wc3e2]
	cp $e
	ret z
	cp $f
	ret z
	cp $15
	ret z
	jr .asm_867d

.asm_8663
	ld a, [wc3e1]
	cp $16
	jr nz, .asm_8670
	ld a, [wc3e2]
	cp $9
	ret z
.asm_8670
	ld a, [wc3e1]
	cp $18
	jr nz, .asm_867d
	ld a, [wc3e2]
	cp $6
	ret z
.asm_867d
	ld a, [wc3df]
	or a
	ret nz
	ld a, [hJoyNew]
	and $f3
	jr z, .asm_86a7
	xor a
	ld [wcb74], a
	ld a, [wcb75]
	or a
	ret z
	ld hl, $b000
	ld de, wCGB_BGPalsBuffer
	ld bc, $40
	call Func_86f9
	ld a, $1
	ld [wBGPalUpdate], a
	xor a
	ld [wcb75], a
	ret

.asm_86a7
	ld a, [wcb75]
	or a
	ret nz
	ld a, [wc3c0]
	and $3
	ret nz
	ld a, [wcb74]
	inc a
	ld [wcb74], a
	cp $c8
	ret nz
	ld hl, wCGB_BGPalsBuffer
	ld de, s3_b000
	ld bc, s3_b040 - s3_b000
	call Func_86f9
	call Func_8710
	ld bc, $348
	ld a, $7
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $1
	ld [wcb75], a
	xor a
	ld [wcb74], a
	ret

Func_86e2::
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, $3
	ld [MBC3SRamBank], a
.asm_86ec
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_86ec
	xor a
	ld [MBC3SRamEnable], a
	ret

Func_86f9: ; 86f9 (2:46f9)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s3_b000)
	ld [MBC3SRamBank], a
.asm_8703
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_8703
	xor a
	ld [MBC3SRamEnable], a
	ret

Func_8710: ; 8710 (2:4710)
	ld hl, wCGB_BGPalsBuffer + 1 palettes + 4
	ld b, $6
.loop
	ld de, .Palette
	ld a, b
	cp $5
	jr z, .next
	push hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	pop hl
.next
	ld de, 1 palettes
	add hl, de
	dec b
	jr nz, .loop
	ret

.Palette RGB 20, 21, 14

Func_872e: ; 872e (2:472e)
	ld c, $10
	ld b, $0
Func_8732: ; 8732 (2:4732)
	push bc
	push bc
	ld a, [wcb69]
	swap a
	and $f0
	add b
	ld hl, wd002
	call Func_881b
	ld a, [hli]
	cp $fe
	jp z, Func_87ba
	ld [wcb20], a
	ld a, [hl]
	ld [wcb21], a
	pop bc
	ld a, b
	ld hl, Pointers_47e2
	call Func_881b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	push hl
	ld a, [wcb20]
	swap a
	and $f
	ld hl, Data_8802
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	call WaitStatAndLoad
	push hl
	ld a, [wcb20]
	swap a
	and $f
	cp $4
	jr z, .asm_878c
	cp $b
	jr z, .asm_878c
	cp $c
	jr nz, .asm_8787
	ld a, $52
	jr .asm_879b

.asm_8787
	ld hl, Data_880f
	jr .asm_878f

.asm_878c
	ld hl, Data_8815
.asm_878f
	ld a, [wcb21]
	swap a
	and $f
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
.asm_879b
	pop hl
	call WaitStatAndLoad
	pop hl
	ld de, $20
	add hl, de
	ld a, [wcb21]
	and $7
	adc $4d
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
Func_87b3: ; 87b3 (2:47b3)
	pop bc
	inc b
	dec c
	jp nz, Func_8732
	ret

Func_87ba: ; 87ba (2:47ba)
	pop bc
	ld a, b
	ld hl, Pointers_47e2
	call Func_881b
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, $52
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
	ld a, $52
	call WaitStatAndLoad
	ld a, $52
	call WaitStatAndLoad
	jp Func_87b3

Pointers_47e2:
	dwbgcoord  1,  6
	dwbgcoord  3,  6
	dwbgcoord  5,  6
	dwbgcoord  7,  6
	dwbgcoord  1,  8
	dwbgcoord  3,  8
	dwbgcoord  5,  8
	dwbgcoord  7,  8
	dwbgcoord  1, 10
	dwbgcoord  3, 10
	dwbgcoord  5, 10
	dwbgcoord  7, 10
	dwbgcoord  1, 12
	dwbgcoord  3, 12
	dwbgcoord  5, 12
	dwbgcoord  7, 12

Data_8802:
	db $40, $40, $41, $41, $42, $43, $43, $44, $44, $45, $45, $46, $47
Data_880f:
	db $52, $4c, $49, $4b, $48, $4a
Data_8815:
	db $52, $49, $48, $52, $49, $48

Func_881b: ; 881b (2:481b)
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ret

Func_8824: ; 8824 (2:4824)
	ld a, [wc3e1]
	ld hl, Pointers_882e
	call GetHalfwordFromTable
	jp [hl]

Pointers_882e:
	dw Func_883e
	dw Func_885b
	dw Func_8883
	dw Func_8890
	dw Func_889f
	dw Func_88a7
	dw Func_88b6
	dw Func_88c3

Func_883e:
	ld a, $c3
	ld [wLCDC], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wWX], a
	ld [wWY], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_885b:
	ld a, [wSCX]
	ld [wc3f0], a
	ld a, [wSCY]
	ld [wc3f1], a
	xor a
	ld [wSCX], a
	ld [wSCY], a
	call Func_88fb
	ld hl, VTilesOB
	ld de, VTilesShared
	ld bc, $80 tiles
	call Func_8919
	call Func_88da
	jp IncrementSubroutine

Func_8883:
	ld a, $1
	ld [wc430], a
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	jp IncrementSubroutine

Func_8890:
	ld hl, VTilesShared
	ld de, VTilesOB
	ld bc, $80 tiles
	call Func_8919
	jp IncrementSubroutine

Func_889f:
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	jp IncrementSubroutine

Func_88a7:
	ld hl, VTilesShared
	ld de, VTilesBG
	ld bc, $80 tiles
	call Func_8919
	jp IncrementSubroutine

Func_88b6:
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_88c3:
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wGameRoutine], a
	ld [wc3e1], a
	ret

Func_88d2:
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_88da: ; 88da (2:48da)
	ld hl, VBGMap
	ld c, $8
	ld d, $80
Func_88e1: ; 88e1 (2:48e1)
	push hl
	ld b, $10
.asm_88e4
	ld a, d
	di
	call WaitStat
	ld [hli], a
	ei
	inc d
	dec b
	jr nz, .asm_88e4
	pop hl
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	dec c
	jp nz, Func_88e1
	ret

Func_88fb: ; 88fb (2:48fb)
	ld hl, VBGMap
	ld c, $12
Func_8900: ; 8900 (2:4900)
	push hl
	ld b, $14
.asm_8903
	xor a
	di
	call WaitStat
	ld [hli], a
	ei
	dec b
	jr nz, .asm_8903
	pop hl
	push de
	ld de, BG_MAP_WIDTH
	add hl, de
	pop de
	dec c
	jp nz, Func_8900
	ret

Func_8919: ; 8919 (2:4919)
	di
	call WaitStat
	ld a, [de]
	ei
	ld [wFontSourceBank], a
	di
	call WaitStat
	ld a, [hl]
	ei
	di
	call WaitStat
	ld [de], a
	ei
	ld a, [wFontSourceBank]
	di
	call WaitStat
	ld [hl], a
	ei
	inc de
	inc hl
	dec bc
	ld a, c
	or b
	jr nz, Func_8919
	ret

INCLUDE "engine/title_screen.asm"

Func_8b8b: ; 8b8b (2:4b8b)
	ld a, [wd41f]
	ld hl, Pointers_8b95
	call GetHalfwordFromTable
	jp [hl]

Pointers_8b95:
	dw Func_8c81
	dw Func_8cde
	dw Func_8cf5
	dw Func_8d7a
	dw Func_8dbb
	dw Func_8f2d
	dw Func_8f96
	dw Func_8e98
	dw Func_8f1d

Data_8ba7:
	dr $8ba7, $8c81

Func_8c81: ; 8c81 (2:4c81)
	ld bc, $e
	call DecompressGFXByIndex_
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld bc, $16
	call GetCGB_BGLayout_
	ld a, $0
	call Func_3eb9
	ld a, $0
	call Func_0543
	ld a, [wcb2b]
	cp $0
	jp z, Func_8cac
	call Func_8fe8
	jr asm_8cc7

Func_8cac: ; 8cac (2:4cac)
	ld a, [wd456]
	cp $0
	jr z, .asm_8cb8
	call Func_8fe8
	jr asm_8cc7

.asm_8cb8
	ld a, [wc3e1]
	cp $1
	jr nz, .asm_8cc4
	call Func_9013
	jr asm_8cc7

.asm_8cc4
	call Func_8fe8
asm_8cc7
	ld a, [wd497]
	push af
	ld c, $1
	ld de, $8800
	call Func_0516
	pop af
	call Func_175f
	xor a
	ld [wcb30], a
	jp Func_3cfd

Func_8cde: ; 8cde (2:4cde)
	ld bc, $0
	ld e, $1
	ld a, $0
	call Func_04ca
	ld bc, $0
	ld e, $1
	ld a, $0
	call Func_04da
	jp Func_3cfd

Func_8cf5: ; 8cf5 (2:4cf5)
	ld a, [wd497]
	ld de, $9200
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, $9300
	ld a, $8
	call Func_3d5c
	ld a, [wd456]
	cp $1
	jr z, .asm_8d20
	ld a, [wc3e1]
	cp $1
	jr z, .asm_8d2b
.asm_8d20
	ld a, [wd496]
	ld hl, $9300
	call Func_3e19
	jr .asm_8d37

.asm_8d2b
	ld a, [wd497]
	ld de, $4000
	ld bc, $9300
	call Func_3adc
.asm_8d37
	ld a, [wd499]
	ld bc, $8d80
	ld de, $7928
	call Func_3adc
	call Func_0597
	call Func_90c2
	ld de, $4ba7
	ld hl, $8e00
	ld b, $8
	call Func_0560
	ld a, [wcb30]
	cp $0
	jr nz, .asm_8d64
	call Func_902e
	call Func_923b
	call Func_904a
.asm_8d64
	ld a, [wcb30]
	add $2
	ld e, a
	ld bc, $9
	ld a, $0
	call Func_04da
	ld a, $4
	call Func_050a
	jp Func_3cfd

Func_8d7a: ; 8d7a (2:4d7a)
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, [wd456]
	cp $1
	jr z, .asm_8d88
.asm_8d88
	ld a, [wd4b0]
	cp $1
	jr z, .asm_8db8
	ld a, $20
	ld [wd4ee], a
	ld a, $d7
	ld [wd41d], a
	ld a, $0
	ld [wd43e], a
	ld a, $28
	ld [wd4f0], a
	ld a, $0
	ld [wd4f6], a
	call Func_3d18
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
.asm_8db8
	jp Func_3cfd

Func_8dbb: ; 8dbb (2:4dbb)
	ld a, [wc3c0]
	and $3
	jr nz, .asm_8dc8
	ld hl, $91b0
	call Func_17ef
.asm_8dc8
	ld a, [wd456]
	cp $1
	jr z, .asm_8dcf
.asm_8dcf
	ld a, [wd4b0]
	cp $1
	jr z, .asm_8e1a
	ld a, [wJoyNew]
	and $40
	jr z, .asm_8df3
	ld a, [wd415]
	cp $0
	jr z, .asm_8dea
	dec a
	ld [wd415], a
	jr .asm_8e0f

.asm_8dea
	ld a, [wd4b0]
	dec a
	ld [wd415], a
	jr .asm_8e0f

.asm_8df3
	ld a, [wJoyNew]
	and $80
	jr z, .asm_8e1a
	ld a, [wd4b0]
	ld b, a
	ld a, [wd415]
	inc a
	cp b
	jr z, .asm_8e0a
	ld [wd415], a
	jr .asm_8e0f

.asm_8e0a
	ld a, $0
	ld [wd415], a
.asm_8e0f
	ld a, $2
	ld [H_FFA1], a
	ld a, $7
	ld [wd41f], a
	ret

.asm_8e1a
	ld a, [wJoyNew]
	and $10
	jr z, .asm_8e30
	ld a, [wcb30]
	inc a
	cp $3
	jr nz, .asm_8e2a
	xor a
.asm_8e2a
	ld [wcb30], a
	jp Func_8e44

.asm_8e30
	ld a, [wJoyNew]
	and $20
	jr z, asm_8e4f
	ld a, [wcb30]
	cp $0
	jr nz, .asm_8e40
	ld a, $3
.asm_8e40
	dec a
	ld [wcb30], a
Func_8e44: ; 8e44 (2:4e44)
	ld a, $2
	ld [H_FFA1], a
	ld a, $6
	ld [wd41f], a
	ret

asm_8e4f
	ld a, [wcb2b]
	cp $0
	jp z, Func_8e64
	ld a, [hJoyNew]
	and $1
	jr z, Func_8e64
	ld a, $2
	ld [wcb2b], a
	jr asm_8e7e

Func_8e64: ; 8e64 (2:4e64)
	ld a, [wcb2b]
	cp $0
	jp z, Func_8e79
	ld a, [hJoyNew]
	and $2
	jr z, Func_8e79
	ld a, $4
	ld [H_FFA1], a
	jr asm_8e83

Func_8e79: ; 8e79 (2:4e79)
	ld a, [hJoyNew]
	and $3
	ret z
asm_8e7e
	ld a, $3
	ld [H_FFA1], a
asm_8e83
	ld a, $4
	call Func_050a
	ld a, [wcb2b]
	cp $0
	jp nz, Func_8e95
	ld a, $1
	ld [wd43a], a
Func_8e95: ; 8e95 (2:4e95)
	jp Func_3cfd

Func_8e98: ; 8e98 (2:4e98)
	ld bc, $101
	ld e, $8b
	ld a, $0
	call Func_04ca
	ld a, [wcb3f]
	cp $1
	jr z, .asm_8eb5
	ld a, [wc3e1]
	cp $1
	jr nz, .asm_8eb5
	call Func_9013
	jr .asm_8eb8

.asm_8eb5
	call Func_8fe8
.asm_8eb8
	ld a, [wd497]
	push af
	ld c, $1
	ld de, $8800
	call Func_0516
	pop af
	call Func_175f
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wd497]
	ld de, $9200
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, $9300
	ld a, $8
	call Func_3d5c
	ld a, [wc3e1]
	cp $1
	jr nz, .asm_8eff
	ld a, [wd497]
	ld de, $4000
	ld bc, $9300
	call Func_3adc
	jr .asm_8f08

.asm_8eff
	ld a, [wd496]
	ld hl, $9300
	call Func_3e19
.asm_8f08
	ld a, [wd499]
	ld bc, $8d80
	ld de, $7928
	call Func_3adc
	call Func_0597
	call Func_90c2
	jp Func_3cfd

Func_8f1d: ; 8f1d (2:4f1d)
	ld bc, $101
	ld e, $b9
	ld a, $0
	call Func_04ca
	ld a, $6
	ld [wd41f], a
	ret

Func_8f2d: ; 8f2d (2:4f2d)
	ld a, [wcb2b]
	cp $0
	jr nz, .asm_8f42
	ld a, [wc3e1]
	cp $1
	jr nz, .asm_8f49
	ld a, [wcb3f]
	cp $1
	jr z, .asm_8f49
.asm_8f42
	ld a, $1
	call Func_050f
	or a
	ret z
.asm_8f49
	xor a
	ld [wd41f], a
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wc430], a
	ld a, [wcb2b]
	cp $0
	jr z, .asm_8f6a
	ld a, [wc3e2]
	inc a
	ld [wc3e2], a
	ld a, $c
	ld [wGameRoutine], a
	ret

.asm_8f6a
	ld a, [wcb3f]
	cp $1
	jr z, .asm_8f80
	cp $2
	jr z, .asm_8f8b
	ld a, $6
	ld [wGameRoutine], a
	ld a, $0
	ld [wd400], a
	ret

.asm_8f80
	ld a, $f
	ld [wGameRoutine], a
	ld a, $0
	ld [wd401], a
	ret

.asm_8f8b
	ld a, $f
	ld [wGameRoutine], a
	ld a, $0
	ld [wd401], a
	ret

Func_8f96: ; 8f96 (2:4f96)
	call Func_902e
	ld a, [wcb30]
	cp $0
	jr z, .asm_8fa6
	cp $1
	jr z, .asm_8fab
	jr .asm_8fb0

.asm_8fa6
	call Func_9043
	jr .asm_8fb3

.asm_8fab
	call Func_903d
	jr .asm_8fb3

.asm_8fb0
	call Func_9040
.asm_8fb3
	ld a, $4
	ld [wd41f], a
	ret

Func_8fb9:
	ld a, $a
	ld [$0], a
	ld a, $1
	ld [$4000], a
	ld de, wd000
	ld hl, $b000
	ld a, [wcb70]
	ld b, $0
	ld c, a
	sla c
	rl b
	sla c
	rl b
.asm_8fd7
	inc hl
	inc hl
	ld a, [hli]
	ld [de], a
	inc hl
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_8fd7
	ld a, $0
	ld [$0], a
	ret

Func_8fe8: ; 8fe8 (2:4fe8)
	ld hl, wd000
	ld d, $0
	ld a, [wd415]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd496], a
	call OpenSRAMBank2
	ld a, [wd496]
	ld hl, $a000
	call Func_3d0e
	ld a, [hli]
	ld [wd497], a
	ld a, [hli]
	ld [wd498], a
	inc hl
	ld a, [hl]
	ld [wd499], a
	call CloseSRAM
	ret

Func_9013: ; 9013 (2:5013)
	ld hl, wd5b6
	ld d, $0
	ld a, [wd415]
	ld b, a
	sla a
	add b
	ld e, a
	add hl, de
	ld a, [hli]
	ld [wd497], a
	ld a, [hli]
	ld [wd498], a
	ld a, [hl]
	ld [wd499], a
	ret

Func_902e: ; 902e (2:502e)
	ld a, [wcb30]
	add $2
	ld e, a
	ld bc, $9
	ld a, $0
	call Func_04ca
	ret

Func_903d: ; 903d (2:503d)
	jp Func_91c7

Func_9040: ; 9040 (2:5040)
	jp Func_916a

Func_9043: ; 9043 (2:5043)
	call Func_904a
	call Func_923b
	ret

Func_904a: ; 904a (2:504a)
	call OpenSRAMBank2
	ld a, [wcb2b]
	cp $1
	jr z, .asm_9062
	ld a, [wd456]
	cp $1
	jr z, .asm_9062
	ld a, [wc3e1]
	cp $2
	jr nz, .asm_907c
.asm_9062
	ld hl, $a00a
	ld a, [wd496]
	call Func_3d0e
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld hl, $9984
	call Func_0650
	jr .asm_9086

.asm_907c
	ld bc, $80c
	ld e, $ac
	ld a, $0
	call Func_04ca
.asm_9086
	call CloseSRAM
	ret

Func_908a:
	ld bc, wd584
	ld de, $16
	cp $0
	jr z, .asm_9098
.asm_9094
	add hl, de
	dec a
	jr nz, .asm_9094
.asm_9098
	ld d, $10
.asm_909a
	ld a, [hli]
	ld [bc], a
	inc bc
	dec d
	jr nz, .asm_909a
	ret

Func_90a1:
	ld hl, wd000
	call Func_90b1
	cp $0
	jr z, .asm_90af
.asm_90ab
	inc hl
	dec a
	jr nz, .asm_90ab
.asm_90af
	ld a, [hl]
	ret

Func_90b1: ; 90b1 (2:50b1)
	ld a, [wd4a0]
	cp $0
	jr z, .asm_90c0
	ld b, a
	ld a, d
.asm_90ba
	add $3
	dec b
	jr nz, .asm_90ba
	ld d, a
.asm_90c0
	ld a, d
	ret

Func_90c2: ; 90c2 (2:50c2)
	ld a, [wd497]
	ld b, $0
	ld c, $6
	call Func_058d
	ld a, [wd45f]
	ld de, $46f8
	ld bc, $8b80
	call Func_0565
	ld a, [wd497]
	ld b, $0
	ld c, $7
	call Func_058d
	ld a, [wd45f]
	ld de, $46f8
	ld bc, $8c00
	call Func_0565
	ld a, [wd497]
	ld b, $0
	ld c, $e
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd498]
	cp b
	jr c, .asm_911a
	ld a, [wd497]
	ld b, $0
	ld c, $8
	call Func_058d
	ld a, [wd45f]
	ld de, $46f8
	ld bc, $8c80
	call Func_0565
	jr .asm_9125

.asm_911a
	ld de, $4baf
	ld hl, $8c80
	ld b, $8
	call Func_0560
.asm_9125
	ld a, [wd497]
	ld b, $0
	ld c, $f
	call Func_058d
	ld a, [wd45f]
	ld b, a
	cp $64
	jr z, .asm_9161
	ld a, [wd498]
	cp b
	jr c, .asm_9155
	ld a, [wd497]
	ld b, $0
	ld c, $9
	call Func_058d
	ld a, [wd45f]
	ld de, $46f8
	ld bc, $8d00
	call Func_0565
	jr .asm_9160

.asm_9155
	ld de, $4baf
	ld hl, $8d00
	ld b, $8
	call Func_0560
.asm_9160
	ret

.asm_9161
	ld hl, $8d00
	ld a, $8
	call Func_3d5c
	ret

Func_916a: ; 916a (2:516a)
	ld a, [wd497]
	ld b, $0
	ld c, $6
	call Func_058d
	ld a, [wd45f]
	ld a, [wd497]
	ld b, $0
	ld c, $7
	call Func_058d
	ld a, [wd45f]
	ld a, [wd497]
	ld b, $0
	ld c, $e
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd498]
	cp b
	jr c, .asm_91c6
	ld a, [wd497]
	ld b, $0
	ld c, $8
	call Func_058d
	ld a, [wd45f]
	ld a, [wd497]
	ld b, $0
	ld c, $f
	call Func_058d
	ld a, [wd45f]
	ld b, a
	ld a, [wd498]
	cp b
	jr c, .asm_91c6
	ld a, [wd497]
	ld b, $0
	ld c, $9
	call Func_058d
	ld a, [wd45f]
.asm_91c6
	ret

Func_91c7: ; 91c7 (2:51c7)
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $1
	call Func_058d
	ld a, [wd45f]
	ld hl, $9986
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $2
	call Func_058d
	ld a, [wd45f]
	ld hl, $99c6
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $3
	call Func_058d
	ld a, [wd45f]
	ld hl, $9a06
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $4
	call Func_058d
	ld a, [wd45f]
	ld hl, $998f
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $5
	call Func_058d
	ld a, [wd45f]
	ld hl, $99cf
	ld c, $0
	call Func_1378
	ret

Func_923b: ; 923b (2:523b)
	ld a, $a
	ld [$0], a
	ld a, $2
	ld [$4000], a
	ld a, [wd498]
	ld hl, $99e5
	ld c, $1
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $0
	call Func_058d
	ld a, [wd45f]
	ld hl, $9a05
	ld c, $0
	call Func_1378
	ld a, [wcb2b]
	cp $1
	jr z, .asm_927d
	ld a, [wd456]
	cp $1
	jr z, .asm_927d
	ld a, [wc3e1]
	cp $2
	jp nz, Func_9289
.asm_927d
	ld a, [wd496]
	ld hl, $a002
	call Func_3d0e
	ld a, [hl]
	jr asm_928b

Func_9289: ; 9289 (2:5289)
	ld a, $0
asm_928b
	ld hl, $99ee
	ld c, $0
	call Func_1378
	ld a, [wd498]
	cp $63
	jp z, Func_92eb
	ld a, [wcb2b]
	cp $1
	jr z, .asm_92b1
	ld a, [wd456]
	cp $1
	jr z, .asm_92b1
	ld a, [wc3e1]
	cp $2
	jp nz, Func_92eb
.asm_92b1
	ld a, [wd496]
	ld hl, $a004
	call Func_3d0e
	ld a, [hli]
	ld c, a
	ld b, [hl]
	sra b
	rr c
	push bc
	pop hl
	ld bc, $9a0b
	call Func_14b1
	ld a, [wd497]
	ld b, $0
	ld c, $d
	call Func_058d
	ld a, [wd498]
	ld b, a
	ld a, [wd45f]
	call Func_05d9
	sra b
	rr c
	push bc
	pop hl
	ld bc, $9a0f
	call Func_14b1
	jr asm_92ff

Func_92eb: ; 92eb (2:52eb)
	ld bc, $c10
	ld e, $ac
	ld a, $0
	call Func_04ca
	ld bc, $1010
	ld e, $ac
	ld a, $0
	call Func_04ca
asm_92ff
	ret

INCLUDE "engine/opening_logos.asm"

SECTION "bank 03", ROMX, BANK [$3]
Func_c000::
	dr $c000, $c1af

Func_c1af::
	dr $c1af, $c320

Func_c320::
	dr $c320, $f682

Func_f682::
	dr $f682, $fb3e

Func_fb3e::
	dr $fb3e, $fb8d

Func_fb8d::
	dr $fb8d, $fc03

SECTION "bank 04", ROMX, BANK [$4]
Func_10000::
	dr $10000, $105c0

Func_105c0::
	dr $105c0, $13ff0

SECTION "bank 05", ROMX, BANK [$5]
	dr $14000, $1441b

DoBattle::
	dr $1441b, $17ff8

SECTION "bank 06", ROMX, BANK [$6]
macro_18000: MACRO
	dbw \1, \2 ; bank, VRAM dest
	db 0
ENDM

CompressedGFXBanksAndDests::
	macro_18000 $00,                   VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile01), VTilesOB tile $10
	macro_18000 BANK(UnknownTZFile02), VTilesShared tile $4d
	macro_18000 BANK(UnknownTZFile03), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile04), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile05), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile06), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile07), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile08), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile09), VTilesShared tile $38
	macro_18000 BANK(UnknownTZFile10), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile11), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile12), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile13), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile14), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile15), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile16), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile17), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile18), VTilesShared tile $70
	macro_18000 BANK(UnknownTZFile19), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile20), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile21), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile22), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile23), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile24), VTilesBG tile $60
	macro_18000 BANK(UnknownTZFile25), VTilesShared tile $38
	macro_18000 BANK(UnknownTZFile26), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile27), VTilesShared tile $60
	macro_18000 $36,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile29), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile30), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile31), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile32), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile33), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile34), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile35), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile36), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile37), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile38), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile39), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile40), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile41), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile42), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile43), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile44), VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile48), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile49), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile50), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile51), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile52), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile53), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile54), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile55), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile56), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile57), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile58), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile59), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile60), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile61), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile62), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile63), VTilesOB tile $00
	macro_18000 BANK(UnknownTZFile64), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile65), VTilesShared tile $00
	macro_18000 BANK(UnknownTZFile66), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile67), VTilesShared tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile72), VTilesShared tile $70
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile80), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile81), VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile82), VTilesBG tile $00
	macro_18000 $37,                   VTilesBG tile $00
	macro_18000 BANK(UnknownTZFile84), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile85), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile86), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile87), VTilesShared tile $70
	macro_18000 BANK(UnknownTZFile88), VTilesShared tile $60
	macro_18000 BANK(UnknownTZFile89), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile90), VTilesBG tile $40
	macro_18000 BANK(UnknownTZFile91), VTilesShared tile $70
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00
	macro_18000 $29,                   VTilesBG tile $00

Data_18180::
	dr $18180, $18ba1

Data_18ba1::
	dr $18ba1, $196f4

SECTION "bank 07", ROMX, BANK [$7]
PalPackets_1c000::
	dr $1c000, $1c680

SECTION "bank 08", ROMX, BANK [$8]
Pointers_20000::
	dr $20000, $24000

SECTION "bank 09", ROMX, BANK [$9]
Pointers_24000::
	dr $24000, $28000

SECTION "bank 0A", ROMX, BANK [$a]
INCLUDE "data/oam_templates_0.asm"

SECTION "bank 0B", ROMX, BANK [$b]
Data_2c000::
	dr $2c000, $2c100

Func_2c100::
	dr $2c100, $2c63b

Func_2c63b::
	dr $2c63b, $2c63f

Func_2c63f::
	dr $2c63f, $2c6e2

Func_2c6e2::
	dr $2c6e2, $2c711

Func_2c711::
	dr $2c711, $2c766

Func_2c766::
	dr $2c766, $2c7ed

Func_2c7ed::
	dr $2c7ed, $2c831

Func_2c831::
	dr $2c831, $2c84d

Func_2c84d::
	dr $2c84d, $2c904

Func_2c904::
	dr $2c904, $2c92e

Func_2c92e::
	dr $2c92e, $2ccb9

Func_2ccb9::
	dr $2ccb9, $2ce29

Func_2ce29::
	dr $2ce29, $2d8c1

Func_2d8c1::
	dr $2d8c1, $2d8df

Func_2d8df::
	dr $2d8df, $2d92b

Func_2d92b::
	dr $2d92b, $2d95f

Func_2d95f::
	dr $2d95f, $2d99b

Func_2d99b::
	dr $2d99b, $2da20

Func_2da20::
	dr $2da20, $2da27

Func_2da27::
	dr $2da27, $2da3a

Func_2da3a::
	dr $2da3a, $2da47

Func_2da47::
	dr $2da47, $2da54

Func_2da54::
	dr $2da54, $2da69

Func_2da69::
	dr $2da69, $2da7e

Func_2da7e::
	dr $2da7e, $2db1c

Func_2db1c::
	dr $2db1c, $2db55

Func_2db55::
	dr $2db55, $2db90

Func_2db90::
	dr $2db90, $2dc6d

Func_2dc6d::
	dr $2dc6d, $2dd28

Func_2dd28::
	dr $2dd28, $2dd41

Func_2dd41::
	dr $2dd41, $2dd5a

Func_2dd5a::
	dr $2dd5a, $2dd89

Func_2dd89::
	dr $2dd89, $2dd9d

Func_2dd9d::
	dr $2dd9d, $2ddb1

Func_2ddb1::
	dr $2ddb1, $2ddc5

Func_2ddc5::
	dr $2ddc5, $2ddd9

Func_2ddd9::
	dr $2ddd9, $2de18

Func_2de18::
	dr $2de18, $2ded9

Func_2ded9::
	dr $2ded9, $2df1e

Func_2df1e::
	dr $2df1e, $2df55

Func_2df55::
	dr $2df55, $2e064

Func_2e064::
	dr $2e064, $2e0d2

Func_2e0d2::
	dr $2e0d2, $2e33e

Func_2e33e::
	dr $2e33e, $2e3dc

Func_2e3dc::
	dr $2e3dc, $2e3ff

Func_2e3ff::
	dr $2e3ff, $2e466

Func_2e466::
	dr $2e466, $2e48d

Func_2e48d::
	dr $2e48d, $2e4b2

Func_2e4b2::
	dr $2e4b2, $2e562

Func_2e562::
	dr $2e562, $2e589

Func_2e589::
	dr $2e589, $2e8fa

Data_2e8fa::
	dr $2e8fa, $30000

SECTION "bank 0C", ROMX, BANK [$c]
Func_30000::
	dr $30000, $30240

Func_30240::
	dr $30240, $3024f

Func_3024f::
	dr $3024f, $302a8

Func_302a8::
	dr $302a8, $30b4e

Func_30b4e::
	dr $30b4e, $3102a

Func_3102a::
	dr $3102a, $31600

Func_31600::
	dr $31600, $3162e

Func_3162e::
	dr $3162e, $31843

Func_31843::
	dr $31843, $31e97

Func_31e97::
	dr $31e97, $32079

Func_32079::
	dr $32079, $320e1

Func_320e1::
	dr $320e1, $3226b

Func_3226b::
	dr $3226b, $33846

Func_33846::
	dr $33846, $3385b

Func_3385b::
	dr $3385b, $3394e

Func_3394e::
	dr $3394e, $33a62

Func_33a62::
	dr $33a62, $33a90

Func_33a90::
	dr $33a90, $33ac4

Pointers_33ac4::
	dr $33ac4, $34000

SECTION "bank 0D", ROMX, BANK [$d]
Palettes_34000::
	dr $34000, $35d80

Palettes_35d80::
	dr $35d80, $38000

SECTION "bank 0E", ROMX, BANK [$e]
PalPackets_38000::
	dr $38000, $38120

INCLUDE "data/oam_templates_1.asm"

Func_38f8d::
	dr $38f8d, $39fab

Func_39fab::
	dr $39fab, $3c000

SECTION "bank 0F", ROMX, BANK [$f]
Func_3c000::
	dr $3c000, $3c00c

Func_3c00c::
	dr $3c00c, $3c91b

Func_3c91b::
	dr $3c91b, $3d00e

Func_3d00e::
	dr $3d00e, $40000

SECTION "bank 10", ROMX, BANK [$10]
	dr $40000, $44000

SECTION "bank 11", ROMX, BANK [$11]
	dr $44000, $48000

SECTION "bank 12", ROMX, BANK [$12]
	dr $48000, $4c000

SECTION "bank 13", ROMX, BANK [$13]
INCLUDE "data/oam_templates_2.asm"

SECTION "bank 14", ROMX, BANK [$14]
INCLUDE "data/oam_templates_3.asm"

SECTION "bank 15", ROMX, BANK [$15]
INCLUDE "data/oam_templates_4.asm"

SECTION "bank 16", ROMX, BANK [$16]
INCLUDE "data/oam_templates_5.asm"

SECTION "bank 17", ROMX, BANK [$17]
INCLUDE "data/oam_templates_6.asm"

SECTION "bank 18", ROMX, BANK [$18]
INCLUDE "data/oam_templates_7.asm"

SECTION "bank 19", ROMX, BANK [$19]
INCLUDE "data/oam_templates_8.asm"

SECTION "bank 1A", ROMX, BANK [$1a]
Func_68000::
	dr $68000, $6804c

Func_6804c::
	dr $6804c, $68103

Func_68103::
	dr $68103, $681d7

Func_681d7::
	dr $681d7, $68290

Func_68290::
	dr $68290, $6839c

Func_6839c::
	dr $6839c, $683f0

Func_683f0::
	dr $683f0, $68444

Func_68444::
	dr $68444, $68497

Func_68497::
	dr $68497, $68598

Func_68598::
	dr $68598, $686f2

Func_686f2::
	dr $686f2, $6877a

Func_6877a::
	dr $6877a, $687e1

Func_687e1::
	dr $687e1, $68829

Func_68829::
	dr $68829, $688c9

Func_688c9::
	dr $688c9, $6890e

Func_6890e::
	dr $6890e, $68a2d

Func_68a2d::
	dr $68a2d, $68bc7

Func_68bc7::
	dr $68bc7, $68d43

Func_68d43::
	dr $68d43, $68e59

Func_68e59::
	dr $68e59, $68ebf

Func_68ebf::
	dr $68ebf, $68f25

Func_68f25::
	dr $68f25, $68f8b

Func_68f8b::
	dr $68f8b, $68fdc

Func_68fdc::
	dr $68fdc, $69042

Func_69042::
	dr $69042, $690a8

Func_690a8::
	dr $690a8, $69133

Func_69133::
	dr $69133, $6921d

Func_6921d::
	dr $6921d, $692eb

Func_692eb::
	dr $692eb, $693cd

Func_693cd::
	dr $693cd, $694af

Func_694af::
	dr $694af, $695c7

Func_695c7::
	dr $695c7, $696c8

Func_696c8::
	dr $696c8, $6974c

Func_6974c::
	dr $6974c, $69828

Func_69828::
	dr $69828, $69913

Func_69913::
	dr $69913, $69961

Func_69961::
	dr $69961, $699e5

Func_699e5::
	dr $699e5, $69a69

Func_69a69::
	dr $69a69, $69acb

Func_69acb::
	dr $69acb, $69cd0

Func_69cd0::
	dr $69cd0, $69f99

Func_69f99::
	dr $69f99, $6a15a

Func_6a15a::
	dr $6a15a, $6a35e

Func_6a35e::
	dr $6a35e, $6a401

Func_6a401::
	dr $6a401, $6a618

Func_6a618::
	dr $6a618, $6a774

Func_6a774::
	dr $6a774, $6a954

Func_6a954::
	dr $6a954, $6ab1e

Func_6ab1e::
	dr $6ab1e, $6ab5e

Func_6ab5e::
	dr $6ab5e, $6ac98

Func_6ac98::
	dr $6ac98, $6ad72

Func_6ad72::
	dr $6ad72, $6aea7

Func_6aea7::
	dr $6aea7, $6afdc

Func_6afdc::
	dr $6afdc, $6b1ad

Func_6b1ad::
	dr $6b1ad, $6c000

SECTION "bank 1B", ROMX, BANK [$1b]
Func_6c000::
	dr $6c000, $6c082

Func_6c082::
	dr $6c082, $6c11b

Func_6c11b::
	dr $6c11b, $6c1b4

Func_6c1b4::
	dr $6c1b4, $6c21d

Func_6c21d::
	dr $6c21d, $6c27e

Func_6c27e::
	dr $6c27e, $6c556

Func_6c556::
	dr $6c556, $6c676

Func_6c676::
	dr $6c676, $6c6d4

Func_6c6d4::
	dr $6c6d4, $6c732

Func_6c732::
	dr $6c732, $6c790

Func_6c790::
	dr $6c790, $6c8f7

Func_6c8f7::
	dr $6c8f7, $6ca8c

Func_6ca8c::
	dr $6ca8c, $6cc6a

Func_6cc6a::
	dr $6cc6a, $6ce90

Func_6ce90::
	dr $6ce90, $6d0d3

Func_6d0d3::
	dr $6d0d3, $6d30d

Func_6d30d::
	dr $6d30d, $6d462

Func_6d462::
	dr $6d462, $6d5aa

Func_6d5aa::
	dr $6d5aa, $6d6ff

Func_6d6ff::
	dr $6d6ff, $6db13

Func_6db13::
	dr $6db13, $6dc84

Func_6dc84::
	dr $6dc84, $6dd4b

Func_6dd4b::
	dr $6dd4b, $6e0f1

Func_6e0f1::
	dr $6e0f1, $6e304

Func_6e304::
	dr $6e304, $6e457

Func_6e457::
	dr $6e457, $6e5af

Func_6e5af::
	dr $6e5af, $6e733

Func_6e733::
	dr $6e733, $6e853

Func_6e853::
	dr $6e853, $6e94a

Func_6e94a::
	dr $6e94a, $6ec18

Func_6ec18::
	dr $6ec18, $6eec0

Func_6eec0::
	dr $6eec0, $70000

SECTION "bank 1C", ROMX, BANK [$1c]
StartBattle::
	dr $70000, $703c4

Func_703c4::
	dr $703c4, $703e3

Func_703e3::
	dr $703e3, $7048c

Func_7048c::
	dr $7048c, $70a99

Func_70a99::
	dr $70a99, $7122c

Func_7122c::
	dr $7122c, $74000

SECTION "bank 1D", ROMX, BANK [$1d]
WinBattle::
	dr $74000, $74ff2

Func_74ff2::
	dr $74ff2, $753f8

Func_753f8::
	dr $753f8, $758f8

Func_758f8::
	dr $758f8, $78000

SECTION "bank 1F", ROMX, BANK [$1f]
Func_7c000::
	dr $7c000, $7c61b

Func_7c61b::
	dr $7c61b, $7d2c3

Func_7d2c3::
	dr $7d2c3, $80000

SECTION "bank 20", ROMX, BANK [$20]
UpdateSound20::
	dr $80000, $84000

SECTION "bank 21", ROMX, BANK [$21]
	dr $84000, $88000

SECTION "bank 22", ROMX, BANK [$22]
	dr $88000, $8c000

SECTION "bank 23", ROMX, BANK [$23]
	dr $8c000, $90000

SECTION "bank 24", ROMX, BANK [$24]
	dr $90000, $94000

SECTION "bank 26", ROMX, BANK [$26]
	dr $98000, $9c000

SECTION "bank 27", ROMX, BANK [$27]
Data_9c000::
	dr $9c000, $9c4a4

Data_9c4a4::
	dr $9c4a4, $9c715

Data_9c715::
	dr $9c715, $9cb29

Data_9cb29::
	dr $9cb29, $9cbb2

Data_9cbb2::
	dr $9cbb2, $9cbfa

Data_9cbfa::
	dr $9cbfa, $9ce9d

Data_9ce9d::
	dr $9ce9d, $a0000

SECTION "bank 28", ROMX, BANK [$28]
	dr $a0000, $a4000

SECTION "bank 29", ROMX, BANK [$29]
Func_a4000::
	dr $a4000, $a40ef

Func_a40ef::
	dr $a40ef, $a4187

Func_a4187::
	dr $a4187, $a42a3

Func_a42a3::
	dr $a42a3, $a42e5

Func_a42e5::
	dr $a42e5, $a4ba4

Func_a4ba4::
	dr $a4ba4, $a4c9b

Func_a4c9b::
	dr $a4c9b, $a4e02

Func_a4e02::
	dr $a4e02, $a4e12

Func_a4e12::
	dr $a4e12, $a4e47

Func_a4e47::
	dr $a4e47, $a4f6f

Func_a4f6f::
	dr $a4f6f, $a4fcd

Func_a4fcd::
	dr $a4fcd, $a4fe5

Func_a4fe5::
	dr $a4fe5, $a501e

Func_a501e::
	dr $a501e, $a502a

Func_a502a::
	dr $a502a, $a5060

Func_a5060::
	dr $a5060, $a50be

Func_a50be::
	dr $a50be, $a50cd

Func_a50cd::
	dr $a50cd, $a5245

Func_a5245::
	dr $a5245, $a52b2

Func_a52b2::
	dr $a52b2, $a5418

Func_a5418::
	dr $a5418, $a54a2

Func_a54a2::
	dr $a54a2, $a5525

Func_a5525::
	dr $a5525, $a6b69

Data_a6b69::
	dr $a6b69, $a6d29

UnknownTZFile43:: INCBIN "gfx/tzfiles/tz_43.2bpp.tz"
UnknownTZFile44:: INCBIN "gfx/tzfiles/tz_44.2bpp.tz"

Data_a7869::
	dr $a7869, $a8000

SECTION "bank 2A", ROMX, BANK [$2a]
	dr $a8000, $a8539

Func_a8539::
	dr $a8539, $a85ae

Func_a85ae::
	dr $a85ae, $a85e5

Func_a85e5::
	dr $a85e5, $a8663

Func_a8663::
	dr $a8663, $a8788

Func_a8788::
	dr $a8788, $a8c50

Func_a8c50::
	dr $a8c50, $a8c86

Func_a8c86::
	dr $a8c86, $a8d20

Func_a8d20::
	dr $a8d20, $ac000

SECTION "bank 2B", ROMX, BANK [$2b]
	dr $ac000, $b0000

SECTION "bank 2C", ROMX, BANK [$2c]
	dr $b0000, $b4000

SECTION "bank 32", ROMX, BANK [$32]
Func_c8000::
	dr $c8000, $c8243

Func_c8243::
	dr $c8243, $c8268

Func_c8268::
	dr $c8268, $c8293

Func_c8293::
	dr $c8293, $c82a9

Func_c82a9::
	dr $c82a9, $c82df

Func_c82df::
	dr $c82df, $c9538

Func_c9538::
	dr $c9538, $c96ba

Func_c96ba::
	dr $c96ba, $c97d2

Func_c97d2::
	dr $c97d2, $c981a

Func_c981a::
	dr $c981a, $c9868

Func_c9868::
	dr $c9868, $c9875

Func_c9875::
	dr $c9875, $c99ac

Func_c99ac::
	dr $c99ac, $cc000

SECTION "bank 33", ROMX, BANK [$33]
	dr $cc000, $d0000

SECTION "bank 35", ROMX, BANK [$35]
UnknownTZFile90:: INCBIN "gfx/tzfiles/tz_90.2bpp.tz"
UnknownTZFile89:: INCBIN "gfx/tzfiles/tz_89.2bpp.tz"
UnknownTZFile84:: INCBIN "gfx/tzfiles/tz_84.2bpp.tz"
UnknownTZFile85:: INCBIN "gfx/tzfiles/tz_85.2bpp.tz"
UnknownTZFile86:: INCBIN "gfx/tzfiles/tz_86.2bpp.tz"
UnknownTZFile87:: INCBIN "gfx/tzfiles/tz_87.2bpp.tz"
UnknownTZFile88:: INCBIN "gfx/tzfiles/tz_88.2bpp.tz"
UnknownTZFile91:: INCBIN "gfx/tzfiles/tz_91.2bpp.tz"

SECTION "bank 36", ROMX, BANK [$36]
UnknownTZFile03:: INCBIN "gfx/tzfiles/tz_3.2bpp.tz"
UnknownTZFile04:: INCBIN "gfx/tzfiles/tz_4.2bpp.tz"
UnknownTZFile15:: INCBIN "gfx/tzfiles/tz_15.2bpp.tz"
UnknownTZFile16:: INCBIN "gfx/tzfiles/tz_16.2bpp.tz"
IF DEF(POWER)
UnknownTZFile10:: INCBIN "gfx/tzfiles/tz_10_power.2bpp.tz"
UnknownTZFile11:: INCBIN "gfx/tzfiles/tz_11_power.2bpp.tz"
ELSE
UnknownTZFile10:: INCBIN "gfx/tzfiles/tz_10_speed.2bpp.tz"
UnknownTZFile11:: INCBIN "gfx/tzfiles/tz_11_speed.2bpp.tz"
ENDC
UnknownTZFile06:: INCBIN "gfx/tzfiles/tz_6.2bpp.tz"
UnknownTZFile14:: INCBIN "gfx/tzfiles/tz_14.2bpp.tz"
UnknownTZFile02:: INCBIN "gfx/tzfiles/tz_2.2bpp.tz"
UnknownTZFile20:: INCBIN "gfx/tzfiles/tz_20.2bpp.tz"
UnknownTZFile21:: INCBIN "gfx/tzfiles/tz_21.2bpp.tz"
UnknownTZFile24:: INCBIN "gfx/tzfiles/tz_24.2bpp.tz"

Data_da4f9::
IF DEF(POWER)
	dr $da4f9, $dc000
ELSE
	dr $da5ac, $dc000
ENDC

SECTION "bank 37", ROMX, BANK [$37]
UnknownTZFile17:: INCBIN "gfx/tzfiles/tz_17.2bpp.tz"
UnknownTZFile01:: INCBIN "gfx/tzfiles/tz_1.2bpp.tz"
UnknownTZFile12:: INCBIN "gfx/tzfiles/tz_12.2bpp.tz"
UnknownTZFile07:: INCBIN "gfx/tzfiles/tz_7.2bpp.tz"
UnknownTZFile08:: INCBIN "gfx/tzfiles/tz_8.2bpp.tz"
UnknownTZFile09:: INCBIN "gfx/tzfiles/tz_9.2bpp.tz"
UnknownTZFile22:: INCBIN "gfx/tzfiles/tz_22.2bpp.tz"
UnknownTZFile19:: INCBIN "gfx/tzfiles/tz_19.2bpp.tz"
UnknownTZFile05:: INCBIN "gfx/tzfiles/tz_5.2bpp.tz"
UnknownTZFile25:: INCBIN "gfx/tzfiles/tz_25.2bpp.tz"
UnknownTZFile26:: INCBIN "gfx/tzfiles/tz_26.2bpp.tz"
UnknownTZFile27:: INCBIN "gfx/tzfiles/tz_27.2bpp.tz"
UnknownTZFile13:: INCBIN "gfx/tzfiles/tz_13.2bpp.tz"
UnknownTZFile18:: INCBIN "gfx/tzfiles/tz_18.2bpp.tz"
UnknownTZFile23:: INCBIN "gfx/tzfiles/tz_23.2bpp.tz"
UnknownTZFile72:: INCBIN "gfx/tzfiles/tz_72.2bpp.tz"

Phone1GFX:: INCBIN "gfx/phone/phone1.2bpp"
Phone2GFX:: INCBIN "gfx/phone/phone2.2bpp"
Phone3GFX:: INCBIN "gfx/phone/phone3.2bpp"
	dr $de95f, $e0000

SECTION "bank 38", ROMX, BANK [$38]
GFX_e0000:: INCBIN "gfx/misc/e0000.2bpp"
GFX_e00c0:: INCBIN "gfx/misc/e00c0.2bpp"
GFX_e01f0:: INCBIN "gfx/misc/e01f0.2bpp"
	dr $e0320, $e03a0

TileMap_e03a0:: INCBIN "gfx/misc/e03a0.tilemap"
TileMap_e03c8:: INCBIN "gfx/misc/e03c8.tilemap"
TileMap_e03f0:: INCBIN "gfx/misc/e03f0.tilemap"

GFX_e0418:: INCBIN "gfx/misc/e0418.w24.2bpp"
GFX_e0478:: INCBIN "gfx/misc/e0478.w24.2bpp"
	dr $e04d8, $e06b8

GFX_e06b8:: INCBIN "gfx/misc/e06b8.2bpp"
GFX_e0778:: INCBIN "gfx/misc/e0778.w24.2bpp"
GFX_e0898:: INCBIN "gfx/misc/e0898.w16.2bpp"
GFX_e0918:: INCBIN "gfx/misc/e0918.w24.2bpp"
GFX_e0978:: INCBIN "gfx/misc/e0978.w24.2bpp"

GFX_e09d8:: INCBIN "gfx/misc/e09d8.2bpp"
	dr $e0b08, $e0b38

GFX_e0b38:: INCBIN "gfx/misc/e0b38.1bpp"
GFX_e0bb8:: INCBIN "gfx/misc/e0bb8.1bpp"
	dr $e0c38, $e1038

TileMap_e1038:: INCBIN "data/e1038.tilemap"
	dr $e1118, $e1690

Pointers_e1690::
	dr $e1690, $e197c

GFX_e197c:: INCBIN "gfx/misc/e197c.2bpp"
Data_e19fc::
	dr $e19fc, $e2c54

Data_e2c54::
	dr $e2c54, $e2d14

Data_e2d14::
	dr $e2d14, $e4000

SECTION "bank 39", ROMX, BANK [$39]
IF DEF(POWER)
UnknownTZFile48:: INCBIN "gfx/tzfiles/tz_48_power.2bpp.tz"
UnknownTZFile49:: INCBIN "gfx/tzfiles/tz_49_power.2bpp.tz"
ELSE
UnknownTZFile48:: INCBIN "gfx/tzfiles/tz_48_speed.2bpp.tz"
UnknownTZFile49:: INCBIN "gfx/tzfiles/tz_49_speed.2bpp.tz"
ENDC
UnknownTZFile50:: INCBIN "gfx/tzfiles/tz_50.2bpp.tz"
UnknownTZFile51:: INCBIN "gfx/tzfiles/tz_51.2bpp.tz"
IF DEF(POWER)
UnknownTZFile52:: INCBIN "gfx/tzfiles/tz_52_power.2bpp.tz"
UnknownTZFile53:: INCBIN "gfx/tzfiles/tz_53_power.2bpp.tz"
UnknownTZFile54:: INCBIN "gfx/tzfiles/tz_54_power.2bpp.tz"
UnknownTZFile55:: INCBIN "gfx/tzfiles/tz_55_power.2bpp.tz"
UnknownTZFile56:: INCBIN "gfx/tzfiles/tz_56_power.2bpp.tz"
UnknownTZFile57:: INCBIN "gfx/tzfiles/tz_57_power.2bpp.tz"
ELSE
UnknownTZFile52:: INCBIN "gfx/tzfiles/tz_52_speed.2bpp.tz"
UnknownTZFile53:: INCBIN "gfx/tzfiles/tz_53_speed.2bpp.tz"
UnknownTZFile54:: INCBIN "gfx/tzfiles/tz_54_speed.2bpp.tz"
UnknownTZFile55:: INCBIN "gfx/tzfiles/tz_55_speed.2bpp.tz"
UnknownTZFile56:: INCBIN "gfx/tzfiles/tz_56_speed.2bpp.tz"
UnknownTZFile57:: INCBIN "gfx/tzfiles/tz_57_speed.2bpp.tz"
ENDC
UnknownTZFile80:: INCBIN "gfx/tzfiles/tz_80.2bpp.tz"
UnknownTZFile81:: INCBIN "gfx/tzfiles/tz_81.2bpp.tz"
UnknownTZFile82:: INCBIN "gfx/tzfiles/tz_82.2bpp.tz"

SECTION "bank 3A", ROMX, BANK [$3a]
UnknownTZFile58:: INCBIN "gfx/tzfiles/tz_58.2bpp.tz"
UnknownTZFile59:: INCBIN "gfx/tzfiles/tz_59.2bpp.tz"
UnknownTZFile60:: INCBIN "gfx/tzfiles/tz_60.2bpp.tz"
IF DEF(POWER)
UnknownTZFile61:: INCBIN "gfx/tzfiles/tz_61_power.2bpp.tz"
ELSE
UnknownTZFile61:: INCBIN "gfx/tzfiles/tz_61_speed.2bpp.tz"
ENDC
UnknownTZFile62:: INCBIN "gfx/tzfiles/tz_62.2bpp.tz"
UnknownTZFile63:: INCBIN "gfx/tzfiles/tz_63.2bpp.tz"
UnknownTZFile64:: INCBIN "gfx/tzfiles/tz_64.2bpp.tz"
UnknownTZFile65:: INCBIN "gfx/tzfiles/tz_65.2bpp.tz"
IF DEF(POWER)
UnknownTZFile66:: INCBIN "gfx/tzfiles/tz_66_power.2bpp.tz"
UnknownTZFile67:: INCBIN "gfx/tzfiles/tz_67_power.2bpp.tz"
ELSE
UnknownTZFile66:: INCBIN "gfx/tzfiles/tz_66_speed.2bpp.tz"
UnknownTZFile67:: INCBIN "gfx/tzfiles/tz_67_speed.2bpp.tz"
ENDC

SECTION "bank 3f", ROMX, BANK [$3f]
IF DEF(POWER)
	dr $fc4eb, $100000
ELSE
	dr $fc4e9, $100000
ENDC

SECTION "bank 40", ROMX, BANK [$40]
	dr $100000, $104000

SECTION "bank 45", ROMX, BANK [$45]
	dr $114000, $118000

SECTION "bank 46", ROMX, BANK [$46]
	dr $118000, $11c000

SECTION "bank 47", ROMX, BANK [$47]
	dr $11c000, $120000

SECTION "bank 48", ROMX, BANK [$48]
	dr $120000, $124000

SECTION "bank 49", ROMX, BANK [$49]
	dr $124000, $128000

SECTION "bank 4A", ROMX, BANK [$4a]
	dr $128000, $12c000

SECTION "bank 4B", ROMX, BANK [$4b]
	dr $12c000, $130000

SECTION "bank 4C", ROMX, BANK [$4c]
	dr $130000, $134000

SECTION "bank 4D", ROMX, BANK [$4d]
Data_134000::
	dr $134000, $13622e

UnknownTZFile30:: INCBIN "gfx/tzfiles/tz_30.2bpp.tz"
UnknownTZFile31:: INCBIN "gfx/tzfiles/tz_31.2bpp.tz"
UnknownTZFile29:: INCBIN "gfx/tzfiles/tz_29.2bpp.tz"

SECTION "bank 4E", ROMX, BANK [$4e]
	dr $138000, $13c000

SECTION "bank 4F", ROMX, BANK [$4f]
	dr $13c000, $140000

SECTION "bank 50", ROMX, BANK [$50]
	dr $140000, $144000

SECTION "bank 51", ROMX, BANK [$51]
	dr $144000, $148000

SECTION "bank 52", ROMX, BANK [$52]
	dr $148000, $14c000

SECTION "bank 53", ROMX, BANK [$53]
Data_14c000:: INCLUDE "data/unknown_14c000.asm"

Data_14c668::
	dr $14c668, $150000

SECTION "bank 54", ROMX, BANK [$54]
	dr $150000, $154000

SECTION "bank 55", ROMX, BANK [$55]
	dr $154000, $158000

SECTION "bank 56", ROMX, BANK [$56]
	dr $158000, $15c000

SECTION "bank 57", ROMX, BANK [$57]
	dr $15c000, $160000

SECTION "bank 59", ROMX, BANK [$59]
UnknownTZFile32:: INCBIN "gfx/tzfiles/tz_32.2bpp.tz"
UnknownTZFile33:: INCBIN "gfx/tzfiles/tz_33.2bpp.tz"
UnknownTZFile34:: INCBIN "gfx/tzfiles/tz_34.2bpp.tz"
UnknownTZFile35:: INCBIN "gfx/tzfiles/tz_35.2bpp.tz"
UnknownTZFile36:: INCBIN "gfx/tzfiles/tz_36.2bpp.tz"
UnknownTZFile37:: INCBIN "gfx/tzfiles/tz_37.2bpp.tz"
UnknownTZFile38:: INCBIN "gfx/tzfiles/tz_38.2bpp.tz"
UnknownTZFile39:: INCBIN "gfx/tzfiles/tz_39.2bpp.tz"
UnknownTZFile40:: INCBIN "gfx/tzfiles/tz_40.2bpp.tz"
UnknownTZFile41:: INCBIN "gfx/tzfiles/tz_41.2bpp.tz"
UnknownTZFile42:: INCBIN "gfx/tzfiles/tz_42.2bpp.tz"

SECTION "bank 5E", ROMX, BANK [$5e]
Data_178000::
	dr $178000, $178022

Data_178022::
	dr $178022, $178044

Data_178044::
	dr $178044, $17c000

SECTION "bank 5F", ROMX, BANK [$5f]
	dr $17c000, $180000

SECTION "bank 60", ROMX, BANK [$60]
	dr $180000, $184000

SECTION "bank 63", ROMX, BANK [$63]
	dr $18c000, $190000

SECTION "bank 64", ROMX, BANK [$64]
	dr $190000, $194000

SECTION "bank 65", ROMX, BANK [$65]
	dr $194000, $198000

SECTION "bank 66", ROMX, BANK [$66]
	dr $198000, $19c000

SECTION "bank 67", ROMX, BANK [$67]
INCLUDE "data/unknown_19c000.asm"

Data_19e8ed::
	dr $19e8ed, $1a0000

SECTION "bank 68", ROMX, BANK [$68]
	dr $1a0000, $1a4000

SECTION "bank 69", ROMX, BANK [$69]
	dr $1a4000, $1a8000

SECTION "bank 6A", ROMX, BANK [$6a]
	dr $1a8000, $1ac000

SECTION "bank 75", ROMX, BANK [$75]
	dr $1d4000, $1d4b48

Data_1d4b48::
	dr $1d4b48, $1d5628

Data_1d5628::
	dr $1d5628, $1d5640

Data_1d5640::
	dr $1d5640, $1d56ee

Data_1d56ee::
	dr $1d56ee, $1d7988

Data_1d7988::
	dr $1d7988, $1d8000

SECTION "bank 79", ROMX, BANK [$79]
	dr $1e4000, $1e8000

SECTION "bank 7A", ROMX, BANK [$7a]
	dr $1e8000, $1ec000

SECTION "bank 7B", ROMX, BANK [$7b]
	dr $1ec000, $1f0000

SECTION "bank 7C", ROMX, BANK [$7c]
TitleScreenPCM:: INCBIN "audio/pcm/title.pcm"
TitleScreenPCMEnd::
