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
	add MUSIC_00
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
	call WaitStat
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

WaitStat: ; 9aa (0:09aa)
	push af
.asm_09ab
	ld a, [rSTAT]
	and $2
	jr nz, .asm_09ab
	pop af
	ret

WaitStatAndLoad: ; 9b3 (0:09b3)
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStatAndLoad
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
	call WaitStat
	ld a, [de]
	call WaitStat
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
	call WaitStat
	ld a, [de]
	call WaitStat
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
	call WaitStat
	ld a, [de]
	call WaitStat
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

Func_0d97: ; d97 (0:0d97)
	ld hl, $6
	add hl, de
	ld [hl], $1
	ld hl, $7
	add hl, de
	ld [hl], a
	ld hl, $8
	add hl, de
	ld [hl], $0
	ld hl, $9
	add hl, de
	ld [hl], $0
	ld hl, $a
	add hl, de
	ld [hl], $0
	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f
	push af
	ld hl, Data_0dee
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch
	pop af
	ld hl, Data_0df1
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $7
	add hl, de
	ld a, [hl]
	pop hl
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	ld a, [hl]
	ld hl, $2
	add hl, de
	ld [hl], a
	ret

Data_0dee::
	db BANK(Pointers_33ac4)
	db BANK(Pointers_33ac4)
	db BANK(Pointers_33ac4)

Data_0df1::
	dw Pointers_33ac4
	dw Pointers_33ac4
	dw Pointers_33ac4

Func_0df7: ; df7 (0:0df7)
	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f
	ld hl, Data_0dee
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [hl]
	rst Bankswitch
	ld hl, $6
	add hl, de
	ld a, [hl]
	or a
	jp nz, Func_0e10
Func_0e10: ; e10 (0:0e10)
	ld hl, $a
	add hl, de
	ld a, [hl]
	cp $ff
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jr z, .asm_0e23
	dec a
	ld [hl], a
	ret

.asm_0e23
	ld a, $1
	ld [wc430], a
	ld hl, $1
	add hl, de
	ld a, [hl]
	and $f
	ld hl, Data_0df1
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld hl, $7
	add hl, de
	ld a, [hl]
	pop hl
	ld c, a
	ld b, $0
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld b, [hl]
	ld c, a
Func_0e4f: ; e4f (0:0e4f)
	ld hl, $9
	add hl, de
	ld a, [hl]
	ld h, $0
	ld l, a
	add hl, bc
	ld a, [hl]
	cp $fe
	jr z, .asm_0e71
	cp $ff
	jr z, .asm_0e64
	jp Func_0e7f

.asm_0e64
	ld hl, $a
	add hl, de
	ld [hl], $ff
	ld hl, $6
	add hl, de
	ld [hl], $0
	ret

.asm_0e71
	inc hl
	ld a, [hl]
	sla a
	sla a
	ld hl, $9
	add hl, de
	ld [hl], a
	jp Func_0e4f

Func_0e7f: ; e7f (0:0e7f)
	ld a, [hli]
	dec a
	push hl
	ld hl, $8
	add hl, de
	ld [hl], a
	pop hl
	ld a, [hl]
	ld hl, $2
	add hl, de
	ld [hl], a
	ld hl, $9
	add hl, de
	ld a, [hl]
	add $2
	ld [hl], a
	ret

Func_0e97::
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_0ea3::
	ld a, [wc3e1]
	inc a
	ld [wc3e1], a
	ret

Func_0eab::
	ld a, [wc3e2]
	inc a
	ld [wc3e2], a
	ret

Func_0eb3: ; eb3 (0:0eb3)
	push af
	push bc
	push de
	call Func_0f29
	ld d, h
	ld e, l
	ld bc, $6800
	or a
	jr z, .asm_0ec4
	ld bc, $6400
.asm_0ec4
	add hl, bc
	srl l
	jr c, .asm_0edb
	srl l
	jr c, .asm_0edb
	srl l
	jr c, .asm_0edb
	srl l
	jr c, .asm_0edb
	srl l
	jr c, .asm_0edb
	jr .asm_0ee1

.asm_0edb
	ld h, d
	ld l, e
	pop de
	pop bc
	pop af
	ret

.asm_0ee1
	ld h, d
	ld l, e
	ld bc, hFFE0
	add hl, bc
	call Func_0f29
	pop de
	pop bc
	pop af
	ret

Func_0eee::
	push af
	push bc
	push de
	call Func_0f29
	ld d, h
	ld e, l
	ld bc, $6800
	or a
	jr z, .asm_0eff
	ld bc, $6400
