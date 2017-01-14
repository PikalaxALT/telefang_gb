	enum_start

	enum script_00_command
script_00: MACRO
	db script_00_command
	ENDM

	enum script_01_command
script_01: MACRO
	db script_01_command
	db \1
	db \2
	ENDM

	enum script_02_command
script_02: MACRO
	db script_02_command
	db \1
	db \2
	ENDM

	enum script_03_command
script_03: MACRO
	db script_03_command
	ENDM

	enum script_04_command
script_04: MACRO
	db script_04_command
	db \1
	ENDM

	enum script_05_command
script_05: MACRO
	db script_05_command
	ENDM

	enum script_end_command
script_end: MACRO
	db script_end_command
	ENDM

	enum script_07_command
script_07: MACRO
	db script_07_command
	db \1
	db \2
	db \3
	ENDM

	enum script_08_command
script_08: MACRO
	db script_08_command
	db \1
	db \2
	db \3
	ENDM

	enum script_09_command
script_09: MACRO
	db script_09_command
	db \1
	db \2
	db \3
	ENDM

	enum script_0a_command
script_0a: MACRO
	db script_0a_command
	db \1
	db \2
	db \3
	ENDM

	enum script_0b_command
script_0b: MACRO
	db script_0b_command
	db \1
	db \2
	db \3
	ENDM

	enum script_0c_command
script_0c: MACRO
	db script_0c_command
	db \1
	ENDM

	enum script_0d_command
script_0d: MACRO
	db script_0d_command
	db \1
	ENDM

	enum script_0e_command
script_0e: MACRO
	db script_0e_command
	ENDM

	enum script_0f_command
script_0f: MACRO
	db script_0f_command
	db \1
	ENDM

	enum script_10_command
script_10: MACRO
	db script_10_command
	db \1
	db \2
	ENDM

	enum script_11_command
script_11: MACRO
	db script_11_command
	bigdw \1
	ENDM

	enum script_12_command
script_12: MACRO
	db script_12_command
	bigdw \1
	ENDM

	enum script_13_command
script_13: MACRO
	db script_13_command
	bigdw \1
	ENDM

	enum script_14_command
script_14: MACRO
	db script_14_command
	ENDM

	enum script_15_command
script_15: MACRO
	db script_15_command
	ENDM

	enum script_16_command
script_16: MACRO
	db script_16_command
	bigdw \1
	ENDM

	enum script_17_command
script_17: MACRO
	db script_17_command
	db \1
	ENDM

	enum script_18_command
script_18: MACRO
	db script_18_command
	ENDM

	enum script_19_command
script_19: MACRO
	db script_19_command
	bigdw \1
	ENDM

	enum script_1a_command
script_1a: MACRO
	db script_1a_command
	ENDM

	enum script_1b_command
script_1b: MACRO
	db script_1b_command
	ENDM

	enum script_1c_command
script_1c: MACRO
	db script_1c_command
	db \1
	ENDM

	enum script_1d_command
script_1d: MACRO
	db script_1d_command
	ENDM

	enum script_1e_command
script_1e: MACRO
	db script_1e_command
	db \1
	ENDM

	enum script_1f_command
script_1f: MACRO
	db script_1f_command
	db \1
	db \2
	db \3
	ENDM

	enum script_20_command
script_20: MACRO
	db script_20_command
	db \1
	db \2
	db \3
	ENDM

	enum script_21_command
script_21: MACRO
	db script_21_command
	db \1
	db \2
	db \3
	ENDM

	enum script_22_command
script_22: MACRO
	db script_22_command
	db \1
	db \2
	ENDM

	enum script_23_command
script_23: MACRO
	db script_23_command
	db \1
	db \2
	db \3
	ENDM

	enum script_24_command
script_24: MACRO
	db script_24_command
	db \1
	ENDM

	enum script_25_command
script_25: MACRO
	db script_25_command
	db \1
	ENDM

	enum script_26_command
script_26: MACRO
	db script_26_command
	db \1
	db \2
	ENDM

	enum script_27_command
script_27: MACRO
	db script_27_command
	db \1
	ENDM

	enum script_28_command
script_28: MACRO
	db script_28_command
	db \1
	ENDM

	enum script_29_command
script_29: MACRO
	db script_29_command
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
	ENDM

	enum script_2a_command
