SECTION "Boot", HOME [$0100]
	nop
	jp Start

SECTION "Header", HOME [$0104]
	ds $4c

SECTION "Start", HOME [$0150]
INCLUDE "home/init.asm"

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
	ld a, [hJoyLast]
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

InitSoundData: ; 439 (0:0439)
	ld hl, wce00
	ld bc, $200
	call ClearMemory
	ld hl, hFFA0
	ld bc, $8
	call ClearMemory
	ld a, $ff
	ld [rNR51], a
	ld [wcf95], a
	ld a, $8f
	ld [rNR52], a
	xor a
	ld [rNR12], a
	ld [rNR22], a
	ld [rNR32], a
	ld [rNR42], a
	ld a, $77
	ld [rNR50], a
	ret

UpdateSound: ; 464 (0:0464)
	ld a, [wMusicBank]
	add AUDIO_00
	ld [MBC3RomBank], a
	call UpdateSound20
	ld a, [wROMBank]
	ld [MBC3RomBank], a
	ret

INCLUDE "home/farcall.asm"
INCLUDE "home/joypad.asm"

LoadPushOAM: ; 79a (0:079a)
	ld c, hPushOAM % $100
	ld b, PushOAMEnd - PushOAM
	ld hl, PushOAM
.load
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .load
	ret

PushOAM::
	ld a, wOAMBuffer / $100
	ld [rDMA], a
	; Wait until DMA is finished doing its thing (1 cycle per byte)
	ld a, (wOAMBufferEnd - wOAMBuffer) / 4
.wait_dma
	dec a
	jr nz, .wait_dma
	ret
PushOAMEnd::

Func_07b2::
	ld a, [hBGMapYPixel]
	sub $10
	srl a
	srl a
	srl a
	ld de, $0000
	ld e, a
	ld hl, VBGMap
	ld b, BG_MAP_WIDTH
.asm_07c5
	add hl, de
	dec b
	jr nz, .asm_07c5
	ld a, [hBGMapXPixel]
	sub $8
	srl a
	srl a
	srl a
	ld de, $0000
	ld e, a
	add hl, de
	ld a, h
	ld [hBGMapAddr], a
	ld a, l
	ld [hBGMapAddr + 1], a
	ret

Func_07df: ; 7df (0:07df)
	ld a, [rIE]
	ld [hFF93], a
	res 0, a
.asm_07e5
	ld a, [rLY]
	cp $91
	jr nz, .asm_07e5
	ld a, [wLCDC]
	and $7f
	ld [rLCDC], a
	ld a, [hFF93]
	ld [rIE], a
	ret

EnableLCD::
	ld a, [rLCDC]
	or $80
	ld [rLCDC], a
	ret

ClearMemory2::
.loop
	ld a, $0
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .loop
	ret

ClearVBGMap: ; 807 (0:0807)
	ld hl, VWindow - 1
	ld bc, VWindow - VBGMap
.asm_080d
	ld a, $0
	ld [hld], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_080d
	ret

Func_0816::
.asm_0816
	ld a, [hli]
	di
	call Func_09aa
	ld [de], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_0816
	ret

INCLUDE "home/oam_animations.asm"

ClearVTiles: ; 968 (0:0968)
	ld hl, $8000
	ld bc, $1800
	jp ClearMemory3

ClearOAMBuffer: ; 971 (0:0971)
	ld b, wOAMBufferEnd - wOAMBuffer
	xor a
	ld hl, wOAMBuffer
.asm_0977
	ld [hli], a
	dec b
	jr nz, .asm_0977
	ret

ClearWRAM0: ; 97c (0:097c)
	ld bc, $1e60
	ld hl, wOAMAnimations
	jp ClearMemory3
	ld a, $1
	ld [wc430], a
	ld bc, $300
	ld hl, wOAMAnimation01
	call ClearMemory3
	ld bc, $40
	ld hl, wc480
	jp ClearMemory3

Func_099c::
	ld b, $20
	xor a
.asm_099f
	ld [de], a
	inc de
	dec b
	jr nz, .asm_099f
	ld a, $1
	ld [wc430], a
	ret

Func_09aa: ; 9aa (0:09aa)
	push af
.asm_09ab
	ld a, [rSTAT]
	and $2
	jr nz, .asm_09ab
	pop af
	ret

Func_09b3: ; 9b3 (0:09b3)
	di
	push af
.asm_09b5
	ld a, [rSTAT]
	and $2
	jr nz, .asm_09b5
	pop af
	ld [hli], a
	ei
	ret

ClearBGMapAndAttrs::
	ld bc, $400
	ld hl, VBGMap