.asm_0eff
	add hl, bc
	srl l
	jr nc, .asm_0f16
	srl l
	jr nc, .asm_0f16
	srl l
	jr nc, .asm_0f16
	srl l
	jr nc, .asm_0f16
	srl l
	jr nc, .asm_0f16
	jr .asm_0f1c

.asm_0f16
	ld h, d
	ld l, e
	pop de
	pop bc
	pop af
	ret

.asm_0f1c
	ld h, d
	ld l, e
	ld bc, $20
	add hl, bc
	call Func_0f29
	pop de
	pop bc
	pop af
	ret

Func_0f29: ; f29 (0:0f29)
	push af
	or a
	jr nz, .window
	ld a, h
	and $3
	ld h, VBGMap / $100
	or h
	ld h, a
	pop af
	ret

.window
	ld a, h
	and $f
	ld h, VWindow / $100
	or h
	ld h, a
	pop af
	ret

INCLUDE "home/sram.asm"
INCLUDE "home/palettes.asm"

Func_12fb: ; 12fb (0:12fb)
	push de
	push bc
	push hl
	push af
	xor a
	ld [wc44e], a
	ld [wc44f], a
	ld de, 0
	pop af
	ld b, $64
.asm_130c
	ld c, a
	sub b
	jr c, .asm_1313
	inc d
	jr .asm_130c

.asm_1313
	ld a, c
	ld b, $a
.asm_1316
	ld c, a
	sub b
	jr c, .asm_1322
	push af
	ld a, e
	add $10
	ld e, a
	pop af
	jr .asm_1316

.asm_1322
	ld a, c
	ld b, $1
.asm_1325
	ld c, a
	sub b
	jr c, .asm_132c
	inc e
	jr .asm_1325

.asm_132c
	ld a, d
	ld [wc44e], a
	ld a, e
	ld [wc44f], a
	pop hl
	pop bc
	pop de
	ret

Func_1338: ; 1338 (0:1338)
	xor a
	ld [wc44e], a
	ld [wc44f], a
	ld a, b
	or a
	jr nz, .asm_1346
	ld a, c
	or a
	ret z
.asm_1346
	ld a, h
	ld [wc440], a
	ld a, l
	ld [wc441], a
	ld d, b
	ld a, h
	sub d
	ret c
	jr nz, .asm_1358
	ld d, c
	ld a, l
	sub d
	ret c
.asm_1358
	ld a, [wc441]
	sub c
	ld l, a
	ld a, [wc440]
	sbc b
	ld h, a
	ld a, [wc44e]
	add $1
	ld [wc44e], a
	ld a, $0
	adc $0
	ld d, a
	ld a, [wc44f]
	add d
	ld [wc44f], a
	jr .asm_1346

Func_1378::
	push hl
	push de
	push bc
	push bc
	push hl
	call Func_12fb
	pop hl
	xor a
	ld [wc450], a
	pop bc
	ld a, c
	cp $1
	jp nz, Func_1394
	ld a, $1
	ld [wc450], a
	jp Func_13aa

Func_1394: ; 1394 (0:1394)
	ld a, [wc44e]
	and $f
	or a
	jr nz, .asm_139d
	xor a
.asm_139d
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc450], a
Func_13aa: ; 13aa (0:13aa)
	inc hl
	ld a, [wc44f]
	and $f0
	or a
	jr nz, .asm_13bb
	ld b, a
	ld a, [wc450]
	or a
	jr z, .asm_13c5
	ld a, b
.asm_13bb
	swap a
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
.asm_13c5
	inc hl
	ld a, [wc44f]
	and $f
	add $f0
	di
	call WaitStat
	ld [hl], a
	ei
	pop bc
	pop de
	pop hl
	ret

Func_13d7::
	push hl
	push de
	push bc
	push hl
	call Func_12fb
	pop hl
	xor a
	ld [wc450], a
	ld a, [wc44f]
	and $f0
	or a
	jr nz, .asm_13ec
	ld a, b
.asm_13ec
	add $e0
	di
	call WaitStat
	ld [hl], a
	ei
	inc a
	push hl
	ld de, $20
	add hl, de
	di
	call WaitStat
	ld [hl], a
	ei
	pop hl
	ld a, $1
	ld [wc450], a
	inc hl
	ld a, [wc44f]
	and $f
	or a
	jr nz, .asm_1417
	ld b, a
	ld a, [wc450]
	or a
	jr z, .asm_142c
	ld a, b
.asm_1417
	swap a
	add $e0
	di
	call WaitStat
	ld [hl], a
	ei
	inc a
	ld de, $20
	add hl, de
	di
	call WaitStat
	ld [hl], a
	ei
.asm_142c
	pop bc
	pop de
	pop hl
	ret

