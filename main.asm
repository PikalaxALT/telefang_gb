INCLUDE "includes.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

INCLUDE "home.asm"

SECTION "bank 02", ROMX, BANK [$2]
Func_8000::
	ld a, [wSubroutine]
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
	ld [wSubroutine], a
	ret

INCLUDE "engine/intro_movie.asm"

Func_84cf: ; 84cf (2:44cf)
	ld a, [wSubroutine]
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
	ld [wSubroutine], a
	ret

Func_858e: ; 858e (2:458e)
	ld a, [wSubroutine]
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
	ld [wSubroutine], a
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
	ld a, [wSubroutine]
	cp $1c
	ret z
	cp $22
	ret z
	cp $10
	jr nz, .asm_8663
	ld a, [wSubroutine2]
	cp $e
	ret z
	cp $f
	ret z
	cp $15
	ret z
	jr .asm_867d

.asm_8663
	ld a, [wSubroutine]
	cp $16
	jr nz, .asm_8670
	ld a, [wSubroutine2]
	cp $9
	ret z
.asm_8670
	ld a, [wSubroutine]
	cp $18
	jr nz, .asm_867d
	ld a, [wSubroutine2]
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
	ld a, BANK(s3_b000)
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
	ld a, [wSubroutine]
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
	ld [wSubroutine], a
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
	dr $8ba7, $8baf

Data_8baf:
	dr $8baf, $8c81

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
	ld a, [wSubroutine]
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
	ld de, VTilesShared tile $00
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
	ld de, VTilesBG tile $20
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call Func_3d5c
	ld a, [wd456]
	cp $1
	jr z, .asm_8d20
	ld a, [wSubroutine]
	cp $1
	jr z, .asm_8d2b
.asm_8d20
	ld a, [wd496]
	ld hl, VTilesBG tile $30
	call Func_3e19
	jr .asm_8d37

.asm_8d2b
	ld a, [wd497]
	ld de, Data_1d4000
	ld bc, VTilesBG tile $30
	call Func_3adc
.asm_8d37
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
	call Func_3adc
	call Func_0597
	call Func_90c2
	ld de, Data_8ba7
	ld hl, VTilesShared tile $60
	ld b, $8
	call PlaceString_
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
	ld hl, VTilesBG tile $1b
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
	ld a, [wSubroutine]
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
	ld de, VTilesShared tile $00
	call Func_0516
	pop af
	call Func_175f
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wd497]
	ld de, VTilesBG tile $20
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call Func_3d5c
	ld a, [wSubroutine]
	cp $1
	jr nz, .asm_8eff
	ld a, [wd497]
	ld de, Data_1d4000
	ld bc, VTilesBG tile $30
	call Func_3adc
	jr .asm_8f08

.asm_8eff
	ld a, [wd496]
	ld hl, VTilesBG tile $30
	call Func_3e19
.asm_8f08
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
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
	ld a, [wSubroutine]
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
	ld a, [wSubroutine2]
	inc a
	ld [wSubroutine2], a
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
	ld [MBC3SRamEnable], a
	ld a, $1
	ld [MBC3SRamBank], a
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
	ld [MBC3SRamEnable], a
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
	ld a, [wSubroutine]
	cp $2
	jr nz, .asm_907c
.asm_9062
	ld hl, s2_a00a
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
	hlbgcoord 4, 12
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
	ld bc, VTilesShared tile $38
	call Func_0565
	ld a, [wd497]
	ld b, $0
	ld c, $7
	call Func_058d
	ld a, [wd45f]
	ld de, $46f8
	ld bc, VTilesShared tile $40
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
	ld bc, VTilesShared tile $48
	call Func_0565
	jr .asm_9125

.asm_911a
	ld de, Data_8baf
	ld hl, VTilesShared tile $48
	ld b, $8
	call PlaceString_
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
	ld bc, VTilesShared tile $50
	call Func_0565
	jr .asm_9160

.asm_9155
	ld de, $4baf
	ld hl, VTilesShared tile $50
	ld b, $8
	call PlaceString_
.asm_9160
	ret

.asm_9161
	ld hl, VTilesShared tile $50
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
	hlbgcoord 6, 12
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $2
	call Func_058d
	ld a, [wd45f]
	hlbgcoord 6, 14
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $3
	call Func_058d
	ld a, [wd45f]
	hlbgcoord 6, 16
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $4
	call Func_058d
	ld a, [wd45f]
	hlbgcoord 15, 12
	ld c, $0
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $5
	call Func_058d
	ld a, [wd45f]
	hlbgcoord 15, 14
	ld c, $0
	call Func_1378
	ret

Func_923b: ; 923b (2:523b)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s2_a002)
	ld [MBC3SRamBank], a
	ld a, [wd498]
	hlbgcoord 5, 15
	ld c, $1
	call Func_1378
	ld a, [wd498]
	ld b, a
	ld a, [wd497]
	ld c, $0
	call Func_058d
	ld a, [wd45f]
	hlbgcoord 5, 16
	ld c, $0
	call Func_1378
	ld a, [wcb2b]
	cp $1
	jr z, .asm_927d
	ld a, [wd456]
	cp $1
	jr z, .asm_927d
	ld a, [wSubroutine]
	cp $2
	jp nz, Func_9289
.asm_927d
	ld a, [wd496]
	ld hl, s2_a002
	call Func_3d0e
	ld a, [hl]
	jr asm_928b

Func_9289: ; 9289 (2:5289)
	ld a, $0
asm_928b
	hlbgcoord 14, 15
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
	ld a, [wSubroutine]
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
	bcbgcoord 11, 16
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
	bcbgcoord 15, 16
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
Func_c000:
	ld bc, $20
	call Wait17500TimesBCCycles
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2a0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2b0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2c0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2d0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2e0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c2f0
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c300
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c310
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, GFX_e368 + $86 tiles
	ld de, Data_c230
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368 + $b7 tiles
	ld de, Data_c270
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_c368
	ld de, Data_c240
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_d368
	ld de, Data_c250
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368
	ld de, Data_c260
	call CopyToVRAMAndSendToSGB
	ld hl, Data_c280
	call SendViaJoypadRegister
	ld bc, $40
	call Wait17500TimesBCCycles
	ld b, $0
	ld c, $0
	ld d, $0
	ld e, $0
	ld a, $0
	jp Func_c320

Func_c0b8:
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, GFX_c368
	ld de, Data_c240
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_d368
	ld de, Data_c250
	call CopyToVRAMAndSendToSGB
	ld hl, GFX_e368
	ld de, Data_c260
	call CopyToVRAMAndSendToSGB
	ld hl, Data_c280
	call SendViaJoypadRegister
	ld bc, $20
	call Wait17500TimesBCCycles
	ret

Func_c0ec:
	ld hl, Data_c290
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ld hl, Data_c112
	call SendViaJoypadRegister
	ld bc, $4
	call Wait17500TimesBCCycles
	ret

Func_c105:
	ld hl, wcc00
	call SendViaJoypadRegister
	ld bc, $3
	call Wait17500TimesBCCycles
	ret

Data_c112:
	db $50 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $c2, $00, $00
	db     $00, $00, $00, $00

Wait17500TimesBCCycles: ; c122 (3:4122)
	ld de, 1750
.asm_c125
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_c125
	dec bc
	ld a, b
	or c
	jr nz, Wait17500TimesBCCycles
	ret

SendViaJoypadRegister: ; c133 (3:4133)
	ld a, [hl]
	and $7
	ret z
	ld b, a
	ld c, rJOYP % $100
.loop
	push bc
	ld a, $0
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	ld b, $10
.loop_byte
	ld e, $8
	ld a, [hli]
	ld d, a
.loop_bit
	bit 0, d
	ld a, R_BUTTONS
	jr nz, .got_value
	ld a, R_DPAD
.got_value
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	rr d
	dec e
	jr nz, .loop_bit
	dec b
	jr nz, .loop_byte
	ld a, R_DPAD
	ld [$ff00+c], a
	ld a, $30
	ld [$ff00+c], a
	pop bc
	dec b
	ret z
	call Wait70000Cycles
	jr .loop

CopyToVRAMAndSendToSGB: ; c169 (3:4169)
	di
	push de
	call DisableLCD
	ld a, $e4
	ld [rBGP], a
	ld de, VTilesShared
	ld bc, $100 tiles
	call .CopyData
	ld hl, VBGMap
	ld de, BG_MAP_WIDTH - SCREEN_WIDTH
	ld a, $80
	ld c, 13
.row
	ld b, SCREEN_WIDTH
.column
	ld [hli], a
	inc a
	dec b
	jr nz, .column
	add hl, de
	dec c
	jr nz, .row
	ld a, $81
	ld [rLCDC], a
	ld bc, $5
	call Wait17500TimesBCCycles
	pop hl
	call SendViaJoypadRegister
	ld bc, $6
	call Wait17500TimesBCCycles
	ei
	ret

.CopyData: ; c1a6 (3:41a6)
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .CopyData
	ret

Func_c1af: ; c1af (3:41af)
	ld hl, Data_c214
	call SendViaJoypadRegister
	call Wait70000Cycles
	ld a, [rJOYP]
	and A_BUTTON | B_BUTTON
	cp  A_BUTTON | B_BUTTON
	jr nz, .finish_return_carry
	ld a, R_DPAD
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, R_BUTTONS
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, $30
	ld [rJOYP], a
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	ld a, [rJOYP]
	and A_BUTTON | B_BUTTON
	cp  A_BUTTON | B_BUTTON
	jr nz, .finish_return_carry
	ld hl, Data_c204
	call SendViaJoypadRegister
	call Wait70000Cycles
	sub a
	ret

.finish_return_carry
	ld hl, Data_c204
	call SendViaJoypadRegister
	call Wait70000Cycles
	scf
	ret

Data_c204:
	db $88 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c214:
	db $88 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Wait70000Cycles: ; c224 (3:4224)
	ld de, 7000
.asm_c227
	nop
	nop
	nop
	dec de
	ld a, d
	or e
	jr nz, .asm_c227
	ret

Data_c230:
	db $58 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c240:
	db $98 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c250:
	db $98 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c260:
	db $a0 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c270:
	db $a8 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c280:
	db $b8 | 1, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c290:
	db $b8 | 1, $01, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00
	db     $00, $00, $00, $00

Data_c2a0:
	db $78 | 1, $5d, $08, $00
	db     $0b, $8c, $d0, $f4
	db     $60, $00, $00, $00
	db     $00, $00, $00, $00

Data_c2b0:
	db $78 | 1, $52, $08, $00
	db     $0b, $a9, $e7, $9f
	db     $01, $c0, $7e, $e8
	db     $e8, $e8, $e8, $e0

Data_c2c0:
	db $78 | 1, $47, $08, $00
	db     $0b, $c4, $d0, $16
	db     $a5, $cb, $c9, $05
	db     $d0, $10, $a2, $28

Data_c2d0:
	db $78 | 1, $3c, $08, $00
	db     $0b, $f0, $12, $a5
	db     $c9, $c9, $c8, $d0
	db     $1c, $a5, $ca, $c9

Data_c2e0:
	db $78 | 1, $31, $08, $00
	db     $0b, $0c, $a5, $ca
	db     $c9, $7e, $d0, $06
	db     $a5, $cb, $c9, $7e

Data_c2f0:
	db $78 | 1, $26, $08, $00
	db     $0b, $39, $cd, $48
	db     $0c, $d0, $34, $a5
	db     $c9, $c9, $80, $d0

Data_c300:
	db $78 | 1, $1b, $08, $00
	db     $0b, $ea, $ea, $ea
	db     $ea, $ea, $a9, $01
	db     $cd, $4f, $0c, $d0

Data_c310:
	db $78 | 1, $10, $08, $00
	db     $0b, $4c, $20, $08
	db     $ea, $ea, $ea, $ea
	db     $ea, $60, $ea, $ea

Func_c320: ; c320 (3:4320)
	push af
	ld a, [wc40a]
	or a
	jp nz, Func_c32a
	pop af
	ret

Func_c32a: ; c32a (3:432a)
	pop af
	add $c0
	ld [wcc09], a
	ld a, b
	ld [wcc01], a
	ld a, c
	ld [wcc03], a
	ld a, d
	ld [wcc05], a
	ld a, e
	ld [wcc07], a
	ld a, $51
	ld [wcc00], a
	xor a
	ld [wcc02], a
	ld [wcc04], a
	ld [wcc06], a
	ld [wcc08], a
	xor a
	ld [wcc0a], a
	ld [wcc0b], a
	ld [wcc0c], a
	ld [wcc0d], a
	ld [wcc0e], a
	ld [wcc0f], a
	jp Func_c105

IF DEF(POWER)
GFX_c368: INCBIN "gfx/misc/c368.power.2bpp"
GFX_d368: INCBIN "gfx/misc/d368.power.2bpp"
GFX_e368: INCBIN "gfx/misc/e368.power.2bpp"
ELSE
GFX_c368: INCBIN "gfx/misc/c368.speed.2bpp"
GFX_d368: INCBIN "gfx/misc/d368.speed.2bpp"
GFX_e368: INCBIN "gfx/misc/e368.speed.2bpp"
ENDC

REPT $1e
	db $0
ENDR

Func_f586:
	ld [wFontSourceBank], a
	ld a, [wc3d8]
	or a
	jr z, .asm_f596
	dec a
	ld [wc3d8], a
	jp Func_f5d2

.asm_f596
	ld a, [wc3da]
	cp $4
	jr z, asm_f5d4
	ld a, [wc3d9]
	ld [wc3d8], a
	check_cgb
	jp z, Func_f701
	ld a, [wFontSourceBank]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f636
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc3da]
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wBGP], a
	ld a, [wc3da]
	inc a
	ld [wc3da], a
Func_f5d2: ; f5d2 (3:75d2)
	xor a
	ret

asm_f5d4
	ld a, $1
	ret

Func_f5d7:
	ld [wFontSourceBank], a
	ld a, [wc3d8]
	or a
	jr z, .asm_f5e7
	dec a
	ld [wc3d8], a
	jp Func_f631

.asm_f5e7
	ld a, [wc3da]
	cp $4
	jr z, asm_f633
	ld a, [wc3d9]
	ld [wc3d8], a
	check_cgb
	jp z, Func_f763
	ld a, [wFontSourceBank]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f636
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc3da]
	ld d, $0
	ld e, a
	add hl, de
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP0], a
	ld d, $0
	ld e, $5
	add hl, de
	ld a, [hl]
	ld [wOBP1], a
	ld a, [wc3da]
	inc a
	ld [wc3da], a
Func_f631: ; f631 (3:7631)
	xor a
	ret

asm_f633
	ld a, $1
	ret

Pointers_f636:
	dw Data_f646, Data_f650
	dw Data_f655, Data_f65f
	dw Data_f664, Data_f66e
	dw Data_f673, Data_f67d

Data_f646: db $00, $54, $a4, $e4, $ff
           db $00, $50, $a0, $e0, $ff
Data_f650: db $00, $51, $92, $d2, $ff
Data_f655: db $e4, $a4, $54, $00, $ff
           db $e0, $a0, $50, $00, $ff
Data_f65f: db $d2, $92, $51, $00, $ff
Data_f664: db $ff, $ea, $e5, $e4, $ff
           db $ff, $ea, $e5, $e0, $ff
Data_f66e: db $ff, $ea, $d6, $d2, $ff
Data_f673: db $e4, $e5, $ea, $ff, $ff
           db $e0, $e5, $ea, $ff, $ff
Data_f67d: db $d2, $d6, $ea, $ff, $ff

Func_f682: ; f682 (3:7682)
	push de
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	ld hl, wde00
	call Func_f873
	call CopyDEC0ToBGPalBuffer
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	ld hl, wde60
	call Func_f873
	call CopyDEC0ToOBPalBuffer
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	pop de
	xor a
	ret

CopyDEC0ToBGPalBuffer: ; f6c3 (3:76c3)
	ld hl, wdec0
	ld de, wCGB_BGPalsBuffer
	ld b, $8
.pal
	push bc
	ld b, $4
.hue
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jp nz, .hue
	pop bc
	dec b
	jp nz, .pal
	ret

Data_f6de:
x = $80
REPT 8
	db x
x = x + $08
ENDR

CopyDEC0ToOBPalBuffer: ; f6e6 (3:76e6)
	ld hl, wdec0
	ld de, wCGB_OBPalsBuffer
	ld b, $8
.pal
	push bc
	ld b, $4
.hue
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jp nz, .hue
	pop bc
	dec b
	jp nz, .pal
	ret

Func_f701: ; f701 (3:7701)
	push de
	push bc
	ld a, b
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld h, d
	ld l, e
	sla e
	rl d
	add hl, de
	ld de, wde00
	add hl, de
	ld a, c
	ld [wc44f], a
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	call Func_f7bd
	pop bc
	ld a, b
	ld hl, Data_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rBGPI], a
	ld hl, wdec0
	ld a, c
	add a
	add a
	add a
	ld b, a
Func_f743: ; f743 (3:7743)
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rBGPD], a
	ei
	pop bc
	dec b
	jp nz, Func_f743
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	pop de
	xor a
	ret

Data_f75b:
x = $80
REPT 8
	db x
x = x + $08
ENDR

Func_f763: ; f763 (3:7763)
	push de
	push bc
	ld a, b
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld h, d
	ld l, e
	sla e
	rl d
	add hl, de
	ld de, wde60
	add hl, de
	ld a, c
	ld [wc44f], a
	ld de, wdec0
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ld a, [wcb27]
	call Func_f7bd
	pop bc
	ld a, b
	ld hl, Data_f75b
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld [rOBPI], a
	ld hl, wdec0
	ld a, c
	add a
	add a
	add a
	ld b, a
Func_f7a5: ; f7a5 (3:77a5)
	push bc
	di
	call WaitStat
	ld a, [hli]
	ld [rOBPD], a
	ei
	pop bc
	dec b
	jp nz, Func_f7a5
	ld a, [wc3da]
	inc a
	ld [wc3da], a
	pop de
	xor a
	ret

