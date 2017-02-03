	dw .SFXHeader_4fcd
	dw .SFXHeader_4fd4
	dw .SFXHeader_4fd8
	dw .SFXHeader_4fdc
	dw .SFXHeader_4fe0
	dw .SFXHeader_4fe4
	dw .SFXHeader_4fe8
	dw .SFXHeader_4fec
	dw .SFXHeader_4ff0
	dw .SFXHeader_4ff4
	dw .SFXHeader_4ff8
	dw .SFXHeader_4ffc
	dw .SFXHeader_5000
	dw .SFXHeader_5004
	dw .SFXHeader_5008
	dw .SFXHeader_500c
	dw .SFXHeader_5010
	dw .SFXHeader_5014
	dw .SFXHeader_5018
	dw .SFXHeader_501c
	dw .SFXHeader_5020
	dw .SFXHeader_5024
	dw .SFXHeader_502a
	dw .SFXHeader_5030
	dw .SFXHeader_5036
	dw .SFXHeader_503c
	dw .SFXHeader_5042
	dw .SFXHeader_5048
	dw .SFXHeader_504e
	dw .SFXHeader_5054
	dw .SFXHeader_505a
	dw .SFXHeader_5060
	dw .SFXHeader_5066
	dw .SFXHeader_506c
	dw .SFXHeader_5070
	dw .SFXHeader_5074
	dw .SFXHeader_5078
	dw .SFXHeader_507c
	dw .SFXHeader_5080
	dw .SFXHeader_5084
	dw .SFXHeader_5088
	dw .SFXHeader_508c
	dw .SFXHeader_5092
	dw .SFXHeader_5098
	dw .SFXHeader_509e
	dw .SFXHeader_50a2
	dw .SFXHeader_50a8
	dw .SFXHeader_50ae
	dw .SFXHeader_50b2
	dw .SFXHeader_50b6
	dw .SFXHeader_50ba
	dw .SFXHeader_50be
	dw .SFXHeader_50c2
	dw .SFXHeader_50c6
	dw .SFXHeader_50ca
	dw .SFXHeader_50ce
	dw .SFXHeader_50d2
	dw .SFXHeader_50d6
	dw .SFXHeader_50da
	dw .SFXHeader_50de
	dw .SFXHeader_50e2
	dw .SFXHeader_50e6
	dw .SFXHeader_50ea
	dw .SFXHeader_50f0
	dw .SFXHeader_50f4
	dw .SFXHeader_50fa
	dw .SFXHeader_5100
	dw .SFXHeader_5106
	dw .SFXHeader_510a
	dw .SFXHeader_5110
	dw .SFXHeader_5114
	dw .SFXHeader_511a
	dw .SFXHeader_511e
	dw .SFXHeader_5122
	dw .SFXHeader_5126
	dw .SFXHeader_512a
	dw .SFXHeader_5130
	dw .SFXHeader_5136
	dw .SFXHeader_513a
	dw .SFXHeader_513e
	dw .SFXHeader_5142
	dw .SFXHeader_5146
	dw .SFXHeader_514a
	dw .SFXHeader_5150
	dw .SFXHeader_5154
	dw .SFXHeader_515a
	dw .SFXHeader_515e
	dw .SFXHeader_5162
	dw .SFXHeader_5166
	dw .SFXHeader_516a
	dw .SFXHeader_516e
	dw .SFXHeader_5172
	dw .SFXHeader_5176
	dw .SFXHeader_517a
	dw .SFXHeader_517e
	dw .SFXHeader_5182
	dw .SFXHeader_5186
	dw .SFXHeader_518a
	dw .SFXHeader_518e
	dw .SFXHeader_5192
	dw .SFXHeader_5196
	dw .SFXHeader_519a
	dw .SFXHeader_519e
	dw .SFXHeader_51a2
	dw .SFXHeader_51a6
	dw .SFXHeader_51ac
	dw .SFXHeader_51b0
	dw .SFXHeader_51b4
	dw .SFXHeader_51ba
	dw .SFXHeader_51c0
	dw .SFXHeader_51c4
	dw .SFXHeader_51c8
	dw .SFXHeader_51cc
	dw .SFXHeader_51d0
	dw .SFXHeader_51d6
	dw .SFXHeader_51da

.SFXHeader_4fcd: ; 4fcd
	channel %000110, $f0
	dw .SFXHeader_4fcd_Ch4
	dw .SFXHeader_4fcd_Ch5

.SFXHeader_4fcd_Ch4: ; 4fd3
.SFXHeader_4fcd_Ch5: ; 4fd3
	music_ff

.SFXHeader_4fd4: ; 4fd4
	channel %000010, $10
	dw .SFXHeader_4fd4_Ch5

.SFXHeader_4fd8: ; 4fd8
	channel %000010, $30
	dw .SFXHeader_4fd8_Ch5

.SFXHeader_4fdc: ; 4fdc
	channel %000010, $40
	dw .SFXHeader_4fdc_Ch5

.SFXHeader_4fe0: ; 4fe0
	channel %000010, $50
	dw .SFXHeader_4fe0_Ch5

.SFXHeader_4fe4: ; 4fe4
	channel %000010, $30
	dw .SFXHeader_4fe4_Ch5

.SFXHeader_4fe8: ; 4fe8
	channel %000010, $20
	dw .SFXHeader_4fe8_Ch5

.SFXHeader_4fec: ; 4fec
	channel %000010, $30
	dw .SFXHeader_4fec_Ch5

.SFXHeader_4ff0: ; 4ff0
	channel %000010, $40
	dw .SFXHeader_4ff0_Ch5

.SFXHeader_4ff4: ; 4ff4
	channel %000010, $40
	dw .SFXHeader_4ff4_Ch5

.SFXHeader_4ff8: ; 4ff8
	channel %000100, $10
	dw .SFXHeader_4ff8_Ch4

.SFXHeader_4ffc: ; 4ffc
	channel %000100, $10
	dw .SFXHeader_4ffc_Ch4

.SFXHeader_5000: ; 5000
	channel %000100, $10
	dw .SFXHeader_5000_Ch4

.SFXHeader_5004: ; 5004
	channel %000100, $10
	dw .SFXHeader_5004_Ch4

.SFXHeader_5008: ; 5008
	channel %000100, $10
	dw .SFXHeader_5008_Ch4

.SFXHeader_500c: ; 500c
	channel %000010, $10
	dw .SFXHeader_500c_Ch5

.SFXHeader_5010: ; 5010
	channel %000010, $10
	dw .SFXHeader_5010_Ch5

.SFXHeader_5014: ; 5014
	channel %000010, $10
	dw .SFXHeader_5014_Ch5

.SFXHeader_5018: ; 5018
	channel %000010, $10
	dw .SFXHeader_5018_Ch5

.SFXHeader_501c: ; 501c
	channel %000010, $10
	dw .SFXHeader_501c_Ch5

.SFXHeader_5020: ; 5020
	channel %000010, $10
	dw .SFXHeader_5020_Ch5

.SFXHeader_5024: ; 5024
	channel %010010, $20
	dw .SFXHeader_5024_Ch2
	dw .SFXHeader_5024_Ch5

.SFXHeader_502a: ; 502a
	channel %010010, $20
	dw .SFXHeader_502a_Ch2
	dw .SFXHeader_502a_Ch5

.SFXHeader_5030: ; 5030
	channel %010010, $20
	dw .SFXHeader_5030_Ch2
	dw .SFXHeader_5030_Ch5

.SFXHeader_5036: ; 5036
	channel %010010, $20
	dw .SFXHeader_5036_Ch2
	dw .SFXHeader_5036_Ch5

.SFXHeader_503c: ; 503c
	channel %010010, $20
	dw .SFXHeader_503c_Ch2
	dw .SFXHeader_503c_Ch5

.SFXHeader_5042: ; 5042
	channel %010010, $20
	dw .SFXHeader_5042_Ch2
	dw .SFXHeader_5042_Ch5

.SFXHeader_5048: ; 5048
	channel %010010, $20
	dw .SFXHeader_5048_Ch2
	dw .SFXHeader_5048_Ch5

.SFXHeader_504e: ; 504e
	channel %010010, $20
	dw .SFXHeader_504e_Ch2
	dw .SFXHeader_504e_Ch5

.SFXHeader_5054: ; 5054
	channel %010010, $20
	dw .SFXHeader_5054_Ch2
	dw .SFXHeader_5054_Ch5

.SFXHeader_505a: ; 505a
	channel %010010, $20
	dw .SFXHeader_505a_Ch2
	dw .SFXHeader_505a_Ch5

.SFXHeader_5060: ; 5060
	channel %010010, $20
	dw .SFXHeader_5060_Ch2
	dw .SFXHeader_5060_Ch5

.SFXHeader_5066: ; 5066
	channel %010010, $20
	dw .SFXHeader_5066_Ch2
	dw .SFXHeader_5066_Ch5

.SFXHeader_506c: ; 506c
	channel %000010, $10
	dw .SFXHeader_506c_Ch5

.SFXHeader_5070: ; 5070
	channel %000010, $10
	dw .SFXHeader_5070_Ch5

.SFXHeader_5074: ; 5074
	channel %000100, $10
	dw .SFXHeader_5074_Ch4

.SFXHeader_5078: ; 5078
	channel %000010, $10
	dw .SFXHeader_5078_Ch5

.SFXHeader_507c: ; 507c
	channel %000010, $10
	dw .SFXHeader_507c_Ch5

.SFXHeader_5080: ; 5080
	channel %000010, $10
	dw .SFXHeader_5080_Ch5

.SFXHeader_5084: ; 5084
	channel %000100, $10
	dw .SFXHeader_5084_Ch4

.SFXHeader_5088: ; 5088
	channel %000100, $10
	dw .SFXHeader_5088_Ch4