.asm_09c5
	xor a
	call Func_09b3
	dec bc
	ld a, b
	or c
	jr nz, .asm_09c5
	ld bc, $400
	ld hl, VBGMap
	ld a, $1
	ld [rVBK], a
.asm_09d8
	xor a
	call Func_09b3
	dec bc
	ld a, b
	or c
	jr nz, .asm_09d8
	xor a
	ld [rVBK], a
	ret

ClearBGWindowAndAttrs::
	ld bc, $400
	ld hl, VWindow
.asm_09eb
	xor a
	call Func_09b3
	dec bc
	ld a, b
	or c
	jr nz, .asm_09eb
	ld bc, $400
	ld hl, VWindow
	ld a, $1
	ld [rVBK], a
.asm_09fe
	xor a
	call Func_09b3
	dec bc
	ld a, b
	or c
	jr nz, .asm_09fe
	xor a
	ld [rVBK], a
	ret

Func_0a0b::
	xor a
	ld [wc3c2], a
	ld [wc3c3], a
	ld [wc3f7], a
	ld [wc3c4], a
	ld [wc3c5], a
	ld [wc3ca], a
	ld [wc3cb], a
	ld [wc3cc], a
	ld a, $c3
	ld [wLCDC], a
	ret

Func_0a2a: ; a2a (0:0a2a)
	push af
	ld hl, VBGMap
	xor a
	ld [wc41e], a
	jr asm_0a3d

Func_0a34: ; a34 (0:0a34)
	push af
	ld hl, VWindow
	ld a, $1
	ld [wc41e], a
asm_0a3d
	pop af
	push hl
	push de
	ld hl, Data_0b18
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	rst Bankswitch
	pop de
	pop hl
	push de
	ld a, b
	and $1f
	ld b, a
	ld a, c
	and $1f
	ld c, a
	ld d, $0
	ld e, c
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld c, b
	ld b, $0
	add hl, bc
	add hl, de
	pop de
	push hl
	ld hl, Pointers_f8000 ; Pointers_fc000
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld b, h
	ld c, l
	ld a, [de]
	cp $ff
	ret z
	and $3
	jr z, .asm_0a8c
	jr asm_0ab2

.asm_0a8c
	inc de
	ld a, [de]
	cp $ff
	ret z
	cp $fe
	jr z, .asm_0aa0
	call Func_09b3
	ld a, [wc41e]
	call Func_0eb3
	jr .asm_0a8c

.asm_0aa0
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld a, [wc41e]
	call Func_0f29
	ld b, h
	ld c, l
	pop de
	jr .asm_0a8c

asm_0ab2
	inc de
	ld a, [de]
	cp $ff
	ret z
	ld a, [de]
	and $c0
	cp $c0
	jp z, Func_0b03
	cp $80
	jp z, Func_0aee
	cp $40
	jp z, Func_0ada
	push bc
	ld a, [de]
	inc a
	ld b, a
Func_0acd: ; acd (0:0acd)
	inc de
	ld a, [de]
	call Func_09b3
	dec b
	jp nz, Func_0acd
	pop bc
	jp asm_0ab2

Func_0ada: ; ada (0:0ada)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0ae3: ; ae3 (0:0ae3)
	call Func_09b3
	dec b
	jp nz, Func_0ae3
	pop bc
	jp asm_0ab2

Func_0aee: ; aee (0:0aee)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0af7: ; af7 (0:0af7)
	call Func_09b3
	inc a
	dec b
	jp nz, Func_0af7
	pop bc
	jp asm_0ab2

Func_0b03: ; b03 (0:0b03)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0b0c: ; b0c (0:0b0c)
	call Func_09b3
	dec a
	dec b
	jp nz, Func_0b0c
	pop bc
	jp asm_0ab2

Data_0b18::
	db BANK(Pointers_f8000)
	db BANK(Pointers_fc000)

Func_0b1a: ; b1a (0:0b1a)
	push af
	ld a, [wdd06]
	or a
	jp z, Func_0b9e
	ld a, [wCGB]
	cp $11
	jp nz, Func_0b9e
	ld hl, VBGMap
	xor a
	ld [wc41e], a
	jr asm_0b4b

Func_0b33: ; b33 (0:0b33)
	push af
	ld a, [wdd06]
	or a
	jp z, Func_0b9e
	ld a, [wCGB]
	cp $11
	jp nz, Func_0b9e
	ld hl, VWindow
	ld a, $1
	ld [wc41e], a
