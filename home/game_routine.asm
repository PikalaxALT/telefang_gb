RunGameRoutine: ; 1be2 (0:1be2)
	ld a, [wGameRoutine]
	ld hl, .GameRoutines
	ld d, $0
	ld e, a
	sla e
	rl d
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

.GameRoutines
	dw OpeningLogos_    ; 00
	dw TitleScreen_     ; 01
	dw Func_1c26        ; 02
	dw TopPhoneMenu_    ; 03
	dw PlayIntroMovie_  ; 04
	dw RunOverworld_    ; 05
	dw StartBattle_     ; 06
	dw DoBattle_        ; 07
	dw BattleResult_    ; 08
	dw StatsScreen_     ; 09
	dw Func_1c6e        ; 0a
	dw InGamePhoneMenu_ ; 0b
	dw InGamePhoneMenu_ ; 0c
	dw Func_1c80        ; 0d
	dw GameOverScreen_  ; 0e
	dw LinkMode_        ; 0f

OpeningLogos_:
	ld a, BANK(OpeningLogos)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp OpeningLogos

TitleScreen_:
	ld a, BANK(TitleScreen)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp TitleScreen

Func_1c26:
	ld a, BANK(Func_8000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8000

TopPhoneMenu_:
	ld a, BANK(TopPhoneMenu)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp TopPhoneMenu

PlayIntroMovie_:
	ld a, BANK(PlayIntroMovie)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp PlayIntroMovie

RunOverworld_:
	ld a, BANK(PrintText)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp RunOverworld

StartBattle_:
	ld a, BANK(StartBattle)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp StartBattle

DoBattle_:
	ld a, BANK(DoBattle)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp DoBattle

BattleResult_:
	ld a, BANK(BattleResult)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp BattleResult

StatsScreen_:
	ld a, BANK(StatsScreen)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp StatsScreen

Func_1c6e:
	ld a, BANK(Func_8b24)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8824

InGamePhoneMenu_:
	ld a, BANK(InGamePhoneMenu)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp InGamePhoneMenu

Func_1c80:
	ld a, BANK(Func_84cf)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_84cf

GameOverScreen_:
	ld a, BANK(GameOverScreen)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp GameOverScreen

LinkMode_:
	ld a, BANK(LinkMode)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp LinkMode
