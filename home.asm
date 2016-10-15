SECTION "Boot", HOME [$0100]
	nop
	jp Start

SECTION "Header", HOME [$0104]
	ds $4c

SECTION "Start", HOME [$0150]
Start::
	ld [wCGB], a
	di
	call Func_07df
	xor a
	ld [rIF], a
	ld [rIE], a
	ld sp, wStackTop
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, $3
	ld [MBC3RomBank], a
	ld a, $0
	ld [MBC3RomBank], a
	ld a, $0
	ld [MBC3SRamBank], a
	call ClearVBGMap ; 0807
	call ClearVTiles ; 0968
	call ClearOAMBuffer ; 0971
	xor a
	ld [rVBK], a
	ld [rSVBK], a
	ld [rRP], a
	ld hl, rOAM
	ld c, 0
.clear_oam
	ld [hli], a
	dec c
	jr nz, .clear_oam
	ld hl, hPushOAM
	ld c, rIE - hPushOAM
.clear_hram
	ld [hli], a
	dec c
	jr nz, .clear_hram
	ld a, [wCGB]
	push af
	call ClearWRAM0 ; 097c
	pop af
	ld [wCGB], a
	call LoadPushOAM ; 079a
	call InitSoundData ; 0439
	ld a, 1
	ld [wc430], a
	call ClearDMGPalBuffers ; 1043
	ld a, $83
	ld [wLCDC], a
	ld [rLCDC], a
	ei
	call InitSerialData ; 1d23
	ld a, $40
	ld [rSTAT], a
	xor a
	ld [rIF], a
	ld a, $0b
	ld [rIE], a
	xor a
	ld [wcb3f], a
	ld a, $1
	ld [wdd00], a
	ld [wdd03], a
	xor a
	call GetCGB_BGLayout ; 109d
	call GetCGB_OBLayout ; 1145
	ld a, BANK(Func_c1af)
	rst Bankswitch
	xor a
	ld [wc40a], a
	call Func_c1af
	jp nc, .skip
	ld a, $1
	ld [wc40a], a
	call Func_c000
.skip
	xor a
	ld [wc3e0], a
	ld [wc3e1], a
	ld a, $3
	rst Bankswitch
.loop
	ld a, [wc3c0]
	inc a
	ld [wc3c0], a
	call Func_02d0
	ld a, [wcb3f]
	or a
	jr z, .skip2
	call Func_1dbc
	call Func_1d66
	call Func_1d46
.skip2
	call Func_0234
	call Func_106a
	call Func_3869
	call Func_0766
	call Func_1be2
	call Func_0824
	ld a, 1
	ld [wc3c1], a
.wait
	ld a, [hVBlankOccurred]
	and a
	jr z, .wait
	xor a
	ld [hVBlankOccurred], a
	ld [wc3c1], a
	jp .loop

Func_0234: ; 234 (0:0234)
	ld a, [wdc05]
	or a
	ret z
	ld a, [wdc01]
	or a
	jr z, .asm_252
	ld a, [wdc2e]
	cp $ff
	jr nz, .asm_252
	ld a, [wdc59]
	cp $10
	jr nc, .asm_263
	inc a
	ld [wdc59], a
	ret

.asm_252
	ld a, [wdc07]
	cp $10
	jp nc, .asm_263
	inc a
	ld [wdc07], a
	xor a
	ld [wdc59], a
	ret

.asm_263
	jp InitSerialData

Func_0266::
	ld a, [wc46c]
	or a
	jr nz, .asm_26e
	jr .asm_26e

.asm_26e
	ld a, [wc3c2]
	ld [rSCX], a
	ld a, [wc3c3]
	ld [rSCY], a
	ld a, [wc3c4]
	ld [rWX], a
	ld a, [wc3c5]
	ld [rWY], a
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP1]
	ld [rOBP0], a
	ld a, [wOBP2]
	ld [rOBP1], a
	ld a, [wLCDC]
	ld [rLCDC], a
	ld a, [wc3ca]
	ld [rLYC], a
	ld b, $0
	ld hl, wc464
	ld de, wc460
	ld a, [de]
	add b
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ld a, [wc46c]
	ld [wc469], a
	ld a, $0
	ld [wcac1], a
	ld a, [wc46d]
	cp $2
	jr c, .asm_2cf
	ld a, $2
	ld [wc46d], a
	ld a, [wc957]
	xor $1
	ld [wc957], a
	ret

.asm_2cf
	ret

Func_02d0: ; 2d0 (0:02d0)
	ld a, [hFF8C]
	and $f
	cp $f
	ret nz
	ld a, [wc3e0]
	cp $0
	ret z
	xor a
	ld [wc3e0], a
	ld a, $2a
	ld [wc3e1], a
	ret

VBlank: ; 2e7 (0:02e7)
	push af
	push bc
	push de
	push hl
	call Func_0266
	ld a, [hVBlankOccurred]
	or a
	jr nz, .asm_0306
	ld a, [wc437]
	or a
	jr z, .asm_0306
	call hPushOAM
	call Func_3171
	xor a
	ld [wc430], a
	ld [wc437], a
