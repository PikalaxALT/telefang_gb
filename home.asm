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

Func_0985::
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
	ld [wFontSourceBank], a
	ld a, [hli]
	ld [wFontSourceAddr], a
	ld a, [hl]
	ld [wFontSourceAddr + 1], a
	ld a, [wFontSourceBank]
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
	ld a, [wFontSourceAddr + 1]
	ld h, a
	ld a, [wFontSourceAddr]
	ld l, a
	ld a, [de]
	inc de
	jp @ + 2 ; basically a huge nop
	cp $0
	jp z, .single_blocks
	ld a, h
	ld [wFontDestAddr], a
	ld a, l
	ld [wFontDestAddr + 1], a
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
.loop
	ld a, b
	or c
	jp z, .exit
	ld a, [de]
	ld [wFontBlockFlags + 1], a
	inc de
	ld a, [de]
	ld [wFontBlockFlags], a
	inc de
	ld a, $10 + 1
	ld [wFontNumBlocks], a
.loop2
	ld a, b
	or c
	jp z, .exit
	ld a, [wFontNumBlocks]
	dec a
	jp z, .loop
	ld [wFontNumBlocks], a
	push de
	ld a, [wFontBlockFlags]
	ld d, a
	ld a, [wFontBlockFlags + 1]
	ld e, a
	srl d
	ld a, d
	ld [wFontBlockFlags], a
	rr e
	ld a, e
	ld [wFontBlockFlags + 1], a
	jp c, .carry
	pop de
	ld a, [wFontDestAddr]
	ld h, a
	ld a, [wFontDestAddr + 1]
	ld l, a
	di
	call WaitStat
	ld a, [de]
	call WaitStat
	ld [hli], a
	ei
	ld a, h
	ld [wFontDestAddr], a
	ld a, l
	ld [wFontDestAddr + 1], a
	dec bc
	inc de
	jp .loop2

.carry
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
	ld a, [wFontDestAddr]
	ld h, a
	ld a, [wFontDestAddr + 1]
	ld l, a
	add hl, de
	push hl
	pop de
	ld a, [wFontDestAddr]
	ld h, a
	ld a, [wFontDestAddr + 1]
	ld l, a
.loop3
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
	jp nz, .loop3
	ld a, h
	ld [wFontDestAddr], a
	ld a, l
	ld [wFontDestAddr + 1], a
	pop de
	inc de
	inc de
	jp .loop2

.single_blocks
	ld a, [de]
	ld c, a
	inc de
	ld a, [de]
	ld b, a
	inc de
.loop4
	ld a, b
	or c
	jp z, .exit
	di
	call WaitStat
	ld a, [de]
	call WaitStat
	ld [hli], a
	ei
	inc de
	dec bc
	jp .loop4

.exit
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

JumpTable::
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
	ld [wFontSourceBank], a
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
	ld [wFontSourceBank], a
	ld a, e
	ld [wc44f], a
	pop hl
	pop bc
	pop de
	ret

Func_1338: ; 1338 (0:1338)
	xor a
	ld [wFontSourceBank], a
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
	ld a, [wFontSourceBank]
	add $1
	ld [wFontSourceBank], a
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
	ld [wFontSourceAddr], a
	pop bc
	ld a, c
	cp $1
	jp nz, Func_1394
	ld a, $1
	ld [wFontSourceAddr], a
	jp Func_13aa

Func_1394: ; 1394 (0:1394)
	ld a, [wFontSourceBank]
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
	ld [wFontSourceAddr], a
Func_13aa: ; 13aa (0:13aa)
	inc hl
	ld a, [wc44f]
	and $f0
	or a
	jr nz, .asm_13bb
	ld b, a
	ld a, [wFontSourceAddr]
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
	ld [wFontSourceAddr], a
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
	ld [wFontSourceAddr], a
	inc hl
	ld a, [wc44f]
	and $f
	or a
	jr nz, .asm_1417
	ld b, a
	ld a, [wFontSourceAddr]
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
	ld [wFontSourceAddr], a
	pop bc
	ld a, c
	cp $1
	jp nz, Func_144c
	ld a, $1
	ld [wFontSourceAddr], a
	jp Func_146d

Func_144c: ; 144c (0:144c)
	ld a, [wFontSourceBank]
	and $f
	or a
	jr nz, .asm_145c
	ld b, a
	ld a, [wFontSourceAddr]
	or a
	jr z, .asm_1468
	ld a, b
.asm_145c
	add $f0
	call WaitStatAndLoad
	ld a, $1
	ld [wFontSourceAddr], a
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
	ld a, [wFontSourceAddr]
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
	ld [wFontSourceAddr], a
	ld a, b
	ld [wc442], a
	ld a, c
	ld [wc443], a
	ld bc, $3e8
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_14d4
	ld b, a
	ld a, [wFontSourceAddr]
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
	ld [wFontSourceAddr], a
.asm_14eb
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $64
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_1505
	ld b, a
	ld a, [wFontSourceAddr]
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
	ld [wFontSourceAddr], a
	ld a, [wc440]
	ld h, a
	ld a, [wc441]
	ld l, a
	ld bc, $a
	call Func_1338
	ld a, [wFontSourceBank]
	or a
	jr nz, .asm_153e
	ld b, a
	ld a, [wFontSourceAddr]
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
	ld a, [wFontSourceBank]
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

CopyData::
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
	ld [wFontSourceBank], a
.asm_15db
	push hl
	ld a, [wFontSourceBank]
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

INCLUDE "home/pics.asm"

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

LoadKanji: ; 18e6 (0:18e6)
	push de
	and $f
	swap a
	ld e, a
	ld a, KANJI
	rst Bankswitch
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	push de
	sla e
	rl d
	pop hl
	add hl, de
	ld de, Kanji_001
	add hl, de
	pop de
	ld bc, Kanji_002 - Kanji_001
	jp WaitStatCopy

LoadButtonGFX: ; 190b (0:190b)
	and $f
	swap a
	ld e, a
	ld a, BUTTON_GFX
	rst Bankswitch
	ld d, $0
	sla e
	rl d
	sla e
	rl d
	ld hl, Button_001
	add hl, de
	ld de, VTilesBG + $2c tiles
	ld bc, Button_002 - Button_001
	jp WaitStatCopy

Func_192a: ; 192a (0:192a)
	ld e, a
	ld d, $0
	ld hl, Func_02d0
	add hl, de
	push hl
	pop bc
	ld a, $1
	call Func_10ee
	ret

Func_1939: ; 1939 (0:1939)
	ld a, [wd4fc]
	ld hl, Pointers_1943
	call JumpTable
	jp [hl]

