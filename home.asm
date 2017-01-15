SECTION "Boot", HOME [$0100]
	nop
	jp Start

SECTION "Header", HOME [$0104]
	ds $4c

SECTION "Start", HOME [$0150]
INCLUDE "home/init.asm"

PushGFXRegisters:
	ld a, [wc46c]
	or a
	jr nz, .go
	jr .go

.go
	ld a, [wSCX]
	ld [rSCX], a
	ld a, [wSCY]
	ld [rSCY], a
	ld a, [wWX]
	ld [rWX], a
	ld a, [wWY]
	ld [rWY], a
	ld a, [wBGP]
	ld [rBGP], a
	ld a, [wOBP0]
	ld [rOBP0], a
	ld a, [wOBP1]
	ld [rOBP1], a
	ld a, [wLCDC]
	ld [rLCDC], a
	ld a, [wLYC]
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
	jr c, .skip
	ld a, $2
	ld [wc46d], a
	ld a, [wc957]
	xor $1
	ld [wc957], a
	ret

.skip
	ret

SoftResetCheck: ; 2d0 (0:02d0)
	ld a, [hJoyLast]
	and A_BUTTON | B_BUTTON | START | SELECT
	cp A_BUTTON | B_BUTTON | START | SELECT
	ret nz
	ld a, [wGameRoutine]
	cp $0
	ret z
	xor a
	ld [wGameRoutine], a
	ld a, $2a
	ld [wSubroutine], a
	ret

INCLUDE "home/vblank.asm"
INCLUDE "home/lcd.asm"

ClearMemory:
.asm_0431
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0431
	ret

InitSoundData: ; 439 (0:0439)
	ld hl, wChannel1
	ld bc, $200
	call ClearMemory
	ld hl, hMusicID
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
	add MUSIC_BANK_00
	ld [MBC3RomBank], a
	call UpdateSound_20
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

PushOAM:
	ld a, wOAMBuffer / $100
	ld [rDMA], a
	; Wait until DMA is finished doing its thing (1 cycle per byte)
	ld a, (wOAMBufferEnd - wOAMBuffer) / 4
.wait_dma
	dec a
	jr nz, .wait_dma
	ret
PushOAMEnd:

Func_07b2:
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

DisableLCD: ; 7df (0:07df)
	ld a, [rIE]
	ld [hIE_Backup], a
	res 0, a
.wait_ly
	ld a, [rLY]
	cp $91
	jr nz, .wait_ly
	ld a, [wLCDC]
	and $7f
	ld [rLCDC], a
	ld a, [hIE_Backup]
	ld [rIE], a
	ret

EnableLCD:
	ld a, [rLCDC]
	or $80
	ld [rLCDC], a
	ret

ClearMemory2:
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

Func_0816:
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
	ld hl, VTilesOB
	ld bc, VBGMap - VTilesOB
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

ClearWRAM: ; 97c (0:097c)
	ld bc, wStackBottom - wOAMAnimations
	ld hl, wOAMAnimations
	jp ClearMemory3

ClearObjectAnimationBuffers:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld bc, wOAMAnimationsEnd - wOAMAnimations
	ld hl, wOAMAnimations
	call ClearMemory3
	ld bc, wc4c0 - wPlayerObjectStruct
	ld hl, wPlayerObjectStruct
	jp ClearMemory3

Func_099c:
	ld b, $20
	xor a
.asm_099f
	ld [de], a
	inc de
	dec b
	jr nz, .asm_099f
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
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

ClearBGMapAndAttrs:
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

ClearBGWindowAndAttrs:
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

Func_0a0b:
	xor a
	ld [wSCX], a
	ld [wSCY], a
	ld [wc3f7], a
	ld [wWX], a
	ld [wWY], a
	ld [wLYC], a
	ld [wc3cb], a
	ld [wc3cc], a
	ld a, $c3
	ld [wLCDC], a
	ret

INCLUDE "home/layout.asm"

DecompressGFXByIndex: ; c36 (0:0c36)
	ld a, BANK(CompressedGFXBanksAndDests)
	rst Bankswitch
	push bc
	pop de
	ld hl, CompressedGFXBanksAndDests
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
	ld hl, CompressedGFXAddresses
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

INCLUDE "home/random.asm"

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

INCLUDE "home/objects.asm"

GetWordFromTable:
	ld b, $0
	ld c, a
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

IncrementSubroutine:
	ld a, [wSubroutine]
	inc a
	ld [wSubroutine], a
	ret

IncrementSubroutine2:
	ld a, [wSubroutine2]
	inc a
	ld [wSubroutine2], a
	ret

WrapAroundBGMapOrWindowHorizontal: ; eb3 (0:0eb3)
	push af
	push bc
	push de
	call WrapAroundBGMapOrWindowVertical
	ld d, h
	ld e, l
	ld bc, (-VBGMap) & $ffff
	or a
	jr z, .asm_0ec4
	ld bc, (-VWindow) & $ffff
.asm_0ec4
	add hl, bc
REPT 5
	srl l
	jr c, .not_at_start_of_row
ENDR
	jr .is_at_start_of_row

.not_at_start_of_row
	ld h, d
	ld l, e
	pop de
	pop bc
	pop af
	ret

.is_at_start_of_row
	ld h, d
	ld l, e
	ld bc, -BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapOrWindowVertical
	pop de
	pop bc
	pop af
	ret

Func_0eee:
	push af
	push bc
	push de
	call WrapAroundBGMapOrWindowVertical
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
	call WrapAroundBGMapOrWindowVertical
	pop de
	pop bc
	pop af
	ret

WrapAroundBGMapOrWindowVertical: ; f29 (0:0f29)
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

Get2DigitBCD: ; 12fb (0:12fb)
; bcd convert 2-digit number to [wNumCGBPalettesToFade]
	push de
	push bc
	push hl
	push af
	xor a
	ld [wFontSourceBank], a
	ld [wNumCGBPalettesToFade], a
	ld de, 0
	pop af
	ld b, 100
.loop_100
	ld c, a
	sub b
	jr c, .okay_100
	inc d
	jr .loop_100

.okay_100
	ld a, c
	ld b, 10
.loop_10
	ld c, a
	sub b
	jr c, .okay_10
	push af
	ld a, e
	add $10
	ld e, a
	pop af
	jr .loop_10

.okay_10
	ld a, c
	ld b, $1
.loop_1
	ld c, a
	sub b
	jr c, .okay_1
	inc e
	jr .loop_1

.okay_1
	ld a, d
	ld [wFontSourceBank], a
	ld a, e
	ld [wNumCGBPalettesToFade], a
	pop hl
	pop bc
	pop de
	ret

Func_1338: ; 1338 (0:1338)
	xor a
	ld [wFontSourceBank], a
	ld [wNumCGBPalettesToFade], a
	ld a, b
	or a
	jr nz, .asm_1346
	ld a, c
	or a
	ret z
.asm_1346
	ld a, h
	ld [wCGBFade_PalLimit], a
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
	ld a, [wCGBFade_PalLimit]
	sbc b
	ld h, a
	ld a, [wFontSourceBank]
	add $1
	ld [wFontSourceBank], a
	ld a, $0
	adc $0
	ld d, a
	ld a, [wNumCGBPalettesToFade]
	add d
	ld [wNumCGBPalettesToFade], a
	jr .asm_1346

PrintDenjuuStat:
	push hl
	push de
	push bc
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	xor a
	ld [wFontSourceAddr], a
	pop bc
	ld a, c
	cp $1
	jp nz, .ThreeDigits
	ld a, $1
	ld [wFontSourceAddr], a
	jp .TwoDigits

.ThreeDigits: ; 1394 (0:1394)
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
.TwoDigits: ; 13aa (0:13aa)
	inc hl
	ld a, [wNumCGBPalettesToFade]
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
	ld a, [wNumCGBPalettesToFade]
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

Func_13d7:
	push hl
	push de
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	xor a
	ld [wFontSourceAddr], a
	ld a, [wNumCGBPalettesToFade]
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
	ld a, [wNumCGBPalettesToFade]
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

Print2DigitBCD_2:
	push hl
	push de
	push bc
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	xor a
	ld [wFontSourceAddr], a
	pop bc
	ld a, c
	cp $1
	jp nz, .asm_144c
	ld a, $1
	ld [wFontSourceAddr], a
	jp .asm_146d

.asm_144c
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
	jr .asm_146d

.asm_1468
	ld a, $ff
	call WaitStatAndLoad
.asm_146d
	ld a, [wNumCGBPalettesToFade]
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
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $f0
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_1499:
	push hl
	push de
	push bc
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	pop bc
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $f0
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_14b1:
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
	ld a, [wCGBFade_PalLimit]
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
	call WrapAroundBGMapOrWindowHorizontal
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, $1
	ld [wFontSourceAddr], a
	ld a, [wCGBFade_PalLimit]
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
	call WrapAroundBGMapOrWindowHorizontal
	ld bc, $1
	add hl, bc
	xor a
	call WrapAroundBGMapOrWindowHorizontal
	pop af
	di
	call WaitStat
	ld [hl], a
	ei
	ld a, [wCGBFade_PalLimit]
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
	call WrapAroundBGMapOrWindowHorizontal
	ld bc, $1
	add hl, bc
	xor a
	call WrapAroundBGMapOrWindowHorizontal
	ld bc, $1
	add hl, bc
	xor a
	call WrapAroundBGMapOrWindowHorizontal
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

FillMemoryWithFF:
.asm_15a7
	ld a, $ff
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_15a7
	ret

Func_15b0:
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

CopyData:
.asm_15c1
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, c
	or b
	jr nz, .asm_15c1
	ret

FillBoxAttr:
; hl: start
; b: x dim
; c: y dim
; a: bg attributes
	ld [wNumCGBPalettesToFade], a
	check_cgb
	ret nz
	ld a, $1
	ld [rVBK], a
	ld a, b
	ld [wFontSourceBank], a
.row
	push hl
	ld a, [wFontSourceBank]
	ld b, a
.col
	ld a, [wNumCGBPalettesToFade]
	call WaitStatAndLoad
	dec b
	jr nz, .col
	pop hl
	ld de, BG_MAP_WIDTH
	add hl, de
	dec c
	jr nz, .row
	xor a
	ld [rVBK], a
	ret

GetMusicBank:
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
	ld a, MUSIC_BANK_01 - MUSIC_BANK_00
	jp Func_161b

.asm_160a
	cp $30
	jr nc, .asm_1616
	sub $1f
	push af
	ld a, MUSIC_BANK_02 - MUSIC_BANK_00
	jp Func_161b

.asm_1616
	sub $2f
	push af
	ld a, MUSIC_BANK_03 - MUSIC_BANK_00
Func_161b: ; 161b (0:161b)
	ld [wMusicBank], a
	pop af
	ret

INCLUDE "home/pics.asm"

GetTFangerPalette: ; 1756 (0:1756)
	ld b, $7
	push bc
	ld hl, (TFangerPalettes - Palettes_34000) >> 3
	jp Func_176a

GetDenjuuPalette_Pal6:
	ld b, $6
	jp GetDenjuuPalette_BG

GetDenjuuPalette_Pal7:
	ld b, $7
GetDenjuuPalette_BG: ; 1766 (0:1766)
	push bc
	ld hl, (DenjuuPalettes - Palettes_34000) >> 3
Func_176a: ; 176a (0:176a)
	ld d, $0
	ld e, a
	add hl, de
	pop bc
	ld a, b
	ld b, h
	ld c, l
	jp LoadNthStdBGPalette

GetDenjuuPalette_OB:
	push bc
	ld hl, (DenjuuPalettes - Palettes_34000) >> 3
	ld d, $0
	ld e, a
	add hl, de
	pop bc
	ld a, b
	ld b, h
	ld c, l
	jp LoadNthStdOBPalette

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

AnimateStatUpArrows:
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

Func_17cf:
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

Func_17df:
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

Func_17ef:
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

Func_1877:
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
	call LoadNthStdOBPalette
	ld a, $1
	ld bc, $da
	call LoadNthStdOBPalette
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
	ld hl, $2d0
	add hl, de
	push hl
	pop bc
	ld a, $1
	call LoadNthStdBGPalette
	ret