.SFXHeader_508c: ; 508c
	channel %000110, $10
	dw .SFXHeader_508c_Ch4
	dw .SFXHeader_508c_Ch5

.SFXHeader_5092: ; 5092
	channel %000110, $10
	dw .SFXHeader_5092_Ch4
	dw .SFXHeader_5092_Ch5

.SFXHeader_5098: ; 5098
	channel %000110, $10
	dw .SFXHeader_5098_Ch4
	dw .SFXHeader_5098_Ch5

.SFXHeader_509e: ; 509e
	channel %000100, $10
	dw .SFXHeader_509e_Ch4

.SFXHeader_50a2: ; 50a2
	channel %000110, $10
	dw .SFXHeader_50a2_Ch4
	dw .SFXHeader_50a2_Ch5

.SFXHeader_50a8: ; 50a8
	channel %000110, $10
	dw .SFXHeader_50a8_Ch4
	dw .SFXHeader_50a8_Ch5

.SFXHeader_50ae: ; 50ae
	channel %000010, $10
	dw .SFXHeader_50ae_Ch5

.SFXHeader_50b2: ; 50b2
	channel %000100, $10
	dw .SFXHeader_50b2_Ch4

.SFXHeader_50b6: ; 50b6
	channel %000100, $10
	dw .SFXHeader_50b6_Ch4

.SFXHeader_50ba: ; 50ba
	channel %000010, $10
	dw .SFXHeader_50ba_Ch5

.SFXHeader_50be: ; 50be
	channel %000010, $10
	dw .SFXHeader_50be_Ch5

.SFXHeader_50c2: ; 50c2
	channel %000010, $10
	dw .SFXHeader_50c2_Ch5

.SFXHeader_50c6: ; 50c6
	channel %000010, $10
	dw .SFXHeader_50c6_Ch5

.SFXHeader_50ca: ; 50ca
	channel %000100, $10
	dw .SFXHeader_50ca_Ch4

.SFXHeader_50ce: ; 50ce
	channel %000100, $10
	dw .SFXHeader_50ce_Ch4

.SFXHeader_50d2: ; 50d2
	channel %000100, $10
	dw .SFXHeader_50d2_Ch4

.SFXHeader_50d6: ; 50d6
	channel %000100, $10
	dw .SFXHeader_50d6_Ch4

.SFXHeader_50da: ; 50da
	channel %000010, $10
	dw .SFXHeader_50da_Ch5

.SFXHeader_50de: ; 50de
	channel %000010, $10
	dw .SFXHeader_50de_Ch5

.SFXHeader_50e2: ; 50e2
	channel %000010, $10
	dw .SFXHeader_50e2_Ch5

.SFXHeader_50e6: ; 50e6
	channel %000100, $10
	dw .SFXHeader_50e6_Ch4

.SFXHeader_50ea: ; 50ea
	channel %000110, $10
	dw .SFXHeader_50ea_Ch4
	dw .SFXHeader_50ea_Ch5

.SFXHeader_50f0: ; 50f0
	channel %000010, $10
	dw .SFXHeader_50f0_Ch5

.SFXHeader_50f4: ; 50f4
	channel %000110, $10
	dw .SFXHeader_50f4_Ch4
	dw .SFXHeader_50f4_Ch5

.SFXHeader_50fa: ; 50fa
	channel %000110, $10
	dw .SFXHeader_50fa_Ch4
	dw .SFXHeader_50fa_Ch5

.SFXHeader_5100: ; 5100
	channel %000110, $10
	dw .SFXHeader_5100_Ch4
	dw .SFXHeader_5100_Ch5

.SFXHeader_5106: ; 5106
	channel %000100, $10
	dw .SFXHeader_5106_Ch4

.SFXHeader_510a: ; 510a
	channel %000110, $10
	dw .SFXHeader_510a_Ch4
	dw .SFXHeader_510a_Ch5

.SFXHeader_5110: ; 5110
	channel %000100, $10
	dw .SFXHeader_5110_Ch4

.SFXHeader_5114: ; 5114
	channel %000110, $10
	dw .SFXHeader_5114_Ch4
	dw .SFXHeader_5114_Ch5

.SFXHeader_511a: ; 511a
	channel %000100, $10
	dw .SFXHeader_511a_Ch4

.SFXHeader_511e: ; 511e
	channel %000100, $10
	dw .SFXHeader_511e_Ch4

.SFXHeader_5122: ; 5122
	channel %000010, $10
	dw .SFXHeader_5122_Ch5

.SFXHeader_5126: ; 5126
	channel %000010, $10
	dw .SFXHeader_5126_Ch5

.SFXHeader_512a: ; 512a
	channel %000110, $10
	dw .SFXHeader_512a_Ch4
	dw .SFXHeader_512a_Ch5

.SFXHeader_5130: ; 5130
	channel %000110, $10
	dw .SFXHeader_5130_Ch4
	dw .SFXHeader_5130_Ch5

.SFXHeader_5136: ; 5136
	channel %000010, $10
	dw .SFXHeader_5136_Ch5

.SFXHeader_513a: ; 513a
	channel %000010, $10
	dw .SFXHeader_513a_Ch5

.SFXHeader_513e: ; 513e
	channel %000010, $10
	dw .SFXHeader_513e_Ch5

.SFXHeader_5142: ; 5142
	channel %000010, $10
	dw .SFXHeader_5142_Ch5

.SFXHeader_5146: ; 5146
	channel %000010, $10
	dw .SFXHeader_5146_Ch5

.SFXHeader_514a: ; 514a
	channel %000110, $10
	dw .SFXHeader_514a_Ch4
	dw .SFXHeader_514a_Ch5

.SFXHeader_5150: ; 5150
	channel %000010, $10
	dw .SFXHeader_5150_Ch5

.SFXHeader_5154: ; 5154
	channel %000110, $10
	dw .SFXHeader_5154_Ch4
	dw .SFXHeader_5154_Ch5

.SFXHeader_515a: ; 515a
	channel %000100, $10
	dw .SFXHeader_515a_Ch4

.SFXHeader_515e: ; 515e
	channel %000010, $10
	dw .SFXHeader_515e_Ch5

.SFXHeader_5162: ; 5162
	channel %000010, $10
	dw .SFXHeader_5162_Ch5

.SFXHeader_5166: ; 5166
	channel %000010, $10
	dw .SFXHeader_5166_Ch5

.SFXHeader_516a: ; 516a
	channel %000010, $10
	dw .SFXHeader_516a_Ch5

.SFXHeader_516e: ; 516e
	channel %000010, $10
	dw .SFXHeader_516e_Ch5

.SFXHeader_5172: ; 5172
	channel %000010, $10
	dw .SFXHeader_5172_Ch5

.SFXHeader_5176: ; 5176
	channel %000010, $10
	dw .SFXHeader_5176_Ch5

.SFXHeader_517a: ; 517a
	channel %000100, $10
	dw .SFXHeader_517a_Ch4

.SFXHeader_517e: ; 517e
	channel %000100, $10
	dw .SFXHeader_517e_Ch4

.SFXHeader_5182: ; 5182
	channel %000100, $10
	dw .SFXHeader_5182_Ch4

.SFXHeader_5186: ; 5186
	channel %000100, $10
	dw .SFXHeader_5186_Ch4

.SFXHeader_518a: ; 518a
	channel %000100, $10
	dw .SFXHeader_518a_Ch4

.SFXHeader_518e: ; 518e
	channel %000010, $10
	dw .SFXHeader_518e_Ch5

.SFXHeader_5192: ; 5192
	channel %000010, $10
	dw .SFXHeader_5192_Ch5

.SFXHeader_5196: ; 5196
	channel %000010, $10
	dw .SFXHeader_5196_Ch5

.SFXHeader_519a: ; 519a
	channel %000010, $10
	dw .SFXHeader_519a_Ch5

.SFXHeader_519e: ; 519e
	channel %000010, $10
	dw .SFXHeader_519e_Ch5

.SFXHeader_51a2: ; 51a2
	channel %000010, $10
	dw .SFXHeader_51a2_Ch5

.SFXHeader_51a6: ; 51a6
	channel %000110, $10
	dw .SFXHeader_51a6_Ch4
	dw .SFXHeader_51a6_Ch5

.SFXHeader_51ac: ; 51ac
	channel %000010, $10
	dw .SFXHeader_51ac_Ch5

.SFXHeader_51b0: ; 51b0
	channel %000100, $10
	dw .SFXHeader_51b0_Ch4

.SFXHeader_51b4: ; 51b4
	channel %000110, $10
	dw .SFXHeader_51b4_Ch4
	dw .SFXHeader_51b4_Ch5

.SFXHeader_51ba: ; 51ba
	channel %000110, $10
	dw .SFXHeader_51ba_Ch4
	dw .SFXHeader_51ba_Ch5

.SFXHeader_51c0: ; 51c0
	channel %000010, $10
	dw .SFXHeader_51c0_Ch5

.SFXHeader_51c4: ; 51c4
	channel %000010, $10
	dw .SFXHeader_51c4_Ch5

.SFXHeader_51c8: ; 51c8
	channel %000010, $10
	dw .SFXHeader_51c8_Ch5

.SFXHeader_51cc: ; 51cc
	channel %000100, $10
	dw .SFXHeader_51cc_Ch4

.SFXHeader_51d0: ; 51d0
	channel %000110, $10
	dw .SFXHeader_51d0_Ch4
	dw .SFXHeader_51d0_Ch5

.SFXHeader_51d6: ; 51d6
	channel %000010, $10
	dw .SFXHeader_51d6_Ch5

.SFXHeader_51da: ; 51da
	channel %000010, $10
	dw .SFXHeader_51da_Ch5

.SFXHeader_4fd4_Ch5: ; 51de
	music_channeltype $2
	music_tempo $1
	music_setlen $70
	octave 1
	note G_, 5
	octave 1
	note A_, 2
	note D_, 8
	note G_, 5
	note C#, 8
	note A_, 2
	music_ff