Pointers_1943::
	dw Func_19b3
	dw Func_68000
	dw Func_6804c
	dw Func_68103
	dw Func_681d7
	dw Func_68290
	dw Func_6839c
	dw Func_683f0
	dw Func_68444
	dw Func_68497
	dw Func_68598
	dw Func_686f2
	dw Func_6877a
	dw Func_687e1
	dw Func_68829
	dw Func_688c9
	dw Func_6890e
	dw Func_68a2d
	dw Func_68bc7
	dw Func_68d43
	dw Func_68e59
	dw Func_68ebf
	dw Func_68f25
	dw Func_68f8b
	dw Func_68fdc
	dw Func_69042
	dw Func_690a8
	dw Func_69133
	dw Func_6921d
	dw Func_692eb
	dw Func_693cd
	dw Func_694af
	dw Func_695c7
	dw Func_696c8
	dw Func_6974c
	dw Func_69828
	dw Func_69913
	dw Func_69961
	dw Func_699e5
	dw Func_69a69
	dw Func_69acb
	dw Func_69cd0
	dw Func_69f99
	dw Func_6a15a
	dw Func_6a35e
	dw Func_6a401
	dw Func_6a618
	dw Func_6a774
	dw Func_6a954
	dw Func_6ab1e
	dw Func_6ab5e
	dw Func_6ac98
	dw Func_6ad72
	dw Func_6aea7
	dw Func_6afdc
	dw Func_6b1ad

Func_19b3::
	ld a, $17
	ld [wd401], a
	ret

Func_19b9: ; 1939 (0:1939)
	ld a, [wd4fc]
	ld hl, Pointers_19c3
	call JumpTable
	jp [hl]

Pointers_19c3::
	dw Func_6c000
	dw Func_6c082
	dw Func_6c11b
	dw Func_6c1b4
	dw Func_6c21d
	dw Func_6c27e
	dw Func_6c27e
	dw Func_6c556
	dw Func_6c676
	dw Func_6c6d4
	dw Func_6c732
	dw Func_6c790
	dw Func_6c8f7
	dw Func_6ca8c
	dw Func_6cc6a
	dw Func_6ce90
	dw Func_6d0d3
	dw Func_6d30d
	dw Func_6d462
	dw Func_6d5aa
	dw Func_6d6ff
	dw Func_6d6ff
	dw Func_6dc84
	dw Func_6dd4b
	dw Func_6e0f1
	dw Func_6e304
	dw Func_6e457
	dw Func_6e5af
	dw Func_6e733
	dw Func_6e853
	dw Func_6e94a
	dw Func_6ec18
	dw Func_6eec0
	dw Func_6c082
	dw Func_6c082

Func_1a09: ; 1a09 (0:1a09)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s1_a000)
	ld [MBC3SRamBank], a
	ld hl, s1_a000
	ld bc, s1_b000 - s1_a000
.asm_1a19
	ld a, $fe
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_1a19
	ld de, s1_a000
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_a200
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_a400
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_a600
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_a800
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_aa00
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_ac00
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	ld de, s1_ae00
	ld hl, Data_1a86
	ld bc, $8
	call CopyData
	xor a
	ld [MBC3SRamEnable], a
	ret

Data_1a86::
	db $01
	db $00
	db $01
	db $02
	db $21
	db $02
	db $41
	db $02

Func_1a8e::
	sla c
	rl b
	sla c
	rl b
	ld hl, Data_2e8fa
	add hl, bc
	ld de, wc9e1
	ld c, $4
.asm_1a9f
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_2e8fa)
	rst Bankswitch
	ld b, [hl]
	pop af
	rst Bankswitch
	ld a, b
	ld [de], a
	inc hl
	inc de
	dec c
	jr nz, .asm_1a9f
	ld a, $e0
	ld [de], a
	ld hl, VTilesBG + $40 tiles
	ld b, $4
	call $5a06
	ld de, wc9e1
	ld b, $4
	ld hl, VTilesBG + $40 tiles
	jp Func_0560

Func_1ac6::
	ld de, VTilesBG + $40 tiles
	jr asm_1ace

Func_1acb::
	ld de, VTilesBG
asm_1ace
	push de
	ld a, PHONE_GFX
	rst Bankswitch
	ld a, [wCurPhoneGFX]
	ld e, a
	ld d, $0
	sla e
	rl d
	ld hl, Pointers_1aea
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop de
	ld bc, $20 tiles
	jp WaitStatCopy

Pointers_1aea::
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Func_1afc::
	ld c, a
	ld hl, wcd70
	ld b, $8
.asm_1b02
	ld a, [hl]
	cp c
	jr z, .asm_1b0f
	ld de, $4
	add hl, de
	dec b
	jr nz, .asm_1b02
	jr .asm_1b25

.asm_1b0f
	ld a, b
	dec a
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	push hl
	ld de, $4
	add hl, de
	pop de
	call CopyData
.asm_1b25
	ld hl, wcd90
	ld b, $8
.asm_1b2a
	ld a, [hl]
	cp c
	jr z, .asm_1b36
	ld de, $4
	add hl, de
	dec b
	jr nz, .asm_1b2a
	ret

.asm_1b36
	ld a, b
	dec a
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	push hl
	ld de, $4
	add hl, de
	pop de
	call CopyData
	ret

Func_1b4d: ; 1b4d (0:1b4d)
	xor a
	ld [wcb20], a
	ld hl, Data_a6b69
	ld b, $e
.asm_1b56
	push bc
	push hl
	call Func_1b77
	cp $0
	jr z, .asm_1b72
	ld a, [wcb20]
	inc a
	ld [wcb20], a
	pop hl
	ld de, $e
	add hl, de
	pop bc
	dec b
	jr nz, .asm_1b56
	ld c, $1
	ret

.asm_1b72
	pop hl
	pop bc
	ld c, $0
	ret

Func_1b77: ; 1b77 (0:1b77)
	ld b, $e
	ld de, wd200
.asm_1b7c
	push bc
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	cp b
	jr nz, .asm_1b8b
	pop bc
	dec b
	jr nz, .asm_1b7c
	ld a, $0
	ret

.asm_1b8b
	pop bc
	ld a, $1
	ret

Func_1b8f::
	ld a, $1
	jr asm_1b95

Func_1b93::
	ld a, $0
asm_1b95
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

LoadWildBattleBackgroundGFX_: ; 1b9c (0:1b9c)
	ld d, a
	ld a, WILD_BG_GFX
	rst Bankswitch
	ld e, $0
	sla e
	rl d
	ld hl, WildBG_001
	add hl, de
	ld de, VTilesBG tile $e
	ld bc, WildBG_002 - WildBG_001
	jp WaitStatCopy

Func_1bb3::
	ld de, VTilesShared
	jr asm_1bbb

Func_1bb8::
	ld de, VTilesBG tile $20
asm_1bbb
	push de
	ld d, a
	ld a, BANK(WildBG_008)
	rst Bankswitch
	ld e, $0
	sla e
	rl d
	ld hl, WildBG_008
	add hl, de
	pop de
	ld bc, WildBG_009 - WildBG_008
	jp WaitStatCopy

Func_1bd1::
	xor a
	ld [hFFA2], a
	ld [wcfc0], a
	ld [rNR12], a
	ld a, $ff
	ld [rNR13], a
	ld a, $87
	ld [rNR14], a
	ret

Func_1be2: ; 1be2 (0:1be2)
	ld a, [wc3e0]
	ld hl, Pointers_1bf4
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_1bf4::
	dw Func_1c14
	dw Func_1c1d
	dw Func_1c26
	dw Func_1c2f
	dw Func_1c38
	dw Func_1c41
	dw Func_1c4a
	dw Func_1c53
	dw Func_1c5c
	dw Func_1c65
	dw Func_1c6e
	dw Func_1c77
	dw Func_1c77
	dw Func_1c80
	dw Func_1c89
	dw Func_1c92