PlayMoveAnimation_grp1: ; 1939 (0:1939)
	ld a, [wd4fc]
	jump_table
	dw EndMoveAnimation  ; DUMMY_0
	dw ClawAnimation ; CLAW                     IRON_CLAW
	dw RushAnimation ; RUSH                     ASSAULT
	dw StrikeAnimation ; STRIKE                   MISSILE_PUNCH
	dw CatPunchAnimation ; CAT_PUNCH                RAZOR_PUNCH
	dw BisonHammerAnimation ; BISON_HAMMER             HOOF
	dw KickAnimation ; KICK                     HIGH_KICK
	dw TailAnimation ; TAIL                     MIDDLE_KICK
	dw HornAnimation ; HORN                     STAB
	dw BeakAnimation ; BEAK                     TRIPLE_ATTACK
	dw PoisonStingAnimation ; POISON_STING             TOXIC_STING
	dw NumbingStingAnimation ; NUMBING_STING            ELECTRIC_STING
	dw ScissorAnimation ; SCISSOR                  CROSS_ATTACK
	dw SabreAnimation ; SABRE                    VACUUM_SLASH
	dw BiteAnimation ; BITE                     FANG_CRUSH
	dw BodyPressAnimation ; BODY_PRESS               PUNT
	dw HornDrillAnimation ; HORN_DRILL               SCREW_HORN
	dw BloodsuckAnimation ; BLOODSUCK                DRAIN
	dw ShurikenAnimation ; SHURIKEN                 DENMA_SHURIKEN
	dw BowgunAnimation ; BOWGUN                   NEEDLE
	dw BisonBeamAnimation ; BISON_BEAM
	dw StagBeamAnimation ; STAG_BEAM
	dw PulseBeamAnimation ; PULSE_BEAM
	dw PlasmaLaserAnimation ; PLASMA_LASER
	dw MegaLauncherAnimation ; MEGA_LAUNCHER
	dw MegaCannonAnimation ; MEGA_CANNON
	dw MegaRifleAnimation ; MEGA_RIFLE
	dw DrillMissileAnimation ; DRILL_MISSILE
	dw HyperMissileAnimation ; HYPER_MISSILE
	dw DragonMissileAnimation ; DRAGON_MISSILE
	dw PenguinMissileAnimation ; PENGUIN_MISSILE
	dw MissilePodAnimation ; MISSILE_POD
	dw WarCannonAnimation ; WAR_CANNON
	dw HarpoonMissileAnimation ; HARPOON_MISSILE
	dw HornLauncherAnimation ; HORN_LAUNCHER
	dw BirdBazookaAnimation ; BIRD_BAZOOKA
	dw NoseMagnumAnimation ; NOSE_MAGNUM
	dw EarVulcanAnimation ; EAR_VULCAN
	dw TuskVulcanAnimation ; TUSK_VULCAN
	dw MachineGunAnimation ; MACHINE_GUN
	dw FlamethrowerAnimation ; FLAMETHROWER
	dw MiniFlameAnimation ; MINI_FLAME
	dw MegaFlameAnimation ; MEGA_FLAME
	dw KamaitachiAnimation ; KAMAITACHI
	dw HurricaneAnimation ; HURRICANE
	dw MiniSnowAnimation ; MINI_SNOW
	dw BlizzardAnimation ; BLIZZARD
	dw EggBombAnimation ; EGG_BOMB
	dw WhirlpoolAnimation ; WHIRLPOOL
	dw TsunamiAnimation ; TSUNAMI
	dw MiniBoltAnimation ; MINI_BOLT
	dw MegaBoltAnimation ; MEGA_BOLT
	dw EarthquakeAnimation ; EARTHQUAKE
	dw MegaQuakeAnimation ; MEGA_QUAKE
	dw RockAnimation ; ROCK
	dw MegaRockAnimation ; MEGA_ROCK

EndMoveAnimation:
	ld a, $17
	ld [wd401], a
	ret

PlayMoveAnimation_grp2: ; 1939 (0:1939)
	ld a, [wd4fc]
	jump_table
	dw SpeedUpAnimation ; SPEED_UP        QUICK_STEP
	dw ParameterDownAnimation ; FOCUS           AIM
	dw AvoidAnimation ; AVOID           EVADE
	dw InvigorateAnimation ; INVIGORATE      BRACE
	dw ChargeUpAnimation ; CHARGE_UP       DUMMY_1
	dw RecoverAnimation ; HEAL            FIRST_AID
	dw RecoverAnimation ; RECOVER         REPAIR
	dw RestoreAnimation ; RESTORE         DUMMY_2
	dw ShieldAnimation ; SHIELD          SHUTTER
	dw ProtectAnimation ; PROTECT         DEFEND
	dw IronWallAnimation ; IRON_WALL       DUMMY_3
	dw CamouflageAnimation ; CAMOUFLAGE      CONCEAL
	dw UltrasonicAnimation ; ULTRASONIC      EM_PULSE
	dw EmWaveAnimation ; EM_WAVE         SHOCKWAVE
	dw CurseSongAnimation ; CURSE_SONG      DUMMY_4
	dw LullabyAnimation ; LULLABY         DUMMY_5
	dw GlareAnimation ; GLARE           STARE
	dw SleepGasAnimation ; SLEEP_GAS       DUMMY_6
	dw SmokescreenAnimation ; SMOKESCREEN     DUMMY_7
	dw PoisonGasAnimation ; POISON_GAS      DUMMY_8
	dw FlightAnimation ; JUMP            DUMMY_9
	dw FlightAnimation ; FLIGHT          DUMMY_10
	dw ScreamAnimation ; SCREAM          SNARL
	dw WingbeatAnimation ; WINGBEAT        DUST_CLOUD
	dw EmBarrierAnimation ; EM_BARRIER      ELECTRO_SCREEN
	dw ForceFieldAnimation ; FORCE_FIELD     DENMA_SEAL
	dw ChillAnimation ; CHILL           FROST_BREATH
	dw HeatWaveAnimation ; HEAT_WAVE       PETAL_STORM
	dw WaterShotAnimation ; WATER_SHOT
	dw AcidAnimation ; ACID
	dw LickAnimation ; LICK
	dw TentacleAnimation ; TENTACLE
	dw IceBallAnimation ; ICE_BALL
	dw ParameterDownAnimation ; PARAMETER_DOWN
	dw ParameterDownAnimation ; STATUS_RESET

InitCustomDMelo: ; 1a09 (0:1a09)
	enable_sram sDMelo
	ld hl, sDMelo
	ld bc, s1_b000 - sDMelo
.loop
	ld a, $fe
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld de, sDMelo1
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo2
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo3
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo4
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo5
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo6
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo7
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	ld de, sDMelo8
	ld hl, .DefaultDMelo
	ld bc, $8
	call CopyData
	xor a
	ld [MBC3SRamEnable], a
	ret

.DefaultDMelo:
	db $01
	ringtempo 0
	ringnote C_, 1, 2
	ringnote D_, 1, 2
	ringnote E_, 1, 2

Func_1a8e:
	sla c
	rl b
	sla c
	rl b
	ld hl, Data_2e8fa
	add hl, bc
	ld de, wBattlePlayerDenjuuName
	ld c, $4
.loop
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
	jr nz, .loop
	ld a, $e0
	ld [de], a
	ld hl, VTilesBG + $40 tiles
	ld b, $4
	call ClearTiles
	ld de, wBattlePlayerDenjuuName
	ld b, $4
	ld hl, VTilesBG + $40 tiles
	jp PlaceString_

Func_1ac6:
	ld de, VTilesBG + $40 tiles
	jr asm_1ace

LoadPhoneGFX_BGTile00:
	ld de, VTilesBG
asm_1ace
	push de
	ld a, PHONE_GFX
	rst Bankswitch
	ld a, [wDShotLevel]
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

Pointers_1aea:
	dw Phone1GFX
	dw Phone1GFX
	dw Phone1GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone2GFX
	dw Phone3GFX
	dw Phone3GFX
	dw Phone3GFX

Func_1afc:
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

IsSpecialPhoneNumber: ; 1b4d (0:1b4d)
	xor a
	ld [wcb20], a
	ld hl, SpecialPhoneNumbers
	ld b, $e
.number_loop
	push bc
	push hl
	call .IsPhoneNumberInArray
	cp $0
	jr z, .match
	ld a, [wcb20]
	inc a
	ld [wcb20], a
	pop hl
	ld de, $e
	add hl, de
	pop bc
	dec b
	jr nz, .number_loop
	ld c, $1
	ret

.match
	pop hl
	pop bc
	ld c, $0
	ret

.IsPhoneNumberInArray: ; 1b77 (0:1b77)
	ld b, $e
	ld de, wd200
.loop
	push bc
	ld a, [hli]
	ld b, a
	ld a, [de]
	inc de
	cp b
	jr nz, .nope
	pop bc
	dec b
	jr nz, .loop
	ld a, $0
	ret

.nope
	pop bc
	ld a, $1
	ret

Func_1b8f:
	ld a, $1
	jr asm_1b95

Func_1b93:
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

Func_1bb3:
	ld de, VTilesShared
	jr asm_1bbb

LoadPhoneBackground_BGTile20:
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

StopRingtone:
	xor a
	ld [hRingtone], a
	ld [wRingtoneID], a
	ld [rNR12], a
	ld a, $ff
	ld [rNR13], a
	ld a, $87
	ld [rNR14], a
	ret

INCLUDE "home/game_routine.asm"

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

Func_1d38:
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

Func_1d57:
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

Func_1d84:
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

Func_1da5:
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

CompressedGFXAddresses:
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

RunOverworld: ; 1ea1 (0:1ea1)
	ld a, [wSubroutine]
	cp $0
	jr z, .skip
	cp $a
	jr z, .skip
	cp $2e
	jp z, Func_1f6a
	ld a, [wc98e]
	or a
	jr nz, .skip
	homecall OverworldGetRTCEveryFourFrames, Func_a50be, OverworldSamplePhonecall, OverworldPhonecallCheck, HandleOverworldRingtone, HealPartnerDenjuuInOverworld
	callba OverworldIdleHudCheck
	callba Func_2e4b2
.skip
	call Func_1f24
	homecall Func_2e064
	ld a, [wc98e]
	or a
	ret nz
	ld a, [rLY]
	cp $64
	call c, Func_34dc
	ld a, [wSubroutine]
	cp $4
	jr z, .quit
	cp $5
	ret nz
.quit
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
	jr z, .skip_joypad_reset
	dec a
	ld [wc918], a
	xor a
	ld [hJoyLast], a
	ld [hJoyNew], a
	ld [wJoyNew], a
.skip_joypad_reset
	call Func_3880
	call Func_200a
	call Func_2021
	call Func_1f80
	homecall HandleRunningMapScript
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

TextWaitStat:
.asm_1f79
	ld a, [rSTAT]
	and $2
	jr nz, .asm_1f79
	ret

Func_1f80: ; 1f80 (0:1f80)
	call CheckInOverworld
	ret nz
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	ret nz
	homecall Func_a501e
	ld a, [hJoyNew]
	and START
	cp START
	jp nz, .check_select
	ld a, [wc9de]
	or a
	jr nz, .check_select
	xor a
	ld [wNumIdleFrames], a
	call Func_2411
	ld b, $c
	ld a, [wMapGroup]
	cp $a
	jr c, .asm_1fbe
	ld a, [wMapGroup]
	cp $b
	jr z, .asm_1fbe
	ld b, $12
.asm_1fbe
	call Func_1fff
	ld a, b
	ld [wSubroutine], a
	ld a, $4
	jp StartFade

.check_select
	ld a, [hJoyNew]
	and SELECT
	jr z, .no_select
	ld a, [wc935]
	or a
	jr nz, .no_select
	ld a, [wMapGroup]
	ld [wc926], a
	ld a, [wMapNumber]
	ld [wc927], a
	callba Func_c97d2
	call Func_20f6
	call Func_1fff
	ld a, $17
	ld [wSubroutine], a
	xor a
	ld [wNumIdleFrames], a
	ld a, $4
	jp StartFade

.no_select
	ret