.SFXHeader_4fd8_Ch5: ; 51ed
	music_channeltype $2
	music_tempo $3
	music_setlen $70
	octave 1
	note A#, 4
	music_e0 
	note C_, 3
	note __, 8
	note A#, 4
	music_e0 
	note C_, 3
	note A#, 8
	note A#, 4
	music_e0 
	note C_, 2
	note G#, 8
	note A#, 4
	music_e0 
	note C_, 2
	music_tempo $2
	note F_, 8
	note A#, 4
	music_e0 
	note C_, 2
	note D_, 8
	note A#, 4
	music_ff

.SFXHeader_4fdc_Ch5: ; 520c
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	music_setent $2f
	octave 1
	note F#, 1
	octave 1
	note G_, 1
	octave 1
	note G_, 9
	octave 1
	note G#, 1
	octave 1
	note G#, 9
	note D#, 8
	note F#, 1
	note D#, 8
	note G_, 1
	note D_, 8
	note G_, 9
	note D_, 8
	note G#, 1
	note C#, 8
	note G#, 9
	music_ff

.SFXHeader_4fe0_Ch5: ; 5229
	music_channeltype $2
	music_tempo $3
	music_setlen $70
	octave 4
	note G#, 1
	music_e0 
	note C_, 2
	octave 4
	note E_, 1
	music_e0 
	note C_, 2
	octave 4
	note C#, 11
	music_e0 
	note C_, 2
	music_tempo $6
	octave 5
	music_e0 
	note A_, 4
	music_e0 
	note F_, 4
	music_e0 
	note C#, 4
	music_e0 
	music_ff

.SFXHeader_4fe4_Ch5: ; 5246
	music_channeltype $2
	music_tempo $4
	music_setlen $b0
	octave 1
	note G_, 14
	octave 1
	note D#, 12
	music_tempo $5
	octave 1
	note A_, 15
	note B_, 8
	note A_, 15
	note G_, 8
	note A_, 15
	note E_, 8
	note A_, 15
	note C#, 8
	note A_, 15
	music_ff

.SFXHeader_4fe8_Ch5: ; 525d
	music_channeltype $2
	music_tempo $3
	music_setlen $b0
	octave 1
	note A_, 7
	octave 1
	note B_, 3
	music_setlen $70
	octave 1
	note B_, 3
	music_setlen $30
	octave 1
	note B_, 3
	note F#, 8
	note B_, 3
	note C#, 8
	note B_, 3
	music_ff

.SFXHeader_4fec_Ch5: ; 5274
	music_channeltype $2
	music_tempo $1
	music_setlen $b0
	note G#, 8
	note A_, 1
	music_setlen $70
	note G#, 8
	note C_, 8
	music_setlen $30
	note G#, 8
	note A_, 16
	note C#, 8
	note A_, 1
	note C#, 8
	note A_, 8
	note C#, 8
	note A_, 16
	music_ff

.SFXHeader_4ff0_Ch5: ; 528b
	music_channeltype $2
	music_tempo $4
	music_setlen $70
	octave 4
	note G#, 1
	octave 2
	note E_, 4
	octave 1
	note D_, 3
	music_tempo $3
	octave 1
	note A_, 2
	music_e0 
	note C_, 2
	note B_, 8
	note A_, 2
	music_e0 
	note C_, 2
	note A_, 8
	note A_, 2
	music_e0 
	note C_, 2
	note F#, 8
	note A_, 2
	music_e0 
	note C_, 2
	note D_, 8
	note A_, 2
	music_ff

.SFXHeader_4ff4_Ch5: ; 52ac
	music_channeltype $2
	music_tempo $4
	music_setlen $b0
	music_setent $1d
	octave 1
	note G_, 1
	music_setent $16
	octave 2
	note B_, 1
	music_setent $88
	music_setlen $70
	music_tempo $3
	octave 1
	note B_, 6
	music_e0 
	note C_, 2
	note B_, 8
	note B_, 6
	music_e0 
	note C_, 2
	note A_, 8
	note B_, 6
	music_e0 
	note C_, 2
	note G_, 8
	note B_, 6
	music_e0 
	note C_, 2
	note F_, 8
	note B_, 6
	music_e0 
	note C_, 2
	note D#, 8
	note B_, 6
	music_e0 
	note C_, 2
	note C#, 8
	note B_, 6
	music_ff

.SFXHeader_4ff8_Ch4: ; 52db
	music_channeltype $2
	music_tempo $2
	music_setfrq $5f
	note C_, 13
	music_setfrq $5d
	note C_, 14
	music_setfrq $5b
	note C_, 14
	note C_, 1
	note C_, 9
	note C_, 4
	music_ff

.SFXHeader_4ffc_Ch4: ; 52ec
	music_channeltype $2
	music_tempo $2
	music_setfrq $34
	note C_, 6
	music_tempo $4
	music_setrepeat1a $3
	note C_, 11
	note C_, 5
	music_dorepeat1a
	music_ff

.SFXHeader_5000_Ch4: ; 52fb
	music_channeltype $2
	music_tempo $6
	music_setfrq $6a
	note C_, 16
	note C_, 1
	music_setfrq $6b
	note C_, 13
	note C_, 1
	music_setfrq $6c
	note C_, 6
	music_ff

.SFXHeader_5004_Ch4: ; 530b
	music_channeltype $2
	music_tempo $2
	music_setfrq $5b
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5d
	note C_, 16
	note C_, 1
	music_setfrq $5f
	note C_, 16
	music_setfrq $5e
	note C_, 16
	music_setfrq $5d
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_ff

.SFXHeader_5008_Ch4: ; 5326
	music_channeltype $2
	music_tempo $6
	music_setfrq $5f
	note C_, 11
	music_tempo $a
	music_setfrq $5e
	note C_, 16
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_500c_Ch5: ; 5335
	music_channeltype $2
	music_tempo $8
	music_setlen $b0
	music_setent $1f
	octave 2
	music_e0 
	note D#, 7
	music_e0 
	note C#, 7
	music_e0 
	music_ff

.SFXHeader_5010_Ch5: ; 5344
	music_channeltype $2
	music_tempo $16
	music_setlen $b0
	music_setent $3f
	octave 1
	note A#, 1
	music_tempo $10
	note C#, 8
	note G#, 1
	music_ff

.SFXHeader_5014_Ch5: ; 5353
	music_channeltype $2
	music_tempo $4
	music_setlen $70
	octave 1
	note D#, 9
	octave 1
	note F#, 4
	octave 1
	note F_, 1
	octave 1
	note F#, 13
	octave 1
	note A_, 2
	note D#, 8
	note D#, 9
	note D_, 8
	note F#, 4
	note D_, 8
	note F_, 1
	note C#, 8
	note F#, 13
	note C#, 8
	note A_, 2
	music_ff

.SFXHeader_5018_Ch5: ; 536e
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	music_setent $1c
	octave 2
	note __, 1
	music_e0 
	note C_, 3
	music_tempo $5
	music_setent $1e
	octave 2
	note C_, 1
	music_e0 
	note C_, 3
	note E_, 7
	note C_, 1
	music_e0 
	note C_, 3
	note C#, 7
	note C_, 1
	music_ff

.SFXHeader_501c_Ch5: ; 5389
	music_channeltype $2
	music_tempo $4
	music_tempo $3
	music_setlen $b0
	octave 1
	note F_, 10
	octave 1
	note G#, 4
	octave 1
	note A#, 4
	octave 1
	note B_, 12
	octave 1
	note __, 13
	note A_, 8
	note F_, 10
	note A_, 8
	note G#, 4
	note A_, 8
	note A#, 4
	note A_, 8
	note B_, 12
	note A_, 8
	note __, 13
	note F_, 8
	note F_, 10
	note F_, 8
	note G#, 4
	note F_, 8
	note A#, 4
	note F_, 8
	note B_, 12
	note F_, 8
	note __, 13
	note C#, 8
	note F_, 10
	note C#, 8
	note G#, 4
	note C#, 8
	note A#, 4
	note C#, 8
	note B_, 12
	note C#, 8
	note __, 13
	music_ff

.SFXHeader_5020_Ch5: ; 53ba
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	octave 1
	note C#, 14
	octave 2
	note G#, 1
	octave 2
	note A#, 1
	octave 2
	note __, 1
	octave 2
	music_e0 
	octave 1
	note C_, 1
	octave 1
	note D_, 1
	octave 1
	note E_, 1
	octave 1
	note F#, 1
	octave 1
	note G_, 1
	octave 1
	note G#, 1
	note D_, 8
	note C_, 1
	note D_, 8
	note D_, 1
	note C#, 8
	note E_, 1
	note C#, 8
	note F#, 1
	note C#, 8
	note G_, 1
	note C#, 8
	note G#, 1
	music_ff

	music_ff

	music_channeltype $2
	music_tempo $6
	music_setfrq $0
	note C_, 16
	music_ff

.SFXHeader_5024_Ch2: ; 53ec
.SFXHeader_502a_Ch2: ; 53ec
.SFXHeader_5030_Ch2: ; 53ec
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note E_, 10
	music_ff

.SFXHeader_5036_Ch2: ; 53f5
.SFXHeader_503c_Ch2: ; 53f5
.SFXHeader_5042_Ch2: ; 53f5
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note F_, 9
	music_ff

.SFXHeader_5048_Ch2: ; 53fe
.SFXHeader_504e_Ch2: ; 53fe
.SFXHeader_5054_Ch2: ; 53fe
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note F#, 8
	music_ff

.SFXHeader_505a_Ch2: ; 5407
.SFXHeader_5060_Ch2: ; 5407
.SFXHeader_5066_Ch2: ; 5407
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note G_, 5
	music_ff

.SFXHeader_5024_Ch5: ; 5410
.SFXHeader_5036_Ch5: ; 5410
.SFXHeader_5048_Ch5: ; 5410
.SFXHeader_505a_Ch5: ; 5410
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note A_, 4
	music_ff

