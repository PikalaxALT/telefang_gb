INCLUDE "includes.asm"
SECTION "Hram", HRAM
H_PushOAM:: ds $8

	ds $18

H_MusicID:: ds 1
H_SFX_ID:: ds 1
H_FFA2:: ds 1
	ds 6
H_FFA9:: ds 1