Func_1c14::
	ld a, BANK(Func_9300)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_9300

Func_1c1d::
	ld a, BANK(Func_893f)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_893f

Func_1c26::
	ld a, BANK(Func_8000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8000

Func_1c2f::
	ld a, BANK(Func_10000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_10000

Func_1c38::
	ld a, BANK(Func_80bf)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_80bf

Func_1c41::
	ld a, $b
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_1ea1

Func_1c4a::
	ld a, BANK(Func_70000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_70000

Func_1c53::
	ld a, BANK(Func_1441b)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_1441b

Func_1c5c::
	ld a, BANK(Func_74000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_74000

Func_1c65::
	ld a, BANK(Func_8b8b)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8b8b

Func_1c6e::
	ld a, BANK(Func_8b24)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8824

Func_1c77::
	ld a, BANK(Func_105c0)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_105c0

Func_1c80::
	ld a, BANK(Func_84cf)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_84cf

Func_1c89::
	ld a, BANK(Func_858e)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_858e

Func_1c92::
	ld a, BANK(Func_7c000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_7c000

Func_1c9b: ; 1c9b (0:1c9b)
	ld a, [wdc05]
	and a
	ret z
	ld a, [wdc04]
	and a
	ret nz
	ld a, [wdc00]
	and a
	ret z
	ld a, [wdc04]
	and a
	ret nz
	ld a, $81
	ld [rSC], a
	ret

Serial: ; 1cb4 (0:1cb4)
	push af
	push bc
	push de
	push hl
	xor a
	ld [wdc07], a
	ld a, [wdc05]
	cp $2
	jr z, .asm_1cfb
	ld a, [rSB]
	cp $b2
	jr z, .asm_1cdc
	cp $fd
	jr z, .asm_1ce8
	xor a
	ld [wdc00], a
	ld a, $ff
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jp Func_1d1e

.asm_1cdc
	ld a, $2
	ld [wdc05], a
	ld a, $1
	ld [wdc00], a
	jr .asm_1cf1

.asm_1ce8
	ld a, $2
	ld [wdc05], a
	xor a
	ld [wdc00], a
.asm_1cf1
	xor a
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jp Func_1d1e

.asm_1cfb
	ld a, $1
	ld [wdc04], a
	ld a, [rSB]
	ld [wdc11], a
	ld a, [wdc27]
	ld [rSB], a
	ld bc, $20
	call Func_1d57
	ld a, $80
	ld [rSC], a
	xor a
	ld [wdc04], a
	call Func_1da5
	call Func_1d84
Func_1d1e: ; 1d1e (0:1d1e)
	pop hl
	pop de
	pop bc
	pop af
	reti

InitSerialData: ; 1d23 (0:1d23)
	ld hl, wda00
	ld bc, $300
	call ClearMemory3
	ld a, $ff
	ld [rSB], a
	ld [wdc06], a
	ld a, $80
	ld [rSC], a
	ret

Func_1d38::
	ld a, $1
	ld [wdc01], a
	ld a, $fd
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

Func_1d46: ; 1d46 (0:1d46)
	ld a, [wdc05]
	and a
	ret nz
	ld a, $b2
	ld [rSB], a
	ld [wdc06], a
	ld a, $80
	ld [rSC], a
	ret

Func_1d57::
.asm_1d57
	dec bc
	ld a, b
	or c
	jr nz, .asm_1d57
	ret
	ld hl, wdb00
	ld bc, $100
	jp ClearMemory3

Func_1d66: ; 1d66 (0:1d66)
	di
	ld a, $1
	ld [wdc3e], a
	ld a, [wdc3a]
	ld l, a
	ld h, $da
	ld a, [wdc34]
	ld [hl], a
	inc l
	or a
	jr z, .asm_1d82
	ld a, l
	ld [wdc3a], a
	xor a
	ld [wdc34], a
.asm_1d82
	ei
	ret

Func_1d84::
	ld a, [wdc3e]
	and a
	jr z, .asm_1da0
	xor a
	ld [wdc3e], a
	ld a, [wdc3c]
	ld l, a
	ld h, $da
	ld a, [hl]
	inc l
	ld [wdc27], a
	or a
	ret z
	ld a, l
	ld [wdc3c], a
	ret

.asm_1da0
	xor a
	ld [wdc27], a
	ret

Func_1da5::
	ld a, $1
	ld [wdc43], a
	ld a, [wdc3f]
	ld l, a
	ld h, $db
	ld a, [wdc11]
	ld [hl], a
	inc l
	or a
	ret z
	ld a, l
	ld [wdc3f], a
	ret

Func_1dbc: ; 1dbc (0:1dbc)
	di
	ld a, [wdc43]
	and a
	jr z, .asm_1ddb
	xor a
	ld [wdc43], a
	ld a, [wdc41]
	ld l, a
	ld h, $db
	ld a, [hl]
	inc l
	ld [wdc2e], a
	or a
	jr z, .asm_1dd9
	ld a, l
	ld [wdc41], a
.asm_1dd9
	ei
	ret

.asm_1ddb
	xor a
	ld [wdc2e], a
	ei
	ret

Pointers_1de1:
	dw $0000
	dw UnknownTZFile01
	dw UnknownTZFile02
	dw UnknownTZFile03
	dw UnknownTZFile04
	dw UnknownTZFile05
	dw UnknownTZFile06
	dw UnknownTZFile07
	dw UnknownTZFile08
	dw UnknownTZFile09
	dw UnknownTZFile10
	dw UnknownTZFile11
	dw UnknownTZFile12
	dw UnknownTZFile13
	dw UnknownTZFile14
	dw UnknownTZFile15
	dw UnknownTZFile16
	dw UnknownTZFile17
	dw UnknownTZFile18
	dw UnknownTZFile19
	dw UnknownTZFile20
	dw UnknownTZFile21
	dw UnknownTZFile22
	dw UnknownTZFile23
	dw UnknownTZFile24
	dw UnknownTZFile25
	dw UnknownTZFile26
	dw UnknownTZFile27
	dw $0000
	dw UnknownTZFile29
	dw UnknownTZFile30
	dw UnknownTZFile31
	dw UnknownTZFile32
	dw UnknownTZFile33
	dw UnknownTZFile34
	dw UnknownTZFile35
	dw UnknownTZFile36
	dw UnknownTZFile37
	dw UnknownTZFile38
	dw UnknownTZFile39
	dw UnknownTZFile40
	dw UnknownTZFile41
	dw UnknownTZFile42
	dw UnknownTZFile43
	dw UnknownTZFile44
	dw $0000
	dw $0000
	dw $0000
	dw UnknownTZFile48
	dw UnknownTZFile49
	dw UnknownTZFile50
	dw UnknownTZFile51
	dw UnknownTZFile52
	dw UnknownTZFile53
	dw UnknownTZFile54
	dw UnknownTZFile55
	dw UnknownTZFile56
	dw UnknownTZFile57
	dw UnknownTZFile58
	dw UnknownTZFile59
	dw UnknownTZFile60
	dw UnknownTZFile61
	dw UnknownTZFile62
	dw UnknownTZFile63
	dw UnknownTZFile64
	dw UnknownTZFile65
	dw UnknownTZFile66
	dw UnknownTZFile67
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw UnknownTZFile72
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw $0000
	dw UnknownTZFile80
	dw UnknownTZFile81
	dw UnknownTZFile82
	dw $0000
	dw UnknownTZFile84
	dw UnknownTZFile85
	dw UnknownTZFile86
	dw UnknownTZFile87
	dw UnknownTZFile88
	dw UnknownTZFile89
	dw UnknownTZFile90
	dw UnknownTZFile91
	dw $0000
	dw $0000
	dw $0000
	dw $0000

Func_1ea1: ; 1ea1 (0:1ea1)
	ld a, [wc3e1]
	cp $0
	jr z, .asm_1ee2
	cp $a
	jr z, .asm_1ee2
	cp $2e
	jp z, Func_1f6a
	ld a, [wc98e]
	or a
	jr nz, .asm_1ee2
	homecall Func_a5060, Func_a50be, Func_a4e47, Func_a4ba4, Func_a5245, Func_a54a2
	callba Func_2c904
	callba Func_2e4b2
.asm_1ee2
	call Func_1f24
	homecall Func_2e064
	ld a, [wc98e]
	or a
	ret nz
	ld a, [rLY]
	cp $64
	call c, Func_34dc
	ld a, [wc3e1]
	cp $4
	jr z, .asm_1f07
	cp $5
	ret nz
.asm_1f07
	ret

Func_1f08: ; 1f08 (0:1f08)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a4fcd)
	rst Bankswitch
	ld a, $1
	ld [wc936], a
	ld a, [wc938]
	inc a
	ld [wc938], a
	call Func_a4fcd
	call Func_a4fe5
	pop af
	rst Bankswitch
	ret

Func_1f24: ; 1f24 (0:1f24)
	ld a, [wc918]
	or a
	jr z, .asm_1f36
	dec a
	ld [wc918], a
	xor a
	ld [hJoyLast], a
	ld [hJoyNew], a
	ld [wJoyNew], a
.asm_1f36
	call Func_3880
	call Func_200a
	call Func_2021
	call Func_1f80
	homecall Func_3c000
	homecall Func_2ddd9
	ld a, [wc984]
	inc a
	ld [wc984], a
	jr nz, Func_1f6a
	ld a, [wca6f]
	inc a
	ld [wca6f], a

Func_1f6a: ; 1f6a (0:1f6a)
	callba Func_2e589
	ld a, [wPrevROMBank]
	rst Bankswitch
	ld h, d
	ld l, e
	jp [hl]
.asm_1f79
	ld a, [rSTAT]
	and $2
	jr nz, .asm_1f79
	ret

Func_1f80: ; 1f80 (0:1f80)
	call Func_2107
	ret nz
	ld a, [wc49a]
	cp $0
	ret nz
	homecall Func_a501e
	ld a, [hJoyNew]
	and $8
	cp $8
	jp nz, Func_1fca
	ld a, [wc9de]
	or a
	jr nz, Func_1fca
	xor a
	ld [wca5d], a
	call Func_2411
	ld b, $c
	ld a, [wc904]
	cp $a
	jr c, .asm_1fbe
	ld a, [wc904]
	cp $b
	jr z, .asm_1fbe
	ld b, $12
.asm_1fbe
	call Func_1fff
	ld a, b
	ld [wc3e1], a
	ld a, $4
	jp Func_122d

Func_1fca: ; 1fca (0:1fca)
	ld a, [hJoyNew]
	and $4
	jr z, .asm_1ffe
	ld a, [wc935]
	or a
	jr nz, .asm_1ffe
	ld a, [wc904]
	ld [wc926], a
	ld a, [wc906]
	ld [wc927], a
	callba Func_c97d2
	call Func_20f6
	call Func_1fff
	ld a, $17
	ld [wc3e1], a
	xor a
	ld [wca5d], a
	ld a, $4
	jp Func_122d

.asm_1ffe
	ret

Func_1fff: ; 1fff (0:1fff)
	ld a, $0
	ld [wc94f], a
	ld [wcad0], a
	jp Func_342a

Func_200a: ; 200a (0:200a)
	call Func_2107
	ret nz
	ld a, [wcdb6]
	or a
	ret z
	add $a1
	ld c, a
	ld b, $0
	call Func_33c9
	ld a, $0
	ld [wcdb6], a
	ret

Func_2021: ; 2021 (0:2021)
	ld a, [wc91d]
	or a
	jp nz, Func_20b1
	ld a, [wc904]
	cp $b
	ret z
	cp $32
	jr nc, .asm_2041
	cp $2b
	ret nc
	ld a, [wc905]
	cp $2
	ret z
	cp $4
	ret z
	cp $c
	ret nc
.asm_2041
	ld a, [wc94f]
	or a
	ret nz
	call Func_2107
	ret nz
	ld a, [wc49a]
	or a
	ret nz
	ld a, [wc98f]
	or a
	ret z
	ld a, [wcdb2]
	or a
	ret nz
	homecall Func_a8788
	ld a, b
	or a
	ret nz
	ld a, [wc951]
	ld h, a
	ld a, [wc950]
	ld l, a
	ld bc, $1
	ld a, [hJoyLast]
	and $2
	jr z, .asm_207c
	ld bc, $2
.asm_207c
	add hl, bc
	ld a, [wca5e]
	cp $1
	jr nz, .asm_2087
	add hl, bc
	add hl, bc
	add hl, bc
.asm_2087
	ld a, h
	ld [wc951], a
	ld a, l
	ld [wc950], a
	ld bc, -$320
	add hl, bc
	bit 7, h
	jr nz, asm_20f5
	homecall Func_a85e5
	ld a, b
	ld [wd402], a
	ld a, $0
	ld [wd406], a
	ld a, $0
	ld [wd403], a
Func_20b1: ; 20b1 (0:20b1)
	call Func_20f6
	ld a, [wc3e1]
	cp $5
	ret z
	call Func_30a7
	and $3
	ld b, a
	homecall Func_c9868
	ld a, $0
	ld [wc9d9], a
	ld [wc91d], a
	ld a, $6
	ld [wc3e1], a
	ld a, $1
	ld [wc917], a
	call GetMusicBank
	ld [hFFA0], a
	ld a, $0
	ld [wca5d], a
	ld a, $0
	ld [wc950], a
	ld [wc951], a
	call Func_2411
	add sp, $2
asm_20f5
	ret

Func_20f6: ; 20f6 (0:20f6)
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a8663)
	rst Bankswitch
	call Func_a8663
	ld a, b
	ld [wc9da], a
	pop af
	rst Bankswitch
	ret

Func_2107: ; 2107 (0:2107)
	ld a, [wcd00]
	or a
	jr nz, .asm_2121
	ld a, [wc3e1]
	cp $4
	jr nz, .asm_2121
	ld a, [wc98e]
	or a
	jr nz, .asm_2121
	ld a, [wc900]
	cp $1
	jr nz, .asm_2121
.asm_2121
	ret

Func_2122::
	ld hl, $8000
	ld de, Func_1ea1
	ld bc, $1800
	call Func_3801
	ld a, $a
	ld [wc3e1], a
	ret

Func_2134::
	ld bc, $180
	ld hl, wc980
.asm_213a
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_213a
	ld a, $0
	ld [wcd20], a
	ld a, $0
	ld [wca5d], a
	ld a, $0
	ld [wcd21], a
	ld a, [wc92a]
	ld b, a
	ld a, [wc92b]
	ld c, a
	ld a, [wc3c0]
	ld b, a
	ld a, [wc922]
	add b
	ld [wc922], a
	ld a, [wc923]
	add b
	ld [wc923], a
	homecall Func_a52b2
	ld a, $0
	ld [wcdb1], a
	call Func_24f6
	call Func_2264
	call Func_3252
	call Func_0985
	homecall Func_c96ba
	callba Func_3d00e
	ld a, $c
	ld [wPrevROMBank], a
	ld a, BANK(Func_3394e)
	rst Bankswitch
	call Func_3394e
	call Func_3395
	call Func_225b
	ld a, $4
	ld [wc3e1], a
	ld b, $3
.asm_21b3
	push bc
	homecall Func_3c00c
	call Func_236c
	homecall Func_30000
	pop bc
	dec b
	jr nz, .asm_21b3
	ld a, $0
	ld [wc3e1], a
	jp Func_0ea3

Func_21db::
	ld a, $0
	ld [wc947], a
	ld [wcd20], a
	ld [wca5d], a
	call Func_2264
	call Func_3255
	call Func_241e
	ld a, $0
	ld [wc9cf], a
	ld [wc956], a
	ld [wcd21], a
	ld a, [wc900]
	cp $3
	jr nz, .asm_2213
	ld a, $0
	ld [wc496], a
	ld [wc495], a
	ld a, $10
	ld [wc49a], a
	ld a, $1
	ld [wc900], a
.asm_2213
	cp $8
	jr nz, .asm_221c
	ld a, $0
	ld [wc4ba], a
.asm_221c
	call Func_3395
	call Func_225b
	ld a, $ff
	ld [wc9f5], a
	call Func_31c5
	ld a, BANK(Func_30240)
	rst Bankswitch
	ld a, $ff
	ld [wca51], a
	call Func_30240
	ld a, $4
	ld [wc3e1], a
	call Func_236c
	homecall Func_30000
	ld a, $1
	ld [wc3e1], a
	homecall Func_3c00c
	ret

Func_225b: ; 225b (0:225b)
	xor a
	ld [hJoyLast], a
	ld [hJoyNew], a
	ld [wJoyNew], a
	ret

Func_2264: ; 2264 (0:2264)
	call Func_2793
	ld a, $5e
	ld [wc9ee], a
	callba Func_2e0d2
	call Func_3388
	call Func_37d5
	ld a, $0
	ld [wc9de], a
	ld [wc935], a
	ld [wc91a], a
	ld a, [wc904]
	cp $b
	jr nz, .asm_2296
	ld a, $1
	ld [wc9de], a
	ld a, $1
	ld [wc935], a
.asm_2296
	ld a, [wc904]
	cp $32
	jr nc, .asm_22a6
	cp $2b
	jr c, .asm_22a6
	ld a, $1
	ld [wc9de], a
.asm_22a6
	call Func_35e0
	homecall Func_a4f6f, Func_a502a
	ld a, $0
	ld [wcad0], a
	ld a, $c
	ld [wPrevROMBank], a
	rst Bankswitch
	ld a, [wcd00]
	or a
	jp nz, Func_22d2
	ld hl, wcd00
	ld b, $20
	call Func_2f76
Func_22d2: ; 22d2 (0:22d2)
	call Func_32ff
	ld a, $e3
	ld [wLCDC], a
	ld a, $7
	ld [wc3c4], a
	ld a, $80
	ld [wc3c5], a
	ld a, $0
	ld [wc95a], a
	ld a, [wc912]
	ld [wd409], a
	call Func_05d1
	ld a, [wd409]
	ld [wc9db], a
	xor a
	ld [wc952], a
	ld c, $8
	ld hl, wca48
.asm_2301
	ld [hli], a
	dec c
	jr nz, .asm_2301
	ld a, [wc905]
	cp $4
	jr nz, .asm_231a
	ld bc, $448
	call CheckEventFlag
	ret z
	ld bc, $210
	call CheckEventFlag
	ret nz
.asm_231a
	call Func_3435
	ret

Func_231e::
	call Func_33a2
	ld a, $1
	ld [wc430], a
	jp Func_0ea3

Func_2329::
	ld a, $e0
	ld [wc91e], a
	call Func_3566
	ld a, $1
	ld [wcd20], a
	ld a, [wc958]
	or a
	jr z, .asm_234b
	ld a, [wc904]
	ld [wca69], a
	callba Func_c99ac
	ret

.asm_234b
	ld a, $5
	call Func_122d
	jp Func_0ea3

Func_2353::
	ld a, $1
	ld [wc430], a
	ld a, $0
	call Func_1248
	or a
	ret z
	ld a, [wc9cf]
	or a
	jp z, Func_0ea3
	ld a, $5
	ld [wc3e1], a
	ret

Func_236c: ; 236c (0:236c)
	ld a, BANK(Func_38f8d)
	ld [wPrevROMBank], a
	ld a, [wc49b]
	ld b, a
	ld a, [wc483]
	sub b
	ld [wc483], a
	ld a, [wc49c]
	ld b, a
	ld a, [wc484]
	sub b
	ld [wc484], a
	homecall Func_38f8d
	ld a, [wc3e1]
	cp $4
	jr nz, .asm_23bc
	ld a, [wc49b]
	ld b, a
	ld a, [wc483]
	add b
	ld [wc483], a
	ld a, [wc49c]
	ld b, a
	ld a, [wc484]
	add b
	ld [wc484], a
	homecall Func_30000
.asm_23bc
	rst MemBankswitch
	ld a, $1
	ld [wc430], a
	ret

Func_23c3::
	call Func_23e2
	ld a, $6
	ld [wc3e0], a
	ld a, $0
	ld [wc3e1], a
	ret

Func_23d1::
	call Func_2411
	call Func_23e2
	ld a, $c
	ld [wc3e0], a
	ld a, $0
	ld [wc3e1], a
	ret

Func_23e2: ; 23e2 (0:23e2)
	ld a, [wc483]
	ld [wc901], a
	ld a, [wc484]
	ld [wc902], a
	ld a, $7
	ld [wc3c4], a
	ld a, $90
	ld [wc3c5], a
	ld hl, wc9fc
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $0
	ld [wc3c2], a
	ld a, $0
	ld [wc3c3], a
	ld a, $1
	ld [wc430], a
	ret

Func_2411: ; 2411 (0:2411)
	homecall Func_2df1e
	ret

Func_241e: ; 241e (0:241e)
	homecall Func_2df55
	ret

Func_242b::
	homecall Func_2c100
	ld a, [wc9c9]
	cp $9
	jr nz, .asm_2464
	ld a, $4
	ld [wc3e1], a
	ld a, [wc900]
	cp $4
	jr nz, .asm_2464
	ld a, $2
	ld [wcad0], a
	callba Func_2ccb9
	call Func_2411
	ld a, $24
	ld [wc3e1], a
	ld a, $4
	jp Func_122d

.asm_2464
	ret

Func_2465::
	homecall Func_c9875
	ld a, $1
	ld [wc430], a
	ld a, [wca6b]
	cp $1
	jr nz, .asm_2481
	ld a, $50
	ld [hFFA1], a
.asm_2481
	cp $ff
	ret nz
	ld a, [wca69]
	or a
	jr nz, .asm_24a5
	ld bc, $1
	call GetCGB_BGLayout_
	ld bc, $f
	call GetCGB_OBLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	ld [wca69], a
	call BlackDMGPals
	ret

.asm_24a5
	ld a, $0
	ld [wc917], a
	jp Func_23c3

Func_24ad::
	ld a, $1
	call Func_1248
	or a
	ret z
	call Func_2793
	homecall Func_c981a
	ld a, $0
	ld [wc3e1], a
	ret

Func_24c9::
	ld a, $1
	call Func_1248
	or a
	ret z
	ld a, $0
	ld [wc917], a
	jp Func_23d1

Func_24d8::
	ld a, $1
	call Func_1248
	or a
	ret z
	ld a, $b
	ld [wc3e0], a
	xor a
	ld [wc3e1], a
	ld a, [wLCDC]
	res 5, a
	ld [wLCDC], a
	ld a, $0
	ld [wc917], a
	ret

Func_24f6: ; 24f6 (0:24f6)
	homecall Func_c9538
	ret

Func_2503::
	ld a, $1
	ld [wc430], a
	ret

Func_2509::
	homecall Func_c8000
	ret

Data_2516::
x = 0
REPT 10
	dw x
x = x + 10
ENDR

Func_252a: ; 252a (0:252a)
	push af
	ld a, c
	ld hl, Data_255a
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	sla e
	rl d
	ld a, [wc9fc]
	ld l, a
	ld a, [wc9fd]
	ld h, a
	add hl, de
	call Func_32f7
	ld a, l
	sla b
	add b
	and $1f
	ld b, a
	ld a, l
	and $e0
	or b
	ld l, a
	pop af
	call Func_328d
	ret

Data_255a::
x = 0
REPT 10
	dw x
x = x + $20
ENDR

Func_256e::
	ld a, [wc49a]
	cp $0
	jp nz, Func_2690
	call Func_26b1
	ld a, [hJoyNew]
	and $1
	jp z, Func_2690
	ld a, [wc499]
	bit 2, a
	jp nz, Func_26ff
	ld a, [wc9c1]
	or a
	jp z, Func_2690
	ld a, [wc9c2]
	cp $14
	jr z, .asm_259a
	cp $11
	jr nz, .asm_260e
.asm_259a
	ld bc, $1de
	call CheckEventFlag
	jp z, Func_2691
	callba Func_31843
	ld a, b
	or a
	jp z, Func_2690
	ld a, $0
	ld [wc9c1], a
	ld a, [wc499]
	set 2, a
	ld [wc499], a
	callba Func_31600
	callba Func_3162e
	ld a, $9
	ld [wc49a], a
	ld a, $0
	ld [wc493], a
	ld hl, Data_2698
	ld a, [wc497]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wc9f4], a
	call Func_30a7
	cp $40
	jr nc, .asm_25fe
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	callba Func_320e1
.asm_25fe
	callba Func_c97d2
	ld a, $1
	ld [wc953], a
	jp Func_2690

.asm_260e
	ld a, [wc9c2]
	cp $13
	jr nz, .asm_2665
	call Func_1fff
	ld a, $13
	ld [hFFA1], a
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	ld a, [wc9c0]
	ld l, a
	ld a, [wc9c1]
	ld h, a
	ld a, [hl]
	inc a
	ld [hl], a
	call Func_252a
	ld a, $0
	ld [wc9c1], a
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	call Func_28a9
	jr nz, .asm_264f
	ld a, $b
	ld [wc49a], a
	ld a, $20
	ld [wc493], a
	ret

.asm_264f
	ld a, $b
	ld [wc49a], a
	ld a, $b8
	ld [wc493], a
	ld a, [wcd00]
	or a
	jr z, .asm_2664
	ld a, $8
	ld [wc493], a
.asm_2664
	ret

.asm_2665
	cp $15
	jr nz, Func_2690
	call Func_2809
	jr nz, Func_2690
	ld a, [wc9c0]
	ld l, a
	ld a, [wc9c1]
	ld h, a
	ld a, [hl]
	or $1
	ld [hl], a
	push af
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	pop af
	call Func_252a
	ld a, $0
	ld [wc9c1], a
	ld a, $13
	ld [hFFA1], a
Func_2690: ; 2690 (0:2690)
	ret

Func_2691: ; 2691 (0:2691)
	ld b, $0
	ld c, $9b
	jp Func_33c9

Data_2698::
	db $2c
	db $29
	db $2c
	db $26
	db $fa
	db $c3
	db $c9
	db $47

Func_26a0::
	ld a, [wc9c4]
	ld c, a
	ld a, [wc9c0]
	ld l, a
	ld a, [wc9c1]
	ld h, a
	ld a, d
	ld [hl], a
	jp Func_252a

Func_26b1: ; 26b1 (0:26b1)
	ld a, [wc98f]
	or a
	jr z, .asm_26f1
	ld a, [wc9c1]
	or a
	jr z, .asm_26f1
	ld a, [wc9c2]
	cp $12
	jr nz, .asm_26f1
	ld a, $1c
	ld [wcdb2], a
	ld a, [wc9fe]
	inc a
	ld [wc9fe], a
	cp $1c
	jr c, Func_2690
	ld bc, $1df
	call CheckEventFlag
	jr z, .asm_26f6
	callba Func_31e97
	callba Func_c97d2
	ld a, $1
	ld [wc953], a
.asm_26f1
	xor a
	ld [wc9fe], a
	ret

.asm_26f6
	ld b, $0
	ld c, $9a
	call Func_33c9
	jr .asm_26f1

Func_26ff: ; 26ff (0:26ff)
	ld a, [wcadb]
	or a
	jr nz, asm_272e
	ld hl, Data_2698
	ld a, [wc497]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	sub $2
	ld a, a
	ld [wc9f4], a
	ld a, $11
	ld [wc49a], a
	ld a, $c
	ld [wc493], a
	ld a, $68
	ld [hFFA1], a
Func_2726::
	ld a, [wc499]
	res 2, a
	ld [wc499], a
asm_272e
	ret

Func_272f::
	ld a, [wc905]
	ld hl, Data_2760
	ld b, a
	add a
	add b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wc9ec], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wROMBank]
	push af
	ld a, $67
	rst Bankswitch
	push de
	ld a, [wc903]
	ld b, $0
	ld c, a
	ld de, $50
	push hl
	call Multiply_DE_by_BC
	pop hl
	add hl, de
	pop de
	pop af
	rst Bankswitch
	ret