.SFXHeader_502a_Ch5: ; 5419
.SFXHeader_503c_Ch5: ; 5419
.SFXHeader_504e_Ch5: ; 5419
.SFXHeader_5060_Ch5: ; 5419
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note A_, 15
	music_ff

.SFXHeader_5030_Ch5: ; 5422
.SFXHeader_5042_Ch5: ; 5422
.SFXHeader_5054_Ch5: ; 5422
.SFXHeader_5066_Ch5: ; 5422
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	octave 1
	note A#, 7
	music_ff

.SFXHeader_506c_Ch5: ; 542b
	music_tempo_2 $4
	music_fa $3f
	call_channel .SFX_5442
	music_fa $3c
	call_channel .SFX_5442
	music_fa $36
	call_channel .SFX_5442
	music_fa $32
	call_channel .SFX_5442
	music_ff

.SFX_5442: ; 5442
	octave 7
	note D#, 1
	note A_, 1
	octave 8
	note D#, 1
	octave 7
	note A_, 1
	octave 8
	note A_, 1
	ret_channel

.SFXHeader_5070_Ch5: ; 544c
	music_tempo_2 $4
	music_fa $7f
	call_channel .SFX_5463
	music_fa $7b
	call_channel .SFX_5463
	music_fa $76
	call_channel .SFX_5463
	music_fa $72
	call_channel .SFX_5463
	music_ff

.SFX_5463: ; 5463
	octave 7
	note A_, 1
	note C_, 1
	note D#, 1
	note F#, 1
	note C_, 1
	note D#, 1
	ret_channel

.SFXHeader_5074_Ch4: ; 546b
	music_channeltype $2
	music_setfrq $4f
	music_tempo $6
	note C_, 9
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 13
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 16
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 13
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 9
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 6
	music_tempo $2
	note C_, 1
	music_tempo $3
	note C_, 3
	music_ff

.SFXHeader_5078_Ch5: ; 5497
	music_channeltype $2
	music_tempo $3
	music_setlen $b0
	music_setrepeat1a $3
	music_setent $17
	octave 1
	note F#, 1
	music_setent $1f
	octave 1
	note B_, 1
	music_dorepeat1a
	music_setent $17
	note A#, 8
	note F#, 1
	music_setent $1f
	note A#, 8
	note B_, 1
	music_setent $17
	note G_, 8
	note F#, 1
	music_setent $1f
	note G_, 8
	note B_, 1
	music_setent $17
	note E_, 8
	note F#, 1
	music_setent $1f
	note E_, 8
	note B_, 1
	music_setent $17
	note C#, 8
	note F#, 1
	music_setent $1f
	note C#, 8
	note B_, 1
	music_ff

.SFXHeader_507c_Ch5: ; 54c9
	music_channeltype $2
	music_tempo $9
	music_setlen $b0
	music_setent $17
	octave 2
	note C_, 1
	octave 2
	note D_, 1
	octave 2
	note E_, 1
	octave 2
	note F#, 1
	note A#, 7
	note F#, 1
	note G_, 7
	note F#, 1
	note E_, 7
	note F#, 1
	note C#, 7
	note F#, 1
	music_ff

.SFXHeader_5080_Ch5: ; 54e2
	music_tempo_2 $4
	music_fa $bf
	octave 7
	note F_, 1
	note E_, 1
	note D#, 1
	note E_, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	octave 8
	note D_, 1
	note C_, 1
	octave 7
	note B_, 1
	octave 8
	note C_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	music_fa $bb
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	music_fa $b8
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	music_fa $b5
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	music_fa $b2
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	music_ff

.SFXHeader_5084_Ch4: ; 5513
	music_channeltype $2
	music_tempo $1
	music_setrepeat1a $1c
	music_setfrq $39
	note C_, 16
	music_setfrq $2b
	note C_, 16
	music_dorepeat1a
	music_setfrq $39
	note C_, 13
	music_setfrq $2b
	note C_, 13
	music_setfrq $39
	note C_, 11
	music_setfrq $2b
	note C_, 11
	music_setfrq $39
	note C_, 9
	music_setfrq $2b
	note C_, 9
	music_setfrq $39
	note C_, 7
	music_setfrq $2b
	note C_, 7
	music_setfrq $39
	note C_, 5
	music_setfrq $2b
	note C_, 5
	music_setfrq $39
	note C_, 3
	music_setfrq $2b
	note C_, 3
	music_ff

.SFXHeader_5088_Ch4: ; 5545
	music_channeltype $2
	music_tempo $3
	music_setfrq $32
	note C_, 16
	music_setfrq $34
	note C_, 16
	music_setfrq $44
	note C_, 16
	music_tempo $a
	music_setfrq $5e
	note C_, 16
	music_setfrq $5d
	note C_, 16
	note C_, 13
	note C_, 10
	note C_, 7
	note C_, 4
	note C_, 2
	music_ff

.SFXHeader_508c_Ch4: ; 5560
	music_channeltype $2
	music_tempo $2
	music_setrepeat1a $6
	music_setfrq $27
	note C_, 8
	music_setfrq $25
	note C_, 12
	music_setfrq $23
	note C_, 16
	music_dorepeat1a
	music_setfrq $27
	note C_, 6
	music_setfrq $25
	note C_, 10
	music_setfrq $23
	note C_, 13
	music_setfrq $27
	note C_, 4
	music_setfrq $25
	note C_, 8
	music_setfrq $23
	note C_, 10
	music_setfrq $27
	note C_, 2
	music_setfrq $25
	note C_, 5
	music_setfrq $23
	note C_, 7
	music_ff

.SFXHeader_508c_Ch5: ; 558c
	music_channeltype $2
	music_tempo $1
	music_setlen $30
	music_setrepeat1a $6
	note F#, 8
	note A#, 1
	note G_, 8
	note A#, 3
	note G#, 8
	note A#, 5
	note A_, 8
	note A#, 7
	note A#, 8
	note A#, 9
	note B_, 8
	note A#, 11
	music_dorepeat1a
	note E_, 8
	note A#, 1
	note F_, 8
	note A#, 3
	note F#, 8
	note A#, 5
	note G#, 8
	note A#, 7
	note A_, 8
	note A#, 9
	note A#, 7
	note A#, 11
	note D#, 8
	note A#, 1
	note E_, 8
	note A#, 3
	note F_, 8
	note A#, 5
	note F#, 8
	note A#, 7
	note G_, 8
	note A#, 9
	note G#, 8
	note A#, 11
	note C#, 8
	note A#, 1
	note D_, 8
	note A#, 3
	note D#, 8
	note A#, 5
	note E_, 8
	note A#, 7
	note F_, 8
	note A#, 9
	note F#, 8
	note A#, 11
	music_ff

.SFXHeader_5092_Ch4: ; 55c6
	music_channeltype $2
	music_tempo $3
	music_setfrq $5e
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5a
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $3
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5e
	note C_, 16
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_5092_Ch5: ; 55e2
	music_channeltype $2
	music_tempo $9
	music_setlen $70
	music_setent $4f
	note F_, 8
	note B_, 1
	music_e0 
	note C_, 2
	music_setent $47
	note F_, 8
	note A_, 1
	music_ff

.SFXHeader_5098_Ch4: ; 55f3
	music_channeltype $2
	music_tempo $2
	music_setfrq $4b
	music_setrepeat1a $4
	note C_, 16
	note C_, 1
	music_dorepeat1a
	note C_, 15
	note C_, 1
	note C_, 13
	note C_, 1
	note C_, 11
	note C_, 1
	note C_, 9
	note C_, 1
	note C_, 7
	note C_, 1
	note C_, 5
	note C_, 1
	note C_, 3
	music_ff

.SFXHeader_5098_Ch5: ; 560c
	music_channeltype $2
	music_tempo $2
	music_setlen $30
	music_setent $3f
	music_setrepeat1a $4
	octave 1
	note B_, 1
	music_e0 
	note C_, 3
	music_dorepeat1a
	note __, 8
	note B_, 1
	music_e0 
	note C_, 3
	note B_, 8
	note B_, 1
	music_e0 
	note C_, 3
	note A_, 8
	note B_, 1
	music_e0 
	note C_, 3
	note G_, 8
	note B_, 1
	music_e0 
	note C_, 3
	note F_, 8
	note B_, 1
	music_e0 
	note C_, 3
	note D#, 8
	note B_, 1
	music_e0 
	note C_, 3
	note C#, 8
	note B_, 1
	music_ff

.SFXHeader_509e_Ch4: ; 5636
	music_channeltype $2
	music_tempo $4
	music_setfrq $21
	note C_, 10
	music_setfrq $22
	note C_, 12
	music_setfrq $32
	note C_, 14
	music_tempo $c
	music_setfrq $33
	note C_, 16
	note C_, 13
	note C_, 10
	note C_, 8
	note C_, 6
	note C_, 4
	note C_, 2
	music_ff

.SFXHeader_50a2_Ch4: ; 564f
	music_channeltype $2
	music_tempo $6
	music_setfrq $51
	note C_, 16
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 13
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 10
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 7
	music_tempo $2
	note C_, 1
	music_tempo $6
	note C_, 4
	music_ff

.SFXHeader_50a2_Ch5: ; 566f
	music_channeltype $2
	music_tempo $3
	music_setlen $70
	note B_, 8
	note B_, 5
	note B_, 8
	note B_, 13
	music_e0 
	note C_, 3
	note G#, 8
	note B_, 5
	note G#, 8
	note B_, 13
	music_e0 
	note C_, 3
	note F_, 8
	note B_, 5
	note F_, 8
	note B_, 13
	music_e0 
	note C_, 3
	note D_, 8
	note B_, 5
	note D_, 8
	note B_, 13
	music_e0 
	note C_, 3
	note C#, 8
	note B_, 5
	note C#, 8
	note B_, 13
	music_ff

