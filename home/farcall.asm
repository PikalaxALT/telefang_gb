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

Func_04a7::
	ld a, BANK(Func_f682)
	rst Bankswitch
	call Func_f682
	push af
	rst MemBankswitch
	pop af
	ret

Func_04b1::
	call Func_0c36
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
	push af
	ld a, BANK(Func_c320)
	rst Bankswitch
	pop af
	call Func_c320
	rst MemBankswitch
	ret

Func_04ca::
	ld [wcb26], a
	ld a, [wROMBank]
	push af
	ld a, [wcb26]
	call Func_0a2a
	pop af
	rst Bankswitch
	ret

Func_04da::
	ld [wcb26], a
	ld a, [wROMBank]
	push af
	ld a, [wcb26]
	call Func_0b1a
	pop af
	rst Bankswitch
	ret

Func_04ea::
	ld [wcb26], a
	ld a, [wROMBank]
	push af
	ld a, [wcb26]
	call Func_0b33
	pop af
	rst Bankswitch
	ret

Func_04fa::
	ld [wcb26], a
	ld a, [wROMBank]
	push af
	ld a, [wcb26]
	call Func_0a34
	pop af
	rst Bankswitch
	ret

Func_050a::
	call Func_122d
	rst MemBankswitch
	ret

Func_050f::
	call Func_1248
	push af
	rst MemBankswitch
	pop af
	ret

Func_0516::
	call Func_1620
	rst MemBankswitch
	ret

Func_051b::
	call Func_16c2
	rst MemBankswitch
	ret

Func_0520::
	ld a, BANK(Func_2c766)
	rst Bankswitch
	call Func_2c766
	rst MemBankswitch
	ret

Func_0528::
	ld a, BANK(Func_2c7ed)
	rst Bankswitch
	call Func_2c7ed
	rst MemBankswitch
	ret

Func_0530::
	ld a, BANK(Func_2c100)
	rst Bankswitch
	call Func_2c100
	rst MemBankswitch
	ret

Func_0538::
	rst Bankswitch
	call Func_1705
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

Func_0548::
	ld a, $75
	rst Bankswitch
	call Func_3a01
	rst MemBankswitch
	ret

Func_0550::
	ld a, $b
	rst Bankswitch
	call Func_3a01
	rst MemBankswitch
	ret

Func_0558::
	ld a, $75
	rst Bankswitch
	call Func_3a1d
	rst MemBankswitch
	ret

Func_0560::
	call Func_3a91
	rst MemBankswitch
	ret

Func_0565::
	call Func_3ac3
	rst MemBankswitch
	ret

Func_056a::
	call Func_3b09
	rst MemBankswitch
	ret

Func_056f::
	call Func_1b9c
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

Func_058d::
	push af
	ld a, $75
	rst Bankswitch
	pop af
	call Func_3a35
	rst MemBankswitch
	ret

Func_0597::
	ld a, $75
	rst Bankswitch
	call Func_3b22
	rst MemBankswitch
	ret

Func_059f::
	ld a, $75
	rst Bankswitch
	call Func_3b36
	rst MemBankswitch
	ret

Func_05a7::
	call Func_18e6
	rst MemBankswitch
	ret

Func_05ac::
	call Func_190b
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

Func_05c1::
	ld a, BANK(Func_fb8d)
	rst Bankswitch
	call Func_fb8d
	rst MemBankswitch
	ret

Func_05c9::
	ld a, BANK(Func_fb3e)
	rst Bankswitch
	call Func_fb3e
	rst MemBankswitch
	ret

Func_05d1::
	ld a, $75
	rst Bankswitch
	call Func_3b3f
	rst MemBankswitch
	ret

Func_05d9::
	push af
	ld a, $27
	rst Bankswitch
	pop af
	call Func_3b4e
	rst MemBankswitch
	ret

Func_05e3::
	push af
	ld a, $27
	rst Bankswitch
	pop af
	call Func_3b74
	rst MemBankswitch
	ret