Func_f7bd: ; f7bd (3:77bd)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f7d2
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_f7d2:
	dw Func_f7e3
	dw Func_f7e2
	dw Func_f806
	dw Func_f7e2
	dw Func_f82b
	dw Func_f7e2
	dw Func_f84e
	dw Func_f7e2

Func_f7e2:
	ret

Func_f7e3:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
Func_f7f6: ; f7f6 (3:77f6)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f7f6
	ret

Func_f806:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $0
	add c
	ld c, a
Func_f81b: ; f81b (3:781b)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f81b
	ret

Func_f82b:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
Func_f83e: ; f83e (3:783e)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f83e
	ret

Func_f84e:
	ld h, b
	ld l, c
	ld a, [wc44f]
	ld b, a
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $1f
	sub c
	ld c, a
Func_f863: ; f863 (3:7863)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f863
	ret

Func_f873: ; f873 (3:7873)
	ld b, h
	ld c, l
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, Pointers_f888
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_f888:
	dw Func_f899
	dw Func_f898
	dw Func_f8ba
	dw Func_f898
	dw Func_f8dd
	dw Func_f898
	dw Func_f8fe
	dw Func_f898

Func_f898:
	ret

Func_f899:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $20
	sub c
	ld c, a
	ld b, $8
Func_f8aa: ; f8aa (3:78aa)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f8aa
	ret

Func_f8ba:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $0
	add c
	ld c, a
	ld b, $8
Func_f8cd: ; f8cd (3:78cd)
	push bc
	push hl
	call Func_f921
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f8cd
	ret

Func_f8dd:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	ld c, a
	ld a, $0
	add c
	ld c, a
	ld b, $8
Func_f8ee: ; f8ee (3:78ee)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f8ee
	ret

Func_f8fe:
	ld h, b
	ld l, c
	ld a, [wc3da]
	add $1
	add a
	add a
	add a
	sub $1
	ld c, a
	ld a, $1f
	sub c
	ld c, a
	ld b, $8
Func_f911: ; f911 (3:7911)
	push bc
	push hl
	call Func_f953
	pop hl
	ld de, $c
	add hl, de
	pop bc
	dec b
	jp nz, Func_f911
	ret

Func_f921: ; f921 (3:7921)
	ld a, c
	ld [wc440], a
REPT 4
	ld de, wFontSourceAddr + 1
	call Func_f93e
ENDR
	ret

Func_f93e: ; f93e (3:793e)
	ld b, $3
Func_f940: ; f940 (3:7940)
	ld a, [wc440]
	cp [hl]
	jp nc, Func_f948
	ld a, [hl]
Func_f948: ; f948 (3:7948)
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, Func_f940
	call Func_f985
	ret

Func_f953: ; f953 (3:7953)
	ld a, c
	ld [wc440], a
REPT 4
	ld de, wFontSourceAddr + 1
	call Func_f970
ENDR
	ret

Func_f970: ; f970 (3:7970)
	ld b, $3
Func_f972: ; f972 (3:7972)
	ld a, [wc440]
	cp [hl]
	jp c, Func_f97a
	ld a, [hl]
Func_f97a: ; f97a (3:797a)
	ld [de], a
	inc hl
	inc de
	dec b
	jp nz, Func_f972
	call Func_f985
	ret

Func_f985: ; f985 (3:7985)
	dec de
	ld a, [de]
	ld b, a
	sla b
	sla b
	dec de
	ld a, [de]
	sla a
	swap a
	ld c, a
	and $3
	or b
	ld b, a
	ld a, c
	and $e0
	ld c, a
	dec de
	ld a, [de]
	or c
	ld c, a
	ld a, [wc454]
	ld d, a
	ld a, [wc455]
	ld e, a
	ld a, c
	ld [de], a
	inc de
	ld a, b
	ld [de], a
	inc de
	ld a, d
	ld [wc454], a
	ld a, e
	ld [wc455], a
	ret

Func_f9b6:
	push hl
	push de
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wc44f]
	and $f0
	or a
	jr z, .asm_f9cf
	swap a
	add $bb
	call WaitStatAndLoad
	jr .asm_f9d3

.asm_f9cf
	xor a
	call WaitStatAndLoad
.asm_f9d3
	ld a, [wc44f]
	and $f
	add $bb
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_f9e1:
	call Func_0d4e
	ld a, [wc400]
	ld h, $0
	ld l, a
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wc452], a
	ld a, [wc441]
	ld h, $0
	ld l, a
	ld d, $a
	call Func_15b0
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wc453], a
	ld a, [wc441]
	ld h, $0
	ld l, a
	ld d, $a
	call Func_15b0
	ld bc, $ff
	call Func_1338
	ld a, [wFontSourceBank]
	ld [wc454], a
	ld h, $0
	ld a, [wc452]
	ld l, a
	ld d, $64
	call Func_15b0
	push hl
	ld h, $0
	ld a, [wc453]
	ld l, a
	ld d, $a
	call Func_15b0
	ld b, h
	ld c, l
	pop hl
	add hl, bc
	ld b, $0
	ld a, [wc454]
	ld c, a
	add hl, bc
	ld a, l
	ld [wFontSourceBank], a
	ret

Func_fa4b:
	push hl
	push de
	push bc
	xor a
	ld [wc452], a
	ld a, b
	ld [wc442], a
	ld a, c
	ld [wc443], a
	ld bc, $3e8
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fa77
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fa8e

.asm_fa77
	add $bb
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc452], a
.asm_fa8e
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $64
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fac0
	ld a, [wc452]
	or a
	jr z, .asm_faab
	xor a
	jr .asm_fac0

.asm_faab
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fadb

.asm_fac0
	add $bb
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc452], a
.asm_fadb
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $a
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_fb0d
	ld a, [wc452]
	or a
	jr z, .asm_faf8
	xor a
	jr .asm_fb0d

.asm_faf8
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $2
	add hl, bc
	xor a
	di
	call WaitStat
	ld [hl], a
	ei
	jr .asm_fb23

.asm_fb0d
	add $bb
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $2
	add hl, bc
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
.asm_fb23
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $3
	add hl, bc
	ld a, [wc441]
	add $bb
	di
	call WaitStat
	ld [hl], a
	ei
	pop bc
	pop de
	pop hl
	ret

SaveGame: ; fb3e (3:7b3e)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	ld hl, wc900
	ld de, s0_a010
	ld bc, $80
	call CopyData
	ld hl, wcd00
	ld de, s0_a110
	ld bc, $100
	call CopyData
	ld hl, wEventFlags
	ld de, s0_a210
	ld bc, $200
	call CopyData
	ld hl, s2_a000
	ld de, s0_a410
	ld bc, $1900
	ld a, BANK(s2_a000)
	ld [wFontSourceBank], a
	xor a
	ld [wFontSourceAddr], a
	call SaveAndLoadGame_FarCopySRAMDouble
	call CalculateChecksum
	ld a, $1
	ld [s0_bffd], a
	xor a
	ld [MBC3SRamEnable], a
	ret

LoadGame: ; fb8d (3:7b8d)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	ld hl, s0_a010
	ld de, wc900
	ld bc, $80
	call CopyData
	ld hl, s0_a110
	ld de, wcd00
	ld bc, $100
	call CopyData
	ld hl, s0_a210
	ld de, wEventFlags
	ld bc, $200
	call CopyData
	ld hl, s0_a410
	ld de, s2_a000
	ld bc, $1900
	xor a
	ld [wFontSourceBank], a
	ld a, BANK(s2_a000)
	ld [wFontSourceAddr], a
	call SaveAndLoadGame_FarCopySRAMDouble
	xor a
	ld [MBC3SRamEnable], a
	ld a, [wc926]
	ld [wc904], a
	ld a, [wc927]
	ld [wc906], a
	ld a, [wc928]
	ld [wc901], a
	ld a, [wc929]
	ld [wc902], a
	ret

SaveAndLoadGame_FarCopySRAMDouble:
.loop
	ld a, [wFontSourceBank]
	ld [MBC3SRamBank], a
	ld a, [hli]
	push af
	ld a, [wFontSourceAddr]
	ld [MBC3SRamBank], a
	pop af
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

SECTION "bank 04", ROMX, BANK [$4]
INCLUDE "engine/phone_menu.asm"

Func_105c0: ; 105c0 (4:45c0)
	ld a, [wSubroutine]
	ld hl, Pointers_105ca
	call GetHalfwordFromTable
	jp [hl]

Pointers_105ca:
	dw Func_10612
	dw Func_10621
	dw Func_10627
	dw Func_10642
	dw Func_10658
	dw Func_10681
	dw Func_10743
	dw Func_107d9
	dw Func_107ee
	dw Func_10807
	dw Func_1082e
	dw Func_1084e
	dw Func_10866
	dw Func_10872
	dw Func_10883
	dw Func_1089c
	dw Func_10a49
	dw Func_10e5b
	dw Func_10ee7
	dw Func_112e3
	dw Func_11023
	dw Func_1107e
	dw Func_110ee
	dw Func_108ab
	dw Func_11417
	dw Func_108cb
	dw Func_10907
	dw Func_10936
	dw Func_10953
	dw Func_10969
	dw Func_109a8
	dw Func_109a9
	dw Func_109aa
	dw Func_109dc
	dw Func_109f3
	dw Func_10a09

Func_10612: ; 10612 (4:4612)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_13a0b
	jp IncrementSubroutine

Func_10621: ; 10621 (4:4621)
	call Func_13e27
	jp IncrementSubroutine

Func_10627: ; 10627 (4:4627)
	call Func_13a1e
	ld a, $a7
	ld [wWX], a
	xor a
	ld [wWY], a
	ld a, $50
	ld [wSCX], a
	xor a
	ld [wSCY], a
	call Func_119cd
	jp IncrementSubroutine

Func_10642: ; 10642 (4:4642)
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_10658: ; 10658 (4:4658)
	ld a, $e3
	ld [wLCDC], a
	xor a
	ld [wSCY], a
	ld a, [wSCX]
	sub $10
	ld [wSCX], a
	ld a, [wWX]
	sub $10
	ld [wWX], a
	cp $58
	ret nc
	ld a, $58
	ld [wWX], a
	ld a, $0
	ld [wSCX], a
	jp IncrementSubroutine

Func_10681: ; 10681 (4:4681)
	call Func_119b9
	call Func_116e7
	ld a, $1
	ld [wc430], a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_10697
	ld a, $b
	jr .asm_106a0

.asm_10697
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_106a9
	ld a, $e
.asm_106a0
	ld [wSubroutine], a
	ld a, $2
	ld [H_FFA1], a
	ret

.asm_106a9
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_106f2
	ld a, [wcd22]
	cp $0
	jr z, .asm_106de
	cp $1
	jr z, .asm_106d6
	cp $2
	jr z, .asm_106da
	cp $3
	jr z, .asm_106da
	cp $4
	jr z, .asm_106da
	cp $5
	jr z, .asm_106da
	cp $6
	jr z, .asm_106da
	cp $7
	jr z, .asm_106f8
	ld a, $18
	jr .asm_106e0

.asm_106d6
	ld a, $16
	jr .asm_106e0

.asm_106da
	add $f
	jr .asm_106e0

.asm_106de
	ld a, $10
.asm_106e0
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld e, $2d
	call Func_13951
	ld a, $3
	ld [H_FFA1], a
	ret

.asm_106f2
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10708
.asm_106f8
	ld a, $4
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	ld a, $17
	ld [wSubroutine], a
	ret

.asm_10708
	ld a, [hJoyNew]
	and SELECT
	jr z, .asm_10742
	ld a, $4
	ld [wcb65], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d40
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld bc, $d
	ld hl, wd000
	call ClearMemory3
	ld bc, $d
	ld hl, wd200
	call ClearMemory3
	xor a
	ld [wcb29], a
	ld [wcb43], a
	ld [wcb39], a
	jp IncrementSubroutine

.asm_10742
	ret

Func_10743: ; 10743 (4:4743)
	ld a, [wcb29]
	cp $0
	call z, Func_116e7
	ld a, [hJoyNew]
	and SELECT
	jr z, .asm_10778
	ld a, [wcb29]
	cp $0
	jr z, .asm_10764
.asm_10758
	call Func_13e37
	ld bc, $307
	call Func_119df
	call Func_135ef
.asm_10764
	ld de, wOAMAnimation01
	call Func_099c
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

.asm_10778
	call Func_11b37
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_107b6
	call Func_126a1
	ld a, [wcb65]
	cp $0
	ret z
	cp $1
	ret z
	cp $2
	ret z
	cp $3
	jr nz, .asm_1079f
	call Func_1360a
	ld a, $10
	ld [wcb2c], a
	jp IncrementSubroutine

.asm_1079f
	ld a, [wcb29]
	cp $0
	jr nz, .asm_107b3
	ld a, $1
	ld [wcb29], a
	ld e, $2d
	call Func_13951
	call Func_1175d
.asm_107b3
	jp Func_13474

.asm_107b6
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_107d8
	ld a, [wcb39]
	cp $0
	jr z, .asm_10758
	dec a
	ld [wcb39], a
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	xor a
	ld [hl], a
	ld a, $4
	ld [H_FFA1], a
	jp Func_134aa

.asm_107d8
	ret

Func_107d9: ; 107d9 (4:47d9)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine

Func_107ee: ; 107ee (4:47ee)
	ld a, $65
	ld [H_FFA1], a
	ld a, [wcb43]
	cp $0
	jr z, .asm_107ff
	ld a, $66
	ld [H_FFA1], a
.asm_107ff
	ld a, $80
	ld [wcb2c], a
	jp IncrementSubroutine

Func_10807: ; 10807 (4:4807)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, [wcb43]
	cp $0
	jr z, .asm_1082b
	ld a, $4
	call Func_050a
	ld a, $19
	ld [wSubroutine], a
	ret

.asm_1082b
	jp IncrementSubroutine

Func_1082e: ; 1082e (4:482e)
	call Func_13e37
	ld bc, $307
	call Func_119df
	call Func_135ef
	ld de, wOAMAnimation01_PriorityFlags
	call Func_099c
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	ret

Func_1084e: ; 1084e (4:484e)
	call Func_13f38
	ld bc, $306
	call Func_119df
	ld a, [wcd22]
	inc a
	cp $9
	jr nz, .asm_10860
	xor a
.asm_10860
	ld [wcd22], a
	jp IncrementSubroutine

Func_10866: ; 10866 (4:4866)
	call Func_13f3d
	ld bc, $308
	call Func_119df
	jp IncrementSubroutine

Func_10872: ; 10872 (4:4872)
	ld e, $12
	call Func_13951
	ld bc, $307
	call Func_119df
	ld a, $5
	ld [wSubroutine], a
	ret

Func_10883: ; 10883 (4:4883)
	call Func_13f3d
	ld bc, $308
	call Func_119df
	ld a, [wcd22]
	dec a
	cp $ff
	jr nz, .asm_10896
	ld a, $8
.asm_10896
	ld [wcd22], a
	jp IncrementSubroutine

Func_1089c: ; 1089c (4:489c)
	call Func_13f38
	ld bc, $306
	call Func_119df
	ld a, $d
	ld [wSubroutine], a
	ret

Func_108ab: ; 108ab (4:48ab)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wcad0], a
	ld a, $5
	ld [wGameRoutine], a
	ld a, $a
	ld [wSubroutine], a
	call Func_13e6e
	xor a
	ld [wcb2b], a
	ld [wFontPaletteMode], a
	ret

Func_108cb: ; 108cb (4:48cb)
	ld a, $1
	call Func_050f
	or a
	ret z
	call Func_135ef
	ld a, [wcb43]
	cp $1
	jr z, .asm_10904
	call Func_13b3a
	cp $0
	jr nz, .asm_108e9
	ld a, $20
	ld [wSubroutine], a
	ret

.asm_108e9
	ld a, [wcb01]
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, $7c0d
	add hl, de
	ld a, [hli]
	ld [wcb01], a
	ld a, $3
	ld [wcb43], a
.asm_10904
	jp IncrementSubroutine

Func_10907: ; 10907 (4:4907)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	call Func_13e6e
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine

Func_10936: ; 10936 (4:4936)
	ld a, $0
	call Func_050f
	or a
	ret z
	call Func_13c53
	ld a, [wcb43]
	cp $3
	jr nz, .asm_1094b
	ld c, $fd
	ld b, $1
.asm_1094b
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_10953: ; 10953 (4:4953)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_10969: ; 10969 (4:4969)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wcad0], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb04]
	jp Func_13fb5

Func_109a8: ; 109a8 (4:49a8)
	ret

Func_109a9: ; 109a9 (4:49a9)
	ret

Func_109aa: ; 109aa (4:49aa)
	call ClearObjectAnimationBuffers
	ld a, [wcb01]
	call Func_13c7e
	call Func_1371c
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	call Func_13e6e
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine

Func_109dc: ; 109dc (4:49dc)
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, [wcb01]
	add $80
	ld c, a
	ld b, $1
	ld d, $c
	call Func_0520
	jp IncrementSubroutine

Func_109f3: ; 109f3 (4:49f3)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine

Func_10a09: ; 10a09 (4:4a09)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wcad0], a
	call Func_13a0b
	call Func_13e27
	call Func_13a1e
	call Func_13e58
	call Func_119cd
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ld [wFontPaletteMode], a
	ld a, [wcb01]
	call Func_13b79
	ret

Func_10a49: ; 10a49 (4:4a49)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, $4a56
	call GetHalfwordFromTable
	jp [hl]

	add [hl]
	ld c, d
	sbc h
	ld c, d
	sub $4a
	db $fc
	ld c, d
	sub d
	ld c, e
	cp l
	ld c, e
	ret nz
	ld c, e
	adc $4b
	di
	ld c, e
	ld b, a
	ld c, h
	ld b, a
	ld a, a
	ld c, [hl]
	ld a, a
	ld c, d
	ld c, h
	sub b
	ld c, h
	or h
	ld c, h
	ret

	ld c, h
	jr nc, .asm_10ac5
	add [hl]
	ld c, l
	db $d3
	ld c, l
	db $ec
	ld c, l
	scf
	ld c, [hl]
	ld b, l
	ld c, [hl]
	ld e, c
	ld c, [hl]
	ld e, d
	ld c, [hl]
	call Func_1236b
	ld bc, $12
	check_cgb
	jr z, .asm_10a96
	ld bc, $57
