INCLUDE "includes.asm"
INCLUDE "rst.asm"
INCLUDE "interrupts.asm"

INCLUDE "home.asm"

SECTION "bank 01", ROMX, BANK [$01]
	dr $4000, $8000

SECTION "bank 02", ROMX, BANK [$02]
	dr $8000, $8648

Func_8648::
	dr $8648, $872e

Func_872e::
	dr $872e, $8b8b

Func_8b8b::
	dr $8b8b, $c000

SECTION "bank 03", ROMX, BANK [$03]
Func_c000::
	dr $c000, $c1af

Func_c1af::
	dr $c1af, $c320

Func_c320::
	dr $c320, $f682

Func_f682::
	dr $f682, $fb3e

Func_fb3e::
	dr $fb3e, $fb8d

Func_fb8d::
	dr $fb8d, $10000

SECTION "bank 04", ROMX, BANK [$04]
	dr $10000, $14000

SECTION "bank 05", ROMX, BANK [$05]
	dr $14000, $18000

SECTION "bank 06", ROMX, BANK [$06]
Data_18000::
	dr $18000, $1c000

SECTION "bank 07", ROMX, BANK [$07]
PalPackets_1c000::
	dr $1c000, $20000

SECTION "bank 08", ROMX, BANK [$08]
Pointers_20000::
	dr $20000, $24000

SECTION "bank 09", ROMX, BANK [$09]
Pointers_24000::
	dr $24000, $28000

SECTION "bank 0A", ROMX, BANK [$0a]
Pointers_28000::
	dr $28000, $2c000

SECTION "bank 0B", ROMX, BANK [$0b]
Data_2c000::
	dr $2c000, $2c100

Func_2c100::
	dr $2c100, $2c766

Func_2c766::
	dr $2c766, $2c7ed

Func_2c7ed::
	dr $2c7ed, $2d99b

Func_2d99b::
	dr $2d99b, $2ded9

Func_2ded9::
	dr $2ded9, $30000

SECTION "bank 0C", ROMX, BANK [$0c]
	dr $30000, $33ac4

Pointers_33ac4::
	dr $33ac4, $34000

SECTION "bank 0D", ROMX, BANK [$0d]
Palettes_34000::
	dr $34000, $35d80

Palettes_35d80::
	dr $35d80, $38000

SECTION "bank 0E", ROMX, BANK [$0e]
PalPackets_38000::
	dr $38000, $38120

Pointers_38120::
	dr $38120, $3c000

SECTION "bank 0F", ROMX, BANK [$0f]
	dr $3c000, $40000

SECTION "bank 10", ROMX, BANK [$10]
	dr $40000, $44000

SECTION "bank 11", ROMX, BANK [$11]
	dr $44000, $48000

SECTION "bank 12", ROMX, BANK [$12]
	dr $48000, $4c000

SECTION "bank 13", ROMX, BANK [$13]
Pointers_4c000::
	dr $4c000, $50000

SECTION "bank 14", ROMX, BANK [$14]
Pointers_50000::
	dr $50000, $54000

SECTION "bank 15", ROMX, BANK [$15]
Pointers_54000::
	dr $54000, $58000

SECTION "bank 16", ROMX, BANK [$16]
Pointers_58000::
	dr $58000, $5c000

SECTION "bank 17", ROMX, BANK [$17]
Pointers_5c000::
	dr $5c000, $60000

SECTION "bank 18", ROMX, BANK [$18]
Pointers_60000::
	dr $60000, $64000

SECTION "bank 19", ROMX, BANK [$19]
Pointers_64000::
	dr $64000, $68000

SECTION "bank 1A", ROMX, BANK [$1a]
	dr $68000, $6c000

SECTION "bank 1B", ROMX, BANK [$1b]
	dr $6c000, $70000

SECTION "bank 1C", ROMX, BANK [$1c]
	dr $70000, $74000

SECTION "bank 1D", ROMX, BANK [$1d]
	dr $74000, $74ff2

Func_74ff2::
	dr $74ff2, $753f8

Func_753f8::
	dr $753f8, $758f8

Func_758f8::
	dr $758f8, $78000