Data_2760::
	dbw $68, $4000
	dbw $69, $4000
	dbw $68, $4000
	dbw $69, $4000
	dbw $69, $4000
	dbw $69, $4000
	dbw $64, $4000
	dbw $6a, $4000
	dbw $6a, $4000
	dbw $66, $4000
	dbw $65, $4000
	dbw $64, $4000
	dbw $64, $4000
	dbw $64, $4000
	dbw $64, $4000
	dbw $64, $4000
	dbw $63, $4000

Func_2793: ; 2793 (0:2793)
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	ld a, [wc904]
	ld b, a
	add a
	add b
	ld hl, Pointers_19c000
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wc905], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc906]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wc903], a
	ld a, [wc905]
	ld b, a
	call Func_27c7
	pop af
	rst Bankswitch
	ret

Func_27c7: ; 27c7 (0:27c7)
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_178000)
	rst Bankswitch
	ld hl, Data_178000
	ld a, b
	add a
	ld b, a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wc9f6], a
	ld a, [hl]
	ld [wc9f7], a
	ld hl, Data_178022
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wc9f8], a
	ld a, [hl]
	ld [wc9f9], a
	ld hl, Data_178044
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wc9fa], a
	ld a, [hl]
	ld [wc9fb], a
	pop af
	rst Bankswitch
	ret