Func_1fff: ; 1fff (0:1fff)
	ld a, $0
	ld [wPhoneCallRingtoneTimer], a
	ld [wcad0], a
	jp ResumeNormalMusicIfPhoneIsRinging

Func_200a: ; 200a (0:200a)
	call CheckInOverworld
	ret nz
	ld a, [wcdb6]
	or a
	ret z
	add $a1
	ld c, a
	ld b, $0
	call PrintMapObjectText_
	ld a, $0
	ld [wcdb6], a
	ret

Func_2021: ; 2021 (0:2021)
	ld a, [wc91d]
	or a
	jp nz, Func_20b1
	ld a, [wMapGroup]
	cp $b
	ret z
	cp $32
	jr nc, .try_generate
	cp $2b
	ret nc
	ld a, [wCurTilesetIdx]
	cp $2
	ret z
	cp $4
	ret z
	cp $c
	ret nc
.try_generate
	ld a, [wPhoneCallRingtoneTimer]
	or a
	ret nz
	call CheckInOverworld
	ret nz
	ld a, [wPlayerObjectStruct_Duration + 18]
	or a
	ret nz
	ld a, [wTakingAStep]
	or a
	ret z
	ld a, [wcdb2]
	or a
	ret nz
	homecall CheckCanGenerateEncounters
	ld a, b
	or a
	ret nz
	ld a, [wEncounterStepCounter + 1]
	ld h, a
	ld a, [wEncounterStepCounter]
	ld l, a
	ld bc, $1
	ld a, [hJoyLast]
	and B_BUTTON
	jr z, .not_running
	ld bc, $2
.not_running
	add hl, bc
	ld a, [wca5e]
	cp $1
	jr nz, .asm_2087
	add hl, bc
	add hl, bc
	add hl, bc
.asm_2087
	ld a, h
	ld [wEncounterStepCounter + 1], a
	ld a, l
	ld [wEncounterStepCounter], a
	ld bc, -800
	add hl, bc
	bit 7, h
	jr nz, asm_20f5
	homecall GetMapEncounterTableIndex
	ld a, b
	ld [wCurWildDenjuuEncounterTableIndex], a
	ld a, $0
	ld [wOtherTFangerClass], a
	ld a, $0
	ld [wBattleMode], a ; wild
Func_20b1: ; 20b1 (0:20b1)
	call Func_20f6
	ld a, [wSubroutine]
	cp $5
	ret z
	call OverworldRandom8_
	and $3
	ld b, a
	homecall Func_c9868
	ld a, $0
	ld [wc9d9], a
	ld [wc91d], a
	ld a, $6
	ld [wSubroutine], a
	ld a, MUSIC_NONE
	ld [wMapMusic], a
	call GetMusicBank
	ld [hMusicID], a
	ld a, $0
	ld [wNumIdleFrames], a
	ld a, $0
	ld [wEncounterStepCounter], a
	ld [wEncounterStepCounter + 1], a
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
	ld [wCurBackground], a
	pop af
	rst Bankswitch
	ret

CheckInOverworld: ; 2107 (0:2107)
	ld a, [wPlayerNameEntryBuffer]
	or a
	jr nz, .asm_2121
	ld a, [wSubroutine]
	cp $4
	jr nz, .asm_2121
	ld a, [wc98e]
	or a
	jr nz, .asm_2121
	ld a, [wPhoneCallSubroutine]
	cp $1
	jr nz, .asm_2121
.asm_2121
	ret

INCLUDE "home/overworld.asm"

Func_24f6: ; 24f6 (0:24f6)
	homecall Func_c9538
	ret

Func_2503:
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_2509:
	homecall Func_c8000
	ret

Data_2516:
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
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, de
	call WrapAroundBGMapPointer
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
	call LoadMetatile
	ret

Data_255a:
x = 0
REPT 10
	dw x
x = x + $20
ENDR

Func_256e:
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	jp nz, Func_2690
	call Func_26b1
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, Func_2690
	ld a, [wPlayerObjectStruct_Duration + 17]
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
	ld bc, EVENT_1DE
	call CheckEventFlag
	jp z, Func_2691
	callba Func_31843
	ld a, b
	or a
	jp z, Func_2690
	ld a, $0
	ld [wc9c1], a
	ld a, [wPlayerObjectStruct_Duration + 17]
	set 2, a
	ld [wPlayerObjectStruct_Duration + 17], a
	callba Func_31600
	callba Func_3162e
	ld a, $9
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $0
	ld [wPlayerObjectStruct_Duration + 11], a
	ld hl, Data_2698
	ld a, [wPlayerObjectStruct_Duration + 15]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wCurPlayerFacing], a
	call OverworldRandom8_
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
	jr nz, asm_2665
	call Func_1fff
	ld a, SFX_13
	ld [hSFX_ID], a
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
	jr nz, Func_264f
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $20
	ld [wPlayerObjectStruct_Duration + 11], a
	ret

Func_264f:
	ld a, $b
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $b8
	ld [wPlayerObjectStruct_Duration + 11], a
	ld a, [wPlayerNameEntryBuffer]
	or a
	jr z, .asm_2664
	ld a, $8
	ld [wPlayerObjectStruct_Duration + 11], a
.asm_2664
	ret

asm_2665
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
	ld a, SFX_13
	ld [hSFX_ID], a
Func_2690: ; 2690 (0:2690)
	ret

Func_2691: ; 2691 (0:2691)
	ld b, $0
	ld c, $9b
	jp PrintMapObjectText_

Data_2698:
	db $2c
	db $29
	db $2c
	db $26
	db $fa
	db $c3
	db $c9
	db $47

Func_26a0:
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
	ld a, [wTakingAStep]
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
	ld bc, EVENT_1DF
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
	call PrintMapObjectText_
	jr .asm_26f1

Func_26ff: ; 26ff (0:26ff)
	ld a, [wcadb]
	or a
	jr nz, asm_272e
	ld hl, Data_2698
	ld a, [wPlayerObjectStruct_Duration + 15]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	sub $2
	ld a, a
	ld [wCurPlayerFacing], a
	ld a, $11
	ld [wPlayerObjectStruct_Duration + 18], a
	ld a, $c
	ld [wPlayerObjectStruct_Duration + 11], a
	ld a, SFX_68
	ld [hSFX_ID], a
Func_2726:
	ld a, [wPlayerObjectStruct_Duration + 17]
	res 2, a
	ld [wPlayerObjectStruct_Duration + 17], a
asm_272e
	ret

GetBlockdataPointer:
	ld a, [wCurTilesetIdx]
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
	ld [wBlockDataBank], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	push de
	ld a, [wMapNumber3]
	ld b, $0
	ld c, a
	ld de, 80
	push hl
	call Multiply_DE_by_BC
	pop hl
	add hl, de
	pop de
	pop af
	rst Bankswitch
	ret

Data_2760:
	dba Data_1a0000
	dba Data_1a4000
	dba Data_1a0000
	dba Data_1a4000
	dba Data_1a4000
	dba Data_1a4000
	dba Data_190000
	dba Data_1a8000
	dba Data_1a8000
	dba Data_198000
	dba Data_194000
	dba Data_190000
	dba Data_190000
	dba Data_190000
	dba Data_190000
	dba Data_190000
	dba Data_18c000

LoadTilesetRegisters: ; 2793 (0:2793)
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	ld a, [wMapGroup]
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
	ld [wCurTilesetIdx], a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wMapNumber]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [wMapNumber3], a
	ld a, [wCurTilesetIdx]
	ld b, a
	call .LoadTilesetPointers
	pop af
	rst Bankswitch
	ret

.LoadTilesetPointers: ; 27c7 (0:27c7)
	ld a, [wROMBank]
	push af
	ld a, BANK(TilesetMetatilesPointerTable)
	rst Bankswitch
	ld hl, TilesetMetatilesPointerTable
	ld a, b
	add a
	ld b, a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wCurTilesetMetatilesPointer], a
	ld a, [hl]
	ld [wCurTilesetMetatilesPointer + 1], a
	ld hl, TilesetMetaattrsPointerTable
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wCurTilesetMetaattrsPointer], a
	ld a, [hl]
	ld [wCurTilesetMetaattrsPointer + 1], a
	ld hl, TilesetCollisionPointerTable
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wCurTilesetCollisionPointer], a
	ld a, [hl]
	ld [wCurTilesetCollisionPointer + 1], a
	pop af
	rst Bankswitch
	ret

Func_2809: ; 2809 (0:2809)
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	ld a, [wc9c3]
	ld [wPlayerXTile], a
	ld a, [wc9c4]
	ld [wPlayerYTile], a
	call Func_2a68
	jp z, .quit_true
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	push hl
	ld hl, -$400
	add hl, bc
	pop hl
	jr c, .skip_flag_check
	cp $ff
	jr nz, .check_flag
	ld a, b
	cp $ff
	jr z, .skip_flag_action
.check_flag
	call CheckEventFlag
	jr nz, .quit_false
	ld a, [wMapGroup]
	cp $a
	jr nz, .asm_284c
	ld a, [wMapNumber]
	cp $1c
	jr z, .check_set_flag
.asm_284c
	ld a, [wMapGroup]
	cp $e
	jr z, .check_set_flag
	ld a, [wMapGroup]
	cp $f
	jr z, .check_set_flag
	ld a, [wMapGroup]
	cp $34
	jr nz, .skip_flag_check
.check_set_flag
	ld a, [wcdec]
	or a
	jr z, .skip_flag_action
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
.quit_false
	pop af
	rst Bankswitch
	xor a
	ret

.skip_flag_check
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2c63b)
	rst Bankswitch
	ld b, $0
	ld c, $a8
	call Func_2c63b
	pop af
	rst Bankswitch
	jr .quit_true

.skip_flag_action
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2c63b)
	rst Bankswitch
	ld b, $0
	ld c, $be
	call Func_2c63b
	pop af
	rst Bankswitch
.quit_true
	pop af
	rst Bankswitch
	or $1
	ret

Func_28a9: ; 28a9 (0:28a9)
	push bc
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19e8ed)
	rst Bankswitch
	call Func_28dd
.loop
	ld a, [hli]
	cp $ff
	jr z, .dont_set_flag
	call Func_28ee
	jr nz, .loop
	ld a, [de]
	and c
	jr nz, .dont_set_flag
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

.dont_set_flag
	pop af
	rst Bankswitch
	pop bc
	xor a
	ret

Func_28dd: ; 28dd (0:28dd)
	ld hl, Pointers_19e8ed
	ld a, [wMapGroup]
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
; hl pointed from Pointers_19e8ed
; a = Map Number
; Returns:
; de - Event flag address
; c - Event flag bit
; b - ??
	ld d, a
	ld a, [wMapNumber3]
	cp d
	jr nz, .nope_inc3
	ld a, [hli]
	ld d, a
	and $f
	cp c
	jr nz, .nope_inc2
	ld a, d
	swap a
	and $f
	cp b
	jr nz, .nope_inc2
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
.event_bit_loop
	sla c
	dec a
	jr nz, .event_bit_loop
	ret

.nope_inc3
	inc hl
.nope_inc2
	inc hl
	inc hl
	or $1
	ret

Func_2928:
	ld a, [wROMBank]
	push af
	ld a, [wCurTilesetBank]
	rst Bankswitch
	hlcoord 0, 0
	ld a, wOverworldMapEnd - wOverworldMap
	ld [wFontSourceBank], a
.loop
	ld b, [hl]
	ld a, [wCurTilesetCollisionPointer + 1]
	ld d, a
	ld a, [wCurTilesetCollisionPointer]
	ld e, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	cp $13
	jr z, .check_0x13
	cp $15
	jr z, .check_0x15
.next
	inc hl
	ld a, [wFontSourceBank]
	dec a
	ld [wFontSourceBank], a
	jr nz, .loop
	pop af
	rst Bankswitch
	ret

.check_0x13
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19e8ed)
	rst Bankswitch
	push bc
	push hl
	call Func_28dd