SECTION "bank 1E", ROMX, BANK [$1e]
	dr $78000, $7c000

SECTION "bank 1F", ROMX, BANK [$1f]
	dr $7c000, $7c61b

Func_7c61b::
	dr $7c61b, $80000

SECTION "bank 20", ROMX, BANK [$20]
UpdateSound20::
	dr $80000, $84000

SECTION "bank 21", ROMX, BANK [$21]
	dr $84000, $88000

SECTION "bank 22", ROMX, BANK [$22]
	dr $88000, $8c000

SECTION "bank 23", ROMX, BANK [$23]
	dr $8c000, $90000

SECTION "bank 24", ROMX, BANK [$24]
	dr $90000, $94000

SECTION "bank 25", ROMX, BANK [$25]
	dr $94000, $98000

SECTION "bank 26", ROMX, BANK [$26]
	dr $98000, $9c000

SECTION "bank 27", ROMX, BANK [$27]
	dr $9c000, $a0000

SECTION "bank 28", ROMX, BANK [$28]
	dr $a0000, $a4000

SECTION "bank 29", ROMX, BANK [$29]
Func_a4000::
	dr $a4000, $a40ef

Func_a40ef::
	dr $a40ef, $a42a3

Func_a42a3::
	dr $a42a3, $a42e5

Func_a42e5::
	dr $a42e5, $a4c9b

Func_a4c9b::
	dr $a4c9b, $a4e02

Func_a4e02::
	dr $a4e02, $a4e12

Func_a4e12::
	dr $a4e12, $a5418

Func_a5418::
	dr $a5418, $a5525

Func_a5525::
	dr $a5525, $a8000

SECTION "bank 2A", ROMX, BANK [$2a]
	dr $a8000, $a8539

Func_a8539::
	dr $a8539, $a8d20

Func_a8d20::
	dr $a8d20, $ac000

SECTION "bank 2B", ROMX, BANK [$2b]
	dr $ac000, $b0000

SECTION "bank 2C", ROMX, BANK [$2c]
	dr $b0000, $b4000

SECTION "bank 2D", ROMX, BANK [$2d]
	dr $b4000, $b8000

SECTION "bank 2E", ROMX, BANK [$2e]
	dr $b8000, $bc000

SECTION "bank 2F", ROMX, BANK [$2f]
	dr $bc000, $c0000

SECTION "bank 30", ROMX, BANK [$30]
	dr $c0000, $c4000

SECTION "bank 31", ROMX, BANK [$31]
	dr $c4000, $c8000

SECTION "bank 32", ROMX, BANK [$32]
	dr $c8000, $cc000

SECTION "bank 33", ROMX, BANK [$33]
	dr $cc000, $d0000

SECTION "bank 34", ROMX, BANK [$34]
	dr $d0000, $d4000

SECTION "bank 35", ROMX, BANK [$35]
	dr $d4000, $d8000

SECTION "bank 36", ROMX, BANK [$36]
	dr $d8000, $dc000

SECTION "bank 37", ROMX, BANK [$37]
	dr $dc000, $e0000

SECTION "bank 38", ROMX, BANK [$38]
	dr $e0000, $e4000

SECTION "bank 39", ROMX, BANK [$39]
	dr $e4000, $e8000

SECTION "bank 3A", ROMX, BANK [$3a]
	dr $e8000, $ec000

SECTION "bank 3B", ROMX, BANK [$3b]
	dr $ec000, $f0000

SECTION "bank 3C", ROMX, BANK [$3c]
	dr $f0000, $f4000

SECTION "bank 3D", ROMX, BANK [$3d]
	dr $f4000, $f8000

SECTION "bank 3E", ROMX, BANK [$3e]
Pointers_f8000::
	dr $f8000, $fc000

SECTION "bank 3F", ROMX, BANK [$3f]
Pointers_fc000::
	dr $fc000, $100000

SECTION "bank 40", ROMX, BANK [$40]
	dr $100000, $104000

SECTION "bank 41", ROMX, BANK [$41]
	dr $104000, $108000

SECTION "bank 42", ROMX, BANK [$42]
	dr $108000, $10c000

SECTION "bank 43", ROMX, BANK [$43]
	dr $10c000, $110000

