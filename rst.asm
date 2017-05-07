SECTION "RST_00", ROM0 [$0000]
	pop hl
	add a
	rst $28
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp hl

SECTION "RST_08", ROM0 [$0008]
	reti

SECTION "RST_10", ROM0 [Bankswitch]
	jp BankSwitch ; 049e

SECTION "RST_18", ROM0 [MemBankswitch]
	ld a, [wPrevROMBank]
	rst Bankswitch
	ret

SECTION "RST_20", ROM0 [FarCall]
	jp FarCall_HL

SECTION "RST_28", ROM0 [$0028]
	
SECTION "RST_30", ROM0 [$0030]
	add a
	rst $28
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

SECTION "RST_38", ROM0 [$0038]
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ret
