INCLUDE "includes.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

INCLUDE "home.asm"

SECTION "bank 02", ROMX, BANK [$2]
Func_8000::
	ld a, [wSubroutine]
	ld hl, Pointers_800a
	call GetShortFromTable
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
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapAttrLayout_
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
	call PaletteFade_
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
	ld a, [wTextSubroutine]
	cp $9
	ret nz
.start
	jp IncrementSubroutine

Func_808e::
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_80a0::
	ld a, $1
	call PaletteFade_
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
	call GetShortFromTable
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
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $3f
	ld a, $0
	call LoadStdBGMapAttrLayout_
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
	call PaletteFade_
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
	ld a, [wTextSubroutine]
	cp $9
	ret nz
.asm_855a
	jp IncrementSubroutine

Func_855d::
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_856f::
	ld a, $1
	call PaletteFade_
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

GameOverScreen: ; 858e (2:458e)
	ld a, [wSubroutine]
	ld hl, Pointers_8598
	call GetShortFromTable
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
	lb bc, $0, $0
	ld e, $72
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $72
	ld a, $0
	call LoadStdBGMapAttrLayout_
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
	call PaletteFade_
	or a
	ret z
	jp IncrementSubroutine

Func_85f7:
	ld a, [hJoyNew]
	and START
	ret z
	jp IncrementSubroutine

Func_85ff:
	ld a, $3
	ld [H_SFX_ID], a
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp IncrementSubroutine

Func_8611:
	ld a, $1
	call PaletteFade_
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
	ld a, [wVBlankCounter]
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
	call GetShortFromTable
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
	ld [wSpriteUpdatesEnabled], a
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
	call PaletteFade_
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
	ld a, [wMoveAnimationSubroutine]
	ld hl, Pointers_8b95
	call GetShortFromTable
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

String_8ba7:
	db "せんとうわざ  "

UnknownMoveString:
	db "  ????  "

LandmarkNames:
	db "トロンコむら$" ; Toronko Village
	db "クリノンむら$" ; Kurinon Village
	db "うみのみえるまち イーリス$" ; The town with a view of the see - Iris
	db "パームかい$" ; Palm Sea
	db "キカイのまち フリジア$" ; Machine Town Freesia
	db "すなのまち バーラン$" ; Barran Desert
	db "イオンとう$" ; Ion Island
	db "パパルナこ$" ; Paparuna Lake
	db "パンセスむら$" ; Panses Village
	db "トリパむら$" ; Tripa Village
	db "フラウラむら$" ; Flaura Village
	db "あくまのやま ぺぺリやま$" ; Devil's Mountain: Peperi Mountain
	db "イクソスのもリ$" ; Ixos Forest
	db "カクトスいせき$" ; Cactos Ruins
	db "ブリオンいせき$" ; Burion Ruins
	db "トロンコむら すいげん$" ; Toronoko Village Spring
	db "クリノンむら ちか1かい$" ; Kurinon Village B1F
	db "クラフトけんきゅうじょ$" ; Craft Research Center
	db "ディメンザのやしき$" ; Dimenza's Mansion
	db "アンテナのき 1かい$" ; Antenna Tree 1F
	db "ぺぺリやま ふもと$" ; Peperi Mountain Foothills
	db "カクトスいせき$" ; Cactos Ruins

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
	ld a, [wCurDenjuu]
	push af
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_175f
	xor a
	ld [wcb30], a
	jp NextMoveAnimationSubroutine

Func_8cde: ; 8cde (2:4cde)
	lb bc, $0, $0
	ld e, $1
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $0, $0
	ld e, $1
	ld a, $0
	call LoadStdBGMapAttrLayout_
	jp NextMoveAnimationSubroutine

Func_8cf5: ; 8cf5 (2:4cf5)
	ld a, [wCurDenjuu]
	ld de, VTilesBG tile $20
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call ClearString
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
	ld a, [wCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
.asm_8d37
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
	call GetAndPrintName75CenterAlign
	call PrintCurDenjuuTypeName_
	call Func_90c2
	ld de, String_8ba7
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
	lb bc, $0, $9
	ld a, $0
	call LoadStdBGMapAttrLayout_
	ld a, $4
	call Func_050a
	jp NextMoveAnimationSubroutine

Func_8d7a: ; 8d7a (2:4d7a)
	ld a, $0
	call PaletteFade_
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
	ld [wBattleMenuCursorObjectTemplateIDX], a
	ld a, $0
	ld [wWhichBattleMenuCursor], a
	ld a, $28
	ld [wSpriteInitXCoordBuffers + 0], a
	ld a, $0
	ld [wSpriteInitYCoordBuffers + 0], a
	call InitBattleMenuCursor
	ld a, $0
	ld bc, $4
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
.asm_8db8
	jp NextMoveAnimationSubroutine

Func_8dbb: ; 8dbb (2:4dbb)
	ld a, [wVBlankCounter]
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
	and D_UP
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
	and D_DOWN
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
	ld [H_SFX_ID], a
	ld a, $7
	ld [wMoveAnimationSubroutine], a
	ret

.asm_8e1a
	ld a, [wJoyNew]
	and D_RIGHT
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
	and D_LEFT
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
	ld [H_SFX_ID], a
	ld a, $6
	ld [wMoveAnimationSubroutine], a
	ret

asm_8e4f
	ld a, [wcb2b]
	cp $0
	jp z, Func_8e64
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, Func_8e64
	ld a, $2
	ld [wcb2b], a
	jr asm_8e7e

Func_8e64: ; 8e64 (2:4e64)
	ld a, [wcb2b]
	cp $0
	jp z, Func_8e79
	ld a, [hJoyNew]
	and B_BUTTON
	jr z, Func_8e79
	ld a, $4
	ld [H_SFX_ID], a
	jr asm_8e83

Func_8e79: ; 8e79 (2:4e79)
	ld a, [hJoyNew]
	and $3
	ret z
asm_8e7e
	ld a, $3
	ld [H_SFX_ID], a
asm_8e83
	ld a, $4
	call Func_050a
	ld a, [wcb2b]
	cp $0
	jp nz, Func_8e95
	ld a, $1
	ld [wd43a], a
Func_8e95: ; 8e95 (2:4e95)
	jp NextMoveAnimationSubroutine

Func_8e98: ; 8e98 (2:4e98)
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
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
	ld a, [wCurDenjuu]
	push af
	ld c, $1
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	call Func_175f
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, [wCurDenjuu]
	ld de, VTilesBG tile $20
	call Func_3d95
	ld a, [wd499]
	call Func_05ac
	ld a, [wd499]
	call Func_05b1
	ld hl, VTilesBG tile $30
	ld a, $8
	call ClearString
	ld a, [wSubroutine]
	cp $1
	jr nz, .asm_8eff
	ld a, [wCurDenjuu]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $30
	call GetAndPrintName75CenterAlign
	jr .asm_8f08

.asm_8eff
	ld a, [wd496]
	ld hl, VTilesBG tile $30
	call Func_3e19
.asm_8f08
	ld a, [wd499]
	ld bc, VTilesShared tile $58
	ld de, Data_1d7928
	call GetAndPrintName75CenterAlign
	call PrintCurDenjuuTypeName_
	call Func_90c2
	jp NextMoveAnimationSubroutine

Func_8f1d: ; 8f1d (2:4f1d)
	lb bc, $1, $1
	ld e, $b9
	ld a, $0
	call LoadStdBGMapLayout_
	ld a, $6
	ld [wMoveAnimationSubroutine], a
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
	call PaletteFade_
	or a
	ret z
.asm_8f49
	xor a
	ld [wMoveAnimationSubroutine], a
	xor a
	ld [wOAMAnimation01_PriorityFlags], a
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
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
	ld [wBattleSubroutine], a
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
	ld [wMoveAnimationSubroutine], a
	ret

Func_8fb9:
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s1_b000)
	ld [MBC3SRamBank], a
	ld de, wd000
	ld hl, s1_b000
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
	ld a, SRAM_DISABLE
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
	ld hl, sAddressBook
	call Func_3d0e
	ld a, [hli]
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
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
	ld [wCurDenjuu], a
	ld a, [hli]
	ld [wCurDenjuuLevel], a
	ld a, [hl]
	ld [wd499], a
	ret

Func_902e: ; 902e (2:502e)
	ld a, [wcb30]
	add $2
	ld e, a
	lb bc, $0, $9
	ld a, $0
	call LoadStdBGMapLayout_
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
	ld hl, sAddressBook + 10
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
	lb bc, $8, $c
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
.asm_9086
	call CloseSRAM
	ret

Func_908a:
	ld bc, wCurDenjuuBuffer
	ld de, $16
	addntimes_hl_de
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
	jr z, .load
.loop
	inc hl
	dec a
	jr nz, .loop
.load
	ld a, [hl]
	ret

Func_90b1: ; 90b1 (2:50b1)
	ld a, [wd4a0]
	cp $0
	jr z, .skip_add
	ld b, a
	ld a, d
.add_3_times
	add $3
	dec b
	jr nz, .add_3_times
	ld d, a
.skip_add
	ld a, d
	ret

Func_90c2: ; 90c2 (2:50c2)
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE1
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $38
	call GetAndPrintName75LeftAlign_
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE2
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $40
	call GetAndPrintName75LeftAlign_
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .third_move_unknown
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $48
	call GetAndPrintName75LeftAlign_
	jr .done_third_move

.third_move_unknown
	ld de, UnknownMoveString
	ld hl, VTilesShared tile $48
	ld b, $8
	call PlaceString_
.done_third_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	cp MAX_LEVEL
	jr z, .no_last_move
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .fourth_move_unknown
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld de, MoveNames
	ld bc, VTilesShared tile $50
	call GetAndPrintName75LeftAlign_
	jr .done_fouth_move

.fourth_move_unknown
	ld de, UnknownMoveString
	ld hl, VTilesShared tile $50
	ld b, $8
	call PlaceString_
.done_fouth_move
	ret

.no_last_move
	ld hl, VTilesShared tile $50
	ld a, $8
	call ClearString
	ret

Func_916a: ; 916a (2:516a)
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE1
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE2
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .no_extra_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE3
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4_LEVEL
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld b, a
	ld a, [wCurDenjuuLevel]
	cp b
	jr c, .no_extra_move
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_MOVE4
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
.no_extra_move
	ret

Func_91c7: ; 91c7 (2:51c7)
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPEED
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 12
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_ATTACK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 14
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_DEFENSE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 6, 16
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPATK
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 15, 12
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_SPDEF
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 15, 14
	ld c, $0
	call PrintDenjuuStat
	ret

Func_923b: ; 923b (2:523b)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(sAddressBook)
	ld [MBC3SRamBank], a
	ld a, [wCurDenjuuLevel]
	hlbgcoord 5, 15
	ld c, $1
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuu]
	ld c, DENJUU_HP
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	hlbgcoord 5, 16
	ld c, $0
	call PrintDenjuuStat
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
	ld hl, sAddressBook + 2
	call Func_3d0e
	ld a, [hl]
	jr asm_928b

Func_9289: ; 9289 (2:5289)
	ld a, $0
asm_928b
	hlbgcoord 14, 15
	ld c, $0
	call PrintDenjuuStat
	ld a, [wCurDenjuuLevel]
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
	ld a, [wCurDenjuu]
	ld b, $0
	ld c, DENJUU_TYPE
	call GetOrCalcStatC_
	ld a, [wCurDenjuuLevel]
	ld b, a
	ld a, [wCurDenjuuStat]
	call Func_05d9
	sra b
	rr c
	push bc
	pop hl
	bcbgcoord 15, 16
	call Func_14b1
	jr asm_92ff

Func_92eb: ; 92eb (2:52eb)
	lb bc, $c, $10
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $10, $10
	ld e, $ac
	ld a, $0
	call LoadStdBGMapLayout_
asm_92ff
	ret

INCLUDE "engine/opening_logos.asm"

SECTION "bank 03", ROMX, BANK [$3]

INCLUDE "engine/sgb.asm"
INCLUDE "engine/color.asm"

Func_f9b6:
	push hl
	push de
	push bc
	push hl
	call Get2DigitBCD
	pop hl
	ld a, [wNumCGBPalettesToFade]
	and $f0
	or a
	jr z, .asm_f9cf
	swap a
	add "0"
	call WaitStatAndLoad
	jr .asm_f9d3

.asm_f9cf
	xor a
	call WaitStatAndLoad
.asm_f9d3
	ld a, [wNumCGBPalettesToFade]
	and $f
	add "0"
	call WaitStatAndLoad
	pop bc
	pop de
	pop hl
	ret

Func_f9e1:
	call Random
	ld a, [wRandomSample]
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
	ld [wCGBPalFadeBufferPointer], a
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
	ld a, [wCGBPalFadeBufferPointer]
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
	ld a, [wCGBFade_PalLimit]
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
	add "0"
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
	ld a, [wCGBFade_PalLimit]
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
	add "0"
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
	add "0"
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
	ld de, sEventFlags
IF (NUM_EVENTS & 7) > 0
	ld bc, (NUM_EVENTS >> 3) + 1
ELSE
	ld bc, (NUM_EVENTS >> 3)
ENDC
	call CopyData
	ld hl, sAddressBook
	ld de, sBackupAddressBook
	ld bc, $1900
	ld a, BANK(sAddressBook)
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
	ld hl, sEventFlags
	ld de, wEventFlags
IF (NUM_EVENTS & 7) > 0
	ld bc, (NUM_EVENTS >> 3) + 1
ELSE
	ld bc, (NUM_EVENTS >> 3)
ENDC
	call CopyData
	ld hl, sBackupAddressBook
	ld de, sAddressBook
	ld bc, $1900
	xor a
	ld [wFontSourceBank], a
	ld a, BANK(sAddressBook)
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

SECTION "bank 05", ROMX, BANK [$5]
Func_14000:
	ld hl, wd401
	inc [hl]
	ret

Func_14005:
	ld a, $4
	jp Func_050a

Func_1400a:
	ld a, $f0
	ld [wc91e], a
	jp Func_3566

Func_14012: ; 14012 (5:4012)
	ld de, wd4b1
	ld c, $9
	jr asm_14025

Func_14019: ; 14019 (5:4019)
	ld de, wd460
	ld c, $9
	jr asm_14025

Func_14020:
	ld de, wd4b1
	ld c, $11
asm_14025
	ld b, $0
	jp CopyData

Func_1402a: ; 1402a (5:402a)
	ld hl, wd420
	ld a, $8
	ld [wd45a], a
.asm_14032
	ld a, [bc]
	cp $c0
	jr z, .asm_14043
	ld [hl], a
	inc hl
	inc bc
	ld a, [wd45a]
	dec a
	ld [wd45a], a
	jr nz, .asm_14032
.asm_14043
	ld a, $e0
	ld [hl], a
	ld hl, wd420
	ret

Func_1404a:
	ld a, [wCurBattleDenjuu]
	call GetNthPlayerDenjuu
	call Func_1407d
	ld a, [wCurBattleDenjuu]
	call Func_140d9
	ld a, [wCurDenjuuBufferField0x0d]
	ld hl, VTilesBG tile $20
	jp Func_142f9

Func_14062:
	ld a, [wCurEnemyDenjuu]
	call GetNthEnemyDenjuu
	call Func_140ab
	ld a, [wCurEnemyDenjuu]
	call Func_14102
	ld a, [wCurDenjuuBufferSpecies]
	ld de, DenjuuNames
	ld bc, VTilesBG tile $28
	jp GetAndPrintName75LeftAlign_

Func_1407d: ; 1407d (5:407d)
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call Func_3980
	ld [wd4e8], a
	or a
	jr nz, .asm_14098
	ld a, [wCurDenjuuBufferCurHP]
	or a
	jr z, .asm_14098
	ld a, $1
	ld [wd4e8], a
.asm_14098
	ld d, $1
	ld a, [wd4e8]
	call Func_3998
	ld a, [wd4e8]
	ld c, $0
	hlbgcoord 3, 2
	jp Func_3957

Func_140ab: ; 140ab (5:40ab)
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call Func_3980
	ld [wd4e9], a
	or a
	jr nz, .asm_140c6
	ld a, [wCurDenjuuBufferCurHP]
	or a
	jr z, .asm_140c6
	ld a, $1
	ld [wd4e9], a
.asm_140c6
	ld d, $2
	ld a, [wd4e9]
	call Func_3998
	ld a, [wd4e9]
	ld c, $1
	hlbgcoord 6, 10, VWindow
	jp Func_3957

Func_140d9: ; 140d9 (5:40d9)
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferField0x09]
	ld e, a
	ld a, [wCurDenjuuBufferField0x05]
	call Func_3980
	ld [wd4e8], a
	or a
	jr nz, .asm_140f7
	ld a, [wCurDenjuuBufferField0x05]
	or a
	jr z, .asm_140f7
	ld a, $1
	ld [wd4e8], a
.asm_140f7
	ld a, [wd4e8]
	ld c, $0
	hlbgcoord 3, 3
	jp Func_3957

Func_14102: ; 14102 (5:4102)
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferField0x09]
	ld e, a
	ld a, [wCurDenjuuBufferField0x05]
	call Func_3980
	ld [wd4e9], a
	or a
	jr nz, .asm_14120
	ld a, [wCurDenjuuBufferField0x05]
	or a
	jr z, .asm_14120
	ld a, $1
	ld [wd4e9], a
.asm_14120
	ld a, [wd4e9]
	ld c, $1
	hlbgcoord 6, 11, VWindow
	jp Func_3957

GetNthPlayerDenjuu: ; 1412b (5:412b)
	ld hl, wPlayerDenjuu1
	jp GetNthDenjuuAnySide

GetNthEnemyDenjuu: ; 14131 (5:4131)
	ld hl, wEnemyDenjuu1
	jp GetNthDenjuuAnySide

GetNthDenjuuAnySide: ; 14137 (5:4137)
	ld de, $16
	addntimes_hl_de
	ld de, wCurDenjuuBuffer
	ld bc, $16
	jp CopyData

Func_1414b:
	ld bc, $30d
	cp $0
	jr z, .asm_14167
	cp $1
	jr z, .asm_1415f
	cp $2
	jr z, .asm_14164
	lb bc, $d, $f
	jr .asm_14167

.asm_1415f
	lb bc, $3, $f
	jr .asm_14167

.asm_14164
	lb bc, $d, $d
.asm_14167
	push bc
	ld e, $8f
	ld a, $0
	call LoadStdBGMapLayout_
	pop bc
	inc bc
	ld e, $82
	ld a, $0
	jp LoadStdBGMapAttrLayout_

Func_14178:
	cp $1
	jr z, .asm_1418d
	cp $2
	jr z, .asm_14196
	cp $3
	jr z, .asm_1419f
	hlbgcoord 3, 14
	ld a, [wd430]
	jp Func_141a5

.asm_1418d
	hlbgcoord 3, 16
	ld a, [wd431]
	jp Func_141a5

.asm_14196
	hlbgcoord 13, 14
	ld a, [wd432]
	jp Func_141a5

.asm_1419f
	hlbgcoord 13, 16
	ld a, [wd433]
Func_141a5: ; 141a5 (5:41a5)
	ld c, $0
	jp Func_3957

Func_141aa:
	ld bc, $30e
	cp $0
	jr z, .asm_141c6
	cp $1
	jr z, .asm_141be
	cp $2
	jr z, .asm_141c3
	lb bc, $d, $10
	jr .asm_141c6

.asm_141be
	lb bc, $3, $10
	jr .asm_141c6

.asm_141c3
	lb bc, $d, $e
.asm_141c6
	push bc
	ld e, $8d
	ld a, $0
	call LoadStdBGMapAttrLayout_
	pop bc
	dec bc
	ld e, $93
	ld a, $0
	jp LoadStdBGMapLayout_

Func_141d7:
	cp $1
	jr z, .asm_141ec
	cp $2
	jr z, asm_1421c
	cp $3
	jr z, asm_14225
	hlbgcoord 3, 14
	ld a, [wCurBattleDenjuu2]
	jp Func_141f2

.asm_141ec
	hlbgcoord 3, 16
	ld a, [wCurBattleDenjuu3]
Func_141f2: ; 141f2 (5:41f2)
	push hl
	call GetNthPlayerDenjuu
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call Func_3980
	ld [wd4e8], a
	cp $0
	jr nz, .asm_14213
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_14213
	ld a, $1
	ld [wd4e8], a
.asm_14213
	ld a, [wd4e8]
	ld c, $0
	pop hl
	jp Func_3957

asm_1421c
	hlbgcoord 13, 14
	ld a, [wCurEnemyDenjuu2]
	jp Func_1422b

asm_14225
	hlbgcoord 13, 16
	ld a, [wCurEnemyDenjuu3]
Func_1422b: ; 1422b (5:422b)
	push hl
	call GetNthEnemyDenjuu
	ld a, [wCurDenjuuBufferMaxHP]
	ld e, a
	ld a, [wCurDenjuuBufferCurHP]
	call Func_3980
	ld [wd4e9], a
	cp $0
	jr nz, .asm_1424c
	ld a, [wCurDenjuuBufferCurHP]
	cp $0
	jr z, .asm_1424c
	ld a, $1
	ld [wd4e9], a
.asm_1424c
	ld a, [wd4e9]
	ld c, $0
	pop hl
	jp Func_3957

Func_14255: ; 14255 (5:4255)
	ld a, [wd42d]
	inc a
	ld [wd42d], a
	cp $1
	jr z, .asm_1426c
	cp $2
	jr z, .asm_14275
	xor a
	ld [wd42d], a
	ld [wSCX], a
	ret

.asm_1426c
	ld a, [wSCX]
	sub $2
	ld [wSCX], a
	ret

.asm_14275
	ld a, [wSCX]
	add $2
	ld [wSCX], a
	ret

Func_1427e: ; 1427e (5:427e)
	ld a, [wd42d]
	inc a
	ld [wd42d], a
	cp $1
	jr z, .asm_14293
	cp $2
	jr z, .asm_1429d
	xor a
	ld [wd42d], a
	jr .asm_142a7

.asm_14293
	ld a, [wWX]
	sub $2
	ld [wWX], a
	jr .asm_142a7

.asm_1429d
	ld a, [wWX]
	add $2
	ld [wWX], a
	jr .asm_142a7

.asm_142a7
	jp Func_142af

PlaceBattleString:
	ld b, $8
	jp PlaceString_

Func_142af: ; 142af (5:42af)
	ld hl, wc460
	ld a, $5f
	ld [hli], a
	ld a, [wWX]
	ld [hl], a
	ret

Func_142ba:
	xor a
	call Func_0543
	jp Func_142c1

Func_142c1: ; 142c1 (5:42c1)
	ld a, $1
	ld [wOBPalUpdate], a
	xor a
	ld bc, $4
	jp Func_1196

Func_142cd:
	ld [wd435], a
	ld hl, DenjuuNames
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	jp Func_14019

Func_142df:
	push af
	ld c, $0
	ld de, VTilesShared tile $00
	call LoadDenjuuPic_
	pop af
	jp Func_1764

Func_142ec:
	push af
	ld c, $1
	ld de, VTilesShared tile $38
	call LoadDenjuuPic_
	pop af
	jp Func_175f

Func_142f9: ; 142f9 (5:42f9)
	push hl
	push af
	ld a, $8
	call ClearString
	call OpenSRAMBank2
	pop af
	ld hl, sAddressBook + 6
	call Func_3d0e
	push hl
	pop de
	call Func_065a
	pop hl
	ld de, wc9e1
	ld b, $6
	jp PlaceString_

Func_14318:
	lb bc, $1, $0
	ld e, $86
	ld a, $0
	call LoadStdBGMapLayout_
	lb bc, $1, $0
	ld e, $87
	ld a, $0
	call LoadStdBGMapAttrLayout_
	lb bc, $0, $8
	ld e, $81
	ld a, $0
	call LoadStdWindowLayout_
	ld bc, $108
	ld e, $84
	ld a, $0
	jp LoadStdWindowAttrLayout_

Func_14340:
	call Func_14255
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp $1
	jr c, .asm_1435e
	cp $2
	jr c, .asm_1436a
	ld a, $0
	ld [wd45a], a
.asm_1435e
	lb bc, $1, $5
	ld e, $92
	ld a, $0
	call LoadStdBGMapLayout_
	jr .asm_14374

.asm_1436a
	lb bc, $1, $5
	ld e, $8b
	ld a, $0
	call LoadStdBGMapLayout_
.asm_14374
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd45b]
	cp $a
	ret nz
	xor a
	ld [wd42d], a
	ld [wSCX], a
	ld [wd45a], a
	ld [wd45b], a
	ret

Func_1438d:
	call Func_1427e
	ld a, [wd45b]
	inc a
	ld [wd45b], a
	ld a, [wd45a]
	inc a
	ld [wd45a], a
	cp $1
	jr c, .asm_143ab
	cp $2
	jr c, .asm_143b7
	ld a, $0
	ld [wd45a], a
.asm_143ab
	lb bc, $1, $1
	ld e, $91
	ld a, $0
	call LoadStdWindowLayout_
	jr .asm_143c1

.asm_143b7
	lb bc, $1, $1
	ld e, $8b
	ld a, $0
	call LoadStdWindowLayout_
.asm_143c1
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wd45b]
	cp $a
	ret nz
	ld a, $58
	ld [wWX], a
	call Func_142af
	xor a
	ld [wd42d], a
	ld [wd45a], a
	ld [wd45b], a
	ret

Func_143df:
	ld a, [wd46f]
	cp $6e
	jr c, .asm_143e8
	sub $36
.asm_143e8
	cp $3e
	jr z, .asm_143f6
	cp $3f
	jr z, .asm_143f6
	cp $40
	jr z, .asm_143f6
	xor a
	ret

.asm_143f6
	ld a, $1
	ret

Func_143f9:
	ld c, DENJUU_MOVE1
	add c
	ld c, a
	ld a, [wCurDenjuu]
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	ld hl, MoveNames
	ld [wd435], a
	ld [wd46f], a
	call Get8CharName75
	ld bc, wStringBuffer
	call Func_1402a
	jp Func_14012

INCLUDE "battle/core.asm"

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

INCLUDE "data/map_data_18180.asm"
INCLUDE "data/map_data_18ba1.asm"

SECTION "bank 07", ROMX, BANK [$7]
PalPackets_1c000:: INCLUDE "data/pal_packets.asm"

SECTION "bank 08", ROMX, BANK [$8]
IF DEF(POWER)
INCLUDE "data/unknown_20000.power.asm"
ELSE
INCLUDE "data/unknown_20000.speed.asm"
ENDC

SECTION "bank 09", ROMX, BANK [$9]
IF DEF(POWER)
INCLUDE "data/unknown_24000.power.asm"
ELSE
INCLUDE "data/unknown_24000.speed.asm"
ENDC

SECTION "bank 0A", ROMX, BANK [$a]
INCLUDE "data/oam_templates_0.asm"

SECTION "bank 0B", ROMX, BANK [$b]
LinkBattleRNs::
INCLUDE "data/pseudo_rng.asm"

PrintText: ; 2c100 (b:4100)
	ld a, [wc9c5]
	inc a
	ld [wc9c5], a
	ld a, [wTextSubroutine]
	cp $0
	jp z, Func_2c57d
	cp $1
	jr z, .asm_2c13c
	cp $2
	jp z, Func_2c34e
	cp $3
	jp z, Func_2c3c7
	cp $4
	jp z, Func_2c3c7
	cp $5
	jp z, Func_2c432
	cp $6
	jp z, Func_2c40d
	cp $7
	jp z, Func_2c413
	cp $8
	jp z, Func_2c429
	cp $a
	jp z, Func_2c445
	ret

.asm_2c13c
	ld a, [wc9c6]
	ld l, a
	ld a, [wc9c7]
	ld h, a
	call Func_2d2b
	or a
	jr nz, .asm_2c152
	push af
	ld a, [wc9cb]
	ld [wc959], a
	pop af
.asm_2c152
	cp $e2
	jr nz, .asm_2c17b
	ld a, [wc9cb]
	cp $10
	jr nc, .asm_2c16c
	ld a, $10
	ld [wc9cb], a
	ld a, [wc9ce]
	inc a
	ld [wc9ce], a
	jp Func_2c2ea

.asm_2c16c
	ld a, $0
	ld [wc9cb], a
	ld a, [wc9ce]
	inc a
	ld [wc9ce], a
	jp Func_2c2ea

.asm_2c17b
	cp $e1
	jr nz, asm_2c182
Func_2c17f: ; 2c17f (b:417f)
	jp Func_2c5c8

asm_2c182
	cp $e7
	jr nz, .asm_2c18c
	call Func_2c22f
	jp Func_2c316

.asm_2c18c
	cp $e9
	jr nz, .asm_2c196
	call Func_2c337
	jp Func_2c313

.asm_2c196
	cp $e3
	jr nz, .asm_2c1a6
	call Func_2d2b
	ld [wc9cd], a
	call Func_2c337
	jp Func_2c313

.asm_2c1a6
	cp $e5
	jr nz, .asm_2c1ba
	ld a, [wc9c7]
	ld [wc9d2], a
	ld a, [wc9c6]
	ld [wc9d1], a
	call Func_2d39
	ret

.asm_2c1ba
	cp $e0
	jr nz, .asm_2c1d3
	ld a, [wc9d1]
	ld [wc9c6], a
	ld a, [wc9d2]
	ld [wc9c7], a
	call Func_2c337
	call Func_2c337
	jp Func_2c313

.asm_2c1d3
	cp $e1
	jp nc, Func_2c337
	ld a, [wc9cc]
	or a
	jp z, Func_2c1e3
	dec a
	jp nz, Func_2c34a
Func_2c1e3: ; 2c1e3 (b:41e3)
	push hl
	ld a, [wc9cd]
	ld [wc9cc], a
	ld a, [wc9cb]
	ld b, a
	ld a, [wc91f]
	add b
	call Func_35c2
	call Func_2c22d
	ld a, c
	call LoadCharacter
	pop hl
	ld a, [wc9cb]
	inc a
	ld [wc9cb], a
	cp $10
	jr nz, .asm_2c212
	ld a, [wc9ce]
	inc a
	ld [wc9ce], a
	jp Func_2c2ea

.asm_2c212
	cp $1f
	jr c, .asm_2c22a
	call Func_2c2be
	jr z, .asm_2c22a
	ld a, [wc9ce]
	inc a
	ld [wc9ce], a
	ld a, $0
	ld [wc9cb], a
	jp Func_2c2ea

.asm_2c22a
	jp Func_2c313

Func_2c22d: ; 2c22d (b:422d)
	ld a, c
	ret

Func_2c22f: ; 2c22f (b:422f)
	ld a, $0
	ld [wc9d2], a
	ld b, $0
	ld c, $e0
	ld de, VTilesShared tile $60
.asm_2c23b
	push bc
.asm_2c23c
	call Func_2d2b
	cp $e0
	jr z, .asm_2c25c
	cp $e5
	jr nz, .asm_2c27b
	ld a, h
	ld [wc9d2], a
	ld a, l
	ld [wc9d1], a
	call Func_2d39
	ld a, [wc9c6]
	ld l, a
	ld a, [wc9c7]
	ld h, a
	jr .asm_2c23c

.asm_2c25c
	ld a, [wc9d2]
	or a
	jr z, .asm_2c299
	ld a, [wc9d1]
	ld l, a
	ld a, [wc9d2]
	ld h, a
	inc hl
	inc hl
	ld a, l
	ld [wc9c6], a
	ld a, h
	ld [wc9c7], a
	ld a, $0
	ld [wc9d2], a
	jr .asm_2c23c

.asm_2c27b
	pop bc
	push bc
	push af
	ld a, c
	ld c, $1
	inc b
	inc b
	call Func_2c2a4
	pop af
	push hl
	ld h, d
	ld l, e
	call LoadCharacter
	ld d, h
	ld e, l
	pop hl
	pop bc
	inc c
	inc b
	ld a, b
	cp $a
	jr nz, .asm_2c23b
	ret