Func_2809: ; 2809 (0:2809)
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	ld a, [wc9c3]
	ld [wc915], a
	ld a, [wc9c4]
	ld [wc916], a
	call Func_2a68
	jp z, Func_28a4
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	push hl
	ld hl, $fc00
	add hl, bc
	pop hl
	jr c, .asm_2882
	cp $ff
	jr nz, .asm_2839
	ld a, b
	cp $ff
	jr z, .asm_2894
.asm_2839
	call CheckEventFlag
	jr nz, .asm_287e
	ld a, [wc904]
	cp $a
	jr nz, .asm_284c
	ld a, [wc906]
	cp $1c
	jr z, .asm_2861
.asm_284c
	ld a, [wc904]
	cp $e
	jr z, .asm_2861
	ld a, [wc904]
	cp $f
	jr z, .asm_2861
	ld a, [wc904]
	cp $34
	jr nz, .asm_2882
.asm_2861
	ld a, [wcdec]
	or a
	jr z, .asm_2894
	dec a
	ld [wcdec], a
	call SetEventFlag
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2c63b)
	rst Bankswitch
	ld b, $0
	ld c, $bd
	call Func_2c63b
	pop af
	rst Bankswitch
.asm_287e
	pop af
	rst Bankswitch
	xor a
	ret