.asm_10a96
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

	ld a, [wcd24]
	ld b, a
	ld a, [wcb72]
	dec a
	cp b
	jr nc, .asm_10aae
	ld a, [wcd24]
	dec a
	ld [wcd24], a
.asm_10aae
	ld a, [wcd24]
	call Func_12473
	ld c, $0
	ld de, VTilesBG tile $40
	call Func_0516
	ld a, [wcd24]
	call Func_12473
	call Func_1764
.asm_10ac5
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wcd24]
	call Func_12473
	call Func_11a35
	jp IncrementSubroutine2

	ld e, $2e
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13124
	ld a, $1
	ld [wc430], a
	jp IncrementSubroutine2

	call Func_132d9
	ld a, $1
	ld [wc430], a
	ld a, [wcb72]
	dec a
	cp $0
	jr z, .asm_10b2f
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_10b2f
	ld a, [wcb72]
	dec a
	ld b, a
	ld a, [wcd24]
	cp b
	jr nz, .asm_10b20
	ld a, $ff
.asm_10b20
	inc a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_FFA1], a
	ret

.asm_10b2f
	ld a, [wcb72]
	dec a
	cp $0
	jr z, .asm_10b57
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_10b57
	ld a, [wcd24]
	cp $0
	jr nz, .asm_10b48
	ld a, [wcb72]
.asm_10b48
	dec a
	ld [wcd24], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_FFA1], a
	ret

.asm_10b57
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_10b70
	ld e, $2d
	call Func_13951
	ld a, $4
	ld [H_FFA1], a
	call Func_13fc6
	ld a, $a
	ld [wSubroutine2], a
	ret

.asm_10b70
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_10b91
	ld a, $3
	ld [H_FFA1], a
	ld e, $2d
	call Func_13951
	xor a
	ld [wcb67], a
	call Func_13fc6
	ld a, $4
	call Func_050a
	ld a, $7
	ld [wSubroutine2], a
.asm_10b91
	ret

Func_10b92:
	ld bc, $1a
	check_cgb
	jr z, .asm_10b9f
	ld bc, $54
.asm_10b9f
	call DecompressGFXByIndex_
	ld e, $3e
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	call Func_1329a
	ld a, $1
	ld [wc430], a
	jp IncrementSubroutine2

Func_4bbd:
	jp IncrementSubroutine2

Func_4bc0:
	ld de, wOAMAnimation02
	call Func_0616
	ld a, $1
	ld [wc430], a
	jp Func_131a0

Func_4bce:
	ld a, $1
	call Func_050f
	or a
	ret z
	call Func_13e6e
	call Func_136d2
	call ClearObjectAnimationBuffers
	ld a, $1
	ld [wc430], a
	ld [wcb2b], a
	ld a, $9
	ld [wGameRoutine], a
	xor a
	ld [wd41f], a
	ld [wFontPaletteMode], a
	ret

Func_4bf3:
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $0
	ld e, $10
	call Func_13959
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, [wcb2b]
	cp $1
	jr nz, .asm_10c3d
	ld bc, $12
	check_cgb
	jr z, .asm_10c2e
	ld bc, $57
.asm_10c2e
	call DecompressGFXByIndex_
	ld a, $1
	ld [wSubroutine2], a
	xor a
	ld [wcb2b], a
	jp Func_1236b

.asm_10c3d
	xor a
	ld [wcb2b], a
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10c47:
	jp Func_12b2b

Func_10c4a:
	ld a, $1
	call Func_050f
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	call ClearObjectAnimationBuffers
	call Func_13e4c
	ld [wcb04], a
	call Func_13a30
	call Func_1371c
	call Func_13f15
	ld e, $1c
	ld bc, $603
	ld a, $0
	call Func_04ca
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	ld a, $2
	ld [wcad0], a
	ld a, [wcb04]
	call Func_13fb5
	jp IncrementSubroutine2

Func_10c90:
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	call Func_070c
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_10cb4:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld c, $fe
	ld b, $1
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_10cc9:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld bc, $c3e
	call CheckEventFlag
	jr nz, .asm_10ce7
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

.asm_10ce7
	ld a, $3
	ld [H_FFA1], a
	call Func_06d4
	ld a, [wc955]
	cp c
	jr nz, .asm_10d21
	call Func_13e4c
	ld b, a
	ld a, [wcdb4]
	cp b
	jr z, .asm_10d1d
	ld a, b
	ld [wcdb4], a
	call Func_13a30
	ld [wc912], a
	ld a, $8
	ld [wc900], a
	ld a, $4
	call Func_050a
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

.asm_10d1d
	ld c, $f0
	jr .asm_10d23

.asm_10d21
	ld c, $f1
.asm_10d23
	ld b, $1
	ld d, $c
	call Func_0520
	ld a, $15
	ld [wSubroutine2], a
	ret

Func_10d30:
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wcad0], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld bc, $12
	check_cgb
	jr z, .asm_10d4e
	ld bc, $57
.asm_10d4e
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Func_13959
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld a, $1
	ld [wSubroutine2], a
	jp Func_1236b

Func_10d86:
	ld e, $58
	call Func_13951
	call Func_13dea
	call Func_13907
	sla a
	sla a
	sla a
	add $38
	ld [wOAMAnimation03_YCoord], a
	ld a, $10
	ld [wOAMAnimation03_XCoord], a
	ld a, $1
	ld [wOAMAnimation03], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $d
	ld [wd411], a
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0609
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	xor a
	ld [wcb67], a
	call Func_138e2
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_10dd3:
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0616
	ld a, $1
	ld [wc430], a
	ld a, $c
	ld [wcb2c], a
	jp Func_13816

Func_10dec:
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $1
	jr z, .asm_10e2e
	cp $0
	ret nz
	ld e, $2d
	call Func_13951
	check_cgb
	jr z, .asm_10e14
	ld bc, $54
	call DecompressGFXByIndex_
	ld bc, $57
	call DecompressGFXByIndex_
	jr .asm_10e20

.asm_10e14
	ld bc, $1a
	call DecompressGFXByIndex_
	ld bc, $12
	call DecompressGFXByIndex_
.asm_10e20
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $1
	ld [wSubroutine2], a
	ret

.asm_10e2e
	call Func_13fc6
	ld a, $1
	ld [wc430], a
	ret

Func_10e37:
	ld de, wOAMAnimation02
	call Func_0616
	ld a, $1
	ld [wc430], a
	jp Func_1396d

Func_10e45:
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wSubroutine2], a
	ret

Func_10e59:
	ret

Func_10e5a:
	ret

Func_10e5b: ; 10e5b (4:4e5b)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_10e68
	call GetHalfwordFromTable
	jp [hl]

Pointers_10e68:
	dw Func_10e78
	dw Func_10e7b
	dw Func_10e8e
	dw Func_10ed2
	dw Func_10edb
	dw Func_13f47
	dw Func_13f4e
	dw Func_10ede

Func_10e78:
	jp IncrementSubroutine2

Func_10e7b:
	ld bc, $13
	check_cgb
	jr z, .asm_10e88
	ld bc, $5a
.asm_10e88
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_10e8e:
	ld e, $30
	call Func_13931
	ld e, $35
	call Func_13939
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb65], a
	ld [wcb67], a
	ld [wcb68], a
	ld [wcb69], a
	ld [wcb6a], a
	ld [wcb6b], a
	ld [wcb6c], a
	ld [wcb6d], a
	ld a, $ff
	ld [wcb66], a
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	call Func_11fe9
	jp IncrementSubroutine2

Func_10ed2:
	ld de, wOAMAnimation02
	call Func_0616
	jp Func_1208b

Func_10edb:
	jp Func_11aaf

Func_10ede:
	call Func_11c1d
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10ee7: ; 10ee7 (4:4ee7)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_10ef4
	call GetHalfwordFromTable
	jp [hl]

Pointers_10ef4:
	dw Func_10f06
	dw Func_10f3a
	dw Func_10f4d
	dw Func_10f82
	dw Func_1100c
	dw Func_11021
	dw Func_11022
	dw Func_13f47
	dw Func_13f4e

Func_10f06:
	xor a
	ld [wcb6f], a
	call Func_12279
	ld a, [wcb37]
	cp $0
	jr z, .asm_10f1b
	xor a
	ld [wcb6f], a
	jp IncrementSubroutine2

.asm_10f1b
	ld c, $43
	ld hl, VTilesBG tile $40
	call Func_0630
	ld b, $43
	call Func_122d6
	ld e, $31
	call Func_13951
	xor a
	hlbgcoord 6, 16
	call Func_127e3
	ld a, $4
	ld [wSubroutine2], a
	ret

Func_10f3a:
	ld a, [wcb6f]
	call Func_122ba
	ld c, b
	ld hl, VTilesBG tile $40
	call Func_0630
	call Func_122d0
	jp IncrementSubroutine2

Func_10f4d:
	ld a, [wcb6f]
	call Func_122ba
	ld a, b
	call Func_11a59
	ld e, $31
	call Func_13951
	ld bc, $10d
	ld e, $2f
	ld a, $0
	call Func_04ca
	call Func_127da
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	jp IncrementSubroutine2

Func_10f82:
	call Func_1336e
	ld a, $1
	ld [wc430], a
	ld a, [wJoyNew]
	and $10
	jr z, .asm_10fad
	ld a, [wcb37]
	dec a
	ld b, a
	ld a, [wcb6f]
	cp b
	jr nz, .asm_10f9e
	ld a, $ff
.asm_10f9e
	inc a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_FFA1], a
	ret

.asm_10fad
	ld a, [wJoyNew]
	and $20
	jr z, .asm_10fcd
	ld a, [wcb6f]
	cp $0
	jr nz, .asm_10fbe
	ld a, [wcb37]
.asm_10fbe
	dec a
	ld [wcb6f], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_FFA1], a
	ret

.asm_10fcd
	ld a, [hJoyNew]
	and $2
	jr z, .asm_10fe6
	ld a, $4
	ld [H_FFA1], a
	ld e, $2d
	call Func_13951
	call Func_13fc6
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_10fe6
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, $3
	ld [wc900], a
	ld a, [wcb6f]
	call Func_122ba
	ld a, b
	ld [wc90d], a
	ld a, $4
	call Func_050a
	call Func_13fc6
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

Func_1100c:
	ld a, [hJoyNew]
	and $3
	ret z
	ld e, $2d
	call Func_13951
	ld a, $4
	ld [H_FFA1], a
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11021:
	ret

Func_11022:
	ret

Func_11023: ; 11023 (4:5023)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_11030
	call GetHalfwordFromTable
	jp [hl]

Pointers_11030:
	dw Func_1103c
	dw Func_11056
	dw Func_1105f
	dw Func_11071
	dw Func_13f47
	dw Func_13f4e

Func_1103c: ; 1103c (4:503c)
	ld e, $32
	call Func_13951
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	xor a
	ld [wcb67], a
	call Func_12352
	jp IncrementSubroutine2

Func_11056: ; 11056 (4:5056)
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	jp Func_122ea

Func_1105f: ; 1105f (4:505f)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld e, $34
	call Func_13931
	jp IncrementSubroutine2

Func_11071: ; 11071 (4:5071)
	ld a, [hJoyNew]
	and $3
	ret z
	ld e, $2d
	call Func_13951
	jp IncrementSubroutine2

Func_1107e: ; 1107e (4:507e)
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_1108b
	call GetHalfwordFromTable
	jp [hl]


Pointers_1108b:
	dw Func_1109b
	dw Func_110bb
	dw Func_110d6
	dw Func_110d9
	dw Func_110e8
	dw Func_110eb
	dw Func_13f47
	dw Func_13f4e

Func_1109b:
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $3
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	xor a
	ld [wcb3e], a
	call Func_12d63
	jp IncrementSubroutine2

Func_110bb:
	ld bc, $5
	check_cgb
	jr z, .asm_110c8
	ld bc, $59
.asm_110c8
	call DecompressGFXByIndex_
	ld e, $17
	call Func_13951
	call Func_12dc7
	jp IncrementSubroutine2

Func_110d6:
	jp IncrementSubroutine2

Func_110d9:
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0616
	jp Func_12e00

Func_110e8:
	jp IncrementSubroutine2

Func_110eb:
	jp IncrementSubroutine2

Func_110ee:
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_110fb
	call GetHalfwordFromTable
	jp [hl]

Pointers_110fb:
	dw Func_11119
	dw Func_11133
	dw Func_11159
	dw Func_11177
	dw Func_111dd
	dw Func_111f3
	dw Func_111f6
	dw Func_1120c
	dw Func_11241
	dw Func_11265
	dw Func_11276
	dw Func_112d7
	dw Func_112d8
	dw Func_13f47
	dw Func_13f4e

Func_11119: ; 11119 (4:5119)
	xor a
	ld [wcb67], a
	ld [wcb68], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	jp IncrementSubroutine2

Func_11133: ; 11133 (4:5133)
	call Func_12f14
	ld a, [wcb68]
	cp $0
	jr nz, .asm_1114b
	call Func_137a1
	ld e, $6
	call Func_13951
	call Func_12f31
	jp IncrementSubroutine2

.asm_1114b
	ld hl, VTilesBG tile $40
	ld b, $4
	call ClearTiles
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_11159: ; 11159 (4:5159)
	ld a, [hJoyNew]
	and $2
	jr z, .asm_11167
	ld a, $4
	ld [H_FFA1], a
	jp Func_11171

.asm_11167
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, $3
	ld [H_FFA1], a
Func_11171: ; 11171 (4:5171)
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_11177: ; 11177 (4:5177)
	ld bc, $1a
	check_cgb
	jr z, .asm_11184
	ld bc, $54
.asm_11184
	call DecompressGFXByIndex_
	ld e, $3c
	call Func_13951
	ld bc, $10b
	ld e, $22
	ld a, $0
	call Func_04ca
	ld a, [wcb67]
	call Func_12fd8
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
	ld a, [wcb68]
	cp $1
	jr nz, .asm_111da
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03_PriorityFlags], a
.asm_111da
	jp IncrementSubroutine2

Func_111dd: ; 111dd (4:51dd)
	ld a, [wcb68]
	cp $1
	jr z, .asm_111f0
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0616
	ld de, wOAMAnimation03
	call Func_0616
.asm_111f0
	jp Func_12f59

Func_111f3: ; 111f3 (4:51f3)
	jp Func_12b6c

Func_111f6: ; 111f6 (4:51f6)
	ld a, $1
	call Func_050f
	or a
	ret z
	call Func_13e6e
	xor a
	ld [wFontPaletteMode], a
	ld a, $1
	ld [wcb2b], a
	jp IncrementSubroutine2

Func_1120c: ; 1120c (4:520c)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	call Func_137df
	push af
	ld [wcb04], a
	call Func_137fa
	call Func_1371c
	pop af
	call Func_13f18
	ld e, $1c
	ld bc, $603
	ld a, $0
	call Func_04ca
	xor a
	ld [wBGPalUpdate], a
	ld a, $4
	call Func_050a
	ld a, $2
	ld [wcad0], a
	jp IncrementSubroutine2

Func_11241: ; 11241 (4:5241)
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	ld a, $a0
	ld [wc91f], a
	call Func_070c
	ld d, $c
	call Func_0520
	jp IncrementSubroutine2

Func_11265: ; 11265 (4:5265)
	call Func_0530
	ld a, [wc9c9]
	cp $9
	ret nz
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

Func_11276: ; 11276 (4:5276)
	ld a, $1
	call Func_050f
	or a
	ret z
	xor a
	ld [wcad0], a
	call ClearObjectAnimationBuffers
	call Func_13a0b
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld bc, $0
	ld e, $10
	call Func_13959
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	call NormalDMGPals
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	xor a
	ld [wcb2b], a
	ld hl, VTilesBG tile $40
	ld b, $38
	call Func_11a1c
	ld e, $2d
	call Func_13951
	ld a, $1
	ld [wSubroutine2], a
	call Func_13fdf
	ld a, [wcb04]
	jp Func_13fb5

Func_112d7: ; 112d7 (4:52d7)
	ret

Func_112d8: ; 112d8 (4:52d8)
	ld e, $2d
	call Func_13951
	call Func_13fc6
	jp IncrementSubroutine2

Func_112e3:
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_112f0
	call GetHalfwordFromTable
	jp [hl]

Pointers_112f0:
	dw Func_11304
	dw Func_1132a
	dw Func_1133b
	dw Func_11370
	dw Func_113d6
	dw Func_113ec
	dw Func_113f4
	dw Func_1140c
	dw Func_13f47
	dw Func_13f4e

Func_11304: ; 11304 (4:5304)
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	xor a
	ld [wcb67], a
	ld [wcb68], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	xor a
	ld [wc90b], a
	jp IncrementSubroutine2

Func_1132a: ; 1132a (4:532a)
	ld e, $6
	call Func_13951
	call Func_137a1
	call Func_12f3a
	call Func_12f31
	jp IncrementSubroutine2

Func_1133b: ; 1133b (4:533b)
	ld a, [hJoyNew]
	and $2
	jr z, .asm_11349
	ld a, $4
	ld [H_FFA1], a
	jp Func_1136a

.asm_11349
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, $3
	ld [H_FFA1], a
	ld a, [wcb68]
	cp $0
	jr z, Func_1136a
	ld e, $2d
	call Func_13951
	ld hl, VTilesBG tile $40
	ld b, $6
	call Func_13fd2
	jp IncrementSubroutine2

Func_1136a: ; 1136a (4:536a)
	ld a, $7
	ld [wSubroutine2], a
	ret

Func_11370: ; 11370 (4:5370)
	ld bc, $1a
	check_cgb
	jr z, .asm_1137d
	ld bc, $54