.asm_2c299
	add sp, $2
	ld a, l
	ld [wc9c6], a
	ld a, h
	ld [wc9c7], a
	ret

Func_2c2a4: ; 2c2a4 (b:42a4)
	push hl
	push af
	push bc
	ld a, [wc9ca]
	add c
	call Func_2cb68
	pop bc
	push bc
	ld c, b
	call AdvanceBGMapPointerByC
	pop bc
	di
	call WaitStat_1f79
	pop af
	ld [hl], a
	ei
	pop hl
	ret

Func_2c2be: ; 2c2be (b:42be)
	ld b, $0
.asm_2c2c0
	call Func_2d2b
	cp $e1
	jr c, .asm_2c2e2
	cp $e1
	jr nz, .asm_2c2d6
	ld a, b
	or a
	jr z, .asm_2c2d1
	xor a
	ret

.asm_2c2d1
	call Func_2c17f
	xor a
	ret

.asm_2c2d6
	cp $e2
	jr nz, .asm_2c2e0
	ld a, b
	or a
	jr nz, .asm_2c2e2
	xor a
	ret

.asm_2c2e0
	jr .asm_2c2c0

.asm_2c2e2
	inc b
	ld a, b
	cp $1
	jr z, .asm_2c2c0
	or a
	ret

Func_2c2ea: ; 2c2ea (b:42ea)
	call Func_2c337
	ld a, [wc9ce]
	cp $2
	jr nc, .asm_2c2f6
	jr Func_2c316

.asm_2c2f6
	and $1
	jr nz, .asm_2c306
	ld a, $2
	ld [wTextSubroutine], a
	ld a, $0
	ld [wc9cc], a
	jr Func_2c316

.asm_2c306
	ld a, [wc9c5]
	ld [wc9cc], a
	ld a, $3
	ld [wTextSubroutine], a
	jr Func_2c316

Func_2c313: ; 2c313 (b:4313)
	call Func_2c337
Func_2c316: ; 2c316 (b:4316)
	ld a, [wc9cd]
	or a
	jp z, PrintText
	ld a, [wcad3]
	or a
	jp nz, PrintText
	ld a, [hJoyLast]
	and B_BUTTON
	jp nz, PrintText
	ld a, [hJoyNew]
	and A_BUTTON
	jr z, .asm_2c336
	ld a, $1
	ld [wcad3], a
.asm_2c336
	ret

Func_2c337: ; 2c337 (b:4337)
	ld a, [wc9c7]
	ld c, a
	ld a, [wc9c6]
	add $1
	ld [wc9c6], a
	ld a, $0
	adc c
	ld [wc9c7], a
	ret

Func_2c34a: ; 2c34a (b:434a)
	ld [wc9cc], a
	ret

Func_2c34e: ; 2c34e (b:434e)
	ld a, [wc9ca]
	add $4
	call Func_2cb68
	ld c, $11
	call AdvanceBGMapPointerByC
	ld a, [wc91f]
	add $1f
	ld c, a
	ld a, [wc9cc]
	inc a
	ld [wc9cc], a
	bit 4, a
	jr nz, .asm_2c372
	ld a, [wc91e]
	add $e
	ld c, a
.asm_2c372
	di
	call WaitStat_1f79
	ld [hl], c
	ei
	ld a, [hJoyNew]
	ld [wcdb7], a
	ld a, [hJoyLast]
	and A_BUTTON
	jr z, .asm_2c39a
	ld a, [wcdb8]
	cp $14
	jr c, .asm_2c391
	ld a, $1
	ld [wcdb7], a
	jr .asm_2c39f

.asm_2c391
	ld a, [wcdb8]
	inc a
	ld [wcdb8], a
	jr .asm_2c39f

.asm_2c39a
	ld a, $0
	ld [wcdb8], a
.asm_2c39f
	ld a, [wcdb7]
	and $1
	ret z
	ld a, $0
	ld [wcad3], a
	ld a, [wc91f]
	add $1f
	ld c, a
	di
	call WaitStat_1f79
	ld [hl], c
	ei
	ld a, $8
	ld [H_SFX_ID], a
	ld a, [wc9c5]
	ld [wc9cc], a
	ld a, $3
	ld [wTextSubroutine], a
	ret

Func_2c3c7: ; 2c3c7 (b:43c7)
	ld a, [hJoyLast]
	and B_BUTTON
	jr nz, .asm_2c3d8
	ld a, [wc9cc]
	ld b, a
	ld a, [wc9c5]
	sub b
	and $3
	ret nz
.asm_2c3d8
	call Func_2cb3d
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2c3f2
	ld a, [wc9ce]
	and $1
	jr z, .asm_2c3ef
	call Func_2ccf6
	jp .asm_2c3f2

.asm_2c3ef
	call Func_2cceb
.asm_2c3f2
	call Func_2cbd0
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2c407
	ld a, $1
	ld [wTextSubroutine], a
	ld a, $2
	ld [wc9cc], a
	ret

.asm_2c407
	ld a, $4
	ld [wTextSubroutine], a
	ret

Func_2c40d: ; 2c40d (b:440d)
	call Func_2c533
	jr z, .asm_2c412
.asm_2c412
	ret

Func_2c413: ; 2c413 (b:4413)
	call Func_2c533
	jr z, .asm_2c428
	call Func_2cce5
	ld a, [wc9ca]
	ld de, Data_2d00f
	ld b, $6
	ld c, $1
	jp Func_2ca5c

.asm_2c428
	ret

Func_2c429: ; 2c429 (b:4429)
	call Func_2c533
	jr z, .asm_2c431
	call Func_2c9d1
.asm_2c431
	ret

Func_2c432: ; 2c432 (b:4432)
	call Func_2c533
	jr z, .asm_2c444
	ld a, [wc900]
	cp $4
	jr nc, .asm_2c444
	call Func_2ccb9
	jp Func_2ba9

.asm_2c444
	ret

Func_2c445: ; 2c445 (b:4445)
	call Func_2c4f0
	call Func_2c533
	jr z, .asm_2c484
	ld bc, $c3e
	ld a, [wc9d7]
	or a
	jr nz, .asm_2c461
	call ResetEventFlag
	ld bc, $c3f
	call SetEventFlag
	jr .asm_2c46a

.asm_2c461
	call SetEventFlag
	ld bc, $c3f
	call ResetEventFlag
.asm_2c46a
	ld a, [wSubroutine]
	cp $5
	jr nz, .asm_2c47e
	ld a, [wc900]
	cp $4
	jr nc, .asm_2c47e
	call Func_2ccb9
	call Func_2ba9
.asm_2c47e
	ld a, $0
	ld [wc9cf], a
	ret

.asm_2c484
	ld a, [hJoyNew]
	and D_LEFT
	jr z, .asm_2c49d
	ld a, [wc9d7]
	cp $1
	jr z, .asm_2c4b4
	ld a, $1
	ld [wc9d7], a
	ld a, $2
	ld [H_SFX_ID], a
	jr .asm_2c4b4

.asm_2c49d
	ld a, [hJoyNew]
	and D_RIGHT | B_BUTTON
	jr z, .asm_2c4b4
	ld a, [wc9d7]
	cp $0
	jr z, .asm_2c4b4
	ld a, $0
	ld [wc9d7], a
	ld a, $2
	ld [H_SFX_ID], a
.asm_2c4b4
	ld b, $f
	ld a, [wc9d7]
	or a
	jr z, .asm_2c4be
	ld b, $e
.asm_2c4be
	ld c, $2
	push bc
	call Func_2c4d5
	pop bc
	ld a, [wc959]
	and $f
	add $2
	ld c, a
	ld a, b
	xor $1
	ld b, a
	call Func_2c4d5
	ret

Func_2c4d5: ; 2c4d5 (b:44d5)
	ld a, [wc9ca]
	add $4
	push bc
	call Func_2cb68
	pop bc
	push bc
	call AdvanceBGMapPointerByC
	pop bc
	ld a, [wc91e]
	add b
	ld b, a
	di
	call WaitStat_1f79
	ld [hl], b
	ei
	ret

Func_2c4f0: ; 2c4f0 (b:44f0)
	ld a, [wc9c5]
	and $3
	ret nz
Func_2c4f6: ; 2c4f6 (b:44f6)
	ld a, [wc9c5]
	srl a
	srl a
	and $7
	ld hl, Data_2c52b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	swap a
	ld de, GFX_e0b08
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wc91e]
	cp $e0
	jr nz, .asm_2c520
	ld hl, VTilesShared tile $6e
	jr .asm_2c523

.asm_2c520
	ld hl, VTilesShared tile $7e
.asm_2c523
	ld a, BANK(GFX_e0b08)
	ld bc, $10
	jp FarCopy2bpp_2

Data_2c52b:
	db 0, 1
	db 2, 2
	db 2, 2
	db 1, 0

Func_2c533: ; 2c533 (b:4533)
	ld a, [wc9cc]
	or a
	jr nz, .asm_2c575
	ld a, [wc9ca]
	add $4
	call Func_2cb68
	ld c, $11
	call AdvanceBGMapPointerByC
	ld c, $c
	ld a, [wc9c5]
	bit 4, a
	jr nz, .asm_2c551
	ld c, $d
.asm_2c551
	ld a, [wc91e]
	add c
	ld c, a
	di
	call WaitStat_1f79
	ld [hl], c
	ei
	ld a, [hJoyLast]
	and $3
	cp $3
	jr z, .asm_2c569
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
.asm_2c569
	ld a, $0
	ld [wcad3], a
	ld a, $9
	ld [wTextSubroutine], a
	or a
	ret

.asm_2c575
	dec a
	jr z, .asm_2c569
	ld [wc9cc], a
	xor a
	ret

Func_2c57d: ; 2c57d (b:457d)
	ld a, [wc9cc]
	dec a
	ld [wc9cc], a
	jr nz, .asm_2c5c7
	ld a, $4
	ld [wc9cc], a
	ld a, [wc9ce]
	inc a
	ld [wc9ce], a
	cp $1
	jr nz, .asm_2c5a7
	ld a, [wc9ca]
	dec a
	ld [wc9ca], a
	ld de, Data_2d07b
	ld b, $4
	ld c, $1
	jp Func_2ca5c

.asm_2c5a7
	ld a, $1
	ld [wTextSubroutine], a
	ld a, $0
	ld [wc9ce], a
	ld a, $8
	ld [wc9cc], a
	ld a, [wc9ca]
	dec a
	ld [wc9ca], a
	ld de, Data_2d00f
	ld b, $6
	ld c, $1
	jp Func_2ca5c

.asm_2c5c7
	ret

Func_2c5c8: ; 2c5c8 (b:45c8)
	call Func_2d2b
	ld [wc9cf], a
	cp $0
	jr nz, .asm_2c5dd
	ld a, $0
	ld [wc9cc], a
	ld a, $5
	ld [wTextSubroutine], a
	ret

.asm_2c5dd
	cp $1
	jr nz, .asm_2c5ec
	ld a, $3c
	ld [wc9cc], a
	ld a, $5
	ld [wTextSubroutine], a
	ret

.asm_2c5ec
	cp $2
	jr nz, .asm_2c5fb
	ld a, $0
	ld [wc9cc], a
	ld a, $6
	ld [wTextSubroutine], a
	ret

.asm_2c5fb
	cp $3
	jr nz, .asm_2c60a
	ld a, $0
	ld [wc9cc], a
	ld a, $7
	ld [wTextSubroutine], a
	ret

.asm_2c60a
	cp $4
	jr nz, .asm_2c619
	ld a, $1
	ld [wc9cc], a
	ld a, $6
	ld [wTextSubroutine], a
	ret

.asm_2c619
	cp $a
	jr nz, .asm_2c630
	ld a, $0
	ld [wc9cc], a
	ld a, $a
	ld [wTextSubroutine], a
	call Func_2c4f6
	ld a, $1
	ld [wc9d7], a
	ret

.asm_2c630
	ld a, $0
	ld [wc9cc], a
	ld a, $8
	ld [wTextSubroutine], a
	ret

Func_2c63b: ; 2c63b (b:463b)
	xor a
	ld [wc9cf], a
Func_2c63f: ; 2c63f (b:463f)
	ld a, [wc9d8]
	cp $2
	jr z, .asm_2c64b
	ld a, $1
	ld [wc9d8], a
.asm_2c64b
	call Func_2c6d2
Func_2c64e: ; 2c64e (b:464e)
	ld a, $c0
	ld [wc91f], a
	ld a, $e0
	ld [wc91e], a
	ld a, $1
	ld [wc9d7], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wc9c8], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call Func_2d39
	call Func_3566
	ld a, $7
	ld [wca65], a
	xor a
	ld [wc9cb], a
	ld [wc9ce], a
	ld a, $5
	ld [wSubroutine], a
	ld a, $4
	ld [wc9cc], a
	ld a, $1
	ld [wc9cd], a
	ld a, $0
	ld [wcad3], a
	ld a, $2
	ld [wcada], a
	ld bc, EVENT_C3E
	call ResetEventFlag
	ld bc, EVENT_C3F
	call ResetEventFlag
	ld a, [wc9cf]
	cp $2
	jr c, .asm_2c6be
	ld a, $1
	ld [wTextSubroutine], a
	call Func_2c98e
	jr .asm_2c6d1

.asm_2c6be
	ld a, $0
	ld [wTextSubroutine], a
	ld a, [wc9ca]
	add $2
	ld [wc9ca], a
	call Func_2c9bd
	call Func_2cc4e
.asm_2c6d1
	ret

Func_2c6d2: ; 2c6d2 (b:46d2)
	ld d, $a
	ld a, [wPlayerYCoord]
	cp $48
	jr c, .asm_2c6dd
	ld d, $1
.asm_2c6dd
	ld a, d
	ld [wc9ca], a
	ret

Func_2c6e2: ; 2c6e2 (b:46e2)
	call Func_2c6d2
	ld hl, ItemNames
	ld c, b
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, $8
	ld de, wca53
.asm_2c6fd
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2c6fd
	ld a, $e0
	ld [de], a
	xor a
	ld [wc9cf], a
	ld b, $0
	ld c, $bf
	jp Func_2c64e

Func_2c711: ; 2c711 (b:4711)
	push bc
	call Func_2c73e
	xor a
	ld [wc9cf], a
	ld a, $c0
	ld [wc91f], a
	ld a, $e0
	ld [wc91e], a
	ld b, $0
	ld c, $ba
	ld d, $0
	call Func_2c76c
	ld a, $1
	ld [wcada], a
	ld a, $7
	ld [wca65], a
	call Func_2c9e6
	pop bc
	call Func_2ca0f
	ret

Func_2c73e: ; 2c73e (b:473e)
	ld hl, ItemNames
	ld c, b
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld b, $8
	ld de, wca53
.asm_2c756
	ld a, [hli]
	ld [de], a
	inc de
	dec b
	jr nz, .asm_2c756
	ld a, $e0
	ld [de], a
	ret

Func_2c760:
	call Func_2c775
	jp Func_2c9d1

Func_2c766: ; 2c766 (b:4766)
	call Func_2c76c
	jp Func_2c9d1

Func_2c76c: ; 2c76c (b:476c)
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
Func_2c775: ; 2c775 (b:4775)
	ld a, d
	ld [wc9ca], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wc9c8], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call Func_2d39
	call Func_3566
	xor a
	ld [wc9cb], a
	ld [wc9ce], a
	ld a, $0
	ld [wc9cc], a
	ld a, $1
	ld [wc9cd], a
	ld a, $0
	ld [wcad3], a
	ld a, $2
	ld [wcada], a
	ld a, $1
	ld [wTextSubroutine], a
	ret

Func_2c7b9:
	ld a, $d0
	ld [wc91f], a
	ld a, $f0
	ld [wc91e], a
	call Func_2c76c
	ld a, $7
	ld [wca65], a
	jp Func_2c9a2

Func_2c7ce:
	ld a, $d0
	ld [wc91f], a
	ld a, $f0
	ld [wc91e], a
	call Func_3566
	ld d, $3
	call Func_2c76c
	ld a, $7
	ld [wca65], a
	ld a, $5
	ld [wSubroutine], a
	jp Func_2c9a2

Func_2c7ed: ; 2c7ed (b:47ed)
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, d
	ld [wc9ca], a
	ld d, $0
	ld e, b
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld [wc9c8], a
	ld l, c
	ld h, $0
	sla l
	rl h
	add hl, de
	call Func_2d39
	xor a
	ld [wc9cb], a
	ld [wc9ce], a
	ld [wc9cc], a
	ld [wcad3], a
	ld a, $0
	ld [wc9cd], a
	ld [wcada], a
	ld a, $1
	ld [wTextSubroutine], a
	ret

Func_2c831: ; 2c831 (b:4831)
	ld a, [wMoney]
	ld l, a
	ld a, [wMoney + 1]
	ld h, a
	ld d, $0
	call Func_2c883
	call Func_2c9e6
	call PrintText
	call PrintText
	ld a, $0
	ld [wc9cf], a
	ret

OverworldIdleHUD: ; 2c84d (b:484d)
	ld a, [wMoney]
	ld l, a
	ld a, [wMoney + 1]
	ld h, a
	ld a, [wPlayerYCoord]
	cp $48 ; halfway up/down the screen
	jr nc, .on_top
	ld d, $e
	call Func_2c883
	call Func_2c9fb
	ld a, $1
	ld [wIdleHUDOnBottomOfScreen], a
	jr .done

.on_top
	ld d, $0
	call Func_2c883
	call Func_2c9fb
	ld a, $0
	ld [wIdleHUDOnBottomOfScreen], a
.done
	ld a, $1
	ld [wcd21], a
	ld a, $0
	ld [wc9cf], a
	ret

Func_2c883: ; 2c883 (b:4883)
	push de
	ld a, $c0
	ld [wc91f], a
	ld a, $e0
	ld [wc91e], a
	call Func_2d03
	ld b, $0
	ld c, $9d
	pop de
	call Func_2c775
	ld a, $7
	ld [wca65], a
	ret

Func_2c89f: ; 2c89f (b:489f)
	ld a, [wca5d]
	cp $5a
	jr c, .skip
	call CloseIdleOverworldHUD
.skip
	xor a
	ld [wca5d], a
	ld [wcd21], a
	ret

CloseIdleOverworldHUD: ; 2c8b1 (b:48b1)
	ld a, [wIdleHUDOnBottomOfScreen]
	or a
	jr nz, .asm_2c8c6
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wBGMapAnchor]
	ld l, a
	decoord 0, 0
	call .ReloadMetatilesOverIdleHUD
	ret

.asm_2c8c6
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld a, [wBGMapAnchor]
	ld l, a
	ld bc, 14 * BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	decoord 0, 7
.ReloadMetatilesOverIdleHUD: ; 2c8d8 (b:48d8)
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	call .ReloadMetatile
	jp .ReloadMetatile

.ReloadMetatile: ; 2c8f6 (b:48f6)
	ld a, [de]
	push hl
	push de
	call LoadMetatile
	pop de
	inc de
	pop hl
	ld c, $2
	jp AdvanceBGMapPointerByC

OverworldIdleHudCheck: ; 2c904 (b:4904)
	call Func_2107
	jr nz, .finish
	ld a, [wc904]
	cp $b
	jr z, .finish
	ld a, [wca5d]
	cp 90
	jr nz, .check_a
	jp OverworldIdleHUD_

.check_a
	ret c
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, [wOverworldIdleHUDPage]
	xor $1
	ld [wOverworldIdleHUDPage], a
	jp Func_2c9fe

.finish
	jp Func_2c89f

Func_2c92e: ; 2c92e (b:492e)
	ld a, $c0
	ld [wc91f], a
	ld a, $e0
	ld [wc91e], a
	push bc
	push de
	call Func_2d03
	pop de
	pop bc
	ld a, $e6
	ld [wca00], a
	call Func_2c76c
	ld a, $7
	ld [wca65], a
	jp Func_2ca48

Pointers_2c94f:
	dab Pointers_114000
	dab Pointers_118000
	dab Pointers_11c000
	dab Pointers_120000
	dab Pointers_124000
	dab Pointers_128000
	dab Pointers_100000
	dab Pointers_130000
	dab Pointers_134000
	dab Pointers_12c000
	dab Pointers_138000
	dab Pointers_13c000
	dab Pointers_140000
	dab Pointers_11507b
	dab Pointers_144000
	dab Pointers_145c9a
	dab Pointers_99068
	dab Pointers_40000
	dab Pointers_158000
	dab Pointers_15c000
	dab Pointers_1281d9

Func_2c98e: ; 2c98e (b:498e)
	call Func_2cf28
	call Func_2cce5
	ld de, Data_2d00f
	ld b, $6
	ld a, [wc9ca]
	ld c, $1
	call Func_2ca5c
	ret

Func_2c9a2: ; 2c9a2 (b:49a2)
	call Func_2cf28
	call Func_2ccf6
	ld de, Data_2d127
	ld b, $3
	ld a, [wc9ca]
	ld c, $1
	call Func_2ca5c
	ld a, [wc9ca]
	dec a
	ld [wc9ca], a
	ret

Func_2c9bd: ; 2c9bd (b:49bd)
	call Func_2cf28
	call Func_2cce5
	ld de, Data_2d0c3
	ld b, $2
	ld a, [wc9ca]
	ld c, $1
	call Func_2ca5c
	ret

Func_2c9d1: ; 2c9d1 (b:49d1)
	call Func_2cce5
	call Func_2cd3b
	ld de, wca00
	ld b, $4
	ld a, [wc9ca]
	inc a
	ld c, $2
	call Func_2ca5c
	ret

Func_2c9e6: ; 2c9e6 (b:49e6)
	call Func_2cf28
	call Func_2cceb
	ld de, Data_2d15d
	ld b, $4
	ld a, [wc9ca]
	ld c, $0
	call Func_2ca5c
	ret

Func_2c9fa:
	ret

Func_2c9fb: ; 2c9fb (b:49fb)
	call Func_2d001
Func_2c9fe: ; 2c9fe (b:49fe)
	call Func_2cd63
	ld de, wca08
	ld b, $2
	ld a, [wc9ca]
	ld c, $0
	call Func_2ca5c
	ret

Func_2ca0f: ; 2ca0f (b:4a0f)
	ld a, b
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp $64
	jr c, .asm_2ca20
	ld a, $63
.asm_2ca20
	call Get2DigitBCD
	ld a, $c7
	ld hl, VTilesShared tile $48
	call LoadCharacter
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	add $bb
	ld hl, VTilesShared tile $49
	call LoadCharacter
	ld a, [wNumCGBPalettesToFade]
	and $f
	add $bb
	ld hl, VTilesShared tile $4a
	call LoadCharacter
	ret

Func_2ca48: ; 2ca48 (b:4a48)
	call Func_2cf28
	call Func_2ccf6
	ld de, Data_2d185
	ld b, $3
	ld a, [wc9ca]
	ld c, $c
	call Func_2ca5c
	ret

Func_2ca5c: ; 2ca5c (b:4a5c)
	push bc
	push de
	ld b, $0
REPT 5
	sla a
	rl b
ENDR
	ld d, a
	ld a, [wBGMapAnchor]
	add c
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	ld c, d
	add hl, bc
	call WrapAroundBGMapPointer
	pop de
	pop bc
.loop
	push bc
	push hl
	call Func_2caa5
	pop hl
	pop bc
	push bc
	push hl
	check_cgb
	jr nz, .not_cgb
	call Func_2caf9
.not_cgb
	pop hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop bc
	dec b
	jr nz, .loop
	ret

Func_2caa5: ; 2caa5 (b:4aa5)
	ld a, c
	ld [wSpriteDestIsCustom], a
	ld c, 18
	cp $1
	jr z, .asm_2cacb
	ld c, 10
	cp $0
	jr nz, .asm_2cac0
	ld a, [wc904]
	cp $b
	jr z, .asm_2cacb
	ld c, 20
	jr .asm_2cacb

.asm_2cac0
	ld a, [wSpriteDestIsCustom]
	ld c, 8
	cp $c
	jr z, .asm_2cacb
	ld c, 16
.asm_2cacb
	ld a, c
	ld [wc987], a
Func_2cacf:
	ld a, l
	and $e0
	ld b, a
	ld c, l
	ld a, h
	ld [wc988], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [de]
	ld [hli], a
	inc de
	ei
	ld a, [wc988]
	ld h, a
	ld a, $1
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	ld a, [wc987]
	dec a
	ld [wc987], a
	jr nz, .loop
	ret

Func_2caf9: ; 2caf9 (b:4af9)
	push de
	ld a, c
	ld d, $12
	cp $1
	jr z, .go
	ld d, $a
	cp $0
	jr nz, .asm_2cb12
	ld a, [wc904]
	cp $b
	jr z, .go
	ld d, $14
	jr .go

.asm_2cb12
	ld d, $10
.go
	ld a, l
	and $e0
	ld b, a
	ld c, l
	ld a, h
	ld e, a
	ld a, $1
	ld [rVBK], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [wca65]
	ld [hli], a
	ei
	ld a, e
	ld h, a
	ld a, $1
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	dec d
	jr nz, .loop
	xor a
	ld [rVBK], a
	pop de
	ret

Func_2cb3d: ; 2cb3d (b:4b3d)
	ld a, [wc9ca]
	inc a
	call Func_2cb68
	ld c, $2
	call AdvanceBGMapPointerByC
	push hl
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop de
	ld b, $3
.loop
	push bc
	push hl
	call Func_2cb8c
	pop de
	ld h, d
	ld l, e
	ld bc, BG_MAP_WIDTH
	add hl, bc
	call WrapAroundBGMapPointer
	pop bc
	dec b
	jr nz, .loop
	ret

Func_2cb68: ; 2cb68 (b:4b68)
	ld b, $0
REPT 5
	sla a
	rl b
ENDR
	ld c, a
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	call WrapAroundBGMapPointer
	ret

Func_2cb8c: ; 2cb8c (b:4b8c)
	ld a, $8
	ld [wc987], a
	ld a, l
	and $e0
	ld b, a
	ld c, l
	ld a, h
	ld [wc988], a
.loop
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ei
	ld a, [wc988]
	ld h, a
	ld a, $2
	add c
	ld c, a
	and $1f
	or b
	ld l, a
	push hl
	ld de, hFFE0
	add hl, de
	call Func_2cbc8
	ld d, h
	ld e, l
	pop hl
	ld a, [wc987]
	dec a
	ld [wc987], a
	jr nz, .loop
	ret

Func_2cbc8: ; 2cbc8 (b:4bc8)
	ld a, h
	cp $98
	jr nc, .asm_2cbcf
	ld h, $9c
.asm_2cbcf
	ret

Func_2cbd0: ; 2cbd0 (b:4bd0)
	ld a, [wc9ca]
	add $4
	ld b, $0
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	sla a
	rl b
	ld c, a
	ld a, [wc91f]
	cp $c0
	jr nz, .asm_2cbf8
	ld hl, Data_2d0e7
	jr .asm_2cbfb

.asm_2cbf8
	ld hl, wca00
.asm_2cbfb
	ld a, [wc9ce]
	and $1
	ld de, $0
	jr z, .asm_2cc08
	ld de, $20
.asm_2cc08
	add hl, de
	ld de, $0
	ld a, [wTextSubroutine]
	cp $3
	jr z, .asm_2cc16
	ld de, $10
.asm_2cc16
	add hl, de
	ld d, h
	ld e, l
	ld a, [wBGMapAnchor]
	ld l, a
	ld a, [wBGMapAnchor + 1]
	ld h, a
	add hl, bc
	call WrapAroundBGMapPointer
	ld c, $2
	call AdvanceBGMapPointerByC
	ld a, $10
	ld [wc987], a
	jp Func_2cacf

AdvanceBGMapPointerByC: ; 2cc32 (b:4c32)
	ld a, l
	and $1f
	add c
	cp BG_MAP_WIDTH
	jr c, .no_wrap
	bit 7, a
	jr z, .forward
	ld a, l
	add c
	add BG_MAP_WIDTH
	jr .finish

.forward
	ld a, l
	add c
	sub BG_MAP_WIDTH
	jr .finish

.no_wrap
	ld a, l
	add c
.finish
	ld l, a
	ret

Func_2cc4e: ; 2cc4e (b:4c4e)
	ld hl, wc480
	ld de, wOAMAnimation15
	ld b, $8
	call CopyData_8Bits
	ld hl, wc4a0
	ld de, wOAMAnimation16
	ld b, $8
	call CopyData_8Bits
	ld de, wcadf
	ld hl, wOAMAnimation01
	ld b, $18
	ld a, [wc9ca]
	dec a
	swap a
	srl a
	ld c, a
.asm_2cc75
	push hl
	ld a, [hl]
	ld [de], a
	inc de
	ld a, $4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	pop hl
	add $6
	cp c
	jr c, .asm_2cc92
	sub $3c
	jr nc, .asm_2cc8d
	xor a
.asm_2cc8d
	cp c
	jr nc, .asm_2cc92
	xor a
	ld [hl], a
.asm_2cc92
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_2cc75
	ld hl, wOAMAnimation15
	ld de, wc480
	ld b, $8
	call CopyData_8Bits
	ld hl, wOAMAnimation16
	ld de, wc4a0
	ld b, $8
	call CopyData_8Bits
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ret

Func_2ccb9: ; 2ccb9 (b:4cb9)
	ld hl, wcadf
	ld de, wOAMAnimation01
	ld b, $18
.asm_2ccc1
	ld a, [hli]
	ld [de], a
	ld a, $20
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	dec b
	jr nz, .asm_2ccc1
	ld hl, wOAMAnimation15
	ld de, wc480
	ld b, $1
	call CopyData_8Bits
	ld hl, wOAMAnimation16
	ld de, wc4a0
	ld b, $1
	call CopyData_8Bits
	ret

Func_2cce5: ; 2cce5 (b:4ce5)
	call Func_2cceb
	jp Func_2ccf6

Func_2cceb: ; 2cceb (b:4ceb)
	ld a, [wc91f]
asm_2ccee
	call Func_35c2
	ld b, $80
	jp Func_2ccfd

Func_2ccf6: ; 2ccf6 (b:4cf6)
	ld a, [wc91f]
	add $10
	jr asm_2ccee

Func_2ccfd: ; 2ccfd (b:4cfd)
	ld a, [wFontPaletteMode]
	cp $0
	jr z, .asm_2cd0c
	cp $1
	jr z, .asm_2cd1b
	cp $2
	jr z, .asm_2cd2b
.asm_2cd0c
	di
.asm_2cd0d
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd0d
	xor a
	ld [hli], a
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd0c
	ret

.asm_2cd1b
	di
.asm_2cd1c
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd1c
	xor a
	ld [hli], a
	cpl
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd1b
	ret

.asm_2cd2b
	di
.asm_2cd2c
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cd2c
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ei
	dec b
	jr nz, .asm_2cd2b
	ret

Func_2cd3b: ; 2cd3b (b:4d3b)
	ld hl, wca00
	ld a, [wc91e]
	add $f
	ld b, $30
.asm_2cd45
	ld a, a
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_2cd45
	ld hl, wca10
	ld a, [wc91f]
	ld b, $10
.asm_2cd53
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_2cd53
	ld hl, wca30
	ld b, $10
.asm_2cd5d
	ld [hli], a
	inc a
	dec b
	jr nz, .asm_2cd5d
	ret

Func_2cd63: ; 2cd63 (b:4d63)
	ld hl, wca08
	ld de, Data_2d1c5
	ld a, [wOverworldIdleHUDPage]
	or a
	jr z, .asm_2cd72
	ld de, Data_2d1ed
.asm_2cd72
	ld b, $28
.asm_2cd74
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_2cd74
	ld hl, wca09
	ld c, $0
	call Func_2cd87
	ld hl, wca1d
	ld c, $1
