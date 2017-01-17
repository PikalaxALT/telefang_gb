INCLUDE "audio/engine.asm"

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
	const __

channel_struct: MACRO
\1_Active:: ds 1           ; 00
\1_Pointer:: dw            ; 01
\1_Tempo:: ds 1            ; 03
\1_Duration:: ds 1         ; 04
\1_ENT:: ds 1              ; 05
\1_LEN:: ds 1              ; 06
\1_ENVReset:: ds 1         ; 07
\1_ENV:: ds 1              ; 08
\1_Sound0x09:: ds 1        ; 09
\1_FRQ:: ds 1              ; 0a
\1_KIK:: ds 1              ; 0b
\1_Subfunction:: dw        ; 0c
\1_SubfunctionTimer:: ds 1 ; 0e
\1_ENVMod:: ds 1           ; 0f
\1_Sound0x10:: ds 1        ; 10
\1_Sound0x11:: ds 1        ; 11
\1_DurationCompare:: ds 1  ; 12
\1_Sound0x13:: ds 1        ; 13
\1_Sound0x14:: ds 1        ; 14
\1_Sound0x15:: ds 1        ; 15
\1_Sound0x16:: ds 1        ; 16
\1_Sound0x17:: ds 1        ; 17
\1_Sound0x18:: ds 1        ; 18
\1_Sound0x19:: ds 1        ; 19
\1_RepeatCount1:: ds 1     ; 1a
\1_RepeatLoopStart1:: dw   ; 1b
\1_RepeatCount2:: ds 1     ; 1d
\1_RepeatLoopStart2:: dw   ; 1e
\1_CallReturnPointer:: dw  ; 20
\1_Flags0x22:: ds 1        ; 22
\1_ChannelType:: ds 1      ; 23
\1_Sound0x24:: ds 1        ; 24
	ds $3
	ENDM

channel: MACRO
	db (\1 << 2)
	db \2
	ENDM

note: MACRO
	dn \1, \2 - 1
	ENDM

noise: MACRO
	dn \1, \2 - 1
IF _NARG > 2
	db \3
ENDC
	ENDM

octave_command EQU $d0
octave: MACRO
	db octave_command | 8 - \1
	ENDM

	enum_start $e0

	enum music_e0_command
music_e0: MACRO
	db music_e0_command
IF _NARG > 0
	db \1
ENDC
	ENDM

	enum music_tempo_command
music_tempo: MACRO
	db music_tempo_command
	db \1
	ENDM

	enum music_setfrq_command
music_setfrq: MACRO
	db music_setfrq_command
	db \1
	ENDM

	enum music_setlen_command
music_setlen: MACRO
	db music_setlen_command
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

	enum music_noise_sample_command
music_noise_sample: MACRO
	db music_noise_sample_command
	db \1
	ENDM

	enum music_e8_command
music_e8: MACRO
	db music_e8_command
	db \1
	ENDM

	enum music_e9_command
music_e9: MACRO
	db music_e9_command
	ENDM

	enum music_reset_var22_flag6_and_setenvreset_command
music_reset_var22_flag6_and_setenvreset: MACRO
	db music_reset_var22_flag6_and_setenvreset_command
	db \1
	ENDM

	enum music_set_var22_flag6_and_setenvreset_command
music_set_var22_flag6_and_setenvreset: MACRO
	db music_set_var22_flag6_and_setenvreset_command
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

	enum music_setent_command
music_setent: MACRO
	db music_setent_command
	db \1
	ENDM

	enum music_setfreqoffset_command
music_setfreqoffset: MACRO
	db music_setfreqoffset_command
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
	db \1
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

	enum music_tempo_2_command
music_tempo_2: MACRO
	db music_tempo_2_command
	db \1
	ENDM

	enum music_channeltype_command
music_channeltype: MACRO
	db music_channeltype_command
	db \1
	ENDM

	enum music_ff_command
music_ff: MACRO
	db music_ff_command
	ENDM


ringtempo: MACRO
	db \1
	ENDM

ringnote: MACRO
	dn \1, \2
	db \3
	ENDM

ringend: MACRO
	db $fe
	ENDM
