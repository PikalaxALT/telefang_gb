Func_2ceb::
	homecall PrintItemNameAndPrice, PrintText, PrintText
	ld a, $0
	ld [wTextSubfunction], a
	ret

Func_2d03::
	homecall Func_3c91b
	ret

Func_2d10::
	homecall Func_2c92e, PrintText, PrintText, PrintText
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