Func_2cd87: ; 2cd87 (b:4d87)
	ld de, wca00
	ld b, $5
.loop
	ld a, [de]
	sub "0"
	jr c, .skip
	add a
	add "9"
	add c
	ld [hli], a
	jr .next

.skip
	inc hl
.next
	inc de
	dec b
	jr nz, .loop
	jr @ + 2 ; nop
	ld a, [wOverworldIdleHUDPage]
	or a
	jr z, .print_hp
	callba Func_a54f1
	push de
	ld a, d
	call Get2DigitBCD
	ld hl, wca14
	ld c, "9"
	call .Print2DigitBCD
	ld hl, wca28
	ld c, "9" + 1
	call .Print2DigitBCD
	pop de
	ld a, e
	call Get2DigitBCD
	ld hl, wca18
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca2c
	ld c, "9" + 1
	call .Print3DigitBCD
	ret

.print_hp
	ld a, [wPartnerDenjuuHPRemaining]
	call Get2DigitBCD
	ld hl, wca14
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca28
	ld c, "9" + 1
	call .Print3DigitBCD
	callba GetPartnerDenjuuMaxHP
	ld a, c
	call Get2DigitBCD
	ld hl, wca18
	ld c, "9"
	call .Print3DigitBCD
	ld hl, wca2c
	ld c, "9" + 1
	call .Print3DigitBCD
	ret

.Print3DigitBCD: ; 2ce0b (b:4e0b)
	ld a, [wCGBPalFadeProgram]
	and $f
	sla a
	add c
	ld [hli], a
.Print2DigitBCD: ; 2ce14 (b:4e14)
	ld a, [wNumCGBPalettesToFade]
	swap a
	and $f
	sla a
	add c
	ld [hli], a
	ld a, [wNumCGBPalettesToFade]
	and $f
	sla a
	add c
	ld [hli], a
	ret

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
	ld d, $0
	ld a, [wcafc]
	ld e, a
	ld hl, Pointers_2c94f
	add hl, de
	add hl, de
	add hl, de
	ld a, [hli]
	ld e, a
	ld a, [hli]
	ld d, a
	ld b, [hl]
	ld a, [wcafb]
	ld l, a
	ld h, $0
	sla l
	rl h
	add hl, de
	ld c, b
	call GetFarByte
	ld e, b
	inc hl
	ld b, c
	call GetFarByte
	ld h, b
	ld l, e
	ld b, c
	call GetFarByte
	ld a, b
	cp $e9
	ret nz
	inc hl
	ld b, c
	call GetFarByte
	ld a, b
	or a
	ret z
	dec a
	ld b, a
	ld a, [wCustomSpriteDest]
	cp b
	ret nz
	ld a, $1
	ld [wc942], a
	call Func_30a7
	and $3
	add $c0
	ld [wcafb], a
	ld a, $0
	ld [wcafc], a
	ret

Data_2cef4:
	db $03, $06, $07, $08
	db $09, $0a, $0b, $0c
	db $0d, $0e, $0f, $10
	db $11, $12, $13, $14
	db $1a, $1b, $1c, $1d
	db $1e, $1a, $1b, $1c
	db $1d, $1e, $03, $3d
	db $3e, $3f, $40, $41
	db $42, $43, $44, $45
	db $46, $47, $48, $49
	db $4a, $4b, $51, $52
	db $53, $1d, $54, $51
	db $52, $53, $1d, $54

Func_2cf28: ; 2cf28 (b:4f28)
	ld hl, VTilesShared tile $70
	ld de, GFX_2cf61
	ld bc, 10 tiles
	call Copy2bpp_2
	ld hl, VTilesShared tile $6f
	ld b, $8
	ld a, [wFontPaletteMode]
	cp $2
	jr z, .asm_2cf50
.asm_2cf40
	di
.asm_2cf41
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cf41
	xor a
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .asm_2cf40
	ret

.asm_2cf50
	di
.asm_2cf51
	ld a, [rSTAT]
	and $2
	jr nz, .asm_2cf51
	ld a, $ff
	ld [hli], a
	ld [hli], a
	ei
	inc de
	dec b
	jr nz, .asm_2cf50
	ret

GFX_2cf61: INCBIN "gfx/font/frame_2cf61.2bpp"

Func_2d001:
	ld a, BANK(GFX_e319c)
	ld hl, VTilesShared tile $40
	ld de, GFX_e319c
	ld bc, $2c tiles
	jp FarCopy2bpp_2

Data_2d00f:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $f6
	db $f4, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf, $f6
	db $f4, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $f6
	db $f4, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de, $df, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d07b:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $f6
	db $f4, $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de, $df, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d0c3:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d0e7:
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef
	db $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $c8, $c9, $ca, $cb, $cc, $cd, $ce, $cf

Data_2d107:
	db $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef, $ef
	db $d0, $d1, $d2, $d3, $d4, $d5, $d6, $d7, $d8, $d9, $da, $db, $dc, $dd, $de, $df

Data_2d127:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $e0, $e1, $e2, $e3, $e4, $e5, $e6, $e7, $e8, $e9, $ea, $eb, $ec, $ed, $ee, $ef, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d15d:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $f6
	db $f4, $ef, $ef, $ef, $ef, $ef, $c8, $c9, $ca, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d185:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $d0, $d1, $d2, $d3, $d4, $d5, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d19d:
	db $f4, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $f6
	db $f7, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f8, $f9

Data_2d1b1:
	db $f0, $f1, $f2, $f2, $f2, $f2, $f2, $f2, $f2, $f3
	db $f4, $c0, $c1, $c2, $c3, $c4, $c5, $c6, $c7, $f6

Data_2d1c5:
	db $c0, $e0, $e0, $e0, $e0, $e0, $d8, $da, $c2, $c0
	db $de, $e2, $c4, $c4, $c4, $dc, $c4, $c4, $c4, $c2
	db $c1, $e1, $e1, $e1, $e1, $e1, $d9, $db, $c3, $c1
	db $df, $e3, $c5, $c5, $c5, $dd, $c5, $c5, $c5, $c3

Data_2d1ed:
	db $c0, $e0, $e0, $e0, $e0, $e0, $d8, $da, $c2, $c0
	db $e4, $e6, $c4, $c4, $e8, $ea, $c4, $c4, $c4, $c2
	db $c1, $e1, $e1, $e1, $e1, $e1, $d9, $db, $c3, $c1
	db $e5, $e7, $c5, $c5, $e9, $eb, $c5, $c5, $c5, $c3

Data_2d215:
	db $c0, $de, $c4, $c4, $c4, $dc, $c4, $c4, $c4, $c2
	db $c1, $df, $c5, $c5, $c5, $dd, $c5, $c5, $c5, $c3

FontGFX: INCBIN "gfx/font/font_2d229.t13.1bpp"

Func_2d8c1: ; 2d8c1 (b:58c1)
	push hl
	ld a, [wc922]
	inc a
	and $3f
	ld [wc922], a
	ld hl, Data_2d8eb
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld hl, wc923
	add [hl]
	cpl
	swap a
	ld [hl], a
	pop hl
	ret

Func_2d8df: ; 2d8df (b:58df)
	call Func_2d8c1
	ld b, $0
	bit 7, a
	jr z, .asm_2d8e9
	dec b
.asm_2d8e9
	ld c, a
	ret

Data_2d8eb:
	db $1d, $a0, $63, $e5, $03, $3b, $4d, $f4
	db $ec, $46, $5b, $37, $93, $53, $85, $fe
	db $da, $9d, $27, $85, $f5, $10, $7b, $15
	db $e5, $94, $55, $ab, $6c, $b4, $3f, $b6
	db $5a, $1d, $a9, $30, $56, $c0, $49, $92
	db $20, $e7, $d0, $c3, $85, $01, $25, $55
	db $a4, $cf, $a8, $18, $2c, $f4, $55, $f3
	db $d5, $33, $a4, $cd, $80, $84, $e3, $74

Func_2d92b: ; 2d92b (b:592b)
	push bc
	push de
	ld d, b
	ld a, $10
	sub d
	ld e, a
	call Multiply_C_by_E
	ld a, e
	ld [wCustomSpriteDest], a
	ld a, d
	ld [wCustomSpriteDest + 1], a
	pop de
	pop af
	ld c, a
	call Multiply_C_by_E
	ld h, d
	ld l, e
	ld a, [wCustomSpriteDest]
	ld e, a
	ld a, [wCustomSpriteDest + 1]
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ret

Func_2d95f: ; 2d95f (b:595f)
	push bc
	push de
	ld d, b
	ld a, $40
	sub d
	ld e, a
	call Multiply_C_by_E
	ld a, e
	ld [wCustomSpriteDest], a
	ld a, d
	ld [wCustomSpriteDest + 1], a
	pop de
	pop af
	ld c, a
	call Multiply_C_by_E
	ld h, d
	ld l, e
	ld a, [wCustomSpriteDest]
	ld e, a
	ld a, [wCustomSpriteDest + 1]
	ld d, a
	add hl, de
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	srl h
	rr l
	ret

Func_2d99b: ; 2d99b (b:599b)
	ld a, b
	ld [wca68], a
	xor d
	ld [wca69], a
	bit 7, d
	jp z, Func_2d9ae
	sub a
	sub e
	ld e, a
	sbc a
	sub d
	ld d, a
Func_2d9ae: ; 2d9ae (b:59ae)
	bit 7, b
	jp z, Func_2d9b9
	sub a
	sub c
	ld c, a
	sbc a
	sub b
	ld b, a
Func_2d9b9: ; 2d9b9 (b:59b9)
	call Func_2d9d8
	ret c
	ld a, [wca69]
	and $80
	jp z, Func_2d9cb
	sub a
	sub c
	ld c, a
	sbc a
	sub b
	ld b, a
Func_2d9cb: ; 2d9cb (b:59cb)
	ld a, [wca68]
	and $80
	ret z
	sub a
	sub e
	ld e, a
	sbc a
	sub d
	ld d, a
	ret

Func_2d9d8: ; 2d9d8 (b:59d8)
	ld a, e
	or d
	jr nz, .asm_2d9e3
	ld bc, $0
	ld d, b
	ld e, c
	scf
	ret

.asm_2d9e3
	ld l, c
	ld h, b
	ld bc, $0
	or a
	ld a, $10
.asm_2d9eb
	ld [wca6a], a
	rl l
	rl h
	rl c
	rl b
	push bc
	ld a, c
	sbc e
	ld c, a
	ld a, b
	sbc d
	ld b, a
	ccf
	jr c, .asm_2da03
	pop bc
	jr .asm_2da05

.asm_2da03
	inc sp
	inc sp
.asm_2da05
	ld a, [wca6a]
	dec a
	jr nz, .asm_2d9eb
	ld d, b
	ld e, c
	rl l
	ld c, l
	rl h
	ld b, h
	or a
	ret

Func_2da15:
	ld a, c
	rlca
	sbc a
	ld b, a
	ld a, e
	rlca
	sbc a
	ld d, a
	jp Func_2d99b

Func_2da20: ; 2da20 (b:5a20)
	ld b, $0
	ld d, $0
	jp Func_2d9d8

Func_2da27: ; 2da27 (b:5a27)
	push hl
	ld a, b
	sub d
	jr nc, .asm_2da2e
	cpl
	inc a
.asm_2da2e
	push af
	ld a, c
	sub e
	jr nc, .asm_2da35
	cpl
	inc a
.asm_2da35
	ld l, a
	pop af
	add l
	pop hl
	ret

Func_2da3a: ; 2da3a (b:5a3a)
	ld de, SineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Func_2da47: ; 2da47 (b:5a47)
	ld de, CosineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Func_2da54: ; 2da54 (b:5a54)
	ld de, SineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld e, a
	ld d, $0
	bit 7, a
	jr z, .asm_2da68
	dec d
.asm_2da68
	ret

Func_2da69: ; 2da69 (b:5a69)
	ld de, CosineWave
	and $7f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld e, a
	ld d, $0
	bit 7, a
	jr z, .asm_2da7d
	dec d
.asm_2da7d
	ret

Func_2da7e: ; 2da7e (b:5a7e)
	ld a, b
	ld [wca06], a
	ld a, [hli]
	ld [wca00], a
	ld a, [hli]
	ld [wca01], a
	push hl
	ld a, [wca06]
	call Func_2da3a
	ld [wca02], a
	ld a, [wca06]
	call Func_2da47
	ld [wca03], a
	ld a, [wca00]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2daa8
	dec b
.asm_2daa8
	ld a, [wca03]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2dab3
	dec d
.asm_2dab3
	call Multiply_DE_by_BC
	push de
	ld a, [wca01]
	cpl
	inc a
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2dac4
	dec b
.asm_2dac4
	ld a, [wca02]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2dacf
	dec d
.asm_2dacf
	call Multiply_DE_by_BC
	ld h, d
	ld l, e
	pop de
	add hl, de
	ld a, h
	ld [wca04], a
	ld a, [wca00]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2dae5
	dec b
.asm_2dae5
	ld a, [wca02]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2daf0
	dec d
.asm_2daf0
	call Multiply_DE_by_BC
	push de
	ld a, [wca01]
	ld c, a
	ld b, $0
	bit 7, c
	jr z, .asm_2daff
	dec b
.asm_2daff
	ld a, [wca03]
	ld e, a
	ld d, $0
	bit 7, e
	jr z, .asm_2db0a
	dec d
.asm_2db0a
	call Multiply_DE_by_BC
	ld h, d
	ld l, e
	pop de
	add hl, de
	ld a, h
	ld [wca05], a
	ld a, [wca04]
	ld b, a
	ld c, h
	pop hl
	ret

Func_2db1c: ; 2db1c (b:5b1c)
	push bc
	push de
	ld a, d
	ld l, e
	call Func_2da47
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db2e
	dec b
.asm_2db2e
	call Multiply_DE_by_BC
	ld a, d
	ld [wca68], a
	pop de
	pop bc
	ld a, [wca68]
	add b
	ld b, a
	push bc
	ld a, d
	ld l, e
	call Func_2da3a
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db4d
	dec b
.asm_2db4d
	call Multiply_DE_by_BC
	ld a, d
	pop bc
	add c
	ld c, a
	ret

Func_2db55: ; 2db55 (b:5b55)
	push de
	ld a, d
	ld l, e
	call Func_2da47
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db66
	dec b
.asm_2db66
	call Multiply_DE_by_BC
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_2db71
	dec b
.asm_2db71
	pop de
	push bc
	ld a, d
	ld l, e
	call Func_2da3a
	ld d, $0
	ld e, l
	ld c, a
	bit 7, a
	ld b, $0
	jr z, .asm_2db83
	dec b
.asm_2db83
	call Multiply_DE_by_BC
	ld e, d
	ld d, $0
	bit 7, e
	jr z, .asm_2db8e
	dec d
.asm_2db8e
	pop bc
	ret

Func_2db90: ; 2db90 (b:5b90)
	srl b
	srl c
	srl d
	srl e
Func_2db98: ; 2db98 (b:5b98)
	xor a
	ld hl, wca67
	ld [hl], a
	ld a, c
	sub e
	ld e, a
	bit 7, a
	jr z, .asm_2dba8
	xor a
	sub e
	ld e, a
	inc [hl]
.asm_2dba8
	ld a, b
	sub d
	ld c, a
	bit 7, a
	jr z, .asm_2dbb4
	xor a
	sub c
	ld c, a
	set 1, [hl]
.asm_2dbb4
	xor a
	or e
	jr nz, .asm_2dbbc
	ld a, $10
	jr .asm_2dbd6

.asm_2dbbc
	ld d, $0
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	call Func_2d9d8
	call Func_2dbfb
.asm_2dbd6
	sla a
	push af
	ld a, [wca67]
	or a
	jr nz, .asm_2dbe5
	pop af
	cpl
	inc a
	add $20
	ret

.asm_2dbe5
	cp $2
	jr nz, .asm_2dbed
	pop af
	add $20
	ret

.asm_2dbed
	cp $3
	jr nz, .asm_2dbf7
	pop af
	cpl
	inc a
	add $60
	ret

.asm_2dbf7
	pop af
	add $60
	ret

Func_2dbfb: ; 2dbfb (b:5bfb)
	xor a
	or b
	jr nz, .asm_2dc04
	ld a, c
	cp $a2
	jr c, .asm_2dc07
.asm_2dc04
	ld a, $10
	ret

.asm_2dc07
	or a
	jr nz, .asm_2dc0c
	xor a
	ret

.asm_2dc0c
	cp $50
	jr nc, .asm_2dc43
	cp $34
	jr nc, .asm_2dc46
	cp $26
	jr nc, .asm_2dc49
	cp $1d
	jr nc, .asm_2dc4c
	cp $17
	jr nc, .asm_2dc4f
	cp $13
	jr nc, .asm_2dc52
	cp $10
	jr nc, .asm_2dc55
	cp $d
	jr nc, .asm_2dc58
	cp $a
	jr nc, .asm_2dc5b
	cp $8
	jr nc, .asm_2dc5e
	cp $6
	jr nc, .asm_2dc61
	cp $4
	jr nc, .asm_2dc64
	cp $3
	jr nc, .asm_2dc67
	ld a, $1
	ret

.asm_2dc43
	ld a, $f
	ret

.asm_2dc46
	ld a, $e
	ret

.asm_2dc49
	ld a, $d
	ret

.asm_2dc4c
	ld a, $c
	ret

.asm_2dc4f
	ld a, $b
	ret

.asm_2dc52
	ld a, $a
	ret

.asm_2dc55
	ld a, $9
	ret

.asm_2dc58
	ld a, $8
	ret

.asm_2dc5b
	ld a, $7
	ret

.asm_2dc5e
	ld a, $6
	ret

.asm_2dc61
	ld a, $5
	ret

.asm_2dc64
	ld a, $4
	ret

.asm_2dc67
	ld a, $3
	ret

.asm_2dc6a
	ld a, $2
	ret

Func_2dc6d: ; 2dc6d (b:5c6d)
	ld a, $10
	add b
	ld b, a
	ld a, $10
	add c
	ld c, a
	ld a, $10
	add d
	ld d, a
	ld a, $10
	add e
	ld e, a
	srl b
	srl c
	srl d
	srl e
	jp Func_2db98

SineWave: ; 2dc88
	db  $00,  $06,  $0c,  $12,  $18,  $1f,  $25,  $2b,  $30,  $36,  $3c,  $41,  $47,  $4c,  $51,  $55
	db  $5a,  $5e,  $62,  $66,  $6a,  $6d,  $70,  $73,  $76,  $78,  $7a,  $7c,  $7d,  $7e,  $7f,  $7f
CosineWave: ; 2dca8
	db  $7f,  $7f,  $7f,  $7e,  $7d,  $7c,  $7a,  $78,  $76,  $73,  $70,  $6d,  $6a,  $66,  $62,  $5e
	db  $5a,  $55,  $51,  $4c,  $47,  $41,  $3c,  $36,  $30,  $2b,  $25,  $1f,  $18,  $12,  $0c,  $06
	db  $00, -$06, -$0c, -$12, -$18, -$1f, -$25, -$2b, -$30, -$36, -$3c, -$41, -$47, -$4c, -$51, -$55
	db -$5a, -$5e, -$62, -$66, -$6a, -$6d, -$70, -$73, -$76, -$78, -$7a, -$7c, -$7d, -$7e, -$7f, -$7f
	db -$7f, -$7f, -$7f, -$7e, -$7d, -$7c, -$7a, -$78, -$76, -$73, -$70, -$6d, -$6a, -$66, -$62, -$5e
	db -$5a, -$55, -$51, -$4c, -$47, -$41, -$3c, -$36, -$30, -$2b, -$25, -$1f, -$18, -$12, -$0c, -$06
	db  $00,  $06,  $0c,  $12,  $18,  $1f,  $25,  $2b,  $30,  $36,  $3c,  $41,  $47,  $4c,  $51,  $55
	db  $5a,  $5e,  $62,  $66,  $6a,  $6d,  $70,  $73,  $76,  $78,  $7a,  $7c,  $7d,  $7e,  $7f,  $7f

Func_2dd28: ; 2dd28 (b:5d28)
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

Func_2dd41: ; 2dd41 (b:5d41)
	push hl
	ld a, $c
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

Func_2dd5a: ; 2dd5a (b:5d5a)
	push hl
	ld a, $8
	add l
	ld l, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	ld de, $3
	add hl, de
	ld a, [hli]
	ld c, a
	ld a, [hli]
	ld b, a
	ld a, [hli]
	ld e, a
	ld d, [hl]
	dec hl
	dec hl
	dec hl
	ld a, c
	add e
	ld c, a
	ld a, b
	adc d
	ld [hl], c
	inc hl
	ld [hl], a
	pop hl
	ret

Func_2dd89: ; 2dd89 (b:5d89)
	push hl
	ld a, $a
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2dd9d: ; 2dd9d (b:5d9d)
	push hl
	ld a, $e
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2ddb1: ; 2ddb1 (b:5db1)
	push hl
	ld a, $c
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2ddc5: ; 2ddc5 (b:5dc5)
	push hl
	ld a, $8
	add l
	ld l, a
	push hl
	ld a, [hli]
	ld e, a
	ld a, [hl]
	ld h, a
	ld l, e
	add hl, bc
	pop de
	ld a, l
	ld [de], a
	inc de
	ld a, h
	ld [de], a
	pop hl
	ret

Func_2ddd9: ; 2ddd9 (b:5dd9)
	ld a, [wcad4]
	or a
	ret z
	sub $3
	jr nc, .asm_2dde3
	xor a
.asm_2dde3
	ld [wcad4], a
	ld c, a
	ld a, [wcad5]
	add $18
	ld [wcad5], a
	call Func_2da3a
	ld e, a
	call Multiply_C_by_E_signed
	ld a, [wcad6]
	or a
	jr nz, .asm_2de0a
	ld a, [wcad8]
	sra d
	sra d
	sra d
	add d
	ld [wSCY], a
	ret

.asm_2de0a
	ld a, [wcad7]
	sra d
	sra d
	sra d
	add d
	ld [wSCX], a
	ret

Func_2de18: ; 2de18 (b:5e18)
	ld a, [wcad4]
	or a
	jr z, .asm_2de2a
	ld a, [wcad7]
	ld [wSCX], a
	ld a, [wcad8]
	ld [wSCY], a
.asm_2de2a
	ld a, b
	ld [wcad4], a
	ld a, [wSCX]
	ld [wcad7], a
	ld a, [wSCY]
	ld [wcad8], a
	ld a, c
	ld [wcad6], a
	ret

Func_2de3f:
	call Func_2dec1
	ld bc, EVENT_08A
	call ResetEventFlag
	ld bc, EVENT_08B
	call ResetEventFlag
	ld hl, wcdf6
	ld a, [wc912]
	cp $6e
	jr c, .asm_2de75
	cp $9b
	jr c, .asm_2dea0
	ld a, [wcdf8]
	or a
	jr z, .asm_2de68
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2de68
	ld a, [wcdfb]
	or a
	jr z, .asm_2de74
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2de74
	ret

.asm_2de75
	ld a, [wcdf6]
	ld c, a
	ld a, [wcdf7]
	ld b, a
	ld a, [wcdf8]
	or b
	or c
	jr z, .asm_2de8a
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2de8a
	ld a, [wcdf9]
	ld c, a
	ld a, [wcdfa]
	ld b, a
	ld a, [wcdfb]
	or b
	or c
	jr z, .asm_2de9f
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2de9f
	ret

.asm_2dea0
	ld a, [wcdf7]
	ld b, a
	ld a, [wcdf8]
	or b
	jr z, .asm_2deb0
	ld bc, EVENT_08A
	call SetEventFlag
.asm_2deb0
	ld a, [wcdfa]
	ld b, a
	ld a, [wcdfb]
	or b
	jr z, .asm_2dec0
	ld bc, EVENT_08B
	call SetEventFlag
.asm_2dec0
	ret

Func_2dec1: ; 2dec1 (b:5ec1)
	ld hl, wcdf6
	ld b, $6
.asm_2dec6
	ld a, [hli]
	or a
	jr nz, .asm_2ded3
	dec b
	jr nz, .asm_2dec6
	ld bc, EVENT_088
	jp ResetEventFlag

.asm_2ded3
	ld bc, EVENT_088
	jp SetEventFlag

AddOrSubtractMoney: ; 2ded9 (b:5ed9)
	push hl
	ld a, [wMoney + 1]
	ld h, a
	ld a, [wMoney]
	ld l, a
	add hl, bc
	jr c, .overflow_or_underflow
	bit 7, b
	jr nz, .overflow_or_underflow
.underflowed
	push hl
	ld bc, (-MAX_MONEY) & $ffff
	add hl, bc
	jr nc, .no_overflow
	add sp, $2
	ld hl, MAX_MONEY
	jr .return_money

.no_overflow
	pop hl
.return_money
	ld a, h
	ld [wMoney + 1], a
	ld a, l
	ld [wMoney], a
	pop hl
	ret

.overflow_or_underflow
	bit 7, b
	jr nz, .underflowed
	ld hl, wMoney
	ld a, MAX_MONEY % $100
	ld [hli], a
	ld a, MAX_MONEY / $100
	ld [hl], a
	pop hl
	ret

Func_2df11:
	ld a, [wcadc]
	cpl
	ld c, a
	ld a, [wcadd]
	cpl
	ld b, a
	inc bc
	jr AddOrSubtractMoney

Func_2df1e: ; 2df1e (b:5f1e)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s3_a000)
	ld [MBC3SRamBank], a
	ld hl, wc480
	ld de, wOAMAnimation15
	ld b, $20
	call CopyData_8Bits
	ld hl, wc4a0
	ld de, wOAMAnimation16_PriorityFlags
	ld b, $20
	call CopyData_8Bits
	ld de, wOAMBufferEnd
	ld hl, s3_a000
	ld bc, $300
.asm_2df47
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_2df47
	ld a, $0
	ld [MBC3SRamEnable], a
	ret

Func_2df55: ; 2df55 (b:5f55)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, BANK(s3_a000)
	ld [MBC3SRamBank], a
	ld de, wOAMAnimations
	ld hl, s3_a000
	ld bc, $300
.asm_2df68
	ld a, [hli]
	ld [de], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_2df68
	ld a, $0
	ld [MBC3SRamEnable], a
	ld hl, wOAMAnimation15_PriorityFlags
	ld de, wc480
	ld b, $20
	call CopyData_8Bits
	ld hl, wOAMAnimation16_PriorityFlags
	ld de, wc4a0
	ld b, $20
	call CopyData_8Bits
	ld de, $20
	ld hl, wOAMAnimation01
	ld b, $18
	xor a
.asm_2df94
	push hl
	ld a, [hl]
	and $2
	jr nz, .asm_2df9d
	ld [hl], a
	jr .asm_2dfa9

.asm_2df9d
	ld a, $19
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	or $8
	ld [hl], a
.asm_2dfa9
	pop hl
	add hl, de
	dec b
	jr nz, .asm_2df94
	ret

Func_2dfaf:
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .asm_2dfc8
	ld a, [wc904]
	inc a
	ld [wc904], a
	cp $35
	jr c, .asm_2dff7
	ld a, $0
	ld [wc904], a
	jr .asm_2dff7

.asm_2dfc8
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .asm_2dfe1
	ld a, [wc904]
	dec a
	ld [wc904], a
	cp $2
	jr nc, .asm_2dff7
	ld a, $34
	ld [wc904], a
	jr .asm_2dff7

.asm_2dfe1
	ld a, [wJoyNew]
	and D_UP
	jr z, .asm_2dfed
	call Func_2e050
	jr .asm_2dff7

.asm_2dfed
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .asm_2dff7
	call Func_2e03c
.asm_2dff7
	push af
	push hl
	push bc
	ld a, [wc904]
	hlbgcoord 1, 0, VWindow
	call Func_353b
	pop bc
	pop hl
	pop af
	push af
	push hl
	push bc
	ld a, [wc906]
	hlbgcoord 4, 0, VWindow
	call Func_353b
	pop bc
	pop hl
	pop af
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $50
	ld [wc902], a
	ld a, $40
	ld [wc901], a
	ld a, $2
	ld [wc900], a
	ld a, $7
	ld [wSubroutine], a
	ld a, $4
	jp Func_122d

Func_2e033:
	ld a, $8
	ld [wSubroutine], a
	call Func_35a3
	ret

Func_2e03c: ; 2e03c (b:603c)
	ld a, [wc906]
	inc a
	and $3f
	ld [wc906], a
	call Func_2793
	ld a, [wc903]
	cp $ff
	ret nz
	jr Func_2e03c

Func_2e050: ; 2e050 (b:6050)
	ld a, [wc906]
	dec a
	and $3f
	ld [wc906], a
	call Func_2793
	ld a, [wc903]
	cp $ff
	ret nz
	jr Func_2e050

Func_2e064: ; 2e064 (b:6064)
	ld a, [wSubroutine]
	cp $6
	ret z
	ld hl, wc480
	ld de, wOAMAnimation15_PriorityFlags
	ld a, [wc49a]
	cp $14
	jr nz, .asm_2e080
	ld a, [wOAMAnimation16 + $1f]
	ld b, a
	ld a, [wOAMAnimation16 + $1e]
	jr .asm_2e087

.asm_2e080
	ld a, [wPartnerDenjuuYCoord]
	ld b, a
	ld a, [wPlayerYCoord]
.asm_2e087
	sub b
	ld b, a
	bit 7, b
	jr z, .asm_2e090
	ld de, wOAMAnimation16
.asm_2e090
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld hl, wc4a0
	ld de, wOAMAnimation16
	bit 7, b
	jr z, .asm_2e0ae
	ld de, wOAMAnimation15
.asm_2e0ae
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hli]
	ld [de], a
	ld a, [wc49a]
	cp $14
	jr z, .asm_2e0d1
	ld hl, wOAMAnimation16 + $1e
	ld a, [wPlayerYCoord]
	ld [hli], a
	ld a, [wPartnerDenjuuYCoord]
	ld [hl], a
.asm_2e0d1
	ret

Func_2e0d2: ; 2e0d2 (b:60d2)
	ld a, [wcd01]
	cp $1
	jr z, .asm_2e0de
	ld a, [wcd00]
	or a
	ret nz
.asm_2e0de
	ld a, [wc904]
	cp $2
	ret c
	cp $32
	jr nc, .asm_2e0eb
	cp $2b
	ret nc
.asm_2e0eb
	ld a, [wc904]
	cp $a
	jr nc, .asm_2e148
	call Func_2e179
	ld a, [wc906]
	ld [wc913], a
	ld a, [wc904]
	ld [wc914], a
	cp $6
	jr c, .asm_2e107
	sub $4
.asm_2e107
	sub $2
	sla a
	sla a
	sla a
	ld hl, wc960
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wc906]
	ld b, a
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
.asm_2e129
	and $7
	ld c, $1
	or a
	jr z, .asm_2e135
.asm_2e130
	sla c
	dec a
	jr nz, .asm_2e130
.asm_2e135
	ld a, $a
	ld [MBC3SRamEnable], a
	ld a, $2
	ld [MBC3SRamBank], a
	ld a, [hl]
	or c
	ld [hl], a
	ld a, $0
	ld [MBC3SRamEnable], a
	ret

.asm_2e148
	sub $a
	cp $28
	jr c, .asm_2e150
	sub $7
.asm_2e150
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	ld hl, $b000
	add hl, bc
	ld a, [wc906]
	srl a
	srl a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wc906]
	and $7
	jr .asm_2e129

