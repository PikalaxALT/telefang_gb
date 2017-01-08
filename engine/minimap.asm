FadeOutOverworldForMinimap:
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $7
	ld [wWX], a
	ld a, $90
	ld [wWY], a
	ld hl, wBGMapAnchor
	ld a, $0
	ld [hli], a
	ld a, $98
	ld [hl], a
	ld a, $0
	ld [wSCX], a
	ld a, $0
	ld [wSCY], a
	call ClearBGMapAndAttrs
	call ClearBGWindowAndAttrs
	call ClearObjectAnimationBuffers
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wc9f4]
	ld [wc9f5], a
	ld a, [wca51]
	ld [wca50], a
	ld a, $0
	ld [wca64], a
	jp IncrementSubroutine

LoadMinimapGFX: ; a8046 (2a:4046)
	ld a, BANK(GFX_e1d64)
	ld hl, VTilesBG tile $00
	ld de, GFX_e1d64
	ld bc, $800
	call FarCopy2bpp_2
	ld a, BANK(GFX_e2564)
	ld hl, VTilesShared tile $00
	ld de, GFX_e2564
	ld bc, $260
	call FarCopy2bpp_2
	ld a, BANK(GFX_e27c4)
	ld hl, VTilesOB tile $00
	ld de, GFX_e27c4
	ld bc, $490
	call FarCopy2bpp_2
	ld a, BANK(GFX_e2ed4)
	ld hl, VTilesShared tile $40
	ld de, GFX_e2ed4
	ld bc, $c0
	call FarCopy2bpp_2
	call LoadMinimapTilemap
	ld a, $3
	ld [wOAMAnimation01], a
	ld a, $10
	ld [wOAMAnimation01_TemplateBank], a
	ld a, $38
	ld [wOAMAnimation01_TemplateIdx], a
	ld a, $6
	ld [wOAMAnimation01_Palette], a
	ld a, [wMapNumber2]
	srl a
	srl a
	srl a
	ld e, a
	ld a, [wMapNumber2]
	and $7
	ld d, a
	sla a
	sla a
	sla a
	ld b, a
	ld a, [wMapGroup2]
	cp $6
	jr c, .got_map_group
	sub $4
.got_map_group
	ld c, a
	and $1
	jr z, .got_x_coord
	ld a, $8
	add d
	ld d, a
	ld a, $40
.got_x_coord
	add b
	add $14
	ld [wOAMAnimation01_Duration], a
	ld [wOAMAnimation01_XCoord], a
	ld a, [wMapNumber2]
	and $f8
	ld b, a
	ld a, c
	and $4
	jr z, .got_y_coord
	ld a, $8
	add e
	ld e, a
	ld a, $40
.got_y_coord
	add b
	add $c
	ld [wOAMAnimation01_Duration + 4], a
	ld [wOAMAnimation01_YCoord], a
	ld hl, wOAMBufferEnd
	ld de, wOAMAnimation02
	ld b, $20
	call CopyData_Under256Bytes
	ld a, $41
	ld [wOAMAnimation02_TemplateIdx], a
	ld a, $0
	ld [wOAMAnimation02_Palette], a
	ld bc, $8
	call GetCGB_BGLayout_
	ld bc, $10
	call GetCGB_OBLayout_
	ld b, $7
	call LoadTextBoxPalette_
	jp IncrementSubroutine

LoadMinimapTileIfRevealed: ; a810c (2a:410c)
	call MiniMap_CheckRevealedMapSection
	ret z
	hlbgcoord 2, 1
	ld de, GFX_e1b64
	ld a, c
	swap a
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, b
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, c
	swap a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, c
	swap a
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	push hl
	push de
	ld a, BANK(GFX_e1b64)
	ld bc, $1
	call FarCopy2bpp_2
	pop de
	ld hl, $100
	add hl, de
	ld d, h
	ld e, l
	pop hl
	check_cgb
	ret nz
	ld a, $1
	ld [rVBK], a
	ld a, BANK(GFX_e1b64)
	ld bc, $1
	call FarCopy2bpp_2
	ld a, $0
	ld [rVBK], a
	ret

MiniMap_CheckRevealedMapSection: ; a8168 (2a:4168)
	dec b
	dec c
	ld d, $0
	ld a, b
	cp $8
	jr c, .b_less_than_8
	inc d
.b_less_than_8
	ld a, c
	cp $8
	jr c, .c_less_than_8
	inc d
	inc d
.c_less_than_8
	ld a, d
	sla a
	sla a
	sla a
	ld hl, wMiniMapClearedSections
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, c
	and $7
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	ld a, b
	and $7
	ld d, $1
	or a
	jr z, .skip_bit_shift
.loop_bit_shift
	sla d
	dec a
	jr nz, .loop_bit_shift
.skip_bit_shift
	ld a, [hl]
	and d
	ret

LoadMinimapTilemap: ; a81a2 (2a:41a2)
	hlbgcoord 0, 0
	ld de, GFX_e19fc
	ld b, $12
.load_tiles_loop
	push bc
	push hl
	ld bc, $14
	ld a, BANK(GFX_e19fc)
	call FarCopy2bpp_2
	pop hl
	ld a, $20
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	pop bc
	dec b
	jr nz, .load_tiles_loop
	check_cgb
	jr nz, .load_interior
	hlbgcoord 0, 0
	ld b, $12
	ld a, $1
	ld [rVBK], a
.load_attr_row
	ld c, $14
.load_attr_col
	di
