SECTION "VBlank Interrupt", ROM0 [$0040]
	jp VBlank ; 02e7

SECTION "HBlank Interrupt", ROM0 [$0048]
	jp LCD ; 0324

SECTION "Timer Interrupt", ROM0 [$0050]
	reti

SECTION "Serial Interrupt", ROM0 [$0058]
	jp Serial ; $1cb4

SECTION "Joypad Interrupt", ROM0 [$0060]
	reti
