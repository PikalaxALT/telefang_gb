INCLUDE "includes.asm"

SECTION "SRAM 0", SRAM, BANK [0]
sSaveFile::
sROMName::
	ds $10

sOverworldData:: ds $80

	ds $80

sSaveGame::
sScriptData:: ds $100
sEventFlags:: flag_array NUM_EVENTS
sBackupAddressBook:: ds $1900
sSaveGameEnd::

	ds $2e0

sSaveFileEnd::

SECTION "SRAM 0b", SRAM [$bffd], BANK [2]
sSaveFileExists:: ds 1

sChecksum:: ds 2

SECTION "SRAM 1", SRAM, BANK [1]
sDMelo::
sDMelo1:: ds $200
sDMelo2:: ds $200
sDMelo3:: ds $200
sDMelo4:: ds $200
sDMelo5:: ds $200
sDMelo6:: ds $200
sDMelo7:: ds $200
sDMelo8:: ds $200

sItems:: ds $200 * 4

SECTION "SRAM 2", SRAM, BANK [2]
; Field 00 = species (db)
; Field 01 = level (db)
; Field 02 = FD (db)
; Field 03 = ??
; Field 04 = EXP half points (dw)
; Field 06 = ??
; Field 07 = ??
; Field 08 = ??
; Field 09 = ??
; Field 10 = Phone Number (5 bytes)
; Field 15 = ??
sAddressBook:: ds $10 * ADDRESS_BOOK_SIZE

SECTION "SRAM 2b", SRAM [$b000], BANK [2]
sIndoorVisitedMapSectionFlags:: ds $200
sOwnedDenjuuNicknames:: ds 6 * ADDRESS_BOOK_SIZE

SECTION "SRAM 2c", SRAM [$b800], BANK [2]
sAddressBookRingtones:: ds ADDRESS_BOOK_SIZE

SECTION "SRAM 3", SRAM, BANK [3]
sOAMAnimationsBackup:: ds 24 * $20

sIdxsOfDenjuuWhoCanCallPlayer:: ds ADDRESS_BOOK_SIZE

SECTION "SRAM 3b", SRAM [$b000], BANK [3]
sBGPalsBackup:: ds $40
sBGPalsBackupEnd::