Func_1430::
	push hl
	push de
	push bc
	push bc
	push hl
	call Func_12fb
	pop hl
	xor a
	ld [wc450], a
	pop bc
	ld a, c
	cp $1
	jp nz, Func_144c
	ld a, $1
	ld [wc450], a
	jp Func_146d

Func_144c: ; 144c (0:144c)
	ld a, [wc44e]
	and $f
	or a
	jr nz, .asm_145c
	ld b, a
	ld a, [wc450]
	or a
	jr z, .asm_1468
	ld a, b
.asm_145c
	add $f0
	call WaitStatAndLoad
	ld a, $1
	ld [wc450], a
	jr Func_146d

.asm_1468
	ld a, $ff
	call WaitStatAndLoad
Func_146d: ; 146d (0:146d)
	ld a, [wc44f]
	and $f0
	or a
	jr nz, .asm_147d
	ld b, a
	ld a, [wc450]
	or a
	jr z, .asm_1486
	ld a, b
.asm_147d
	swap a
	add $f0
	call WaitStatAndLoad
	jr .asm_148b

.asm_1486
	ld a, $ff
	call WaitStatAndLoad
.asm_148b
	ld a, [wc44f]
	and $f
	add $f0
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_1499::
	push hl
	push de
	push bc
	push bc
	push hl
	call Func_12fb
	pop hl
	pop bc
	ld a, [wc44f]
	and $f
	add $f0
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_14b1::
	push hl
	push de
	push bc
	xor a
	ld [wc450], a
	ld a, b
	ld [wc442], a
	ld a, c
	ld [wc443], a
	ld bc, $3e8
	call Func_1338
	ld a, [wc44e]
	or a
	jr nz, .asm_14d4
	ld b, a
	ld a, [wc450]
	or a
	jr z, .asm_14eb
	ld a, b
.asm_14d4
	add $f0
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
	ld [wc450], a
.asm_14eb
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $64
	call Func_1338
	ld a, [wc44e]
	or a
	jr nz, .asm_1505
	ld b, a
	ld a, [wc450]
	or a
	ld a, b
.asm_1505
	add $f0
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wc450], a
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $a
	call Func_1338
	ld a, [wc44e]
	or a
	jr nz, .asm_153e
	ld b, a
	ld a, [wc450]
	or a
	ld a, b
.asm_153e
	add $f0
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $1
	call Func_1338
	ld a, [wc44e]
	add $f0
	push af
	ld a, [wc442]
	ld h, a
	ld a, [wc443]
	ld l, a
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	ld bc, $1
	add hl, bc
	xor a
	call Func_0eb3
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	pop bc
	pop de
	pop hl
	ret

ClearMemory3: ; 159f (0:159f)
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, ClearMemory3
	ret

FillMemoryWithFF::
.asm_15a7
	ld a, $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_15a7
	ret

Func_15b0::
	ld a, d
	or a
	jr z, .asm_15bd
	dec d
	ret z
	ld b, h
	ld c, l
.asm_15b8
	add hl, bc
	dec d
	jr nz, .asm_15b8
	ret

.asm_15bd
	ld hl, 0
	ret

.asm_15c1
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_15c1
	ret

Func_15ca::
	ld [wc44f], a
	ld a, [wCGB]
	cp $11
	ret nz
	ld a, $1
	ld [rVBK], a
	ld a, b
	ld [wc44e], a
.asm_15db
	push hl
	ld a, [wc44e]
	ld b, a
.asm_15e0
	ld a, [wc44f]
	call WaitStatAndLoad
	dec b
	jr nz, .asm_15e0
	pop hl
	ld de, $20
	add hl, de
	dec c
	jr nz, .asm_15db
	xor a
	ld [rVBK], a
	ret

GetMusicBank::
	cp $10
	jr nc, .asm_15fe
	push af
	xor a
	jp Func_161b

.asm_15fe
	cp $20
	jr nc, .asm_160a
	sub $f
	push af
	ld a, MUSIC_01 - MUSIC_00
	jp Func_161b

.asm_160a
	cp $30
	jr nc, .asm_1616
	sub $1f
	push af
	ld a, MUSIC_02 - MUSIC_00
	jp Func_161b

.asm_1616
	sub $2f
	push af
	ld a, MUSIC_03 - MUSIC_00
Func_161b: ; 161b (0:161b)
	ld [wMusicBank], a
	pop af
	ret

GetDenjuuPicPointer: ; 1620 (0:1620)
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

GetTFangerPicPointer: ; 16c2 (0:16c2)
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

Func_1756: ; 1756 (0:1756)
	ld b, $7
	push bc
	ld hl, $1b0
	jp Func_176a

Func_175f::
	ld b, $6
	jp Func_1766

Func_1764::
	ld b, $7
Func_1766: ; 1766 (0:1766)
	push bc
	ld hl, $100