SECTION "bank 44", ROMX, BANK [$44]
	dr $110000, $114000

SECTION "bank 45", ROMX, BANK [$45]
	dr $114000, $118000

SECTION "bank 46", ROMX, BANK [$46]
	dr $118000, $11c000

SECTION "bank 47", ROMX, BANK [$47]
	dr $11c000, $120000

SECTION "bank 48", ROMX, BANK [$48]
	dr $120000, $124000

SECTION "bank 49", ROMX, BANK [$49]
	dr $124000, $128000

SECTION "bank 4A", ROMX, BANK [$4a]
	dr $128000, $12c000

SECTION "bank 4B", ROMX, BANK [$4b]
	dr $12c000, $130000

SECTION "bank 4C", ROMX, BANK [$4c]
	dr $130000, $134000

SECTION "bank 4D", ROMX, BANK [$4d]
	dr $134000, $138000

SECTION "bank 4E", ROMX, BANK [$4e]
	dr $138000, $13c000

SECTION "bank 4F", ROMX, BANK [$4f]
	dr $13c000, $140000

SECTION "bank 50", ROMX, BANK [$50]
	dr $140000, $144000

SECTION "bank 51", ROMX, BANK [$51]
	dr $144000, $148000

SECTION "bank 52", ROMX, BANK [$52]
	dr $148000, $14c000

SECTION "bank 53", ROMX, BANK [$53]
	dr $14c000, $150000

SECTION "bank 54", ROMX, BANK [$54]
	dr $150000, $154000

SECTION "bank 55", ROMX, BANK [$55]
	dr $154000, $158000

SECTION "bank 56", ROMX, BANK [$56]
	dr $158000, $15c000

SECTION "bank 57", ROMX, BANK [$57]
	dr $15c000, $160000

SECTION "bank 58", ROMX, BANK [$58]
	dr $160000, $164000

SECTION "bank 59", ROMX, BANK [$59]
	dr $164000, $168000

SECTION "bank 5A", ROMX, BANK [$5a]
	dr $168000, $16c000

SECTION "bank 5B", ROMX, BANK [$5b]
	dr $16c000, $170000

SECTION "bank 5C", ROMX, BANK [$5c]
	dr $170000, $174000

SECTION "bank 5D", ROMX, BANK [$5d]
	dr $174000, $178000

SECTION "bank 5E", ROMX, BANK [$5e]
	dr $178000, $17c000

SECTION "bank 5F", ROMX, BANK [$5f]
	dr $17c000, $180000

SECTION "bank 60", ROMX, BANK [$60]
	dr $180000, $184000

SECTION "bank 61", ROMX, BANK [$61]
	dr $184000, $188000

SECTION "bank 62", ROMX, BANK [$62]
	dr $188000, $18c000

SECTION "bank 63", ROMX, BANK [$63]
	dr $18c000, $190000

SECTION "bank 64", ROMX, BANK [$64]
	dr $190000, $194000

SECTION "bank 65", ROMX, BANK [$65]
	dr $194000, $198000

SECTION "bank 66", ROMX, BANK [$66]
	dr $198000, $19c000

SECTION "bank 67", ROMX, BANK [$67]
	dr $19c000, $1a0000

SECTION "bank 68", ROMX, BANK [$68]
	dr $1a0000, $1a4000

SECTION "bank 69", ROMX, BANK [$69]
	dr $1a4000, $1a8000

SECTION "bank 6A", ROMX, BANK [$6a]
	dr $1a8000, $1ac000

SECTION "bank 6B", ROMX, BANK [$6b]
SFX_6B_4000::
	dr $1ac000, $1ac380

SFX_6B_4380::
	dr $1ac380, $1ac700

SFX_6B_4700::
	dr $1ac700, $1aca80

SFX_6B_4a80::
	dr $1aca80, $1ace00

SFX_6B_4e00::
	dr $1ace00, $1ad180

SFX_6B_5180::
	dr $1ad180, $1ad500

SFX_6B_5500::
	dr $1ad500, $1ad880

SFX_6B_5880::
	dr $1ad880, $1adc00

SFX_6B_5c00::
	dr $1adc00, $1adf80