.SFXHeader_50a8_Ch4: ; 5692
	music_channeltype $2
	music_setfrq $5d
	music_tempo $d
	note C_, 16
	note C_, 10
	note C_, 5
	music_ff

.SFXHeader_50a8_Ch5: ; 569c
	music_channeltype $2
	music_setlen $30
	music_tempo $4
	octave 1
	note __, 1
	music_e0 
	note C_, 2
	music_tempo $8
	octave 1
	note __, 9
	music_tempo $4
	note A_, 8
	note __, 1
	music_e0 
	note C_, 2
	music_tempo $8
	note A_, 8
	note __, 9
	music_tempo $4
	note D_, 8
	note __, 1
	music_e0 
	note C_, 2
	music_tempo $8
	note C#, 8
	note __, 9
	music_ff

.SFXHeader_50ae_Ch5: ; 56bf
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	music_setent $17
	octave 3
	note G#, 1
	octave 3
	music_e0 
	octave 2
	note E_, 1
	octave 2
	note A_, 1
	octave 2
	music_e0 
	music_setent $88
	music_setlen $70
	music_tempo $3
	octave 1
	note A_, 13
	note __, 8
	note A_, 14
	note B_, 8
	note A_, 13
	note A#, 8
	note A_, 14
	note A_, 8
	note A_, 13
	note G#, 8
	note A_, 14
	note G_, 8
	note A_, 13
	note F_, 8
	note A_, 14
	note D#, 8
	note A_, 13
	note C#, 8
	note A_, 14
	music_ff

.SFXHeader_50b2_Ch4: ; 56ec
	music_channeltype $2
	music_setfrq $4b
	music_setrepeat1a $4
	music_tempo $2
	note C_, 6
	note C_, 16
	music_tempo $1
	note C_, 1
	music_dorepeat1a
	music_tempo $2
	note C_, 4
	note C_, 11
	music_tempo $1
	note C_, 1
	music_tempo $2
	note C_, 3
	note C_, 7
	music_tempo $1
	note C_, 1
	music_tempo $2
	note C_, 2
	note C_, 5
	music_ff

.SFXHeader_50b6_Ch4: ; 570d
	music_channeltype $2
	music_tempo $3
	music_setfrq $4c
	note C_, 8
	music_tempo $1
	note C_, 1
	music_tempo $5
	music_setfrq $5c
	note C_, 16
	note C_, 9
	note C_, 4
	music_ff

.SFXHeader_50ba_Ch5: ; 571f
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	note A_, 8
	note G#, 1
	music_e0 
	note C_, 3
	octave 1
	note A#, 3
	music_e0 
	note C_, 3
	note B_, 8
	note G#, 5
	music_e0 
	note C_, 3
	note __, 8
	note G#, 7
	music_e0 
	note C_, 3
	octave 1
	note G#, 9
	music_e0 
	note C_, 3
	octave 1
	note G#, 11
	music_e0 
	note C_, 3
	octave 1
	note G#, 13
	music_e0 
	note C_, 3
	octave 1
	note G#, 15
	music_e0 
	note C_, 3
	octave 1
	note A_, 1
	music_ff

.SFXHeader_50be_Ch5: ; 5748
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	octave 1
	note G#, 1
	music_e0 
	note C_, 3
	octave 1
	note G_, 14
	music_e0 
	note C_, 3
	octave 1
	note G_, 11
	music_e0 
	note C_, 3
	octave 1
	note G_, 9
	music_e0 
	note C_, 3
	note B_, 8
	note G_, 7
	music_e0 
	note C_, 3
	note A_, 8
	note G_, 5
	music_e0 
	note C_, 3
	note G_, 8
	note G_, 3
	music_e0 
	note C_, 3
	note F_, 8
	note G_, 1
	music_e0 
	note C_, 3
	note D#, 8
	note F#, 14
	music_ff

.SFXHeader_50c2_Ch5: ; 5771
	music_channeltype $2
	music_setlen $b0
	music_tempo $a
	music_setent $17
	octave 2
	note __, 1
	note A#, 7
	note __, 1
	note G_, 7
	note __, 1
	note E_, 7
	note __, 1
	note C#, 7
	note __, 1
	music_ff

.SFXHeader_50c6_Ch5: ; 5784
	music_channeltype $2
	music_tempo $c
	music_setlen $b0
	music_setent $27
	octave 2
	note A#, 1
	music_setent $2f
	octave 1
	note F_, 1
	note F_, 8
	note F_, 1
	note C#, 8
	note F_, 1
	music_ff

.SFXHeader_50ca_Ch4: ; 5797
	music_channeltype $2
	music_tempo $4
	music_setfrq $5f
	note C_, 9
	music_setfrq $5e
	note C_, 11
	music_setfrq $5d
	note C_, 13
	music_tempo $a
	music_setfrq $5c
	note C_, 16
	note C_, 13
	note C_, 11
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_50ce_Ch4: ; 57ae
	music_channeltype $2
	music_tempo $2
	music_setfrq $34
	music_setrepeat1a $4
	note C_, 16
	note C_, 1
	music_dorepeat1a
	note C_, 12
	note C_, 1
	note C_, 9
	note C_, 1
	note C_, 6
	note C_, 1
	note C_, 3
	music_ff

.SFXHeader_50d2_Ch4: ; 57c1
	music_channeltype $2
	music_tempo $3
	music_setfrq $3d
	note C_, 16
	music_setfrq $3c
	note C_, 16
	music_setfrq $3b
	note C_, 16
	music_tempo $8
	music_setfrq $3a
	note C_, 16
	note C_, 11
	note C_, 6
	note C_, 2
	music_ff

.SFXHeader_50d6_Ch4: ; 57d7
	music_channeltype $2
	music_tempo $1
	music_setfrq $39
	note C_, 16
	music_setfrq $49
	note C_, 16
	music_setfrq $59
	music_setrepeat1a $8
	music_tempo $3
	note C_, 16
	music_tempo $1
	note C_, 1
	music_dorepeat1a
	music_tempo $3
	note C_, 13
	music_tempo $1
	note C_, 1
	music_tempo $3
	note C_, 10
	music_tempo $1
	note C_, 1
	music_tempo $3
	note C_, 6
	music_tempo $1
	note C_, 1
	music_tempo $3
	note C_, 3
	music_ff

.SFXHeader_50da_Ch5: ; 5802
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	octave 2
	note A#, 1
	music_e0 
	note C_, 2
	octave 2
	music_setent $e0
	note C_, 2
	octave 1
	note F_, 1
	music_e0 
	note C_, 2
	octave 1
	note G_, 13
	music_e0 
	note C_, 2
	octave 1
	note A#, 9
	note __, 7
	note A#, 1
	music_e0 
	note C_, 2
	note B_, 7
	music_setent $e0
	note C_, 2
	note A#, 8
	note F_, 1
	music_e0 
	note C_, 2
	note A_, 8
	note G_, 13
	music_e0 
	note C_, 2
	note G#, 8
	note A#, 9
	note G_, 7
	note A#, 1
	music_e0 
	note C_, 2
	note F#, 7
	music_setent $e0
	note C_, 2
	note E_, 8
	note F_, 1
	music_e0 
	note C_, 2
	note D#, 8
	note G_, 13
	music_e0 
	note C_, 2
	note C#, 8
	note A#, 9
	music_ff

.SFXHeader_50de_Ch5: ; 583f
	music_tempo_2 $3
	music_fa $bf
	octave 8
	note F_, 1
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	note E_, 1
	note D#, 1
	octave 7
	note A#, 1
	note B_, 1
	octave 8
	note C#, 1
	note G_, 1
	note A#, 1
	music_fa $ba
	octave 7
	note B_, 1
	octave 8
	note C#, 1
	note G_, 1
	note A#, 1
	music_fa $b6
	octave 7
	note B_, 1
	octave 8
	note C#, 1
	note G_, 1
	note A#, 1
	music_fa $b2
	octave 7
	note B_, 1
	octave 8
	note C#, 1
	note G_, 1
	note A#, 1
	music_ff

.SFXHeader_50e2_Ch5: ; 586b
	music_tempo_2 $4
	music_fa $bf
	octave 7
	note B_, 1
	octave 8
	note E_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	note E_, 1
	note G_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	music_fa $ba
	note D#, 1
	note G_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	music_fa $b6
	note D_, 1
	note G_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	music_fa $b2
	note C#, 1
	note G_, 1
	note B_, 1
	note A#, 1
	note B_, 1
	music_ff

.SFXHeader_50e6_Ch4: ; 5891
	music_channeltype $2
	music_tempo $2
	music_setrepeat1a $8
	music_setfrq $29
	note C_, 16
	music_setfrq $2b
	note C_, 16
	music_dorepeat1a
	music_setfrq $29
	note C_, 14
	music_setfrq $2b
	note C_, 14
	music_setfrq $29
	note C_, 12
	music_setfrq $2b
	note C_, 12
	music_setfrq $29
	note C_, 10
	music_setfrq $2b
	note C_, 10
	music_setfrq $29
	note C_, 8
	music_setfrq $2b
	note C_, 8
	music_setfrq $29
	note C_, 6
	music_setfrq $2b
	note C_, 6
	music_setfrq $29
	note C_, 3
	music_setfrq $2b
	note C_, 3
	music_ff

.SFXHeader_50ea_Ch4: ; 58c3
	music_channeltype $2
	music_tempo $3
	music_setfrq $5f
	note C_, 16
	music_tempo $5
	music_setfrq $43
	note C_, 16
	note C_, 9
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_50ea_Ch5: ; 58d3
	music_channeltype $2
	music_tempo $3
	music_setlen $b0
	music_setent $1c
	octave 1
	note F#, 1
	music_tempo $5
	octave 2
	note __, 1
	note G_, 7
	note __, 1
	note E_, 7
	note __, 1
	note C#, 7
	note __, 1
	music_ff