Func_2e179: ; 2e179 (b:6179)
	ld a, [wc906]
	ld b, a
	ld a, [wc904]
	ld c, a
	cp $2
	jr nz, .asm_2e1b8
	ld a, b
	cp $8
	jr nz, .asm_2e1b8
	ld b, $1e
	ld a, [wc960]
	or b
	ld [wc960], a
	ld b, $a
	ld a, [wc961]
	or b
	ld [wc961], a
	ld b, $9
	ld a, [wc962]
	or b
	ld [wc962], a
	ld b, $3
	ld a, [wc963]
	or b
	ld [wc963], a
	ld b, $5
	ld a, [wc964]
	or b
	ld [wc964], a
	ret

.asm_2e1b8
	ld a, c
	cp $2
	jr nz, .asm_2e1d5
	ld a, b
	cp $f
	jr nz, .asm_2e1d5
	ld b, $80
	ld a, [wc960]
	or b
	ld [wc960], a
	ld b, $1
	ld a, [wc968]
	or b
	ld [wc968], a
	ret

.asm_2e1d5
	ld a, c
	cp $3
	jr nz, .asm_2e1e9
	ld a, b
	cp $f
	jr nz, .asm_2e1e9
	ld b, $c0
	ld a, [wc968]
	or b
	ld [wc968], a
	ret

.asm_2e1e9
	ld a, c
	cp $5
	jr nz, .asm_2e1fc
	ld a, b
	cp $27
	jr nz, .asm_2e1fc
	ld b, $80
	ld a, [wc97d]
	or b
	ld [wc97d], a
.asm_2e1fc
	ret

Func_2e1fd:
	ld a, b
	call Func_2e204
	jp Func_2e0d2

Func_2e204: ; 2e204 (b:6204)
	call Func_2e2f1
	ld b, a
	and $1
	jr nz, .asm_2e217
	ld a, [wc906]
	add b
	and $3f
	ld [wc906], a
	jr .asm_2e227

.asm_2e217
	ld a, [wc906]
	and $f8
	ld c, a
	ld a, [wc906]
	add b
	and $7
	or c
	ld [wc906], a
.asm_2e227
	ld a, [wc904]
	cp $2
	jr z, .asm_2e23c
	cp $3
	jr z, .asm_2e268
	cp $4
	jr z, asm_2e297
	cp $5
	jp z, Func_2e2c3
	ret

.asm_2e23c
	ld a, $8
	cp b
	jr nz, .asm_2e252
	ld a, [wc906]
	cp $8
	jr nc, asm_2e296
	ld a, [wc904]
	add $2
	ld [wc904], a
	jr asm_2e296

.asm_2e252
	ld a, $1
	cp b
	jr nz, asm_2e296
	ld a, [wc906]
	and $7
	jr nz, asm_2e296
	ld a, [wc904]
	add $1
	ld [wc904], a
	jr asm_2e296

.asm_2e268
	ld a, $8
	cp b
	jr nz, .asm_2e27e
	ld a, [wc906]
	cp $7
	jr nc, asm_2e296
	ld a, [wc904]
	add $2
	ld [wc904], a
	jr asm_2e296

.asm_2e27e
	ld a, $ff
	cp b
	jr nz, asm_2e296
	ld a, [wc906]
	and $7
	cp $7
	jr nz, asm_2e296
	ld a, [wc904]
	sub $1
	ld [wc904], a
	jr asm_2e296

asm_2e296
	ret

asm_2e297
	ld a, $f8
	cp b
	jr nz, .asm_2e2ad
	ld a, [wc906]
	cp $38
	jr c, asm_2e296
	ld a, [wc904]
	sub $2
	ld [wc904], a
	jr asm_2e296

.asm_2e2ad
	ld a, $1
	cp b
	jr nz, asm_2e296
	ld a, [wc906]
	and $7
	jr nz, asm_2e296
	ld a, [wc904]
	add $1
	ld [wc904], a
	jr asm_2e296

Func_2e2c3: ; 2e2c3 (b:62c3)
	ld a, $f8
	cp b
	jr nz, .asm_2e2d9
	ld a, [wc906]
	cp $38
	jr c, asm_2e296
	ld a, [wc904]
	sub $2
	ld [wc904], a
	jr asm_2e296

.asm_2e2d9
	ld a, $ff
	cp b
	jr nz, asm_2e296
	ld a, [wc906]
	and $7
	cp $7
	jr nz, asm_2e296
	ld a, [wc904]
	sub $1
	ld [wc904], a
	jr asm_2e296

Func_2e2f1: ; 2e2f1 (b:62f1)
	ld a, [wc904]
	cp $3
	jr nz, .asm_2e337
	ld a, [wc906]
	cp $23
	jr nz, .asm_2e337
	ld a, [wc954]
	ld c, a
	ld a, b
	cp $ff
	jr z, .asm_2e312
	cp $f8
	jr z, .asm_2e32e
	cp $8
	jr z, .asm_2e320
	jr .asm_2e337

IF DEF(POWER)
x = 0
ELSE
x = 1
ENDC

.asm_2e312
	ld a, c
	cp x
	jr nz, .asm_2e335
	ld a, x + 1
	ld [wc954], a
	ld a, $0
	ld b, a
	ret
x = x ^ 1

.asm_2e320
	ld a, c
	cp x
	jr nz, .asm_2e335
	ld a, x + 1
	ld [wc954], a
	ld a, $0
	ld b, a
	ret

.asm_2e32e
	ld a, c
	cp $2
	jr nz, .asm_2e335
	jr .asm_2e337

.asm_2e335
	ld b, $0
.asm_2e337
	ld a, $0
	ld [wc954], a
	ld a, b
	ret

Func_2e33e: ; 2e33e (b:633e)
	ld a, [wc958]
	or a
	ret nz
	ld bc, EVENT_210
	call CheckEventFlag
	ret nz
	ld a, [wc917]
	ld b, a
	ld a, [wc904]
	cp $2e
	jr nz, .asm_2e359
	ld a, $33
	jr .asm_2e3bb

.asm_2e359
	ld hl, Data_2e3c8
	ld a, [wc905]
	cp $6
	jr nz, .asm_2e370
	ld c, a
	ld a, [wc906]
	cp $10
	jr nc, .asm_2e36f
	ld a, $24
	jr .asm_2e3bb

.asm_2e36f
	ld a, c
.asm_2e370
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp $3
	jr nz, .asm_2e3bb
	push bc
	callba Func_a8539
	ld a, c
	cp $5
	jr nz, .asm_2e38d
	ld a, $6
	jr .asm_2e3ba

.asm_2e38d
	cp $6
	jr nz, .asm_2e395
	ld a, $5
	jr .asm_2e3ba

.asm_2e395
	cp $3
	jr nz, .asm_2e39d
	ld a, $7
	jr .asm_2e3ba

.asm_2e39d
	cp $b
	jr nz, .asm_2e3a5
	ld a, $8
	jr .asm_2e3ba

.asm_2e3a5
	cp $e
	jr nz, .asm_2e3b8
	ld a, [wc904]
	cp $6
	jr z, .asm_2e3b4
	ld a, $b
	jr .asm_2e3ba

.asm_2e3b4
	ld a, $2a
	jr .asm_2e3ba

.asm_2e3b8
	ld a, $3
.asm_2e3ba
	pop bc
.asm_2e3bb
	cp b
	jr z, .asm_2e3c7
	ld [wc917], a
	call GetMusicBank
	ld [H_MusicID], a
.asm_2e3c7
	ret

Data_2e3c8:
	db $03, $03, $03, $0a
	db $03, $09, $33, $09
	db $08, $04, $0b, $0b
	db $33, $33, $23, $0a
	db $0a, $05, $06, $07

Func_2e3dc: ; 2e3dc (b:63dc)
	ld hl, Data_2e3ee
	ld a, [wc905]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld b, $0
	jp DecompressGFXByIndex_

Data_2e3ee:
	db $20
	db $20
	db $21
	db $22
	db $21
	db $23
	db $24
	db $25
	db $26
	db $27
	db $28
	db $28
	db $29
	db $2a
	db $2b
	db $2c
	db $22

Func_2e3ff: ; 2e3ff (b:63ff)
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	ld hl, Data_2e455
	ld a, [wc905]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld c, [hl]
	ld b, $0
	call GetCGB_OBLayout_
	callba Func_30741
	ld a, [wc905]
	cp $6
.asm_2e422
	jr z, .asm_2e437
	ld a, [wcdba]
	ld c, a
	ld a, [wcdbb]
	ld b, a
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	ld a, $3
	call Func_1196
.asm_2e437
	ld a, [wc905]
	cp $2
	ret nc
	ld a, [wc93b]
	ld hl, $280
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, h
	ld c, l
	ld a, BANK(Func_2e3ff)
	ld [wPrevROMBank], a
	xor a
	call Func_1196
	ret

Data_2e455:
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00
	db $00

Func_2e466: ; 2e466 (b:6466)
	ld hl, Data_2e49e
	ld a, [wc905]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld c, a
	cp $40
	jr nz, .asm_2e47e
	ld a, [wc93b]
	add $50
	ld c, a
.asm_2e47e
	ld a, BANK(Func_2e466)
	ld [wPrevROMBank], a
	ld b, $0
	call GetCGB_BGLayout_
	jp Func_2e48b

Func_2e48b: ; 2e48b (b:648b)
	ld b, $7
Func_2e48d: ; 2e48d (b:648d)
	push bc
	ld a, [wcdb3]
	ld c, a
	ld b, $0
	ld hl, $328
	add hl, bc
	ld b, h
	ld c, l
	pop af
	jp Func_10ee

Data_2e49e:
	db $40, $40, $40, $43
	db $40, $42, $47, $44
	db $45, $46, $48, $48
	db $49, $4a, $4b, $45
	db $43, $4d, $4e, $4f

Func_2e4b2: ; 2e4b2 (b:64b2)
	ld a, [wSubroutine]
	cp $4
	jr c, .asm_2e4ec
	cp $16
	jr nc, .asm_2e4ec
	ld a, [hJoyLast]
	and $f3
	jr z, .asm_2e4d3
	ld a, [wc91a]
	cp $c7
	jr c, .asm_2e4cd
	call Func_2e526
.asm_2e4cd
	ld a, $0
	ld [wc91a], a
	ret

.asm_2e4d3
	ld a, [wc984]
	and $3
	jr nz, .asm_2e4ec
	ld a, [wc91a]
	inc a
	cp $c8
	jr c, .asm_2e4e9
	jr nz, .asm_2e4ec
	call Func_2e4ed
	ld a, $c8
.asm_2e4e9
	ld [wc91a], a
.asm_2e4ec
	ret

Func_2e4ed: ; 2e4ed (b:64ed)
	ld a, BANK(Func_2e4ed)
	ld [wPrevROMBank], a
	ld bc, $1da
	ld d, $7
	ld a, [wSubroutine]
	cp $24
	jr c, .asm_2e504
	cp $28
	jr nc, .asm_2e504
	ld d, $5
.asm_2e504
	cp $19
	jr c, .asm_2e50c
	cp $24
	jr c, .asm_2e516
.asm_2e50c
	ld a, d
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e516
	ld a, $0
	call Func_10ee
	ld a, $1
	call Func_10ee
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_2e526: ; 2e526 (b:6526)
	ld a, BANK(Func_2e526)
	ld [wPrevROMBank], a
	ld a, [wSubroutine]
	cp $24
	jr c, .asm_2e536
	cp $29
	jr c, .asm_2e557
.asm_2e536
	cp $19
	jr c, .asm_2e53e
	cp $24
	jr c, .asm_2e547
.asm_2e53e
	call Func_2e48b
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e547
	ld b, $0
	call Func_2e48d
	ld b, $1
	call Func_2e48d
	ld a, $1
	ld [wBGPalUpdate], a
	ret

.asm_2e557
	ld b, $5
	call Func_2e48d
	ld a, $1
	ld [wBGPalUpdate], a
	ret

Func_2e562: ; 2e562 (b:6562)
	ret

Func_2e563:
	check_cgb
	ret nz
	push hl
	ld hl, rKEY1
	ld a, b
	or a
	jr nz, .asm_2e57d
	di
	bit 7, [hl]
	jr z, .asm_2e57a
	set 0, [hl]
	stop
.asm_2e57a
	ei
	pop hl
	ret

.asm_2e57d
	di
	bit 7, [hl]
	jr nz, .asm_2e586
	set 0, [hl]
	stop
.asm_2e586
	ei
	pop hl
	ret

Func_2e589: ; 2e589 (b:6589)
	ld a, [wSubroutine]
	ld b, a
	ld hl, Pointers_2e5a1
	add a
	add b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld [wPrevROMBank], a
	ld b, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ret

Pointers_2e5a1:
	dbw $0e, Func_2134
	dbw $0e, Func_231e
	dbw $0e, Func_2329
	dbw $0e, Func_2353
	dbw $0e, Func_236c
	dbw $0e, Func_242b
	dbw $0e, Func_2465
	dbw $0e, Func_24ad
	dba Func_2dfaf
	dbw $0e, Func_2503
	dbw $0e, Func_21db
	dbw $0e, Func_2122
	dba Func_a8000
	dba Func_a8046
	dba Func_a8200
	dba Func_a8210
	dba Func_a8210
	dba Func_a8368
	dba Func_a87e4
	dba Func_a87e7
	dba Func_a8981
	dba Func_a8991
	dba Func_a89cb
	dbw $0e, Func_24c9
	dbw $0e, Func_24d8
	dba Func_a89dd
	dba Func_a89e5
	dba Func_a8e7e
	dba Func_a8ea3
	dba Func_a91a3
	dba Func_a9223
	dba Func_a91dc
	dba Func_a9377
	dba Func_a93cf
	dba Func_a98bf
	dba Func_a99f5
	dba Func_a5569
	dba Func_a5572
	dba Func_a56c2
	dba Func_a56cd
	dba Func_a572c
	dba Func_a5814
	dba Func_a5822
	dba Func_a593b
	dba Func_a594b
	dba Func_a5d17
	dba Func_c9b17
	dba Func_c9b01
	dba Func_3a0f4
	dba Func_3a0fd
	dba Func_3a175
	dba Func_3a1bc
	dba Func_3a696
	dba Func_a837a
	dba Func_a5efd
	dba Func_a5f06
	dba Func_a5f78
	dba Func_a5f82
	dba Func_a5f9b

ItemNames:
	db "ファイアーガン$"
	db "ガン$$$$$$"
	db "リボルバーガン$"
	db "バズーカ$$$$"
	db "マシンガン$$$"
	db "ミサイル$$$$"
	db "ボム$$$$$$"
	db "ガトリングガン$"
	db "サーベル$$$$"
	db "ドリル$$$$$"
	db "ジェットエンジン"
	db "プロぺラエンジン"
	db "シュリケン$$$"
	db "でんち$$$$$"
	db "アーチェリー$$"
	db "レンジ$$$$$"
	db "アイロン$$$$"
	db "ミキサー$$$$"
	db "でんわ$$$$$"
	db "アンテナ$$$$"
	db "スパナ$$$$$"
	db "ノコギリ$$$$"
	db "チェーンソー$$"
	db "ビームガン$$$"
	db "アックス$$$$"
	db "ドライバー$$$"
	db "ネジ$$$$$$"
	db "ゼンマイ$$$$"
	db "ギア$$$$$$"
	db "テレカ$$$$$"
	db "ランス$$$$$"
	db "クレーン$$$$"
	db "アーミーナイフ$"
	db "カマ$$$$$$"
	db "コンピュータ$$"
	db "モバイル$$$$"
	db "ハンマー$$$$"
	db "ちゅうしゃき$$"
	db "カメラ$$$$$"
	db "ビデオ$$$$$"
	db "フライパン$$$"
	db "えんぴつ$$$$"
	db "タイヤ$$$$$"
	db "ボンベ$$$$$"
	db "じゃぐち$$$$"
	db "バケツ$$$$$"
	db "そうじき$$$$"
	db "マウス$$$$$"
	db "カギ$$$$$$"
	db "ゲームマシン$$"
	db "ぬいぐるみ$$$"
	db "ボンボン$$$$"
	db "キックボード$$"
	db "チタリウム$$$"
	db "ルナチウム$$$"
	db "ガイアモンド$$"
	db "ラウンドメタル$"
	db "タイタニュウム$"
	db "かいぞうしよう1"
	db "かいぞうしよう2"
	db "かいぞうしよう3"
	db "じっけんしよう1"
	db "じっけんしよう2"
	db "じっけんしよう3"
	db "バイオレント3$"
	db "グラップライト9"
	db "ギガイア00$$"
	db "アイテム し$$"

ItemPrices:
	dw 130
	dw 80
	dw 100
	dw 140
	dw 120
	dw 500
	dw 50
	dw 180
	dw 35
	dw 30
	dw 700
	dw 480
	dw 10
	dw 15
	dw 65
	dw 90
	dw 50
	dw 55
	dw 60
	dw 80
	dw 20
	dw 60
	dw 110
	dw 350
	dw 90
	dw 5
	dw 3
	dw 8
	dw 13
	dw 50
	dw 100
	dw 400
	dw 120
	dw 50
	dw 200
	dw 220
	dw 34
	dw 50
	dw 250
	dw 140
	dw 30
	dw 5
	dw 100
	dw 120
	dw 30
	dw 30
	dw 60
	dw 20
	dw 10
	dw 40
	dw 30
	dw 10
	dw 5000
	dw 800
	dw 900
	dw 1000
	dw 1200
	dw 1200
	dw 150
	dw 200
	dw 500
	dw 200
	dw 300
	dw 800
	dw 1000
	dw 2000
	dw 3000
	dw 500

Data_2e8fa::
INCLUDE "text/unknown_2e8fa.asm"

SECTION "bank 0C", ROMX, BANK [$c]
Func_30000:
	call Func_307a4
	call Func_30784
	jp Func_30009

Func_30009: ; 30009 (c:4009)
	ld hl, wc4a0
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3007c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	ld a, [wSubroutine]
	cp $4
	jr nz, .asm_3007a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $8
	jr z, .asm_3007a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $83
	jr c, .asm_3005e
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
	ret

.asm_3005e
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $3
	ld [hl], a
	push hl
	ld bc, EVENT_1C3
	call CheckEventFlag
	pop hl
	jr z, .asm_3007a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $2
	ld [hl], a
.asm_3007a
	ret

._hl_: ; 3007b (c:407b)
	jp [hl]

Pointers_3007c:
	dw Func_30090
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_3033a
	dw Func_305e4
	dw Func_30528
	dw Func_30575
	dw Func_3059f

Func_30090:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $0
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $14
	ld [hl], a
	ld a, [wc9f4]
	ld [wca50], a
	cp $9
	jr c, .asm_300cf
	xor a
	ld [wca50], a
.asm_300cf
	ld de, Data_301bf
.asm_300d1
	cp $0
	jr z, .asm_300d9
	ld de, Data_301c1
.asm_300d9
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld b, a
	inc de
	ld a, [wPlayerXCoord]
	add b
	ld [hli], a
	ld a, [de]
	ld b, a
	ld a, [wPlayerYCoord]
	add b
	ld [hli], a
	ld a, [wc900]
	cp $2
	jr nz, .asm_300fe
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $80
	ld [hl], a
.asm_300fe
	call Func_302a8
	ld a, [wc900]
	cp $8
	jp nz, Func_30240
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wc98c]
	cpl
	inc a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wc98d]
	cpl
	inc a
	ld b, a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wc98c]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wc928]
	ld [hl], a
	ld a, [wc929]
	sub $a
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, b
	ld [hl], a
	ld a, b
	call Func_33846
	ld a, [wcdb9]
	ld b, a
	ld a, [wc912]
	ld [wcdb9], a
	ld a, b
	ld [wc912], a
	ld [wd409], a
	ld a, BANK(Func_30090)
	ld [wPrevROMBank], a
	call GetDenjuuSprite_
	ld a, [wd409]
	ld [wc9db], a
	ld a, $b
	ld [wc49a], a
	ld a, $a8
	ld [wc493], a
	call Func_30240
	jp Func_30741

Data_301bf:
	db -2, -10

Data_301c1:
	db  2,  10

Func_301c3:
	ld hl, wCurObjectStruct
	ld a, wc4a0 % $100
	ld [hli], a
	ld a, wc4a0 / $100
	ld [hl], a
	ld a, [wc494]
	cp $3
	jr z, .asm_30207
	cp $2
	jr z, .asm_3021d
	cp $0
	jr z, .asm_301f1
	ld a, $3
	ld [wca50], a
	ld a, [wPlayerXCoord]
	ld [wPartnerDenjuuXCoord], a
	ld a, [wPlayerYCoord]
	add $ed
	ld a, a
	ld [wPartnerDenjuuYCoord], a
	jr .asm_30231

.asm_301f1
	ld a, $0
	ld [wca50], a
	ld a, [wPlayerXCoord]
	ld [wPartnerDenjuuXCoord], a
	ld a, [wPlayerYCoord]
	add $13
	ld a, a
	ld [wPartnerDenjuuYCoord], a
	jr .asm_30231

.asm_30207
	ld a, $6
	ld [wca50], a
	ld a, [wPlayerYCoord]
	ld [wPartnerDenjuuYCoord], a
	ld a, [wPlayerXCoord]
	add $13
	ld a, a
	ld [wPartnerDenjuuXCoord], a
	jr .asm_30231

.asm_3021d
	ld a, $6
	ld [wca50], a
	ld a, [wPlayerYCoord]
	ld [wPartnerDenjuuYCoord], a
	ld a, [wPlayerXCoord]
	add $ed
	ld a, a
	ld [wPartnerDenjuuXCoord], a
.asm_30231
	ld a, [wc482]
	add $2
	xor $1
	ld [wc4a2], a
	call Func_302a8
	jr Func_30240

Func_30240: ; 30240 (c:4240)
	ld hl, wc4a0
	ld a, $ff
	ld [wca51], a
	call Func_3024f
	call Func_320b
	ret

Func_3024f: ; 3024f (c:424f)
	ld a, [wca51]
	ld b, a
	ld a, [wca50]
	cp b
	jr z, .asm_302a2
	ld [wca51], a
	push af
	ld a, [wc9db]
	ld c, $0
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
	cp 28
	jr c, .got_sprite_bank
	inc c
	sub 28
.got_sprite_bank
	ld b, a
	ld a, SPRITES_01
	add c
	ld [wca62], a
	ld a, b
	ld d, $0
	ld e, a
	ld bc, $24 tiles
	call Multiply_DE_by_BC
	ld hl, OverworldSprite001
	add hl, de
	pop af
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld a, l
	ld [wca63], a
	ld a, h
	ld [wca64], a
	ret

.asm_302a2
	ld a, $0
	ld [wca64], a
	ret

Func_302a8: ; 302a8 (c:42a8)
	ld hl, wc4a0
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wc947]
	or a
	jr z, .asm_302c3
	ld a, [wc948]
	ld [hl], a
.asm_302c3
	ld a, [hl]
	cp $e0
	jr c, .asm_302c9
	xor a
.asm_302c9
	ld c, a
	ld a, [wPlayerXCoord]
	ld e, a
	ld hl, wc990
	call Func_30326
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wc947]
	or a
	jr z, .asm_302e8
	ld a, [wc949]
	ld [hl], a
.asm_302e8
	ld a, [hl]
	cp $e0
	jr c, .asm_302ee
	xor a
.asm_302ee
	ld c, a
	ld a, [wPlayerYCoord]
	ld e, a
	ld hl, wc9a0
	call Func_30326
	ld a, [wc947]
	or a
	jr z, .asm_30315
	ld a, [wc94a]
	and $7f
	ld [wca50], a
	ld b, $2
	ld a, [wc94a]
	and $80
	jr z, .asm_30311
	inc b
.asm_30311
	ld a, b
	ld [wc4a2], a
.asm_30315
	ld hl, wc9b0
	ld a, $0
	call Func_2f76
	ld hl, wc4a0
	ld a, $0
	ld [wc947], a
	ret

Func_30326: ; 30326 (c:4326)
	ld b, $0
.asm_30328
	push bc
	push de
	push hl
	call Func_3006
	ld a, l
	pop hl
	ld [hli], a
	pop de
	pop bc
	inc b
	ld a, b
	cp $10
	jr nz, .asm_30328
	ret

Func_3033a: ; 3033a (c:433a)
	ld a, [wc904]
	cp $b
	jr nz, .asm_30349
	ld a, [wc906]
	cp $10
	jr nc, .asm_30349
	ret

.asm_30349
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jp nz, Func_303e8
	ld a, [wc919]
	or a
	jp z, Func_303e8
	ld a, [wTakingAStep]
	or a
	jp z, Func_303e8
	ld hl, wc990
	ld a, [hl]
	push af
	ld de, wc991
	ld b, $f
.asm_3036c
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_3036c
	ld a, [wPlayerXCoord]
	ld [hl], a
	ld hl, wc9a0
	ld a, [hl]
	push af
	ld de, wc9a1
	ld b, $f
.asm_30380
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_30380
	ld a, [wPlayerYCoord]
	ld [hl], a
	ld hl, wc9b0
	ld de, wc9b1
	ld a, [hl]
	push af
	ld b, $f
.asm_30394
	ld a, [de]
	inc de
	ld [hli], a
	dec b
	jr nz, .asm_30394
	ld a, [hJoyLast]
	ld b, a
	ld a, [wOverworldMapEnd]
	or a
	jr nz, .asm_303a7
	ld a, b
	and $fd
	ld b, a
.asm_303a7
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld b, [hl]
	pop af
	ld c, a
	ld [hl], a
	ld b, a
	and $f0
	cp $10
	jr z, asm_3041c
	cp $20
	jr z, asm_30421
	cp $40
	jr z, asm_30426
	cp $80
	jr z, asm_3042b
	cp $50
	jr z, asm_30430
	cp $60
	jr z, asm_30435
	cp $90
	jr z, asm_3043a
	cp $a0
	jr z, asm_3043f
Func_303d9: ; 303d9 (c:43d9)
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop af
	ld c, a
	pop af
	ld [hli], a
	ld [hl], c
Func_303e8: ; 303e8 (c:43e8)
	ld a, [wc98e]
	or a
	jr nz, .asm_30411
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	ld d, a
	ld a, b
	cp $a
	jr nc, .asm_30410
	ld a, c
	cp $8
	jr nc, .asm_30410
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, d
	ld [hl], a
.asm_30410
	ret

.asm_30411
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, [wc9ef]
	ld [hl], a
	ret

asm_3041c
	ld hl, Data_30487
	jr asm_30444

asm_30421
	ld hl, Data_3048b
	jr asm_30444

asm_30426
	ld hl, Data_3048f
	jr asm_30444

asm_3042b
	ld hl, Data_30493
	jr asm_30444

asm_30430
	ld hl, Data_30487
	jr asm_30444

asm_30435
	ld hl, Data_3048b
	jr asm_30444

asm_3043a
	ld hl, Data_30487
	jr asm_30444

asm_3043f
	ld hl, Data_3048b
	jr asm_30444

asm_30444
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, a
	srl d
	srl d
	ld a, c
	and $2
	jr nz, .asm_3045e
	srl d
.asm_3045e
	ld a, d
	and $3
	ld d, $0
	ld e, a
	pop hl
	add hl, de
	ld a, [hl]
	ld b, a
	and $7f
	ld [wca50], a
	ld c, $2
	bit 7, b
	jr z, .asm_30475
	ld c, $3
.asm_30475
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	call Func_3024f
	jp Func_303d9

Data_30487:
	db $86, $87, $86, $88
Data_3048b:
	db $06, $07, $06, $08
Data_3048f:
	db $03, $04, $03, $05
Data_30493:
	db $00, $01, $00, $02

Func_30497:
	ld hl, wc990
	ld b, $10
.asm_3049c
	ld a, [hl]
	add d
	ld [hli], a
	dec b
	jr nz, .asm_3049c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add d
	ld [hl], a
	ret

Func_304b0:
	ld hl, wc9a0
	ld b, $10
.asm_304b5
	ld a, [hl]
	add d
	ld [hli], a
	dec b
	jr nz, .asm_304b5
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add d
	ld [hl], a
	ret

Func_304c9: ; 304c9 (c:44c9)
	call Func_304d7
	ld a, [hl]
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	call Func_2c05
	ret

Func_304d7: ; 304d7 (c:44d7)
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	add $ff
	swap a
	and $f
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add $fa
	swap a
	and $f
	ld c, a
	ld hl, Data_30514
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	hlcoord 0, 0
	add hl, de
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wc9fb]
	ld d, a
	ld a, [wc9fa]
	ld e, a
	ret

Data_30514:
x = 0
REPT 10
	dw x
x = x + 10
ENDR

Func_30528: ; 30528 (c:4528)
	ld hl, wc4a0
	call Func_2acd
	call Func_308b0
	ld a, [wc4b6]
	ld b, a
	ld hl, Data_30563
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [wPartnerDenjuuYCoord]
	add [hl]
	ld [wPartnerDenjuuYCoord], a
	inc b
	ld a, b
	cp $12
	jr c, .asm_3055f
	ld a, $1
	ld [wc4ba], a
	call Func_31576
	ld hl, wCurObjectStruct
	ld a, $a0
	ld [hli], a
	ld a, $c4
	ld [hl], a
	call Func_302a8
.asm_3055f
	ld [wc4b6], a
	ret

Data_30563:
	db  -4,  -7, -10, -13, -15, -16, -17, -18, -18
	db -18, -17, -16, -15, -13, -10,  -7,  -4,   0

Func_30575: ; 30575 (c:4575)
	ld a, [wc4b6]
	ld b, a
	cp $ff
	jr z, .asm_30596
	inc b
	ld a, [wc4b5]
	inc a
	cp b
	jr c, .asm_30592
	xor a
	ld [wc4b5], a
	ld a, [wc4a0]
	xor $1
	ld [wc4a0], a
	ret

.asm_30592
	ld [wc4b5], a
	ret

.asm_30596
	ld a, [wc4a0]
	and $fe
	ld [wc4a0], a
	ret

Func_3059f: ; 3059f (c:459f)
	ld a, $10
	ld [wc4b0], a
	call Func_323ff
	ld hl, wc4a0
	jr nz, .asm_305d7
	ld b, $2
	ld a, c
	cp $9
	jr c, .asm_305b6
	sub $3
	inc b
.asm_305b6
	ld [wca50], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	call Func_3024f
	ld hl, wc4a0
	call Func_304c9
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $11
	ld l, a
	ld a, d
	ld [hl], a
.asm_305d7
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $9
	ret z
	jp Func_302a8

Func_305e4: ; 305e4 (c:45e4)
	ld hl, wc4a0
	ld a, [wc4b6]
	cp $0
	jr z, .asm_30601
	cp $1
	jr z, .asm_3063b
	cp $2
	jp z, Func_30689
	cp $3
	jp z, Func_30689
	cp $4
	jp z, Func_306fe
.asm_30601
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $6
	jr nz, .asm_30613
	ld a, $74
	ld [H_SFX_ID], a
.asm_30613
	ld hl, wc4a0
	ld a, [wc4b9]
	or $1
	ld [wc4b9], a
	ld bc, hFFF8
	call Func_2ae7
	call Func_2ac0
	call Func_308b0
	ld a, [wPartnerDenjuuYCoord]
	cp $e0
	jr c, .asm_3063a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_3063a
	ret

.asm_3063b
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $3c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	push hl
	callba GetPartnerDenjuuMaxHP
	ld a, c
	ld [wPartnerDenjuuHPRemaining], a
	pop hl
	ld a, [wcdb9]
	ld [wc912], a
	ld [wd409], a
	ld a, BANK(Func_305e4)
	ld [wPrevROMBank], a
	call GetDenjuuSprite_
	ld a, [wd409]
	ld [wc9db], a
	call Func_30741
	ld a, $1
	ld [wOBPalUpdate], a
	jp Func_30240

Func_30689: ; 30689 (c:4689)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_30696
	dec a
	ld [hl], a
	ret