.asm_1137d
	call DecompressGFXByIndex_
	ld e, $3d
	call Func_13951
	ld bc, $10b
	ld e, $22
	ld a, $0
	call Func_04ca
	ld a, [wcb67]
	call Func_130bc
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0609
	ld a, $40
	ld [wOAMAnimation02_XCoord], a
	ld a, $8
	ld [wOAMAnimation03_XCoord], a
	ld a, $60
	ld [wOAMAnimation02_YCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld [wOAMAnimation03], a
	ld a, [wcb68]
	cp $1
	jr nz, .asm_113d3
	xor a
	ld [wOAMAnimation02], a
	ld [wOAMAnimation03], a
.asm_113d3
	jp IncrementSubroutine2

Func_113d6: ; 113d6 (4:53d6)
	ld a, [wcb68]
	cp $1
	jr z, .asm_113e9
	ld de, wOAMAnimation02
	call Func_0616
	ld de, wOAMAnimation03_PriorityFlags
	call Func_0616
.asm_113e9
	jp Func_13028

Func_113ec: ; 113ec (4:53ec)
	ld e, $57
	call Func_13951
	jp IncrementSubroutine2

Func_113f4: ; 113f4 (4:53f4)
	ld a, [hJoyNew]
	and $1
	ret z
	ld e, $2d
	call Func_13951
	ld hl, VTilesBG tile $40
	ld b, $6
	call Func_11a1c
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_1140c: ; 1140c (4:540c)
	ld e, $2d
	call Func_13951
	call Func_13fc6
	jp IncrementSubroutine2

Func_11417:
	call Func_116e7
	ld a, [wSubroutine2]
	ld hl, Pointers_11424
	call GetHalfwordFromTable
	jp [hl]

Pointers_11424:
	dw Func_1143e
	dw Func_1146e
	dw Func_11479
	dw Func_1147c
	dw Func_114ff
	dw Func_115a4
	dw Func_115ae
	dw Func_11644
	dw Func_115a4
	dw Func_11690
	dw Func_13f47
	dw Func_13f4e
	dw Func_1169d

Func_1143e: ; 1143e (4:543e)
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $0
	ld [wca65], a
	ld a, $78
	ld [wc91f], a
	call Func_13a4e
	ld bc, $48
	check_cgb
	jr z, .asm_11468
	ld bc, $5b
.asm_11468
	call DecompressGFXByIndex_
	jp IncrementSubroutine2

Func_1146e: ; 1146e (4:546e)
	call Func_13eb5
	ld a, $1
	ld [wBGPalUpdate], a
	jp IncrementSubroutine2

Func_11479: ; 11479 (4:5479)
	jp Func_13f8c

Func_1147c: ; 1147c (4:547c)
	call Func_13312
	ld a, $1
	ld [wc430], a
	ld a, [wJoyNew]
	and $10
	jr z, .asm_1149a
	ld a, [wcb72]
	ld b, a
	ld a, [wcd23]
	cp b
	jr nz, .asm_11497
	ld a, $ff
.asm_11497
	inc a
	jr .asm_114ad

.asm_1149a
	ld a, [wJoyNew]
	and $20
	jr z, .asm_114c3
	ld a, [wcd23]
	cp $0
	jr nz, .asm_114ac
	ld a, [wcb72]
	inc a
.asm_114ac
	dec a
.asm_114ad
	ld [wcd23], a
	ld a, $1
	ld [wSubroutine2], a
	ld a, $2
	ld [H_FFA1], a
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	ret

.asm_114c3
	ld a, [hJoyNew]
	and $2
	jr z, .asm_114dc
	ld e, $2d
	call Func_13951
	ld a, $4
	ld [H_FFA1], a
	call Func_13fc6
	ld a, $a
	ld [wSubroutine2], a
	ret

.asm_114dc
	ld a, [hJoyNew]
	and $1
	jr z, .asm_114fe
	ld a, [wcd23]
	call Func_13a3a
	jr nz, .asm_114f1
	ld a, [wcd23]
	call Func_13a42
	ret z
.asm_114f1
	ld a, $3
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

.asm_114fe
	ret

Func_114ff: ; 114ff (4:54ff)
	ld a, $1
	call Func_050f
	or a
	ret z
	call ClearObjectAnimationBuffers
	ld bc, $e
	call DecompressGFXByIndex_
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld bc, $16
	call GetCGB_BGLayout_
	ld bc, $3
	call GetCGB_OBLayout_
	ld bc, $0
	ld e, $1
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $1
	ld a, $1
	call Func_04da
	call Func_13e6e
	ld a, [wcd23]
	ld [wd497], a
	call Func_0597
	ld a, [wcd23]
	ld c, $1
	ld de, VTilesShared tile $00
	call Func_0516
	ld a, [wcd23]
	call Func_175f
	ld a, [wcd23]
	ld de, Data_1d4000
	ld bc, VTilesBG tile $30
	call Func_3adc
	ld a, [wcd23]
	ld de, VTilesBG tile $20
	call Func_3d95
	ld hl, VTilesShared tile $40
	ld b, $20
	call ClearTiles
	ld a, $1
	ld [wcb2b], a
	ld a, $4
	call Func_050a
	ld a, $c0
	ld [wc91f], a
	call Func_13f70
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_0609
	ld a, $b
	ld [wd411], a
	ld de, wOAMAnimation03
	call Func_0609
	call Func_13340
	ld a, $1
	ld [wc430], a
	jp IncrementSubroutine2

Func_115a4: ; 115a4 (4:55a4)
	ld a, $0
	call Func_050f
	or a
	ret z
	jp IncrementSubroutine2

Func_115ae: ; 115ae (4:55ae)
	call Func_13340
	ld a, [wc3c0]
	and $3
	jr nz, .asm_115be
	ld hl, VTilesBG tile $1b
	call Func_17ef
.asm_115be
	ld a, [hJoyNew]
	and $3
	jr z, .asm_115d1
	ld a, $4
	ld [H_FFA1], a
	ld a, $4
	call Func_050a
	jp IncrementSubroutine2

.asm_115d1
	ld a, [wJoyNew]
	and $10
	jr z, .asm_11610
	ld a, [wcd23]
	ld [wcb20], a
.asm_115de
	ld a, [wcb72]
	ld b, a
	ld a, [wcd23]
	cp b
	jr z, .asm_115fe
	inc a
	ld [wcd23], a
	ld a, [wcd23]
	call Func_13a3a
	jr nz, .asm_11605
	ld a, [wcd23]
	call Func_13a42
	jr nz, .asm_11605
	jr .asm_115de

.asm_115fe
	ld a, $ff
	ld [wcd23], a
	jr .asm_115de

.asm_11605
	ld a, $2
	ld [H_FFA1], a
	ld a, $c
	ld [wSubroutine2], a
	ret

.asm_11610
	ld a, [wJoyNew]
	and $20
	jr z, .asm_11643
	ld a, [wcd23]
	ld [wcb20], a
.asm_1161d
	ld a, [wcd23]
	cp $0
	jr z, .asm_1163a
	dec a
	ld [wcd23], a
	ld a, [wcd23]
	call Func_13a3a
	jr nz, .asm_11605
	ld a, [wcd23]
	call Func_13a42
	jr nz, .asm_11605
	jr .asm_1161d

.asm_1163a
	ld a, [wcb72]
	inc a
	ld [wcd23], a
	jr .asm_1161d

.asm_11643
	ret

Func_11644: ; 11644 (4:5644)
	ld a, $1
	call Func_050f
	or a
	ret z
	ld hl, VTilesBG tile $40
	ld b, $38
	call ClearTiles
	call Func_13a0b
	ld bc, $48
	check_cgb
	jr z, .asm_11663
	ld bc, $5b
.asm_11663
	call DecompressGFXByIndex_
	ld bc, $0
	ld e, $10
	call Func_13959
	ld bc, $0
	ld e, $11
	call Func_13963
	call Func_13a1e
	call Func_13e58
	xor a
	ld [wcb2b], a
	xor a
	ld [wBGPalUpdate], a
	call Func_13eb5
	call Func_13f8c
	ld a, $4
	call Func_050a
	ret

Func_11690: ; 11690 (4:5690)
	ld a, $0
	call Func_050f
	or a
	ret z
	ld a, $3
	ld [wSubroutine2], a
	ret

Func_1169d: ; 1169d (4:569d)
	ld a, [wcd23]
	ld [wd497], a
	call Func_0597
	ld a, [wcd23]
	ld c, $1
	ld de, VTilesShared tile $00
	call Func_0516
	ld a, [wcd23]
	call Func_175f
	ld a, [wcd23]
	ld de, Data_1d4000
	ld bc, VTilesBG tile $30
	call Func_3adc
	ld a, [wcd23]
	ld de, VTilesBG tile $20
	call Func_3d95
	ld hl, VTilesShared tile $40
	ld b, $20
	call ClearTiles
	ld a, $c0
	ld [wc91f], a
	call Func_13f70
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $6
	ld [wSubroutine2], a
	ret

Func_116e7: ; 116e7 (4:56e7)
	ld a, [wcb2b]
	cp $0
	ret nz
	call Func_11773
	ld a, [wCurHours]
	call Get2DigitBCD
	ld a, [wc44f]
	swap a
	and $f
	add $20
	ld [wOAMAnimation17_TemplateIdx], a
	ld a, [wc44f]
	and $f
	add $20
	ld [wOAMAnimation18_TemplateIdx], a
	ld a, [wCurMinutes]
	call Get2DigitBCD
	ld a, [wc44f]
	swap a
	and $f
	add $20
	ld [wOAMAnimation19_TemplateIdx], a
	ld a, [wc44f]
	and $f
	add $20
	ld [wOAMAnimation20_TemplateIdx], a
	ld de, wOAMAnimation17
	ld bc, $2020
	call Func_11789
	ld de, wOAMAnimation18
	ld bc, $2820
	call Func_11789
	ld de, wOAMAnimation19_PriorityFlags
	ld bc, $3820
	call Func_11789
	ld de, wOAMAnimation20_PriorityFlags
	ld bc, $4020
	call Func_11789
	ld de, wOAMAnimation21_PriorityFlags
	ld bc, Func_3020
	call Func_11789
	ld a, $1
	ld [wc430], a
	jp Func_12baa

Func_1175d: ; 1175d (4:575d)
	xor a
	ld [wOAMAnimation17_PriorityFlags], a
	ld [wOAMAnimation18], a
	ld [wOAMAnimation19], a
	ld [wOAMAnimation20], a
	ld [wOAMAnimation21], a
	ld a, $1
	ld [wc430], a
	ret

Func_11773: ; 11773 (4:5773)
	call GetRTC
	ld a, [wCurSeconds]
	and $1
	add $2a
	ld [wOAMAnimation21_TemplateIdx], a
	ret

Func_11781:
	ld hl, $0
	add hl, de
	inc hl
	jp Func_11790

Func_11789: ; 11789 (4:5789)
	ld hl, $0
	add hl, de
	ld a, $1
	ld [hli], a
Func_11790: ; 11790 (4:5790)
	ld a, $0
	ld [hli], a
	inc hl
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ret

Func_11799: ; 11799 (4:5799)
	ld a, [wcb3c]
	cp $0
	jr nz, .asm_117b4
	ld bc, $306
	call Func_11939
	ld a, [wcb38]
	cp $3
	jr nz, .asm_117af
	ld a, $ff
.asm_117af
	inc a
	ld [wcb38], a
	ret

.asm_117b4
	ld bc, $306
	call Func_11985
	ld a, [wcb3a]
	inc a
	and $3
	ld [wcb3a], a
	ret

Func_117c4: ; 117c4 (4:57c4)
	ld a, [wcb3c]
	cp $0
	jr nz, .asm_117df
	ld bc, $308
	call Func_11939
	ld a, [wcb38]
	cp $0
	jr nz, .asm_117da
	ld a, $4
.asm_117da
	dec a
	ld [wcb38], a
	ret

.asm_117df
	ld bc, $308
	call Func_11985
	ld a, [wcb3a]
	dec a
	and $3
	ld [wcb3a], a
	ret

SelectTime: ; 117ef (4:57ef)
	call Func_118dd
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_1181f
	ld a, $3
	ld [H_FFA1], a
	ld a, [wcb3e]
	cp $0
	jr z, .asm_11815
	ld bc, $104
	ld e, $5b
	call Func_13959
	ld de, wOAMAnimation02
	call Func_099c
	jp IncrementSubroutine

.asm_11815
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jp Func_11910

.asm_1181f
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, .asm_11837
	ld a, [wcb3e]
	cp $0
	ret z
	ld a, $4
	ld [H_FFA1], a
	xor a
	ld [wcb3e], a
	jp Func_11910

.asm_11837
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_1186a
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb3e]
	cp $1
	jr z, .asm_1185a
	ld a, [wCurHours]
	cp 23
	jr nz, .asm_11853
	ld a, $ff
.asm_11853
	inc a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1185a
	ld a, [wCurMinutes]
	cp 59
	jr nz, .asm_11863
	ld a, $ff
.asm_11863
	inc a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1186a
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_1189d
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb3e]
	cp $1
	jr z, .asm_1188d
	ld a, [wCurHours]
	cp $0
	jr nz, .asm_11886
	ld a, 24
.asm_11886
	dec a
	ld [wCurHours], a
	jp TimeSet_PrintHours

.asm_1188d
	ld a, [wCurMinutes]
	cp $0
	jr nz, .asm_11896
	ld a, 60
.asm_11896
	dec a
	ld [wCurMinutes], a
	jp TimeSet_PrintMinutes

.asm_1189d
	ret

Func_1189e: ; 1189e (4:589e)
	ld a, $1
	ld [wc430], a
	call TimeSet_PrintHours
	call TimeSet_PrintMinutes
	jp Func_118c4

TimeSet_PrintHours: ; 118ac (4:58ac)
	ld a, [wCurHours]
	call Get2DigitBCD
	hlbgcoord 2, 13
	jp Print2DigitBCD

TimeSet_PrintMinutes: ; 118b8 (4:58b8)
	ld a, [wCurMinutes]
	call Get2DigitBCD
	hlbgcoord 5, 13
	jp Print2DigitBCD

Func_118c4: ; 118c4 (4:58c4)
	ld b, $15
	ld a, [wcb3e]
	cp $0
	jr z, .asm_118cf
	ld b, $2d
.asm_118cf
	ld c, $68
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wc430], a
	ret

Func_118dd: ; 118dd (4:58dd)
	ld a, [wc3c0]
	and $f
	ret nz
	ld a, [wcb3d]
	xor $1
	ld [wcb3d], a
	cp $1
	jr z, .asm_118fc
	ld a, [wcb3e]
	cp $0
	jr nz, .asm_118f9
	jp TimeSet_PrintHours

.asm_118f9
	jp TimeSet_PrintMinutes

.asm_118fc
	lb bc, 2, 13
	ld a, [wcb3e]
	cp $0
	jr z, .asm_11909
	lb bc, 5, 13
.asm_11909
	ld e, $23
	ld a, $0
	jp Func_04ca

Func_11910: ; 11910 (4:5910)
	jp Func_1189e

Func_11913: ; 11913 (4:5913)
	ld a, [wJoyNew]
	and $c0
	jr nz, asm_11932
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
Func_11927: ; 11927 (4:5927)
	lb bc, 1, 9
	ld e, $13
	call Func_13959
	jp Func_11936

asm_11932
	xor a
	ld [wcb39], a
Func_11936: ; 11936 (4:5936)
	lb bc, 3, 7
Func_11939: ; 11939 (4:5939)
	ld a, [wcb38]
	add $36
	call Func_119ac
	ld a, [wcb38]
	inc a
	cp $4
	jr c, .asm_1194b
	sub $4
.asm_1194b
	add $36
	call Func_119ac
	ld a, [wcb38]
	inc a
	inc a
	cp $4
	jr c, .asm_1195b
	sub $4
.asm_1195b
	add $36
	jp Func_119ac

Func_11960:
	ld a, [hJoyNew]
	and $c0
	jr nz, .asm_1197e
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
	lb bc, 1, 9
	ld e, $13
	call Func_13959
	jp Func_11982

.asm_1197e
	xor a
	ld [wcb39], a
Func_11982: ; 11982 (4:5982)
	lb bc, 3, 7
Func_11985: ; 11985 (4:5985)
	ld a, [wcb3a]
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	cp $4
	jr c, .asm_11997
	sub $4
.asm_11997
	add $17
	call Func_119ac
	ld a, [wcb3a]
	inc a
	inc a
	cp $4
	jr c, .asm_119a7
	sub $4
.asm_119a7
	add $17
	jp Func_119ac

Func_119ac: ; 119ac (4:59ac)
	push bc
	ld e, a
	ld a, $0
	call Func_04ca
	pop bc
	ld a, c
	add $3
	ld c, a
	ret

Func_119b9: ; 119b9 (4:59b9)
	ld a, [wJoyNew]
	and $c0
	jr nz, asm_119d8
	ld a, [wcb39]
	cp $10
	ret z
	inc a
	ld [wcb39], a
	cp $10
	ret nz
Func_119cd: ; 119cd (4:59cd)
	lb bc, 1, 9
	ld e, $13
	call Func_13959
	jp Func_119dc

asm_119d8
	xor a
	ld [wcb39], a
Func_119dc: ; 119dc (4:59dc)
	lb bc, 3, 7
Func_119df: ; 119df (4:59df)
	ld a, [wcd22]
	add $24
	call Func_119ac
	ld a, [wcd22]
	inc a
	cp $9
	jr c, .asm_119f1
	sub $9
.asm_119f1
	add $24
	call Func_119ac
	ld a, [wcd22]
	inc a
	inc a
	cp $9
	jr c, .asm_11a01
	sub $9
.asm_11a01
	add $24
	jp Func_119ac

ClearTiles: ; 11a06 (4:5a06)
; clear b tiles in VRAM
	push bc
	ld c, $10
.asm_11a09
	xor a
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a09
	pop bc
	dec b
	jr nz, ClearTiles
	ret

Func_11a16:
	ld d, $ff
	ld e, $0
	jr asm_11a20

Func_11a1c: ; 11a1c (4:5a1c)
	ld d, $0
	ld e, $ff
asm_11a20
	push bc
	ld c, $8
.asm_11a23
	call WaitStat
	ld a, d
	ld [hli], a
	ld a, e
	call WaitStat
	ld [hli], a
	dec c
	jr nz, .asm_11a23
	pop bc
	dec b
	jr nz, asm_11a20
	ret

