PlayIntroMovie: ; 80bf (2:40bf)
	ld a, [hJoyNew]
	and A_BUTTON | START
	jr z, .asm_80d1
	ld a, [wc3e1]
	cp $20
	jr nc, .asm_80d1
	ld a, $20
	ld [wc3e1], a
.asm_80d1
	ld a, [wc3e1]
	ld hl, Pointers_80db
	call GetHalfwordFromTable
	jp [hl]

Pointers_80db:
	dw Func_8124
	dw Func_8191
	dw Func_819b
	dw Func_81bf
	dw Func_81ef
	dw Func_8201
	dw Func_820b
	dw Func_8191
	dw Func_8264
	dw Func_8201
	dw Func_827e
	dw Func_8191
	dw Func_82cd
	dw Func_8303
	dw Func_8318
	dw Func_832f
	dw Func_834b
	dw Func_835d
	dw Func_8191
	dw Func_83b6
	dw Func_8201
	dw Func_83ce
	dw Func_8191
	dw Func_8403
	dw Func_8201
	dw Func_8423
	dw Func_8191
	dw Func_845c
	dw Func_8474
	dw Func_8201
	dw Func_848b
	dw Func_8491
	dw Func_84b9
	dw Func_8201
	dw Func_8491

Func_8121::
	jp Func_0ea3

Func_8124: ; 8124 (2:4124)
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call Func_0985
	ld bc, $30
	call Func_84c6
	ld bc, $3a
	call Func_04b1
	xor a
	ld [wc463], a
	ld a, $1
	ld [wc46c], a
	ld [wc46d], a
	ld bc, $0
	ld e, $8
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $8
	ld a, $1
	call Func_04da
	ld bc, $20
	call GetCGB_BGLayout_
	ld bc, $5
	call GetCGB_OBLayout_
	ld a, $4
	call Func_050a
	ld a, $40
	ld [wOAMAnimation02 + 2], a
	ld de, wOAMAnimation02
	ld bc, $b068
	call Func_8638
	ld a, $1
	ld [wc430], a
	xor a
	ld [wc3c2], a
	ld a, $37
	call GetMusicBank
	ld [H_FFA0], a
	ld b, $1
	call Func_3768
	jp Func_0ea3

Func_8191: ; 8191 (2:4191)
	ld a, $2
	call Func_050f
	or a
	ret z
	jp Func_0ea3

Func_819b: ; 819b (2:419b)
	ld a, $1
	ld [wc430], a
	ld a, [wc3c0]
	and $3
	ret nz
	ld a, [wOAMAnimation02 + 3]
	dec a
	ld [wOAMAnimation02 + 3], a
	ld a, [wc3c2]
	inc a
	ld [wc3c2], a
	cp $40
	ret nz
	ld a, $40
	ld [wcb2c], a
	jp Func_0ea3

Func_81bf: ; 81bf (2:41bf)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld bc, $0
	ld e, $9
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $9
	ld a, $1
	call Func_04da
	ld a, $80
	ld [wcb2c], a
	ld a, $41
	ld [wOAMAnimation02 + 2], a
	ld a, $1
	ld [wc430], a
	jp Func_0ea3

Func_81ef: ; 81ef (2:41ef)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $4
	call Func_050a
	jp Func_0ea3

Func_8201: ; 8201 (2:4201)
	ld a, $1
	call Func_050f
	or a
	ret z
	jp Func_0ea3

Func_820b: ; 820b (2:420b)
	call Func_0985
	ld bc, $32
	call Func_04b1
	ld bc, $3c
	call Func_04b1
	ld bc, $0
	ld e, $a
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $a
	ld a, $1
	call Func_04da
	ld bc, $21
	call GetCGB_BGLayout_
	ld bc, $6
	call GetCGB_OBLayout_
	ld a, $4
	call Func_050a
	xor a
	ld [wc3c2], a
	ld a, $c0
	ld [wcb2c], a
	ld de, wOAMAnimation02
	ld bc, $5848
	call Func_8638
	ld a, $6
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wc430], a
	jp Func_0ea3

Func_8264: ; 8264 (2:4264)
	ld de, wOAMAnimation02
	call Func_0616
	ld a, [wcb2c]
	cp $0
	jr z, .asm_8276
	dec a
	ld [wcb2c], a
	ret

.asm_8276
	ld a, $4
	call Func_050a
	jp Func_0ea3

Func_827e: ; 827e (2:427e)
	call Func_0985
	ld bc, $33
	call Func_04b1
	ld bc, $3d
	call Func_04b1
	ld bc, $0
	ld e, $b
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $b
	ld a, $1
	call Func_04da
	ld bc, $22
	call GetCGB_BGLayout_
	ld bc, INTRO_MOVIE_DENJUU_OB_LAYOUT
	call GetCGB_OBLayout_
	ld a, $4
	call Func_050a
	ld a, $44
	ld [wOAMAnimation02 + 2], a
	ld de, wOAMAnimation02
	ld bc, $c068
	call Func_8638
	ld a, $1
	ld [wc430], a
	ld a, $a0
	ld [wcb2c], a
	jp Func_0ea3

