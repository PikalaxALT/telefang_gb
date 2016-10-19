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
	dw PhoneMenu_
	dw PlayIntroMovie_
	dw RunOverworld_
	dw StartBattle_
	dw DoBattle_
	dw WinBattle_
	dw Func_1c65
	dw Func_1c6e
	dw Func_1c77
	dw Func_1c77
	dw Func_1c80
	dw Func_1c89
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

PhoneMenu_::
	ld a, BANK(PhoneMenu)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp PhoneMenu

PlayIntroMovie_::
	ld a, BANK(PlayIntroMovie)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp PlayIntroMovie

RunOverworld_::
	ld a, $b
	ld [wPrevROMBank], a
	rst Bankswitch
	jp Func_1ea1

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

WinBattle_::
	ld a, BANK(WinBattle)
	ld [wPrevROMBank], a
	rst Bankswitch
	jp WinBattle

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
