SECTION "RST_00", HOME [$0000]
	pop hl
	add a
	rst $28
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

SECTION "RST_08", HOME [$0008]
	reti

SECTION "RST_10", HOME [Bankswitch]
	jp BankSwitch ; 049e

SECTION "RST_18", HOME [MemBankswitch]
	ld a, [wc423]
	rst Bankswitch
	ret

SECTION "RST_20", HOME [$0020]
	jp Func_0476

SECTION "RST_28", HOME [$0028]
	
SECTION "RST_30", HOME [$0030]
	add a
	rst $28
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ret

SECTION "RST_38", HOME [$0038]
	ld a, [hli]
	ld l, [hl]
	ld h, a
	ret
