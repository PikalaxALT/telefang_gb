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
	ld a, [wc9c9]
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
	ld a, [wc9c9]
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
	db "イォンとう$" ; Ion Island
	db "パパルナこ$" ; Paparuna Lake
	db "パンセスむら$" ; Panses Village
	db "トリパむら$" ; Tripa Village
	db "フラウラむら$" ; Flaura Village
	db "あくまのやま ぺぺリやま$" ; Devil's Mountain: Peperi Mountain
	db "イクソスのもリ$" ; Ixos Forest
	db "カクトスいせき$" ; Cactos Ruins
	db "ブリォンいせき$" ; Burion Ruins
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
	ld [wBattleMenuCursorXCoord], a
	ld a, $0
	ld [wBattleMenuCursorYCoord], a
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
	ld bc, $200
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
	ld a, [wd477]
	call GetNthEnemyDenjuu
	call Func_140ab
	ld a, [wd477]
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
	ld a, [wd475]
	jp Func_141f2

.asm_141ec
	hlbgcoord 3, 16
	ld a, [wd476]
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
	ld a, [wd478]
	jp Func_1422b

asm_14225
	hlbgcoord 13, 16
	ld a, [wd479]
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

Func_2c100: ; 2c100 (b:4100)
	ld a, [wc9c5]
	inc a
	ld [wc9c5], a
	ld a, [wc9c9]
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
	call Func_2cc32
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
	ld [wc9c9], a
	ld a, $0
	ld [wc9cc], a
	jr Func_2c316

.asm_2c306
	ld a, [wc9c5]
	ld [wc9cc], a
	ld a, $3
	ld [wc9c9], a
	jr Func_2c316

Func_2c313: ; 2c313 (b:4313)
	call Func_2c337
Func_2c316: ; 2c316 (b:4316)
	ld a, [wc9cd]
	or a
	jp z, Func_2c100
	ld a, [wcad3]
	or a
	jp nz, Func_2c100
	ld a, [hJoyLast]
	and $2
	jp nz, Func_2c100
	ld a, [hJoyNew]
	and $1
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
	call Func_2cc32
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
	and $1
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
	ld [wc9c9], a
	ret

Func_2c3c7: ; 2c3c7 (b:43c7)
	ld a, [hJoyLast]
	and $2
	jr nz, .asm_2c3d8
	ld a, [wc9cc]
	ld b, a
	ld a, [wc9c5]
	sub b
	and $3
	ret nz
.asm_2c3d8
	call Func_2cb3d
	ld a, [wc9c9]
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
	ld a, [wc9c9]
	cp $3
	jr z, .asm_2c407
	ld a, $1
	ld [wc9c9], a
	ld a, $2
	ld [wc9cc], a
	ret

.asm_2c407
	ld a, $4
	ld [wc9c9], a
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
	ld de, $500f
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
	and $20
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
	and $12
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
	call Func_2cc32
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
	ld de, Data_2cb08
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
	ld a, $38
	ld bc, $10
	jp Func_372d

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
	call Func_2cc32
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
	and $1
	ret z
.asm_2c569
	ld a, $0
	ld [wcad3], a
	ld a, $9
	ld [wc9c9], a
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
	ld [wc9c9], a
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
	ld [wc9c9], a
	ret

.asm_2c5dd
	cp $1
	jr nz, .asm_2c5ec
	ld a, $3c
	ld [wc9cc], a
	ld a, $5
	ld [wc9c9], a
	ret

.asm_2c5ec
	cp $2
	jr nz, .asm_2c5fb
	ld a, $0
	ld [wc9cc], a
	ld a, $6
	ld [wc9c9], a
	ret

.asm_2c5fb
	cp $3
	jr nz, .asm_2c60a
	ld a, $0
	ld [wc9cc], a
	ld a, $7
	ld [wc9c9], a
	ret

.asm_2c60a
	cp $4
	jr nz, .asm_2c619
	ld a, $1
	ld [wc9cc], a
	ld a, $6
	ld [wc9c9], a
	ret

.asm_2c619
	cp $a
	jr nz, .asm_2c630
	ld a, $0
	ld [wc9cc], a
	ld a, $a
	ld [wc9c9], a
	call Func_2c4f6
	ld a, $1
	ld [wc9d7], a
	ret

.asm_2c630
	ld a, $0
	ld [wc9cc], a
	ld a, $8
	ld [wc9c9], a
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
	ld [wc9c9], a
	call Func_2c98e
	jr .asm_2c6d1

.asm_2c6be
	ld a, $0
	ld [wc9c9], a
	ld a, [wc9ca]
	add $2
	ld [wc9ca], a
	call Func_2c9bd
	call Func_2cc4e
.asm_2c6d1
	ret

Func_2c6d2: ; 2c6d2 (b:46d2)
	ld d, $a
	ld a, [wc484]
	cp $48
	jr c, .asm_2c6dd
	ld d, $1
.asm_2c6dd
	ld a, d
	ld [wc9ca], a
	ret

Func_2c6e2: ; 2c6e2 (b:46e2)
	call Func_2c6d2
	ld hl, Data_2e652
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
	ld hl, Data_2e652
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
	ld hl, wc9fc
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
	ld [wc9c9], a
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
	ld hl, wc9fc
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
	ld [wc9c9], a
	ret