Func_05ed::
	push af
	ld a, $27
	rst Bankswitch
	pop af
	call Func_3ba9
	rst MemBankswitch
	ret

Func_05f7::
	push af
	ld a, $27
	rst Bankswitch
	pop af
	call Func_3bc1
	rst MemBankswitch
	ret

Func_0601::
	ld a, $75
	rst Bankswitch
	call Func_3c57
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

Func_0620::
	ld a, $75
	rst Bankswitch
	call Func_3c8b
	rst MemBankswitch
	ret

Func_0628::
	ld a, BANK(Func_2d99b)
	rst Bankswitch
	call Func_2d99b
	rst MemBankswitch
	ret

Func_0630::
	ld a, BANK(Func_a8d20)
	rst Bankswitch
	call Func_a8d20
	rst MemBankswitch
	ret

Func_0638::
	ld a, $1a
	rst Bankswitch
	call Func_1939
	rst MemBankswitch
	ret

Func_0640::
	ld a, $1b
	rst Bankswitch
	call Func_19b9
	rst MemBankswitch
	ret

Func_0648::
	ld a, BANK(Func_a4000)
	rst Bankswitch
	call Func_a4000
	rst MemBankswitch
	ret

Func_0650::
	push af
	ld a, BANK(Func_a42a3)
	rst Bankswitch
	pop af
	call Func_a42a3
	rst MemBankswitch
	ret

Func_065a::
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a4e12)
	rst Bankswitch
	call Func_a4e12
	pop af
	rst Bankswitch
	ret

Func_0667::
	push af
	ld a, BANK(Func_a42e5)
	rst Bankswitch
	pop af
	call Func_a42e5
	rst MemBankswitch
	ret

Func_0671::
	ld a, BANK(Func_a8539)
	rst Bankswitch
	call Func_a8539
	rst MemBankswitch
	ret

Func_0679::
	ld a, BANK(Func_2ded9)
	rst Bankswitch
	call Func_2ded9
	rst MemBankswitch
	ret

Func_0681::
	ld a, $27
	rst Bankswitch
	call Func_3e00
	rst MemBankswitch
	ret

Func_0689::
	ld a, $27
	rst Bankswitch
	call Func_3e45
	rst MemBankswitch
	ret

Func_0691::
	ld a, $27
	rst Bankswitch
	call Func_3e68
	ld hl, wc0a0
	rst MemBankswitch
	ret

Func_069c::
	ld a, BANK(Func_a4e02)
	rst Bankswitch
	call Func_a4e02
	rst MemBankswitch
	ret

Func_06a4::
	ld a, BANK(Func_a5418)
	rst Bankswitch
	call Func_a5418
	rst MemBankswitch
	ret

Func_06ac::
	ld a, $29
	rst Bankswitch
	call Func_1b4d
	rst MemBankswitch
	ret

Func_06b4::
	ld a, BANK(Func_7c61b)
	rst Bankswitch
	call Func_7c61b
	rst MemBankswitch
	ret

Func_06bc::
	ld a, BANK(Func_74ff2)
	rst Bankswitch
	call Func_74ff2
	rst MemBankswitch
	ret

Func_06c4::
	ld a, BANK(Func_758f8)
	rst Bankswitch
	call Func_758f8
	rst MemBankswitch
	ret

Func_06cc::
	ld a, BANK(Func_a40ef)
	rst Bankswitch
	call Func_a40ef
	rst MemBankswitch
	ret

Func_06d4::
	ld a, [wROMBank]
	push af
	ld a, BANK(Func_a5525)
	rst Bankswitch
	call Func_a5525
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
	ld a, [wc3e0]
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
	ld a, BANK(Func_753f8)
	rst Bankswitch
	call Func_753f8
	rst MemBankswitch
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
	ld a, BANK(Func_872e)
	rst Bankswitch
	call Func_872e
	rst MemBankswitch
	ret