.asm_2882
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2c63b)
	rst Bankswitch
	ld b, $0
	ld c, $a8
	call Func_2c63b
	pop af
	rst Bankswitch
	jr Func_28a4

.asm_2894
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2c63b)
	rst Bankswitch
	ld b, $0
	ld c, $be
	call Func_2c63b
	pop af
	rst Bankswitch
Func_28a4: ; 28a4 (0:28a4)
	pop af
	rst Bankswitch
	or $1
	ret

Func_28a9: ; 28a9 (0:28a9)
	push bc
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_19e8ed)
	rst Bankswitch
	call Func_28dd
.asm_28b4
	ld a, [hli]
	cp $ff
	jr z, .asm_28d8
	call Func_28ee
	jr nz, .asm_28b4
	ld a, [de]
	and c
	jr nz, .asm_28d8
	ld a, [de]
	or c
	ld [de], a
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_32079)
	rst Bankswitch
	ld a, b
	call Func_32079
	pop af
	rst Bankswitch
	pop af
	rst Bankswitch
	pop bc
	or $1
	ret

.asm_28d8
	pop af
	rst Bankswitch
	pop bc
	xor a
	ret

Func_28dd: ; 28dd (0:28dd)
	ld hl, Data_19e8ed
	ld a, [wc904]
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