.wait_stat
	ld a, [rSTAT]
	and $2
	jr nz, .wait_stat
	ld a, $6
	ld [hli], a
	ei
	dec c
	jr nz, .load_attr_col
	ld a, $c
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	dec b
	jr nz, .load_attr_row
	ld a, $0
	ld [rVBK], a
.load_interior
	ld c, $10
.row
	ld b, $10
.column
	push bc
	call LoadMinimapTileIfRevealed
	pop bc
	dec b
	jr nz, .column
	dec c
	jr nz, .row
	ret

FadeToMinimap: ; a8200 (2a:4200)
	ld bc, $0
	ld a, $4
	call StartFade_
	ld a, $9
	ld [wTextSubroutine], a
	jp IncrementSubroutine

RunMinimap: ; a8210 (2a:4210)
	ld a, $0
	call PaletteFade_
	or a
	ret z
	ld a, $6
	ld [wOAMAnimation01_Palette], a
	ld a, [wTextSubroutine]
	cp $9
	jp nz, .WaitForTextToFinish
	ld a, [hJoyNew]
	and A_BUTTON
	jp z, .SkipText
	ld a, [wOAMAnimation01_Duration + 4]
	sub $c
	sla a
	ld b, a
	ld a, [wOAMAnimation01_Duration]
	sub $14
	srl a
	srl a
	srl a
	add b
	ld b, a
	call GetLandmarkName
	ld a, [wOAMAnimation01_Duration]
	sub $14
	srl a
	srl a
	srl a
	inc a
	ld b, a
	ld a, [wOAMAnimation01_Duration + 4]
	sub $c
	srl a
	srl a
	srl a
	inc a
	ld c, a
	call MiniMap_CheckRevealedMapSection
	jr nz, .map_section_revealed
	ld a, $5
	ld [H_SFX_ID], a
	jr .SkipText

.map_section_revealed
	ld a, $7
	ld [H_SFX_ID], a
	ld d, $2
	ld a, [wOAMAnimation01_Duration + 4]
	cp $4c
	jr nc, .got_draw_box_row
	ld d, $c
.got_draw_box_row
	push de
	ld b, d
	ld c, $4
	call Func_a8459
	pop de
	ld b, $0
	ld c, $bc
	callba Func_2c7b9
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	ld a, [wTextBGMapTop]
	dec a
	ld [wTextBGMapTop], a
	jr .SkipText

.WaitForTextToFinish: ; a829d (2a:429d)
	call PrintText_
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .SkipText
	ld b, $2
	ld a, [wOAMAnimation01_Duration + 4]
	cp $4c
	jr nc, .got_clear_box_row
	ld b, $c
.got_clear_box_row
	ld c, $4
	call Func_a84c5
.SkipText: ; a82b7 (2a:42b7)
	ld a, $1
	ld [wSpriteUpdatesEnabled], a
	ld a, [wc984]
	srl a
	and $7
	add $38
	ld [wOAMAnimation01_TemplateIdx], a
	ld b, $3
	ld a, [wc984]
	and $8
	jr z, .asm_a82d3
	ld b, $2
.asm_a82d3
	ld a, b
	ld [wOAMAnimation02_PriorityFlags], a
	ld a, [wTextSubroutine]
	cp $9
	jr nz, .dont_move_down
	ld a, [wJoyNew]
	and D_RIGHT
	jr z, .dont_move_right
	ld a, [wOAMAnimation01_Duration]
	cp $8c
	jr nc, .dont_move_right
	add $8
	ld [wOAMAnimation01_Duration], a
	ld a, $2
	ld [H_SFX_ID], a
.dont_move_right
	ld a, [wJoyNew]
	and D_LEFT
	jr z, .dont_move_left
	ld a, [wOAMAnimation01_Duration]
	cp $1c
	jr c, .dont_move_left
	sub $8
	ld [wOAMAnimation01_Duration], a
	ld a, $2
	ld [H_SFX_ID], a
.dont_move_left
	ld a, [wJoyNew]
	and D_UP
	jr z, .dont_move_up
	ld a, [wOAMAnimation01_Duration + 4]
	cp $14
	jr c, .dont_move_up
	sub $8
	ld [wOAMAnimation01_Duration + 4], a
	ld a, $2
	ld [H_SFX_ID], a
.dont_move_up
	ld a, [wJoyNew]
	and D_DOWN
	jr z, .dont_move_down
	ld a, [wOAMAnimation01_Duration + 4]
	cp $84
	jr nc, .dont_move_down
	add $8
	ld [wOAMAnimation01_Duration + 4], a
	ld a, $2
	ld [H_SFX_ID], a
.dont_move_down
	ld a, [wOAMAnimation01_Duration]
	ld [wOAMAnimation01_XCoord], a
	ld a, [wOAMAnimation01_Duration + 4]
	ld [wOAMAnimation01_YCoord], a
	ld a, [wVBlankCounter]
	and $3
	jr nz, .skip_except_every_fourth_frame
	ld hl, VTilesShared tile $40
	call Func_17ef
.skip_except_every_fourth_frame
	ld a, [hJoyNew]
	and START | B_BUTTON
	jr z, .done
	ld a, $11
	ld [wSubroutine], a
	ld a, $4
	call StartFade_
.done
	ret

FadeOutMinimapForOverworld: ; a8368 (2a:4368)
	ld a, $1
	call PaletteFade_
	or a
	ret z
	ld a, $0
	ld [wTextSubfunction], a
	ld a, $a
	ld [wSubroutine], a
	ret