asm_0b4b
	ld a, $1
	ld [rVBK], a
	pop af
	push hl
	push de
	ld hl, Data_0c34
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	rst Bankswitch
	pop de
	pop hl
	push de
	ld a, b
	and $1f
	ld b, a
	ld a, c
	and $1f
	ld c, a
	ld d, $0
	ld e, c
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	sla e
	rl d
	ld c, b
	ld b, $0
	add hl, bc
	add hl, de
	pop de
	push hl
	ld hl, Pointers_20000 ; Pointers_24000
	ld d, $0
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop hl
	ld b, h
	ld c, l
	ld a, [de]
	cp $ff
	ret z
	and $3
	jr z, asm_0ba0
	jr asm_0bc8

Func_0b9e: ; b9e (0:0b9e)
	pop af
	ret

asm_0ba0
	inc de
	ld a, [de]
	cp $ff
	jp z, Func_0c30
	cp $fe
	jr z, .asm_0bb6
	call Func_09b3
	ld a, [wc41e]
	call Func_0eb3
	jr asm_0ba0

.asm_0bb6
	push de
	ld de, $20
	ld h, b
	ld l, c
	add hl, de
	ld a, [wc41e]
	call Func_0f29
	ld b, h
	ld c, l
	pop de
	jr asm_0ba0

asm_0bc8: ; bc8 (0:0bc8)
	inc de
	ld a, [de]
	cp $ff
	jp z, Func_0c30
	ld a, [de]
	and $c0
	cp $c0
	jp z, Func_0c1b
	cp $80
	jp z, Func_0c06
	cp $40
	jp z, Func_0bf2
	push bc
	ld a, [de]
	inc a
	ld b, a
Func_0be5: ; be5 (0:0be5)
	inc de
	ld a, [de]
	call Func_09b3
	dec b
	jp nz, Func_0be5
	pop bc
	jp asm_0bc8

Func_0bf2: ; bf2 (0:0bf2)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0bfb: ; bfb (0:0bfb)
	call Func_09b3
	dec b
	jp nz, Func_0bfb
	pop bc
	jp asm_0bc8

Func_0c06: ; c06 (0:0c06)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0c0f: ; c0f (0:0c0f)
	call Func_09b3
	inc a
	dec b
	jp nz, Func_0c0f
	pop bc
	jp asm_0bc8

Func_0c1b: ; c1b (0:0c1b)
	push bc
	ld a, [de]
	and $3f
	add $2
	ld b, a
	inc de
	ld a, [de]
Func_0c24: ; c24 (0:0c24)
	call Func_09b3
	dec a
	dec b
	jp nz, Func_0c24
	pop bc
	jp asm_0bc8

Func_0c30::
	xor a
	ld [rVBK], a
	ret

Data_0c34::
	db BANK(Pointers_20000)
	db BANK(Pointers_24000)

Func_0c36: ; c36 (0:0c36)
	ld a, BANK(Data_18000)
	rst Bankswitch
	push bc
	pop de
	ld hl, Data_18000
	sla e
	rl d
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld [wc44e], a
	ld a, [hli]
	ld [wc450], a
	ld a, [hl]
	ld [wc451], a
	ld a, [wc44e]
	rst Bankswitch
	ld hl, Pointers_1de1
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	pop de
	ld a, [wc451]
	ld h, a
	ld a, [wc450]
	ld l, a
	ld a, [de]
	inc de
	jp Func_0c71

Func_0c71: ; c71 (0:0c71)
	cp $0
	jp z, Func_0d33
	ld a, h
	ld [wc406], a
	ld a, l
	ld [wc407], a
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
Func_0c84: ; c84 (0:0c84)
	ld a, b
	or c
	jp z, Func_0d4d
	ld a, [de]
	ld [wc405], a
	inc de
	ld a, [de]
	ld [wc404], a
	inc de
	ld a, $11
	ld [wc403], a
Func_0c98: ; c98 (0:0c98)
	ld a, b
	or c
	jp z, Func_0d4d
	ld a, [wc403]
	dec a
	jp z, Func_0c84
	ld [wc403], a
	push de
	ld a, [wc404]
	ld d, a
	ld a, [wc405]
	ld e, a
	srl d
	ld a, d
	ld [wc404], a
	rr e
	ld a, e
	ld [wc405], a
	jp c, Func_0cdf
	pop de
	ld a, [wc406]
	ld h, a
	ld a, [wc407]
	ld l, a
	di
	call Func_09aa
	ld a, [de]
	call Func_09aa
	ld [hli], a
	ei
	ld a, h
	ld [wc406], a
	ld a, l
	ld [wc407], a
	dec bc
	inc de
	jp Func_0c98

Func_0cdf: ; cdf (0:0cdf)
	pop de
	push de
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	and $7
	ld h, a
	ld a, [de]
	srl a
	srl a
	srl a
	and $1f
	add $3
	ld [wc402], a
	ld a, h
	cpl
	ld d, a
	ld a, l
	cpl
	ld e, a
	ld a, [wc406]
	ld h, a
	ld a, [wc407]
	ld l, a
	add hl, de
	push hl
	pop de
	ld a, [wc406]
	ld h, a
	ld a, [wc407]
	ld l, a