.loop_0x13
	ld a, [hli]
	cp $ff
	jr z, .nope_0x13
	push af
	ld a, [wROMBank]
	push af
	ld a, BANK(Divide_C_by_E)
	rst Bankswitch
	push hl
	ld a, [wFontSourceBank]
	ld c, a
	ld a, $50
	sub c
	ld c, a
	ld e, $a
	call Divide_C_by_E
	ld b, e
	pop hl
	pop af
	rst Bankswitch
	pop af
	call Func_28ee
	jr nz, .loop_0x13
	pop hl
	ld a, [de]
	and c
	jr nz, .event_flag_set
	ld a, $1
	ld [wc94c], a
	jr .done_0x13

.event_flag_set
	inc [hl]
	jr .done_0x13

.nope_0x13
	pop hl
.done_0x13
	pop bc
	pop af
	rst Bankswitch
	jr .next

.check_0x15
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	push bc
	push hl
	push af
	ld a, [wROMBank]
	push af
	ld a, BANK(Divide_C_by_E)
	rst Bankswitch
	push hl
	ld a, [wFontSourceBank]
	ld c, a
	ld a, $50
	sub c
	ld c, a
	ld e, $a
	call Divide_C_by_E
	ld a, e
	ld [wPlayerXTile], a
	ld a, c
	ld [wPlayerYTile], a
	pop hl
	pop af
	rst Bankswitch
	pop af
	call Func_2a68
	jr z, .nope_0x15
	inc hl
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	jr z, .nope_0x15
	pop hl
	ld a, [hl]
	or $1
	ld [hl], a
	jr .next_0x15

.nope_0x15
	pop hl
.next_0x15
	pop bc
	pop af
	rst Bankswitch
	jp .next

Func_29ed:
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_19c000)
	rst Bankswitch
	call Func_2a68
	jp z, Func_2a65
	ld a, [hli]
	ld [wMapGroup], a
	ld [wc926], a
	ld a, [hli]
	ld [wMapNumber], a
	ld [wc927], a
	ld a, [hl]
	ld b, a
	and $f
	ld [wPlayerYTile], a
	inc a
	swap a
	ld [wc902], a
	ld [wc929], a
	ld a, b
	and $f0
	swap a
	ld [wPlayerXTile], a
	swap a
	add $8
	ld [wc901], a
	ld [wc928], a
	ld a, [wPhoneCallSubroutine]
	cp $2
	jr z, .asm_2a48
	ld a, [wPlayerNameEntryBuffer]
	or a
	jr nz, .asm_2a48
	ld a, [wMapGroup]
	cp $b
	jr nz, .asm_2a44
	ld a, SFX_13
	ld [hSFX_ID], a
	jr .asm_2a48

.asm_2a44
	ld a, SFX_0D
	ld [hSFX_ID], a
.asm_2a48
	ld a, $0
	ld [wPhoneCallRingtoneTimer], a
	ld [wcad0], a
	ld [wOverworldRingtoneSubroutine], a
	call StopRingtone
	ld a, $0
	ld [wc947], a
	ld a, $7
	ld [wSubroutine], a
	ld a, $5
	call StartFade
Func_2a65: ; 2a65 (0:2a65)
	pop af
	rst Bankswitch
	ret

Func_2a68: ; 2a68 (0:2a68)
	ld a, [wMapGroup]
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
	ld a, [wMapNumber3]
	cp b
	jr nz, .next
	ld de, $5
	ld a, [hli]
	ld b, a
	swap a
	and $f
	ld c, a
	ld a, [wPlayerXTile]
	cp c
	jr nz, .next
	ld a, b
	and $f
	ld c, a
	ld a, [wPlayerYTile]
	cp c
	jr nz, .next
	or $1
	ret

.next
	add hl, de
	jr .loop

.done
	ret

ApplyXStepVector_:
	homecall ApplyXStepVector
	ret

ApplyYStepVector_:
	homecall ApplyYStepVector
	ret

Func_2acd:
	homecall Func_2dd5a
	ret

Func_2ada:
	homecall Func_2dd89
	ret

Func_2ae7:
	homecall Func_2dd9d
	ret

Func_2af4:
	homecall Func_2ddb1
	ret

Func_2b01:
	homecall Func_2ddc5
	ret

Func_2b0e:
	homecall Func_c8243
	ret

Func_2b1b:
	homecall Func_c8268
	ret

Func_2b28:
	ld e, a
	homecall Func_c8293
	ret

Func_2b36:
	ld e, a
	homecall Func_c82df
	ret

INCLUDE "home/multiply.asm"

LoadMapBlockdataAndScriptHeader:
	call GetBlockdataPointer
	ld a, [wROMBank]
	push af
	ld a, [wBlockDataBank]
	rst Bankswitch
	decoord 0, 0
	ld b, $50
.copy
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .copy
	pop af
	rst Bankswitch
	call LoadMapScripts
	ld a, $0
	ld [wc953], a
	ld [wc94c], a
	jp Func_2928

Func_2b98:
	ld b, $c
	ld hl, wOAMAnimation01
	ld de, $20
	xor a
.clear
	ld [hl], a
	add hl, de
	dec b
	jr nz, .clear
	jp Func_2726

Func_2ba9:
	ld a, [wTextBGMapTop]
	srl a
	ld c, a
	ld e, $a
	call Multiply_C_by_E
	hlcoord 0, 0
	add hl, de
	ld d, h
	ld e, l
	ld a, [wTextBGMapTop]
	ld c, $0
	srl a
	srl a
	rr c
	srl a
	rr c
	ld b, a
	jp Func_2bdc

Func_2bcd:
	ld bc, $0000
	decoord 0, 0
	jp Func_2bdc

Func_2bd6:
	ld bc, $0100
	decoord 0, 4
Func_2bdc: ; 2bdc (0:2bdc)
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	call WrapAroundBGMapPointer
	ld b, $4
.asm_2bea
	push bc
	push hl
	homecall Func_c82a9
	pop hl
	ld bc, $40
	add hl, bc
	call WrapAroundBGMapPointer
	pop bc
	dec b
	jr nz, .asm_2bea
	ret

Func_2c05:
	ld a, [wROMBank]
	ld [wca52], a
	ld a, [wCurTilesetBank]
	rst Bankswitch
	ld a, [de]
	cp $3
	jr nz, asm_2c22
	push bc
	ld bc, EVENT_1D8
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

Func_2c29:
	ld a, [wROMBank]
	ld [wca52], a
	ld a, [wCurTilesetBank]
	rst Bankswitch
	ld a, [hl]
	cp $3
	jr nz, asm_2c22
	push bc
	ld bc, EVENT_1D8
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

ToggleEventFlag:
	push bc
	push hl
	call GetEventFlagAddressAndBit
	ld a, [hl]
	xor c
	jr asm_2c5e

ResetEventFlag:
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
; input: event flag ID in bc
; returns: event flag address in hl, single-bit mask in c
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

Func_2c94:
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_302a8)
	rst Bankswitch
	ld hl, wCurObjectStruct
	ld a, wPartnerDenjuuObjectStruct % $100
	ld [hli], a
	ld a, wPartnerDenjuuObjectStruct / $100
	ld [hl], a
	call Func_302a8
	pop af
	rst Bankswitch
	ret

Func_2caa:
	homecall Func_3024f
	ret

Func_2cb7:
	homecall Func_3102a
	ret

PrintText_:
	homecall PrintText
	ret

PrintMoneyInShop_:
	homecall PrintMoneyInShop
	ret

OverworldIdleHUD_:
	homecall OverworldIdleHUD
	ret

INCLUDE "home/text.asm"

Func_2d4c:
	homecall Func_33a62
	ret

GetMapHeaderAddress:
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld hl, Pointers_148000
	ld a, [wCurTilesetIdx]
	cp $3
	jr c, .asm_2da2
	cp $4
	jr z, .asm_2da2
	ld hl, Data_2e09
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push bc
	ld bc, EVENT_20B
	call CheckEventFlag
	pop bc
	jr z, .asm_2d91
	ld a, [wCurTilesetIdx]
	cp $6
	jr nz, .asm_2d91
	ld hl, Pointers_18ba1
.asm_2d91
	ld a, [wMapNumber3]
.asm_2d94
	ld c, a
	ld b, $0
	sla c
	rl b
	add hl, bc
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	rst Bankswitch
	ret

.asm_2da2
	ld a, [wCurTilesetIdx]
	cp $0
	jr z, .asm_2db2
	cp $2
	jr z, .asm_2db2
	ld hl, Data_e2d14
	jr .asm_2db5

.asm_2db2
	ld hl, Data_e2c54
.asm_2db5
	ld a, [wMapNumber3]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_e2c54)
	rst Bankswitch
	ld b, [hl]
	pop af
	rst Bankswitch
	ld hl, Pointers_148000
	push bc
	ld bc, EVENT_20B
	call CheckEventFlag
	pop bc
	jr z, .asm_2dd8
	ld hl, Pointers_148180
.asm_2dd8
	ld a, b
	jr .asm_2d94

GetMapHeaderBank: ; 2ddb (0:2ddb)
	push bc
	ld bc, EVENT_20B
	call CheckEventFlag
	pop bc
	jr nz, .asm_2df5
.asm_2de5
	ld b, BANK(Pointers_148000)
	ld a, [wCurTilesetIdx]
	cp $6
	jr z, .asm_2df2
	cp $b
	jr c, .asm_2df4
.asm_2df2
	ld b, BANK(Pointers_14c668)
.asm_2df4
	ret

.asm_2df5
	ld a, [wCurTilesetIdx]
	cp $3
	jr c, .asm_2e06
	cp $4
	jr z, .asm_2e06
	cp $6
	jr z, .asm_2e06
	jr .asm_2de5

.asm_2e06
	ld b, BANK(Pointers_18ba1) ; $6
	ret

Data_2e09:
	dw Pointers_148000 ; bank 6 if EVENT_20B else bank 52
	dw Pointers_148000 ; bank 6 if EVENT_20B else bank 52
	dw Pointers_148000 ; bank 6 if EVENT_20B else bank 52
	dw Pointers_14956e ; bank 52
	dw Pointers_148000 ; bank 6 if EVENT_20B else bank 52
	dw Pointers_14956e ; bank 52
	dw Pointers_14c668
	dw Pointers_149dfc ; bank 52
	dw Pointers_149dfc ; bank 52
	dw Pointers_14a97c ; bank 52
	dw Pointers_14b0f8 ; bank 52
	dw Pointers_14c668
	dw Pointers_14c668
	dw Pointers_14c668
	dw Pointers_14c668
	dw Pointers_14c668
	dw Pointers_14d472 ; bank 53

CopyMapHeader:
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld hl, wMapHeader
	ld b, $8
.copy
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .copy
	pop af
	rst Bankswitch
	ret

Func_2e42:
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	inc de
	ld a, [de]
	ld [wCustomSpriteDest + 1], a
	inc de
	ld a, [de]
	ld [wSpriteDestIsCustom], a
	inc de
	ld a, [de]
	ld [wCustomSpriteDest], a
	inc de
	ld a, c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	pop af
	rst Bankswitch
	ret

Func_2e67:
	ld c, a
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_33846)
	rst Bankswitch
	ld a, c
	call Func_33846
	pop af
	rst Bankswitch
	ret

Func_2e76:
	ld c, a
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_3385b)
	rst Bankswitch
	ld a, c
	call Func_3385b
	pop af
	rst Bankswitch
	ret

Func_2e85:
	homecall Func_3226b
	ret

GetMapByte:
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [de]
	ld b, a
	pop af
	rst Bankswitch
	ret

LoadMapObjectTextIdxs:
	push hl
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	push hl
	ld a, c
	ld e, c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	cp $ff
	jr nz, .asm_2ec3
	ld e, $0
	pop hl
	ld a, [hli]
	jr .asm_2ec7

.asm_2ec3
	inc e
	inc e
	add sp, $2
.asm_2ec7
	ld d, a
	and $80
	jr z, .asm_2ed0
	inc e
	inc e
	inc e
	inc e
.asm_2ed0
	ld a, d
	and $3f
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, $1
	ld [wBattleMode], a ; tfanger
	ld a, [hli]
	ld [wMapEnemyEventFlag], a
	ld a, [hli]
	ld [wMapEnemyEventFlag + 1], a
	ld a, [hli]
	ld [wCurWildDenjuuEncounterTableIndex], a
	ld a, [hl]
	ld [wOtherTFangerClass], a
	or a
	jr nz, .asm_2ef3
	ld a, $2
	ld [wBattleMode], a ; boss denjuu