SFX_6B_5f80::
	dr $1adf80, $1ae300

SFX_6B_6300::
	dr $1ae300, $1ae680

SFX_6B_6680::
	dr $1ae680, $1aea00

SFX_6B_6a00::
	dr $1aea00, $1aed80

SFX_6B_6d80::
	dr $1aed80, $1af100

SFX_6B_7100::
	dr $1af100, $1af480

SFX_6B_7480::
	dr $1af480, $1af800

SFX_6B_7800::
	dr $1af800, $1afb80

SFX_6B_7b80::
	dr $1afb80, $1aff00

SECTION "bank 6C", ROMX, BANK [$6c]
SFX_6C_4000::
	dr $1b0000, $1b0380

SFX_6C_4380::
	dr $1b0380, $1b0700

SFX_6C_4700::
	dr $1b0700, $1b0a80

SFX_6C_4a80::
	dr $1b0a80, $1b0e00

SFX_6C_4e00::
	dr $1b0e00, $1b1180

SFX_6C_5180::
	dr $1b1180, $1b1500

SFX_6C_5500::
	dr $1b1500, $1b1880

SFX_6C_5880::
	dr $1b1880, $1b1c00

SFX_6C_5c00::
	dr $1b1c00, $1b1f80

SFX_6C_5f80::
	dr $1b1f80, $1b2300

SFX_6C_6300::
	dr $1b2300, $1b2680

SFX_6C_6680::
	dr $1b2680, $1b2a00

SFX_6C_6a00::
	dr $1b2a00, $1b2d80

SFX_6C_6d80::
	dr $1b2d80, $1b3100

SFX_6C_7100::
	dr $1b3100, $1b3480

SFX_6C_7480::
	dr $1b3480, $1b3800

SFX_6C_7800::
	dr $1b3800, $1b3b80

SFX_6C_7b80::
	dr $1b3b80, $1b3f00

SECTION "bank 6D", ROMX, BANK [$6d]
SFX_6D_4000::
	dr $1b4000, $1b4380

SFX_6D_4380::
	dr $1b4380, $1b4700

SFX_6D_4700::
	dr $1b4700, $1b4a80

SFX_6D_4a80::
	dr $1b4a80, $1b4e00

SFX_6D_4e00::
	dr $1b4e00, $1b5180

SFX_6D_5180::
	dr $1b5180, $1b5500

SFX_6D_5500::
	dr $1b5500, $1b5880

SFX_6D_5880::
	dr $1b5880, $1b5c00

SFX_6D_5c00::
	dr $1b5c00, $1b5f80

SFX_6D_5f80::
	dr $1b5f80, $1b6300

SFX_6D_6300::
	dr $1b6300, $1b6680

SFX_6D_6680::
	dr $1b6680, $1b6a00

SFX_6D_6a00::
	dr $1b6a00, $1b6d80

SFX_6D_6d80::
	dr $1b6d80, $1b7100

SFX_6D_7100::
	dr $1b7100, $1b7480

SFX_6D_7480::
	dr $1b7480, $1b7800

SFX_6D_7800::
	dr $1b7800, $1b7b80

SFX_6D_7b80::
	dr $1b7b80, $1b7f00

SECTION "bank 6E", ROMX, BANK [$6e]
SFX_6E_4000::
	dr $1b8000, $1b8380

SFX_6E_4380::
	dr $1b8380, $1b8700

SFX_6E_4700::
	dr $1b8700, $1b8a80

SFX_6E_4a80::
	dr $1b8a80, $1b8e00

SFX_6E_4e00::
	dr $1b8e00, $1b9180

SFX_6E_5180::
	dr $1b9180, $1b9500

SFX_6E_5500::
	dr $1b9500, $1b9880

SFX_6E_5880::
	dr $1b9880, $1b9c00

SFX_6E_5c00::
	dr $1b9c00, $1b9f80

SFX_6E_5f80::
	dr $1b9f80, $1ba300

SFX_6E_6300::
	dr $1ba300, $1ba680

SFX_6E_6680::
	dr $1ba680, $1baa00

SFX_6E_6a00::
	dr $1baa00, $1bad80