Func_11a35: ; 11a35 (4:5a35)
	ld [wd435], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wc91e], a
	xor a
	ld [wca65], a
	ld a, $78
	ld [wc91f], a
	ld hl, $4000
	call Func_0548
	ld d, $c
	jp Func_11a80

Func_11a59: ; 11a59 (4:5a59)
	ld [wd435], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call ClearTiles
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	xor a
	ld [wca65], a
	ld a, $78
	ld [wc91f], a
	ld hl, $6652
	call Func_0550
	ld d, $b
	jp Func_11a80

Func_11a80: ; 11a80 (4:5a80)
	push de
	ld hl, wc3a0
	ld b, $9
.asm_11a86
	ld a, $e0
	ld [hli], a
	dec b
	jr nz, .asm_11a86
	ld hl, wd440
	ld de, wOAMAnimationsEnd
	call Func_33e3
	pop de
	jp Func_1249a

Func_11a99:
	xor a
	ld [wd000], a
	ld [wd001], a
	ld bc, $1fe
	ld hl, wd002
.asm_11aa6
	ld a, $fe
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_11aa6
	ret

Func_11aaf: ; 11aaf (4:5aaf)
	call Func_11b37
	call Func_11d7e
	ld a, [hJoyNew]
	and $2
	jr z, .asm_11af9
	ld a, $4
	ld [H_FFA1], a
	ld bc, $106
	ld e, $30
	ld a, $0
	call Func_04ca
	ld bc, $106
	ld e, $35
	ld a, $0
	call Func_04da
	call Func_1bd1
	call Func_11ee9
	ld a, $3
	ld [wSubroutine2], a
	ld a, $ff
	ld [wcb6e], a
	ld a, $4
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	call Func_11fe9
	xor a
	ld [wcb28], a
	jp LoadPhoneKeypad

.asm_11af9
	ld a, [hJoyNew]
	and $1
	jr z, .asm_11b08
	call Func_126a1
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_11b08
	ld a, [hJoyNew]
	and $4
	jr z, .asm_11b20
	ld b, $0
	ld a, [wcb28]
	cp $0
	jr nz, .asm_11b19
	ld b, $3
.asm_11b19
	ld a, b
	ld [wcb28], a
	call LoadPhoneKeypad
.asm_11b20
	ret

Func_11b21:
	call Func_13f51
	jp IncrementSubroutine2

Func_11b27:
	call Func_13e37
	call Func_119cd
	ld a, $5
	ld [wSubroutine], a
	xor a
	ld [wSubroutine2], a
	ret

Func_11b37: ; 11b37 (4:5b37)
	ld a, [wJoyNew]
	and $10
	jr z, .asm_11b68
	ld a, $63
	ld [H_FFA1], a
	ld a, [wcb65]
	cp $3
	jr nz, .asm_11b4d
	xor a
	jr .asm_11b62

.asm_11b4d
	cp $6
	jr z, .asm_11b5f
	cp $9
	jr z, .asm_11b5f
	cp $c
	jr z, .asm_11b5f
	cp $f
	jr z, .asm_11b5f
	jr .asm_11b61

.asm_11b5f
	sub $3
.asm_11b61
	inc a
.asm_11b62
	ld [wcb65], a
	jp Func_11d40

.asm_11b68
	ld a, [wJoyNew]
	and $20
	jr z, .asm_11b9a
	ld a, $63
	ld [H_FFA1], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11b7f
	ld a, $3
	jr .asm_11b94

.asm_11b7f
	cp $4
	jr z, .asm_11b91
	cp $7
	jr z, .asm_11b91
	cp $a
	jr z, .asm_11b91
	cp $d
	jr z, .asm_11b91
	jr .asm_11b93

.asm_11b91
	adc $3
.asm_11b93
	dec a
.asm_11b94
	ld [wcb65], a
	jp Func_11d40

.asm_11b9a
	ld a, [wJoyNew]
	and $40
	jr z, .asm_11bdb
	ld a, $63
	ld [H_FFA1], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11bb1
	ld a, $d
	jr .asm_11bd5

.asm_11bb1
	cp $1
	jr nz, .asm_11bb9
	ld a, $e
	jr .asm_11bd5

.asm_11bb9
	cp $2
	jr nz, .asm_11bc1
	ld a, $e
	jr .asm_11bd5

.asm_11bc1
	cp $3
	jr nz, .asm_11bc9
	ld a, $f
	jr .asm_11bd5

.asm_11bc9
	cp $4
	jr nz, .asm_11bd1
	ld a, $0
	jr .asm_11bd5

.asm_11bd1
	sub $3
	and $f
.asm_11bd5
	ld [wcb65], a
	jp Func_11d40

.asm_11bdb
	ld a, [wJoyNew]
	and $80
	jr z, .asm_11c1c
	ld a, $63
	ld [H_FFA1], a
	ld a, [wcb65]
	cp $0
	jr nz, .asm_11bf2
	ld a, $4
	jr .asm_11c16

.asm_11bf2
	cp $1
	jr nz, .asm_11bfa
	ld a, $5
	jr .asm_11c16

.asm_11bfa
	cp $2
	jr nz, .asm_11c02
	ld a, $5
	jr .asm_11c16

.asm_11c02
	cp $3
	jr nz, .asm_11c0a
	ld a, $6
	jr .asm_11c16

.asm_11c0a
	cp $f
	jr nz, .asm_11c12
	ld a, $3
	jr .asm_11c16

.asm_11c12
	adc $2
	and $f
.asm_11c16
	ld [wcb65], a
	jp Func_11d40

.asm_11c1c
	ret

Func_11c1d:
	ld a, [wcb65]
	ld hl, Pointers_11c27
	call GetHalfwordFromTable
	jp [hl]

Pointers_11c27:
	dw Func_11c47
	dw Func_11c5c
	dw Func_11c9f
	dw Func_11ce9
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11cec
	dw Func_11d2a
	dw Func_11d35
	dw Func_11d10
	dw Func_11cf4
	dw Func_11cf9

Func_11c47: ; 11c47 (4:5c47)
	ld a, [wcfc0]
	cp $0
	jr nz, .asm_11c59
	ld a, $cf
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	ret

.asm_11c59
	jp Func_1bd1

Func_11c5c: ; 11c5c (4:5c5c)
	ld a, [wcb69]
	cp $0
	jr nz, .asm_11c6b
	ld a, [wcb67]
	cp $0
	jr nz, .asm_11c6b
	ret

.asm_11c6b
	ld a, [wcb67]
	dec a
	and $f
	ld [wcb67], a
	cp $f
	jr nz, .asm_11c7f
	ld a, [wcb69]
	cp $0
	jr nz, .asm_11c87
.asm_11c7f
	ld a, $ff
	ld [wcb66], a
	jp Func_11d7e

.asm_11c87
	dec a
	ld [wcb69], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp Func_072f

Func_11c9f: ; 11c9f (4:5c9f)
	ld a, [wcb69]
	cp $e
	jr nz, .asm_11cae
	ld a, [wcb67]
	cp $f
	jr nz, .asm_11cae
	ret

.asm_11cae
	ld a, [wcb67]
	inc a
	and $f
	ld [wcb67], a
	jr nz, .asm_11cde
	ld a, [wcb69]
	cp $e
	jr z, .asm_11cde
	inc a
	and $f
	ld [wcb69], a
	xor a
	ld [wcb67], a
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp Func_072f

.asm_11cde
	ld a, $ff
	ld [wcb66], a
	call Func_11d7e
	jp Func_072f

Func_11ce9: ; 11ce9 (4:5ce9)
	jp Func_11fbc

Func_11cec: ; 11cec (4:5cec)
	ld a, [wcb65]
	sub $4
	jp Func_11dcb

Func_11cf4: ; 11cf4 (4:5cf4)
	ld a, $7
	jp Func_11dcb

Func_11cf9: ; 11cf9 (4:5cf9)
	call Func_11ec6
	inc hl
	ld a, [hl]
	inc a
	push af
	and $7
	cp $5
	jr nz, .asm_11d0b
	pop af
	ld a, [hl]
	and $f0
	push af
.asm_11d0b
	pop af
	ld [hl], a
	jp Func_072f

Func_11d10: ; 11d10 (4:5d10)
	call Func_11ec6
	inc hl
	ld a, [hl]
	push af
	and $7
	cp $0
	jr nz, .asm_11d24
	pop af
	ld a, [hl]
	and $f0
	add $4
	jr .asm_11d26

.asm_11d24
	pop af
	dec a
.asm_11d26
	ld [hl], a
	jp Func_072f

Func_11d2a: ; 11d2a (4:5d2a)
	ld a, [wd001]
	xor $1
	ld [wd001], a
	jp Func_121fd

Func_11d35: ; 11d35 (4:5d35)
	call Func_11ed8
	ld a, $ff
	ld [wcb66], a
	jp Func_072f

Func_11d40: ; 11d40 (4:5d40)
	ld hl, Data_11d5e
	ld a, [wcb65]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $7
	ld [wOAMAnimation01_TemplateIdx], a
	ld de, wOAMAnimation01
	call Func_11789
	ld a, $1
	ld [wc430], a
	ret

Data_11d5e:
	db $68, $28
	db $78, $28
	db $88, $28
	db $98, $28
	db $68, $40
	db $80, $40
	db $98, $40
	db $68, $50
	db $80, $50
	db $98, $50
	db $68, $60
	db $80, $60
	db $98, $60
	db $68, $70
	db $80, $70
	db $98, $70

Func_11d7e: ; 11d7e (4:5d7e)
	ld hl, Data_11dab
	ld a, [wcb67]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld b, a
	ld a, [hl]
	ld c, a
	ld a, $a
	ld [wOAMAnimation02_TemplateIdx], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_11781
	ld a, [wc3c0]
	and $f
	jr nz, .asm_11da5
	ld a, [wOAMAnimation02]
	xor $1
	ld [wOAMAnimation02_PriorityFlags], a
.asm_11da5
	ld a, $1
	ld [wc430], a
	ret

Data_11dab:
	db $10, $38
	db $20, $38
	db $30, $38
	db $40, $38
	db $10, $48
	db $20, $48
	db $30, $48
	db $40, $48
	db $10, $58
	db $20, $58
	db $30, $58
	db $40, $58
	db $10, $68
	db $20, $68
	db $30, $68
	db $40, $68

Func_11dcb: ; 11dcb (4:5dcb)
	ld [wcb20], a
	call Func_11ec6
	ld a, [wcb66]
	ld b, a
	ld a, [wcb65]
	cp b
	jp z, Func_11e54
	ld a, [wcb68]
	cp $f0
	ret z
	ld a, [wcb66]
	cp $ff
	jr z, .asm_11e44
	ld a, [wcb67]
	inc a
	and $f
	ld [wcb67], a
	jr nz, .asm_11e1c
	ld a, [wcb69]
	inc a
	and $f
	ld [wcb69], a
	cp $f
	jr nz, .asm_11e0c
	ld a, $f
	ld [wcb67], a
	ld a, $e
	ld [wcb69], a
	ret

.asm_11e0c
	ld bc, $106
	ld e, $30
	ld a, $0
	call Func_04ca
	call Func_121bf
	call Func_121fd
.asm_11e1c
	call Func_11efa
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hl]
	push af
	call Func_11ec6
	pop af
	ld [hli], a
	ld a, $2
	ld [hl], a
	call Func_072f
	ld a, [wcb65]
	ld [wcb66], a
	call Func_11d7e
	jp Func_1221c

.asm_11e44
	push hl
	ld a, [hl]
	cp $fe
	jr z, .asm_11e4f
	call Func_11efa
	pop hl
	push hl
.asm_11e4f
	inc hl
	ld a, $2
	jr asm_11e60

Func_11e54: ; 11e54 (4:5e54)
	push hl
	inc hl
	ld a, [hl]
	add $10
	cp $60
	jr c, asm_11e60
	ld a, [hl]
	and $7
asm_11e60
	ld [hl], a
	swap a
	and $f
	push af
	ld a, [wcb20]
	ld hl, Data_11e86
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hl], a
	call Func_072f
	ld a, [wcb65]
	ld [wcb66], a
	jp Func_1221c

Data_11e86:
	db $96, $5e
	db $9c, $5e
	db $a2, $5e
	db $a8, $5e
	db $ae, $5e
	db $b4, $5e
	db $ba, $5e
	db $c0, $5e
	db $01, $11
	db $02, $12
	db $00, $10
	db $21, $31
	db $22, $32
	db $20, $30
	db $41, $42
	db $40, $41
	db $42, $40
	db $51, $61
	db $52, $62
	db $50, $60
	db $71, $81
	db $72, $82
	db $70, $80
	db $91, $a1
	db $92, $a2
	db $90, $a0
	db $b1, $b2
	db $b0, $b1
	db $b2, $b0
	db $c0, $c0
	db $c0, $c0
	db $c0, $c0

Func_11ec6: ; 11ec6 (4:5ec6)
	ld a, [wcb69]
	swap a
	and $f0
	ld b, a
	ld a, [wcb67]
	add b
	ld hl, wd002
	jp Rom4_PointToHalfwordInTable

Func_11ed8: ; 11ed8 (4:5ed8)
	call Func_11ec6
	ld a, [hl]
	cp $fe
	jr z, .asm_11ee6
	call Func_11f37
	jp Func_1221c

.asm_11ee6
	jp Func_11f37

Func_11ee9: ; 11ee9 (4:5ee9)
	ld a, $1
	ld [wc430], a
	ld de, wOAMAnimation01_PriorityFlags
	call Func_099c
	ld de, wOAMAnimation02_PriorityFlags
	jp Func_099c

Func_11efa: ; 11efa (4:5efa)
	call Func_11ec6
	ld a, l
	cp $e0
	jr nz, .asm_11f0c
	ld a, h
	cp $d1
	jr nz, .asm_11f0c
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.asm_11f0c
	push hl
	ld hl, wd000
	ld de, wd200
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	pop hl
	ld a, $fe
	ld [hli], a
	ld [hli], a
.asm_11f26
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp $e2
	jr nz, .asm_11f26
	ld a, h
	cp $d1
	jr nz, .asm_11f26
	ret

Func_11f37: ; 11f37 (4:5f37)
	call Func_11ec6
	ld a, l
	cp $e0
	jr nz, .asm_11f49
	ld a, h
	cp $d1
	jr nz, .asm_11f49
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

.asm_11f49
	push hl
	ld hl, wd000
	ld de, wd200
	ld bc, $200
	call CopyData
	pop hl
	push hl
	ld de, $200
	add hl, de
	push hl
	pop de
	inc de
	inc de
	pop hl
.asm_11f61
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, l
	cp $e0
	jr nz, .asm_11f61
	ld a, h
	cp $d1
	jr nz, .asm_11f61
	ld a, $fe
	ld [hli], a
	ld [hli], a
	ret

Func_11f76:
	ld b, BANK(s1_a000)
	call Rom4_GetSRAMBankB
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	ld a, [hl]
	cp $1
	jr z, .asm_11f98
	jp Func_11a99

.asm_11f98
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	ld de, wd000
	ld bc, $200
	call CopyData
	call Rom4_CloseSRAM
	jp Func_1224e

Func_11fbc: ; 11fbc (4:5fbc)
	ld a, $1
	ld [wd000], a
	ld b, BANK(s1_a000)
	call Rom4_GetSRAMBankB
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	sub $47
	and $7
	sla a
	ld d, a
	ld e, $0
	ld hl, s1_a000
	add hl, de
	push hl
	pop de
	ld hl, wd000
	ld bc, $200
	call CopyData
	jp Rom4_CloseSRAM

Func_11fe9: ; 11fe9 (4:5fe9)
	ld a, $1
	ld [wc430], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, [wcb6d]
	and $7
	sla a
	sla a
	sla a
	add $50
	ld [wOAMAnimation02_YCoord], a
	xor a
	ld [wOAMAnimation03], a
	ld [wOAMAnimation04_PriorityFlags], a
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld [wOAMAnimation03_XCoord], a
	ld [wOAMAnimation04_XCoord], a
	ld [wOAMAnimation03_YCoord], a
	ld [wOAMAnimation04_YCoord], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld [wOAMAnimation04_TemplateBank], a
	ld b, $6
	ld a, [wcb6c]
	debgcoord 2, 10
.asm_1202e
	push af
	ld c, a
	cp $47
	jr nc, .asm_12037
	xor a
	jr .asm_12039

.asm_12037
	ld a, $1
.asm_12039
	push bc
	push de
	call Func_1204e
	pop de
	pop bc
	ld a, e
	add $20
	ld e, a
	ld a, d
	adc $0
	ld d, a
	pop af
	inc a
	dec b
	jr nz, .asm_1202e
	ret

Func_1204e: ; 1204e (4:604e)
	push de
	push bc
	push de
	ld hl, Data_1207d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ld b, $5
.asm_1205d
	di
	ld a, [hli]
	call WaitStat
	ld [de], a
	ei
	inc de
	dec b
	jr nz, .asm_1205d
	pop bc
	ld a, c
	cp $47
	jr c, .asm_12070
	sub $47
.asm_12070
	inc a
	ld c, a
	call Get2DigitBCD
	pop de
	ld hl, $5
	add hl, de
	jp Func_121e0

Data_1207d:
	db $81, $60
	db $86, $60
	db $60, $61
	db $62, $63
	db $52, $64
	db $65, $66
	db $67, $52

Func_1208b: ; 1208b (4:608b)
	ld a, [wJoyNew]
	and $40
	jr z, .asm_120bd
	call Func_1bd1
	ld a, [wcb6d]
	cp $0
	jr nz, .asm_120b1
	ld a, [wcb6c]
	cp $0
	ret z
	ld a, [wcb6c]
	dec a
	ld [wcb6c], a
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_120b1
	dec a
	ld [wcb6d], a
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_120bd
	ld a, [wJoyNew]
	and $80
	jr z, .asm_120ef
	call Func_1bd1
	ld a, [wcb6d]
	cp $5
	jr nz, .asm_120e3
	ld a, [wcb6c]
	cp $49
	ret z
	ld a, [wcb6c]
	inc a
	ld [wcb6c], a
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_120e3
	inc a
	ld [wcb6d], a
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_120ef
	ld a, [hJoyNew]
	and $2
	jr z, .asm_1211a
	ld a, $4
	ld [H_FFA1], a
	ld e, $2d
	call Func_13951
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	call Func_1bd1
	call Func_11ee9
	ld a, $32
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $5
	ld [wSubroutine2], a
	ret