.asm_2ef3
	ld l, a
	ld a, [wOtherTFangerClass]
	or l
	jr nz, .asm_2f01
	ld a, $0
	ld [wc91d], a
	jr .asm_2f06

.asm_2f01
	ld a, $1
	ld [wc91d], a
.asm_2f06
	pop af
	rst Bankswitch
	pop hl
	ret

Func_2f0a:
	push hl
	call GetMapHeaderBank
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [de]
	ld l, a
	inc de
	ld a, [de]
	ld h, a
	ld a, c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	dec de
	ld b, a
	pop af
	rst Bankswitch
	pop hl
	ret

Func_2f27:
	homecall Func_30b4e
	ret

GetMapObjectFlags:
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld b, a
	pop af
	rst Bankswitch
	ret

CopyScriptToBuffer:
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [wScriptNumber]
	ld e, a
	ld a, [wScriptNumber + 1]
	ld d, a
	add hl, de
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wScriptOffset + 1]
	ld d, a
	ld a, [wScriptOffset]
	ld e, a
	add hl, de
	ld de, wScriptBuffer
	ld b, $8
	call CopyData_Under256Bytes
	pop af
	rst Bankswitch
	ret

GetFarWord:
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld a, [hli]
	ld d, [hl]
	ld e, a
	pop af
	rst Bankswitch
	ret

Func_2f76: ; 2f76 (0:2f76)
	push bc
.asm_2f77
	ld [hli], a
	dec b
	jr nz, .asm_2f77
	pop bc
	ret

FarCopyData_Under256Bytes:
	ld a, [wROMBank]
	push af
	ld a, c
	rst Bankswitch
	call CopyData_Under256Bytes
	pop af
	rst Bankswitch
	ret

CopyData_Under256Bytes: ; 2f89 (0:2f89)
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, CopyData_Under256Bytes
	ret

GetPhoneCallData:
; Arguments
; hl - pointer to phone call data, in bank $29
; Returns
; b, c - text idxs
; e - change in FD
	ld a, [wROMBank]
	push af
	ld a, BANK(Data_98000)
	rst Bankswitch
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld e, a
	pop af
	rst Bankswitch
	ret

Func_2fa0:
	push af
	push hl
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp 100
	jr nc, .asm_2fb1
	inc [hl]
.asm_2fb1
	pop hl
	pop af
	ret

Func_2fb4:
	push af
	push hl
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	or a
	jr z, .asm_2fc4
	dec [hl]
.asm_2fc4
	pop hl
	pop af
	ret

LoadCharacter_:
	push af
	ld a, [wROMBank]
	ld [wca52], a
	ld a, BANK(LoadCharacter)
	rst Bankswitch
	pop af
	call LoadCharacter
	ld a, [wca52]
	rst Bankswitch
	ret

GetFarByte:
; get byte at b:hl
	ld a, [wROMBank]
	push af
	ld a, b
	rst Bankswitch
	ld b, [hl]
	pop af
	rst Bankswitch
	ret

Func_2fe4:
	ld a, [wROMBank]
	push af
	ld a, $29
	rst Bankswitch
	ld a, [hli]
	ld d, [hl]
	ld e, a
	inc hl
	ld a, [hli]
	ld b, [hl]
	ld c, a
	pop af
	rst Bankswitch
	ret

Func_2ff5:
	homecall Func_2da7e
	ret

Data_3002:
	db $20, $20, $28, $20

Func_3006:
	homecall Func_2d92b
	ret

Func_3013:
	homecall Func_2d95f
	ret

AddVector_:
	homecall AddVector
	ret

Func_302d:
	homecall Func_2db55
	ret

Func_303a:
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2db90)
	rst Bankswitch
	call Func_2db90
	ld d, a
	pop af
	rst Bankswitch
	ld a, d
	ret

Func_3049:
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_2dc6d)
	rst Bankswitch
	call Func_2dc6d
	ld d, a
	pop af
	rst Bankswitch
	ld a, d
	ret

Sine8_:
	ld a, [wROMBank]
	push af
	ld a, BANK(Sine8)
	rst Bankswitch
	ld a, d
	call Sine8
	ld d, a
	pop af
	rst Bankswitch
	ld a, d
	ret

Cosine8_:
	ld a, [wROMBank]
	push af
	ld a, BANK(Cosine8)
	rst Bankswitch
	ld a, d
	call Cosine8
	ld d, a
	pop af
	rst Bankswitch
	ld a, d
	ret

Sine16_:
	ld a, [wROMBank]
	push af
	ld a, BANK(Sine16)
	rst Bankswitch
	ld a, d
	call Sine16
	pop af
	rst Bankswitch
	ret

Cosine16_:
	ld a, [wROMBank]
	push af
	ld a, BANK(Cosine16)
	rst Bankswitch
	ld a, d
	call Cosine16
	pop af
	rst Bankswitch
	ret

CalcL1Distance_:
; a = abs(b - d) + abs(c - e)
; also stores to wMathBuffer3
	ld a, [wROMBank]
	push af
	ld a, BANK(CalcL1Distance)
	rst Bankswitch
	call CalcL1Distance
	ld [wMathBuffer3], a
	pop af
	rst Bankswitch
	ld a, [wMathBuffer3]
	ret

OverworldRandom8_: ; 30a7 (0:30a7)
; Result is returned as signed char to a
	ld a, [wROMBank]
	push af
	ld a, BANK(OverworldRandom8)
	rst Bankswitch
	call OverworldRandom8
	ld d, a
	pop af
	rst Bankswitch
	ld a, d
	ret

OverworldRandom16_:
; Same as OverworldRandom8_, but result is returned as signed short to bc
	homecall OverworldRandom16
	ret

GetOverworldSprite_SizeHL:
	push af
	ld a, $1
	ld [wSpriteDestIsCustom], a
	ld a, h
	ld [wCustomSpriteDest], a
	ld a, l
	ld [wCustomSpriteDest + 1], a
	ld b, $0
	jr asm_30db

GetOverworldSprite:
	push af
	ld a, $0
	ld [wSpriteDestIsCustom], a
asm_30db
	pop af
	push bc
	ld c, $0
	cp 28
	jr c, .asm_30f4
	inc c
	sub 28
	cp 28
	jr c, .asm_30f4
	inc c
	sub 28
	cp 28
	jr c, .asm_30f4
	inc c
	sub 28
.asm_30f4
	push af
	ld a, [wROMBank]
	ld [wca52], a
	ld a, SPRITES_01
	add c
	rst Bankswitch
	pop af
	ld d, $0
	ld e, a
	ld bc, (9 * 2 * 2) tiles
	call Multiply_DE_by_BC
	ld hl, OverworldSprite001
	add hl, de
	ld d, h
	ld e, l
	pop bc
	ld a, b
	or a
	jr nz, .asm_3119
	ld hl, VTilesOB tile $04
	jr .asm_3139

.asm_3119
	cp $1
	jr nz, .asm_3122
	ld hl, VTilesOB tile $08
	jr .asm_3139

.asm_3122
	cp $2
	jr nz, .asm_312b
	ld hl, VTilesOB tile $2c
	jr .asm_3139

.asm_312b
	cp $3
	jr nz, .asm_3134
	ld hl, VTilesOB tile $50
	jr .asm_3157

.asm_3134
	ld hl, VTilesOB tile $5c
	jr .asm_3157

.asm_3139
	ld a, [wSpriteDestIsCustom]
	or a
	jr nz, .asm_3144
	ld bc, (9 * 2 * 2) tiles
	jr .asm_314f

.asm_3144
	ld a, [wCustomSpriteDest]
	ld h, a
	ld a, [wCustomSpriteDest + 1]
	ld l, a
	ld bc, 12 tiles
.asm_314f
	call Copy2bpp_2
	ld a, [wca52]
	rst Bankswitch
	ret

.asm_3157
	ld b, $3
.asm_3159
	push bc
	ld bc, (2 * 2) tiles
	call Copy2bpp_2
	ld a, (2 * 2 * 2) tiles
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	pop bc
	dec b
	jr nz, .asm_3159
	ld a, [wca52]
	rst Bankswitch
	ret

ServeSpecialGFXRequest: ; 3171 (0:3171)
	ld a, [wGameRoutine]
	cp $7
	jr nz, .asm_318b
	ld a, [wc9d9]
	or a
	ret z
	ld c, a
	homecall Func_6db13
	ret

.asm_318b
	cp $5
	ret nz
	ld a, [wc9d9]
	or a
	jr z, .asm_3197
	call Func_3238
.asm_3197
	ld a, [wCurPlayerFacing]
	ld b, a
	ld a, [wc9f5]
	cp b
	jr z, asm_31c2
	call Func_31e7
	ld a, [wROMBank]
	push af
	ld a, SPRITES_SPECIAL
	rst Bankswitch
	ld de, VTilesOB
	ld bc, $10
.asm_31b1
REPT 4
	ld a, [hli]
	ld [de], a
	inc de
ENDR
	dec c
	jr nz, .asm_31b1
	pop af
	rst Bankswitch
asm_31c2
	jp Func_320b

Func_31c5: ; 31c5 (0:31c5)
	ld a, [wCurPlayerFacing]
	ld b, a
	ld a, [wc9f5]
	cp b
	jr z, asm_31c2
	call Func_31e7
	ld a, [wROMBank]
	push af
	ld a, SPRITES_SPECIAL
	rst Bankswitch
	push hl
	pop de
	ld hl, VTilesOB
	ld bc, (2 * 2) tiles
	call Copy2bpp_2
	pop af
	rst Bankswitch
	ret

Func_31e7: ; 31e7 (0:31e7)
	ld a, b
	ld [wc9f5], a
Func_31eb:
	ld d, $0
	ld e, a
REPT 6
	sla e
	rl d
ENDR
	ld hl, SpecialSprite1
	add hl, de
	ret

Func_320b: ; 320b (0:320b)
	ld a, [wca64]
	ld h, a
	or a
	jr z, .asm_3237
	ld a, [wROMBank]
	push af
	ld a, [wca62]
	rst Bankswitch
	ld a, [wca63]
	ld l, a
	ld de, VTilesOB tile $4
	ld bc, $20
.asm_3224
	di
.asm_3225
	ld a, [rSTAT]
	and $2
	jr nz, .asm_3225
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ei
	inc de
	dec c
	jr nz, .asm_3224
	pop af
	rst Bankswitch
.asm_3237
	ret

Func_3238: ; 3238 (0:3238)
	ld a, $0
	ld [wc9d9], a
	ld [wc46c], a
	ld [wc46d], a
	ld a, BANK(TileMap_e1038)
	hlbgcoord 0, 5
	ld de, TileMap_e1038
	ld bc, $e0
	call FarCopy2bpp_2
	ret

Func_3252: ; 3252 (0:3252)
	call LoadMapBlockdataAndScriptHeader
Func_3255: ; 3255 (0:3255)
	decoord 0, 0
	ld hl, VBGMap
	ld b, $8
.asm_325d
	ld c, $a
.asm_325f
	push bc
	push hl
	ld a, [de]
	inc de
	push de
	call LoadMetatile
	pop de
	pop hl
	pop bc
	inc hl
	inc hl
	dec c
	jr nz, .asm_325f
	ld a, $0
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	push de
	ld de, 44
	add hl, de
	pop de
	dec b
	jr nz, .asm_325d
	homecall Func_39fab
	ret

LoadMetatile: ; 328d (0:328d)
	ld c, a
	ld a, [wROMBank]
	push af
	ld a, [wCurTilesetBank]
	rst Bankswitch
	ld a, [wCurTilesetMetatilesPointer + 1]
	ld d, a
	ld a, [wCurTilesetMetatilesPointer]
	ld e, a
	ld b, $0
REPT 2
	sla c
	rl b
