	const_def
	const C_
	const C#
	const D_
	const D#
	const E_
	const F_
	const F#
	const G_
	const G#
	const A_
	const A#
	const B_

octave_command EQU $d0
octave: MACRO
	db octave_command | \1
	ENDM

	enum_start $e0

	enum music_e0_command
music_e0: MACRO
	db music_e0_command
	ENDM

	enum music_setvar3_command
music_setvar3: MACRO
	db music_setvar3_command
	db \1
	ENDM

	enum music_setvara_command
music_setvara: MACRO
	db music_setvara_command
	db \1
	ENDM

	enum music_setvar6_command
music_setvar6: MACRO
	db music_setvar6_command
	db \1
	ENDM

	enum music_e4_command
music_e4: MACRO
	db music_e4_command
	ENDM

	enum music_e5_command
music_e5: MACRO
	db music_e5_command
	ENDM

	enum music_e6_command
music_e6: MACRO
	db music_e6_command
	ENDM

	enum music_set_cf99_command
music_set_cf99: MACRO
	db music_set_cf99_command
	db \1
	ENDM

	enum music_reset_var22_flag6_and_setvar7_command
music_reset_var22_flag6_and_setvar7: MACRO
	db music_reset_var22_flag6_and_setvar7_command
	db \1
	ENDM

	enum music_set_var22_flag6_and_setvar7_command
music_set_var22_flag6_and_setvar7: MACRO
	db music_set_var22_flag6_and_setvar7_command
	db \1
	ENDM

	enum music_set_var22_flag6_command
music_set_var22_flag6: MACRO
	db music_set_var22_flag6_command
	ENDM

	enum music_ed_command
music_ed: MACRO
	db music_ed_command
	ENDM

	enum music_ee_command
music_ee: MACRO
	db music_ee_command
	ENDM

	enum music_ef_command
music_ef: MACRO
	db music_ef_command
	ENDM

	enum music_setrepeat1a_command
music_setrepeat1a: MACRO
	db music_setrepeat1a_command
	db \1
	ENDM

	enum music_dorepeat1a_command
music_dorepeat1a: MACRO
	db music_dorepeat1a_command
	ENDM

	enum jump_channel_command
jump_channel: MACRO
	db jump_channel_command
	dw \1
	ENDM

	enum music_setrepeat1d_command
music_setrepeat1d: MACRO
	db music_setrepeat1d_command
	db \1
	ENDM

	enum music_dorepeat1d_command
music_dorepeat1d: MACRO
	db music_dorepeat1d_command
	db \1
	ENDM

	enum call_channel_command
call_channel: MACRO
	db call_channel_command
	dw \1
	ENDM

	enum ret_channel_command
ret_channel: MACRO
	db ret_channel_command
	ENDM

	enum music_setvar5_command
music_setvar5: MACRO
	db music_setvar5_command
	db \1
	ENDM

	enum music_setvar24_command
music_setvar24: MACRO
	db music_setvar24_command
	db \1
	ENDM

	enum music_f9_command
music_f9: MACRO
	db music_f9_command
	db \1
	dn \2, \3
	ENDM

	enum music_fa_command
music_fa: MACRO
	db music_fa_command
	db (\1 << 6) | (\2 >> 4)
	ENDM

	enum music_fb_command
music_fb: MACRO
	db music_fb_command
	db \1, \2, \3, \4
	ENDM

	enum music_reset_var22_flag6_command
music_reset_var22_flag6: MACRO
	db music_reset_var22_flag6_command
	ENDM

	enum music_setvar3_2_command
music_setvar3_2: MACRO
	db music_setvar3_2_command
	db \1
	ENDM

	enum music_setvar23_command
music_setvar23: MACRO
	db music_setvar23_command
	db \1
	ENDM

	enum music_ff_command
music_ff: MACRO
	db music_ff_command
	ENDM