Func_82cd: ; 82cd (2:42cd)
	ld a, $1
	ld [wc430], a
	ld a, [wcb2c]
	cp $0
	jr z, .asm_82e6
	dec a
	ld [wcb2c], a
	ld a, [wc3c2]
	add $4
	ld [wc3c2], a
	ret

.asm_82e6
	ld a, [wOAMAnimation02 + 3]
	dec a
	ld [wOAMAnimation02 + 3], a
	cp $84
	ret nc
	ld a, $8
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $a0
	ld [wcb2c], a
	jp Func_0ea3

Func_8303: ; 8303 (2:4303)
	ld de, wOAMAnimation02
	call Func_0616
	ld a, [wcb2c]
	cp $0
	jr z, .asm_8315
	dec a
	ld [wcb2c], a
	ret

.asm_8315
	jp Func_0ea3

Func_8318: ; 8318 (2:4318)
	ld a, $1
	ld [wc430], a
	ld a, [wOAMAnimation02 + 3]
	inc a
	ld [wOAMAnimation02 + 3], a
	cp $c0
	ret c
	ld a, $80
	ld [wcb2c], a
	jp Func_0ea3

Func_832f: ; 832f (2:432f)
	ld a, [wcb2c]
	cp $0
	jr z, .asm_8343
	dec a
	ld [wcb2c], a
	ld a, [wc3c2]
	sub $4
	ld [wc3c2], a
	ret

.asm_8343
	ld a, $4
	call Func_050a
	jp Func_0ea3

Func_834b: ; 834b (2:434b)
	ld a, [wc3c2]
	sub $4
	ld [wc3c2], a
	ld a, $1
	call Func_050f
	or a
	ret z
	jp Func_0ea3

Func_835d: ; 835d (2:435d)
	call Func_0985
	ld bc, $34
	call Func_84c6
	ld bc, $3e
	call Func_04b1
	ld bc, $0
	ld e, $c
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $c
	ld a, $1
	call Func_04da
	ld bc, $23
	call GetCGB_BGLayout_
	ld bc, $8
	call GetCGB_OBLayout_
	ld a, $4
	call Func_050a
	ld a, $c0
	ld [wcb2c], a
	xor a
	ld [wc3c2], a
	ld de, wOAMAnimation02
	ld bc, $8068
	call Func_8638
	ld a, $7
	ld [wd411], a
	ld de, wOAMAnimation02
	call Func_0609
	ld a, $1
	ld [wc430], a
	jp Func_0ea3

Func_83b6: ; 83b6 (2:43b6)
	ld de, wOAMAnimation02
	call Func_0616
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $4
	call Func_050a
	jp Func_0ea3

Func_83ce: ; 83ce (2:43ce)
	call Func_0985
	ld bc, $36
	call Func_84c6
	ld bc, $0
	ld e, $d
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $d
	ld a, $1
	call Func_04da
	ld bc, $24
	call GetCGB_BGLayout_
	ld a, $4
	call Func_050a
	ld a, $ff
	ld [wcb2c], a
	ld a, $8
	ld [wc463], a
	jp Func_0ea3

Func_8403: ; 8403 (2:4403)
	ld a, [wc3c0]
	and $7
	jr nz, .asm_8411
	ld a, [wc463]
	dec a
	ld [wc463], a
.asm_8411
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $4
	call Func_050a
	jp Func_0ea3

Func_8423: ; 8423 (2:4423)
	call Func_0985
	ld bc, $38
	call Func_84c6
	ld bc, $0
	ld e, $e
	ld a, $1
	call Func_04ca
	ld bc, $0
	ld e, $e
	ld a, $1
	call Func_04da
	ld bc, $25
	call GetCGB_BGLayout_
	ld a, $4
	call Func_050a
	ld a, $a0
	ld [wcb2c], a
	xor a
	ld [wc463], a
	ld a, $40
	ld [wc3c2], a
	jp Func_0ea3

Func_845c: ; 845c (2:445c)
	ld a, [wc3c0]
	and $3
	ret nz
	ld a, [wc3c2]
	dec a
	ld [wc3c2], a
	cp $0
	ret nz
	ld a, $40
	ld [wcb2c], a
	jp Func_0ea3

Func_8474: ; 8474 (2:4474)
	ld a, [wcb2c]
	dec a
	ld [wcb2c], a
	cp $0
	ret nz
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp Func_0ea3

Func_848b: ; 848b (2:448b)
	ld a, $1f
	ld [wc3e1], a
	ret

Func_8491: ; 8491 (2:4491)
	call Func_0985
	ld bc, $0
	call GetCGB_BGLayout_
	ld a, $1
	ld [wBGPalUpdate], a
	ld a, $1
	ld [wc3e0], a
	xor a
	ld [wc3e1], a
	ld [wc3c2], a
	ld [wc3c3], a
	ld [wc46d], a
	ld [wc46c], a
	ld b, $0
	jp Func_3768

Func_84b9: ; 84b9 (2:44b9)
	ld a, $4
	call Func_050a
	ld a, $10
	ld [wcf96], a
	jp Func_0ea3

Func_84c6: ; 84c6 (2:44c6)
	push bc
	call Func_04b1
	pop bc
	inc bc
	jp Func_04b1
