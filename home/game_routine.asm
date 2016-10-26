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
	jp [hl]

.GameRoutines
	dw OpeningLogos_
	dw TitleScreen_
	dw Func_1c26
	dw TopPhoneMenu_
	dw PlayIntroMovie_
	dw RunOverworld_
	dw StartBattle_
	dw DoBattle_
	dw BattleResult_
	dw Func_1c65
	dw Func_1c6e
	dw InGamePhoneMenu_
	dw InGamePhoneMenu_
	dw Func_1c80
	dw GameOverScreen_
	dw Func_1c92

OpeningLogos_::
	ld a, BANK(OpeningLogos)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp OpeningLogos

TitleScreen_::
	ld a, BANK(TitleScreen)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp TitleScreen

Func_1c26::
	ld a, BANK(Func_8000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_8000

TopPhoneMenu_::
	ld a, BANK(TopPhoneMenu)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp TopPhoneMenu

PlayIntroMovie_::
	ld a, BANK(PlayIntroMovie)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp PlayIntroMovie

RunOverworld_::
	ld a, $b
	ld [wPrevROMBank], a
	rst Bankswitch
	jp RunOverworld

StartBattle_::
	ld a, BANK(StartBattle)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp StartBattle

DoBattle_::
	ld a, BANK(DoBattle)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp DoBattle

BattleResult_::
	ld a, BANK(BattleResult)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp BattleResult

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

InGamePhoneMenu_::
	ld a, BANK(InGamePhoneMenu)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp InGamePhoneMenu

Func_1c80::
	ld a, BANK(Func_84cf)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_84cf

GameOverScreen_::
	ld a, BANK(GameOverScreen)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp GameOverScreen

Func_1c92::
	ld a, BANK(Func_7c000)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_7c000