.asm_30696
	ld a, [wc4b9]
	or $1
	ld [wc4b9], a
	ld bc, $8
	ld hl, wc4a0
	call Func_2ae7
	call Func_2ac0
	call Func_308b0
	ld hl, wc4a0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPartnerDenjuuYCoord]
	cp $d0
	jr nc, .asm_306fd
	cp b
	jr c, .asm_306fd
	ld a, [wc4b9]
	and $fe
	ld [wc4b9], a
	ld a, b
	ld [wPartnerDenjuuYCoord], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $8
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	call Func_31576
	ld a, $10
	ld [H_SFX_ID], a
	ld hl, wCurObjectStruct
	ld a, $a0
	ld [hli], a
	ld a, $c4
	ld [hl], a
.asm_306fd
	ret

Func_306fe: ; 306fe (c:46fe)
	ld a, [wc4b9]
	and $fe
	ld [wc4b9], a
	ld a, $1
	ld [wc900], a
	ld a, $1
	ld [wc4ba], a
	call Func_31576
	ld hl, wCurObjectStruct
	ld a, $a0
	ld [hli], a
	ld a, $c4
	ld [hl], a
	call Func_302a8
	ld a, BANK(Func_306fe)
	ld [wPrevROMBank], a
	ld a, [wc912]
	ld b, $0
	ld c, $d
	call GetOrCalcStatC_
	ld a, [wCurDenjuuStat]
	cp $3
	ret nz
	ld bc, EVENT_080
	call CheckEventFlag
	ret z
	ld bc, EVENT_1D8
	jp SetEventFlag

Func_30741: ; 30741 (c:4741)
	push bc
	push hl
	ld a, [wc912]
	ld b, a
	ld hl, Data_30778
.is_in_array
	ld a, [hli]
	cp $ff
	jr z, .not_in_array
	cp b
	jr nz, .is_in_array
	ld a, b
	cp $ac
	jr c, .less_than_ac
	add $2
.less_than_ac
	ld bc, $100
	jr .okay

.not_in_array
	ld a, [wc9db]
	ld bc, $2a0
	sub $14
.okay
	add c
	jr nc, .no_carry
	inc b
.no_carry
	ld c, a
	ld a, BANK(Func_30741)
	ld [wPrevROMBank], a
	ld a, $7
	call Func_1196
	pop hl
	pop bc
	ret

Data_30778:
	db ARAKUIDA
	db FUNGBOOST
	db GYPSOPHI
	db GONUM
	db GOLAKING
	db KANZOU
	db GENTIANA
	db YARROW
	db DOOMSDAY
	db DENDEL
	db TELETEL
	db $ff

Func_30784: ; 30784 (c:4784)
	ld b, $c
	ld hl, wOAMAnimation01_PriorityFlags
	call Func_307a9
	ld b, $1
	ld hl, wOAMAnimation13_PriorityFlags
	call Func_307a9
	ld b, $1
	ld hl, wOAMAnimation14
	jp Func_307a9

Func_3079c:
	ld b, $c
	ld hl, wOAMAnimation01_PriorityFlags
	jp Func_307a9

Func_307a4: ; 307a4 (c:47a4)
	ld b, $8
	ld hl, wOAMAnimation17
Func_307a9: ; 307a9 (c:47a9)
	ld a, [hl]
	and $2
	jr z, .asm_307e6
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	push bc
	push hl
	add $10
	ld l, a
	ld a, [hl]
	ld hl, Pointers_307f5
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	call ._hl_
	pop hl
	push hl
	ld a, [hl]
	and $2
	jr z, .asm_307e4
	call Func_308b0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30952
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_309f3
.asm_307e4
	pop hl
	pop bc
.asm_307e6
	ld a, [wSubroutine]
	cp $4
	ret nz
	ld de, $20
	add hl, de
	dec b
	jr nz, Func_307a9
	ret

._hl_
	jp [hl]

Pointers_307f5:
	dw Func_30a2f
	dw Func_30d2f
	dw Func_314b9
	dw Func_315e1
	dw Func_31874
	dw Func_319ab
	dw Func_31aba
	dw Func_31bbe
	dw Func_31c83
	dw Func_31c9c
	dw Func_31d96
	dw Func_31390
	dw Func_31429
	dw Func_31f44
	dw Func_320d8
	dw Func_3217b
	dw Func_3226b
	dw Func_3226b
	dw Func_3226b
	dw Func_3226b
	dw Func_329b6
	dw Func_3305e
	dw Func_330a1
	dw Func_3317d
	dw Func_33247
	dw Func_3333d
	dw Func_33346
	dw Func_33346
	dw Func_3334f
	dw Func_33358
	dw Func_33392
	dw Func_33361
	dw Func_33574
	dw Func_33479
	dw Func_335f4
	dw Func_336dc
	dw Func_33756
	dw Func_337b0
	dw Func_337b9

Func_30843:
	ld b, $8
	ld hl, wOAMAnimation17_Duration
	ld de, wOAMAnimation17_XCoord
.asm_3084b
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld c, a
	ld a, [wc98c]
	add c
	ld [de], a
	inc de
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	sla c
	rl a
	sla c
	rl a
	ld c, a
	ld a, [wc98d]
	add c
	ld [de], a
	ld a, $1f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $1b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_3084b
	ld b, $8
	ld hl, wOAMAnimation17 + $1b
	ld de, wOAMAnimation17_XCoord
.asm_3088b
	ld a, [de]
	ld c, a
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [de]
	ld c, a
	ld a, [hl]
	add c
	ld [de], a
	ld a, $1f
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $1f
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .asm_3088b
	ret

Func_308aa:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jr asm_308bf

Func_308b0: ; 308b0 (c:48b0)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 6, a
	jr nz, asm_30917
asm_308bf
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld c, a
	ld a, [hli]
	sla c
	rl a
	sla c
	rl a
	ld c, a
	ld a, [wc98c]
	add c
	ld [de], a
	inc de
	inc hl
	inc hl
	ld a, [hli]
	ld c, a
	ld a, [hl]
	sla c
	rl a
	sla c
	rl a
	ld c, a
	ld a, [wc98d]
	add c
	ld [de], a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [de]
	ld c, a
	ld a, [hli]
	add c
	ld [de], a
	inc de
	ld a, [de]
	ld c, a
	ld a, [hl]
	add c
	ld [de], a
asm_30917
	ret

Func_30918:
	ld b, $c
	ld hl, wOAMAnimation01
	jr asm_3092b

Func_3091f:
	ld b, $c
	ld hl, wOAMAnimation12_PriorityFlags
	jr asm_30941

Func_30926:
	ld b, $8
	ld hl, wOAMAnimation17_PriorityFlags
asm_3092b
	ld de, $20
.asm_3092e
	ld a, [hl]
	and $2
	jr z, .asm_30939
	add hl, de
	dec b
	jr nz, .asm_3092e
	xor a
	ret

.asm_30939
	ld a, b
	or a
	ret

Func_3093c:
	ld b, $8
	ld hl, wOAMAnimation24_PriorityFlags
asm_30941
	ld de, -$20
.asm_30944
	ld a, [hl]
	and $2
	jr z, .asm_3094f
	add hl, de
	dec b
	jr nz, .asm_30944
	xor a
	ret

.asm_3094f
	ld a, b
	or a
	ret

Func_30952: ; 30952 (c:4952)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 2, a
	jr nz, .asm_30961
	bit 1, a
	jr z, .asm_309a7
.asm_30961
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $a8
	jr c, .asm_30996
	cp $f8
	jr nc, .asm_30996
.asm_30970
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	bit 2, a
	jr z, .asm_3098b
	res 2, a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	or $1
	ld [hl], a
	ret

.asm_3098b
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	xor a
	ld [hl], a
	ret

.asm_30996
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_309a6
	cp $ff
	jr c, .asm_30970
.asm_309a6
	ret

.asm_309a7
	ld a, [wc98e]
	or a
	jr nz, .asm_309b7
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	set 1, a
	ld [hl], a
.asm_309b7
	ret

Func_309b8:
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	cp $a8
	jr c, .asm_309cc
	cp $f8
	jr nc, .asm_309cc
.asm_309cb
	ret

.asm_309cc
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_309dc
	cp $ff
	jr c, .asm_309cb
.asm_309dc
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	set 2, a
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	and $fe
	ld [hl], a
	ret

Func_309f3: ; 309f3 (c:49f3)
	ld a, [wc98e]
	or a
	jr z, .asm_30a08
	ld b, $81
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_30a08
	ld a, $d0
	ld [hl], a
.asm_30a08
	ret

Func_30a09:
	ld a, [wc49a]
	cp $14
	ret z
	ld a, [wPlayerYCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp b
	jr c, .asm_30a26
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	or $80
	ld [hl], a
	ret

.asm_30a26
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	and $7f
	ld [hl], a
	ret

Func_30a2f: ; 30a2f (c:4a2f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_30a48
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_30a48:
	dw Func_30a54
	dw Func_30b00
	dw Func_30b23
	dw Func_30c0a
	dw Func_30cd0
	dw Func_30cf0

Func_30a54:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	and $60
	jr z, Func_30aea
	ld d, a
	ld bc, $154
	ld a, d
	and $20
	jr nz, .asm_30aa6
	ld bc, $2a0
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	sub $14
	jr .asm_30abb

.asm_30aa6
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	inc hl
	inc hl
	inc hl
	push bc
	call Func_2ddb
	call GetFarByte
	ld a, b
	pop bc
.asm_30abb
	add c
	jr nc, .asm_30abf
	inc b
.asm_30abf
	ld c, a
	ld a, c
	ld [wcdba], a
	ld a, b
	ld [wcdbb], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, $c
	ld [wPrevROMBank], a
	ld a, $3
	call Func_1196
	ld a, [wcd20]
	or a
	jr z, Func_30aea
	ld a, $1
	ld [wOBPalUpdate], a
Func_30aea
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $1
	jp GetOverworldSprite

Func_30b00:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $50
	ld [hl], a
	call Func_30a09
Func_30b14
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_30b22
	call Func_30aea
.asm_30b22
	ret

Func_30b23:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_30b4d
	inc a
	ld [hl], a
	call Func_1fff
	call Func_30b4e
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	call Func_30b7f
	callba Func_2c89f
.asm_30b4d
	ret

Func_30b4e: ; 30b4e (c:4b4e)
	call Func_3102a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $2
	jr nc, .asm_30b6b
	ld c, $50
	cp $0
	jr z, .asm_30b64
	ld c, $60
.asm_30b64
	ld a, b
	add a
	add b
	add c
	ld b, a
	jr .asm_30b76

.asm_30b6b
	ld c, $18
	cp $b
	jr z, .asm_30b73
	ld c, $1c
.asm_30b73
	ld a, b
	add c
	ld b, a
.asm_30b76
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_30b7f: ; 30b7f (c:4b7f)
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	or a
	ret z
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	ld c, a
	push hl
	call Func_2ea0
	pop hl
	ld [hl], e
	ld a, d
	and $80
	jp nz, Func_30bc9
	ld a, [wc904]
	cp $b
	jr nz, .asm_30bc1
	ld a, [wc906]
	cp $10
	jr nc, .asm_30bc1
	ld a, [wPlayerYCoord]
	cp $48
	jr nc, .asm_30bc1
	ld a, $0
	ld [hJoyNew], a
	push bc
	ld a, $32
	ld hl, $4f04
	call FarCall_HL
	pop bc
.asm_30bc1
	ld a, $0
	ld [wc91d], a
	jp Func_33c9

Func_30bc9: ; 30bc9 (c:4bc9)
	push bc
	ld a, [wc9dd]
	ld b, a
	ld a, [wc9dc]
	ld c, a
	bit 7, b
	jr z, .asm_30be1
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc bc
	call ResetEventFlag
	jr .asm_30be4

.asm_30be1
	call SetEventFlag
.asm_30be4
	pop bc
	ld a, [wc91d]
	jp z, Func_33c9
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, $b
	ld [wc49a], a
	ld a, $2d
	ld [wc493], a
	jp Func_33c9

Func_30c0a: ; 30c0a (c:4c0a)
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_30aea
	call Func_30b14
	ret

Func_30c1d: ; 30c1d (c:4c1d)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wd407]
	or a
	jr nz, .asm_30c53
	ld a, [wc9dd]
	ld b, a
	ld a, [wc9dc]
	ld c, a
	bit 7, b
	jr z, .asm_30c3e
	cpl
	ld c, a
	ld a, b
	cpl
	ld b, a
	inc bc
	call SetEventFlag
	jr .asm_30c41

.asm_30c3e
	call ResetEventFlag
.asm_30c41
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld [hl], $0
	ret

.asm_30c53
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $4
	ret c
	jr nz, asm_30ca2
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	or a
	jp z, Func_30c9b
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	or a
	jr z, Func_30c9b
	ld c, a
	call Func_2f0a
	ld a, b
	cp $ff
	jr z, Func_30c9b
	ld a, [wCurObjectStruct]
	add $1d
	ld l, a
	ld a, [hl]
	ld c, a
	call Func_2ea0
	ld a, $0
	ld [wc91d], a
	jp Func_33c9

Func_30c9b: ; 30c9b (c:4c9b)
	ld b, $0
	ld c, $9f
	jp Func_33c9

asm_30ca2
	cp $50
	jr c, .asm_30cad
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_30cad
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	push af
	push hl
	call Func_3259b
	pop hl
	pop bc
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or b
	ld [hl], a
	ret

Func_30cd0: ; 30cd0 (c:4cd0)
	call Func_325e4
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $4
	jr z, .asm_30cef
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
.asm_30cef
	ret

Func_30cf0: ; 30cf0 (c:4cf0)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_30d13
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
.asm_30d13
	ret

Func_30d14:
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	ld a, [wPlayerXCoord]
	ld b, a
	ld a, [wPlayerYCoord]
	ld c, a
	jp Func_3094

Func_30d2f: ; 30d2f (c:4d2f)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_30d48
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_30d48:
	dw Func_30d54
	dw Func_30d89
	dw Func_30b23
	dw Func_30dac
	dw Func_30cd0
	dw Func_30cf0

Func_30d54:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $60
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
Func_30d73: ; 30d73 (c:4d73)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $2
	jp GetOverworldSprite

Func_30d89:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $60
	ld [hl], a
	call Func_30a09
Func_30d9d: ; 30d9d (c:4d9d)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_30dab
	call Func_30d73
.asm_30dab
	ret

Func_30dac:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_30d73
	call Func_30d9d
	ret

Func_30dbf: ; 30dbf (c:4dbf)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jp z, Func_30ece
	ld a, [wcd00]
	or a
	jp nz, Func_30ece
	ld a, [wcd10]
	or a
	jp nz, Func_30ece
	ld a, [wc900]
	cp $1
	jp nz, Func_30ece
	ld a, [wc98e]
	or a
	jp nz, Func_30ece
	ld a, [wc49a]
	cp $0
	jp nz, Func_30ece
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_30e06
	ld a, [hJoyNew]
	and $1
	jp z, Func_30ece
.asm_30e06
	call Func_30d14
	ld d, a
	ld e, $1a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr z, .asm_30e1b
	ld e, $28
	jr .asm_30e33

.asm_30e1b
	ld bc, EVENT_C39
	call CheckEventFlag
	jr nz, .asm_30e33
	ld a, [wc904]
	cp $b
	jr nz, .asm_30e33
	ld a, [wc906]
	cp $10
	jr nc, .asm_30e33
	ld e, $26
.asm_30e33
	ld a, d
	cp e
	jp nc, Func_30ece
	ld a, e
	cp $28
	jr z, .asm_30e52
	call Func_3102a
	ld de, Data_30efc
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wc497]
	cp b
	jr nz, Func_30ece
.asm_30e52
	call Func_1fff
	callba Func_3982c
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, $b
	ld [wc49a], a
	ld a, $8
	ld [wc493], a
	ld a, $0
	ld [hJoyNew], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $1
	jr z, .asm_30ecd
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $4
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fe
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_30b4e
	ld a, $3c
	ld [wc493], a
	ld a, $10
	ld [H_SFX_ID], a
.asm_30ecd
	ret

Func_30ece: ; 30ece (c:4ece)
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hld]
	or a
	jr nz, .asm_30edb
	ld a, [hl]
	jr .asm_30eee

.asm_30edb
	ld e, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jr z, .asm_30eea
	inc de
	inc de
.asm_30eea
	call Func_2e92
	ld a, b
.asm_30eee
	ld hl, Pointers_30f00
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Data_30efc:
	db 1, 3, 0, 2

Pointers_30f00:
	dw Func_30f0c
	dw Func_31007
	dw Func_30f4a
	dw Func_30f90
	dw Func_31074
	dw Func_31241

Func_30f0c:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_30f40
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_30f37
	ld a, b
	add a
	add b
	ld b, a
.asm_30f37
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

.asm_30f40
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $0
	ld [hl], a
	ret

Func_30f4a:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, l
	ld b, a
	ld a, [wc984]
	add b
	and $60
	jr nz, .asm_30f6f
	ld a, l
	swap a
	srl a
	srl a
	ld b, a
	ld a, [wc984]
	add b
	and $7
	jr nz, .asm_30f6f
	call Func_3154b
.asm_30f6f
	ld de, Data_30f8c
	ld a, [wc984]
	srl a
	srl a
	and $3
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Data_30f8c:
	db 0, 1, 0, 2

Func_30f90:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_30fc5
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $8
	jr c, .asm_31006
	xor a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $ba
	ld [hli], a
	ld a, $ff
	ld [hl], a
	jp .asm_31006

.asm_30fc5
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2ac0
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, [hl]
	cp c
	jr c, .asm_31006
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
.asm_31006
	ret

Func_31007:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3102a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_31021
	ld a, b
	add a
	add b
	ld b, a
.asm_31021
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_3102a: ; 3102a (c:502a)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld de, $0
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerXCoord]
	sub b
	jr c, .asm_31042
	cpl
	inc a
	inc d
.asm_31042
	ld c, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerYCoord]
	sub b
	jr c, .asm_31054
	cpl
	inc a
	inc e
.asm_31054
	or a
	jr z, .asm_3106a
	ld b, a
	ld a, c
	or a
	jr z, .asm_31060
	ld a, b
	cp c
	jr nc, .asm_3106a
.asm_31060
	ld a, e
	or a
	jr nz, .asm_31067
	ld b, $1
	ret

.asm_31067
	ld b, $0
	ret

.asm_3106a
	ld a, d
	or a
	jr nz, .asm_31071
	ld b, $2
	ret

.asm_31071
	ld b, $3
	ret

Func_31074: ; 31074 (c:5074)
	ld a, [wc98e]
	or a
	jr z, .asm_3107b
	ret

.asm_3107b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_3108c
	dec a
	ld [hl], a
	ret

.asm_3108c
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld d, [hl]
	ld e, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $80
	jr z, .asm_310a2
	inc de
	inc de
.asm_310a2
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld c, a
	call Func_2e42
	ld a, b
	inc a
	ld c, a
	and $f0
	add $8
	ld b, a
	ld a, c
	swap a
	and $f0
	ld c, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3094
	cp $3
	jr nc, .asm_310d7
	push bc
	call Func_311f1
	pop bc
.asm_310d7
	call Func_303a
	ld [wca6a], a
	ld d, a
	call Func_3068
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_310ea
	ld b, $ff
.asm_310ea
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_310f7
.asm_310f0
	sra b
	rr c
	dec a
	jr nz, .asm_310f0
.asm_310f7
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $9
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [hl]
	ld e, a
	push de
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [hl]
	ld e, a
	push de
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wca6a]
	ld d, a
	call Func_3058
	ld b, $0
	ld c, a
	bit 7, a
	jr z, .asm_31134
	ld b, $ff
.asm_31134
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_31141
.asm_3113a
	sra b
	rr c
	dec a
	jr nz, .asm_3113a
.asm_31141
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2af4
	call Func_308b0
	call Func_3133d
	jr nz, .asm_31157
	call Func_31376
.asm_31157
	pop bc
	pop de
	jr z, .asm_31187
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, e
	ld [hli], a
	ld a, d
	ld [hli], a
	inc hl
	inc hl
	ld a, c
	ld [hli], a
	ld [hl], b
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31190
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
	call Func_311f1
.asm_31187
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31190
	ld a, [wca6a]
	add $10
	and $7f
	swap a
	srl a
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	add a
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	ld c, a
	ld a, [wCustomSpriteDest + 1]
	or a
	jr z, .asm_311c2
.asm_311bd
	srl c
	dec a
	jr nz, .asm_311bd
.asm_311c2
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	ret nz
	ld a, c
	and $3
	ld de, Data_3123d
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld c, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_311e5
	ld c, $0
.asm_311e5
	ld a, c
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_311f1: ; 311f1 (c:51f1)
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_31219
	ld a, [wSpriteDestIsCustom]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCustomSpriteDest]
	ld b, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	cp b
	jr c, .asm_31217
	xor a
.asm_31217
	ld [hl], a
	ret

.asm_31219
	ld a, [wSpriteDestIsCustom]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCustomSpriteDest]
	ld b, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	cp $ff
	jr nz, .asm_31237
	ld a, b
	dec a
.asm_31237
	ld [hl], a
	ret

Data_31239:
	db 3, 0, 2, 1

Data_3123d:
	db 0, 1, 0, 2

Func_31241: ; 31241 (c:5241)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	or a
	jr nz, .asm_312b8
	ld a, [wPlayerYCoord]
	cp $48
	jr c, .asm_31290
	ld a, [wPlayerXCoord]
	ld b, a
	cp $68
	jr nc, .asm_31269
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $6c
	jr c, .asm_31290
.asm_31269
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	sub b
	jr nc, .asm_31275
	cpl
	inc a
.asm_31275
	cp $4
	jr c, .asm_31290
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31299
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $1
	ld [hl], a
	ret

.asm_31290
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31299
	call Func_3102a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $b
	jr nc, .asm_312af
	ld a, b
	add a
	add b
	ld b, a
.asm_312af
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ret

.asm_312b8
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wPlayerXCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp b
	jr nc, .asm_312d8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, $9
	ld [wSpriteDestIsCustom], a
	ld bc, $40
	jr .asm_312e4

.asm_312d8
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, $6
	ld [wSpriteDestIsCustom], a
	ld bc, -$40
.asm_312e4
	call Func_2b01
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	cp $68
	jr c, .asm_3132a
	ld a, [wVBlankCounter]
	srl a
	srl a
	and $3
	ld de, Data_3123d
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wSpriteDestIsCustom]
	add b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wPlayerXCoord]
	sub b
	jr nc, .asm_31326
	cpl
	inc a
.asm_31326
	cp $4
	jr nc, .asm_31333
.asm_3132a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $0
	ld [hl], a
.asm_31333
	ret

Func_31334:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3133d
	ld c, a
	ret

Func_3133d: ; 3133d (c:533d)
	ld a, [wPlayerXCoord]
	ld d, a
	ld a, [wPlayerYCoord]
	call Func_3134f
	ret nz
	ld a, [wPartnerDenjuuXCoord]
	ld d, a
	ld a, [wPartnerDenjuuYCoord]
Func_3134f: ; 3134f (c:534f)
	add $3
	ld e, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	inc hl
	sub d
	cp $80
	jr c, .asm_31361
	cpl
	inc a
.asm_31361
	cp $d
	jr nc, .asm_31374
	ld a, [hl]
	sub e
	cp $80
	jr c, .asm_3136d
	cpl
	inc a
.asm_3136d
	cp $d
	jr nc, .asm_31374
	or $1
	ret

.asm_31374
	xor a
	ret

Func_31376: ; 31376 (c:5376)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	and $10
	cp $10
	jr z, .asm_31389
	ld a, [wCurObjectStruct + 1]
	ld h, a
	xor a
	ret

.asm_31389
	ld a, [wCurObjectStruct + 1]
	ld h, a
	or $1
	ret

Func_31390: ; 31390 (c:5390)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_313a9
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_313a9:
	dw Func_313b5
	dw Func_313f3
	dw Func_30b23
	dw Func_31416
	dw Func_30cd0
	dw Func_30cf0

Func_313b5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $18
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
Func_313dd: ; 313dd (c:53dd)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $3
	jp GetOverworldSprite

Func_313f3:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $18
	ld [hl], a
	call Func_30a09
Func_31407: ; 31407 (c:5407)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_31415
	call Func_313dd
.asm_31415
	ret

Func_31416:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_313dd
	call Func_31407
	ret

Func_31429: ; 31429 (c:5429)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Func_31442
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Func_31442:
	dw Func_3144e
	dw Func_31483
	dw Func_30b23
	dw Func_314a6
	dw Func_30cd0
	dw Func_30cf0

Func_3144e:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $1c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
Func_3146d: ; 3146d (c:546d)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, $4
	jp GetOverworldSprite

Func_31483:
	call Func_30dbf
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	or $1c
	ld [hl], a
	call Func_30a09
Func_31497: ; 31497 (c:5497)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_314a5
	call Func_3146d
.asm_314a5
	ret

Func_314a6:
	call Func_30c1d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	cp $1
	jp z, Func_3146d
	call Func_31497
	ret

Func_314b9: ; 314b9 (c:54b9)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_314d2
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_314d2:
	dw Func_314d6
	dw Func_31510

Func_314d6:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $23
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $30
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_31510:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $8
	jr c, .asm_3153d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $26
	jr c, .asm_3153d
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3153d
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -3
	call Func_2ae7
	call Func_2acd
	ret

Func_3154b: ; 3154b (c:554b)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld b, $2
	call Func_33886
	jr z, .asm_31562
	ld a, d
	ld [wCurObjectStruct + 1], a
	ld a, e
	ld [wCurObjectStruct], a
.asm_31562
	ld h, d
	ld l, e
	ret

Func_31565:
	ld h, b
	ld l, c
	ld a, [wca5e]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
	jr asm_31598

Func_31576: ; 31576 (c:5576)
	ld hl, wc4a0
	ld a, [wca5f]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
	jr asm_31598

Func_31588:
	ld hl, wc480
Func_3158b:
	ld a, [wca5e]
	cp $2
	jp z, Func_31d15
	cp $1
	jp z, Func_31a39
asm_31598
	push hl
	ld b, $2
	call Func_33886
	jr z, .asm_315d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31d76
	pop hl
	push hl
	ld b, $2
	call Func_33886
	jr z, .asm_315d7
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31d76
.asm_315d7
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_315e1: ; 315e1 (c:55e1)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_315fa
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_315fa:
	dw Func_31600
	dw Func_3162e
	dw Func_31763

Func_31600: ; 31600 (c:5600)
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $26
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_3162e: ; 3162e (c:562e)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $3
	jr nz, .asm_31650
	push af
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_31726
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct], a
	pop af
.asm_31650
	and $7
	jr nz, .asm_31683
	ld a, [hl]
	srl a
	srl a
	srl a
	sla a
	ld de, Data_31706
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	add a
	add a
	add a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [de]
	add [hl]
	ld [hli], a
	inc de
	ld a, [de]
	add [hl]
	ld [hl], a
.asm_31683
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $19
	jr nc, .asm_31690
	inc a
	ld [hl], a
.asm_31690
	ld de, wc488
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $8
.asm_3169b
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_3169b
	ld a, [wc499]
	bit 2, a
	jr z, .asm_316c3
	ld a, [wc9f4]
	cp $2d
	jr z, .asm_316b8
	cp $30
	jr z, .asm_316b8
	cp $33
	jr z, .asm_316b8
	ret

.asm_316b8
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$40
	call Func_2af4
	ret

.asm_316c3
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wc497]
	add a
	add a
	ld de, Data_316f6
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc hl
	inc hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret

Data_316f6:
	db $c0, $00
	db $c0, $ff
	db $00, $00
	db $00, $ff
	db $40, $ff
	db $c0, $ff
	db $00, $00
	db $80, $00

Data_31706:
	db $0c, $fd
	db $00, $fc
	db $f8, $fa
	db $fc, $01
	db $00, $f0
	db $00, $00
	db $00, $01
	db $00, $03

Data_31716:
	db $f4, $fd
	db $00, $fc
	db $08, $fa
	db $04, $01
	db $00, $0a
	db $00, $f1
	db $00, $f8
	db $00, $01

Func_31726: ; 31726 (c:5726)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [wc9c3]
	ld b, a
	ld a, [wc9c4]
	ld c, a
	push bc
	push hl
	callba Func_c8222
	pop hl
	ld a, d
	ld [hl], a
	call Func_252a
	pop bc
	ld a, [wc9c2]
	cp $14
	jr nz, .asm_31762
	call Func_28a9
	jr z, .asm_31762
	ld a, $c
	ld [wc49a], a
	ld a, $a8
	ld [wc495], a
.asm_31762
	ret

Func_31763:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wc98e]
	or a
	jr z, .asm_3177d
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_3177d
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_31790
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	jr .asm_31796

.asm_31790
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
.asm_31796
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld de, Data_31828
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	push bc
	call Func_304c9
	pop bc
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	sub b
	ld [hl], a
	ld a, d
	and $10
	jr nz, .asm_317e3
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	cp $19
	jr nc, .asm_317e3
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	jp Func_2acd

.asm_317e3
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_31916
	pop hl
	ld [hl], $0
	ld a, $69
	ld [H_SFX_ID], a
	ld a, [wc904]
	cp $a
	jr nc, .asm_31803
	ld a, $5e
	ld [H_SFX_ID], a
.asm_31803
	call Func_30a7
	and $3
	cp $1
	ret nz
	ld a, [wc94c]
	or a
	ret nz
	ld c, $0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
.asm_3181a
	call Func_3336a
	ld a, c
	add $15
	cp $7e
	jr z, .asm_31827
	ld c, a
	jr .asm_3181a

.asm_31827
	ret

Data_31828:
	db $0d, $0e, $0f, $10, $10, $11, $11, $11, $11
	db $11, $11, $10, $10, $0f, $0e, $0d, $0c, $0b
	db $0a, $09, $07, $06, $04, $02, $00, $fe, $fc

Func_31843: ; 31843 (c:5843)
	ld hl, wc480
	ld b, $3
	call Func_33870
	jr z, .asm_31871
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wc497]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [wc9c0]
	ld [hli], a
	ld a, [wc9c1]
	ld [hl], a
	ld b, $1
	ld a, $67
	ld [H_SFX_ID], a
	ret

.asm_31871
	ld b, $0
	ret

Func_31874: ; 31874 (c:5874)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3188d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_3188d:
	dw Func_31891
	dw Func_318c1

Func_31891:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_308aa
Func_318c1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $80
	jr c, .asm_318e1
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	jr .asm_318e7

.asm_318e1
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
.asm_318e7
	ld a, [wc98e]
	or a
	jr z, .asm_318f4
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_318f4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_31908
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31908
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $8
	call Func_2ae7
	call Func_2acd
	ret

Func_31916: ; 31916 (c:5916)
	ld b, $4
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
Func_31920: ; 31920 (c:5920)
	push hl
	push bc
	ld b, $4
	call Func_33886
	jr z, .asm_3199c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop af
	push af
	dec a
	ld c, a
	add a
	ld de, Data_319a3
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $27
	add c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [de]
	inc de
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld a, [de]
	inc de
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	pop af
	push af
	ld bc, $568
	cp $3
	jr c, .asm_31982
	ld bc, $3a8
.asm_31982
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hli]
	ld c, [hl]
	dec hl
	sra c
	rr a
	sra c
	rr a
	sra c
	rr a
	ld [hli], a
	ld [hl], c
.asm_3199c
	pop bc
	pop hl
	dec b
	jp nz, Func_31920
	ret

Data_319a3:
	db $fc, $e8
	db $04, $e8
	db $fc, $f0
	db $04, $f0

Func_319ab: ; 319ab (c:59ab)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_319c4
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_319c4:
	dw Func_319c8
	dw Func_319f6

Func_319c8:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_319f6:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $6
	jr c, .asm_31a23
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $2f
	jr c, .asm_31a23
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31a23
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_31a31:
	ld hl, wc480
	jr Func_31a39