Func_28ee: ; 28ee (0:28ee)
	ld d, a
	ld a, [wc903]
	cp d
	jr nz, .asm_2922
	ld a, [hli]
	ld d, a
	and $f
	cp c
	jr nz, .asm_2923
	ld a, d
	swap a
	and $f
	cp b
	jr nz, .asm_2923
	ld a, [hli]
	ld b, a
	srl a
	srl a
	srl a
	ld de, wEventFlags
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, b
	ld c, $1
	and $7
	ld b, [hl]
	ret z
.asm_291c
	sla c
	dec a
	jr nz, .asm_291c
	ret

.asm_2922
	inc hl
.asm_2923
	inc hl
	inc hl
	or $1
	ret

Func_2928::
	ld a, [wROMBank]
	push af
	ld a, [wc9ee]
	rst Bankswitch
	ld hl, wca70
	ld a, $50
	ld [wFontSourceBank], a
.asm_2938
	ld b, [hl]
	ld a, [wc9fb]
	ld d, a
	ld a, [wc9fa]
	ld e, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	cp $13
	jr z, .asm_295e
	cp $15
	jr z, .asm_29a4
.asm_2951
	inc hl
	ld a, [wFontSourceBank]
	dec a
	ld [wFontSourceBank], a
	jr nz, .asm_2938
	pop af
	rst Bankswitch
	ret

.asm_295e
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_19e8ed)
	rst Bankswitch
	push bc
	push hl
	call Func_28dd
.asm_296a
	ld a, [hli]
	cp $ff
	jr z, .asm_299e
	push af
	ld a, [wROMBank]
	push af
	ld a, $b
	rst Bankswitch
	push hl
	ld a, [wFontSourceBank]
	ld c, a
	ld a, $50
	sub c
	ld c, a
	ld e, $a
	call $5a20
	ld b, e
	pop hl
	pop af
	rst Bankswitch
	pop af
	call Func_28ee
	jr nz, .asm_296a
	pop hl
	ld a, [de]
	and c
	jr nz, .asm_299b
	ld a, $1
	ld [wc94c], a
	jr .asm_299f

.asm_299b
	inc [hl]
	jr .asm_299f

.asm_299e
	pop hl
.asm_299f
	pop bc
	pop af
	rst Bankswitch
	jr .asm_2951

.asm_29a4
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	push bc
	push hl
	push af
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2da20)
	rst Bankswitch
	push hl
	ld a, [wFontSourceBank]
	ld c, a
	ld a, $50
	sub c
	ld c, a
	ld e, $a
	call Func_2da20
	ld a, e
	ld [wc915], a
	ld a, c
	ld [wc916], a
	pop hl
	pop af
	rst Bankswitch
	pop af
	call Func_2a68
	jr z, .asm_29e6
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	jr z, .asm_29e6
	pop hl
	ld a, [hl]
	or $1
	ld [hl], a
	jr .asm_29e7

.asm_29e6
	pop hl
.asm_29e7
	pop bc
	pop af
	rst Bankswitch
	jp .asm_2951

Func_29ed::
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	call Func_2a68
	jp z, Func_2a65
	ld a, [hli]
	ld [wc904], a
	ld [wc926], a
	ld a, [hli]
	ld [wc906], a
	ld [wc927], a
	ld a, [hl]
	ld b, a
	and $f
	ld [wc916], a
	inc a
	swap a
	ld [wc902], a
	ld [wc929], a
	ld a, b
	and $f0
	swap a
	ld [wc915], a
	swap a
	add $8
	ld [wc901], a
	ld [wc928], a
	ld a, [wc900]
	cp $2
	jr z, .asm_2a48
	ld a, [wcd00]
	or a
	jr nz, .asm_2a48
	ld a, [wc904]
	cp $b
	jr nz, .asm_2a44
	ld a, $13
	ld [hFFA1], a
	jr .asm_2a48

.asm_2a44
	ld a, $d
	ld [hFFA1], a
.asm_2a48
	ld a, $0
	ld [wc94f], a
	ld [wcad0], a
	ld [wcafe], a
	call Func_1bd1
	ld a, $0
	ld [wc947], a
	ld a, $7
	ld [wc3e1], a
	ld a, $5
	call Func_122d
