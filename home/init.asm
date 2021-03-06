Start::
	ld [wCGB], a
	di
	call DisableLCD
	xor a
	ld [rIF], a
	ld [rIE], a
	ld sp, wStackTop
	enable_sram
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
	call ClearWRAM ; 097c
	pop af
	ld [wCGB], a
	call LoadPushOAM ; 079a
	call InitSoundData ; 0439
	ld a, 1
	ld [wSpriteUpdatesEnabled], a
	call WhiteDMGPals ; 1043
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
	ld [wLinkMode], a
	ld a, $1
	ld [wBGPalUpdate], a
	ld [wOBPalUpdate], a
	xor a
	call GetCGB_BGLayout ; 109d
	call GetCGB_OBLayout ; 1145
	ld a, BANK(InitialSGBRequest)
	rst Bankswitch
	xor a
	ld [wSGB], a
	call InitialSGBRequest
	jp nc, .skip
	ld a, $1
	ld [wSGB], a
	call PushSGBBorder
.skip
	xor a
	ld [wGameRoutine], a
	ld [wSubroutine], a
	ld a, $3
	rst Bankswitch
.loop
	ld a, [wVBlankCounter]
	inc a
	ld [wVBlankCounter], a
	call SoftResetCheck
	ld a, [wLinkMode]
	or a
	jr z, .skip2
	call GetNthByteReceivedFromSerial
	call StageNthByteForSerialSend
	call Func_1d46
.skip2
	call .SerialCheck
	call UpdatePalsCGB
	call Func_3869
	call ReadJoypad
	call RunGameRoutine
	call UpdateSprites
	ld a, 1
	ld [wFinishedCurrentFrame], a
.wait
	ld a, [hVBlankOccurred]
	and a
	jr z, .wait
	xor a
	ld [hVBlankOccurred], a
	ld [wFinishedCurrentFrame], a
	jp .loop

.SerialCheck:
	ld a, [wdc05]
	or a
	ret z
	ld a, [wdc01]
	or a
	jr z, .asm_252
	ld a, [wSerialReceive]
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