ENDR
	push hl
	push bc
	ld a, c
	add e
	ld e, a
	ld a, b
	adc d
	ld d, a
	ld bc, BG_MAP_WIDTH - 1
	call .disable_and_load
	ld a, [wCurTilesetMetaattrsPointer + 1]
	ld h, a
	ld a, [wCurTilesetMetaattrsPointer]
	ld l, a
	pop bc
	add hl, bc
	ld d, h
	ld e, l
	pop hl
	check_cgb
	jr nz, .skip_attr
	ld bc, BG_MAP_WIDTH - 1
	ld a, $1
	di
	ld [rVBK], a
	call .just_load
	xor a
	ld [rVBK], a
	ei
.skip_attr
	pop af
	rst Bankswitch
	ret

.disable_and_load
	di
.just_load
.wait_stat_1
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat_1
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	inc de
	ld [hl], a
	add hl, bc
.wait_stat_2
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat_2
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hl], a
	ret

Func_32f6:
	ret

WrapAroundBGMapPointer: ; 32f7 (0:32f7)
	ld a, h
	cp VWindow >> 8
	jr c, .asm_32fe
	ld h, VBGMap >> 8
.asm_32fe
	ret

LoadMapScripts: ; 32ff (0:32ff)
	ld a, [wROMBank]
	push af
	ld a, BANK(MapObjectHeaders)
	rst Bankswitch
	ld a, $ff
	ld [wScriptCount], a
	ld hl, wWhichPhoneNumberSymbolCode
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld hl, MapObjectHeaders
	ld bc, $148
	ld a, [wMapGroup]
	ld d, a
	ld a, [wMapNumber]
	ld e, a
.loop
	ld a, [hli]
	cp d
	jr nz, .inc_next
	ld a, [hli]
	cp e
	jr nz, .next
	call AppendScriptIndexToBuffer
	jr .next

.inc_next
	inc hl
.next
	inc hl
	inc hl
	inc hl
	ld a, [wWhichPhoneNumberSymbolCode]
	inc a
	ld [wWhichPhoneNumberSymbolCode], a
	jr nz, .no_overflow
	ld a, [wMathBuffer3]
	inc a
	ld [wMathBuffer3], a
.no_overflow
	dec bc
	ld a, b
	or c
	jr nz, .loop
	ld a, [wScriptCount]
	inc a
	ld [wScriptCount], a
finish_collecting_map_scripts
	ld de, wCurMapScripts
	add a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $ff
	ld [de], a
	inc de
	ld a, $ff
	ld [de], a
	pop af
	rst Bankswitch
	ret

AppendScriptIndexToBuffer: ; 3363 (0:3363)
	push de
	ld a, [wScriptCount]
	inc a
	ld [wScriptCount], a
	cp 15
	jr nc, .break
	ld de, wCurMapScripts
	add a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wWhichPhoneNumberSymbolCode]
	ld [de], a
	inc de
	ld a, [wMathBuffer3]
	ld [de], a
	pop de
	ret

.break
	add sp, $4
	jr finish_collecting_map_scripts

LoadTilesetGFX_: ; 3388 (0:3388)
	homecall LoadTilesetGFX
	ret

Func_3395: ; 3395 (0:3395)
	homecall Func_2e3ff
	ret

Func_33a2: ; 33a2 (0:33a2)
	homecall Func_2e466
	ret

LoadTextBoxPalette_:
	homecall LoadTextBoxPalette
	ret

Func_33bc:
	homecall Func_2c6e2
	ret

PrintMapObjectText_: ; 33c9 (0:33c9)
	homecall PrintMapObjectText
	ret

LoadAndStartStdTextPointer_:
	homecall LoadAndStartStdTextPointer
	ret

CenterAlignDenjuuName_:
	homecall CenterAlignDenjuuName
	ret

Func_33f0:
	homecall Func_33a90
	ret

Func_33fd:
	ld [wScriptCount], a
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a8c50)
	rst Bankswitch
	ld a, [wScriptCount]
	call Func_a8c50
	pop af
	rst Bankswitch
	ret

Func_3410:
	homecall Func_a8c86
	ret

Func_341d:
	homecall Func_2de18
	ret

ResumeNormalMusicIfPhoneIsRinging: ; 342a (0:342a)
	ld a, [wOverworldRingtoneSubroutine]
	or a
	ret z
	ld a, $3
	ld [wOverworldRingtoneSubroutine], a
	ret

PlayMapMusic_: ; 3435 (0:3435)
	homecall PlayMapMusic
	ret

HandleOverworldGFX: ; 3442 (0:3442)
	ld a, [wGameRoutine]
	cp $5
	ret nz
	ld a, [wSubroutine]
	cp $5
	jr z, .go
	cp $4
	ret nz
.go
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wc952]
	inc a
	ld [wc952], a
	ld a, [wROMBank]
	push af
	ld a, BANK(Pointers_e1690)
	rst Bankswitch
	ld a, [wCurTilesetIdx]
	ld hl, Pointers_e1690
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [hli]
	ld b, a
	or a
	jr nz, .stuff_to_copy
	pop af
	rst Bankswitch
	ret

.stuff_to_copy
	ld de, wca48
.loop
	push bc
	push hl
	push de
	ld a, [wc952]
	ld c, a
	ld a, [hli]
	and c
	cp b
	jr nz, .next
	ld a, [de]
	inc a
	ld [de], a
	ld c, a
	ld a, [hli]
	add c
	and $3
	ld c, a
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, c
	swap a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call CopyTile
.next
	pop de
	inc de
	pop hl
	pop bc
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .loop
	pop af
	rst Bankswitch
	ret

CopyTile: ; 34ba (0:34ba)
	ld b, $4
.asm_34bc
	di
.asm_34bd
	ld a, [rSTAT]
	and $2
	jr nz, .asm_34bd
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ei
	inc de
	di
.asm_34cb
	ld a, [rSTAT]
	and $2
	jr nz, .asm_34cb
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .asm_34bc
	ret

Func_34dc: ; 34dc (0:34dc)
	ld b, a
	ld a, [wOverworldRandomSeed]
	add b
	ld [wOverworldRandomSeed], a
	ld a, [wc945]
	or a
	ret z
	ld a, [wc984]
	sub $1
	ld b, a
	and $3
	ret nz
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e197c)
	rst Bankswitch
	ld a, b
	srl a
	srl a
	and $7
	swap a
	ld de, GFX_e197c
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, VTilesOB tile $7b
	call CopyTile
	pop af
	rst Bankswitch
	ret

Func_3514:
	call CheckEventFlag
	ld b, $f0
	jr z, .asm_351c
	inc b
.asm_351c
	di
	call TextWaitStat
	ld [hl], b
	ei
	ld a, $1
	ld [rVBK], a
	di
	call TextWaitStat
	ld a, $4
	ld [hl], a
	ei
	ld a, $0
	ld [rVBK], a
	ret

Func_3533:
	push bc
	ld a, b
	call Func_353b
	pop bc
	inc hl
	ld a, c
Func_353b: ; 353b (0:353b)
	ld b, a
	swap a
	and $f
	add $f0
	di
	ld c, a
.asm_3544
	ld a, [rSTAT]
	and $2
	jr nz, .asm_3544
	ld a, c
	ld [hli], a
	ld a, b
	and $f
	add $f0
	ld [hl], a
.asm_3552
	ld a, [rSTAT]
	and $2
	jr nz, .asm_3552
	ld a, $1
	ld [rVBK], a
	ld [hl], $4
	dec hl
	ld [hl], $4
	xor a
	ld [rVBK], a
	ei
	ret

LoadSpecialFontTiles: ; 3566 (0:3566)
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0b38)
	rst Bankswitch
	ld a, [wTileWhere0IsLoaded]
	call GetCurrentTileVRAMAddress
	ld de, GFX_e0b38
	ld b, $80
asm_3578
	di
	ld a, [wFontPaletteMode]
	cp $2
	jr z, .inverted
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [de]
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, asm_3578
	pop af
	rst Bankswitch
	ret

.inverted
.wait_stat_inverted
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat_inverted
	ld a, [de]
	cpl
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, asm_3578
	pop af
	rst Bankswitch
	ret

Func_35a3:
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0bb8)
	rst Bankswitch
	ld a, $f0
asm_35ac
	call GetCurrentTileVRAMAddress
	ld de, GFX_e0bb8
	ld b, $80
	jp asm_3578

Func_35b7:
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0bb8)
	rst Bankswitch
	ld a, $b0
	jr asm_35ac

GetCurrentTileVRAMAddress: ; 35c2 (0:35c2)
	cp $80
	jr c, .low_bg
	swap a
	ld h, a
	and $f0
	ld l, a
	ld a, h
	and $f
	or (VTilesShared & $f000) >> 8
	ld h, a
	ret

.low_bg
	swap a
	ld h, a
	and $f0
	ld l, a
	ld a, h
	and $f
	or (VTilesBG & $f000) >> 8
	ld h, a
	ret

Func_35e0: ; 35e0 (0:35e0)
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e09d8)
	rst Bankswitch
	ld a, [wc95b]
	or a
	jr nz, .asm_360b
	ld hl, VTilesShared tile $14
	ld de, GFX_e09d8
	ld bc, $130
	call Copy2bpp_2
	ld de, TileMap_e03a0
	hlbgcoord 0, 0, VWindow
	call Func_3694
	hlbgcoord 0, 1, VWindow
	call Func_3694
	pop af
	rst Bankswitch
	ret

.asm_360b
	ld hl, VTilesShared tile $14
	ld de, GFX_e0418
	ld bc, $60
	call Copy2bpp_2
	ld hl, VTilesShared tile $36
	ld bc, $60
	call Copy2bpp_2
	ld hl, VTilesShared tile $20
	ld de, GFX_e06b8
	ld bc, $c0
	call Copy2bpp_2
	ld a, [wc9de]
	or a
	jr z, .asm_363e
	ld de, GFX_e0918
	ld hl, VTilesShared tile $26
	ld bc, $60
	call Copy2bpp_2
.asm_363e
	ld a, [wc935]
	or a
	jr z, .asm_3650
	ld de, GFX_e0978
	ld hl, VTilesShared tile $20
	ld bc, $60
	call Copy2bpp_2
.asm_3650
	ld a, [wShowClockInOverworld]
	or a
	jr nz, .asm_3659
	call Func_36cf
.asm_3659
	ld a, $ff
	ld [wc9ea], a
	ld [wc9eb], a
	ld [wc9ed], a
	homecall Func_a50cd
	pop af
	rst Bankswitch
Func_3672:
	ld de, TileMap_e03f0
	ld a, [wShowClockInOverworld]
	or a
	jr nz, asm_367e
Func_367b:
	ld de, TileMap_e03c8
asm_367e
	ld a, [wROMBank]
	push af
	ld a, BANK(TileMap_e03c8)
	rst Bankswitch
	hlbgcoord 0, 0, VWindow
	call Func_3694
	hlbgcoord 0, 1, VWindow
	call Func_3694
	pop af
	rst Bankswitch
	ret

Func_3694: ; 3694 (0:3694)
	ld bc, SCREEN_WIDTH
	check_cgb
	jr nz, .asm_36bc
.asm_369e
	di
	call TextWaitStat
	ld a, [de]
	add $94
	ld [hl], a
	ld a, $1
	ld [rVBK], a
	call TextWaitStat
	ld a, PRIORITY | $6
	ld [hli], a
	ld a, $0
	ld [rVBK], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_369e
	ret

.asm_36bc
	di
.asm_36bd
	ld a, [rSTAT]
	and $2
	jr nz, .asm_36bd
	ld a, [de]
	add $94
	ld [hli], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_36bc
	ret

Func_36cf: ; 36cf (0:36cf)
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0898)
	rst Bankswitch
	ld de, GFX_e0898
	ld a, [wPhoneSilentMode]
	swap a
	sla a
	sla a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, VTilesShared tile $2c
	ld bc, $40
	call Copy2bpp_2
	pop af
	rst Bankswitch
Func_36f3:
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0778)
	rst Bankswitch
	ld de, GFX_e0778
	ld a, [wc90b]
	swap a
	sla a
	ld b, a
	sla a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld hl, VTilesShared tile $30
	ld bc, $60
	call Copy2bpp_2
	pop af
	rst Bankswitch
	ret

CompressPhoneNumber_:
	homecall CompressPhoneNumber
	ret