Func_2a65: ; 2a65 (0:2a65)
	pop af
	rst Bankswitch
	ret

Func_2a68: ; 2a68 (0:2a68)
	ld a, [wc904]
	ld b, a
	add a
	add b
	ld hl, Pointers_19c000
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	inc hl
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, $40
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.loop
	ld de, $6
	ld a, [hli]
	cp $ff
	jr z, .done
	ld b, a
	ld a, [wc903]
	cp b
	jr nz, .next
	ld de, $5
	ld a, [hli]
	ld b, a
	swap a
	and $f
	ld c, a
	ld a, [wc915]
	cp c
	jr nz, .next
	ld a, b
	and $f
	ld c, a
	ld a, [wc916]
	cp c
	jr nz, .next
	or $1
	ret

.next
	add hl, de
	jr .loop

.done
	ret

Func_2ab3::
	homecall Func_2dd28
	ret

Func_2ac0::
	homecall Func_2dd41
	ret

Func_2acd::
	homecall Func_2dd5a
	ret

Func_2ada::
	homecall Func_2dd89
	ret

Func_2ae7::
	homecall Func_2dd9d
	ret

Func_2af4::
	homecall Func_2ddb1
	ret

Func_2b01::
	homecall Func_2ddc5
	ret

Func_2b0e::
	homecall Func_c8243
	ret

Func_2b1b::
	homecall Func_c8268
	ret

Func_2b28::
	ld e, a
	homecall Func_c8293
	ret

Func_2b36::
	ld e, a
	homecall Func_c82df
	ret

Multiply_DE_by_BC: ; 2b44 (0:2b44)
; de *= bc
	ld hl, 0
	ld a, $f
.loop
	sla e
	rl d
	jr nc, .next
	add hl, bc
.next
	add hl, hl
	dec a
	jr nz, .loop
	bit 7, d
	jr z, .done
	add hl, bc
.done
	ld d, h
	ld e, l
	ret

Multiply_C_by_E: ; 2b5c (0:2b5c)
	ld b, $0
	ld d, $0
	jp Multiply_DE_by_BC

Multiple_C_by_E_signed:
	xor a
	ld b, a
	ld d, a
	bit 7, c
	jr z, .asm_2b6b
	dec b
.asm_2b6b
	bit 7, e
	jr z, Multiply_DE_by_BC
	dec d
	jr Multiply_DE_by_BC

Func_2b72::
	call Func_272f
	ld a, [wROMBank]
	push af
	ld a, [wc9ec]
	rst Bankswitch
	ld de, wca70
	ld b, $50
.asm_2b82
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2b82
	pop af
	rst Bankswitch
	call Func_32ff
	ld a, $0
	ld [wc953], a
	ld [wc94c], a
	jp Func_2928

Func_2b98::
	ld b, $c
	ld hl, wOAMAnimation01
	ld de, $20
	xor a
.asm_2ba1
	ld [hl], a
	add hl, de
	dec b
	jr nz, .asm_2ba1
	jp Func_2726

Func_2ba9::
	ld a, [wc9ca]
	srl a
	ld c, a
	ld e, $a
	call Multiply_C_by_E
	ld hl, wca70
	add hl, de
	ld d, h
	ld e, l
	ld a, [wc9ca]
	ld c, $0
	srl a
	srl a
	rr c
	srl a
	rr c
	ld b, a
	jp Func_2bdc

Func_2bcd::
	ld bc, $0000
	ld de, wca70
	jp Func_2bdc

Func_2bd6::
	ld bc, $0100
	ld de, wca98
Func_2bdc: ; 2bdc (0:2bdc)
	ld a, [wc9fc]
	ld l, a
	ld a, [wc9fd]
	ld h, a
	add hl, bc
	call Func_32f7
	ld b, $4
.asm_2bea
	push bc
	push hl
	homecall Func_c82a9
	pop hl
	ld bc, $40
	add hl, bc
	call Func_32f7
	pop bc
	dec b
	jr nz, .asm_2bea
	ret

Func_2c05::
	ld a, [wROMBank]
	ld [wca52], a
	ld a, [wc9ee]
	rst Bankswitch
	ld a, [de]
	cp $3
	jr nz, asm_2c22
	push bc
	ld bc, $1d8
	call CheckEventFlag
	pop bc
	ld a, $3
	jr nz, asm_2c22
	ld a, $10
asm_2c22
	push af
	ld a, [wca52]
	rst Bankswitch
	pop af
	ret

Func_2c29::
	ld a, [wROMBank]
	ld [wca52], a
	ld a, [wc9ee]
	rst Bankswitch
	ld a, [hl]
	cp $3
	jr nz, asm_2c22
	push bc
	ld bc, $1d8
	call CheckEventFlag
	pop bc
	ld a, $3
	jr nz, .asm_2c46
	ld a, $10
.asm_2c46
	push af
	ld a, [wca52]
	rst Bankswitch
	pop af
	ret

CheckEventFlag: ; 2c4d (0:2c4d)
	push bc
	push hl
	call GetEventFlagAddressAndBit
	ld a, [hl]
	and c
	pop hl
	pop bc
	ret

SetEventFlag: ; 2c57 (0:2c57)
	push bc
	push hl
	call GetEventFlagAddressAndBit
	ld a, [hl]
	or c
asm_2c5e
	ld [hl], a
	pop hl
	pop bc
	ret

ToggleEventFlag::
	push bc
	push hl
	call GetEventFlagAddressAndBit
	ld a, [hl]
	xor c
	jr asm_2c5e

ResetEventFlag::
	push bc
	push hl
	call GetEventFlagAddressAndBit
	ld a, c
	cpl
	ld c, a
	ld a, [hl]
	and c
	jr asm_2c5e

GetEventFlagAddressAndBit: ; 2c77 (0:2c77)
	ld a, c
	srl b
	rr c
	srl b
	rr c
	srl b
	rr c
	ld hl, wEventFlags
	add hl, bc
	ld c, $1
	and $7
	jr z, .asm_2c93
.asm_2c8e
	sla c
	dec a
	jr nz, .asm_2c8e
.asm_2c93
	ret

Func_2c94::
	dr $2c94, $2f76

Func_2f76::
	dr $2f76, $30a7

Func_30a7::
	dr $30a7, $3171

Func_3171::
	dr $3171, $31c5

Func_31c5::
	dr $31c5, $3252

Func_3252::
	dr $3252, $3255

Func_3255::
	dr $3255, $328d

Func_328d::
	dr $328d, $32f7

Func_32f7::
	dr $32f7, $32ff

Func_32ff::
	dr $32ff, $3388

Func_3388::
	dr $3388, $3395

Func_3395::
	dr $3395, $33a2

Func_33a2::
	dr $33a2, $33c9

Func_33c9::
	dr $33c9, $342a

Func_342a::
	dr $342a, $3435

Func_3435::
	dr $3435, $3442

Func_3442::
	dr $3442, $34dc

Func_34dc::
	dr $34dc, $3566

Func_3566::
	dr $3566, $35e0

Func_35e0::
	dr $35e0, $37d5

Func_37d5::
	dr $37d5, $3801

Func_3801::
	dr $3801, $3869

Func_3869::
	dr $3869, $3880

Func_3880::
	dr $3880, $3882

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
