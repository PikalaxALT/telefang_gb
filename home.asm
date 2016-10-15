SECTION "Boot", HOME [$0100]
	nop
	jp Start

SECTION "Header", HOME [$0104]
	ds $4c

SECTION "Start", HOME [$0150]
INCLUDE "home/init.asm"

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

INCLUDE "home/vblank.asm"
INCLUDE "home/lcd.asm"

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