.SFXHeader_50f0_Ch5: ; 58e8
	music_channeltype $2
	music_tempo $3
	music_setlen $70
	music_setent $1f
	octave 2
	note __, 1
	octave 2
	music_e0 
	octave 1
	note C_, 1
	octave 1
	note D_, 1
	octave 1
	note D#, 1
	octave 1
	note E_, 1
	octave 1
	note F_, 1
	octave 1
	note F#, 1
	octave 1
	note G_, 1
	note D_, 8
	note E_, 1
	note D_, 8
	note F_, 1
	note C#, 8
	note F#, 1
	note C#, 8
	note G_, 1
	music_ff

.SFXHeader_50f4_Ch4: ; 590b
	music_channeltype $2
	music_tempo $2
	music_setfrq $4f
	note C_, 16
	music_setfrq $3f
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $8
	music_setfrq $5e
	note C_, 16
	note C_, 13
	note C_, 11
	note C_, 8
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_50f4_Ch5: ; 5923
	music_channeltype $2
	music_tempo $4
	music_setlen $70
	music_setent $1c
	octave 1
	note C_, 1
	music_e0 
	note C_, 2
	music_tempo $8
	music_setent $1d
	octave 2
	note F_, 1
	note B_, 7
	note F_, 1
	note A_, 7
	note F_, 1
	note F_, 7
	note F_, 1
	note D#, 7
	note F_, 1
	note C#, 7
	note F_, 1
	music_ff

.SFXHeader_50fa_Ch4: ; 5940
	music_channeltype $2
	music_tempo $2
	music_setfrq $5b
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5d
	note C_, 16
	music_tempo $8
	music_setfrq $5e
	note C_, 16
	note C_, 13
	note C_, 10
	note C_, 7
	note C_, 3
	music_ff

.SFXHeader_50fa_Ch5: ; 5957
	music_channeltype $2
	music_tempo $6
	music_setlen $70
	music_setent $1d
	octave 1
	note A#, 1
	music_tempo $8
	note __, 8
	note A#, 1
	note B_, 8
	note A#, 1
	note A_, 8
	note A#, 1
	note F_, 8
	note A#, 1
	note C#, 8
	note A#, 1
	music_ff

.SFXHeader_5100_Ch4: ; 596e
	music_channeltype $2
	music_tempo $4
	music_setfrq $59
	note C_, 16
	music_setfrq $5a
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5e
	note C_, 16
	music_tempo $20
	music_setfrq $5f
	note C_, 16
	music_tempo $6
	note C_, 15
	note C_, 13
	note C_, 11
	note C_, 9
	note C_, 7
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_5100_Ch5: ; 598d
	music_channeltype $2
	music_tempo $c
	music_setlen $70
	music_setent $1f
	octave 1
	note F#, 1
	music_tempo $20
	music_setent $16
	octave 6
	note __, 1
	music_tempo $6
	music_setent $27
	note B_, 8
	note F#, 1
	note A_, 8
	note F#, 1
	note G_, 8
	note F#, 1
	note F#, 8
	note F#, 1
	note F_, 8
	note F#, 1
	note D#, 8
	note F#, 1
	note C#, 8
	note F#, 1
	music_ff

.SFXHeader_5106_Ch4: ; 59b0
	music_channeltype $2
	music_tempo $1
	music_setfrq $22
	note C_, 8
	music_setfrq $23
	note C_, 12
	music_setfrq $24
	note C_, 14
	music_tempo $2
	music_setfrq $25
	note C_, 16
	music_tempo $1
	music_setfrq $22
	note C_, 3
	music_setfrq $34
	note C_, 3
	music_setfrq $24
	note C_, 3
	music_setfrq $25
	note C_, 3
	music_ff

.SFXHeader_510a_Ch4: ; 59d1
	music_channeltype $2
	music_tempo $4
	music_setfrq $12
	note C_, 8
	note C_, 16
	note C_, 1
	note C_, 3
	music_ff

.SFXHeader_510a_Ch5: ; 59dc
	music_channeltype $2
	music_tempo $4
	music_setlen $30
	music_setent $3f
	note F#, 8
	note B_, 1
	music_setent $27
	note G_, 8
	note A#, 1
	music_e0 
	note C_, 9
	music_ff

.SFXHeader_5110_Ch4: ; 59ed
	music_channeltype $2
	music_tempo $2
	music_setfrq $5a
	music_setrepeat1a $a
	note C_, 16
	note C_, 1
	music_dorepeat1a
	note C_, 8
	note C_, 1
	note C_, 6
	note C_, 1
	note C_, 3
	music_ff

.SFXHeader_5114_Ch4: ; 59fe
	music_channeltype $2
	music_tempo $4
	music_setfrq $5e
	note C_, 16
	music_setfrq $5f
	note C_, 16
	note C_, 14
	note C_, 9
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_5114_Ch5: ; 5a0d
	music_channeltype $2
	music_tempo $4
	music_setlen $b0
	music_setent $1c
	octave 2
	note D_, 1
	octave 2
	note D_, 1
	note A#, 6
	note E_, 1
	note F#, 6
	note E_, 1
	note D#, 6
	note E_, 1
	note C#, 6
	note E_, 1
	music_ff

.SFXHeader_511a_Ch4: ; 5a22
	music_channeltype $2
	music_tempo $a
	music_setfrq $3b
	note C_, 16
	note C_, 11
	note C_, 8
	note C_, 5
	note C_, 2
	music_ff

.SFXHeader_511e_Ch4: ; 5a2e
	music_channeltype $2
	music_tempo $a
	music_setfrq $3e
	note C_, 16
	note C_, 11
	note C_, 8
	note C_, 5
	note C_, 2
	music_ff

.SFXHeader_5122_Ch5: ; 5a3a
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	octave 1
	note A#, 15
	music_e0 
	note C_, 3
	octave 1
	note B_, 15
	music_e0 
	note C_, 3
	octave 1
	note __, 12
	music_e0 
	note C_, 3
	note D_, 8
	note A#, 15
	music_e0 
	note C_, 3
	note C#, 8
	note B_, 15
	music_e0 
	note C_, 3
	note C#, 8
	note __, 12
	music_ff

.SFXHeader_5126_Ch5: ; 5a57
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	music_setrepeat1a $6
	octave 3
	note D#, 1
	music_e0 
	note C_, 2
	octave 3
	note G#, 1
	music_e0 
	note C_, 2
	music_dorepeat1a
	note E_, 6
	note D#, 1
	music_e0 
	note C_, 2
	note D#, 6
	note G#, 1
	music_e0 
	note C_, 2
	note D_, 6
	note D#, 1
	music_e0 
	note C_, 2
	note C#, 6
	note G#, 1
	music_ff

.SFXHeader_512a_Ch4: ; 5a77
	music_channeltype $2
	music_tempo $5
	music_setfrq $13
	note C_, 6
	note C_, 10
	note C_, 13
	note C_, 16
	note C_, 15
	note C_, 13
	note C_, 7
	note C_, 3
	music_ff

.SFXHeader_512a_Ch5: ; 5a86
	music_channeltype $2
	music_tempo $a
	music_setlen $70
	music_setent $27
	octave 2
	note G#, 1
	octave 2
	note __, 1
	octave 1
	note C_, 1
	note C#, 8
	note C_, 1
	music_ff

.SFXHeader_5130_Ch4: ; 5a97
	music_channeltype $2
	music_tempo $2
	music_setfrq $34
	note C_, 16
	music_setfrq $4e
	note C_, 16
	music_tempo $8
	music_setfrq $5e
	note C_, 12
	note C_, 9
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_5130_Ch5: ; 5aaa
	music_channeltype $2
	music_tempo $4
	music_setlen $b0
	music_setent $1b
	octave 1
	note F#, 1
	music_tempo $8
	music_setent $14
	note A#, 3
	note C_, 1
	note F_, 3
	note C_, 1
	note C#, 3
	note C_, 1
	music_ff

.SFXHeader_5136_Ch5: ; 5abf
	music_channeltype $2
	music_tempo $2
	music_setlen $30
	music_setent $1f
	note C#, 8
	note F#, 1
	note D#, 8
	note F#, 9
	note F_, 8
	note G_, 1
	note G_, 8
	note G_, 9
	note A#, 8
	note G#, 1
	octave 1
	note G#, 9
	octave 1
	note A_, 1
	note __, 8
	note A_, 1
	note B_, 8
	note A_, 1
	note A#, 8
	note A_, 1
	note A_, 8
	note A_, 1
	note G#, 8
	note A_, 1
	note G_, 8
	note A_, 1
	note F#, 8
	note A_, 1
	note F_, 8
	note A_, 1
	note E_, 8
	note A_, 1
	note D#, 8
	note A_, 1
	note D_, 8
	note A_, 1
	note C#, 8
	note A_, 1
	music_ff

.SFXHeader_513a_Ch5: ; 5aee
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	note D#, 8
	note E_, 6
	note F#, 8
	note E_, 1
	note G#, 8
	note E_, 6
	note A#, 8
	note E_, 1
	note __, 8
	note E_, 6
	music_setlen $70
	octave 1
	note E_, 1
	octave 1
	note E_, 6
	music_setlen $b0
	octave 1
	note E_, 1
	octave 1
	note E_, 6
	note B_, 8
	note E_, 1
	note A_, 8
	note E_, 6
	note G_, 8
	note E_, 1
	note F_, 8
	note E_, 6
	note E_, 8
	note E_, 1
	note D#, 8
	note E_, 6
	note D_, 8
	note E_, 1
	note C#, 8
	note E_, 6
	music_ff

.SFXHeader_513e_Ch5: ; 5b1b
	music_tempo_2 $2
	music_fa $3f
	call_channel .SFX_5b28
	music_fa $32
	call_channel .SFX_5b28
	music_ff