script_2a: MACRO
	db script_2a_command
	ENDM

	enum script_2b_command
script_2b: MACRO
	db script_2b_command
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
	ENDM

	enum script_2c_command
script_2c: MACRO
	db script_2c_command
	db \1
	ENDM

	enum script_2d_command
script_2d: MACRO
	db script_2d_command
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
	ENDM

	enum script_2e_command
script_2e: MACRO
	db script_2e_command
	db \1
	db \2
	ENDM

	enum script_2f_command
script_2f: MACRO
	db script_2f_command
	db \1
	db \2
	db \3
	db \4
	db \5
	db \6
	db \7
	ENDM

	enum script_jump_command
script_jump: MACRO
	db script_jump_command
	bigdw \1 ; script offset
	ENDM

	enum script_31_command
script_31: MACRO
	db script_31_command
	db \1
	db \2
	db \3
	ENDM

	enum script_32_command
script_32: MACRO
	db script_32_command
	db \1
	db \2
	db \3
	ENDM

	enum script_load_battle_command
script_load_battle: MACRO
	db script_load_battle_command
	db \1
	db \2
	db \3
	ENDM

	enum script_set_event_command
script_set_event: MACRO
	db script_set_event_command
	bigdw \1
	ENDM

	enum script_reset_event_command
script_reset_event: MACRO
	db script_reset_event_command
	bigdw \1
	ENDM

	enum script_36_command
script_36: MACRO
	db script_36_command
	db \1
	db \2
	ENDM

	enum script_37_command
script_37: MACRO
	db script_37_command
	db \1
	db \2
	ENDM

	enum script_jump_if_command
script_jump_if: MACRO
	db script_jump_if_command
	bigdw \1
	db \2 ; script offset
	ENDM

	enum script_jump_if_not_command
script_jump_if_not: MACRO
	db script_jump_if_not_command
	bigdw \1
	db \2 ; script offset
	ENDM

	enum script_give_money_command
script_give_money: MACRO
	db script_give_money_command
	bigdw \1
	ENDM

	enum script_take_money_command
script_take_money: MACRO
	db script_take_money_command
	bigdw \1
	ENDM

	enum script_3c_command
script_3c: MACRO
	db script_3c_command
	db \1
	db \2
	ENDM

	enum script_3d_command
script_3d: MACRO
	db script_3d_command
	db \1
	ENDM

	enum script_3e_command
script_3e: MACRO
	db script_3e_command
	db \1
	ENDM

	enum script_3f_command
script_3f: MACRO
	db script_3f_command
	db \1
	ENDM

	enum script_40_command
script_40: MACRO
	db script_40_command
	db \1
	db \2
	ENDM

	enum script_41_command
script_41: MACRO
	db script_41_command
	db \1
	db \2
	ENDM

	enum script_42_command
script_42: MACRO
	db script_42_command
	db \1
	db \2
	ENDM

	enum script_43_command
script_43: MACRO
	db script_43_command
	db \1
	db \2
	ENDM

	enum script_playsfx_command
script_playsfx: MACRO
	db script_playsfx_command
	db \1
	ENDM

	enum script_playmusic_command
script_playmusic: MACRO
	db script_playmusic_command
	db \1
	ENDM

	enum script_46_command
script_46: MACRO
	db script_46_command
	db \1
	ENDM

	enum script_47_command
script_47: MACRO
	db script_47_command
	db \1
	ENDM

	enum script_48_command
script_48: MACRO
	db script_48_command
	db \1
	ENDM

	enum script_49_command
script_49: MACRO
	db script_49_command
	db \1
	ENDM

	enum script_4a_command
script_4a: MACRO
	db script_4a_command
	db \1
	ENDM

	enum script_4b_command
script_4b: MACRO
	db script_4b_command
	db \1 ; script offset
	ENDM

	enum script_4c_command
script_4c: MACRO
	db script_4c_command
	db \1
	ENDM

	enum script_4d_command
script_4d: MACRO
	db script_4d_command
	db \1
	ENDM

	enum script_4e_command
script_4e: MACRO
	db script_4e_command
	db \1 ; script offset
	ENDM

	enum script_4f_command
script_4f: MACRO
	db script_4f_command
	db \1 ; script offset
	ENDM

	enum script_50_command
script_50: MACRO
	db script_50_command
	bigdw \1
	ENDM

	enum script_incvar_command