Func_2c831: ; 2c831 (b:4831)
	ld a, [wc910]
	ld l, a
	ld a, [wc911]
	ld h, a
	ld d, $0
	call Func_2c883
	call Func_2c9e6
	call Func_2c100
	call Func_2c100
	ld a, $0
	ld [wc9cf], a
	ret

Func_2c84d: ; 2c84d (b:484d)
	ld a, [wc910]
	ld l, a
	ld a, [wc911]
	ld h, a
	ld a, [wc484]
	cp $48
	jr nc, .asm_2c86b
	ld d, $e
	call Func_2c883
	call Func_2c9fb
	ld a, $1
	ld [wcd29], a
	jr .asm_2c878

.asm_2c86b
	ld d, $0
	call Func_2c883
	call Func_2c9fb
	ld a, $0
	ld [wcd29], a
.asm_2c878
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
	jr c, .asm_2c8a9
	call Func_2c8b1
.asm_2c8a9
	xor a
	ld [wca5d], a
	ld [wcd21], a
	ret

Func_2c8b1: ; 2c8b1 (b:48b1)
	ld a, [wcd29]
	or a
	jr nz, .asm_2c8c6
	ld a, [wc9fd]
	ld h, a
	ld a, [wc9fc]
	ld l, a
	ld de, wca70
	call Func_2c8d8
	ret

.asm_2c8c6
	ld a, [wc9fd]
	ld h, a
	ld a, [wc9fc]
	ld l, a
	ld bc, $1c0
	add hl, bc
	call WrapAroundBGMapPointer
	ld de, wcab6
Func_2c8d8: ; 2c8d8 (b:48d8)
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	call Func_2c8f6
	jp Func_2c8f6

Func_2c8f6: ; 2c8f6 (b:48f6)
	ld a, [de]
	push hl
	push de
	call Func_328d
	pop de
	inc de
	pop hl
	ld c, $2
	jp Func_2cc32

Func_2c904: ; 2c904 (b:4904)
	call Func_2107
	jr nz, .asm_2c92b
	ld a, [wc904]
	cp $b
	jr z, .asm_2c92b
	ld a, [wca5d]
	cp $5a
	jr nz, .asm_2c91a
	jp Func_2cde

.asm_2c91a
	ret c
	ld a, [hJoyNew]
	and $1
	ret z
	ld a, [wc956]
	xor $1
	ld [wc956], a
	jp Func_2c9fe

.asm_2c92b
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

Func_2c98e:
	dr $2c98e, $2c9a2

Func_2c9a2:
	dr $2c9a2, $2c9bd

Func_2c9bd:
	dr $2c9bd, $2c9d1

Func_2c9d1:
	dr $2c9d1, $2c9e6

Func_2c9e6:
	dr $2c9e6, $2c9fb

Func_2c9fb:
	dr $2c9fb, $2c9fe

Func_2c9fe:
	dr $2c9fe, $2ca0f

Func_2ca0f:
	dr $2ca0f, $2ca48

Func_2ca48:
	dr $2ca48, $2ca5c

Func_2ca5c:
	dr $2ca5c, $2cb08

Data_2cb08:
	dr $2cb08, $2cb3d

Func_2cb3d:
	dr $2cb3d, $2cb68

Func_2cb68:
	dr $2cb68, $2cbd0

Func_2cbd0:
	dr $2cbd0, $2cc32

Func_2cc32:
	dr $2cc32, $2cc4e

Func_2cc4e:
	dr $2cc4e, $2ccb9

Func_2ccb9::
	dr $2ccb9, $2cce5

Func_2cce5:
	dr $2cce5, $2cceb

Func_2cceb:
	dr $2cceb, $2ccf6

Func_2ccf6:
	dr $2ccf6, $2ce29

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
	dr $2cea0, $2d00f

Data_2d00f:
	dr $2d00f, $2d07b

Data_2d07b:
	dr $2d07b, $2d229

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
	dr $2e589, $2e652

Data_2e652:
	dr $2e652, $2e8fa

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
	dr $33ac4, $33ff8

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
	dr $38f8d, $39fab

Func_39fab::
	dr $39fab, $3ad7a

SECTION "bank 0F", ROMX, BANK [$f]
Func_3c000::
	dr $3c000, $3c00c

Func_3c00c::
	dr $3c00c, $3c91b

Func_3c91b::
	dr $3c91b, $3d00e

Func_3d00e::
	dr $3d00e, $3f147

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
	dr $a85e5, $a8631

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
	dr $a8688, $a8788

Func_a8788::
	dr $a8788, $a8c50

Func_a8c50::
	dr $a8c50, $a8c86

Func_a8c86::
	dr $a8c86, $a8d20

Func_a8d20::
	dr $a8d20, $aa417

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
	db 0, 0, 0, 0, 0
	db 0, 1, 1, 1, 1
	db 4, 0, 4, 4, 3
	db 3, 4, 4, 4, 4
	db 4, 4, 4, 4, 4
	db 4, 3, 3, 3, 3
	db 3, 3, 3, 3, 3
	db 3, 3, 3, 3, 3
	db 3, 3, 3, 0, 0
	db 0, 0, 0, 0, 0
	db 3, 3, 3, 0, 0
	db 0, 0, 0, 0, 0
	db 0, 0

Pointers_aa4d5:
	dr $aa4d5, $ac000

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

Data_1d5640::
	dr $1d5640, $1d56ee

Data_1d56ee::
INCLUDE "data/wild_denjuu.asm"

Data_1d5888:
	dr $1d5888, $1d7928

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
