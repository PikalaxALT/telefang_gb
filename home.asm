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

Func_0234::
	dr $0234, $02d0

Func_02d0::
	dr $02d0, $02e7

VBlank::
	dr $02e7, $0324

LCD::
	dr $0324, $0439

InitSoundData::
	dr $0439, $0476

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
	dr $1be2, $1cb4

Serial::
	dr $1cb4, $1d23

InitSerialData::
	dr $1d23, $1d46

Func_1d46::
	dr $1d46, $1d66

Func_1d66::
	dr $1d66, $1dbc

Func_1dbc::
	dr $1dbc, $3869

Func_3869::
	dr $3869, $4000