script_incvar: MACRO
	db script_incvar_command
	ENDM

	enum script_decvar_command
script_decvar: MACRO
	db script_decvar_command
	ENDM

	enum script_setvar_command
script_setvar: MACRO
	db script_setvar_command
	db \1
	ENDM

	enum script_if_equal_command
script_if_equal: MACRO
	db script_if_equal_command
	db \1
	db \2 ; script offset
	ENDM

	enum script_if_not_equal_command
script_if_not_equal: MACRO
	db script_if_not_equal_command
	db \1
	db \2 ; script offset
	ENDM

	enum script_56_command
script_56: MACRO
	db script_56_command
	bigdw \1
	ENDM

	enum script_57_command
script_57: MACRO
	db script_57_command
	db \1
	ENDM

	enum script_58_command
script_58: MACRO
	db script_58_command
	ENDM

	enum script_give_denjuu_command
script_give_denjuu: MACRO
	db script_give_denjuu_command
	db \1
	db \2
	db \3
	db \4
	db \5
	ENDM

	enum script_5a_command
script_5a: MACRO
	db script_5a_command
	db \1
	db \2
	db \3 ; script offset
	ENDM

	enum script_5b_command
script_5b: MACRO
	db script_5b_command
	ENDM

	enum script_5c_command
script_5c: MACRO
	db script_5c_command
	db \1
	ENDM

	enum script_5d_command
script_5d: MACRO
	db script_5d_command
	ENDM

	enum script_dshot_signal_strength_command
script_dshot_signal_strength: MACRO
	db script_dshot_signal_strength_command
	db \1
	ENDM

	enum script_5f_command
script_5f: MACRO
	db script_5f_command
	db \1
	ENDM

	enum script_60_command
script_60: MACRO
	db script_60_command
	db \1
	ENDM

	enum script_61_command
script_61: MACRO
	db script_61_command
	db \1
	db \2 ; script offset
	ENDM

	enum script_62_command
script_62: MACRO
	db script_62_command
	db \1
	db \2
	ENDM

	enum script_63_command
script_63: MACRO
	db script_63_command
	db \1
	db \2
	db \3
	ENDM

	enum script_64_command
script_64: MACRO
	db script_64_command
	db \1
	ENDM

	enum script_65_command
script_65: MACRO
	db script_65_command
	db \1
	ENDM

	enum script_66_command
script_66: MACRO
	db script_66_command
	db \1
	ENDM

	enum script_67_command
script_67: MACRO
	db script_67_command
	ENDM

	enum script_68_command
script_68: MACRO
	db script_68_command
	db \1
	db \2
	db \3
	ENDM

	enum script_if_own_denjuu_command
script_if_own_denjuu: MACRO
	db script_if_own_denjuu_command
	db \1
	db \2 ; script offset
	ENDM

	enum script_6a_command
script_6a: MACRO
	db script_6a_command
	ENDM

	enum script_upgrade_dshot_command
script_upgrade_dshot: MACRO
	db script_upgrade_dshot_command
	db \1
	ENDM

	enum script_6c_command
script_6c: MACRO
	db script_6c_command
	bigdw \1
	ENDM

	enum script_if_phone_silent_command
script_if_phone_silent: MACRO
	db script_if_phone_silent_command
	db \1 ; script offset
	ENDM

	enum script_if_dex_complete_command
script_if_dex_complete: MACRO
	db script_if_dex_complete_command
	db \1 ; script offset
	ENDM

	enum script_6f_command
script_6f: MACRO
	db script_6f_command
	ENDM

	enum script_70_command
script_70: MACRO
	db script_70_command
	ENDM

	enum script_71_command
script_71: MACRO
	db script_71_command
	ENDM

	enum script_72_command
script_72: MACRO
	db script_72_command
	ENDM

	enum script_73_command
script_73: MACRO
	db script_73_command
	ENDM

	enum script_74_command
script_74: MACRO
	db script_74_command
	ENDM

	enum script_75_command
script_75: MACRO
	db script_75_command
	ENDM

	enum script_76_command
script_76: MACRO
	db script_76_command
	ENDM

	enum script_77_command
script_77: MACRO
	db script_77_command
	ENDM

	enum script_78_command
script_78: MACRO
	db script_78_command
	ENDM