.asm_1211a
	ld a, [hJoyNew]
	and $1
	jr z, .asm_12184
	ld a, [wcb6c]
	ld b, a
	ld a, [wcb6d]
	add b
	ld [wcb20], a
	cp $47
	jr nc, .asm_12147
	ld a, [wcfc0]
	cp $0
	jr z, .asm_12139
	call Func_1bd1
.asm_12139
	ld a, [wcb20]
	add $81
	ld [H_FFA2], a
	ld a, $4
	ld [wMusicBank], a
	ret

.asm_12147
	ld e, $30
	call Func_13951
	xor a
	ld [wcb28], a
	call LoadPhoneKeypad
	xor a
	ld [wcb67], a
	ld [wcb69], a
	ld a, $4
	ld [wcb65], a
	ld a, $ff
	ld [wcb66], a
	ld a, $3
	ld [H_FFA1], a
	ld de, wOAMAnimation02_PriorityFlags
	call Func_099c
	call Func_11f76
	call Func_072f
	call Func_11d40
	call Func_1221c
	call Func_121bf
	call Func_121fd
	jp IncrementSubroutine2

.asm_12184
	ld a, [hJoyNew]
	and $10
	jr z, .asm_121a1
	ld a, [wcb6c]
	add $6
	cp $47
	jr nc, .asm_121a1
	ld [wcb6c], a
	call Func_1bd1
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_121a1
	ld a, [hJoyNew]
	and $20
	jr z, .asm_121be
	ld a, [wcb6c]
	sub $6
	bit 7, a
	jr nz, .asm_121be
	ld [wcb6c], a
	call Func_1bd1
	ld a, $2
	ld [H_FFA1], a
	jp Func_11fe9

.asm_121be
	ret

Func_121bf: ; 121bf (4:61bf)
	ld a, $74
	hlbgcoord 2, 14
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $75
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wcb69]
	inc a
Func_121db:
	push hl
	call Get2DigitBCD
	pop hl
Func_121e0: ; 121e0 (4:61e0)
	ld a, [wc44f]
	and $f0
	swap a
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wc44f]
	and $f
	add $76
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Func_121fd: ; 121fd (4:61fd)
	ld a, $53
	hlbgcoord 2, 15
	call WaitStatAndLoad
	ld a, $73
	call WaitStatAndLoad
	ld a, $54
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	inc hl
	ld a, [wd001]
	inc a
	jp Func_121db

Func_1221c: ; 1221c (4:621c)
	call Func_1224e
	ld a, $56
	hlbgcoord 2, 16
	call WaitStatAndLoad
	ld a, $72
	call WaitStatAndLoad
	ld a, $71
	call WaitStatAndLoad
	ld a, $55
	call WaitStatAndLoad
	ld a, [wcb68]
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $76
	di
	call WaitStat
	ld [hli], a
	ei
	jp Func_121e0

Func_1224e: ; 1224e (4:624e)
; Count 240 halfwords starting at wd002, skipping any that are equal to $fefe
	xor a
	ld [wcb68], a
	ld hl, wd002
	ld bc, $f0
.loop
	ld a, [hli]
	cp $fe
	jr nz, .count
	ld a, [hl]
	cp $fe
	jr z, .next
.count
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.next
	inc hl
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ret

Rom4_PointToHalfwordInTable: ; 12270 (4:6270)
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ret

Func_12279: ; 12279 (4:6279)
	xor a
	ld [wcb37], a
	ld [wcb21], a
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld hl, wcdbc
	ld b, $44
	ld de, s1_b000
.asm_1228d
	push bc
	ld a, [hli]
	ld [wcb20], a
	cp $0
	jr z, .asm_122ac
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb20]
	ld [de], a
	inc de
	ld a, [wcb21]
	ld [de], a
	inc de
	ld a, [wcb37]
	inc a
	ld [wcb37], a
.asm_122ac
	ld a, [wcb21]
	inc a
	ld [wcb21], a
	pop bc
	dec b
	jr nz, .asm_1228d
	jp Rom4_CloseSRAM

Func_122ba: ; 122ba (4:62ba)
	push af
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop af
	ld hl, s1_b000
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	push af
	ld a, [hli]
	ld b, a
	call Rom4_CloseSRAM
	pop af
	ret

Func_122d0: ; 122d0 (4:62d0)
	ld a, [wcb6f]
	call Func_122ba
Func_122d6: ; 122d6 (4:62d6)
	ld e, b
	ld d, $0
	ld hl, $1e0
	add hl, de
	push hl
	pop bc
	ld a, $7
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_122ea: ; 122ea (4:62ea)
	ld a, [hJoyNew]
	and $2
	jr nz, .asm_12326
	ld a, [wJoyNew]
	and $40
	jr z, .asm_12307
.asm_122f7
	ld a, [wcb67]
	xor $1
	ld [wcb67], a
	ld a, $2
	ld [H_FFA1], a
	jp Func_12352

.asm_12307
	ld a, [wJoyNew]
	and $80
	jr z, .asm_12310
	jr .asm_122f7

.asm_12310
	ld a, [hJoyNew]
	and $1
	jr z, .asm_12351
	xor a
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $3
	ld [H_FFA1], a
	ld a, [wcb67]
	cp $0
	jr z, .asm_1233c
.asm_12326
	ld a, $4
	ld [H_FFA1], a
	ld e, $2d
	call Func_13951
	ld de, wOAMAnimation02
	call Func_099c
	ld a, $4
	ld [wSubroutine2], a
	ret

.asm_1233c
	call SaveGame_
	ld bc, $106
	ld e, $33
	ld a, $0
	call Func_04ca
	ld a, $40
	ld [wcb2c], a
	jp IncrementSubroutine2

.asm_12351
	ret

Func_12352: ; 12352 (4:6352)
	ld c, $68
	ld a, [wcb67]
	cp $0
	jr z, .asm_1235d
	ld c, $78
.asm_1235d
	ld b, $c
	ld de, wOAMAnimation02
	call Func_11789
	ld a, $1
	ld [wc430], a
	ret

Func_1236b: ; 1236b (4:636b)
	xor a
	ld [wcb70], a
	ld [wcb71], a
	ld a, $a
	ld [MBC3SRamEnable], a
	ld hl, s2_a000
	ld bc, $fe
.asm_1237d
	ld a, BANK(s2_a000)
	ld [MBC3SRamBank], a
	push bc
	push hl
	ld a, [hli]
	ld [wcb20], a
	ld a, [hli]
	ld [wcb21], a
	cp $0
	jr z, .asm_123c3
	inc hl
	ld a, [hli]
	ld [wcb22], a
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	ld d, $0
	ld e, a
	sla e
	rl d
	sla e
	rl d
	ld hl, s1_b000
	add hl, de
	ld a, [wcb20]
	ld [hli], a
	ld a, [wcb21]
	ld [hli], a
	ld a, [wcb71]
	ld [hli], a
	ld a, [wcb22]
	ld [hli], a
	ld a, [wcb70]
	inc a
	ld [wcb70], a
.asm_123c3
	pop hl
	ld de, $10
	add hl, de
	ld a, [wcb71]
	inc a
	ld [wcb71], a
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_1237d
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld a, [wcb70]
	cp $1
	jr z, asm_12417
	ld a, [wcb70]
	ld c, a
asm_123e5
	push bc
	ld a, [wcb70]
	dec a
	ld b, a
	ld hl, s1_b000
	ld de, s1_b004
asm_123f1
	push bc
	ld a, [hl]
	ld b, a
	ld a, [de]
	cp b
	jr nc, .asm_12407
	call Func_1241d
	call Func_1241d
	call Func_1241d
	call Func_1241d
	jp Func_1240f

.asm_12407
	inc hl
	inc hl
	inc hl
	inc hl
	inc de
	inc de
	inc de
	inc de
Func_1240f: ; 1240f (4:640f)
	pop bc
	dec b
	jr nz, asm_123f1
	pop bc
	dec c
	jr nz, asm_123e5
asm_12417
	call Rom4_CloseSRAM
	jp Func_12426

Func_1241d: ; 1241d (4:641d)
	ld a, [hl]
	ld b, a
	ld a, [de]
	ld [hl], a
	ld a, b
	ld [de], a
	inc hl
	inc de
	ret

Func_12426: ; 12426 (4:6426)
	ld hl, wd000
	ld bc, $200
	call FillMemoryWithFF
	ld a, [wcb70]
	ld b, a
	ld hl, s1_b000
	ld a, $ff
	ld [wcb20], a
	xor a
	ld [wcb72], a
	push bc
	ld b, BANK(s1_b000)
	call Rom4_GetSRAMBankB
	pop bc
.asm_12446
	push bc
	push hl
	ld a, [wcb20]
	ld b, a
	ld a, [hl]
	cp b
	jr z, .asm_12467
	ld [wcb20], a
	push af
	ld hl, wd000
	ld a, [wcb72]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	ld a, [wcb72]
	inc a
	ld [wcb72], a
.asm_12467
	pop hl
	ld de, $4
	add hl, de
	pop bc
	dec b
	jr nz, .asm_12446
	jp Rom4_CloseSRAM

Func_12473: ; 12473 (4:6473)
	ld e, a
	ld d, $0
	ld hl, wd000
	add hl, de
	ld a, [hl]
	ret

Func_1247c:
	call Func_13e08
	ld bc, $10
	call ClearMemory3
	jp Rom4_CloseSRAM

Func_12488: ; 12488 (4:6488)
	ld hl, wc3a9
	ld de, wOAMAnimationsEnd
	ld b, $9
.asm_12490
	ld a, $e0
	ld [de], a
	inc de
	xor a
	ld [hli], a
	dec b
	jr nz, .asm_12490
	ret

Func_1249a: ; 1249a (4:649a)
	ld b, $0
	ld c, $30
	ld d, $c
	call Func_0528
	call Func_0530
	jp Func_0530

Func_124a9: ; 124a9 (4:64a9)
	call Func_11b37
	ld a, [hJoyNew]
	and $2
	jr z, .asm_124e5
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ld hl, VTilesBG tile $78
	ld b, $8
	call Func_13fd2
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call Func_12794
	call Func_1249a
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $4
	ld [H_FFA1], a
	ret

.asm_124e5
	ld a, [hJoyNew]
	and $8
	jr nz, asm_12539
	ld a, [hJoyNew]
	and $1
	jp z, Func_12581
	call Func_126a1
	ld a, [wcb65]
	cp $0
	jp z, Func_12519
	cp $1
	jp z, Func_12565
	cp $2
	jp z, Func_1256e
	cp $3
	jp z, asm_12539
	cp $d
	jp z, Func_12562
	cp $f
	jp z, Func_12562
	jp Func_126c0

Func_12519: ; 12519 (4:6519)
	xor a
	ld [wcb3e], a
	ld a, [wcb2a]
	inc a
	cp $3
	jr nz, .asm_12526
	xor a
.asm_12526
	ld [wcb2a], a
	add $1
	cp $3
	jr nz, .asm_12530
	xor a
.asm_12530
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

asm_12539
	ld a, $3
	ld [H_FFA1], a
	call Func_12794
	cp $0
	jr nz, .asm_1255f
	ld a, $c
	ld [wc3a9], a
	ld a, $70
	ld [wc3aa], a
	ld a, $7
	ld [wc3ab], a
	ld a, $3
	ld [wcb38], a
	call Func_12794
	jp Func_1249a

.asm_1255f
	jp IncrementSubroutine

Func_12562: ; 12562 (4:6562)
	jp Func_12673

Func_12565: ; 12565 (4:6565)
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	jr asm_12575

Func_1256e: ; 1256e (4:656e)
	ld a, [wcb38]
	cp $7
	ret z
	inc a
asm_12575
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
Func_12581: ; 12581 (4:6581)
	ret

Func_12582: ; 12582 (4:6582)
	call Func_11b37
	ld a, [hJoyNew]
	and $2
	jr z, .asm_125be
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ld hl, VTilesBG tile $78
	ld b, $6
	call Func_13fd2
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld [hl], $0
	call Func_127b7
	call Func_1249a
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $4
	ld [H_FFA1], a
	ret

.asm_125be
	ld a, [hJoyNew]
	and $8
	jr nz, asm_12612
	ld a, [hJoyNew]
	and $1
	jp z, Func_12659
	call Func_126a1
	ld a, [wcb65]
	cp $0
	jp z, Func_125f2
	cp $1
	jp z, Func_12632
	cp $2
	jp z, Func_12646
	cp $3
	jp z, asm_12612
	cp $d
	jp z, Func_1262f
	cp $f
	jp z, Func_1262f
	jp Func_1272a

Func_125f2: ; 125f2 (4:65f2)
	xor a
	ld [wcb3e], a
	ld a, [wcb2a]
	inc a
	cp $3
	jr nz, .asm_125ff
	xor a
.asm_125ff
	ld [wcb2a], a
	add $1
	cp $3
	jr nz, .asm_12609
	xor a
.asm_12609
	ld [wcb28], a
	call LoadPhoneKeypad
	jp Func_1265a

asm_12612
	ld a, $3
	ld [H_FFA1], a
	call Func_127b7
	cp $0
	jr nz, .asm_1262c
	ld a, [wd4a7]
	call Func_13d8c
	call Func_12794
	ld d, $c
	jp Func_1249a

.asm_1262c
	jp IncrementSubroutine

Func_1262f: ; 1262f (4:662f)
	jp Func_1268a

Func_12632: ; 12632 (4:6632)
	ld a, [wcb38]
	cp $0
	ret z
	dec a
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
	ret

Func_12646: ; 12646 (4:6646)
	ld a, [wcb38]
	cp $5
	ret z
	inc a
	ld [wcb38], a
	ld a, $ff
	ld [wcb66], a
	xor a
	ld [wcb3e], a
Func_12659: ; 12659 (4:6659)
	ret

Func_1265a: ; 1265a (4:665a)
	ld e, $15
	ld a, [wcb2a]
	cp $0
	jr z, .asm_1266b
	ld e, $16
	cp $1
	jr z, .asm_1266b
	ld e, $1b
.asm_1266b
	ld bc, $111
	ld a, $0
	jp Func_04ca

Func_12673: ; 12673 (4:6673)
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call Func_133ab
	pop hl
	ld [hl], a
	call Func_12794
	jp Func_1249a

Func_1268a: ; 1268a (4:668a)
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push hl
	call Func_133ab
	pop hl
	ld [hl], a
	call Func_127b7
	jp Func_1249a

Func_126a1: ; 126a1 (4:66a1)
	ld a, [wcb65]
	ld e, a
	ld d, $0
	ld hl, Data_126b0
	add hl, de
	ld a, [hl]
	ld [H_FFA1], a
	ret

Data_126b0:
	db $63, $63, $63, $63
	db $16, $17, $18, $19
	db $1a, $1b, $1c, $1d
	db $1e, $1f, $20, $21

Func_126c0: ; 126c0 (4:66c0)
	ld a, [wcb66]
	cp $ff
	jr z, .asm_126e9
	ld b, a
	ld a, [wcb65]
	cp b
	jr nz, .asm_126d7
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jr .asm_126e9

.asm_126d7
	xor a
	ld [wcb3e], a
	ld a, [wcb38]
	cp $7
	jr z, .asm_126e9
.asm_126e1
	ld a, [wcb38]
	inc a
	ld [wcb38], a
.asm_126e9
	ld a, [wcb65]
	ld [wcb66], a
	ld a, [wcb2a]
	ld hl, Pointers_1280d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb65]
	sub $4
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wcb3e]
	cp b
	jr nz, .asm_12712
	xor a
	ld [wcb3e], a
.asm_12712
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call Func_12794
	jp Func_1249a

Func_1272a: ; 1272a (4:672a)
	ld a, [wcb66]
	cp $ff
	jr z, .asm_12753
	ld b, a
	ld a, [wcb65]
	cp b
	jr nz, .asm_12741
	ld a, [wcb3e]
	inc a
	ld [wcb3e], a
	jr .asm_12753

.asm_12741
	xor a
	ld [wcb3e], a
	ld a, [wcb38]
	cp $5
	jr z, .asm_12753
	ld a, [wcb38]
	inc a
	ld [wcb38], a
.asm_12753
	ld a, [wcb65]
	ld [wcb66], a
	ld a, [wcb2a]
	ld hl, Pointers_1280d
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb65]
	sub $4
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	ld a, [wcb3e]
	cp b
	jr nz, .asm_1277c
	xor a
	ld [wcb3e], a
.asm_1277c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	push af
	ld hl, wc3a9
	ld a, [wcb38]
	ld e, a
	ld d, $0
	add hl, de
	pop af
	ld [hl], a
	call Func_127b7
	jp Func_1249a

Func_12794: ; 12794 (4:6794)
	ld hl, wc3a7
	ld de, wc3b0
	ld b, $8
	ld c, $0
.asm_1279e
	ld a, c
	cp $0
	jr nz, .asm_127af
	ld a, [de]
	cp $0
	jr nz, .asm_127ad
	ld a, $e0
	ld [hld], a
	jr .asm_127b1

.asm_127ad
	ld c, $1
.asm_127af
	ld a, [de]
	ld [hld], a
.asm_127b1
	dec de
	dec b
	jr nz, .asm_1279e
	ld a, c
	ret

Func_127b7: ; 127b7 (4:67b7)
	ld hl, wc3a5
	ld de, wc3ae
	ld b, $6
	ld c, $0
.asm_127c1
	ld a, c
	cp $0
	jr nz, .asm_127d2
	ld a, [de]
	cp $0
	jr nz, .asm_127d0
	ld a, $e0
	ld [hld], a
	jr .asm_127d4

.asm_127d0
	ld c, $1
