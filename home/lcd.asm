LCD: ; 324 (0:0324)
	push af
	ld a, [wc46d]
	cp $2
	jp nc, Func_0402
	push bc
	push hl
	ld a, [wc469]
	or a
	jp nz, Func_033b
	call Func_0425
	jr asm_037f

Func_033b: ; 33b (0:033b)
	ld a, [wc46d]
	or a
	jr nz, asm_0383
	ld hl, wc464
	ld a, [hli]
	sub $4
	ld b, a
	ld a, [rLY]
	cp b
	jr nc, .asm_0363
	ld a, [wcac1]
	or a
	jr nz, asm_037f
	ld a, [hli]
	ld [rWX], a
	ld a, [hl]
	ld [rWY], a
	ld a, b
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_0363
	ld a, b
	add $4
	ld b, a
.asm_0367
	ld a, [rLY]
	cp b
	jr c, .asm_0367
asm_036c
	xor a
	ld [rSCX], a
	ld [rSCY], a
Func_0371: ; 371 (0:0371)
	ld [wcac1], a
	ld a, $0
	ld [rLYC], a
	ld [wc3ca], a
	ld a, $83
	ld [rLCDC], a
asm_037f
	pop hl
	pop bc
	pop af
	reti

asm_0383
	ld a, [wc3e0]
	cp $4
	jr z, .asm_03bc
	ld hl, wc467
	ld a, [rLY]
	cp $5f
	jr nc, asm_036c
	ld a, [wcac1]
	cp $1
	jr z, .asm_03ae
	cp $0
	jr nz, asm_037f
	xor a
	ld [rSCX], a
	ld [rSCY], a
	ld a, $27
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_03ae
	ld a, [hl]
	ld [rSCX], a
	ld a, $5f
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr asm_037f

.asm_03bc
	ld a, [rLY]
	cp $6c
	jr nc, .asm_03f2
	ld a, [wcac1]
	cp $1
	jr z, .asm_03dc
	cp $0
	jr nz, asm_037f
	ld a, $7f
	ld [rSCY], a
	ld a, $14
	ld [rLYC], a
	ld a, $1
	ld [wcac1], a
	jr asm_037f

.asm_03dc
	ld a, [rLY]
	cp $18
	jr c, .asm_03dc
	ld a, [wc467]
	ld [rSCY], a
	ld a, $6c
	ld [rLYC], a
	ld a, $2
	ld [wcac1], a
	jr asm_037f

.asm_03f2
	ld a, [rLY]
	cp $70
	jr c, .asm_03f2
	ld a, $10
	ld [rSCY], a
	xor a
	ld [rSCX], a
	jp Func_0371

Func_0402: ; 402 (0:0402)
	push hl
	ld hl, wOAMAnimation06
	ld a, [wc957]
	or a
	jr nz, .asm_040f
	ld hl, wOAMAnimation01
.asm_040f
	ld a, [wc46d]
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, [hl]
	ld [rSCY], a
	ld a, [wc46d]
	inc a
	ld [wc46d], a
	pop hl
	pop af
	reti

Func_0425: ; 425 (0:0425)
	xor a
	ld [wcac1], a
	ld hl, wc460
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ld [hli], a
	ret

ClearMemory:
.asm_0431
	xor a
	ld [hli], a
	dec bc
	ld a, b
	or c
	jr nz, .asm_0431
	ret
