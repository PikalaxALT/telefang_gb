CopyROMName: ; f3f (0:0f3f)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	ld de, ROMName
	ld hl, sROMName
	ld bc, ROMNameEnd - ROMName
.asm_0f51
	ld a, [de]
	ld [hli], a
	inc de
	dec bc
	ld a, b
	or c
	jr nz, .asm_0f51
	call CalculateChecksum
	xor a
	ld [MBC3SRamEnable], a
	ret

ROMName::
INCLUDE "home/rom_name.asm"
ROMNameEnd::

CalculateChecksum: ; f71 (0:0f71)
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	xor a
	ld [sChecksum], a
	ld [sChecksum + 1], a
	ld de, sSaveFile
	ld bc, sSaveFileEnd - sSaveFile
	ld hl, $0
.asm_0f8a
	push bc
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	inc de
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .asm_0f8a
	ld a, l
	ld [sChecksum + 1], a
	ld a, h
	ld [sChecksum], a
	ret

ValidateSave::
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	ld hl, ROMName
	ld de, sROMName
	ld bc, $10
.check_title
	push bc
	ld a, [hli]
	ld b, a
	ld a, [de]
	cp b
	jr nz, .title_failed
	inc de
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .check_title
	xor a
	ld [wc433], a
	ld [wc434], a
	ld hl, $0
	ld de, sSaveFile
	ld bc, sSaveFileEnd - sSaveFile
.check_sum
	push bc
	ld a, [de]
	ld c, a
	ld b, $0
	add hl, bc
	inc de
	pop bc
	dec bc
	ld a, b
	or c
	jr nz, .check_sum
	ld a, l
	ld b, a
	ld a, h
	ld c, a
	ld a, [sChecksum + 1]
	cp b
	jr nz, .sum_failed
	ld a, [sChecksum]
	cp c
	jr nz, .sum_failed
	xor a
	ret

.title_failed
	pop bc
	ld a, $1
	ret

.sum_failed
	ld a, $2
	ret

DeleteSaveFile::
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	xor a
	ld [MBC3SRamBank], a
	ld hl, sSaveFile
	ld bc, sChecksum + 1 - sSaveFile
.asm_1005
	xor a
	ld [hli], a
	dec bc
	ld a, c
	or b
	jr nz, .asm_1005
	xor a
	ld [s0_bffd], a
	jp CopyROMName

ClearSRAM::
	ld a, SRAM_ENABLE
	ld [MBC3SRamEnable], a
	ld a, $1
	ld [MBC3SRamBank], a
	call ClearSRAMBank
	ld a, $2
	ld [MBC3SRamBank], a
	call ClearSRAMBank
	ld a, $3
	ld [MBC3SRamBank], a
	call ClearSRAMBank
	xor a
	ld [MBC3SRamEnable], a
	ret

ClearSRAMBank: ; 1035 (0:1035)
	ld hl, s1_a000
	ld bc, $2000 ; size of an SRAM bank
.asm_103b
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_103b
	ret