SFX_6E_6d80::
	dr $1bad80, $1bb100

SFX_6E_7100::
	dr $1bb100, $1bb480

SFX_6E_7480::
	dr $1bb480, $1bb800

SFX_6E_7800::
	dr $1bb800, $1bbb80

SFX_6E_7b80::
	dr $1bbb80, $1bbf00

SECTION "bank 6F", ROMX, BANK [$6f]
SFX_6F_4000::
	dr $1bc000, $1bc380

SFX_6F_4380::
	dr $1bc380, $1bc700

SFX_6F_4700::
	dr $1bc700, $1bca80

SFX_6F_4a80::
	dr $1bca80, $1bce00

SFX_6F_4e00::
	dr $1bce00, $1bd180

SFX_6F_5180::
	dr $1bd180, $1bd500

SFX_6F_5500::
	dr $1bd500, $1bd880

SFX_6F_5880::
	dr $1bd880, $1bdc00

SFX_6F_5c00::
	dr $1bdc00, $1bdf80

SFX_6F_5f80::
	dr $1bdf80, $1be300

SFX_6F_6300::
	dr $1be300, $1be680

SFX_6F_6680::
	dr $1be680, $1bea00

SFX_6F_6a00::
	dr $1bea00, $1bed80

SFX_6F_6d80::
	dr $1bed80, $1bf100

SFX_6F_7100::
	dr $1bf100, $1bf480

SFX_6F_7480::
	dr $1bf480, $1bf800

SFX_6F_7800::
	dr $1bf800, $1bfb80

SFX_6F_7b80::
	dr $1bfb80, $1bff00

SECTION "bank 70", ROMX, BANK [$70]
SFX_70_4000::
	dr $1c0000, $1c0380

SFX_70_4380::
	dr $1c0380, $1c0700

SFX_70_4700::
	dr $1c0700, $1c0a80

SFX_70_4a80::
	dr $1c0a80, $1c0e00

SFX_70_4e00::
	dr $1c0e00, $1c1180

SFX_70_5180::
	dr $1c1180, $1c1500

SFX_70_5500::
	dr $1c1500, $1c1880

SFX_70_5880::
	dr $1c1880, $1c1c00

SFX_70_5c00::
	dr $1c1c00, $1c1f80

SFX_70_5f80::
	dr $1c1f80, $1c2300

SFX_70_6300::
	dr $1c2300, $1c2680

SFX_70_6680::
	dr $1c2680, $1c2a00

SFX_70_6a00::
	dr $1c2a00, $1c2d80

SFX_70_6d80::
	dr $1c2d80, $1c3100

SFX_70_7100::
	dr $1c3100, $1c3480

SFX_70_7480::
	dr $1c3480, $1c3800

SFX_70_7800::
	dr $1c3800, $1c3b80

SFX_70_7b80::
	dr $1c3b80, $1c3f00

SECTION "bank 71", ROMX, BANK [$71]
SFX_71_4000::
	dr $1c4000, $1c4380

SFX_71_4380::
	dr $1c4380, $1c4700

SFX_71_4700::
	dr $1c4700, $1c4a80

SFX_71_4a80::
	dr $1c4a80, $1c4e00

SFX_71_4e00::
	dr $1c4e00, $1c5180

SFX_71_5180::
	dr $1c5180, $1c5500

SFX_71_5500::
	dr $1c5500, $1c5880

SFX_71_5880::
	dr $1c5880, $1c5c00

SFX_71_5c00::
	dr $1c5c00, $1c5f80

SFX_71_5f80::
	dr $1c5f80, $1c6300

SFX_71_6300::
	dr $1c6300, $1c6680

SFX_71_6680::
	dr $1c6680, $1c6a00

SFX_71_6a00::
	dr $1c6a00, $1c6d80

SFX_71_6d80::
	dr $1c6d80, $1c7100

SFX_71_7100::
	dr $1c7100, $1c7480

SFX_71_7480::
	dr $1c7480, $1c7800

SFX_71_7800::
	dr $1c7800, $1c7b80

SFX_71_7b80::
	dr $1c7b80, $1c7f00