.asm_0306
	ld a, $1
	ld [hVBlankOccurred], a
	ei
	call Func_0464
	call Func_3442
	ld a, [wcb3f]
	or a
	jr nz, .asm_031c
	call Func_1f08
	jr .asm_031f

.asm_031c
	call Func_1c9b
.asm_031f
	pop hl
	pop de
	pop bc
	pop af
	reti

LCD: ; 324 (0:0324)
	push af
	ld a, [wc46d]
	cp $2
	jp nc, Func_0402
	push bc
	push hl
	ld a, [wc469]
	or a
	jp nz, Func_033b
	call Func_0425
	jr asm_037f

Func_033b: ; 33b (0:033b)
	ld a, [wc46d]
	or a
	jr nz, asm_0383
	ld hl, wc464
	ld a, [hli]
	sub $4
	ld b, a
	ld a, [rLY]
	cp b
	jr nc, .asm_0363
	ld a, [wcac1]
	or a
	jr nz, asm_037f
	ld a, [hli]
	ld [rWX], a
	ld a, [hl]
	ld [rWY], a
	ld a, b
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_0363
	ld a, b
	add $4
	ld b, a
.asm_0367
	ld a, [rLY]
	cp b
	jr c, .asm_0367
asm_036c
	xor a
	ld [rSCX], a
	ld [rSCY], a
Func_0371: ; 371 (0:0371)
	ld [wcac1], a
	ld a, $0
	ld [rLYC], a
	ld [wc3ca], a
	ld a, $83
	ld [rLCDC], a
asm_037f
	pop hl
	pop bc
	pop af
	reti

asm_0383
	ld a, [wc3e0]
	cp $4
	jr z, .asm_03bc
	ld hl, wc467
	ld a, [rLY]
	cp $5f
	jr nc, asm_036c
	ld a, [wcac1]
	cp $1
	jr z, .asm_03ae
	cp $0
	jr nz, asm_037f
	xor a
	ld [rSCX], a
	ld [rSCY], a
	ld a, $27
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_03ae
	ld a, [hl]
	ld [rSCX], a
	ld a, $5f
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr asm_037f

.asm_03bc
	ld a, [rLY]
	cp $6c
	jr nc, .asm_03f2
	ld a, [wcac1]
	cp $1
	jr z, .asm_03dc
	cp $0
	jr nz, asm_037f
	ld a, $7f
	ld [rSCY], a
	ld a, $14
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_03dc
	ld a, [rLY]
	cp $18
	jr c, .asm_03dc
	ld a, [wc467]
	ld [rSCY], a
	ld a, $6c
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr asm_037f

.asm_03f2
	ld a, [rLY]
	cp $70
	jr c, .asm_03f2
	ld a, $10
	ld [rSCY], a
	xor a
	ld [rSCX], a
	jp Func_0371

Func_0402: ; 402 (0:0402)
	push hl
	ld hl, wc140
	ld a, [wc957]
	or a
	jr nz, .asm_040f
	ld hl, wc0a0
.asm_040f
	ld a, [wc46d]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [rSCY], a
	ld a, [wc46d]
	inc a
	ld [wc46d], a
	pop hl
	pop af
	reti

Func_0425: ; 425 (0:0425)
	xor a
	ld [wcac1], a
	ld hl, wc460
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

.asm_0431
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0431
	ret

InitSoundData::
	dr $0439, $0464

Func_0464::
	dr $0464, $0476

Func_0476::
	dr $0476, $049e

BankSwitch::
	di
	ld [MBC3RomBank], a
	ld [wROMBank], a
	ei
	ret

	dr $04a7, $0766

Func_0766::
	dr $0766, $079a

LoadPushOAM::
	dr $079a, $07df

Func_07df::
	dr $07df, $0807

ClearVBGMap::
	dr $0807, $0824

Func_0824::
	dr $0824, $0968

ClearVTiles::
	dr $0968, $0971

ClearOAMBuffer::
	dr $0971, $097c

ClearWRAM0::
	dr $097c, $1043

ClearDMGPalBuffers::
	dr $1043, $106a

Func_106a::
	dr $106a, $109d

GetCGB_BGLayout::
	dr $109d, $1145

GetCGB_OBLayout::
	dr $1145, $1be2

Func_1be2::
	dr $1be2, $1c9b

Func_1c9b::
	dr $1c9b, $1cb4

Serial::
	dr $1cb4, $1d23

InitSerialData::
	dr $1d23, $1d46

Func_1d46::
	dr $1d46, $1d66

Func_1d66::
	dr $1d66, $1dbc

Func_1dbc::
	dr $1dbc, $1f08

Func_1f08::
	dr $1f08, $3171

Func_3171::
	dr $3171, $3442

Func_3442::
	dr $3442, $3869

Func_3869::
	dr $3869, $4000
