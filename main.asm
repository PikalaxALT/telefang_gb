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
	dr $2ded9, $2e8fa

Data_2e8fa::
	dr $2e8fa, $30000

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
Func_68000::
	dr $68000, $6804c

Func_6804c::
	dr $6804c, $68103

Func_68103::
	dr $68103, $681d7

Func_681d7::
	dr $681d7, $68290

Func_68290::
	dr $68290, $6839c

Func_6839c::
	dr $6839c, $683f0

Func_683f0::
	dr $683f0, $68444

Func_68444::
	dr $68444, $68497

Func_68497::
	dr $68497, $68598

Func_68598::
	dr $68598, $686f2

Func_686f2::
	dr $686f2, $6877a

Func_6877a::
	dr $6877a, $687e1

Func_687e1::
	dr $687e1, $68829

Func_68829::
	dr $68829, $688c9

Func_688c9::
	dr $688c9, $6890e

Func_6890e::
	dr $6890e, $68a2d

Func_68a2d::
	dr $68a2d, $68bc7

Func_68bc7::
	dr $68bc7, $68d43

Func_68d43::
	dr $68d43, $68e59

Func_68e59::
	dr $68e59, $68ebf

Func_68ebf::
	dr $68ebf, $68f25

Func_68f25::
	dr $68f25, $68f8b

Func_68f8b::
	dr $68f8b, $68fdc

Func_68fdc::
	dr $68fdc, $69042

Func_69042::
	dr $69042, $690a8

Func_690a8::
	dr $690a8, $69133

Func_69133::
	dr $69133, $6921d

Func_6921d::
	dr $6921d, $692eb

Func_692eb::
	dr $692eb, $693cd

Func_693cd::
	dr $693cd, $694af

Func_694af::
	dr $694af, $695c7

Func_695c7::
	dr $695c7, $696c8

Func_696c8::
	dr $696c8, $6974c

Func_6974c::
	dr $6974c, $69828

Func_69828::
	dr $69828, $69913

Func_69913::
	dr $69913, $69961

Func_69961::
	dr $69961, $699e5

Func_699e5::
	dr $699e5, $69a69

Func_69a69::
	dr $69a69, $69acb

Func_69acb::
	dr $69acb, $69cd0

Func_69cd0::
	dr $69cd0, $69f99

Func_69f99::
	dr $69f99, $6a15a

Func_6a15a::
	dr $6a15a, $6a35e

Func_6a35e::
	dr $6a35e, $6a401

Func_6a401::
	dr $6a401, $6a618

Func_6a618::
	dr $6a618, $6a774

Func_6a774::
	dr $6a774, $6a954

Func_6a954::
	dr $6a954, $6ab1e

Func_6ab1e::
	dr $6ab1e, $6ab5e

Func_6ab5e::
	dr $6ab5e, $6ac98

Func_6ac98::
	dr $6ac98, $6ad72

Func_6ad72::
	dr $6ad72, $6aea7

Func_6aea7::
	dr $6aea7, $6afdc

Func_6afdc::
	dr $6afdc, $6b1ad

Func_6b1ad::
	dr $6b1ad, $6c000

SECTION "bank 1B", ROMX, BANK [$1b]
Func_6c000::
	dr $6c000, $6c082

Func_6c082::
	dr $6c082, $6c11b

Func_6c11b::
	dr $6c11b, $6c1b4

Func_6c1b4::
	dr $6c1b4, $6c21d

Func_6c21d::
	dr $6c21d, $6c27e

Func_6c27e::
	dr $6c27e, $6c556

Func_6c556::
	dr $6c556, $6c676

Func_6c676::
	dr $6c676, $6c6d4

Func_6c6d4::
	dr $6c6d4, $6c732

Func_6c732::
	dr $6c732, $6c790

Func_6c790::
	dr $6c790, $6c8f7

Func_6c8f7::
	dr $6c8f7, $6ca8c

Func_6ca8c::
	dr $6ca8c, $6cc6a

Func_6cc6a::
	dr $6cc6a, $6ce90

Func_6ce90::
	dr $6ce90, $6d0d3

Func_6d0d3::
	dr $6d0d3, $6d30d

Func_6d30d::
	dr $6d30d, $6d462

Func_6d462::
	dr $6d462, $6d5aa

Func_6d5aa::
	dr $6d5aa, $6d6ff

Func_6d6ff::
	dr $6d6ff, $6dc84

Func_6dc84::
	dr $6dc84, $6dd4b

Func_6dd4b::
	dr $6dd4b, $6e0f1

Func_6e0f1::
	dr $6e0f1, $6e304

Func_6e304::
	dr $6e304, $6e457

Func_6e457::
	dr $6e457, $6e5af

Func_6e5af::
	dr $6e5af, $6e733

Func_6e733::
	dr $6e733, $6e853

Func_6e853::
	dr $6e853, $6e94a

Func_6e94a::
	dr $6e94a, $6ec18

Func_6ec18::
	dr $6ec18, $6eec0

Func_6eec0::
	dr $6eec0, $70000

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
	dr $a5525, $a6b69

Data_a6b69::
	dr $a6b69, $a8000

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
	dr $dc000, $ddd5f

Phone1GFX:: INCBIN "gfx/phone/phone1.2bpp"
Phone2GFX:: INCBIN "gfx/phone/phone2.2bpp"
Phone3GFX:: INCBIN "gfx/phone/phone3.2bpp"
	dr $de95f, $e0000

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

SECTION "bank 75", ROMX, BANK [$75]
	dr $1d4000, $1d8000

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
