INCLUDE "includes.asm"
SECTION "Hram", HRAM
H_PushOAM:: ds $8

	ds $18

H_MusicID:: ds 1
H_SFX_ID:: ds 1
H_Ringtone:: ds 1
H_CurChannel:: ds 1
H_MusicCommand:: ds 1
H_FFA5:: ds 1
H_FFA6:: ds 1
H_FFA7:: ds 1
H_MusicEngineBuffer:: ds 1
H_PCM_ID:: ds 1
