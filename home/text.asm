PrintText_:
	homecall PrintText
	ret

PrintMoneyInShop_:
	homecall PrintMoneyInShop
	ret

OverworldIdleHUD_:
	homecall OverworldIdleHUD
	ret

LoadItemNameAndQuantityTextbox_::
	homecall LoadItemNameAndQuantityTextbox, PrintText, PrintText
	ld a, $0
	ld [wTextSubfunction], a
	ret

DecimalConvertAndRightAlignTwoByteFiveDigitNumber_::
	homecall DecimalConvertAndRightAlignTwoByteFiveDigitNumber
	ret

LoadItemPriceTextbox_::
	homecall LoadItemPriceTextbox, PrintText, PrintText, PrintText
	ld a, $0
	ld [wTextSubfunction], a
	ret

GetTextByte::
	ld a, [wROMBank]
	push af
	ld a, [wTextBank]
	rst Bankswitch
	ld a, [hli]
	ld c, a
	pop af
	rst Bankswitch
	ld a, c
	ret

PrintText_JumpText::
	ld a, [wROMBank]
	push af
	ld a, [wTextBank]
	rst Bankswitch
	ld a, [hli]
	ld [wTextPointer], a
	ld a, [hl]
	ld [wTextPointer + 1], a
	pop af
	rst Bankswitch
	ret