SECTION "bank 72", ROMX, BANK [$72]
SFX_72_4000::
	dr $1c8000, $1c8380

SFX_72_4380::
	dr $1c8380, $1c8700

SFX_72_4700::
	dr $1c8700, $1c8a80

SFX_72_4a80::
	dr $1c8a80, $1c8e00

SFX_72_4e00::
	dr $1c8e00, $1c9180

SFX_72_5180::
	dr $1c9180, $1c9500

SFX_72_5500::
	dr $1c9500, $1c9880

SFX_72_5880::
	dr $1c9880, $1c9c00

SFX_72_5c00::
	dr $1c9c00, $1c9f80

SFX_72_5f80::
	dr $1c9f80, $1ca300

SFX_72_6300::
	dr $1ca300, $1ca680

SFX_72_6680::
	dr $1ca680, $1caa00

SFX_72_6a00::
	dr $1caa00, $1cad80

SFX_72_6d80::
	dr $1cad80, $1cb100

SFX_72_7100::
	dr $1cb100, $1cb480

SFX_72_7480::
	dr $1cb480, $1cb800

SFX_72_7800::
	dr $1cb800, $1cbb80

SFX_72_7b80::
	dr $1cbb80, $1cbf00

SECTION "bank 73", ROMX, BANK [$73]
SFX_73_4000::
	dr $1cc000, $1cc380

SFX_73_4380::
	dr $1cc380, $1cc700

SFX_73_4700::
	dr $1cc700, $1cca80

SFX_73_4a80::
	dr $1cca80, $1cce00

SFX_73_4e00::
	dr $1cce00, $1cd180

SFX_73_5180::
	dr $1cd180, $1cd500

SFX_73_5500::
	dr $1cd500, $1cd880

SFX_73_5880::
	dr $1cd880, $1cdc00

SFX_73_5c00::
	dr $1cdc00, $1cdf80

SFX_73_5f80::
	dr $1cdf80, $1ce300

SFX_73_6300::
	dr $1ce300, $1ce680

SFX_73_6680::
	dr $1ce680, $1cea00

SFX_73_6a00::
	dr $1cea00, $1ced80

SFX_73_6d80::
	dr $1ced80, $1cf100

SFX_73_7100::
	dr $1cf100, $1cf480

SFX_73_7480::
	dr $1cf480, $1cf800

SFX_73_7800::
	dr $1cf800, $1cfb80

SFX_73_7b80::
	dr $1cfb80, $1cff00

SECTION "bank 74", ROMX, BANK [$74]
SFX_74_4000::
	dr $1d0000, $1d0380

SFX_74_4380::
	dr $1d0380, $1d0700

SFX_74_4700::
	dr $1d0700, $1d0a80

SFX_74_4a80::
	dr $1d0a80, $1d0e00

SFX_74_4e00::
	dr $1d0e00, $1d1180

SFX_74_5180::
	dr $1d1180, $1d1500

SFX_74_5500::
	dr $1d1500, $1d1880

SFX_74_5880::
	dr $1d1880, $1d1c00

SFX_74_5c00::
	dr $1d1c00, $1d1f80

SFX_74_5f80::
	dr $1d1f80, $1d2300

SFX_74_6300::
	dr $1d2300, $1d2680

SFX_74_6680::
	dr $1d2680, $1d2a00

SFX_74_6a00::
	dr $1d2a00, $1d2d80

SFX_74_6d80::
	dr $1d2d80, $1d3100

SFX_74_7100::
	dr $1d3100, $1d3480

SFX_74_7480::
	dr $1d3480, $1d3800

SFX_74_7800::
	dr $1d3800, $1d3b80

SFX_74_7b80::
	dr $1d3b80, $1d3f00

SECTION "bank 75", ROMX, BANK [$75]
	dr $1d4000, $1d8000

SECTION "bank 76", ROMX, BANK [$76]
	dr $1d8000, $1dc000

SECTION "bank 77", ROMX, BANK [$77]
	dr $1dc000, $1e0000

SECTION "bank 78", ROMX, BANK [$78]
	dr $1e0000, $1e4000

SECTION "bank 79", ROMX, BANK [$79]
	dr $1e4000, $1e8000