Func_31a36:
	ld hl, wc4a0
Func_31a39: ; 31a39 (c:5a39)
	push hl
	ld b, $5
	call Func_33886
	jr z, .asm_31a90
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31a9a
	pop hl
	push hl
	ld b, $5
	call Func_33886
	jr z, .asm_31a90
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31a9a
.asm_31a90
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_31a9a: ; 31a9a (c:5a9a)
	call Func_30b6
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2ada
	ld bc, -$80
	jp Func_2af4

Func_31aba: ; 31aba (c:5aba)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31ad3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_31ad3:
	dw Func_31ad7
	dw Func_31b19

Func_31ad7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $33
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_31b19:
	ld a, $40
	ld [wOAMAnimation13 + $19], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wTakingAStep]
	or a
	jr z, .asm_31b31
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_31b31
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_31b3f
	dec a
	ld [hl], a
	jr .asm_31b64

.asm_31b3f
	call Func_31c6d
	ld a, $2
	ld [wca5e], a
	ld a, [wc9ef]
	cp $4
	jr z, .asm_31b52
	cp $9
	jr nz, .asm_31b7d
.asm_31b52
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $4
	ld [hl], a
.asm_31b64
	ld a, $1
	ld [wca5e], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	srl a
	srl a
	srl a
	and $1
	add $30
	ld b, a
	jr .asm_31b81

.asm_31b7d
	cp $3
	jr nz, .asm_31b9e
.asm_31b81
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld de, wPlayerXCoord
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ret

.asm_31b9e
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, $0
	ld [wca5e], a
	ret

Func_31bb3:
	ld hl, wc480
	ld b, $6
	call Func_338f0
	jp Func_31c7b

Func_31bbe: ; 31bbe (c:5bbe)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31bd7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_31bd7:
	dw Func_31bdb
	dw Func_31bde

Func_31bdb:
	jp Func_31ad7

Func_31bde:
	ld a, $40
	ld [wOAMAnimation14 + $19], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wTakingAStep]
	or a
	jr z, .asm_31bf6
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_31bf6
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	or a
	jr z, .asm_31c04
	dec a
	ld [hl], a
	jr .asm_31c20

.asm_31c04
	call Func_31c6d
	ld a, $2
	ld [wca5f], a
	ld a, [wc4b1]
	cp $4
	jr z, .asm_31c17
	cp $9
	jr nz, .asm_31c39
.asm_31c17
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $4
	ld [hl], a
.asm_31c20
	ld a, $1
	ld [wca5f], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	srl a
	srl a
	srl a
	and $1
	add $30
	ld b, a
	jr .asm_31c3d

.asm_31c39
	cp $3
	jr nz, .asm_31c61
.asm_31c3d
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wc4a0]
	ld [wOAMAnimation14_PriorityFlags], a
	ld de, wPartnerDenjuuXCoord
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	ld a, [wc4b9]
	and $1
	jr nz, .asm_31c66
	ret

.asm_31c61
	ld a, $0
	ld [wca5f], a
.asm_31c66
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ret

Func_31c6d: ; 31c6d (c:5c6d)
	ld b, $33
	ld a, [wc984]
	srl a
	srl a
	and $1
	add b
	ld b, a
	ret

Func_31c7b: ; 31c7b (c:5c7b)
	ld hl, wc4a0
	ld b, $7
	jp Func_338f9

Func_31c83: ; 31c83 (c:5c83)
	ret

Data_31c84:
	db $20, $00, $00, $00
	db $00, $00, $e0, $ff
	db $e0, $ff, $00, $00
	db $00, $00, $20, $00
	db $09, $00, $00, $f8
	db $f8, $00, $00, $09

Func_31c9c: ; 31c9c (c:5c9c)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31cb5
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_31cb5:
	dw Func_31cb9
	dw Func_31ce7

Func_31cb9:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $16
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_31ce7:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_31cff
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31cff
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $3
	call Func_2ae7
	call Func_2acd
	ret

Func_31d0d:
	ld hl, wc4a0
	jr Func_31d15

Func_31d12:
	ld hl, wc480
Func_31d15: ; 31d15 (c:5d15)
	push hl
	ld b, $9
	call Func_33886
	jr z, .asm_31d6c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $e8
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_31d76
	pop hl
	push hl
	ld b, $9
	call Func_33886
	jr z, .asm_31d6c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $18
	ld [hli], a
	ld a, $0
	ld [hl], a
	call Func_31d76
.asm_31d6c
	pop hl
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_31d76: ; 31d76 (c:5d76)
	call Func_30b6
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2ada
	ld bc, -$80
	jp Func_2af4

Func_31d96: ; 31d96 (c:5d96)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31daf
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_31daf:
	dw Func_31db5
	dw Func_31df2
	dw Func_31e12

Func_31db5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $2f
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, $f
	ld [H_SFX_ID], a
	ret

Func_31df2:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	call Func_304d7
	push hl
	callba Func_c8222
	pop hl
	ld a, d
	ld [hl], a
	call Func_252a
	ret

Func_31e12:
	ld hl, Data_31c84
	call Func_31e63
	ld a, [wc98e]
	or a
	jr z, .asm_31e25
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_31e25
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $20
	jr c, .asm_31e62
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	call Func_304d7
	ld a, b
	cp $a
	jr nc, .asm_31e62
	ld a, c
	cp $8
	jr nc, .asm_31e62
	ld a, [wc905]
	cp $10
	jr z, .asm_31e5c
	cp $3
	jr nz, .asm_31e56
	ld a, $39
	ld [hl], a
	jp Func_252a

.asm_31e56
	ld a, $88
	ld [hl], a
	jp Func_252a

.asm_31e5c
	ld a, $39
	ld [hl], a
	jp Func_252a

.asm_31e62
	ret

Func_31e63: ; 31e63 (c:5e63)
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	pop hl
	add a
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld b, [hl]
	ld c, a
	inc hl
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	pop hl
	ld a, [hli]
	ld b, [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_2af4

Func_31e97: ; 31e97 (c:5e97)
	call Func_30926
	ret z
	ld de, wc480
	ld b, $a
	call Func_3389c
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	xor a
	ld [hli], a
	ld a, [wc915]
	inc a
	sla a
	sla a
	ld [hli], a
	inc hl
	inc hl
	xor a
	ld [hli], a
	ld a, [wc916]
	inc a
	sla a
	sla a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wc497]
	ld [hl], a
	ld hl, Data_31f24
	call Func_31e63
	call Func_308b0
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304d7
	ld a, b
	cp $a
	jr nc, .asm_31f1b
	ld a, c
	cp $8
	jr nc, .asm_31f1b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304c9
	cp $0
	jr z, .asm_31f1b
	cp $b
	jr z, .asm_31f04
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	xor a
	ret

.asm_31f04
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_304d7
	push bc
	ld a, $9d
	ld [hl], a
	call Func_252a
	pop de
	callba Func_c830a
.asm_31f1b
	ld hl, Data_31f34
	call Func_31e63
	or $1
	ret

Data_31f24:
	db $00, $06, $00, $00
	db $00, $fe, $00, $f8
	db $00, $f6, $00, $00
	db $00, $fe, $00, $08

Data_31f34:
	db $00, $fc, $00, $00
	db $00, $00, $00, $04
	db $00, $04, $00, $00
	db $00, $00, $00, $fc

Func_31f44: ; 31f44 (c:5f44)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_31f5d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_31f5d:
	dw Func_31f65
	dw Func_31fc3
	dw Func_31ff1
	dw Func_3202b

Func_31f65:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $2
	ld bc, -$100
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $17
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, b
	ld [hl], a
	ld c, $ff
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a6f
	ld a, $1
	ld [wOBPalUpdate], a
	ret

Func_31fc3:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $18
	jr c, .asm_31ff0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $6a
	ld [H_SFX_ID], a
.asm_31ff0
	ret

Func_31ff1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$8
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $64
	jr c, .asm_3201e
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

.asm_3201e
	ld a, [wc984]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_3202b:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .asm_3205a
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ld a, BANK(Func_3202b)
	ld [wPrevROMBank], a
	ld a, $5
	ld bc, $15
	call Func_1196
	ld a, $1
	ld [wOBPalUpdate], a
	ld a, $a
	ld [H_SFX_ID], a
	ret

.asm_3205a
	cp $26
	jr nz, .asm_3206c
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	call Func_2fa0
	call Func_33bc
.asm_3206c
	ld a, [wc984]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_32079: ; 32079 (c:6079)
	cp $ff
	jr nz, .asm_320ac
	ld a, [wcd51]
	ld [wcd03], a
	ld b, a
	ld a, [wcd50]
	ld [wcd02], a
	cp $ff
	jr nz, .asm_32093
	ld a, b
	cp $ff
	jr z, .asm_320ab
.asm_32093
	ld a, $1
	ld [wcd00], a
	ld a, $0
	ld [wcd10], a
	ld a, $0
	ld [wcd01], a
	ld hl, wcd06
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_320ab
	ret

.asm_320ac
	push af
	ld hl, wc480
	ld b, $d
	call Func_33870
	jr z, .asm_320d6
	ld a, [wc9c3]
	swap a
	ld d, a
	ld a, [wc9c4]
	or d
	ld [wca67], a
	ld de, wca67
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	pop af
	ld [hl], a
	jp Func_33a62

.asm_320d6
	pop af
	ret

Func_320d8: ; 320d8 (c:60d8)
	callba Func_c903d
	ret

Func_320e1: ; 320e1 (c:60e1)
	push bc
	call Func_30918
	jp z, Func_3215b
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld [hl], $2
	pop bc
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	swap b
	ld a, b
	or c
	ld [hl], a
	ld d, h
	ld e, l
	call Func_33a62
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, $e
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, rLCDC
	call Func_2af4
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $cc
	ld [hli], a
	ld a, $ff
	ld [hl], a
	call Func_32161
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, b
	ld [hl], a
	ld a, $1
	ld [wc945], a
	ret

Func_3215b: ; 3215b (c:615b)
	pop bc
	ret

Func_3215d:
	ld a, [wCurObjectStruct + 1]
	ld h, a
Func_32161: ; 32161 (c:6161)
	call Func_30b6
	sra b
	rr c
	sra b
	rr c
	sra b
	rr c
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, c
	ld [hli], a
	ld a, b
	ld [hl], a
	ret

Func_3217b: ; 3217b (c:617b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_32194
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_32194:
	dw Func_32198
	dw Func_321e2

Func_32198:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ret

Func_321e2:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $30
	jr c, .asm_321fa
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_321fa
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $1
	call Func_2ae7
	call Func_2ac0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $4
	ld [hl], a
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld b, $3
	jr nc, .asm_32221
	ld b, $2
.asm_32221
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32228:
	ld h, d
	ld l, e
Func_3222a: ; 3222a (c:622a)
	ld b, $f
	call Func_33886
	jr z, .asm_3223c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_3223d
.asm_3223c
	ret

Func_3223d: ; 3223d (c:623d)
	call Func_30b6
	sla c
	rl b
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_2b01
	call Func_30b6
	sla c
	rl b
	ld hl, -$200
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jp Func_2af4

Func_3226b: ; 3226b (c:626b)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_32284
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_32284:
	dw Func_32294
	dw Func_323a9
	dw Func_323f1
	dw Func_3259b
	dw Func_325e4
	dw Func_32658

Data_32290:
	db $50, $60
	db $18, $1c

Func_32294:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wc98e]
	or a
	jr nz, .asm_322c3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
.asm_322c3
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_322f4
	and $3
	ld de, Data_31239
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $12
	jr nc, .asm_322ea
	ld a, b
	add a
	add b
	ld b, a
.asm_322ea
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, b
	ld [hl], a
	jr .asm_322fd

.asm_322f4
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, $0
	ld [hl], a
.asm_322fd
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	and $60
	jr z, .asm_3236e
	ld d, a
	ld bc, $100
	ld a, d
	and $20
	jr nz, .asm_3231f
	ld bc, $2a0
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	sub $14
	jr .asm_32326

.asm_3231f
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
.asm_32326
	add c
	jr nc, .asm_3232a
	inc b
.asm_3232a
	ld c, a
	ld a, c
	ld [wcdba], a
	ld a, b
	ld [wcdbb], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, .asm_32354
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $1
	ld [hl], a
.asm_32354
	ld a, $c
	ld [wPrevROMBank], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, [hl]
	call Func_1196
	ld a, [wcd20]
	or a
	jr z, .asm_3236e
	ld a, $1
	ld [wOBPalUpdate], a
.asm_3236e
	call Func_32373
	jr Func_323a9

Func_32373: ; 32373 (c:6373)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	sub $f
	ld b, a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	jp GetOverworldSprite

Func_32391: ; 32391 (c:6391)
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	sub $10
	ld de, Data_32290
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ret

Data_323a5:
	db 2, 1
	db 2, 1

Func_323a9
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jr nz, .asm_323bd
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
.asm_323bd
	call Func_30a09
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, [hl]
	ld b, a
	call Func_32391
	or b
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
Func_323d5:
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, .asm_323e3
	call Func_32373
.asm_323e3
	ret

Func_323e4:
	ld h, d
	ld l, e
	jr Func_323d5

Func_323e8:
	call Func_323ff
	ld b, $0
	jr z, .asm_323f0
	inc b
.asm_323f0
	ret

Func_323f1:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30a09
	call Func_323ff
	ret nz
	jp Func_3251e

Func_323ff: ; 323ff (c:63ff)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	inc a
	ld c, a
	and $f0
	add $8
	ld b, a
	ld a, c
	swap a
	and $f0
	ld c, a
	push bc
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3049
	pop bc
	push af
	push bc
	ld d, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_302d
	sla e
	rl d
	sla c
	rl b
	push de
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	pop bc
	call Func_2af4
	call Func_308b0
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld e, a
	pop bc
	call Func_3094
	push af
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld l, a
	pop af
	dec a
	cp l
	jr c, .asm_324b5
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld d, c
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	call Func_33846
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $df
	ld [hl], a
	call Func_324f8
	add sp, $2
	ret

.asm_324b5
	inc a
	ld [wca6a], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [wca6a]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	cp $4
	jr nc, .asm_324d3
	add sp, $2
	or $1
	ret

.asm_324d3
	pop af
	add $10
	and $7f
	swap a
	srl a
	and $3
	ld b, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $20
	jr z, .asm_324ef
	ld hl, Pointers_32573
	jr .asm_324f2

.asm_324ef
	ld hl, Pointers_3256b
.asm_324f2
	ld a, b
	call Func_3252c
	xor a
	ret

Func_324f8: ; 324f8 (c:64f8)
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, [hl]
	and $f
	ld c, $0
	cp $3
	jr c, .asm_32515
	ld c, $3
	cp $6
	jr c, .asm_32515
	ld c, $6
	cp $9
	jr c, .asm_32515
	ld c, $9
.asm_32515
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_3251e: ; 3251e (c:651e)
	call Func_32391
	or c
	ld c, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_3252c: ; 3252c (c:652c)
	add a
	ld d, $0
	ld e, a
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	push hl
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	swap a
	and $f
	jr nz, .asm_32547
	inc a
.asm_32547
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	pop hl
	swap a
	and $3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $12
	ld l, a
	ld a, c
	ld [hl], a
	ret

Pointers_3256b:
	dw Data_3257b
	dw Data_32587
	dw Data_3257f
	dw Data_32583

Pointers_32573:
	dw Data_3258b
	dw Data_32597
	dw Data_3258f
	dw Data_32593
	
Data_3257b: db $9, $a, $9, $b
Data_3257f: db $6, $7, $6, $8
Data_32583: db $3, $4, $3, $5
Data_32587: db $0, $1, $0, $2
Data_3258b: db $6, $7, $6, $8
Data_3258f: db $9, $a, $9, $b
Data_32593: db $0, $1, $0, $2
Data_32597: db $3, $4, $3, $5

Func_3259b: ; 3259b (c:659b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_323d5
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	cp $ff
	jr z, .asm_325d2
	inc b
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	cp b
	jr c, .asm_325d0
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	xor $1
	ld [hl], a
	ret

.asm_325d0
	ld [hl], a
	ret

.asm_325d2
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [hl]
	or $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ret

Func_325e4: ; 325e4 (c:65e4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2acd
	call Func_308aa
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	ld hl, Data_30563
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, c
	add [hl]
	ld c, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	inc b
	ld a, b
	cp $12
	jr c, asm_3264f
Func_3262a:
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $bf
	ld [hl], a
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	call Func_3158b
	pop hl
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ret

asm_3264f
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32658: ; 32658 (c:6658)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $fd
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	cp $0
	jr z, .asm_326b2
	cp $1
	jp z, Func_326fe
	cp $2
	jp z, Func_32734
	cp $3
	jp z, Func_32779
	cp $4
	jp z, Func_327af
	cp $5
	jp z, Func_327f4
	cp $6
	jp z, Func_32857
	cp $7
	jp z, Func_32898
	cp $8
	jp z, Func_328ae
	cp $9
	jp z, Func_328da
	cp $a
	jp z, Func_328db
	cp $b
	jp z, Func_3291b
	cp $c
	jp z, Func_32942
	cp $d
	jp z, Func_32979
.asm_326b2
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $28
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $2d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, Func_326fe
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add $a
	ld [hl], a
	ld a, $6b
	ld [H_SFX_ID], a
Func_326fe: ; 326fe (c:66fe)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_32712
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_32712
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	jr c, .asm_32733
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_32733
	ret

Func_32734: ; 32734 (c:6734)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_32778
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fc
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $13
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, $6b
	ld [H_SFX_ID], a
.asm_32778
	ret

Func_32779: ; 32779 (c:6779)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_3278d
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
.asm_3278d
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $50
	jr c, .asm_327ae
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_327ae
	ret

Func_327af: ; 327af (c:67af)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_327f3
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $2c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $3a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, $6b
	ld [H_SFX_ID], a
.asm_327f3
	ret

Func_327f4: ; 327f4 (c:67f4)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	and $1
	jr nz, .asm_32808
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
.asm_32808
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $10
	jr c, .asm_32856
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [hl]
	cp $11
	jr nz, .asm_3282d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $8
	ld [hl], a
	ret

.asm_3282d
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $c0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
.asm_32856
	ret

Func_32857: ; 32857 (c:6857)
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_3288a
	ld a, $50
	call Func_33846
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	call Func_3262a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, $b
	ld [H_SFX_ID], a
	ret

.asm_3288a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $6
	call Func_2ae7
	call Func_2acd
	ret

Func_32898: ; 32898 (c:6898)
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $1e
	jr c, .asm_328ad
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
.asm_328ad
	ret

Func_328ae: ; 328ae (c:68ae)
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	call Func_3297a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $3c
	jr c, .asm_328d9
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
.asm_328d9
	ret

Func_328da: ; 328da (c:68da)
	ret

Func_328db: ; 328db (c:68db)
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $16
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $fd
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $64
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [hl]
	add $f6
	ld [hl], a
	ret

Func_3291b: ; 3291b (c:691b)
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, rIE
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr z, .asm_3293a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ret

.asm_3293a
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ac0
	ret

Func_32942: ; 32942 (c:6942)
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $50
	jr c, .asm_3296c
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, $50
	call Func_33846
	ld a, $b
	ld [H_SFX_ID], a
	jp Func_3262a

.asm_3296c
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $a
	call Func_2ae7
	jp Func_2ac0

Func_32979: ; 32979 (c:6979)
	ret

Func_3297a: ; 3297a (c:697a)
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld d, a
	call Func_3068
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_3298d
	dec b
.asm_3298d
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	ld d, a
	call Func_3058
	ld c, d
	ld b, $0
	bit 7, c
	jr z, .asm_329ab
	dec b
.asm_329ab
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_2af4

Func_329b6: ; 329b6 (c:69b6)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_329cf
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_329cf:
	dw Func_329dd
	dw Func_32ac4
	dw Func_32bf4
	dw Func_32d1b
	dw Func_32d5a
	dw Func_32ec9
	dw Func_32ec9

Func_329dd:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld c, a
	inc c
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	add $4c
	ld b, a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld hl, Data_32ac0
	and $3
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, b
	ld [hl], a
	call Func_32a9d
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ret

Func_32a6f: ; 32a6f (c:6a6f)
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld c, a
	ld b, $0
	ld hl, $200
	add hl, bc
	ld b, h
	ld c, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, $c
	ld [wPrevROMBank], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, [hl]
	call Func_1196
	ret

Func_32a93: ; 32a93 (c:6a93)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	ret z
Func_32a9d: ; 32a9d (c:6a9d)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, a
	dec c
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	jr Func_32a6f

Data_32ac0:
	db 0, 3, 5, 6

Func_32ac4: ; 32ac4 (c:6ac4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a93
	call Func_30d14
	cp $12
	jp nc, Func_32bb1
	call Func_3102a
	ld de, Data_30efc
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	ld b, a
	ld a, [wc497]
	cp b
	jp nz, Func_32bb1
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wcade]
	or a
	jr nz, .asm_32b16
	ld a, $1
	ld [wc9d8], a
	ld a, b
	ld [wcade], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld b, a
	call Func_2ceb
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32bcd
	ld a, [wCurObjectStruct + 1]
	ld h, a
.asm_32b16
	ld a, [hJoyNew]
	and $1
	jp z, Func_32bcc
	ld a, $0
	ld [hJoyNew], a
	ld a, [wSubroutine]
	cp $4
	jp nz, Func_32bcc
	call Func_32bb1
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_3091f
	ld d, h
	ld e, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, $20
	call CopyData_8Bits
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ld a, [wc499]
	or $4
	ld [wc499], a
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
	ld a, $1
	ld [wcadb], a
	ld bc, $c39
	call SetEventFlag
	ld bc, $c3a
	call ResetEventFlag
	ld a, [wc906]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	call SetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	ld a, $67
	ld [H_SFX_ID], a
	ret

Func_32bb1: ; 32bb1 (c:6bb1)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wcade]
	or a
	jr z, .asm_32bcb
	cp b
	jr nz, .asm_32bcb
	ld a, $0
	ld [wcade], a
.asm_32bcb
	ret

Func_32bcc: ; 32bcc (c:6bcc)
	ret

Func_32bcd: ; 32bcd (c:6bcd)
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld hl, ItemPrices
	add a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(ItemPrices)
	call GetFarShort
	ld h, d
	ld l, e
	ld b, $0
	ld c, $9e
	ld d, $0
	call Func_2d10
	ld a, $0
	ld [wc9cf], a
	ret

Func_32bf4: ; 32bf4 (c:6bf4)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32a93
	call Func_32df3
	call Func_32e28
	ld bc, EVENT_C3D
	call CheckEventFlag
	jr z, .asm_32c19
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_33047
	ld bc, EVENT_C3D
	call ResetEventFlag
.asm_32c19
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	and $7
	jr nz, .asm_32c4b
	ld a, [hl]
	srl a
	srl a
	srl a
	sla a
	ld de, Data_31706
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, $8
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [de]
	add [hl]
	ld [hli], a
	inc de
	ld a, [de]
	add [hl]
	ld [hl], a
.asm_32c4b
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	cp $19
	jr nc, .asm_32c58
	inc a
	ld [hl], a
.asm_32c58
	ld de, wc488
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $8
.asm_32c63
	ld a, [de]
	ld [hli], a
	inc de
	dec b
	jr nz, .asm_32c63
	ld a, $1
	ld [wcadb], a
	ld a, [wPlayerYCoord]
	cp $4f
	jr z, .asm_32c79
	cp $50
	jr nz, .asm_32c8e
.asm_32c79
	ld a, [wc497]
	cp $3
	jr nz, .asm_32c8e
	ld a, [wPlayerXCoord]
	cp $63
	jr c, .asm_32c8e
	ld a, $0
	ld [wcadb], a
	jr .asm_32c8e

.asm_32c8e
	ld a, [wc499]
	bit 2, a
	jr z, .asm_32cb0
	ld a, [wc9f4]
	cp $2d
	jr z, .asm_32ca5
	cp $30
	jr z, .asm_32ca5
	cp $33
	jr z, .asm_32ca5
	ret

.asm_32ca5
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, -$40
	call Func_2af4
	ret

.asm_32cb0
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $3
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $c7
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	ld hl, ItemPrices
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(ItemPrices)
	call GetFarShort
	ld a, [wcadc]
	ld l, a
	ld a, [wcadd]
	ld h, a
	add hl, de
	ld a, l
	ld [wcadc], a
	ld a, h
	ld [wcadd], a
Func_32cf5:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld bc, EVENT_C3A
	call SetEventFlag
	ld a, [wc906]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	inc bc
	call SetEventFlag
	inc bc
	call SetEventFlag
	inc bc
	call SetEventFlag
	ret

Func_32d1b: ; 32d1b (c:6d1b)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, hFFF5
	call Func_2ae7
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_32d3c
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2ac0
	ret

.asm_32d3c
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $4
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $64
	ld [hli], a
	ld a, $0
	ld [hl], a
	ret

Func_32d5a: ; 32d5a (c:6d5a)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32df3
	call Func_32a93
	ld bc, EVENT_C3C
	call CheckEventFlag
	ret z
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld bc, $c3b
	call CheckEventFlag
	jr nz, .asm_32ddd
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wPlayerXCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wPlayerYCoord]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $5
	ld [hl], a
.asm_32ddd
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	call Func_32e0c
	ret

Func_32df3: ; 32df3 (c:6df3)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, $1
	or a
	jr z, .asm_32e04
.asm_32dff
	sla c
	dec a
	jr nz, .asm_32dff
.asm_32e04
	ld a, [wc946]
	or c
	ld [wc946], a
	ret

Func_32e0c: ; 32e0c (c:6e0c)
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld c, $1
	or a
	jr z, .asm_32e1d
.asm_32e18
	sla c
	dec a
	jr nz, .asm_32e18
.asm_32e1d
	ld a, c
	cpl
	ld c, a
	ld a, [wc946]
	and c
	ld [wc946], a
	ret

Func_32e28: ; 32e28 (c:6e28)
	ld a, [wc916]
	cp $3
	ret nz
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, [wc497]
	cp $1
	ret nz
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	ld a, [wc499]
	and $fb
	ld [wc499], a
	ld a, $0
	ld [wcadb], a
	ld a, $e
	ld hl, Func_26ff
	call FarCall_HL
	ld a, [wc946]
	or a
	jr z, Func_32e9c
	call Func_32cf5
	add sp, $2
	ret

Func_32e9c:
	ld bc, EVENT_C39
	call ResetEventFlag
	ld bc, EVENT_C3A
	call ResetEventFlag
	ld a, [wc906]
	ld e, a
	ld c, $6
	call Multiply_C_by_E
	ld hl, $800
	add hl, de
	push hl
	pop bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	inc bc
	call ResetEventFlag
	add sp, $2
	ret

Func_32ec9: ; 32ec9 (c:6ec9)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3013
	ld b, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	ld c, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, [hl]
	ld e, a
	call Func_3013
	ld b, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	cp $40
	jr z, .asm_32f53
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add b
	cp $40
	jr c, .asm_32f48
	ld a, $40
.asm_32f48
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	ret

.asm_32f53
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	call Func_3385b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	call Func_33846
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $bf
	ld [hl], a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [hl]
	cp $6
	jp z, Func_33018
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [hl]
	call Func_33047
	ld a, $6
	ld [H_SFX_ID], a
	call Func_2cd1
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $58
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $24
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $b
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $1f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_32e0c
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $6
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $b
	ld [hl], a
	ld a, $b
	ld [wc49a], a
	ld a, $8
	ld [wc493], a
	call Func_32e9c
	ret

Func_33018: ; 33018 (c:7018)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, $0
	ld [hl], a
	call Func_30926
	ld d, h
	ld e, l
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld b, $20
	call CopyData_8Bits
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

Func_33047: ; 33047 (c:7047)
	push hl
	ld hl, wcdbc
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	cp $63
	jr nc, .asm_33059
	inc [hl]
	pop hl
	ret

.asm_33059
	ld a, $63
	ld [hl], a
	pop hl
	ret

Func_3305e: ; 3305e (c:705e)
	callba Func_2de3f
	callba Func_c8d9b
	ret

Func_3306f: ; 3306f (c:706f)
	ld hl, ItemSpriteGFX
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld d, h
	ld e, l
	bit 7, c
	jr z, .asm_33089
	ld hl, VTilesOB tile $7c
	jr .asm_33099

.asm_33089
	ld hl, VTilesOB tile $30
	ld a, c
	swap a
	sla a
	sla a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
.asm_33099
	ld a, $2a
	ld bc, $40
	jp FarCopy2bpp_2

Func_330a1: ; 330a1 (c:70a1)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_330ba
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_330ba:
	dw Func_330be
	dw Func_330ec

Func_330be:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ret

Func_330ec:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $e
	jr c, .asm_3310d
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_3310d
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ret

Func_3311f:
	ld hl, wc480
	ld b, $16
	call Func_33886
	jr z, .asm_3317c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30a7
	ld b, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, b
	and $3f
	add $24
	ld [hl], a
	bit 0, b
	jr z, .asm_33161
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $7b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $b0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $f4
	ld [hl], a
	ret

.asm_33161
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $74
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, $f0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $c
	ld [hl], a
.asm_3317c
	ret

Func_3317d: ; 3317d (c:717d)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33196
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_33196:
	dw Func_3319a
	dw Func_331d8

Func_3319a:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $76
	ld [hl], a
Func_331d8:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	cp $40
	jr c, .asm_331f9
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

.asm_331f9
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	add $3
	ld [hl], a
	ld d, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add $3
	ld [hl], a
	ld e, a
	lb bc, $50, $44
	call Func_3020
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ret

Func_3322a:
	push de
	ld hl, wc480
	ld b, $17
	call Func_33886
	pop de
	jr z, .asm_33246
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, d
	ld [hl], a
.asm_33246
	ret

Func_33247: ; 33247 (c:7247)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33260
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_33260:
	dw Func_33264
	dw Func_332ad

Func_33264:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	ld b, a
	ld a, [wCurObjectStruct]
	add $d
	ld l, a
	ld a, b
	ld [hl], a
Func_332ad:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, [hl]
	ld d, a
	ld a, [wCurObjectStruct]
	add $13
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	srl a
	srl a
	add $2
	ld b, a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, [hl]
	add b
	ld [hl], a
	ld e, a
	lb bc, $50, $44
	call Func_3020
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, c
	ld [hl], a
	ld a, c
	cp $28
	jr c, .asm_332fc
	cp $62
	jr nc, .asm_332fc
	ld a, b
	cp $a4
	jr nc, .asm_332fc
	ret

.asm_332fc
	ld a, [wCurObjectStruct]
	ld l, a
	xor a
	ld [hl], a
	ret

Func_33303:
	ld hl, wc480
	ld b, $18
	call Func_33886
	jp z, Func_3333c
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30a7
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $72
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, $96
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $14
	ld l, a
	ld a, $10
	ld [hl], a
Func_3333c: ; 3333c (c:733c)
	ret

Func_3333d: ; 3333d (c:733d)
	callba Func_c83bc
	ret

Func_33346: ; 33346 (c:7346)
	callba Func_c8621
	ret

Func_3334f: ; 3334f (c:734f)
	callba Func_c885f
	ret

Func_33358: ; 33358 (c:7358)
	callba Func_c8f2d
	ret

Func_33361: ; 33361 (c:7361)
	callba Func_c91df
	ret

Func_3336a: ; 3336a (c:736a)
	push hl
	ld b, $1f
	push bc
	call Func_33886
	pop bc
	jr z, .asm_33390
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
.asm_33390
	pop hl
	ret

Func_33392: ; 33392 (c:7392)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_333ab
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_333ab:
	dw Func_333af
	dw Func_3342c
	dw Func_33478