FarCopy2bpp_2: ; 372d (0:372d)
	push af
	ld a, [wROMBank]
	ld [wca52], a
	pop af
	rst Bankswitch
	call Copy2bpp_2
	ld a, [wca52]
	rst Bankswitch
	ret

Func_373e:
	ld a, [wROMBank]
	push af
	ld a, BANK(DenjuuPalettes)
	rst Bankswitch
.asm_3745
	ld a, [hli]
	ld b, a
	and $1f
	ld [de], a
	inc de
	ld a, b
	rlca
	rlca
	rlca
	and $7
	ld b, a
	ld a, [hl]
	rlca
	rlca
	rlca
	and $18
	or b
	ld [de], a
	inc de
	ld a, [hli]
	rrca
	rrca
	and $1f
	ld [de], a
	inc de
	dec c
	jr nz, .asm_3745
	pop af
	rst Bankswitch
	ret

homecall_ret_2e562:
	homecall ret_2e562
	ret

Func_3775:
	ld d, a
	call FillVRAMWithByte
	ld a, d
	ret

FillAttrMapBoxWithByte:
; Fill (bc, d) box starting at (hl) with a
.asm_377b
	push af
	call FillAttrMapWithByte
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop af
	dec d
	jr nz, .asm_377b
	ret

FillAttrMapWithByte: ; 378c (0:378c)
	push af
	check_cgb
	jr nz, asm_37d2
	pop af
	push de
	push hl
	push bc
	ld d, a
	ld a, $1
	ld [rVBK], a
	call FillVRAMWithByte
	ld a, $0
	ld [rVBK], a
	pop bc
	pop hl
	pop de
	ld a, d
	ret

FillVRAMWithByte: ; 37a9 (0:37a9)
	bit 0, c
	jr z, ._1bpp
._2bpp_loop
	di
._2bpp_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, ._2bpp_waitstat
	ld a, d
	ld [hli], a
	ei
	dec bc
	ld a, b
	or c
	jr nz, ._2bpp_loop
	ret

._1bpp
	srl b
	rr c
._1bpp_loop
	di
._1bpp_waitstat
	ld a, [rSTAT]
	and $2
	jr nz, ._1bpp_waitstat
	ld a, d
	ld [hli], a
	ld [hli], a
	ei
	dec bc
	ld a, b
	or c
	jr nz, ._1bpp_loop
	ret

asm_37d2
	add sp, $2
	ret

Func_37d5: ; 37d5 (0:37d5)
	ld a, [wROMBank]
	push af
	ld a, BANK(GFX_e0000)
	rst Bankswitch
	ld hl, VTilesOB tile $70
	ld de, GFX_e0000
	ld bc, $c0
	call Copy2bpp_2
	ld hl, VTilesShared
	ld de, GFX_e01f0
	ld a, [wMapGroup]
	cp $a
	jr nc, .asm_37f8
	ld de, GFX_e00c0
.asm_37f8
	ld bc, $130
	call Copy2bpp_2
	pop af
	rst Bankswitch
	ret

Copy2bpp_2: ; 3801 (0:3801)
	bit 0, c
	jr z, .double
.loop1
	di
.waitstat1
	ld a, [rSTAT]
	and $2
	jr nz, .waitstat1
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop1
	ret

.double
	srl b
	rr c
.loop2
	di
.waitstat2
	ld a, [rSTAT]
	and $2
	jr nz, .waitstat2
	ld a, [de]
	inc de
	ld [hli], a
	ld a, [de]
	ld [hli], a
	ei
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .loop2
	ret

PushOBPal:
	push af
	ld de, rOBPI
	call SetPalCtrlRegister
	ld de, rOBPD
	jr asm_3844

PushBGPal:
	push af
	ld de, rBGPI
	call SetPalCtrlRegister
	ld de, rBGPD
asm_3844
	di
.asm_3845
	ld a, [rSTAT]
	and $2
	jr nz, .asm_3845
REPT 1 palettes
	ld a, [hli]
	ld [de], a
ENDR
	ei
	pop af
	inc a
	ret

SetPalCtrlRegister: ; 385f (0:385f)
	sla a
	sla a
	sla a
	or $80
	ld [de], a
	ret

Func_3869: ; 3869 (0:3869)
	ld a, [wca61]
	or a
	ret z
	ld b, a
	xor a
	ld [wca61], a
	ld hl, wcac8
	ld a, b
	dec a
	cp $8
	jr c, PushBGPal
	sub $8
	jr PushOBPal

Func_3880: ; 3880 (0:3880)
	ret

Func_3881:
	ret

INCLUDE "home/pcm.asm"
INCLUDE "home/hp_bar.asm"

LoadUnknGfx090_: ; 39ec (0:39ec)
	push af
	ld a, BANK(UnknGFX_090)
	rst Bankswitch
	pop af
	ld d, a
	ld e, $0
	ld hl, UnknGFX_090
	add hl, de
	ld de, VTilesOB tile $30
	ld bc, $10 tiles
	jp WaitStatCopy

Get8CharName: ; 3a01 (0:3a01)
	ld d, $0
	ld a, [wNamedObjectIndexBuffer]
	ld e, a
REPT 3
	sla e
	rl d
ENDR
	add hl, de
	ld bc, $8
	ld de, wStringBuffer
	jp CopyData

Get4CharName: ; 3a1d (0:3a1d)
	ld d, $0
	ld a, [wNamedObjectIndexBuffer]
	ld e, a
REPT 2
	sla e
	rl d
ENDR
	add hl, de
	ld bc, $4
	ld de, wStringBuffer
	jp CopyData

GetOrCalcStatC: ; 3a35 (0:3a35)
; [wCurDenjuuStat] = BaseStats + ($10 * a) + c
; level in b if applicable
	ld hl, BaseStats
	ld [wCurDenjuu], a
	cp $0
	jr z, .first_row
	ld d, $0
	ld a, $10
	ld e, a
	ld a, [wCurDenjuu]
.row
	add hl, de
	dec a
	jr nz, .row
.first_row
	ld d, $0
	ld a, c
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wCurDenjuuStat], a
; if (c >= 6) or (b < 2): return
	ld a, c
	cp DENJUU_MOVE1
	ret nc
	ld a, b
	cp $2
	ret c
; get an offset multiplier (stored in wd494)
	dec b
	ld d, $0
	ld a, b
	ld e, a
	push de
	ld a, c
	ld b, a
	ld a, [wCurDenjuu]
	call GetStatOffsetMultiplier_
	pop de
	ld a, e
	cp $1
	jr nz, .multiply
	ld a, [wd494]
	cp $1
	jr nz, .multiply
	ld e, $1
	jr .offset

.multiply
; max(1, (level - 1) * offset / 2) + 2 * base
	ld b, $0
	ld a, [wd494]
	ld c, a
	call Multiply_DE_by_BC
	sra d
	rr e
.offset
	ld a, [wCurDenjuuStat]
	ld a, a
	add e
	ld [wCurDenjuuStat], a
	ret

PlaceString: ; 3a91 (0:3a91)
	xor a
	ld [wcb2f], a
.loop
	push bc
	push de
	push hl
	ld a, [de]
	cp $e0
	jp z, .break
	pop hl
	push hl
	call LoadCharacter_
	pop hl
	ld bc, 1 tiles
	add hl, bc
	pop de
	inc de
	ld a, [wcb2f]
	inc a
	ld [wcb2f], a
	pop bc
	dec b
	jp nz, .loop
	ret

.break
	pop hl
	pop de
	pop bc
	ret

Func_3abb:
	di
	call WaitStat
	ld [hl], c
	ei
	ret

Data_3ac2:
	db $0

GetAndPrintName75LeftAlign: ; 3ac3 (0:3ac3)
	ld [wNamedObjectIndexBuffer], a
	push bc
	push de
	pop hl
	call Get8CharName75
	pop hl
	push hl
	ld a, $8
	call ClearString
	pop hl
	ld de, wStringBuffer
	ld b, $8
	jp PlaceString_

GetAndPrintName75CenterAlign:
	ld [wNamedObjectIndexBuffer], a
	push bc
	push de
	ld hl, wc3a0
	ld b, $9
.asm_3ae6
	ld a, $e0
	ld [hli], a
	dec b
	jr nz, .asm_3ae6
	pop hl
	call Get8CharName75
	pop hl
	push hl
	ld a, $8
	call ClearString
	ld hl, wStringBuffer
	ld de, wc3a0
	call CenterAlignDenjuuName_
	ld de, wc3a0
	pop hl
	ld b, $8
	jp PlaceString_

Func_3b09: ; 3b09 (0:3b09)
	ld [wNamedObjectIndexBuffer], a
	push bc
	push de
	pop hl
	call Get4CharName75
	pop hl
	push hl
	ld a, $4
	call ClearString
	pop hl
	ld de, wStringBuffer
	ld b, $4
	jp PlaceString_

PrintCurDenjuuTypeName: ; 3b22 (0:3b22)
	ld a, [wCurDenjuu]
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, TypeNames
	ld bc, VTilesBG tile $38
	jp Func_3b09

Func_3b36: ; 3b36 (0:3b36)
	push hl
	ld a, b
	ld de, Data_1d7988
	pop bc
	jp Func_3b09

GetDenjuuSprite: ; 3b3f (0:3b3f)
	ld hl, DenjuuSprites
	ld d, $0
	ld a, [wd409]
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd409], a
	ret

GetExpToNextLevel_: ; 3b4e (0:3b4e)
	ld hl, GrowthRates
	ld de, 2 * 99
	addntimes_hl_de
	dec b
	ld d, $0
	ld a, b
	ld e, a
	sla e
	rl d
	add hl, de
	ld c, [hl]
	inc hl
	ld a, [hl]
	ld b, a
	ret

Data_3b6b:
	db 0, 2, 4
	db 0, 2, 4
	db 0, 2, 4

Func_3b74: ; 3b74 (0:3b74)
	ld hl, Data_9c4a4
	ld de, 25
	addntimes_hl_de
	ld d, $0
	ld a, b
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd4ec], a
	ld hl, Data_3b6b
	ld d, $0
	ld a, [wDShotLevel]
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	ld a, [wd4ec]
	cp b
	jr z, .minimum
	cp b
	jr c, .minimum
	sub b
	jr .load

.minimum
	ld a, $1
.load
	ld [wd4ec], a
	ret

GetStatOffsetMultiplier: ; 3ba9 (0:3ba9)
	ld hl, StatOffsetMultipliers
	ld de, 6
	addntimes_hl_de
	ld d, $0
	ld a, b
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd494], a
	ret

Func_3bc1: ; 3bc1 (0:3bc1)
	ld hl, Data_9cb29
	dec a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	call Random
	and $3
	add b
	ld [wd495], a
	ret

PrintNumHL:
; Print a 16-bit number in hl to [wBattleTargetName]
get_digit: MACRO
IF \1 == 1
	ld a, l
ELSE
	push de
	ld c, 0
	ld de, -\1
.loop\@
	inc c
	add hl, de
	jr c, .loop\@
	ld de, \1
	add hl, de
	pop de
	ld a, c
	dec a
IF \2 == 1
	bit 0, b
	jr nz, .add\@
ENDC
	or a
	jr z, .skip\@
.add\@
ENDC
	add "0"
	ld [de], a
	inc de
IF \1 > 1
	ld b, $1
.skip\@
ENDC
ENDM

	ld de, wBattleTargetName
	ld b, $0
x = 10000
y = 0
REPT 5
	get_digit x, y
x = x / 10
y = 1
ENDR
	ld a, $e0
	ld [de], a
	ret

ChooseWildDenjuuEncounter: ; 3c57 (0:3c57)
	ld hl, Data_1d56ee
	ld de, $5
	ld a, [wCurWildDenjuuEncounterTableIndex]
	addntimes_hl_de
	push hl
	call Random
	cp $19
	jr c, .asm_3c7a
	cp $4c
	jr c, .asm_3c7b
	cp $99
	jr c, .asm_3c7c
	jr .asm_3c7d

.asm_3c7a
	inc hl
.asm_3c7b
	inc hl
.asm_3c7c
	inc hl