.asm_127d2
	ld a, [de]
	ld [hld], a
.asm_127d4
	dec de
	dec b
	jr nz, .asm_127c1
	ld a, c
	ret

Func_127da: ; 127da (4:67da)
	ld a, [wcb6f]
	call Func_122ba
	hlbgcoord 6, 16
Func_127e3: ; 127e3 (4:67e3)
	push hl
	call Get2DigitBCD
	pop hl
	jp Func_1316d

Func_127eb:
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wc44f]
	and $f0
	swap a
	add $f0
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wc44f]
	and $f
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
	ret

Pointers_1280d:
	dw Pointers_12813
	dw Pointers_12872
	dw Pointers_128d1

Pointers_12813:
	dw Data_1282b
	dw Data_12836
	dw Data_1283c
	dw Data_12842
	dw Data_12849
	dw Data_1284f
	dw Data_12855
	dw Data_1285b
	dw Data_12862
	dw Data_12868
	dw Data_12869
	dw Data_12871

Data_1282b:
	db 10
	db $38, $39, $3a, $3b, $3c, $64, $65, $66, $67, $68

Data_12836:
	db 5
	db $3d, $3e, $3f, $40, $41

Data_1283c:
	db 5
	db $42, $43, $44, $45, $46

Data_12842:
	db 6
	db $47, $48, $49, $4a, $4b, $69

Data_12849:
	db 5
	db $4c, $4d, $4e, $4f, $50

Data_1284f:
	db 5
	db $51, $52, $53, $1d, $54

Data_12855:
	db 5
	db $55, $56, $57, $58, $59

Data_1285b:
	db 6
	db $5a, $5b, $5c, $6a, $6b, $6c

Data_12862:
	db 5
	db $5d, $28, $5e, $5f, $60

Data_12868:
	db $ff

Data_12869:
	db 7
	db $61, $62, $63, $cd, $c8, $b9, $b8

Data_12871:
	db $ff

Pointers_12872:
	dw Data_1288a
	dw Data_12895
	dw Data_1289b
	dw Data_128a1
	dw Data_128a8
	dw Data_128ae
	dw Data_128b4
	dw Data_128ba
	dw Data_128c1
	dw Data_128c7
	dw Data_128c8
	dw Data_128d0

Data_1288a:
	db 10
	db $01, $02, $03, $04, $05, $2f, $30, $31, $32, $33

Data_12895:
	db 5
	db $06, $07, $08, $09, $0a

Data_1289b:
	db 5
	db $0b, $0c, $0d, $0e, $0f

Data_128a1:
	db 6
	db $10, $11, $12, $13, $14, $34

Data_128a8:
	db 5
	db $15, $16, $17, $18, $19

Data_128ae:
	db 5
	db $1a, $1b, $1c, $1d, $1e

Data_128b4:
	db 5
	db $1f, $20, $21, $22, $23

Data_128ba:
	db 6
	db $24, $25, $26, $35, $36, $37

Data_128c1:
	db 5
	db $27, $28, $29, $2a, $2b

Data_128c7:
	db $ff

Data_128c8:
	db 7
	db $2c, $2d, $2e, $cd, $c8, $b9, $b8

Data_128d0:
	db $ff

Pointers_128d1:
	dw Data_128e9
	dw Data_128eb
	dw Data_128ed
	dw Data_128ef
	dw Data_128f1
	dw Data_128f3
	dw Data_128f5
	dw Data_128f7
	dw Data_128f9
	dw Data_128fb
	dw Data_128fc
	dw Data_128fe

Data_128e9:
	db 1
	db $bc

Data_128eb:
	db 1
	db $bd

Data_128ed:
	db 1
	db $be

Data_128ef:
	db 1
	db $bf

Data_128f1:
	db 1
	db $c0

Data_128f3:
	db 1
	db $c1

Data_128f5:
	db 1
	db $c2

Data_128f7:
	db 1
	db $c3

Data_128f9:
	db 1
	db $c4

Data_128fb:
	db $ff

Data_128fc:
	db 1
	db $bb

Data_128fe:
	db $ff

Func_128ff: ; 128ff (4:68ff)
	ld a, [wcb38]
	ld e, a
	ld d, $0
	ld hl, Data_12919
	add hl, de
	ld a, [hl]
	ld b, a
	ld c, $68
	ld de, wOAMAnimation02_PriorityFlags
	call Func_11789
	ld a, $1
	ld [wc430], a
	ret

Data_12919:
x = 8
REPT 8
	db x
x = x + 8
ENDR

Func_12921: ; 12921 (4:6921)
	ld a, [wcb38]
	sla a
	sla a
	sla a
	add $10
	ld b, a
	ld c, $70
	ld de, wOAMAnimation02_PriorityFlags
	call Func_11789
	ld a, $1
	ld [wc430], a
	ret

LoadPhoneKeypad: ; 1293b (4:693b)
	ld hl, Pointers_12970
	check_cgb
	jr z, .asm_12948
	ld hl, Pointers_1299a
.asm_12948
	ld a, [wCurPhoneGFX]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wcb28]
	call Rom4_PointToHalfwordInTable
	ld a, [hli]
.asm_12958
	ld h, [hl]
	ld l, a
	check_cgb
	jr z, .asm_12965
	ld a, BANK(GFX_1e4000)
	jr .asm_12967

.asm_12965
	ld a, BANK(GFX_1ec000)
.asm_12967
	ld de, VTilesShared tile $20
	ld bc, $40 tiles
	jp Copy2bpp

Pointers_12970:
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_12982
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_1298a
	dw Pointers_12992
	dw Pointers_12992
	dw Pointers_12992

Pointers_12982:
	dw GFX_1e4000
	dw GFX_1e4400
	dw GFX_1e4800
	dw GFX_1e4c00

Pointers_1298a:
	dw GFX_1e5000
	dw GFX_1e5400
	dw GFX_1e5800
	dw GFX_1e5c00

Pointers_12992:
	dw GFX_1e6000
	dw GFX_1e6400
	dw GFX_1e6800
	dw GFX_1e6c00

Pointers_1299a:
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129ac
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129b4
	dw Pointers_129bc
	dw Pointers_129bc
	dw Pointers_129bc

Pointers_129ac:
	dw GFX_1ec000
	dw GFX_1ec400
	dw GFX_1ec800
	dw GFX_1ecc00

Pointers_129b4:
	dw GFX_1ed000
	dw GFX_1ed400
	dw GFX_1ed800
	dw GFX_1edc00

Pointers_129bc:
	dw GFX_1ee000
	dw GFX_1ee400
	dw GFX_1ee800
	dw GFX_1eec00

Func_129c4: ; 129c4 (4:69c4)
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	sla e
	rl d
	push de
	ld hl, Pointers_12a18
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG
	ld bc, $40 tiles
	ld a, BANK(Phone1GFX)
	call Copy2bpp
	pop de
	push de
	ld hl, Pointers_12a2a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesShared
	ld bc, $20 tiles
	ld a, $7a
	call Copy2bpp
	pop de
	ld hl, Pointers_12a3c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, VTilesBG tile $21
	ld bc, $3 tiles
	ld a, BANK(GFX_dee5f)
	jp Copy2bpp
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	ld hl, $39 tiles
	add hl, de
	push hl
	pop bc
	xor a
	jp Func_10ee

Pointers_12a18:
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Pointers_12a2a:
	dw GFX_1e8000
	dw GFX_1e8200
	dw GFX_1e8400
	dw GFX_1e8600
	dw GFX_1e8800
	dw GFX_1e8a00
	dw GFX_1e8c00
	dw GFX_1e8e00
	dw GFX_1e9000

Pointers_12a3c:
	dw GFX_dee5f
	dw GFX_dee8f
	dw GFX_deebf
	dw GFX_deeef
	dw GFX_def1f
	dw GFX_def4f
	dw GFX_def7f
	dw GFX_defaf
	dw GFX_defdf

Func_12a4e: ; 12a4e (4:6a4e)
	xor a
	ld [wCurSeconds], a
	ld [wCurMinutes], a
	ld [wCurHours], a
	ld [wCurDays], a
	ld [wCurDays + 1], a
	ret

SetRTC: ; 12a5f (4:6a5f)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, RTC_S
	ld [MBC3SRamBank], a
	xor a
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_M
	ld [MBC3SRamBank], a
	ld a, [wCurMinutes]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_H
	ld [MBC3SRamBank], a
	ld a, [wCurHours]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DL
	ld [MBC3SRamBank], a
	ld a, [wCurDays]
	ld [MBC3RTC], a
	nop
	nop
	nop
	nop
	ld a, RTC_DH
	ld [MBC3SRamBank], a
	ld a, [wCurDays + 1]
	ld [MBC3RTC], a
	jp Rom4_CloseSRAM

GetRTC: ; 12ab9 (4:6ab9)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3LatchClock], a
	ld a, $1
	ld [MBC3LatchClock], a
	nop
	nop
	nop
	nop
	ld a, $8
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurSeconds], a
	ld a, $9
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurMinutes], a
	ld a, $a
	ld [MBC3SRamBank], a
	ld a, [MBC3RTC]
	ld [wCurHours], a
	jp Rom4_CloseSRAM

Func_12aef:
	ld hl, wca00
	ld de, wcb08
	ld b, $e
.loop
	ld a, [hli]
	cp $7a
	jr z, .next
	sub $60
	srl a
	ld [de], a
	inc de
.next
	dec b
	jr nz, .loop
	ld b, $c
	ld hl, wcb08
.loop2
	push bc
	ld a, [hl]
	push hl
	ld hl, Data_12b1c
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	pop hl
	ld [hli], a
	pop bc
	dec b
	jr nz, .loop2
	ret

Data_12b1c:
	db 10
	db  0
	db  1
	db  2
	db  3
	db  4
	db  5
	db  6
	db  7
	db  8
	db  0
	db  0
	db 11
	db  0
	db  9

Func_12b2b: ; 12b2b (4:6b2b)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wcb67]
	cp $c
	jr z, .asm_12b59
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wcb67]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_FFA1], a
	ld a, [wcb67]
	inc a
	ld [wcb67], a
	ret

.asm_12b59
	ld a, $4
	call Func_050a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $c
	ld [wSubroutine2], a
	ret

Func_12b6c: ; 12b6c (4:6b6c)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, [wcb6d]
	cp $c
	jr z, .asm_12b9a
	ld a, $8
	ld [wcb2c], a
	ld hl, wcb08
	ld a, [wcb6d]
	ld e, a
	ld d, $0
	add hl, de
	ld a, [hl]
	add $16
	ld [H_FFA1], a
	ld a, [wcb6d]
	inc a
	ld [wcb6d], a
	ret

.asm_12b9a
	ld a, $4
	call Func_050a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	jp IncrementSubroutine2

Func_12baa: ; 12baa (4:6baa)
	ld a, [wc907]
	dec a
	add $2f
	ld [wOAMAnimation16_TemplateIdx], a
	ld de, wOAMAnimation16_PriorityFlags
	ld bc, $1028
	jp Func_11789

Func_12bbc: ; 12bbc (4:6bbc)
	ld a, [hJoyNew]
	and $2
	jp nz, Func_12cb7
	ld a, [hJoyNew]
	and $40
	jr z, .asm_12be6
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb42]
	dec a
	cp $ff
	jr nz, .asm_12be0
	ld a, $2
.asm_12be0
	ld [wcb42], a
	jp Func_12cd3

.asm_12be6
	ld a, [hJoyNew]
	and $80
	jr z, .asm_12c08
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb42]
	inc a
	cp $3
	jr nz, .asm_12c02
	xor a
.asm_12c02
	ld [wcb42], a
	jp Func_12cd3

.asm_12c08
	ld a, [wcb42]
	cp $1
	jr z, .asm_12c5f
	cp $2
	jp z, Func_12cb1
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12c30
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb41]
	dec a
	cp $ff
	jr nz, .asm_12c2a
	ld a, $27
.asm_12c2a
	ld [wcb41], a
	jp Func_12cd3

.asm_12c30
	ld a, [wJoyNew]
	and $10
	jr z, .asm_12c4b
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb41]
	inc a
	cp $28
	jr c, .asm_12c45
	xor a
.asm_12c45
	ld [wcb41], a
	jp Func_12cd3

.asm_12c4b
	ld a, [hJoyNew]
	and $1
	jr z, .asm_12c5e
	ld a, [wcb41]
	call Func_12d32
	call GetMusicBank
	ld [H_MusicID], a
	ret

.asm_12c5e
	ret

.asm_12c5f
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12c7b
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb40]
	cp $0
	jr nz, .asm_12c74
	ld a, $74
.asm_12c74
	dec a
	ld [wcb40], a
	jp Func_12cd3

.asm_12c7b
	ld a, [wJoyNew]
	and $10
	jr z, .asm_12c97
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb40]
	cp $73
	jr c, .asm_12c90
	ld a, $ff
.asm_12c90
	inc a
	ld [wcb40], a
	jp Func_12cd3

.asm_12c97
	ld a, [hJoyNew]
	and $1
	jr z, .asm_12ca5
	ld a, [wcb40]
	inc a
	ld [H_FFA1], a
	ret

.asm_12ca5
	ld a, [hJoyNew]
	and $2
	jr z, .asm_12cb0
	ld a, $1
	ld [H_FFA1], a
.asm_12cb0
	ret

Func_12cb1: ; 12cb1 (4:6cb1)
	ld a, [hJoyNew]
	and $1
	jr z, asm_12cd2
Func_12cb7: ; 12cb7 (4:6cb7)
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	call ClearObjectAnimationBuffers
	ld a, $4
	ld [H_FFA1], a
	ld bc, $0
	ld e, $10
	call Func_13959
	jp IncrementSubroutine

asm_12cd2
	ret

Func_12cd3: ; 12cd3 (4:6cd3)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wcb42]
	cp $0
	jr z, .asm_12cf2
	cp $1
	jr z, .asm_12cec
	ld b, $78
	ld c, $80
	ld d, $0
	jr .asm_12cf2

.asm_12cec
	ld b, $60
	ld c, $68
	ld d, $1
.asm_12cf2
	ld a, $10
	ld [wOAMAnimation02_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld a, $30
	ld [wOAMAnimation03_XCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wc430], a
	ld a, [wcb41]
	hlbgcoord 5, 10
	call Func_127e3
	ld a, [wcb40]
	hlbgcoord 4, 13
	jp Func_1315b

Func_12d32: ; 12d32 (4:6d32)
	ld e, a
	ld hl, Data_12d3b
	ld d, $0
	add hl, de
	ld a, [hl]
	ret

Data_12d3b:
	db      $03, $04, $05, $06, $07, $08, $09, $0a, $0b
	db $12, $13, $14, $15, $16, $17, $18, $19, $1a, $1b
	db $22, $23, $24, $25, $26, $27, $28, $29, $2a, $2b, $2c, $2d, $2e
	db $32, $33, $34, $35, $36, $37, $38, $39

Func_12d63: ; 12d63 (4:6d63)
	ld b, $48
	ld c, $50
	ld d, $1
	ld a, [wcb3e]
	cp $0
	jr z, .asm_12d9a
	cp $1
	jr z, .asm_12d94
	cp $2
	jr z, .asm_12d8c
	cp $3
	jr z, .asm_12d84
	ld b, $88
	ld c, $90
	ld d, $0
	jr .asm_12d9a

.asm_12d84
	ld b, $78
	ld c, $80
	ld d, $1
	jr .asm_12d9a

.asm_12d8c
	ld b, $68
	ld c, $70
	ld d, $1
	jr .asm_12d9a

.asm_12d94
	ld b, $58
	ld c, $60
	ld d, $1
.asm_12d9a
	ld a, $8
	ld [wOAMAnimation02_XCoord], a
	ld a, $28
	ld [wOAMAnimation03_XCoord], a
	ld a, b
	add $2
	ld [wOAMAnimation02_YCoord], a
	ld a, c
	add $2
	ld [wOAMAnimation03_YCoord], a
	ld a, $1
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, d
	ld [wOAMAnimation03_PriorityFlags], a
	ld a, $0
	ld [wOAMAnimation02_TemplateBank], a
	ld [wOAMAnimation03_TemplateBank], a
	ld a, $1
	ld [wc430], a
	ret

Func_12dc7: ; 12dc7 (4:6dc7)
	ld e, $19
	ld a, [wc90a]
	cp $0
	jr z, .asm_12dd2
	ld e, $18
.asm_12dd2
	ld bc, $40a
	ld a, $0
	call Func_04ca
	ld e, $19
	ld a, [wc93e]
	cp $0
	jr z, .asm_12de5
	ld e, $18
.asm_12de5
	ld bc, $40c
	ld a, $0
	call Func_04ca
	ld e, $19
	ld a, [wcd27]
	cp $0
	jr z, .asm_12df8
	ld e, $18
.asm_12df8
	ld bc, $410
	ld a, $0
	jp Func_04ca

Func_12e00: ; 12e00 (4:6e00)
	ld a, [hJoyNew]
	and $2
	jp nz, Func_12eee
	ld a, [wJoyNew]
	and $40
	jr z, .asm_12e23
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb3e]
	cp $0
	jr nz, .asm_12e1c
	ld a, $5
.asm_12e1c
	dec a
	ld [wcb3e], a
	jp Func_12d63

.asm_12e23
	ld a, [wJoyNew]
	and $80
	jr z, .asm_12e3f
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb3e]
	cp $4
	jr nz, .asm_12e38
	ld a, $ff
.asm_12e38
	inc a
	ld [wcb3e], a
	jp Func_12d63

.asm_12e3f
	ld a, [wcb3e]
	cp $1
	jr z, .asm_12e73
	cp $2
	jr z, .asm_12e92
	cp $3
	jp z, Func_12ec3
	cp $4
	jp z, Func_12ee2
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12e5d
	jr .asm_12e63

.asm_12e5d
	ld a, [wJoyNew]
	and $10
	ret z
.asm_12e63
	ld a, $2
	ld [H_FFA1], a
	ld a, [wc90a]
	xor $1
	ld [wc90a], a
	jp Func_12dc7

.asm_12e73
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12e7c
	jr .asm_12e82