.SFX_5b28: ; 5b28
	octave 7
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 8
	note C_, 1
	note C#, 1
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	ret_channel

.SFXHeader_5142_Ch5: ; 5b38
	music_tempo_2 $2
	music_fa $3f
	call_channel .SFX_5b45
	music_fa $32
	call_channel .SFX_5b45
	music_ff

.SFX_5b45: ; 5b45
	octave 8
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 7
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	ret_channel
	music_ff

.SFXHeader_5146_Ch5: ; 5b56
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $2f
	octave 1
	note G_, 16
	octave 1
	note G_, 12
	octave 1
	note G_, 7
	octave 1
	note G_, 2
	octave 1
	note F#, 13
	octave 1
	note F#, 7
	octave 1
	note F#, 1
	music_e0 
	note C_, 2
	music_tempo $3
	octave 1
	note G#, 9
	octave 1
	note A_, 1
	octave 1
	note A_, 9
	octave 1
	note A#, 1
	octave 1
	note A#, 9
	note E_, 8
	note G#, 9
	note D#, 8
	note A_, 1
	note D#, 8
	note A_, 9
	note D_, 8
	note A#, 1
	note C#, 8
	note A#, 9
	music_ff

.SFXHeader_514a_Ch4: ; 5b85
	music_channeltype $2
	music_tempo $4
	music_setfrq $5b
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5d
	note C_, 16
	music_setfrq $5b
	note C_, 6
	music_setfrq $5c
	note C_, 5
	music_setfrq $5d
	note C_, 4
	music_ff

.SFXHeader_514a_Ch5: ; 5b9c
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $1f
	octave 1
	note F_, 1
	octave 1
	note E_, 1
	octave 1
	note D#, 1
	octave 1
	note D_, 1
	octave 1
	note C#, 1
	octave 1
	note C_, 1
	note E_, 8
	note F_, 1
	note E_, 8
	note E_, 1
	note D#, 8
	note D#, 1
	note D#, 8
	note D_, 1
	note D_, 8
	note C#, 1
	note C#, 8
	note C_, 1
	music_ff

.SFXHeader_5150_Ch5: ; 5bbd
	music_channeltype $2
	music_tempo $2
	music_setlen $70

.SFX_5bc3: ; 5bc3
	music_setrepeat1d $5
	music_setrepeat1a $6
	octave 1
	note A_, 14
	music_e0 
	note C_, 2
	music_dorepeat1a
	music_e0 
	note C_, 13
	music_dorepeat1d
	music_e0 
	note E_, 1
	jump_channel .SFX_5bc3

.SFXHeader_5154_Ch4: ; 5bd4
	music_channeltype $2
	music_tempo $2
	music_setfrq $5a
	note C_, 16
	music_setfrq $5c
	note C_, 16
	music_setfrq $5e
	note C_, 16
	music_setfrq $5f
	note C_, 16
	music_setfrq $5b
	note C_, 16
	music_setfrq $15
	note C_, 16
	music_tempo $5
	music_setfrq $13
	note C_, 16
	note C_, 7
	note C_, 3
	music_ff

.SFXHeader_5154_Ch5: ; 5bf2
	music_channeltype $2
	music_tempo $8
	music_setlen $70
	music_setent $1e
	octave 1
	note F_, 1
	music_tempo $7
	music_setent $16
	octave 2
	note C_, 1
	music_tempo $a
	note C#, 7
	note C_, 1
	music_ff

.SFXHeader_515a_Ch4: ; 5c07
	music_channeltype $2
	music_tempo $2
	music_setfrq $59
	note C_, 16
	music_setfrq $5c
	note C_, 14
	music_setfrq $5f
	note C_, 16
	music_setfrq $34
	note C_, 16
	music_tempo $8
	music_setfrq $32
	note C_, 16
	note C_, 9
	note C_, 3
	music_ff

.SFXHeader_515e_Ch5: ; 5c1f
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $1f
	octave 1
	note D#, 1
	octave 1
	note E_, 9
	octave 1
	note F#, 1
	octave 1
	note G_, 9
	octave 1
	note F_, 1
	octave 1
	note D_, 1
	octave 2
	music_e0 
	octave 1
	note C_, 1
	octave 1
	note C#, 1
	octave 1
	note D_, 1
	octave 1
	note D#, 1
	octave 1
	note E_, 1
	octave 1
	note F_, 1
	octave 1
	note F#, 1
	octave 1
	note G_, 1
	note C#, 8
	note D#, 1
	note C#, 8
	note E_, 1
	note C#, 8
	note F_, 1
	note C#, 8
	note F#, 1
	note C#, 8
	note G_, 1
	music_ff

.SFXHeader_5162_Ch5: ; 5c50
	music_channeltype $2
	music_tempo $6
	music_setlen $b0
	music_setent $17
	octave 2
	note E_, 1
	octave 2
	note F#, 1
	octave 2
	note G#, 1
	octave 2
	note A#, 1
	octave 2
	note __, 1
	note D_, 7
	note F#, 1
	note D_, 7
	note G#, 1
	note C#, 7
	note A#, 1
	note C#, 7
	note __, 1
	music_ff

.SFXHeader_5166_Ch5: ; 5c6b
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	music_setent $1e
	octave 1
	note A#, 1
	octave 1
	note A#, 9
	octave 1
	note B_, 1
	octave 1
	note B_, 9
	octave 1
	note __, 1
	octave 1
	note __, 9
	octave 1
	octave 8
	note B_, 8
	octave 8
	note A_, 8
	octave 8
	note G_, 8
	octave 8
	note F_, 8
	octave 8
	note D#, 8
	octave 8
	note D_, 8
	octave 8
	note C#, 8
	octave 8
	music_ff

.SFXHeader_516a_Ch5: ; 5c90
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $16
	octave 1
	note G#, 1
	octave 1
	note F#, 1
	octave 1
	note E_, 1
	octave 1
	note D#, 1
	octave 1
	note D_, 1
	octave 1
	note C#, 1
	octave 1
	note C_, 1
	octave 2
	music_e0 
	octave 2
	note __, 1
	octave 2
	note A#, 1
	octave 2
	note G#, 1
	note B_, 8
	note F_, 1
	note A_, 8
	note E_, 1
	note G_, 8
	note D#, 1
	note F_, 8
	note D_, 1
	note D#, 8
	note C#, 1
	note C#, 8
	note C_, 1
	music_ff

.SFXHeader_516e_Ch5: ; 5cbb
	music_channeltype $2
	music_tempo $4
	music_setlen $70
	music_setent $27
	octave 2
	note A#, 1
	octave 2
	note __, 1
	octave 2
	music_e0 
	octave 1
	note C_, 1
	music_tempo $7
	music_setent $2f
	octave 1
	note G#, 1
	note A#, 8
	note F#, 1
	note G#, 8
	note E_, 1
	note F#, 8
	note D_, 1
	note D#, 8
	note C_, 1
	note C#, 7
	octave 8
	music_ff

.SFXHeader_5172_Ch5: ; 5cdc
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $1f
	octave 2
	note G#, 1
	octave 2
	note __, 1
	octave 1
	note C_, 1
	octave 1
	note D_, 1
	octave 1
	note E_, 1
	octave 1
	note F_, 1
	octave 1
	note F#, 1
	music_tempo $5
	music_setent $0
	music_setlen $b0
	octave 1
	note G#, 1
	octave 1
	note __, 1
	note D_, 8
	note G#, 1
	note C#, 8
	note __, 1
	music_ff

.SFXHeader_5176_Ch5: ; 5d01
	music_channeltype $2
	music_tempo $2
	music_setlen $30
	music_setent $1f
	octave 2
	note E_, 1
	octave 2
	note F#, 1
	octave 2
	note G#, 1
	octave 2
	note A#, 1
	octave 2
	note __, 1
	octave 2
	octave 8
	octave 2
	music_e0 
	music_tempo $5
	music_setent $0
	music_setlen $70
	octave 1
	note F_, 6
	octave 1
	note A#, 13
	note D_, 8
	note F_, 6
	note C#, 8
	note A#, 13
	music_ff

.SFXHeader_517a_Ch4: ; 5d26
	music_channeltype $2
	music_tempo $3
	music_setfrq $5a
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $3
	music_setfrq $5b
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $3
	music_setfrq $5c
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $3
	music_setfrq $5d
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $3
	music_setfrq $5e
	note C_, 16
	note C_, 15
	note C_, 13
	note C_, 11
	note C_, 9
	note C_, 7
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_517e_Ch4: ; 5d55
	music_channeltype $2
	music_tempo $2
	music_setfrq $34
	note C_, 16
	music_tempo $1
	note C_, 1
	music_tempo $2
	music_setfrq $22
	note C_, 16
	music_ff

.SFXHeader_5182_Ch4: ; 5d65
	music_channeltype $2
	music_tempo $3
	music_setfrq $26
	note C_, 3
	music_setfrq $24
	note C_, 6
	music_setfrq $23
	note C_, 9
	music_setfrq $22
	note C_, 12
	music_tempo $5
	music_setfrq $21
	note C_, 16
	music_setfrq $20
	note C_, 16
	note C_, 11
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_5186_Ch4: ; 5d81
	music_channeltype $2
	music_tempo $4
	music_setfrq $4e
	note C_, 16
	note C_, 11
	note C_, 7
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_518a_Ch4: ; 5d8d
	music_channeltype $2
	music_tempo $3
	music_setfrq $6c
	note C_, 4
	note C_, 7
	note C_, 10
	note C_, 13
	music_tempo $6
	note C_, 16
	note C_, 14
	note C_, 12
	note C_, 10
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_518e_Ch5: ; 5da0
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	octave 1
	note A_, 14
	music_ff

.SFXHeader_5192_Ch5: ; 5da9
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	octave 5
	note F#, 1
	music_e0 
	note C_, 2
	octave 4
	note C_, 1
	music_e0 
	note C_, 2
	note G_, 5
	note C_, 1
	music_e0 
	note C#, 1