SECTION "bank 7A", ROMX, BANK [$7a]
	dr $1e8000, $1ec000

SECTION "bank 7B", ROMX, BANK [$7b]
	dr $1ec000, $1f0000

SECTION "bank 7C", ROMX, BANK [$7c]
	dr $1f0000, $1f4000

SECTION "bank 7D", ROMX, BANK [$7d]
SFX_7D_4000::
	dr $1f4000, $1f4380

SFX_7D_4380::
	dr $1f4380, $1f4700

SFX_7D_4700::
	dr $1f4700, $1f4a80

SFX_7D_4a80::
	dr $1f4a80, $1f4e00

SFX_7D_4e00::
	dr $1f4e00, $1f5180

SFX_7D_5180::
	dr $1f5180, $1f5500

SFX_7D_5500::
	dr $1f5500, $1f5880

SFX_7D_5880::
	dr $1f5880, $1f5c00

SFX_7D_5c00::
	dr $1f5c00, $1f5f80

SFX_7D_5f80::
	dr $1f5f80, $1f6300

SFX_7D_6300::
	dr $1f6300, $1f6680

SFX_7D_6680::
	dr $1f6680, $1f6a00

SFX_7D_6a00::
	dr $1f6a00, $1f6d80

SFX_7D_6d80::
	dr $1f6d80, $1f7100

SFX_7D_7100::
	dr $1f7100, $1f7480

SFX_7D_7480::
	dr $1f7480, $1f7800

SFX_7D_7800::
	dr $1f7800, $1f7b80

SFX_7D_7b80::
	dr $1f7b80, $1f7f00

SECTION "bank 7E", ROMX, BANK [$7e]
SFX_7E_4000::
	dr $1f8000, $1f8380

SFX_7E_4380::
	dr $1f8380, $1f8700

SFX_7E_4700::
	dr $1f8700, $1f8a80

SFX_7E_4a80::
	dr $1f8a80, $1f8e00

SFX_7E_4e00::
	dr $1f8e00, $1f9180

SFX_7E_5180::
	dr $1f9180, $1f9500

SFX_7E_5500::
	dr $1f9500, $1f9880

SFX_7E_5880::
	dr $1f9880, $1f9c00

SFX_7E_5c00::
	dr $1f9c00, $1f9f80

SFX_7E_5f80::
	dr $1f9f80, $1fa300

SFX_7E_6300::
	dr $1fa300, $1fa680

SFX_7E_6680::
	dr $1fa680, $1faa00

SFX_7E_6a00::
	dr $1faa00, $1fad80

SFX_7E_6d80::
	dr $1fad80, $1fb100

SFX_7E_7100::
	dr $1fb100, $1fb480

SFX_7E_7480::
	dr $1fb480, $1fb800

SFX_7E_7800::
	dr $1fb800, $1fbb80

SFX_7E_7b80::
	dr $1fbb80, $1fbf00

SECTION "bank 7F", ROMX, BANK [$7f]
SFX_7F_4000::
	dr $1fc000, $1fc380

SFX_7F_4380::
	dr $1fc380, $1fc700

SFX_7F_4700::
	dr $1fc700, $1fca80

SFX_7F_4a80::
	dr $1fca80, $1fce00

SFX_7F_4e00::
	dr $1fce00, $1fd180

SFX_7F_5180::
	dr $1fd180, $1fd500

SFX_7F_5500::
	dr $1fd500, $1fd880

SFX_7F_5880::
	dr $1fd880, $1fdc00

SFX_7F_5c00::
	dr $1fdc00, $1fdf80

SFX_7F_5f80::
	dr $1fdf80, $1fe300

SFX_7F_6300::
	dr $1fe300, $1fe680

SFX_7F_6680::
	dr $1fe680, $1fea00

SFX_7F_6a00::
	dr $1fea00, $1fed80

SFX_7F_6d80::
	dr $1fed80, $1ff100

SFX_7F_7100::
	dr $1ff100, $1ff480

SFX_7F_7480::
	dr $1ff480, $1ff800

SFX_7F_7800::
	dr $1ff800, $1ffb80

SFX_7F_7b80::
	dr $1ffb80, $1fff00