.asm_3c7d
	ld a, [hl]
	ld [wTempWildDenjuuSpecies], a
	pop hl
	ld de, $4
	add hl, de
	ld a, [hl]
	ld [wTempWildDenjuuLevel], a
	ret

LoadDenjuuBattleCatchphrase: ; 3c8b (0:3c8b)
	ld a, [wNamedObjectIndexBuffer]
	cp $0
	jr z, .first_string
	ld e, a
	ld d, $0
REPT 4
	sla e
	rl d
ENDR
	add hl, de
.first_string
	ld bc, $f
	ld de, wd4d0
	call CopyData
	ld a, $e0
	ld [wTempWildDenjuuSpecies], a
	ret

Func_3cb5:
	push af
	call InitBattleMenuCursor
	ld hl, wOAMAnimations
	ld de, $20
	ld a, [wWhichBattleMenuCursor]
.asm_3cc2
	cp $0
	jr z, .asm_3cca
	add hl, de
	dec a
	jr .asm_3cc2

.asm_3cca
	push hl
	pop de
	pop af
	jp Func_0609

Func_3cd0:
	ld hl, wOAMAnimations
	ld de, $20
	ld a, [wWhichBattleMenuCursor]
.addntimes
	cp $0
	jr z, .okay
	add hl, de
	dec a
	jr .addntimes

.okay
	push hl
	pop de
	push de
	call AnimateObject_
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld hl, $6
	pop de
	add hl, de
	ld a, [hl]
	cp $0
	ret nz
	jp NextMoveAnimationSubroutine

NextBattleSubroutine:
	ld hl, wBattleSubroutine
	inc [hl]
	ret

NextMoveAnimationSubroutine: ; 3cfd (0:3cfd)
	ld hl, wMoveAnimationSubroutine
	inc [hl]
	ret

StdBattleTextBox:
	ld b, $0
	ld d, $c
	ld a, $60
	ld [wTextBoxStartTile], a
	jp AnchorMapAndLoadTextPointer_

GetNthAddressBookAttributeAddr:
	push hl
	ld c, a
	ld e, $10
	call Multiply_C_by_E
	pop hl
	add hl, de
	ret

InitBattleMenuCursor: ; 3d18 (0:3d18)
	ld hl, wOAMAnimations
	ld de, $20
	ld a, [wWhichBattleMenuCursor]
	addntimes_hl_de
	push hl
	ld hl, wSpriteInitXCoordBuffers + 0
	ld d, $0
	ld a, [wWhichBattleMenuCursor]
	ld e, a
	add hl, de
	ld a, [hl]
	ld b, a
	ld hl, wSpriteInitYCoordBuffers + 0
	ld d, $0
	ld a, [wWhichBattleMenuCursor]
	ld e, a
	add hl, de
	ld a, [hl]
	ld c, a
	pop hl
	ld de, 0
	add hl, de
	ld a, $1
	ld [hli], a
	ld a, [wd4ee]
	ld [hli], a
	ld a, [wBattleMenuCursorObjectTemplateIDX]
	ld [hli], a
	ld a, b
	ld [hli], a
	ld a, c
	ld [hli], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

ClearString: ; 3d5c (0:3d5c)
	push af
	ld de, Data_3ac2
	ld b, $1
	call PlaceString_
	pop af
	dec a
	jr nz, ClearString
	ret

OpenSRAMBank2:
	push af
	enable_sram sAddressBook
	pop af
	ret

CloseSRAM:
	push af
	disable_sram
	pop af
	ret

CopyPlayerDenjuuNameToBattleUserName:
	ld hl, wBattleUserName
	ld a, $9
	push hl
.clear
	ld [hl], $0
	inc hl
	dec a
	jr nz, .clear
	ld bc, $7
	pop de
	ld hl, wBattlePlayerDenjuuName
	jp CopyData

GetCurDenjuuKanjiDescription:
	cp ANGIOS
	jr c, .asm_3dcb
	cp FIREKOKKO
	jr c, .asm_3dcf
	cp GILERTH
	jr c, .asm_3dd3
	cp ANGIORN
	jr c, .asm_3dd7
	cp KIYORUKA
	jr c, .asm_3ddb
	cp EASYDOG
	jr c, .asm_3ddf
	cp GILGIERTH
	jr c, .asm_3de3
	cp ANGILANCE
	jr c, .asm_3de7
	cp ANGIPOWER
	jr c, .asm_3deb
	cp GIGAGIGERTH
	jr c, .asm_3def
	cp ANGIGORGO
	jr c, .asm_3df3
	cp ANGIOROS
	jr c, .asm_3df7
	cp DENDEL
	jr c, .asm_3dfb
	jr .asm_3deb

.asm_3dcb
	ld a, $0
	jr .asm_3dfd

.asm_3dcf
	ld a, $1
	jr .asm_3dfd

.asm_3dd3
	ld a, $4
	jr .asm_3dfd

.asm_3dd7
	ld a, $2
	jr .asm_3dfd

.asm_3ddb
	ld a, $3
	jr .asm_3dfd

.asm_3ddf
	ld a, $5
	jr .asm_3dfd

.asm_3de3
	ld a, $8
	jr .asm_3dfd

.asm_3de7
	ld a, $6
	jr .asm_3dfd

.asm_3deb
	ld a, $7
	jr .asm_3dfd

.asm_3def
	ld a, $9
	jr .asm_3dfd

.asm_3df3
	ld a, $a
	jr .asm_3dfd

.asm_3df7
	ld a, $b
	jr .asm_3dfd

.asm_3dfb
	ld a, $c
.asm_3dfd
	jp LoadKanji_

Func_3e00: ; 3e00 (0:3e00)
	ld hl, Data_9cbb2
	ld de, $c
	ld a, b
	addntimes_hl_de
	ld d, $0
	ld a, c
	ld e, a
	add hl, de
	ld a, [hl]
	ld [wd43d], a
	ret

PrintStringWithPlayerDenjuuAsBattleUser:
	push hl
	push af
	call OpenSRAMBank2
	pop af
	ld hl, sAddressBook + 6
	call GetNthAddressBookAttributeAddr
	push hl
	pop de
	call GetDenjuuNicknameFromAdddressBookOffset_
	call OpenSRAMBank2
	call CopyPlayerDenjuuNameToBattleUserName
	call CloseSRAM
	ld hl, wBattleUserName
	ld de, wOAMAnimationsEnd
	call CenterAlignDenjuuName_
	ld de, wOAMAnimationsEnd
	ld b, $8
	pop hl
	jp PlaceString_

LoadScriptedEnemyDenjuu: ; 3e45 (0:3e45)
	ld hl, ScriptedEnemyDenjuu
	ld de, $5
	ld a, [wCurWildDenjuuEncounterTableIndex]
	addntimes_hl_de
	ld a, [hli]
	ld [wEnemyDenjuu1Species], a
	ld a, [hli]
	ld [wEnemyDenjuu1Level], a
	ld a, [hli]
	ld [wEnemyDenjuu1FD], a
	inc hl
	ld a, [hl]
	ld [wEnemyDenjuu1Field0x0c], a
	ret

LoadEnemyTFangerParty: ; 3e68 (0:3e68)
	ld hl, EnemyTFangerParties
	ld de, $12
	ld a, [wCurWildDenjuuEncounterTableIndex]
	addntimes_hl_de
	ld a, [hli]
	ld [wEnemyDenjuu1Species], a
	ld a, [hli]
	ld [wEnemyDenjuu1Level], a
	ld a, [hli]
	ld [wEnemyDenjuu1Field0x08], a
	ld a, [hli]
	ld [wEnemyDenjuu1FD], a
	inc hl
	ld a, [hli]
	ld [wEnemyDenjuu1Field0x0c], a
	ld a, [hli]
	ld [wEnemyDenjuu2Species], a
	ld a, [hli]
	ld [wEnemyDenjuu2Level], a
	ld a, [hli]
	ld [wEnemyDenjuu2Field0x08], a
	ld a, [hli]
	ld [wEnemyDenjuu2FD], a
	inc hl
	ld a, [hli]
	ld [wEnemyDenjuu2Field0x0c], a
	ld a, [hli]
	ld [wEnemyDenjuu3Species], a
	ld a, [hli]
	ld [wEnemyDenjuu3Level], a
	ld a, [hli]
	ld [wEnemyDenjuu3Field0x08], a
	ld a, [hli]
	ld [wEnemyDenjuu3FD], a
	inc hl
	ld a, [hl]
	ld [wEnemyDenjuu3Field0x0c], a
	ret

LoadBackgroundPalette
	ld hl, wCGB_BGPalsBuffer
	ld b, $0
	ld c, a
	add hl, bc
	ld a, [wUIColor]
	cp $1
	jr z, .asm_3ed7
	cp $2
	jr z, .asm_3edf
	cp $3
	jr z, .asm_3ee7
	; RGB 31, 31, 00
	ld a, $ff
	ld [hli], a
	ld a, $3
	ld [hl], a
	jr .asm_3eed

.asm_3ed7
	; RGB 00, 24, 31
	ld a, $0
	ld [hli], a
	ld a, $7f
	ld [hl], a
	jr .asm_3eed

.asm_3edf
	; RGB 31, 16, 31
	ld a, $1f
	ld [hli], a
	ld a, $7e
	ld [hl], a
	jr .asm_3eed

.asm_3ee7
	; RGB 06, 31, 06
	ld a, $e6
	ld [hli], a
	ld a, $1b
	ld [hl], a
.asm_3eed
	ret

Func_3eee:
	ld hl, wdb00
	ld d, $0
	ld a, [wdc45]
	ld e, a
	add hl, de
	ld a, [hl]
	ret

Func_3efa:
	homecall_memret Func_7122c
	ret

Func_3f02:
	homecall_memret Func_703c4
	ret

Func_3f0a:
	homecall_memret Func_70a99
	ret

Func_3f12:
	homecall_memret Func_7d2c3
	ret

IsLegendaryInParty_:
	homecall_memret IsLegendaryInParty
	ret

Func_3f22:
	homecall_memret Func_7048c
	ret

Func_3f2a:
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_3f4a
	ld a, [wCurDenjuuBufferArrivedStatus]
	cp $1
	jr z, .asm_3f47
	cp $4
	jr z, .asm_3f47
	cp $3
	jr z, .asm_3f44
	cp $5
	jr nz, .asm_3f4a
.asm_3f44
	ld a, $2
	ret

.asm_3f47
	ld a, $1
	ret

.asm_3f4a
	ld a, $0
	ret

Func_3f4d:
	ld [wFontSourceBank], sp
	ld a, [wcae8]
	ld [MBC3RomBank], a
	ld a, $1
	ld [rVBK], a
	ld hl, wcae5
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld de, $100
	add hl, de
	ld sp, hl
	ld a, $80
	ld hl, rBGPI
	ld [hl], a
	ld hl, rLY
	ld a, $6
.asm_3f70
	cp [hl]
	jr nz, .asm_3f70
.asm_3f73
	pop de
	ld l, rSTAT & $ff
.asm_3f76
	bit 1, [hl]
	jr nz, .asm_3f76
	ld l, rBGPD & $ff
REPT 15
	ld [hl], e
	ld [hl], d
	pop de
ENDR
	ld [hl], e
	ld [hl], d
	ld a, [rLY]
	cp $88
	jr nz, .asm_3f73
	ld a, $29
	ld [MBC3RomBank], a
	ld hl, wFontSourceBank
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld sp, hl
	ret

Func_3fbe:
	ld d, a
	ld a, [wROMBank]
	push af
	ld a, d
	rst Bankswitch
	ld a, $12
.asm_3fc7
	ld e, $14
	push af
.asm_3fca
	ld a, [bc]
	inc bc
	ld [hli], a
	dec e
	jr nz, .asm_3fca
	ld de, $c
	add hl, de
	pop af
	dec a
	jr nz, .asm_3fc7
	pop af
	rst Bankswitch
	ret

Func_3fdb:
	ld [wFontSourceBank], a
	ld a, [wROMBank]
	push af
	ld a, [wFontSourceBank]
	rst Bankswitch
.asm_3fe6
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_3fe6
	pop af
	rst Bankswitch
	ret