Func_0d0f: ; d0f (0:0d0f)
	di
	call Func_09aa
	ld a, [de]
	call Func_09aa
	ld [hli], a
	ei
	dec bc
	inc de
	ld a, [wc402]
	dec a
	ld [wc402], a
	jp nz, Func_0d0f
	ld a, h
	ld [wc406], a
	ld a, l
	ld [wc407], a
	pop de
	inc de
	inc de
	jp Func_0c98

Func_0d33: ; d33 (0:0d33)
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
Func_0d39: ; d39 (0:0d39)
	ld a, b
	or c
	jp z, Func_0d4d
	di
	call Func_09aa
	ld a, [de]
	call Func_09aa
	ld [hli], a
	ei
	inc de
	dec bc
	jp Func_0d39

Func_0d4d: ; d4d (0:0d4d)
	ret

Func_0d4e::
	ld a, [wc470]
	cp $2
	jp z, Func_0d7d
	push hl
	push bc
	ld a, [wc41f]
	ld h, a
	ld a, [wc420]
	ld l, a
	ld a, [wc3c0]
	ld b, a
	swap a
	inc a
	srl a
	add $87
	ld c, a
	add hl, bc
	ld a, l
	ld [wc41f], a
	ld a, h
	xor l
	ld [wc420], a
	add l
	ld [wc400], a
	pop bc
	pop hl
	ret

Func_0d7d: ; d7d (0:0d7d)
	push hl
	push bc
	ld a, BANK(Data_2c000)
	rst Bankswitch
	ld a, [wc471]
	inc a
	ld [wc471], a
	ld hl, Data_2c000
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	ld [wc400], a
	pop bc
	pop hl
	ret

Func_0d97::
	dr $0d97, $0df7

Func_0df7::
	dr $0df7, $0eb3

Func_0eb3::
	dr $0eb3, $0f29

Func_0f29::
	dr $0f29, $1043

ClearDMGPalBuffers::
	dr $1043, $106a

Func_106a::
	dr $106a, $109d

GetCGB_BGLayout::
	dr $109d, $1145

GetCGB_OBLayout::
	dr $1145, $122d

Func_122d::
	dr $122d, $1248

Func_1248::
	dr $1248, $159f

ClearMemory3::
	dr $159f, $1620

Func_1620::
	dr $1620, $16c2

Func_16c2::
	dr $16c2, $1705

Func_1705::
	dr $1705, $1887

Func_1887::
	dr $1887, $18e6

Func_18e6::
	dr $18e6, $190b

Func_190b::
	dr $190b, $192a

Func_192a::
	dr $192a, $1939

Func_1939::
	dr $1939, $19b9

Func_19b9::
	dr $19b9, $1ac6

Func_1ac6::
	dr $1ac6, $1acb

Func_1acb::
	dr $1acb, $1b4d

Func_1b4d::
	dr $1b4d, $1b9c

Func_1b9c::
	dr $1b9c, $1bb3

Func_1bb3::
	dr $1bb3, $1bb8

Func_1bb8::
	dr $1bb8, $1be2

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
	dr $1dbc, $1de1

Pointers_1de1:
	dr $1de1, $1f08

Func_1f08::
	dr $1f08, $3171

Func_3171::
	dr $3171, $3442

Func_3442::
	dr $3442, $3869

Func_3869::
	dr $3869, $3882

Func_3882::
	dr $3882, $39ec

Func_39ec::
	dr $39ec, $3a01

Func_3a01::
	dr $3a01, $3a1d

Func_3a1d::
	dr $3a1d, $3a35

Func_3a35::
	dr $3a35, $3a91

Func_3a91::
	dr $3a91, $3ac3

Func_3ac3::
	dr $3ac3, $3b09

Func_3b09::
	dr $3b09, $3b22

Func_3b22::
	dr $3b22, $3b36

Func_3b36::
	dr $3b36, $3b3f

Func_3b3f::
	dr $3b3f, $3b4e

Func_3b4e::
	dr $3b4e, $3b74

Func_3b74::
	dr $3b74, $3ba9

Func_3ba9::
	dr $3ba9, $3bc1

Func_3bc1::
	dr $3bc1, $3c57

Func_3c57::
	dr $3c57, $3c8b

Func_3c8b::
	dr $3c8b, $3e00

Func_3e00::
	dr $3e00, $3e45

Func_3e45::
	dr $3e45, $3e68

Func_3e68::
	dr $3e68, $4000