.asm_12e7c
	ld a, [wJoyNew]
	and $10
	ret z
.asm_12e82
	ld a, $2
	ld [H_FFA1], a
	ld a, [wc93e]
	xor $1
	ld [wc93e], a
	jp Func_12dc7

.asm_12e92
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12eab
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcdb3]
	inc a
	and $3
	ld [wcdb3], a
	call Func_12efe
	ret

.asm_12eab
	ld a, [wJoyNew]
	and $10
	ret z
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcdb3]
	dec a
	and $3
	ld [wcdb3], a
	call Func_12efe
	ret

Func_12ec3: ; 12ec3 (4:6ec3)
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12ecc
	jr .asm_12ed2

.asm_12ecc
	ld a, [wJoyNew]
	and $10
	ret z
.asm_12ed2
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcd27]
	xor $1
	ld [wcd27], a
	jp Func_12dc7

Func_12ee2: ; 12ee2 (4:6ee2)
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, $3
	ld [H_FFA1], a
	jr asm_12ef3

Func_12eee: ; 12eee (4:6eee)
	ld a, $4
	ld [H_FFA1], a
asm_12ef3
	call Func_13fc6
	ld e, $2d
	call Func_13951
	jp IncrementSubroutine2

Func_12efe: ; 12efe (4:6efe)
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wcdb3]
	ld e, a
	ld d, $0
	ld hl, $320
	add hl, de
	push hl
	pop bc
	ld a, $5
	jp Func_10ee

Func_12f14: ; 12f14 (4:6f14)
	xor a
	ld [wcb68], a
	ld hl, wcd70
	ld de, $4
	ld b, $8
.asm_12f20
	ld a, [hl]
	cp $0
	jr z, .asm_12f2c
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.asm_12f2c
	add hl, de
	dec b
	jr nz, .asm_12f20
	ret

Func_12f31: ; 12f31 (4:6f31)
	ld a, [wcb68]
	hlbgcoord 2, 10
	jp Func_127eb

Func_12f3a: ; 12f3a (4:6f3a)
	xor a
	ld [wcb68], a
	ld hl, wcd90
	ld de, $4
	ld b, $8
.asm_12f46
	push hl
	ld a, [hli]
	cp $0
	jr z, .asm_12f53
	ld a, [wcb68]
	inc a
	ld [wcb68], a
.asm_12f53
	pop hl
	add hl, de
	dec b
	jr nz, .asm_12f46
	ret

Func_12f59: ; 12f59 (4:6f59)
	ld a, [hJoyNew]
	and $1
	jr z, .asm_12f7e
	ld a, $3
	ld [H_FFA1], a
	call Func_137d9
	xor a
	ld [wcb6d], a
	ld a, $8
	ld [wcb2c], a
	ld a, $1
	call GetMusicBank
	ld [H_MusicID], a
	call Func_13fc6
	jp IncrementSubroutine2

.asm_12f7e
	ld a, [hJoyNew]
	and $2
	jr z, .asm_12f8f
	ld a, $4
	ld [H_FFA1], a
	ld a, $c
	ld [wSubroutine2], a
	ret

.asm_12f8f
	ld a, [wcb68]
	cp $1
	ret z
	ld a, [wJoyNew]
	and $10
	jr z, .asm_12fb5
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp b
	jr nz, .asm_12fae
	ld a, $ff
.asm_12fae
	inc a
	ld [wcb67], a
	jp Func_12fd8

.asm_12fb5
	ld a, [wJoyNew]
	and $20
	jr z, .asm_12fd7
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_12fd0
	ld a, [wcb68]
.asm_12fd0
	dec a
	ld [wcb67], a
	jp Func_12fd8

.asm_12fd7
	ret

Func_12fd8: ; 12fd8 (4:6fd8)
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd70
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call Func_13ef6
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wcb67]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wcb68]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_13028: ; 13028 (4:7028)
	ld a, [hJoyNew]
	and $1
	jr z, .asm_1305e
	ld a, $3
	ld [H_FFA1], a
	ld e, $2d
	call Func_13951
	call Func_13fc6
	ld hl, VTilesBG tile $40
	ld b, $20
	call Func_13fd2
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld a, $85
	ld [wca65], a
	call Func_13fdf
	ld a, $40
	ld [wc91f], a
	call Func_137af
	jp IncrementSubroutine2

.asm_1305e
	ld a, [hJoyNew]
	and $2
	jr z, .asm_13073
	ld a, $4
	ld [H_FFA1], a
	xor a
	ld [wFontPaletteMode], a
	ld a, $7
	ld [wSubroutine2], a
	ret

.asm_13073
	ld a, [wcb68]
	cp $1
	ret z
	ld a, [wJoyNew]
	and $10
	jr z, .asm_13099
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp b
	jr nz, .asm_13092
	ld a, $ff
.asm_13092
	inc a
	ld [wcb67], a
	jp Func_130bc

.asm_13099
	ld a, [wJoyNew]
	and $20
	jr z, .asm_130bb
	ld a, $2
	ld [H_FFA1], a
	ld a, [wcb68]
	dec a
	ld b, a
	ld a, [wcb67]
	cp $0
	jr nz, .asm_130b4
	ld a, [wcb68]
.asm_130b4
	dec a
	ld [wcb67], a
	jp Func_130bc

.asm_130bb
	ret

Func_130bc: ; 130bc (4:70bc)
	ld b, a
	ld a, [wcb68]
	dec a
	sub b
	ld e, a
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, wcd90
	add hl, de
	ld a, [hli]
	dec a
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld e, a
	push de
	call Func_13ef6
	pop de
	push de
	ld a, d
	call Get2DigitBCD
	hlbgcoord 2, 11
	call Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	hlbgcoord 5, 11
	call Print2DigitBCD
	ld a, [wcb67]
	inc a
	call Get2DigitBCD
	hlbgcoord 2, 15
	call Print2DigitBCD
	ld a, [wcb68]
	call Get2DigitBCD
	hlbgcoord 5, 15
	jp Print2DigitBCD

Func_1310c:
	ld a, [wcd24]
	inc a
	hlbgcoord 2, 16
	call Func_1315b
	ld a, $ee
	call WaitStatAndLoad
	ld a, [wcb70]
	hlbgcoord 6, 16
	jp Func_1315b

Func_13124: ; 13124 (4:7124)
	ld a, [wcd24]
	call Func_13d38
	hlbgcoord 4, 14
	call Func_1315b
	ld a, [wcb70]
	hlbgcoord 4, 17
	jp Func_1315b

Func_13139:
	ld a, [wcd23]
	inc a
	hlbgcoord 2, 14
	call Func_1315b
	ld a, $ee
	call WaitStatAndLoad
	ld a, [wcb72]
	inc a
	hlbgcoord 6, 14
	call Func_1315b
	ld a, [wcb76]
	hlbgcoord 3, 17
	jp Func_1315b

Func_1315b: ; 1315b (4:715b)
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wFontSourceBank]
	and $f
	add $e0
	di
	call WaitStat
	ld [hli], a
	ei
Func_1316d: ; 1316d (4:716d)
	ld a, [wc44f]
	and $f0
	swap a
	add $e0
	di
	call WaitStat
	ld [hli], a
	ei
	ld a, [wc44f]
	and $f
	add $e0
	di
	call WaitStat
	ld [hli], a
	ei
	ret

Func_1318a:
	call Func_13e4c
	ld d, a
	call Rom4_CloseSRAM
	ld a, [wcdb4]
	cp d
	jr z, .asm_1319d
	ld c, d
	call Func_06a4
	xor a
	ret

.asm_1319d
	ld a, $1
	ret

Func_131a0:
	dr $131a0, $1329a

Func_1329a:
	dr $1329a, $132d9

Func_132d9:
	dr $132d9, $13312

Func_13312:
	dr $13312, $13340

Func_13340:
	dr $13340, $1336e

Func_1336e:
	dr $1336e, $133ab

Func_133ab:
	dr $133ab, $13474

Func_13474:
	dr $13474, $134aa

Func_134aa:
	dr $134aa, $135ef

Func_135ef:
	dr $135ef, $1360a

Func_1360a:
	dr $1360a, $136d2

Func_136d2:
	dr $136d2, $1371c

Func_1371c:
	dr $1371c, $137a1

Func_137a1:
	dr $137a1, $137af

Func_137af:
	dr $137af, $137d9

Func_137d9:
	dr $137d9, $137df

Func_137df:
	dr $137df, $137fa

Func_137fa:
	dr $137fa, $13816

Func_13816:
	dr $13816, $138e2

Func_138e2:
	dr $138e2, $13907

Func_13907:
	dr $13907, $13931

Func_13931:
	dr $13931, $13939

Func_13939:
	dr $13939, $13951

Func_13951:
	dr $13951, $13959

Func_13959:
	dr $13959, $13963

Func_13963:
	dr $13963, $1396d

Func_1396d:
	dr $1396d, $139f9

Print2DigitBCD:
	dr $139f9, $13a0b

Func_13a0b:
	dr $13a0b, $13a1e

Func_13a1e:
	dr $13a1e, $13a30

Func_13a30:
	dr $13a30, $13a3a

Func_13a3a:
	dr $13a3a, $13a42

Func_13a42:
	dr $13a42, $13a4e

Func_13a4e:
	dr $13a4e, $13b3a

Func_13b3a:
	dr $13b3a, $13b79

Func_13b79:
	dr $13b79, $13c53

Func_13c53:
	dr $13c53, $13c7e

Func_13c7e:
	dr $13c7e, $13c8f

Func_13c8f:
	dr $13c8f, $13cf4

Func_13cf4:
	dr $13cf4, $13d38

Func_13d38:
	dr $13d38, $13d46

Func_13d46:
	dr $13d46, $13d8c

Func_13d8c:
	dr $13d8c, $13dca

Func_13dca:
	dr $13dca, $13dea

Func_13dea:
	dr $13dea, $13e08

Func_13e08:
	dr $13e08, $13e27

Func_13e27:
	dr $13e27, $13e37

Func_13e37:
	dr $13e37, $13e4c

Func_13e4c:
	dr $13e4c, $13e58

Func_13e58:
	dr $13e58, $13e6e

Func_13e6e:
	dr $13e6e, $13eb5

Func_13eb5:
	dr $13eb5, $13ee7

Rom4_GetSRAMBankB:
	dr $13ee7, $13ef1

Rom4_CloseSRAM:
	dr $13ef1, $13ef6

Func_13ef6:
	dr $13ef6, $13f15

Func_13f15:
	dr $13f15, $13f18

Func_13f18:
	dr $13f18, $13f38

Func_13f38:
	dr $13f38, $13f3d

Func_13f3d:
	dr $13f3d, $13f3f

Func_13f3f:
	dr $13f3f, $13f47

Func_13f47:
	dr $13f47, $13f4e

Func_13f4e:
	dr $13f4e, $13f51

Func_13f51:
	dr $13f51, $13f70

Func_13f70:
	dr $13f70, $13f8c

Func_13f8c:
	dr $13f8c, $13fb5

Func_13fb5:
	dr $13fb5, $13fc6

Func_13fc6:
	dr $13fc6, $13fd2

Func_13fd2:
	dr $13fd2, $13fdf

Func_13fdf:
	dr $13fdf, $13ff0

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

LoadCharacter: ; 2ce29 (b:4e29)
	push hl
	ld b, $0
	add a
	jr nc, .seven_bits
	inc b
.seven_bits
	sla a
	rl b
	sla a
	rl b
	ld c, a
	ld hl, FontGFX
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	ld a, [wFontPaletteMode]
	cp $0
	jr z, .white_bg
	cp $1
	jr z, .hue1_bg
	cp $2
	jr z, .inverted
	cp $3
	jr z, .hue2_bg
.white_bg
	ld b, $8
.white_bg_loop
	di
.white_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .white_bg_waitstat
	ld a, [de]
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .white_bg_loop
	ret

.hue1_bg
	ld b, $8
.hue1_bg_loop
	di
.hue1_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .hue1_bg_waitstat
	ld a, [de]
	ld [hli], a
	ld a, $ff
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .hue1_bg_loop
	ret

.inverted
	ld b, $8
.inverted_loop
	di
.inverted_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .inverted_waitstat
	ld a, [de]
	cpl
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .inverted_loop
	ret

.hue2_bg
	ld b, $8
.hue2_bg_loop
	di
.hue2_bg_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, .hue2_bg_waitstat
	ld a, $ff
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .hue2_bg_loop
	ret

Func_2cea0:
	dr $2cea0, $2d229

FontGFX: INCBIN "gfx/font/font_2d229.t13.1bpp"

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
	dr $2e8fa, $2f9ba

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

Func_a85ae: ; a85ae (2a:45ae)
	push hl
	push de
	ld c, $8
	ld a, $0
.byte_fill
	ld [de], a
	inc de
	dec c
	jr nz, .byte_fill
	pop de
	ld c, $9
.get_size
	dec c
	jr z, .size_done
	ld a, [hli]
	cp $e0
	jr nz, .get_size
	srl c
	ld a, c
	or a
	jr z, .size_done
	ld a, $0
.left_pad
	ld [de], a
	inc de
	dec c
	jr nz, .left_pad
.size_done
	pop hl
	ld c, $8
.copy
	ld a, [hli]
	ld [de], a
	dec c
	ret z
	inc de
	cp $e0
	jr nz, .copy
	ld a, $0
.right_pad
	ld [de], a
	inc de
	dec c
	jr nz, .right_pad
	ret

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
	dr $de95f, $dee5f

GFX_dee5f: INCBIN "gfx/phone/dee5f.w24.2bpp"
GFX_dee8f: INCBIN "gfx/phone/dee8f.w24.2bpp"
GFX_deebf: INCBIN "gfx/phone/deebf.w24.2bpp"
GFX_deeef: INCBIN "gfx/phone/deeef.w24.2bpp"
GFX_def1f: INCBIN "gfx/phone/def1f.w24.2bpp"
GFX_def4f: INCBIN "gfx/phone/def4f.w24.2bpp"
GFX_def7f: INCBIN "gfx/phone/def7f.w24.2bpp"
GFX_defaf: INCBIN "gfx/phone/defaf.w24.2bpp"
GFX_defdf: INCBIN "gfx/phone/defdf.w24.2bpp"
	dr $df00f, $e0000

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
Data_1d4000::
	dr $1d4000, $1d4b48

Data_1d4b48::
	dr $1d4b48, $1d5628

Data_1d5628::
	dr $1d5628, $1d5640

Data_1d5640::
	dr $1d5640, $1d56ee

Data_1d56ee::
	dr $1d56ee, $1d7928

Data_1d7928::
	dr $1d7928, $1d7988

Data_1d7988::
	dr $1d7988, $1d8000

SECTION "bank 79", ROMX, BANK [$79]
GFX_1e4000: INCBIN "gfx/phone_keypads/1e4000.t2.2bpp"
GFX_1e4400: INCBIN "gfx/phone_keypads/1e4400.t2.2bpp"
GFX_1e4800: INCBIN "gfx/phone_keypads/1e4800.t2.2bpp"
GFX_1e4c00: INCBIN "gfx/phone_keypads/1e4c00.t2.2bpp"
GFX_1e5000: INCBIN "gfx/phone_keypads/1e5000.t2.2bpp"
GFX_1e5400: INCBIN "gfx/phone_keypads/1e5400.t2.2bpp"
GFX_1e5800: INCBIN "gfx/phone_keypads/1e5800.t2.2bpp"
GFX_1e5c00: INCBIN "gfx/phone_keypads/1e5c00.t2.2bpp"
GFX_1e6000: INCBIN "gfx/phone_keypads/1e6000.t2.2bpp"
GFX_1e6400: INCBIN "gfx/phone_keypads/1e6400.t2.2bpp"
GFX_1e6800: INCBIN "gfx/phone_keypads/1e6800.t2.2bpp"
GFX_1e6c00: INCBIN "gfx/phone_keypads/1e6c00.t2.2bpp"

SECTION "bank 7A", ROMX, BANK [$7a]
GFX_1e8000: INCBIN "gfx/phone/1e8000.2bpp"
GFX_1e8200: INCBIN "gfx/phone/1e8200.2bpp"
GFX_1e8400: INCBIN "gfx/phone/1e8400.2bpp"
GFX_1e8600: INCBIN "gfx/phone/1e8600.2bpp"
GFX_1e8800: INCBIN "gfx/phone/1e8800.2bpp"
GFX_1e8a00: INCBIN "gfx/phone/1e8a00.2bpp"
GFX_1e8c00: INCBIN "gfx/phone/1e8c00.2bpp"
GFX_1e8e00: INCBIN "gfx/phone/1e8e00.2bpp"
GFX_1e9000: INCBIN "gfx/phone/1e9000.2bpp"

SECTION "bank 7B", ROMX, BANK [$7b]
GFX_1ec000: INCBIN "gfx/phone_keypads/1ec000.t2.2bpp"
GFX_1ec400: INCBIN "gfx/phone_keypads/1ec400.t2.2bpp"
GFX_1ec800: INCBIN "gfx/phone_keypads/1ec800.t2.2bpp"
GFX_1ecc00: INCBIN "gfx/phone_keypads/1ecc00.t2.2bpp"
GFX_1ed000: INCBIN "gfx/phone_keypads/1ed000.t2.2bpp"
GFX_1ed400: INCBIN "gfx/phone_keypads/1ed400.t2.2bpp"
GFX_1ed800: INCBIN "gfx/phone_keypads/1ed800.t2.2bpp"
GFX_1edc00: INCBIN "gfx/phone_keypads/1edc00.t2.2bpp"
GFX_1ee000: INCBIN "gfx/phone_keypads/1ee000.t2.2bpp"
GFX_1ee400: INCBIN "gfx/phone_keypads/1ee400.t2.2bpp"
GFX_1ee800: INCBIN "gfx/phone_keypads/1ee800.t2.2bpp"
GFX_1eec00: INCBIN "gfx/phone_keypads/1eec00.t2.2bpp"

SECTION "bank 7C", ROMX, BANK [$7c]
TitleScreenPCM:: INCBIN "audio/pcm/title.pcm"
TitleScreenPCMEnd::
