SECTION "VBlank Interrupt", HOME [$0040]
	jp VBlank ; 02e7

SECTION "HBlank Interrupt", HOME [$0048]
	jp LCD ; 0324

SECTION "Timer Interrupt", HOME [$0050]
	reti

SECTION "Serial Interrupt", HOME [$0058]
	jp Serial ; $1cb4

SECTION "Joypad Interrupt", HOME [$0060]
	reti