.SFXHeader_5196_Ch5: ; 5dbb
	music_channeltype $2
	music_setlen $b0
	music_tempo $16
	music_setrepeat1a $8
	octave 2
	note G#, 1
	music_e0 
	note C#, 7
	music_dorepeat1a
	music_ff

.SFXHeader_519a_Ch5: ; 5dc9
	music_channeltype $2
	music_setlen $b0
	music_tempo $2
	music_setrepeat1d $7
	music_setrepeat1a $10
	octave 2
	note B_, 1
	octave 2
	note F_, 7
	music_dorepeat1a
	music_e0 
	note F_, 1
	music_dorepeat1d
	music_ff

.SFXHeader_519e_Ch5: ; 5ddc
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	music_setent $1f
	octave 2
	music_e0 
	music_tempo $5
	music_setent $17
	octave 2
	note A#, 1
	note C#, 7
	note A#, 1
	music_ff

.SFXHeader_51a2_Ch5: ; 5def
	music_channeltype $2
	music_tempo $5
	music_setlen $b0
	music_setent $2f
	octave 1
	note G#, 1
	note E_, 8
	note G#, 1
	note C#, 8
	note G#, 1
	music_ff

.SFXHeader_51a6_Ch4: ; 5dfe
	music_channeltype $2
	music_tempo $6
	music_setfrq $4f
	note C_, 16
	note C_, 12
	note C_, 10
	note C_, 7
	note C_, 5
	note C_, 3
	music_ff

.SFXHeader_51a6_Ch5: ; 5e0b
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	octave 1
	note F_, 1
	music_e0 
	note C_, 2
	octave 1
	note G#, 10
	music_e0 
	note C_, 2
	octave 1
	note D_, 1
	music_e0 
	note C_, 2
	note __, 8
	note A#, 8
	music_e0 
	note C_, 2
	note __, 8
	note __, 1
	music_e0 
	note C_, 2
	note G_, 8
	note F_, 1
	music_e0 
	note C_, 2
	note F#, 8
	note G#, 10
	music_e0 
	note C_, 2
	note F_, 8
	note D_, 1
	music_e0 
	note C_, 2
	note E_, 8
	note A#, 8
	music_e0 
	note C_, 2
	note D#, 8
	note __, 1
	music_e0 
	note C_, 2
	note D_, 8
	note F_, 1
	music_e0 
	note C_, 2
	note C#, 8
	note G#, 10
	music_ff

.SFXHeader_51ac_Ch5: ; 5e40
	music_channeltype $2
	music_tempo $3
	music_setlen $70
	octave 1
	note A_, 1
	octave 1
	note A#, 8
	octave 1
	note B_, 10
	octave 1
	note __, 9
	octave 1
	octave 4
	note G#, 8
	note A_, 1
	note G#, 8
	note A#, 8
	note G_, 8
	note B_, 10
	note G_, 8
	note __, 9
	note F#, 8
	octave 4
	note D#, 8
	note A_, 1
	note D#, 8
	note A#, 8
	note D_, 8
	note B_, 10
	note D_, 8
	note __, 9
	note C#, 8
	octave 4
	music_ff

.SFXHeader_51b0_Ch4: ; 5e65
	music_channeltype $2
	music_tempo $1
	music_setfrq $10
	note C_, 16
	music_setfrq $11
	note C_, 16
	music_setfrq $12
	note C_, 16
	music_setfrq $13
	note C_, 16
	music_tempo $2
	music_setfrq $24
	note C_, 16
	music_setfrq $4a
	note C_, 16
	music_setfrq $4b
	note C_, 16
	music_setfrq $4c
	note C_, 16
	music_setfrq $4d
	note C_, 16
	music_tempo $6
	music_setfrq $4d
	note C_, 16
	note C_, 15
	note C_, 14
	note C_, 12
	note C_, 10
	note C_, 8
	note C_, 6
	note C_, 4
	note C_, 2
	music_ff

.SFXHeader_51b4_Ch4: ; 5e94
	music_ff

.SFXHeader_51b4_Ch5: ; 5e95
	music_channeltype $2
	music_tempo $8
	music_setlen $b0
	music_setent $17
	octave 2
	note G#, 1
	octave 2
	note B_, 1
	music_tempo $7
	octave 2
	octave 8
	octave 2
	music_setrepeat1a $e1
	note C_, 7
	octave 1
	note C_, 1
	octave 1
	note C#, 1
	music_tempo $5
	octave 1
	note D_, 1
	octave 1
	note D#, 1
	music_tempo $4
	octave 1
	note E_, 1
	octave 1
	note F_, 1
	octave 1
	note F#, 1
	music_tempo $3
	octave 1
	note G_, 1
	octave 1
	note G#, 1
	octave 1
	note A_, 1
	music_tempo $2
	octave 1
	note A#, 1
	octave 1
	note B_, 1
	octave 1
	note __, 1
	note C#, 8
	note A#, 1
	note C#, 8
	note B_, 1
	note C#, 8
	note __, 1
	music_ff

.SFXHeader_51ba_Ch4: ; 5ed2
	music_channeltype $2
	music_tempo $2
	music_setfrq $4d
	note C_, 16
	music_setfrq $4f
	note C_, 16
	music_tempo $7
	music_setfrq $24
	note C_, 16
	note C_, 13
	note C_, 10
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_51ba_Ch5: ; 5ee6
	music_channeltype $2
	music_tempo $2
	music_setlen $70
	music_setent $1f
	octave 1
	note __, 1
	octave 1
	note B_, 1
	octave 1
	note A#, 1
	octave 1
	note A_, 1
	octave 1
	note G#, 1
	octave 1
	note G_, 1
	octave 1
	note F#, 1
	octave 1
	note F_, 1
	note __, 8
	note E_, 1
	note B_, 8
	note E_, 1
	note A#, 8
	note D_, 1
	note A_, 8
	note C#, 1
	note G#, 8
	note C_, 1
	note F#, 7
	music_setrepeat1a $46
	music_e0 
	note D_, 7
	octave 8
	note C#, 7
	note __, 1
	music_ff

.SFXHeader_51c0_Ch5: ; 5f11
	music_channeltype $2
	music_tempo $10
	music_setlen $70
	music_setent $3f
	octave 1
	note G_, 1
	note C#, 8
	note G_, 1
	music_ff

.SFXHeader_51c4_Ch5: ; 5f1e
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	music_setent $1e
	octave 2
	note B_, 1
	music_tempo $6
	music_setent $17
	octave 2
	note G_, 1
	note C#, 7
	note G_, 1
	music_ff

.SFXHeader_51c8_Ch5: ; 5f31
	music_channeltype $2
	music_tempo $2
	music_setlen $b0
	octave 1
	note G#, 1
	octave 1
	note G_, 15
	octave 1
	note G_, 13
	octave 1
	note G_, 11
	octave 1
	note G_, 9
	octave 1
	note G_, 7
	octave 1
	note G_, 5
	octave 1
	note G_, 3
	octave 1
	note G_, 1
	octave 1
	note G_, 3
	octave 1
	note G_, 5
	octave 1
	note G_, 7
	octave 1
	note G_, 5
	octave 1
	note G_, 3
	octave 1
	note G_, 1
	octave 1
	note F#, 15
	octave 1
	note F#, 13
	octave 1
	note F#, 11
	octave 1
	note F#, 9
	octave 1
	note F#, 7
	octave 1
	note F#, 9
	octave 1
	note F#, 11
	octave 1
	note F#, 13
	octave 1
	note F#, 11
	octave 1
	note F#, 9
	octave 1
	note F#, 7
	octave 1
	note F#, 5
	octave 1
	note F#, 3
	octave 1
	note F#, 1
	octave 1
	note F_, 15
	octave 1
	note F_, 13
	octave 1
	note F_, 11
	note B_, 8
	note F_, 9
	note A_, 8
	note F_, 7
	note G_, 8
	note F_, 5
	note F_, 8
	note F_, 3
	note D#, 8
	note F_, 1
	note C#, 8
	note E_, 15
	music_ff

.SFXHeader_51cc_Ch4: ; 5f84
	music_channeltype $2
	music_tempo $5
	music_setrepeat1a $9
	music_setfrq $5d
	note C_, 16
	music_setfrq $5f
	note C_, 16
	music_dorepeat1a
	music_tempo $6
	note C_, 15
	note C_, 13
	note C_, 11
	note C_, 9
	note C_, 6
	note C_, 3
	music_ff

.SFXHeader_51d0_Ch4: ; 5f9a
	music_channeltype $2
	music_tempo $2
	music_setfrq $11
	note C_, 15
	note C_, 3
	music_ff

.SFXHeader_51d0_Ch5: ; 5fa3
	music_channeltype $2
	music_tempo $1
	music_setlen $b0
	music_setent $1a
	note B_, 8
	note G#, 1
	music_tempo $2
	music_setent $14
	octave 2
	note G#, 1
	note D#, 7
	note G#, 1
	note C#, 7
	note G#, 1
	music_ff

.SFXHeader_51d6_Ch5: ; 5fb8
	music_channeltype $2
	music_tempo $3
	music_setlen $30
	music_setent $17
	octave 2
	note A#, 1
	octave 2
	note __, 1
	octave 2
	music_e0 
	octave 1
	note C_, 1
	octave 1
	note D_, 1
	note D_, 8
	note E_, 1
	music_ff

.SFXHeader_51da_Ch5: ; 5fcd
	music_channeltype $2
	music_tempo $5
	music_setlen $b0
	music_setent $17
	octave 2
	note F#, 1
	octave 2
	note __, 1
	octave 1
	note C#, 1
	octave 1
	note F_, 1
	note D#, 8
	note C#, 1
	note C#, 8
	note F_, 1
	music_ff