Func_333af:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $35
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $13
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $a
	ld l, a
	ld a, $8
	ld [hli], a
	ld a, $0
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $e
	ld l, a
	ld a, $d0
	ld [hli], a
	ld a, $ff
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $4c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $2
	ld [hl], a
	ld a, $30
	ld c, $0
	call Func_3306f
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ret

Func_3342c:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld bc, $1
	call Func_2ae7
	call Func_2acd
	callba Func_308b0 ; same bank
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $f
	ld l, a
	ld a, [hl]
	bit 7, a
	jr nz, .asm_3346b
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, [hl]
	cp $38
	jr c, .asm_3346b
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ld a, $a
	ld [H_SFX_ID], a
	ret

.asm_3346b
	ld a, [wc984]
	and $7
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	jp Func_3222a

Func_33478:
	ret

Func_33479: ; 33479 (c:7479)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_33492
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_33492:
	dw Func_33496
	dw Func_33508

Func_33496:
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $36
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wc906]
	cp $16
	jr z, .asm_334e2
	cp $e
	jr z, .asm_334f5
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $48
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $48
	ld [hl], a
	ret

.asm_334e2
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $40
	ld [hl], a
	ret

.asm_334f5
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $50
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $5c
	ld [hl], a
	ret

Func_33508:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wc98e]
	or a
	jr z, .asm_33519
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_33519
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	inc a
	ld [hl], a
	ld d, a
	call Func_3068
	sra d
	sra d
	ld a, [wc906]
	cp $16
	jr z, .asm_33540
	cp $e
	jr z, .asm_33540
	sra d
.asm_33540
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	ld d, a
	call Func_3058
	sra d
	sra d
	sra d
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [hl]
	add d
	ld d, a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, d
	ld [hl], a
	ret

Func_33574: ; 33574 (c:7574)
	ld a, [wc906]
	cp $16
	jr nz, .asm_3358e
	ld bc, $1f4
	call CheckEventFlag
	jr nz, .asm_3358e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	ret

.asm_3358e
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, $40
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $13
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, $0
	ld [hli], a
	ld a, $10
	ld [hl], a
	ld a, [wc98e]
	or a
	ret nz
	ld a, [wCurObjectStruct]
	ld l, a
	push hl
	ld b, $8
	ld c, $0
.asm_335c7
	push bc
	ld b, $21
	call Func_33886
	jr z, .asm_335ee
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop bc
	add sp, $fe
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	pop bc
	ld a, c
	add $10
	ld c, a
	dec b
	jr nz, .asm_335c7
	pop hl
	ld [hl], $0
	ret

.asm_335ee
	add sp, $2
	pop hl
	ld [hl], $0
	ret

Func_335f4: ; 335f4 (c:75f4)
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [hl]
	add a
	ld hl, Pointers_3360d
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

Pointers_3360d:
	dw Func_33637
	dw Func_33688

Func_33611: ; 33611 (c:7611)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $8
	jr z, asm_33636
Func_3361c: ; 3361c (c:761c)
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	and $f7
	ld [hl], a
	ld de, GFX_e0320 + 4 tiles
	push hl
	ld a, BANK(GFX_e0320)
	ld hl, VTilesOB tile $7c
	ld bc, $40
	call FarCopy2bpp_2
	pop hl
asm_33636
	ret

Func_33637:
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	ld a, [wCurObjectStruct + 1]
	ld l, a
	jr z, .asm_33650
	ld [hl], $0
	ret

.asm_33650
	ld [hl], $3
	ld a, [wCurObjectStruct]
	add $1
	ld l, a
	ld a, $10
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld a, $1
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $2
	ld l, a
	ld a, $17
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $5
	ld l, a
	ld a, $5
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, $3c
	ld [hl], a
	ld bc, EVENT_C02
	call ResetEventFlag
	call Func_3361c
Func_33688:
	call Func_336bd
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [hli]
	ld c, a
	ld b, [hl]
	call CheckEventFlag
	jr z, .asm_336b9
	ld a, [wCurObjectStruct]
	add $16
	ld l, a
	ld a, [hl]
	dec a
	ld [hl], a
	jr nz, .asm_336b9
	ld bc, EVENT_C02
	call ResetEventFlag
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], $0
	call Func_336e5
	ld a, $41
	ld [H_SFX_ID], a
	ret

.asm_336b9
	call Func_33611
	ret

Func_336bd: ; 336bd (c:76bd)
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wPlayerYCoord]
	cp $48
	jr nc, .asm_336d7
	ld a, [wcd21]
	or a
	jr z, .asm_336d7
	ld a, [hl]
	and $fe
	ld [hl], a
	ret

.asm_336d7
	ld a, [hl]
	or $1
	ld [hl], a
	ret

Func_336dc: ; 336dc (c:76dc)
	callba Func_3ac86
	ret

Func_336e5: ; 336e5 (c:76e5)
	ld a, $b
	ld [wc49a], a
	ld a, $40
	ld [wc493], a
	ld b, $40
	ld c, $0
	call Func_341d
	ld b, $c
.asm_336f8
	push bc
	push hl
	ld b, $23
	call Func_33886
	jr z, .asm_3374b
	ld a, [wCurObjectStruct + 1]
	ld h, a
	call Func_30a7
	ld a, d
	and $1f
	add $50
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, b
	ld [hl], a
	call Func_30a7
	ld a, d
	and $1f
	add $18
	ld b, a
	ld a, [wCurObjectStruct]
	add $15
	ld l, a
	ld a, b
	ld [hl], a
	call Func_30b6
	sla c
	rl b
	ld a, [wCurObjectStruct]
	ld l, a
	call Func_2b01
	call Func_30b6
	sla c
	rl b
	call Func_2af4
	ld bc, rJOYP
	call Func_2af4
	pop hl
	pop bc
	dec b
	jr nz, .asm_336f8
	ret

.asm_3374b
	pop hl
	pop bc
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld a, l
	ld [wCurObjectStruct + 1], a
	ret

Func_33756: ; 33756 (c:7756)
	callba Func_c9374
	ret

Func_3375f:
	push de
	ld a, BANK(GFX_e3494)
	ld hl, VTilesOB tile $60
	ld de, GFX_e3494
	ld bc, $80
	call FarCopy2bpp_2
	pop de
	ld hl, wc480
	ld b, $10
	ld c, $0
.asm_33776
	push bc
	push de
	ld b, $24
	call Func_33886
	jr z, .asm_337ad
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	pop de
	pop bc
	add sp, $fc
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, c
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $4
	ld l, a
	ld a, e
	ld [hl], a
	pop de
	pop bc
	ld a, c
	add $10
	ld c, a
	dec b
	jr nz, .asm_33776
	ret

.asm_337ad
	add sp, $4
	ret

Func_337b0: ; 337b0 (c:77b0)
	callba Func_3a7fd
	ret

Func_337b9: ; 337b9 (c:77b9)
	callba Func_3a996
	ret

Func_337c2:
	ld a, d
	ld [wCurObjectStruct + 1], a
	ld a, e
	ld [wCurObjectStruct], a
	ld h, d
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, [hli]
	ld d, a
	ld a, [hl]
	ld e, a
	push de
	dec hl
	ld a, [hl]
	add $10
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_337f1
.asm_337e4
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $3
	ret

.asm_337f1
	ld a, [hl]
	add $e0
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_3380b
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $2
	ret

.asm_3380b
	ld a, [hl]
	add $10
	ld [hl], a
	inc hl
	ld a, [hl]
	add $f0
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_3382a
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $1
	ret

.asm_3382a
	ld a, [hl]
	add $20
	ld [hl], a
	push hl
	call Func_304c9
	pop hl
	and $10
	jr nz, .asm_33844
	pop de
	ld a, [wCurObjectStruct]
	add $3
	ld l, a
	ld a, d
	ld [hli], a
	ld [hl], e
	ld d, $0
	ret

.asm_33844
	jr .asm_337e4

Func_33846: ; 33846 (c:7846)
	ld c, a
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld b, $0
	sra c
	rr b
	sra c
	rr b
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

Func_3385b: ; 3385b (c:785b)
	ld c, a
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld b, $0
	sra c
	rr b
	sra c
	rr b
	ld a, b
	ld [hli], a
	ld [hl], c
	ret

Func_33870: ; 33870 (c:7870)
	ld a, [wc98e]
	or a
	jr nz, .asm_33883
	push hl
	push bc
	call Func_3091f
	pop bc
	pop de
	jr z, .asm_33882
	call Func_3389c
.asm_33882
	ret

.asm_33883
	ld d, h
	ld e, l
	ret

Func_33886: ; 33886 (c:7886)
	ld a, [wc98e]
	or a
	jr nz, .asm_33899
	push hl
	push bc
	call Func_30918
	pop bc
	pop de
	jr z, .asm_33898
	call Func_3389c
.asm_33898
	ret

.asm_33899
	ld d, h
	ld e, l
	ret

Func_3389c: ; 3389c (c:789c)
	push de
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	ld [hl], $2
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, b
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1a
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld [hl], $0
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, $8
	add e
	ld e, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hli], a
	inc de
	inc de
	inc de
	inc hl
	inc hl
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	pop de
	or $1
	ret

Func_338f0: ; 338f0 (c:78f0)
	ld de, wc480
	ld hl, wOAMAnimation13
	jp Func_3389c

Func_338f9: ; 338f9 (c:78f9)
	ld de, wc4a0
	ld hl, wOAMAnimation14
	call Func_3389c
	ld a, $0
	ld [$c259], a
	ret

Func_33908:
	ld a, [wc98d]
	cpl
	inc a
	sub $80
	ld [wc9e9], a
	jr asm_33942

Func_33914:
	ld a, [wc98d]
	cpl
	inc a
	add $80
	ld [wc9e9], a
	jr asm_33942

Func_33920:
	ld a, [wc98c]
	cpl
	inc a
	sub $a0
	ld [wc9e8], a
	jr asm_33936

Func_3392c:
	ld a, [wc98c]
	cpl
	inc a
	add $a0
	ld [wc9e8], a
asm_33936
	ld a, [wc98d]
	cpl
	inc a
	ld [wc9e9], a
	call Func_3394e
	ret

asm_33942
	ld a, [wc98c]
	cpl
	inc a
	ld [wc9e8], a
	call Func_3394e
	ret

Func_3394e: ; 3394e (c:794e)
	call Func_2d59
.asm_33951
	call Func_2e2b
	push de
	ld de, wca00
	ld a, [de]
	inc de
	cp $ff
	jr nz, .asm_33964
	ld a, [de]
	dec de
	cp $ff
	jr z, .asm_339ab
.asm_33964
	call Func_30926
	jr z, .asm_339a8
	ld de, wca00
	ld a, [de]
	ld b, a
	inc de
	ld a, [de]
	ld c, a
	inc de
	or b
	jr z, .asm_3398c
	bit 7, b
	jr z, .asm_33987
	ld a, b
	cpl
	ld b, a
	ld a, c
	cpl
	ld c, a
	inc bc
	call CheckEventFlag
	jr nz, .asm_339a8
	jr .asm_3398c

.asm_33987
	call CheckEventFlag
	jr z, .asm_339a8
.asm_3398c
	call Func_339ad
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
.asm_339a8
	pop de
	jr .asm_33951

.asm_339ab
	pop de
	ret

Func_339ad: ; 339ad (c:79ad)
	ld a, l
	ld [wCurObjectStruct], a
	ld a, h
	ld [wCurObjectStruct + 1], a
	xor a
	ld b, $20
	call Func_2f76
	ld a, [wCurObjectStruct]
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $1b
	ld l, a
	ld a, [wc9e8]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $1c
	ld l, a
	ld a, [wc9e9]
	ld [hl], a
	ld a, [wCurObjectStruct]
	add $10
	ld l, a
	ld a, [de]
	push af
	inc de
	and $3f
	ld [hl], a
	call Func_33a62
	push de
	call Func_308b0
	pop de
	inc de
	ld a, [wCurObjectStruct]
	add $18
	ld l, a
	ld a, [de]
	ld [hl], a
	inc de
	ld a, [wCurObjectStruct]
	add $1e
	ld l, a
	ld a, [de]
	ld [hli], a
	inc de
	ld a, [de]
	ld [hl], a
	inc de
	ld b, $3
	ld a, [de]
	and $1
	jr z, .asm_33a0a
	ld b, $7
.asm_33a0a
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [de]
	ld b, a
	pop af
	swap a
	srl a
	srl a
	and $3
	or $80
	ld c, a
	ld a, b
	and $8
	jr z, .asm_33a2b
	ld [hl], c
	jr .asm_33a2d

.asm_33a2b
	ld [hl], $0
.asm_33a2d
	ld a, [de]
	and $2
	jr z, .asm_33a3c
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $80
	ld [hl], a
.asm_33a3c
	ld a, [de]
	and $60
	jr z, .asm_33a4b
	ld b, a
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld a, [hl]
	or b
	ld [hl], a
.asm_33a4b
	ld a, [de]
	and $10
	jr z, .asm_33a5a
	ld a, [wCurObjectStruct]
	add $19
	ld l, a
	ld a, [hl]
	or $1
	ld [hl], a
.asm_33a5a
	ld a, [wc98e]
	or a
	ret z
	jp Func_309b8

Func_33a62: ; 33a62 (c:7a62)
	ld a, [wCurObjectStruct]
	add $8
	ld l, a
	ld a, [de]
	and $f0
	add $8
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hli], a
	inc hl
	inc hl
	ld a, [de]
	inc a
	swap a
	and $f0
	ld b, $0
	sra a
	rr b
	sra a
	rr b
	ld [hl], b
	inc hl
	ld [hl], a
	ret

Func_33a90: ; 33a90 (c:7a90)
	call Func_30926
	jr z, .asm_33ac3
	ld de, wca00
	call Func_339ad
	ld a, [wCurObjectStruct]
	add $c
	ld l, a
	ld a, [wCurObjectStruct + 1]
	ld h, a
	ld a, [wCurObjectStruct]
	add $a
	ld e, a
	ld a, [wCurObjectStruct + 1]
	ld d, a
	ld a, [hli]
	ld [de], a
	inc de
	ld a, [hl]
	ld [de], a
	ld b, $3
	ld a, [wCurObjectStruct]
	ld l, a
	ld [hl], b
	ld a, [wCurObjectStruct]
	add $17
	ld l, a
	ld [hl], $0
.asm_33ac3
	ret

Pointers_33ac4::
	dw Data_33c84
	dw Data_33c8a
	dw Data_33c90
	dw Data_33c96
	dw Data_33c9c
	dw Data_33ca2
	dw Data_33ca8
	dw Data_33cb2
	dw Data_33cbc
	dw Data_33cc6
	dw Data_33cd4
	dw Data_33ce2
	dw Data_33ce8
	dw Data_33cf2
	dw Data_33cf8
	dw Data_33cfe
	dw Data_33cfe
	dw Data_33d09
	dw Data_33d14
	dw Data_33d1d
	dw Data_33d24
	dw Data_33d24
	dw Data_33d2b
	dw Data_33d2b
	dw Data_33d3a
	dw Data_33d47
	dw Data_33d4c
	dw Data_33d57
	dw Data_33d57
	dw Data_33d57
	dw Data_33d57
	dw Data_33d5c
	dw Data_33d5c
	dw Data_33d5c
	dw Data_33d5c
	dw Data_33d62
	dw Data_33d62
	dw Data_33d68
	dw Data_33d68
	dw Data_33d73
	dw Data_33d88
	dw Data_33d88
	dw Data_33d93
	dw Data_33d93
	dw Data_33da0
	dw Data_33da7
	dw Data_33da7
	dw Data_33dad
	dw Data_33db3
	dw Data_33db3
	dw Data_33db3
	dw Data_33db9
	dw Data_33db9
	dw Data_33db9
	dw Data_33db9
	dw Data_33dc1
	dw Data_33dd0
	dw Data_33dd0
	dw Data_33dd0
	dw Data_33dd0
	dw Data_33dd0
	dw Data_33dd6
	dw Data_33de3
	dw Data_33deb
	dw Data_33df8
	dw Data_33df8
	dw Data_33df8
	dw Data_33e00
	dw Data_33e0d
	dw Data_33e13
	dw Data_33e19
	dw Data_33e1f
	dw Data_33e25
	dw Data_33e2b
	dw Data_33e31
	dw Data_33e31
	dw Data_33e31
	dw Data_33e31
	dw Data_33e3a
	dw Data_33e3a
	dw Data_33e3a
	dw Data_33e40
	dw Data_33e46
	dw Data_33e46
	dw Data_33e46
	dw Data_33e4c
	dw Data_33e51
	dw Data_33e59
	dw Data_33e59
	dw Data_33e6e
	dw Data_33e6e
	dw Data_33e6e
	dw Data_33e6e
	dw Data_33e85
	dw Data_33e85
	dw Data_33e8b
	dw Data_33e8b
	dw Data_33e93
	dw Data_33e93
	dw Data_33e93
	dw Data_33e93
	dw Data_33e9d
	dw Data_33eac
	dw Data_33eb2
	dw Data_33ec3
	dw Data_33ec8
	dw Data_33ec8
	dw Data_33ec8
	dw Data_33ec8
	dw Data_33ed2
	dw Data_33ed2
	dw Data_33ed8
	dw Data_33ede
	dw Data_33ef5
	dw Data_33f0c
	dw Data_33f0c
	dw Data_33f0c
	dw Data_33f12
	dw Data_33f23
	dw Data_33f29
	dw Data_33f36
	dw Data_33f36
	dw Data_33f36
	dw Data_33f36
	dw Data_33f36
	dw Data_33f36
	dw Data_33f36
	dw Data_33f3e
	dw Data_33f3e
	dw Data_33f46
	dw Data_33f46
	dw Data_33f46
	dw Data_33f46
	dw Data_33f5f
	dw Data_33f5f
	dw Data_33f67
	dw Data_33f80
	dw Data_33f80
	dw Data_33f80
	dw Data_33f80
	dw Data_33f80
	dw Data_33f80
	dw Data_33f80
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f91
	dw Data_33f98
	dw Data_33f98
	dw Data_33f98
	dw Data_33f98
	dw Data_33f9e
	dw Data_33fa4
	dw Data_33fa4
	dw Data_33fa4
	dw Data_33fa4
	dw Data_33fa4
	dw Data_33faa
	dw Data_33fb0
	dw Data_33fb0
	dw Data_33fb0
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fb9
	dw Data_33fc0
	dw Data_33fc0
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fd1
	dw Data_33fdb
	dw Data_33fe5
	dw Data_33fef
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9
	dw Data_33ff9

Data_33c84:
	db $10, $d0
	db $10, $d1
	db $fe, $00

Data_33c8a:
	db $10, $d2
	db $10, $d3
	db $fe, $00

Data_33c90:
	db $10, $11
	db $10, $12
	db $fe, $00

Data_33c96:
	db $10, $13
	db $10, $14
	db $fe, $00

Data_33c9c:
	db $10, $15
	db $10, $16
	db $fe, $00

Data_33ca2:
	db $10, $17
	db $10, $18
	db $fe, $00

Data_33ca8:
	db $10, $42
	db $10, $43
	db $08, $42
	db $08, $43
	db $fe, $00

Data_33cb2:
	db $10, $46
	db $10, $47
	db $08, $46
	db $08, $47
	db $fe, $00

Data_33cbc:
	db $10, $44
	db $10, $45
	db $08, $44
	db $08, $45
	db $fe, $00

Data_33cc6:
	db $04, $02
	db $04, $04
	db $02, $02
	db $02, $04
	db $06, $02
	db $06, $04
	db $fe, $00

Data_33cd4:
	db $04, $03
	db $04, $05
	db $02, $03
	db $02, $05
	db $06, $03
	db $06, $05
	db $fe, $00

Data_33ce2:
	db $10, $19
	db $10, $1a
	db $fe, $00

Data_33ce8:
	db $08, $33
	db $08, $34
	db $08, $33
	db $08, $35
	db $fe, $00

Data_33cf2:
	db $10, $36
	db $10, $37
	db $fe, $00

Data_33cf8:
	db $10, $d8
	db $10, $d9
	db $fe, $00

Data_33cfe:
	db $03, $00
	db $03, $01
	db $03, $02
	db $03, $03
	db $03, $04
	db $ff

Data_33d09:
	db $02, $05
	db $02, $06
	db $02, $07
	db $02, $08
	db $02, $09
	db $ff

Data_33d14:
	db $06, $0a
	db $06, $0b
	db $06, $0c
	db $06, $0d
	db $ff

Data_33d1d:
	db $06, $ce
	db $06, $cf
	db $06, $d0
	db $ff

Data_33d24:
	db $04, $cb
	db $04, $cc
	db $04, $cd
	db $ff

Data_33d2b:
	db $08, $12
	db $08, $13
	db $08, $14
	db $08, $15
	db $08, $16
	db $08, $17
	db $08, $18
	db $ff

Data_33d3a:
	db $04, $1b
	db $08, $1c
	db $04, $1b
	db $08, $1c
	db $04, $1b
	db $08, $1c
	db $ff

Data_33d47:
	db $04, $1d
	db $06, $1e
	db $ff

Data_33d4c:
	db $04, $1f
	db $04, $20
	db $04, $21
	db $04, $22
	db $04, $23
	db $ff

Data_33d57:
	db $04, $d1
	db $04, $d2
	db $ff

Data_33d5c:
	db $04, $2f
	db $04, $30
	db $fe, $00

Data_33d62:
	db $04, $32
	db $04, $33
	db $fe, $00

Data_33d68:
	db $04, $38
	db $04, $37
	db $04, $36
	db $04, $35
	db $04, $34
	db $ff

Data_33d73:
	db $04, $3e
	db $04, $3f
	db $04, $40
	db $04, $41
	db $04, $42
	db $04, $43
	db $04, $44
	db $04, $45
	db $04, $46
	db $04, $47
	db $ff

Data_33d88:
	db $04, $48
	db $04, $49
	db $04, $4a
	db $04, $4b
	db $04, $4c
	db $ff

Data_33d93:
	db $08, $51
	db $08, $53
	db $08, $51
	db $08, $53
	db $08, $51
	db $08, $53
	db $ff

Data_33da0:
	db $04, $56
	db $04, $57
	db $04, $58
	db $ff

Data_33da7:
	db $04, $59
	db $04, $5a
	db $fe, $00

Data_33dad:
	db $04, $5b
	db $04, $5c
	db $fe, $00

Data_33db3:
	db $02, $5f
	db $02, $60
	db $fe, $00

Data_33db9:
	db $04, $64
	db $04, $65
	db $04, $66
	db $fe, $00

Data_33dc1:
	db $04, $67
	db $04, $68
	db $04, $69
	db $04, $6a
	db $04, $6b
	db $04, $6c
	db $04, $6d
	db $ff

Data_33dd0:
	db $04, $89
	db $04, $8a
	db $fe, $00

Data_33dd6:
	db $04, $8b
	db $04, $8c
	db $04, $8d
	db $04, $8e
	db $04, $8f
	db $04, $90
	db $ff

Data_33de3:
	db $04, $93
	db $04, $94
	db $04, $95
	db $fe, $00

Data_33deb:
	db $04, $96
	db $04, $97
	db $04, $98
	db $04, $99
	db $04, $9a
	db $04, $9b
	db $ff

Data_33df8:
	db $04, $a8
	db $04, $a9
	db $04, $aa
	db $fe, $00

Data_33e00:
	db $04, $ab
	db $04, $ac
	db $04, $ad
	db $04, $ae
	db $04, $af
	db $04, $b0
	db $ff

Data_33e0d:
	db $02, $b1
	db $02, $b2
	db $fe, $00

Data_33e13:
	db $04, $b3
	db $04, $b4
	db $fe, $00

Data_33e19:
	db $02, $b5
	db $02, $b6
	db $fe, $00

Data_33e1f:
	db $02, $b7
	db $02, $b8
	db $fe, $00

Data_33e25:
	db $02, $b9
	db $02, $ba
	db $fe, $00

Data_33e2b:
	db $02, $bb
	db $02, $bc
	db $fe, $00

Data_33e31:
	db $04, $d6
	db $04, $d7
	db $04, $d8
	db $04, $d9
	db $ff

Data_33e3a:
	db $04, $0b
	db $04, $0c
	db $fe, $00

Data_33e40:
	db $04, $0d
	db $04, $0e
	db $fe, $00

Data_33e46:
	db $04, $14
	db $04, $15
	db $fe, $00

Data_33e4c:
	db $04, $16
	db $04, $17
	db $ff

Data_33e51:
	db $04, $18
	db $04, $19
	db $04, $1a
	db $fe, $00

Data_33e59:
	db $02, $9e
	db $02, $a0
	db $02, $a1
	db $02, $a2
	db $02, $a3
	db $02, $a4
	db $02, $a5
	db $02, $a6
	db $02, $a7
	db $02, $a8
	db $ff

Data_33e6e:
	db $02, $ad
	db $02, $ae
	db $02, $af
	db $02, $b0
	db $02, $b1
	db $02, $b2
	db $02, $b3
	db $02, $b4
	db $02, $b5
	db $02, $b6
	db $02, $b7
	db $ff

Data_33e85:
	db $04, $2c
	db $04, $2d
	db $fe, $00

Data_33e8b:
	db $04, $30
	db $04, $31
	db $04, $32
	db $fe, $00

Data_33e93:
	db $02, $38
	db $02, $39
	db $02, $3a
	db $02, $3b
	db $fe, $00

Data_33e9d:
	db $04, $3c
	db $04, $3d
	db $04, $3e
	db $04, $3f
	db $04, $40
	db $04, $41
	db $04, $42
	db $ff

Data_33eac:
	db $02, $43
	db $02, $44
	db $fe, $00

Data_33eb2:
	db $04, $45
	db $04, $46
	db $04, $47
	db $04, $48
	db $04, $49
	db $04, $4a
	db $04, $4b
	db $04, $4c
	db $ff

Data_33ec3:
	db $08, $4e
	db $08, $4f
	db $ff

Data_33ec8:
	db $04, $57
	db $04, $56
	db $04, $58
	db $04, $56
	db $fe, $00

Data_33ed2:
	db $02, $59
	db $02, $5a
	db $fe, $00

Data_33ed8:
	db $02, $5b
	db $02, $5c
	db $fe, $00

Data_33ede:
	db $04, $5f
	db $04, $60
	db $04, $61
	db $04, $62
	db $04, $63
	db $04, $69
	db $04, $68
	db $04, $67
	db $04, $66
	db $04, $65
	db $04, $64
	db $ff

Data_33ef5:
	db $04, $64
	db $04, $65
	db $04, $66
	db $04, $67
	db $04, $68
	db $04, $69
	db $04, $63
	db $04, $62
	db $04, $61
	db $04, $60
	db $04, $5f
	db $ff

Data_33f0c:
	db $04, $6e
	db $04, $6f
	db $fe, $00

Data_33f12:
	db $04, $b7
	db $04, $b8
	db $04, $b7
	db $04, $b8
	db $04, $b7
	db $04, $b8
	db $04, $b7
	db $04, $b8
	db $ff

Data_33f23:
	db $04, $71
	db $04, $72
	db $fe, $00

Data_33f29:
	db $08, $73
	db $08, $74
	db $08, $75
	db $08, $73
	db $08, $74
	db $08, $75
	db $ff

Data_33f36:
	db $08, $87
	db $08, $88
	db $08, $89
	db $fe, $00

Data_33f3e:
	db $04, $8a
	db $04, $8b
	db $04, $8c
	db $fe, $00

Data_33f46:
	db $04, $97
	db $04, $96
	db $04, $95
	db $04, $97
	db $04, $96
	db $04, $95
	db $04, $97
	db $04, $96
	db $04, $95
	db $04, $97
	db $04, $96
	db $04, $95
	db $ff

Data_33f5f:
	db $04, $98
	db $04, $99
	db $04, $9a
	db $fe, $00

Data_33f67:
	db $04, $9d
	db $04, $9c
	db $04, $9b
	db $04, $9d
	db $04, $9c
	db $04, $9b
	db $04, $9d
	db $04, $9c
	db $04, $9b
	db $04, $9d
	db $04, $9c
	db $04, $9b
	db $ff

Data_33f80:
	db $04, $05
	db $04, $06
	db $04, $07
	db $04, $08
	db $04, $09
	db $04, $0a
	db $04, $0b
	db $04, $0c
	db $ff

Data_33f91:
	db $08, $1d
	db $08, $1e
	db $08, $1f
	db $ff

Data_33f98:
	db $04, $29
	db $04, $2a
	db $fe, $00

Data_33f9e:
	db $04, $2c
	db $04, $2d
	db $fe, $00

Data_33fa4:
	db $04, $8b
	db $04, $8c
	db $fe, $00

Data_33faa:
	db $04, $8b
	db $04, $8c
	db $fe, $00

Data_33fb0:
	db $04, $45
	db $04, $46
	db $04, $47
	db $04, $48
	db $ff

Data_33fb9:
	db $04, $d3
	db $04, $d4
	db $04, $d5
	db $ff

Data_33fc0:
	db $04, $da
	db $04, $db
	db $04, $da
	db $04, $db
	db $04, $da
	db $04, $db
	db $04, $da
	db $04, $db
	db $ff

Data_33fd1:
	db $08, $b0
	db $08, $b1
	db $08, $b0
	db $08, $b2
	db $fe, $00

Data_33fdb:
	db $08, $b3
	db $08, $b4
	db $08, $b3
	db $08, $b5
	db $fe, $00

Data_33fe5:
	db $08, $b6
	db $08, $b7
	db $08, $b6
	db $08, $b8
	db $fe, $00

Data_33fef:
	db $08, $b9
	db $08, $ba
	db $08, $b9
	db $08, $bb
	db $fe, $00

Data_33ff9:
	db $00, $00

SECTION "bank 0D", ROMX, BANK [$d]
IF DEF(POWER)
INCLUDE "data/palettes_34000.power.asm"
ELSE
INCLUDE "data/palettes_34000.speed.asm"
ENDC

SECTION "bank 0E", ROMX, BANK [$e]
PalPackets_38000::
INCLUDE "data/pal_packets2.asm"

INCLUDE "data/oam_templates_1.asm"

Func_38f8d::
	dr $38f8d, $3982c

Func_3982c:
	dr $3982c, $39fab

Func_39fab::
	dr $39fab, $3a0f4

Func_3a0f4:
	dr $3a0f4, $3a0fd

Func_3a0fd:
	dr $3a0fd, $3a175

Func_3a175:
	dr $3a175, $3a1bc

Func_3a1bc:
	dr $3a1bc, $3a696

Func_3a696:
	dr $3a696, $3a7fd

Func_3a7fd:
	dr $3a7fd, $3a996

Func_3a996:
	dr $3a996, $3ac86

Func_3ac86:
	dr $3ac86, $3ad7a

SECTION "bank 0F", ROMX, BANK [$f]
Func_3c000::
	dr $3c000, $3c00c

Func_3c00c::
	dr $3c00c, $3c91b

Func_3c91b::
	dr $3c91b, $3d00e

Func_3d00e::
	dr $3d00e, $3e407

MapEncounterTableIndices:
	dr $3e407, $3f147

SECTION "bank 10", ROMX, BANK [$10]
Pointers_40000:
	dr $40000, $416f0

SECTION "bank 11", ROMX, BANK [$11]
Func_44000:
	dr $44000, $47d2d

SECTION "bank 12", ROMX, BANK [$12]
Func_48000:
	dr $48000, $4bf03

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
	dr $6b1ad, $6b9f7

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
	dr $6eec0, $6f3a6

SECTION "bank 1C", ROMX, BANK [$1c]
INCLUDE "battle/start.asm"

SECTION "bank 1D", ROMX, BANK [$1d]
BattleResult::
	dr $74000, $74ff2

Func_74ff2::
	dr $74ff2, $753f8

Func_753f8::
	dr $753f8, $758f8

Func_758f8::
	dr $758f8, $7598a