Func_176a: ; 176a (0:176a)
	ld d, $0
	ld e, a
	add hl, de
	pop bc
	ld a, b
	ld b, h
	ld c, l
	jp Func_10ee

Func_1775::
	push bc
	ld hl, $100
	ld d, $0
	ld e, a
	add hl, de
	pop bc
	ld a, b
	ld b, h
	ld c, l
	jp Func_1196

InvertBits: ; 1784 (0:1784)
	push de
	push bc
	ld b, $8
	ld d, $0
	ld e, a
.asm_178b
	srl e
	rl d
	dec b
	jr nz, .asm_178b
	ld a, d
	pop bc
	pop de
	ret

Func_1796::
	push hl
	pop de
	di
	call WaitStat
	ld a, [hli]
	ld [wcb20], a
	ei
	di
	call WaitStat
	ld a, [hli]
	ld [wcb21], a
	ei
	ld b, $6
.asm_17ac
	di
	call WaitStat
	ld a, [hli]
	ld [de], a
	inc de
	call WaitStat
	ld a, [hli]
	ld [de], a
	inc de
	ei
	dec b
	jr nz, .asm_17ac
	di
	ld a, [wcb20]
	call WaitStat
	ld [de], a
	inc de
	ld a, [wcb21]
	call WaitStat
	ld [de], a
	ei
	ret

Func_17cf::
	ld b, $10
.asm_17d1
	di
	call WaitStat
	ld a, [hl]
	rrc a
	ld [hl], a
	ei
	inc hl
	dec b
	jr nz, .asm_17d1
	ret

Func_17df::
	ld b, $10
.asm_17e1
	di
	call WaitStat
	ld a, [hl]
	rlc a
	ld [hl], a
	ei
	inc hl
	dec b
	jr nz, .asm_17e1
	ret

Func_17ef::
	push hl
	ld de, wcb80
	ld bc, $40
	call WaitStatCopy2
	ld de, wcb80
	ld hl, wcb90
	ld b, $2
Func_1801: ; 1801 (0:1801)
	push bc
	push hl
	push de
	ld b, $10
Func_1806: ; 1806 (0:1806)
	call Func_18d3
	dec b
	jp nz, Func_1806
	ld bc, $20
	pop hl
	add hl, bc
	push hl
	pop de
	pop hl
	add hl, bc
	pop bc
	dec b
	jp nz, Func_1801
	ld de, wcb80
	ld hl, wcbc0
	call Func_18cc
	ld de, wcb90
	call Func_18cc
	ld de, wcba0
	call Func_18cc
	ld de, wcbb0
	call Func_18cc
	ld hl, wcb82
	ld de, wcb80
	ld b, $4
Func_183e: ; 183e (0:183e)
	push bc
	ld b, $e
Func_1841: ; 1841 (0:1841)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jp nz, Func_1841
	inc hl
	inc hl
	inc de
	inc de
	pop bc
	dec b
	jp nz, Func_183e
	ld de, wcbc0
	ld hl, wcbae
	call Func_18cc
	ld hl, wcbbe
	call Func_18cc
	ld hl, wcb8e
	call Func_18cc
	ld hl, wcb9e
	call Func_18cc
	pop de
	ld hl, wcb80
	ld bc, $40
	call WaitStatCopy
	ret

Func_1877::
	ld b, $8
.asm_1879
	di
	call WaitStat
	ld a, [hl]
	rlc a
	ld [hli], a
	ei
	inc hl
	dec b
	jr nz, .asm_1879
	ret

Func_1887: ; 1887 (0:1887)
	dec a
	push af
	ld [wcb20], a
	cp $40
	jr c, .asm_1899
	sub $40
	ld [wcb20], a
	ld a, GFX_01
	jr .asm_189b

.asm_1899
	ld a, GFX_00
.asm_189b
	rst Bankswitch
	ld a, [wcb20]
	ld d, a
	ld e, $0
	ld hl, UnknGFX_000
	add hl, de
	ld de, VTilesOB + $40 tiles
	ld bc, $10 tiles
	call WaitStatCopy
	pop af
	ld hl, $80
	ld d, $0
	ld e, a
	add hl, de
	ld a, $0
	ld b, h
	ld c, l
	call Func_1196
	ld a, $1
	ld bc, $da
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_18cc: ; 18cc (0:18cc)
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	ret

Func_18d3: ; 18d3 (0:18d3)
	push de
	ld a, [de]
	srl a
	ld [de], a
	ld a, [hl]
	rr a
	ld [hli], a
	pop de
	jp nc, Func_18e4
	ld a, [de]
	or $80
	ld [de], a
Func_18e4: ; 18e4 (0:18e4)
	inc de
	ret

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
