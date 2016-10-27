FarCall_HL::
	di
	ld [wPrevROMBank], a
	ld a, [wROMBank]
	push af
	ld a, [wPrevROMBank]
	ld [MBC3RomBank], a
	ld [wROMBank], a
	ei
	call _hl_
	di
	pop af
	ld [MBC3RomBank], a
	ld [wROMBank], a
	ei
	ret

FarJump_HL::
	di
	ld [MBC3RomBank], a
	ld [wROMBank], a
	ei
_hl_:: ; 49d (0:049d)
	jp [hl]

BankSwitch::
	di
	ld [MBC3RomBank], a
	ld [wROMBank], a
	ei
	ret

PaletteFadeCGB_::
	ld a, BANK(PaletteFadeCGB)
	rst Bankswitch
	call PaletteFadeCGB
	push af
	rst MemBankswitch
	pop af
	ret

DecompressGFXByIndex_::
	call DecompressGFXByIndex
	rst MemBankswitch
	ret

GetCGB_BGLayout_::
	call GetCGB_BGLayout
	rst MemBankswitch
	ret

GetCGB_OBLayout_::
	call GetCGB_OBLayout
	rst MemBankswitch
	ret

Func_04c0::
	homecall_memret_passa Func_c320
	ret

LoadStdBGMapLayout_:: ; 04ca
	ld [wStdLayoutIndexBuffer], a
	ld a, [wROMBank]
	push af
	ld a, [wStdLayoutIndexBuffer]
	call LoadStdBGMapLayout
	pop af
	rst Bankswitch
	ret

LoadStdBGMapAttrLayout_:: ; 04da
	ld [wStdLayoutIndexBuffer], a
	ld a, [wROMBank]
	push af
	ld a, [wStdLayoutIndexBuffer]
	call LoadStdBGMapAttrLayout
	pop af
	rst Bankswitch
	ret

LoadStdWindowAttrLayout_:: ; 04ea
	ld [wStdLayoutIndexBuffer], a
	ld a, [wROMBank]
	push af
	ld a, [wStdLayoutIndexBuffer]
	call LoadStdWindowAttrLayout
	pop af
	rst Bankswitch
	ret

LoadStdWindowLayout_:: ; 04fa
	ld [wStdLayoutIndexBuffer], a
	ld a, [wROMBank]
	push af
	ld a, [wStdLayoutIndexBuffer]
	call LoadStdWindowLayout
	pop af
	rst Bankswitch
	ret

Func_050a::
	call Func_122d
	rst MemBankswitch
	ret

PaletteFade_::
	call PaletteFade
	push af
	rst MemBankswitch
	pop af
	ret

LoadDenjuuPic_::
	call LoadDenjuuPic
	rst MemBankswitch
	ret

LoadTFangerPic_::
	call LoadTFangerPic
	rst MemBankswitch
	ret

Func_0520::
	homecall_memret Func_2c766
	ret

Func_0528::
	homecall_memret Func_2c7ed
	ret

Func_0530::
	homecall_memret PrintText
	ret

Copy2bpp::
	rst Bankswitch
	call WaitStatCopy
	rst MemBankswitch
	ret

Func_053e::
	call Func_1887
	rst MemBankswitch
	ret

Func_0543::
	call Func_39ec
	rst MemBankswitch
	ret

Get8CharName75::
	ld a, BANK(DenjuuNames)
	rst Bankswitch
	call Get8CharName
	rst MemBankswitch
	ret

Get8CharName0B::
	ld a, $b
	rst Bankswitch
	call Get8CharName
	rst MemBankswitch
	ret

Get4CharName75::
	ld a, BANK(TypeNames)
	rst Bankswitch
	call Get4CharName
	rst MemBankswitch
	ret

PlaceString_::
	call PlaceString
	rst MemBankswitch
	ret

GetAndPrintName75LeftAlign_::
	call GetAndPrintName75LeftAlign
	rst MemBankswitch
	ret

Func_056a::
	call Func_3b09
	rst MemBankswitch
	ret

LoadWildBattleBackgroundGFX::
	call LoadWildBattleBackgroundGFX_
	rst MemBankswitch
	ret

Func_0574::
	call Func_1bb3
	rst MemBankswitch
	ret

Func_0579::
	call Func_1bb8
	rst MemBankswitch
	ret

Func_057e::
	call Func_1ac6
	rst MemBankswitch
	ret

Func_0583::
	call Func_1acb
	rst MemBankswitch
	ret

Func_0588::
	call Func_3882
	rst MemBankswitch
	ret

GetOrCalcStatC_::
	push af
	ld a, BANK(BaseStats)
	rst Bankswitch
	pop af
	call GetOrCalcStatC
	rst MemBankswitch
	ret

PrintCurDenjuuTypeName_::
	ld a, BANK(TypeNames)
	rst Bankswitch
	call PrintCurDenjuuTypeName
	rst MemBankswitch
	ret

Func_059f::
	ld a, BANK(Data_1d7988)
	rst Bankswitch
	call Func_3b36
	rst MemBankswitch
	ret

LoadKanji_::
	call LoadKanji
	rst MemBankswitch
	ret

Func_05ac::
	call LoadButtonGFX
	rst MemBankswitch
	ret

