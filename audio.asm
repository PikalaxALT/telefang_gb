INCLUDE "includes.asm"
INCLUDE "audio/engine.asm"

SECTION "bank 11", ROMX, BANK [$11]
	music_engine 11
SFXPointers_11: INCLUDE "audio/sfx.asm"
RingtonePointers_11: INCLUDE "audio/ringtones.asm"
MusicPointers_11:

SECTION "bank 12", ROMX, BANK [$12]
	music_engine 12
SFXPointers_12: INCLUDE "audio/sfx.asm"
MusicPointers_12: INCLUDE "audio/music_12.asm"
RingtonePointers_12: db $ff

SECTION "bank 20", ROMX, BANK [MUSIC_BANK_00]
	music_engine 20
SFXPointers_20: INCLUDE "audio/sfx.asm"
MusicPointers_20: INCLUDE "audio/music_20.asm"
RingtonePointers_20: db $ff

SECTION "bank 21", ROMX, BANK [MUSIC_BANK_01]
	music_engine 21
SFXPointers_21: INCLUDE "audio/sfx.asm"
MusicPointers_21: INCLUDE "audio/music_21.asm"
RingtonePointers_21: db $ff

SECTION "bank 22", ROMX, BANK [MUSIC_BANK_02]
	music_engine 22
SFXPointers_22: INCLUDE "audio/sfx.asm"
MusicPointers_22: INCLUDE "audio/music_22.asm"
RingtonePointers_22: db $ff

SECTION "bank 23", ROMX, BANK [MUSIC_BANK_03]
	music_engine 23
SFXPointers_23: INCLUDE "audio/sfx.asm"
MusicPointers_23: INCLUDE "audio/music_23.asm"
RingtonePointers_23: db $ff

SECTION "bank 24", ROMX, BANK [$24]
	music_engine 24
SFXPointers_24: INCLUDE "audio/sfx.asm"
RingtonePointers_24: INCLUDE "audio/ringtones.asm"
MusicPointers_24: 

SECTION "bank 7C", ROMX, BANK [$7c]
TitleScreenPCM:: INCBIN "audio/pcm/title.pcm"
TitleScreenPCMEnd::