SECTION "bank 1F", ROMX, BANK [$1f]
Func_7c000::
	dr $7c000, $7c61b

Func_7c61b::
	dr $7c61b, $7d2c3

Func_7d2c3::
	dr $7d2c3, $7f9d5

SECTION "bank 20", ROMX, BANK [$20]
UpdateSound20::
	dr $80000, $84000

SECTION "bank 21", ROMX, BANK [$21]
UpdateSound21::
	dr $84000, $88000

SECTION "bank 22", ROMX, BANK [$22]
UpdateSound22::
	dr $88000, $8c000

SECTION "bank 23", ROMX, BANK [$23]
UpdateSound23::
	dr $8c000, $90000

SECTION "bank 24", ROMX, BANK [$24]
	dr $90000, $94000

SECTION "bank 26", ROMX, BANK [$26]
	dr $98000, $99068

Pointers_99068:
	dr $99068, $9c000

SECTION "bank 27", ROMX, BANK [$27]
Data_9c000::
	dr $9c000, $9c4a4

Data_9c4a4::
	dr $9c4a4, $9c715

StatOffsetMultipliers::
INCLUDE "data/base_stat_offsets.asm"

Data_9cb29::
	dr $9cb29, $9cbb2

Data_9cbb2::
	dr $9cbb2, $9cbfa

ScriptedEnemyDenjuu::
INCLUDE "data/scripted_denjuu.asm"

EnemyTFangerParties::
INCLUDE "data/tfanger_parties.asm"

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
	dr $a54a2, $a54f1

Func_a54f1:
	dr $a54f1, $a5525

GetPartnerDenjuuMaxHP::
	dr $a5525, $a5569

Func_a5569:
	dr $a5569, $a5572

Func_a5572:
	dr $a5572, $a56c2

Func_a56c2:
	dr $a56c2, $a56cd

Func_a56cd:
	dr $a56cd, $a572c

Func_a572c:
	dr $a572c, $a5814

Func_a5814:
	dr $a5814, $a5822

Func_a5822:
	dr $a5822, $a593b

Func_a593b:
	dr $a593b, $a594b

Func_a594b:
	dr $a594b, $a5d17

Func_a5d17:
	dr $a5d17, $a5efd

Func_a5efd:
	dr $a5efd, $a5f06

Func_a5f06:
	dr $a5f06, $a5f78

Func_a5f78:
	dr $a5f78, $a5f82

Func_a5f82:
	dr $a5f82, $a5f9b

Func_a5f9b:
	dr $a5f9b, $a6b69

Data_a6b69::
	dr $a6b69, $a6d29

UnknownTZFile43:: INCBIN "gfx/tzfiles/tz_43.2bpp.tz"
UnknownTZFile44:: INCBIN "gfx/tzfiles/tz_44.2bpp.tz"

Data_a7869::
	dr $a7869, $a8000

SECTION "bank 2A", ROMX, BANK [$2a]
Func_a8000:
	dr $a8000, $a8046

Func_a8046:
	dr $a8046, $a8200

Func_a8200:
	dr $a8200, $a8210

Func_a8210:
	dr $a8210, $a8368

Func_a8368:
	dr $a8368, $a837a

Func_a837a:
	dr $a837a, $a8539

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

GetMapEncounterTableIndex: ; a85e5 (2a:45e5)
	push hl
	ld hl, MapEncounterTableIndices
	ld a, [wc904]
	ld d, a
	ld e, $0
	srl d
	rr e
	srl d
	rr e
	add hl, de
	ld a, [wc906]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(MapEncounterTableIndices)
	call GetFarByte
	pop hl
	ret

Func_a8608:
	dr $a8608, $a8631

Func_a8631:
	call GetFarByte
	ld a, b
	bit 0, c
	jr nz, .no_swap
	swap a
.no_swap
	and $f
	ld b, a
	ret

Func_a863f:
	ld d, $0
REPT 5
	sla e
	rl d
ENDR
	add hl, de
	ld a, [wc906]
	ld c, a
	srl a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ret

Func_a8663: ; a8663 (2a:4663)
	ld hl, Data_aa417
	ld a, [wc904]
	cp $2
	jr c, .asm_a867d
	cp $6
	jr nc, .asm_a867d
	sub $2
	ld e, a
	call Func_a863f
	ld b, BANK(Data_aa417)
	call Func_a8631
	ret

.asm_a867d
	ld hl, Data_aa497
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, [hl]
	ret

Data_a8688:
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 2, 2, 2, 2, 2, 2, 2, 2, 3, 3, 3, 3, 3, 3, 3, 3
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5
	db 4, 4, 4, 4, 4, 4, 4, 4, 5, 5, 5, 5, 5, 5, 5, 5

CheckCanGenerateEncounters: ; a8788 (2a:4788)
; b = 0: generates encounters
; b = 1: suppresses encounters
	ld b, $0
	ld a, [wc904]
	cp $16
	jr z, .check_c906_1
	cp $17
	jr z, .check_c906_2
	cp $18
	jr z, .check_c906_3
	sub $2
	cp $4
	jr nc, .yup
	ld hl, OverworldEncounterFlags
	or a
	jr z, .skip_addntimes
	ld de, $40
.addntimes
	add hl, de
	dec a
	jr nz, .addntimes
.skip_addntimes
	ld a, [wc906]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld b, BANK(OverworldEncounterFlags)
	call GetFarByte
	ld a, b
	or a
	ret z
	ld a, [wOAMAnimation13]
	and $1
	ret z
.yup
	ld b, $0
	ret

.check_c906_1
	ld a, [wc906]
	cp $19
	jr z, .nope
	cp $1b
	jr z, .nope
	ret

.nope
	inc b
	ret

.check_c906_2
	ld a, [wc906]
	cp $35
	jr z, .nope
	ret

.check_c906_3
	ld a, [wc906]
	cp $34
	jr z, .nope
	ret

Func_a87e4:
	jp Func_a8000

Func_a87e7:
	dr $a87e7, $a8981

Func_a8981:
	dr $a8981, $a8991

Func_a8991:
	dr $a8991, $a89cb

Func_a89cb:
	dr $a89cb, $a89dd

Func_a89dd:
	dr $a89dd, $a89e5

Func_a89e5:
	dr $a89e5, $a8c50

Func_a8c50::
	dr $a8c50, $a8c86

Func_a8c86::
	dr $a8c86, $a8d20

Func_a8d20::
	dr $a8d20, $a8e7e

Func_a8e7e:
	dr $a8e7e, $a8ea3

Func_a8ea3:
	dr $a8ea3, $a91a3

Func_a91a3:
	dr $a91a3, $a91dc

Func_a91dc:
	dr $a91dc, $a9223

Func_a9223:
	dr $a9223, $a9377

Func_a9377:
	dr $a9377, $a93cf

Func_a93cf:
	dr $a93cf, $a98bf

Func_a98bf:
	dr $a98bf, $a99f5

Func_a99f5:
	dr $a99f5, $aa417

Data_aa417:
; 2
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 4, 4, 4, 4
	dn 4, 4, 4, 4, 1, 4, 4, 4
	dn 0, 0, 1, 1, 1, 1, 1, 1
	dn 0, 5, 1, 1, 0, 6, 6, 1
	dn 5, 5, 0, 0, 0, 1, 6, 6
	dn 5, 5, 0, 0, 0, 1, 6, 6
; 3
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 5, 1
	dn 0, 1, 1, 1, 1, 1, 1, 1
	dn 6, 1, 1, 1, 1, 1, 1, 1
	dn 6, 0, 6, 6, 6, 1, 1, 1
; 4
	dn 5, 5, 0, 0, 0, 0, 0, 6
	dn 0, 0, 0, 0, 0, 5, 5, 5
	dn 0, 0, 0, 0, 0, 5, 1, 1
	dn 0, 0, 0, 5, 5, 5, 1, 1
	dn 0, 0, 0, 5, 1, 1, 1, 1
	dn 0, 0, 0, 5, 1, 1, 1, 1
	dn 0, 0, 0, 5, 0, 0, 0, 1
	dn 0, 0, 0, 5, 0, 0, 0, 0
	dn 0, 6, 6, 6, 6, 6, 0, 1
; 5
	dn 5, 1, 0, 6, 6, 6, 0, 1
	dn 5, 1, 0, 6, 6, 0, 0, 0
	dn 5, 1, 0, 6, 6, 0, 0, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5
	dn 1, 1, 0, 6, 5, 5, 5, 5

Data_aa497:
	db 0, 0, 0, 0, 0, 0
	db 1, 1, 1, 1, 4, 0
	db 4, 4, 3, 3, 4, 4
	db 4, 4, 4, 4, 4, 4
	db 4, 4, 3, 3, 3, 3
	db 3, 3, 3, 3, 3, 3
	db 3, 3, 3, 3, 3, 3
	db 3, 0, 0, 0, 0, 0
	db 0, 0, 3, 3, 3, 0
	db 0, 0, 0, 0, 0, 0
	db 0, 0

Pointers_aa4d5:
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6e2
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e4
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6e4
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e0
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6e4
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6dc
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6e1
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6de
	dw Data_aa6e3
	dw Data_aa6e3
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6df
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6d5
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d7
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6d6
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6da
	dw Data_aa6d7
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6dd
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6db
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d9
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8
	dw Data_aa6d8

Data_aa6d5: db $00
Data_aa6d6: db $01
Data_aa6d7: db $02
Data_aa6d8: db $03
Data_aa6d9: db $04
Data_aa6da: db $05
Data_aa6db: db $06
Data_aa6dc: db $07
Data_aa6dd: db $08
Data_aa6de: db $09
Data_aa6df: db $0a
Data_aa6e0: db $0b
Data_aa6e1: db $0c
Data_aa6e2: db $0d
Data_aa6e3: db $15
Data_aa6e4: db $0e

Pointers_aa6e5:
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa74f
	dw Data_aa750
	dw Data_aa751
	dw Data_aa752
	dw Data_aa753
	dw Data_aa754
	dw Data_aa755
	dw Data_aa756
	dw Data_aa757
	dw Data_aa758
	dw Data_aa759
	dw Data_aa75a
	dw Data_aa75b
	dw Data_aa75c
	dw Data_aa75d
	dw Data_aa75e
	dw Data_aa75f
	dw Data_aa760
	dw Data_aa761
	dw Data_aa762
	dw Data_aa763
	dw Data_aa764
	dw Data_aa765
	dw Data_aa766
	dw Data_aa767
	dw Data_aa768
	dw Data_aa769
	dw Data_aa76a
	dw Data_aa76b
	dw Data_aa76c
	dw Data_aa76d
	dw Data_aa76e
	dw Data_aa76f
	dw Data_aa770
	dw Data_aa770
	dw Data_aa770
	dw Data_aa770
	dw Data_aa771
	dw Data_aa772
	dw Data_aa773
	dw Data_aa774
	dw Data_aa774
	dw Data_aa774

Data_aa74f: db $0f
Data_aa750: db $00
Data_aa751: db $10
Data_aa752: db $10
Data_aa753: db $11
Data_aa754: db $12
Data_aa755: db $13
Data_aa756: db $13
Data_aa757: db $13
Data_aa758: db $13
Data_aa759: db $13
Data_aa75a: db $14
Data_aa75b: db $14
Data_aa75c: db $14
Data_aa75d: db $14
Data_aa75e: db $14
Data_aa75f: db $0d
Data_aa760: db $0d
Data_aa761: db $0d
Data_aa762: db $0d
Data_aa763: db $0d
Data_aa764: db $0d
Data_aa765: db $0d
Data_aa766: db $0d
Data_aa767: db $0e
Data_aa768: db $0e
Data_aa769: db $0e
Data_aa76a: db $0e
Data_aa76b: db $0e
Data_aa76c: db $0e
Data_aa76d: db $0e
Data_aa76e: db $0e
Data_aa76f: db $0e
Data_aa770: db $00
Data_aa771: db $00
Data_aa772: db $04
Data_aa773: db $00
Data_aa774: db $06

OverworldEncounterFlags: ; 4 rows of 64
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 1, 1
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 1, 1, 1, 1, 1, 0, 0, 0, 1, 1, 1
	db 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 0, 1, 1, 0, 0, 0, 1, 0, 1, 1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 1, 1, 1, 1, 0
	db 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0

Data_aa875:
	dr $aa875, $aacc6

ItemSpriteGFX:
INCBIN "gfx/sprites/items/000.w16.2bpp"
INCBIN "gfx/sprites/items/001.w16.2bpp"
INCBIN "gfx/sprites/items/002.w16.2bpp"
INCBIN "gfx/sprites/items/003.w16.2bpp"
INCBIN "gfx/sprites/items/004.w16.2bpp"
INCBIN "gfx/sprites/items/005.w16.2bpp"
INCBIN "gfx/sprites/items/006.w16.2bpp"
INCBIN "gfx/sprites/items/007.w16.2bpp"
INCBIN "gfx/sprites/items/008.w16.2bpp"
INCBIN "gfx/sprites/items/009.w16.2bpp"
INCBIN "gfx/sprites/items/010.w16.2bpp"
INCBIN "gfx/sprites/items/011.w16.2bpp"
INCBIN "gfx/sprites/items/012.w16.2bpp"
INCBIN "gfx/sprites/items/013.w16.2bpp"
INCBIN "gfx/sprites/items/014.w16.2bpp"
INCBIN "gfx/sprites/items/015.w16.2bpp"
INCBIN "gfx/sprites/items/016.w16.2bpp"
INCBIN "gfx/sprites/items/017.w16.2bpp"
INCBIN "gfx/sprites/items/018.w16.2bpp"
INCBIN "gfx/sprites/items/019.w16.2bpp"
INCBIN "gfx/sprites/items/020.w16.2bpp"
INCBIN "gfx/sprites/items/021.w16.2bpp"
INCBIN "gfx/sprites/items/022.w16.2bpp"
INCBIN "gfx/sprites/items/023.w16.2bpp"
INCBIN "gfx/sprites/items/024.w16.2bpp"
INCBIN "gfx/sprites/items/025.w16.2bpp"
INCBIN "gfx/sprites/items/026.w16.2bpp"
INCBIN "gfx/sprites/items/027.w16.2bpp"
INCBIN "gfx/sprites/items/028.w16.2bpp"
INCBIN "gfx/sprites/items/029.w16.2bpp"
INCBIN "gfx/sprites/items/030.w16.2bpp"
INCBIN "gfx/sprites/items/031.w16.2bpp"
INCBIN "gfx/sprites/items/032.w16.2bpp"
INCBIN "gfx/sprites/items/033.w16.2bpp"
INCBIN "gfx/sprites/items/034.w16.2bpp"
INCBIN "gfx/sprites/items/035.w16.2bpp"
INCBIN "gfx/sprites/items/036.w16.2bpp"
INCBIN "gfx/sprites/items/037.w16.2bpp"
INCBIN "gfx/sprites/items/038.w16.2bpp"
INCBIN "gfx/sprites/items/039.w16.2bpp"
INCBIN "gfx/sprites/items/040.w16.2bpp"
INCBIN "gfx/sprites/items/041.w16.2bpp"
INCBIN "gfx/sprites/items/042.w16.2bpp"
INCBIN "gfx/sprites/items/043.w16.2bpp"
INCBIN "gfx/sprites/items/044.w16.2bpp"
INCBIN "gfx/sprites/items/045.w16.2bpp"
INCBIN "gfx/sprites/items/046.w16.2bpp"
INCBIN "gfx/sprites/items/047.w16.2bpp"
INCBIN "gfx/sprites/items/048.w16.2bpp"
INCBIN "gfx/sprites/items/049.w16.2bpp"
INCBIN "gfx/sprites/items/050.w16.2bpp"
INCBIN "gfx/sprites/items/051.w16.2bpp"
INCBIN "gfx/sprites/items/052.w16.2bpp"
INCBIN "gfx/sprites/items/053.w16.2bpp"
INCBIN "gfx/sprites/items/054.w16.2bpp"
INCBIN "gfx/sprites/items/055.w16.2bpp"
INCBIN "gfx/sprites/items/056.w16.2bpp"
INCBIN "gfx/sprites/items/057.w16.2bpp"
INCBIN "gfx/sprites/items/058.w16.2bpp"
INCBIN "gfx/sprites/items/059.w16.2bpp"
INCBIN "gfx/sprites/items/060.w16.2bpp"
INCBIN "gfx/sprites/items/061.w16.2bpp"
INCBIN "gfx/sprites/items/062.w16.2bpp"
INCBIN "gfx/sprites/items/063.w16.2bpp"
INCBIN "gfx/sprites/items/064.w16.2bpp"
INCBIN "gfx/sprites/items/065.w16.2bpp"
INCBIN "gfx/sprites/items/066.w16.2bpp"

SECTION "bank 2B", ROMX, BANK [$2b]
	dr $ac000, $b0000

SECTION "bank 2C", ROMX, BANK [$2c]
	dr $b0000, $b4000

SECTION "bank 32", ROMX, BANK [$32]
Func_c8000::
	dr $c8000, $c8222

Func_c8222:
	dr $c8222, $c8243

Func_c8243::
	dr $c8243, $c8268

Func_c8268::
	dr $c8268, $c8293

Func_c8293::
	dr $c8293, $c82a9

Func_c82a9::
	dr $c82a9, $c82df

Func_c82df::
	dr $c82df, $c830a

Func_c830a:
	dr $c830a, $c83bc

Func_c83bc:
	dr $c83bc, $c8621

Func_c8621:
	dr $c8621, $c885f

Func_c885f:
	dr $c885f, $c8d9b

Func_c8d9b:
	dr $c8d9b, $c8f2d

Func_c8f2d:
	dr $c8f2d, $c903d

Func_c903d:
	dr $c903d, $c91df

Func_c91df:
	dr $c91df, $c9374

Func_c9374:
	dr $c9374, $c9538

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
	dr $c99ac, $c9b01

Func_c9b01:
	dr $c9b01, $c9b17

Func_c9b17:
	dr $c9b17, $cc000

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

GFX_de95f: INCBIN "gfx/phone/de95f.2bpp"
GFX_dea5f: INCBIN "gfx/phone/dea5f.w64.2bpp"

GFX_dee5f: INCBIN "gfx/phone/dee5f.w24.2bpp"
GFX_dee8f: INCBIN "gfx/phone/dee8f.w24.2bpp"
GFX_deebf: INCBIN "gfx/phone/deebf.w24.2bpp"
GFX_deeef: INCBIN "gfx/phone/deeef.w24.2bpp"
GFX_def1f: INCBIN "gfx/phone/def1f.w24.2bpp"
GFX_def4f: INCBIN "gfx/phone/def4f.w24.2bpp"
GFX_def7f: INCBIN "gfx/phone/def7f.w24.2bpp"
GFX_defaf: INCBIN "gfx/phone/defaf.w24.2bpp"
GFX_defdf: INCBIN "gfx/phone/defdf.w24.2bpp"

GFX_df00f: INCBIN "gfx/phone/df00f.w64.2bpp"
GFX_df08f: INCBIN "gfx/phone/df08f.w64.2bpp"

SECTION "bank 38", ROMX, BANK [$38]
GFX_e0000:: INCBIN "gfx/misc/e0000.2bpp"
GFX_e00c0:: INCBIN "gfx/misc/e00c0.2bpp"
GFX_e01f0:: INCBIN "gfx/misc/e01f0.2bpp"
GFX_e0320:: INCBIN "gfx/misc/e0320.2bpp"

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
GFX_e0b08:: INCBIN "gfx/misc/cursor.2bpp"
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
	dr $e2d14, $e319c

GFX_e319c:
	dr $e319c, $e3494

GFX_e3494: INCBIN "gfx/misc/e3494.2bpp"
	dr $e3514, $e3a54

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
Pointers_100000:
	dr $100000, $104000

SECTION "bank 45", ROMX, BANK [$45]
Pointers_114000:
	dr $114000, $11507b

Pointers_11507b:
	dr $11507b, $118000

SECTION "bank 46", ROMX, BANK [$46]
Pointers_118000:
	dr $118000, $11c000

SECTION "bank 47", ROMX, BANK [$47]
Pointers_11c000:
	dr $11c000, $120000

SECTION "bank 48", ROMX, BANK [$48]
Pointers_120000:
	dr $120000, $124000

SECTION "bank 49", ROMX, BANK [$49]
Pointers_124000:
	dr $124000, $128000

SECTION "bank 4A", ROMX, BANK [$4a]
Pointers_128000:
	dr $128000, $1281d9

Pointers_1281d9:
	dr $1281d9, $12c000

SECTION "bank 4B", ROMX, BANK [$4b]
Pointers_12c000:
	dr $12c000, $130000

SECTION "bank 4C", ROMX, BANK [$4c]
Pointers_130000:
	dr $130000, $134000

SECTION "bank 4D", ROMX, BANK [$4d]
Pointers_134000::
	dr $134000, $13622e

UnknownTZFile30:: INCBIN "gfx/tzfiles/tz_30.2bpp.tz"
UnknownTZFile31:: INCBIN "gfx/tzfiles/tz_31.2bpp.tz"
UnknownTZFile29:: INCBIN "gfx/tzfiles/tz_29.2bpp.tz"

SECTION "bank 4E", ROMX, BANK [$4e]
Pointers_138000:
	dr $138000, $13c000

SECTION "bank 4F", ROMX, BANK [$4f]
Pointers_13c000:
	dr $13c000, $140000

SECTION "bank 50", ROMX, BANK [$50]
Pointers_140000:
	dr $140000, $144000

SECTION "bank 51", ROMX, BANK [$51]
Pointers_144000:
	dr $144000, $145c9a

Pointers_145c9a:
	dr $145c9a, $148000

SECTION "bank 52", ROMX, BANK [$52]
INCLUDE "data/map_data_148000.asm"
INCLUDE "data/map_data_14956e.asm"
INCLUDE "data/map_data_149dfc.asm"
INCLUDE "data/map_data_14a97c.asm"
INCLUDE "data/map_data_14b0f8.asm"

SECTION "bank 53", ROMX, BANK [$53]
Data_14c000:: INCLUDE "data/unknown_14c000.asm"
INCLUDE "data/map_data_14c668.asm"
INCLUDE "data/map_data_14d472.asm"

SECTION "bank 54", ROMX, BANK [$54]
	dr $150000, $154000

SECTION "bank 55", ROMX, BANK [$55]
	dr $154000, $158000

SECTION "bank 56", ROMX, BANK [$56]
Pointers_158000:
	dr $158000, $15c000

SECTION "bank 57", ROMX, BANK [$57]
Pointers_15c000:
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
TilesetMetatilesPointerTable::
	dr $178000, $178022

TilesetMetaattrsPointerTable::
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

Pointers_19e8ed::
	dw Data_19e957
	dw Data_19e958
	dw Data_19e959
	dw Data_19e95e
	dw Data_19e95f
	dw Data_19e968
	dw Data_19e959
	dw Data_19e95e
	dw Data_19e95f
	dw Data_19e968
	dw Data_19e96d
	dw Data_19e972
	dw Data_19e973
	dw Data_19e974
	dw Data_19e975
	dw Data_19e99a
	dw Data_19e9b3
	dw Data_19e9b4
	dw Data_19e9c5
	dw Data_19e9e6
	dw Data_19ea03
	dw Data_19ea04
	dw Data_19ea15
	dw Data_19ea2a
	dw Data_19ea3f
	dw Data_19ea4c
	dw Data_19ea4d
	dw Data_19ea4e
	dw Data_19ea4f
	dw Data_19ea58
	dw Data_19ea61
	dw Data_19ea7e
	dw Data_19ea9f
	dw Data_19eac0
	dw Data_19eac5
	dw Data_19eac6
	dw Data_19eac7
	dw Data_19ead8
	dw Data_19eae5
	dw Data_19eb0a
	dw Data_19eb27
	dw Data_19eb30
	dw Data_19eb31
	dw Data_19eb3a
	dw Data_19eb3b
	dw Data_19eb3c
	dw Data_19eb3d
	dw Data_19eb3e
	dw Data_19eb3f
	dw Data_19eb44
	dw Data_19eb45
	dw Data_19eb52
	dw Data_19eb5f

Data_19e957:
	db $ff

Data_19e958:
	db $ff

Data_19e959:
	db $43, $83, $01, $36, $ff

Data_19e95e:
	db $ff

Data_19e95f:
	db $94, $85, $00, $37, $a2, $66, $03, $37
	db $ff

Data_19e968:
	db $1d, $16, $02, $36, $ff

Data_19e96d:
	db $4c, $11, $05, $30, $ff

Data_19e972:
	db $ff

Data_19e973:
	db $ff

Data_19e974:
	db $ff

Data_19e975:
	db $6a, $16, $0a, $00, $71, $11, $0b, $01
	db $71, $81, $0c, $02, $74, $24, $0d, $03
	db $76, $86, $0e, $04, $7b, $12, $0f, $05
	db $7d, $65, $10, $08, $7e, $25, $11, $07
	db $65, $24, $12, $30, $ff

Data_19e99a:
	db $84, $86, $13, $09, $86, $16, $14, $0a
	db $89, $16, $15, $30, $8b, $16, $16, $0c
	db $93, $86, $17, $0d, $94, $16, $18, $0e
	db $ff

Data_19e9b3:
	db $ff

Data_19e9b4:
	db $16, $16, $19, $0f, $17, $86, $1a, $10
	db $20, $33, $1b, $11, $26, $56, $1c, $12
	db $ff

Data_19e9c5:
	db $2f, $51, $1d, $13, $33, $42, $1e, $14
	db $33, $24, $1f, $15, $33, $64, $20, $16
	db $34, $54, $21, $17, $39, $44, $22, $18
	db $39, $24, $23, $19, $39, $64, $24, $1a
	db $ff

Data_19e9e6:
	db $40, $32, $25, $1b, $40, $62, $26, $1c
	db $41, $32, $27, $1d, $41, $24, $28, $1e
	db $41, $54, $29, $1f, $4a, $53, $2a, $20
	db $52, $81, $2b, $21, $ff

Data_19ea03:
	db $ff

Data_19ea04:
	db $66, $44, $2c, $22, $6e, $83, $6f, $23
	db $71, $16, $70, $24, $72, $11, $71, $22
	db $ff

Data_19ea15:
	db $76, $11, $72, $26, $76, $14, $73, $27
	db $87, $26, $74, $28, $87, $76, $75, $29
	db $8b, $51, $76, $2a, $ff

Data_19ea2a:
	db $99, $13, $2d, $23, $9b, $33, $2e, $24
	db $a2, $35, $2f, $24, $a2, $65, $30, $26
	db $ad, $86, $77, $27, $ff

Data_19ea3f:
	db $b5, $16, $81, $28, $b7, $76, $82, $29
	db $bc, $43, $83, $2a, $ff

Data_19ea4c:
	db $ff

Data_19ea4d:
	db $ff

Data_19ea4e:
	db $ff

Data_19ea4f:
	db $24, $61, $31, $27, $2d, $14, $32, $28
	db $ff

Data_19ea58:
	db $30, $13, $33, $29, $3f, $84, $34, $2a
	db $ff

Data_19ea61:
	db $49, $83, $85, $2b, $4e, $83, $86, $2c
	db $53, $83, $35, $2d, $55, $41, $36, $2e
	db $56, $41, $37, $2f, $57, $41, $38, $01
	db $58, $41, $39, $34, $ff

Data_19ea7e:
	db $67, $83, $3a, $1d, $6a, $83, $3b, $37
	db $6f, $83, $3c, $1d, $78, $13, $3d, $37
	db $79, $83, $3e, $1d, $7a, $13, $3f, $37
	db $7a, $15, $40, $1d, $7b, $83, $41, $37
	db $ff

Data_19ea9f:
	db $8c, $22, $42, $1d, $8c, $42, $43, $38
	db $8c, $62, $44, $1d, $8c, $82, $45, $38
	db $8c, $24, $46, $1d, $8c, $44, $47, $38
	db $8c, $64, $48, $1d, $8c, $84, $49, $38
	db $ff

Data_19eac0:
	db $ac, $42, $4a, $35, $ff

Data_19eac5:
	db $ff

Data_19eac6:
	db $ff

Data_19eac7:
	db $25, $32, $4b, $1d, $25, $72, $4c, $0a
	db $25, $54, $4d, $35, $45, $81, $4e, $36
	db $ff

Data_19ead8:
	db $55, $54, $4f, $37, $61, $15, $50, $38
	db $81, $31, $51, $39, $ff

Data_19eae5:
	db $8d, $23, $52, $40, $8d, $43, $53, $41
	db $8d, $73, $54, $40, $96, $33, $55, $41
	db $96, $53, $56, $40, $96, $44, $57, $41
	db $a2, $22, $58, $40, $a2, $72, $59, $40
	db $a2, $45, $5a, $41, $ff

Data_19eb0a:
	db $a7, $42, $5b, $21, $aa, $42, $5c, $1f
	db $b0, $55, $5d, $07, $b6, $42, $5e, $1e
	db $bb, $42, $5f, $39, $be, $55, $60, $39
	db $c3, $55, $61, $39, $ff

Data_19eb27:
	db $07, $41, $62, $41, $11, $41, $63, $41
	db $ff

Data_19eb30:
	db $ff

Data_19eb31:
	db $27, $41, $64, $42, $2b, $41, $65, $42
	db $ff

Data_19eb3a:
	db $ff

Data_19eb3b:
	db $ff

Data_19eb3c:
	db $ff

Data_19eb3d:
	db $ff

Data_19eb3e:
	db $ff

Data_19eb3f:
	db $56, $43, $84, $ff

Data_19eb43:
	db $ff

Data_19eb44:
	db $ff

Data_19eb45:
	db $02, $44, $66, $34, $0d, $75, $67, $35
	db $15, $11, $68, $36, $ff

Data_19eb52:
	db $23, $61, $69, $20, $26, $81, $6a, $23
	db $2f, $41, $6b, $0b, $ff

Data_19eb5f:
	db $42, $45, $6c, $3f, $4e, $53, $6d, $3c
	db $4f, $44, $6e, $30, $ff

SECTION "bank 68", ROMX, BANK [$68]
	dr $1a0000, $1a4000

SECTION "bank 69", ROMX, BANK [$69]
	dr $1a4000, $1a8000

SECTION "bank 6A", ROMX, BANK [$6a]
	dr $1a8000, $1ac000

SECTION "bank 75", ROMX, BANK [$75]
DenjuuNames::
INCLUDE "text/denjuu_names.asm"
TFangerNames:: ; 1d4570
INCLUDE "text/tfanger_names.asm"
MoveNames:: ; 1d46f8
INCLUDE "text/attack_names.asm"

BaseStats::
INCLUDE "data/base_stats.asm"

TypeNames::
	db "いわやま"
	db "そうげん"
	db "しんリん"
	db "すいせい"
	db "そら  "
	db "さばく "

INCLUDE "data/denjuu_sprites.asm"

Data_1d56ee::
INCLUDE "data/wild_denjuu.asm"
INCLUDE "text/battle_catchphrases.asm"

Data_1d7928::
	db "のんびリ$$$$"
	db "ちょーのんびリ$"
	db "あわてもの$$$"
	db "ちょーあわてもの"
	db "わがまま$$$$"
	db "ちょーわがまま$"
	db "おくびょう$$$"
	db "ちょーおくびょう"
	db "おこリんぼ$$$"
	db "ちょーおこリんぼ"
	db "リちぎ$$$$$"
	db "ちょーリちぎ$$"

Data_1d7988::
	db "ふつう$"
	db "かくれる"
	db "ジャンプ"
	db "ひこう$"
	db "こんらん"
	db "まひ$$"
	db "のろい$"
	db "ねむリ$"
	db "ひるむ$"
	db "けむリ$"
	db "どく$$"
	db "みえない"
	db "バリア$"
	db "けっかい"
	db "しもやけ"
	db "やけど$"

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