Func_05b1::
	call Func_192a
	rst MemBankswitch
	ret

Func_05b6::
	ld a, BANK(Func_8b8b)
	ld [wPrevROMBank], a
	rst Bankswitch
	call Func_8b8b
	rst MemBankswitch
	ret

LoadGame_::
	homecall_memret LoadGame
	ret

SaveGame_::
	homecall_memret SaveGame
	ret

GetDenjuuSprite_::
	ld a, BANK(DenjuuSprites)
	rst Bankswitch
	call GetDenjuuSprite
	rst MemBankswitch
	ret

Func_05d9::
	push af
	ld a, BANK(Data_9c000)
	rst Bankswitch
	pop af
	call Func_3b4e
	rst MemBankswitch
	ret

Func_05e3::
	push af
	ld a, BANK(Data_9c4a4)
	rst Bankswitch
	pop af
	call Func_3b74
	rst MemBankswitch
	ret

GetStatOffsetMultiplier_::
	push af
	ld a, BANK(StatOffsetMultipliers)
	rst Bankswitch
	pop af
	call GetStatOffsetMultiplier
	rst MemBankswitch
	ret

Func_05f7::
	push af
	ld a, BANK(Data_9cb29)
	rst Bankswitch
	pop af
	call Func_3bc1
	rst MemBankswitch
	ret

ChooseWildDenjuuEncounter_::
	ld a, BANK(Data_1d56ee)
	rst Bankswitch
	call ChooseWildDenjuuEncounter
	rst MemBankswitch
	ret

Func_0609::
	ld a, [wROMBank]
	push af
	ld a, [wd411]
	call Func_0d97
	pop af
	rst Bankswitch
	ret

Func_0616::
	ld a, [wROMBank]
	push af
	call Func_0df7
	pop af
	rst Bankswitch
	ret

LoadDenjuuBattleCatchphrase_::
	ld a, BANK(DenjuuArrivalMessages)
	rst Bankswitch
	call LoadDenjuuBattleCatchphrase
	rst MemBankswitch
	ret

Func_0628::
	homecall_memret Func_2d99b
	ret

Func_0630::
	homecall_memret Func_a8d20
	ret

Func_0638::
	ld a, BANK(Func_68000)
	rst Bankswitch
	call Func_1939
	rst MemBankswitch
	ret

Func_0640::
	ld a, BANK(Func_6c000)
	rst Bankswitch
	call Func_19b9
	rst MemBankswitch
	ret

Func_0648::
	homecall_memret Func_a4000
	ret

Func_0650::
	homecall_memret_passa Func_a42a3
	ret

Func_065a::
	homecall Func_a4e12
	ret

Func_0667::
	homecall_memret_passa Func_a42e5
	ret

Func_0671::
	homecall_memret Func_a8539
	ret

Func_0679::
	homecall_memret Func_2ded9
	ret

Func_0681::
	ld a, BANK(Data_9cbb2)
	rst Bankswitch
	call Func_3e00
	rst MemBankswitch
	ret

LoadScriptedEnemyDenjuu_::
	ld a, BANK(ScriptedEnemyDenjuu)
	rst Bankswitch
	call LoadScriptedEnemyDenjuu
	rst MemBankswitch
	ret

LoadEnemyTFangerParty_::
	ld a, BANK(EnemyTFangerParties)
	rst Bankswitch
	call LoadEnemyTFangerParty
	ld hl, wOAMAnimations
	rst MemBankswitch
	ret

Func_069c::
	homecall_memret Func_a4e02
	ret

Func_06a4::
	homecall_memret Func_a5418
	ret

Func_06ac::
	ld a, BANK(Data_a6b69)
	rst Bankswitch
	call Func_1b4d
	rst MemBankswitch
	ret

Func_06b4::
	homecall_memret Func_7c61b
	ret

Func_06bc::
	homecall_memret Func_74ff2
	ret

Func_06c4::
	homecall_memret Func_758f8
	ret

Func_06cc::
	homecall_memret Func_a40ef
	ret

GetPartnerDenjuuMaxHP_::
	ld a, [wROMBank]
	push af
	ld a, BANK(GetPartnerDenjuuMaxHP)
	rst Bankswitch
	call GetPartnerDenjuuMaxHP
	pop af
	ld [wPrevROMBank], a
	rst Bankswitch
	ret

Func_06e4::
	ld a, [wdc05]
	or a
	ret z
	ld a, [wdc01]
	or a
	ret nz
	ld a, [wGameRoutine]
	cp $f
	ret z
	ld a, [wdc07]
	cp $10
	jr z, .asm_0700
	inc a
	ld [wdc07], a
	ret

.asm_0700
	call InitSerialData
	ret

Func_0704::
	homecall_memret Func_753f8
	ret

Func_070c::
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a4c9b)
	rst Bankswitch
	call Func_a4c9b
	pop af
	ld [wPrevROMBank], a
	rst Bankswitch
	ret

Func_071c::
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_8648)
	ld [wPrevROMBank], a
	rst Bankswitch
	call Func_8648
	pop af
	ld [wPrevROMBank], a
	rst Bankswitch
	ret

Func_072f::
	homecall_memret Func_872e
	ret
