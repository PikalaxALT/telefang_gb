SECTION "ROM Names", HOME [$f61]
	charmap " ", $20 ; revert to ascii
	charmap "$", $00

IF DEF(POWER)
	db " TELEFANG POWER$"
ELSE
	db " TELEFANG SPEED$"
ENDC

SECTION "Home part 2", HOME [$f71]
INCLUDE "charmap.asm"
