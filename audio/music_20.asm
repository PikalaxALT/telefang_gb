	dw MusicHeader_82000
	dw MusicHeader_8200e
	dw MusicHeader_82018
	dw MusicHeader_82022
	dw MusicHeader_8202c
	dw MusicHeader_82036
	dw MusicHeader_82040
	dw MusicHeader_8204a
	dw MusicHeader_82054
	dw MusicHeader_8205e
	dw MusicHeader_82068
	dw MusicHeader_82072
	dw MusicHeader_82072
	dw MusicHeader_82072
	dw MusicHeader_82072

MusicHeader_82000: ; 82000
	channel %111111, $f0
	dw MusicHeader_82000_Ch1
	dw MusicHeader_82000_Ch2
	dw MusicHeader_82000_Ch3
	dw MusicHeader_82000_Ch4
	dw MusicHeader_82000_Ch5
	dw MusicHeader_82000_Ch6

MusicHeader_8200e: ; 8200e
	channel %111001, $f0
	dw MusicHeader_8200e_Ch1
	dw MusicHeader_8200e_Ch2
	dw MusicHeader_8200e_Ch3
	dw MusicHeader_8200e_Ch6

MusicHeader_82018: ; 82018
	channel %111001, $c0
	dw MusicHeader_82018_Ch1
	dw MusicHeader_82018_Ch2
	dw MusicHeader_82018_Ch3
	dw MusicHeader_82018_Ch6

MusicHeader_82022: ; 82022
	channel %111001, $c0
	dw MusicHeader_82022_Ch1
	dw MusicHeader_82022_Ch2
	dw MusicHeader_82022_Ch3
	dw MusicHeader_82022_Ch6

MusicHeader_8202c: ; 8202c
	channel %111001, $c0
	dw MusicHeader_8202c_Ch1
	dw MusicHeader_8202c_Ch2
	dw MusicHeader_8202c_Ch3
	dw MusicHeader_8202c_Ch6

MusicHeader_82036: ; 82036
	channel %111001, $c0
	dw MusicHeader_82036_Ch1
	dw MusicHeader_82036_Ch2
	dw MusicHeader_82036_Ch3
	dw MusicHeader_82036_Ch6

MusicHeader_82040: ; 82040
	channel %111001, $c0
	dw MusicHeader_82040_Ch1
	dw MusicHeader_82040_Ch2
	dw MusicHeader_82040_Ch3
	dw MusicHeader_82040_Ch6

MusicHeader_8204a: ; 8204a
	channel %111001, $c0
	dw MusicHeader_8204a_Ch1
	dw MusicHeader_8204a_Ch2
	dw MusicHeader_8204a_Ch3
	dw MusicHeader_8204a_Ch6

MusicHeader_82054: ; 82054
	channel %111001, $c0
	dw MusicHeader_82054_Ch1
	dw MusicHeader_82054_Ch2
	dw MusicHeader_82054_Ch3
	dw MusicHeader_82054_Ch6

MusicHeader_8205e: ; 8205e
	channel %111001, $c0
	dw MusicHeader_8205e_Ch1
	dw MusicHeader_8205e_Ch2
	dw MusicHeader_8205e_Ch3
	dw MusicHeader_8205e_Ch6

MusicHeader_82068: ; 82068
	channel %111001, $c0
	dw MusicHeader_82068_Ch1
	dw MusicHeader_82068_Ch2
	dw MusicHeader_82068_Ch3
	dw MusicHeader_82068_Ch6

MusicHeader_82072: ; 82072
	channel %111001, $c0
	dw MusicHeader_82072_Ch1
	dw MusicHeader_82072_Ch2
	dw MusicHeader_82072_Ch3
	dw MusicHeader_82072_Ch6

MusicHeader_82018_Ch1: ; 8207c
	music_tempo_2 $6
	music_fb $11, $14, $3, $12
	music_e8 $5

Music_82085: ; 82085
	call_channel Music_82409
	note A_, 2
	note A#, 2
	note __, 2
	music_fa $36
	note D_, 1
	note __, 1
	call_channel Music_82409
	note G#, 2
	note A#, 2
	note __, 2
	music_fa $36
	note D_, 1
	note __, 1
	call_channel Music_82409
	note A_, 2
	note A#, 2
	note __, 2
	music_fa $36
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	music_fa $39
	octave 6
	note C_, 2
	music_set_var22_flag6_and_setenvreset $7
	note C_, 2
	music_set_var22_flag6_and_setenvreset $5
	note C_, 2
	music_set_var22_flag6_and_setenvreset $9
	note C_, 2
	note C_, 2
	note __, 2
	note A_, 2
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	octave 7
	note C_, 4
	note __, 2
	octave 6
	note C_, 2
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	music_setrepeat1d $2
	music_set_var22_flag6_and_setenvreset $9
	octave 6
	note A#, 4
	note D_, 2
	note __, 1
	note D_, 1
	note __, 12
	note D_, 2
	note __, 1
	note D_, 1
	note __, 6
	note F_, 6
	note __, 2
	octave 7
	note C_, 6
	note __, 2
	octave 6
	note A#, 6
	note A_, 4
	note __, 2
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note D#, 4
	note G_, 2
	note A#, 2
	note __, 2
	octave 7
	note D#, 6
	note __, 2
	octave 6
	note F_, 1
	note F_, 1
	note G_, 2
	note F_, 2
	note __, 2
	note A#, 1
	note __, 1
	note F_, 2
	note D_, 2
	note __, 2
	music_setrepeat1a $2
	note A_, 1
	note __, 1
	note G_, 2
	note G#, 2
	music_dorepeat1a
	note A_, 2
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $5
	note A_, 1
	note __, 1
	octave 5
	note C_, 2
	note E_, 2
	note F_, 2
	music_dorepeat1d
	music_fa $39
	octave 6
	note G_, 4
	octave 5
	note G_, 2
	note A#, 2
	note __, 2
	octave 6
	note G_, 2
	note D#, 2
	octave 5
	note A#, 2
	octave 6
	note C_, 4
	note __, 2
	note F_, 6
	note D#, 4
	note D_, 4
	octave 5
	note A_, 4
	note F_, 4
	note D_, 4
	octave 7
	note C_, 2
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	octave 5
	note G_, 2
	note A#, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note G_, 2
	note __, 2
	note G_, 2
	note __, 4
	note G_, 2
	note __, 4
	note A_, 2
	note __, 2
	note A_, 2
	note __, 4
	note A_, 2
	note __, 4
	note C_, 4
	note __, 2
	note C_, 1
	note __, 1
	note F_, 4
	note __, 2
	note F_, 1
	note __, 1
	note D#, 4
	note E_, 1
	note __, 1
	note F_, 4
	note __, 2
	music_set_var22_flag6_and_setenvreset $6
	octave 5
	note C_, 2
	note F_, 1
	note __, 1
	music_fa $79
	octave 5
	note A#, 4
	octave 6
	note C_, 1
	note __, 1
	note C#, 2
	note D_, 12
	note __, 2
	note F_, 2
	note __, 2
	note D#, 2
	note D_, 2
	note __, 2
	note F_, 10
	note __, 2
	note F_, 2
	note __, 2
	note D#, 4
	note D_, 1
	note __, 1
	note C_, 8
	note __, 2
	note C#, 4
	note D#, 1
	note __, 1
	note E_, 2
	note F_, 12
	note __, 2
	note G#, 2
	note __, 2
	note F#, 2
	note F_, 2
	note __, 2
	note G#, 10
	note __, 2
	note G#, 2
	note __, 2
	note F#, 4
	note F_, 1
	note __, 1
	note D#, 2
	octave 5
	note G#, 4
	note B_, 1
	note __, 1
	octave 6
	note C_, 2
	note D#, 2
	jump_channel Music_82085

MusicHeader_82018_Ch2: ; 82183
	music_tempo_2 $6
	music_fb $11, $14, $3, $12
	music_e8 $5

Music_8218c: ; 8218c
	music_fa $76
	music_setrepeat1a $3
	octave 5
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	music_e8 $11
	music_fa $79
	octave 6
	note D_, 1
	note __, 3
	music_fa $76
	octave 5
	note F_, 1
	note __, 1
	music_fa $79
	octave 6
	note D_, 1
	note __, 3
	music_f9 $c, 5, 4
	octave 6
	note D#, 4
	note D#, 1
	note __, 1
	note D_, 2
	note __, 2
	note C_, 2
	note D_, 2
	note __, 2
	music_fa $76
	octave 5
	note F_, 1
	note __, 1
	music_dorepeat1a
	note F_, 1
	note __, 1
	music_fa $79
	octave 6
	note F_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 2
	octave 7
	note C_, 4
	note C_, 1
	note __, 1
	note F_, 4
	note __, 2
	octave 6
	note F_, 2
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	music_fa $79
	music_setrepeat1d $2
	octave 7
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note C#, 1
	music_tempo_2 $2d
	music_set_var22_flag6_and_setenvreset $9
	note D_, 1
	music_tempo_2 $6
	note __, 2
	note C_, 2
	note D_, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note D_, 1
	music_tempo_2 $21
	music_set_var22_flag6_and_setenvreset $9
	note D#, 1
	music_tempo_2 $6
	note D_, 2
	note __, 2
	note C_, 2
	octave 6
	note A#, 2
	note __, 2
	note A_, 6
	note __, 2
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	octave 7
	note E_, 1
	music_tempo_2 $69
	music_set_var22_flag6_and_setenvreset $9
	note F_, 1
	octave 6
	music_tempo_2 $6
	note __, 2
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note G#, 1
	note G_, 4
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note A_, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $9
	note A#, 1
	music_tempo_2 $6
	octave 7
	note D#, 2
	note __, 2
	note G_, 6
	note F_, 2
	note D_, 2
	note C_, 2
	octave 6
	note A#, 8
	note __, 2
	octave 7
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note E_, 1
	music_tempo_2 $15
	music_set_var22_flag6_and_setenvreset $9
	note F_, 1
	music_tempo_2 $6
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $5
	note F_, 1
	note __, 1
	octave 5
	note F_, 2
	note G_, 2
	note A_, 2
	music_dorepeat1d
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	octave 7
	note D_, 1
	music_tempo_2 $2d
	music_set_var22_flag6_and_setenvreset $9
	note D#, 1
	music_tempo_2 $6
	note __, 2
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	note A_, 4
	note __, 2
	octave 7
	note C_, 4
	note __, 2
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note F#, 1
	music_tempo_2 $15
	music_set_var22_flag6_and_setenvreset $9
	note G_, 1
	music_tempo_2 $6
	note F_, 8
	note __, 2
	note D_, 4
	note F_, 2
	note A_, 2
	note __, 2
	note G_, 6
	note __, 2
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note F_, 4
	note F_, 1
	note __, 1
	note D#, 2
	note __, 2
	note F_, 2
	note D#, 2
	note __, 2
	note D_, 4
	note D_, 1
	note __, 1
	note C_, 2
	note __, 2
	note D_, 2
	note C_, 2
	note __, 2
	octave 6
	note A#, 4
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 2
	note A_, 2
	note __, 2
	note A#, 4
	note B_, 1
	note __, 1
	octave 7
	note C_, 4
	note __, 2
	music_set_var22_flag6_and_setenvreset $6
	octave 5
	note F_, 2
	note A_, 1
	note __, 1
	music_fa $b7
	octave 7
	note A#, 6
	note __, 2
	note F_, 6
	note __, 2
	note D_, 6
	note __, 2
	octave 6
	note A#, 6
	note __, 2
	music_fa $b9
	music_reset_var22_flag6_and_setenvreset $5
	music_tempo_2 $3
	note B_, 1
	music_tempo_2 $39
	octave 7
	music_set_var22_flag6_and_setenvreset $9
	note C_, 1
	music_tempo_2 $6
	note __, 2
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 14
	note __, 2
	music_fa $b7
	octave 8
	note C#, 6
	note __, 2
	octave 7
	note G#, 6
	note __, 2
	note F_, 6
	note __, 2
	note C#, 6
	note __, 2
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note D_, 1
	music_tempo_2 $39
	music_set_var22_flag6_and_setenvreset $9
	note D#, 1
	music_tempo_2 $6
	note __, 2
	note C#, 2
	note __, 2
	octave 6
	note B_, 2
	note __, 2
	note A#, 2
	note G#, 10
	note __, 2
	jump_channel Music_8218c

MusicHeader_82018_Ch3: ; 822e7
	music_tempo_2 $6
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $6, $14
	octave 4

Music_822f3: ; 822f3
	music_setrepeat1a $3
	note A#, 2
	note A#, 2
	octave 5
	note F_, 2
	octave 4
	note A#, 2
	music_dorepeat1a
	note A#, 2
	note A#, 2
	octave 5
	note F_, 2
	octave 4
	note G#, 4
	note G#, 2
	octave 5
	note F_, 2
	octave 4
	note G#, 2
	music_setrepeat1a $2
	note G#, 2
	note G#, 2
	octave 5
	note F_, 2
	octave 4
	note G#, 2
	music_dorepeat1a
	note G#, 2
	note G#, 2
	octave 5
	note F_, 2
	octave 4
	note G_, 4
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	music_setrepeat1a $2
	note G_, 2
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	music_dorepeat1a
	note G_, 2
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note F_, 4
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note F_, 2
	note F_, 2
	octave 5
	note C_, 2
	note F_, 4
	octave 4
	note F_, 2
	note F_, 2
	note __, 10
	call_channel Music_823c5
	note F_, 2
	note F_, 2
	note F_, 2
	call_channel Music_823c5
	note F_, 2
	note F_, 2
	note E_, 2
	octave 4
	note D#, 3
	note D#, 1
	note A#, 2
	note D#, 2
	note __, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	note G_, 2
	note F_, 3
	note F_, 1
	note A_, 2
	octave 5
	note C_, 2
	note __, 2
	note F_, 2
	note C_, 2
	octave 4
	note F_, 2
	octave 5
	note D_, 3
	note D_, 1
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note __, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	note F_, 2
	note G_, 3
	note G_, 1
	note D_, 2
	note G_, 2
	note __, 2
	note G_, 2
	note D_, 2
	note D#, 4
	note D#, 2
	octave 4
	note G_, 2
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note F_, 4
	note F_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note A_, 2
	octave 4
	note F_, 2
	note __, 2
	note F_, 4
	note F_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note F_, 2
	note A#, 2
	octave 5
	note C_, 4
	octave 4
	note A_, 2
	note F_, 2
	note __, 4
	note F_, 2
	note G_, 2
	music_setrepeat1a $2
	note A#, 4
	note A#, 2
	octave 5
	note C#, 2
	note D_, 2
	octave 4
	note A#, 2
	note F_, 2
	note G_, 2
	music_dorepeat1a
	music_setrepeat1a $2
	note G#, 4
	note G#, 2
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	note D#, 2
	note F_, 2
	music_dorepeat1a
	music_setrepeat1a $2
	octave 5
	note C#, 4
	note C#, 2
	note E_, 2
	note F_, 2
	note C#, 2
	octave 4
	note G#, 2
	note A#, 2
	music_dorepeat1a
	music_setrepeat1a $2
	note B_, 4
	note B_, 2
	octave 5
	note D_, 2
	note D#, 2
	octave 4
	note B_, 2
	note F#, 2
	note G#, 2
	music_dorepeat1a
	note __, 2
	jump_channel Music_822f3

Music_823c5: ; 823c5
	music_setrepeat1a $2
	octave 4
	note A#, 2
	note __, 1
	note A#, 1
	octave 5
	note A#, 2
	note __, 1
	note A#, 2
	note __, 1
	octave 4
	note A#, 2
	note G_, 2
	note F_, 2
	music_dorepeat1a
	octave 4
	music_setrepeat1a $2
	note A_, 3
	note A_, 1
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note __, 2
	note F_, 2
	note G_, 2
	note F_, 2
	music_dorepeat1a
	note D#, 3
	note D#, 1
	note G_, 2
	note D#, 2
	note __, 2
	octave 5
	note D#, 2
	note D_, 2
	note C_, 2
	octave 4
	note A#, 3
	note A#, 1
	octave 5
	note F_, 2
	octave 4
	note F_, 2
	note __, 2
	note A#, 2
	octave 5
	note D_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 3
	note C_, 1
	octave 4
	note G_, 2
	note D#, 2
	note __, 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 4
	note F_, 2
	note F_, 3
	note __, 3
	ret_channel

Music_82409: ; 82409
	music_fa $36
	octave 5
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	music_e8 $11
	music_fa $39
	note A#, 1
	note __, 3
	music_fa $36
	note A#, 1
	note __, 1
	music_fa $39
	note A#, 1
	note __, 3
	music_f9 $c, 5, 5
	octave 6
	note C_, 4
	note C_, 1
	note __, 1
	octave 5
	note A#, 2
	note __, 2
	ret_channel

Music_82429: ; 82429
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note C_, 2
	ret_channel

Music_82433: ; 82433
	music_setrepeat1a $3
	note C_, 4
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note C_, 2
	note G#, 2
	music_dorepeat1a
	ret_channel

MusicHeader_82018_Ch6: ; 8243e
	music_tempo_2 $6

Music_82440: ; 82440
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note C_, 4
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note A_, 2
	note A_, 2
	music_setrepeat1a $2
	note C_, 4
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note A_, 2
	note A_, 2
	music_dorepeat1a
	note C_, 4
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note G#, 4
	note C_, 2
	note G#, 4
	note G#, 2
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	music_setrepeat1d $2
	music_setrepeat1a $3
	call_channel Music_82429
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 1
	note G#, 1
	note C_, 2
	music_setrepeat1a $2
	call_channel Music_82429
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note G#, 2
	note D_, 2
	note G#, 1
	note G#, 2
	note G#, 1
	note D_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	music_dorepeat1d
	music_setrepeat1a $3
	call_channel Music_82429
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note C_, 2
	note C_, 2
	note A_, 2
	note A_, 2
	note C_, 4
	note C_, 2
	note G#, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note C_, 4
	note C_, 2
	note G#, 2
	note C_, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note G#, 4
	music_setrepeat1a $5
	note C_, 2
	note G#, 2
	music_dorepeat1a
	note E_, 2
	note G#, 1
	note G#, 2
	note G#, 1
	note D_, 1
	note G#, 1
	call_channel Music_82433
	note C_, 4
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note A_, 2
	note A_, 2
	call_channel Music_82433
	note C_, 4
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 1
	note G#, 1
	note C_, 1
	note G#, 2
	note G#, 1
	note G#, 2
	jump_channel Music_82440

MusicHeader_82022_Ch1: ; 824df
	music_tempo_2 $a
	music_fa $b7
	music_fb $1, $12, $2, $11
	music_e8 $1e
	music_f9 $15, 4, 3
	music_setrepeat1d $2
	call_channel Music_826f6
	music_setrepeat1a $2
	octave 6
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	note G_, 1
	note __, 1
	music_dorepeat1a
	call_channel Music_826f6
	music_setrepeat1a $2
	octave 6
	note A_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note A_, 1
	note __, 1
	music_dorepeat1a
	music_dorepeat1d
	music_fb $1, $12, $5, $11
	music_setrepeat1d $3
	music_setrepeat1a $8
	octave 5
	note G_, 1
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 5
	note G#, 1
	note B_, 1
	music_dorepeat1a
	music_dorepeat1d
	music_setrepeat1a $8
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 5
	note A#, 1
	octave 6
	note C#, 1
	music_dorepeat1a
	call_channel Music_82704
	octave 6
	note F_, 2
	note F_, 2
	note __, 2
	music_fa $b5
	note F_, 2
	note __, 2
	music_fa $b3
	note F_, 2
	note __, 2
	music_fa $b1
	note F_, 2
	call_channel Music_82724
	octave 5
	note B_, 6
	octave 6
	note D_, 7
	note F_, 7
	note D_, 6
	note F_, 7
	note B_, 7
	music_fa $b3
	note F_, 6
	note B_, 7
	octave 7
	note D_, 7
	octave 6
	note B_, 6
	octave 7
	note D_, 7
	call_channel Music_82704
	octave 6
	note F#, 2
	note F#, 2
	note __, 2
	music_fa $b5
	note F#, 2
	note __, 2
	music_fa $b3
	note F#, 2
	note __, 2
	music_fa $b1
	note F#, 2
	call_channel Music_82724
	octave 6
	note C_, 6
	note D#, 7
	note F#, 7
	note D#, 6
	note F#, 7
	octave 7
	note C_, 7
	music_fa $b3
	octave 6
	note F#, 6
	octave 7
	note C_, 7
	note D#, 7
	note C_, 6
	note D#, 7
	music_setfreqoffset $0
	jump_channel MusicHeader_82022_Ch1

MusicHeader_82022_Ch2: ; 82584
	music_tempo_2 $a
	music_fa $7a
	music_fb $1, $13, $7, $31
	music_e8 $14
	music_f9 $15, 4, 4
	octave 5
	note G#, 8
	note __, 2
	note A#, 2
	note B_, 2
	octave 6
	note C#, 2
	octave 5
	note A#, 10
	note __, 2
	octave 6
	note D#, 4
	note D_, 2
	note D#, 2
	note F_, 12
	note F#, 6
	note F_, 1
	note E_, 1
	note D#, 8
	note __, 4
	octave 5
	note G#, 4
	note F#, 6
	note F_, 2
	note E_, 10
	note __, 2
	note E_, 2
	note D#, 2
	note D_, 4
	note A#, 8
	note __, 2
	note A#, 1
	note B_, 1
	octave 6
	note C_, 6
	octave 5
	note B_, 1
	note A#, 1
	note A_, 6
	note __, 2
	music_f9 $15, 4, 3
	music_fa $ba
	call_channel Music_826e2
	note E_, 5
	note __, 1
	note F_, 1
	note E_, 1
	note D#, 6
	note __, 2
	note D_, 4
	octave 6
	note B_, 4
	note G#, 3
	music_tempo_2 $5
	music_fa $b8
	note G_, 1
	note F#, 1
	music_tempo_2 $a
	music_fa $ba
	note F_, 4
	call_channel Music_826e2
	note G#, 2
	note A_, 2
	octave 8
	note C_, 4
	note __, 2
	octave 7
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 3
	note __, 1
	note E_, 3
	note __, 1
	note C#, 3
	note __, 1
	octave 6
	note A#, 3
	note __, 1
	call_channel Music_8271a
	octave 6
	note B_, 1
	note B_, 1
	note __, 1
	music_fa $b6
	note B_, 1
	note __, 1
	music_fa $b4
	note B_, 1
	note __, 1
	music_fa $b1
	note B_, 1
	call_channel Music_82710
	octave 5
	note B_, 6
	octave 6
	note D_, 7
	note F_, 7
	music_fa $b4
	note D_, 6
	note F_, 7
	note B_, 7
	music_fa $b5
	note F_, 6
	note B_, 7
	octave 7
	note D_, 7
	music_fa $b6
	octave 6
	note B_, 6
	octave 7
	note D_, 7
	note F_, 7
	call_channel Music_8271a
	octave 7
	note C_, 1
	note C_, 1
	note __, 1
	music_fa $b6
	note C_, 1
	note __, 1
	music_fa $b4
	note C_, 1
	note __, 1
	music_fa $b1
	note C_, 1
	call_channel Music_82710
	octave 6
	note C_, 6
	note D#, 7
	note F#, 7
	music_fa $b4
	note D#, 6
	note F#, 7
	octave 7
	note C_, 7
	music_fa $b5
	octave 6
	note F#, 6
	octave 7
	note C_, 7
	note D#, 7
	music_fa $b6
	note C_, 6
	note D#, 7
	note F#, 7
	jump_channel MusicHeader_82022_Ch2

MusicHeader_82022_Ch3: ; 82646
	music_tempo_2 $a

Music_82648: ; 82648
	music_fa $2
	music_fb $0, $0, $6, $0
	music_noise_sample $f
	music_f9 $15, 4, 5
	octave 5
	note __, 2
	note G#, 10
	note A#, 2
	note B_, 2
	octave 6
	note C#, 2
	octave 5
	note A#, 12
	octave 6
	note D#, 4
	note D_, 2
	note D#, 2
	note F_, 12
	note F#, 6
	note F_, 1
	note E_, 1
	note D#, 12
	octave 5
	note G#, 4
	note F#, 6
	note F_, 2
	note E_, 12
	note E_, 2
	note D#, 2
	note D_, 4
	note A#, 10
	note A#, 1
	note B_, 1
	octave 6
	note C_, 6
	octave 5
	note B_, 1
	note A#, 1
	note A_, 6
	music_f9 $0, 0, 0
	music_fb $0, $0, $6, $0
	call_channel Music_8273c
	call_channel Music_82731
	call_channel Music_82750
	octave 4
	note G_, 2
	note G_, 2
	music_fa $2
	music_noise_sample $f
	octave 7
	note E_, 6
	note F_, 1
	note E_, 1
	note D#, 2
	call_channel Music_82731
	music_fa $2
	music_noise_sample $f
	octave 7
	note D_, 4
	octave 6
	note B_, 4
	note G#, 2
	music_fa $3
	music_noise_sample $c
	octave 5
	note D_, 1
	note G#, 1
	call_channel Music_8273c
	call_channel Music_82731
	call_channel Music_82750
	octave 4
	note A_, 2
	note A_, 2
	music_fa $2
	music_noise_sample $f
	octave 7
	note G#, 2
	note A_, 2
	octave 8
	note C_, 6
	music_fa $3
	music_noise_sample $c
	octave 5
	note D#, 1
	note A_, 1
	octave 4
	note A#, 2
	note A#, 2
	music_fa $2
	music_noise_sample $f
	octave 7
	note A#, 4
	note E_, 4
	note C#, 2
	music_fa $3
	music_noise_sample $c
	octave 5
	note E_, 1
	note A#, 1
	octave 4
	note B_, 2
	note B_, 2
	note __, 10
	octave 5
	note F_, 1
	note B_, 1
	note C_, 2
	note C_, 2
	note __, 12
	jump_channel Music_82648

Music_826e2: ; 826e2
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note F_, 1
	note E_, 14
	note __, 4
	note F_, 1
	note G_, 1
	note G#, 2
	note G_, 2
	music_tempo_2 $2
	note F_, 9
	note F#, 1
	music_tempo_2 $a
	note G_, 2
	ret_channel

Music_826f6: ; 826f6
	music_setrepeat1a $2
	octave 6
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	ret_channel

Music_82704: ; 82704
	music_tempo_2 $5
	music_fb $1, $12, $2, $11
	music_fa $b8
	music_setfreqoffset $0
	ret_channel

Music_82710: ; 82710
	music_tempo_2 $1
	music_fb $1, $0, $2, $11
	music_fa $b3
	ret_channel

Music_8271a: ; 8271a
	music_tempo_2 $a
	music_fb $1, $12, $2, $11
	music_fa $ba
	ret_channel

Music_82724: ; 82724
	music_tempo_2 $1
	music_fb $1, $0, $2, $11
	music_setfreqoffset $1
	music_fa $b2
	note __, 7
	ret_channel

Music_82731: ; 82731
	music_fa $3
	music_noise_sample $c
	octave 5
	note D_, 1
	note G_, 1
	octave 4
	note G#, 2
	note G#, 2
	ret_channel

Music_8273c: ; 8273c
	music_fa $3
	music_noise_sample $c
	octave 4
	note G_, 2
	note G_, 2
	music_fa $2
	music_noise_sample $f
	note __, 2
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note F_, 1
	note E_, 4
	ret_channel

Music_82750: ; 82750
	note __, 6
	music_fa $2
	music_noise_sample $f
	octave 7
	note F_, 1
	note G_, 1
	note G#, 2
	music_fa $3
	music_noise_sample $c
	octave 5
	note D_, 1
	note G#, 1
	ret_channel

MusicHeader_82022_Ch6: ; 82761
	music_tempo_2 $a

Music_82763: ; 82763
	music_setrepeat1a $7
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 4
	note C#, 1
	note C#, 1
	note E_, 4
	music_dorepeat1a
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 4
	note C#, 1
	note C#, 1
	music_tempo_2 $1
	music_setrepeat1a $8
	note F_, 3
	music_dorepeat1a
	music_setrepeat1a $4
	note G#, 4
	music_dorepeat1a
	music_tempo_2 $a
	music_setrepeat1a $a
	note D_, 1
	note C#, 1
	note E_, 4
	note D_, 1
	note C#, 1
	note E_, 2
	note D_, 6
	music_dorepeat1a
	jump_channel Music_82763

MusicHeader_8202c_Ch1: ; 8278c
	music_tempo_2 $7

Music_8278e: ; 8278e
	music_fa $73
	music_fb $11, $0, $3, $21
	music_setfreqoffset $1
	note __, 1
	music_e8 $15
	music_f9 $15, 4, 3
	octave 5
	call_channel Music_82a1d
	note __, 1
	call_channel Music_82a1d
	music_fa $b8
	music_fb $11, $12, $3, $11
	octave 5
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D#, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 2
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 6
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 2
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	note B_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 5
	note G#, 1
	note B_, 1
	octave 6
	note D#, 1
	note __, 1
	note F#, 1
	note G#, 1
	note __, 1
	note D#, 3
	note C#, 1
	note __, 1
	call_channel Music_82a3f
	music_fa $b8
	octave 6
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 2
	note __, 1
	note D#, 1
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note C#, 1
	note __, 1
	note D#, 1
	note __, 2
	music_tempo_2 $1
	note C#, 1
	note D_, 6
	music_tempo_2 $7
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note __, 1
	note E_, 2
	note F#, 1
	octave 5
	note B_, 1
	note __, 5
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_setrepeat1a $2
	note F#, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note C#, 12
	note __, 2
	octave 6
	note G#, 1
	octave 7
	note C#, 1
	octave 6
	note G#, 12
	note __, 2
	note G#, 1
	octave 7
	note C#, 1
	octave 6
	note F#, 12
	note __, 2
	note F#, 1
	octave 7
	note C#, 1
	octave 6
	note F#, 12
	note __, 4
	note F#, 1
	note C#, 1
	octave 5
	note A#, 1
	octave 6
	note G#, 1
	note __, 1
	note G#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	note A#, 1
	note F#, 1
	note __, 1
	note C#, 1
	octave 5
	note B_, 1
	note A#, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 1
	note F#, 1
	note __, 1
	note B_, 1
	note __, 1
	note A#, 1
	note F#, 1
	note __, 1
	music_setrepeat1a $2
	octave 7
	note C#, 3
	octave 6
	note B_, 1
	note __, 2
	music_dorepeat1a
	note A#, 4
	note __, 2
	note F#, 1
	note __, 3
	note E_, 4
	note F#, 1
	note __, 1
	note C#, 4
	note G#, 1
	note D#, 1
	note C_, 1
	note A#, 1
	note __, 1
	note A#, 1
	octave 7
	note C_, 1
	note __, 1
	note C_, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	octave 6
	note G#, 1
	note __, 1
	note D#, 1
	note C#, 1
	note C_, 1
	note __, 1
	music_setrepeat1a $2
	octave 7
	note C#, 1
	note __, 1
	note C_, 1
	octave 6
	note G#, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note D#, 3
	note C#, 1
	note __, 2
	note D#, 3
	note C#, 1
	note __, 2
	note C_, 4
	note __, 2
	octave 6
	note G#, 1
	note __, 3
	note F#, 4
	note G#, 1
	note __, 1
	note D#, 4
	jump_channel Music_8278e

MusicHeader_8202c_Ch2: ; 828af
	music_tempo_2 $7

Music_828b1: ; 828b1
	music_fa $79
	music_fb $11, $12, $3, $21
	music_e8 $15
	music_f9 $15, 4, 3
	octave 5
	music_setrepeat1d $2
	call_channel Music_82a1d
	note __, 1
	music_dorepeat1d
	call_channel Music_82a2b
	octave 6
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	call_channel Music_82a35
	music_setrepeat1a $4
	note G#, 4
	note B_, 5
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	note G#, 5
	note B_, 5
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $4
	note D#, 4
	note F#, 5
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $2
	note D#, 5
	note F#, 5
	music_dorepeat1a
	call_channel Music_82a2b
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	call_channel Music_82a35
	music_setrepeat1a $4
	octave 6
	note B_, 4
	octave 7
	note D_, 5
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	octave 6
	note B_, 5
	octave 7
	note D_, 5
	music_dorepeat1a
	music_fa $b9
	octave 6
	music_setrepeat1a $4
	note F#, 4
	note A_, 5
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $2
	note F#, 5
	note A_, 5
	music_dorepeat1a
	call_channel Music_82a2b
	note __, 2
	note G#, 1
	note __, 1
	note B_, 1
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note G#, 3
	note F#, 1
	note __, 3
	note D#, 1
	note F#, 1
	octave 7
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 6
	note B_, 2
	note __, 1
	note G#, 1
	note __, 4
	call_channel Music_82a3f
	music_fa $b9
	note __, 2
	music_tempo_2 $1
	octave 6
	note G#, 1
	note A_, 6
	music_tempo_2 $7
	note __, 1
	note F#, 1
	note A_, 1
	note __, 1
	note B_, 2
	octave 7
	note C#, 1
	octave 6
	note F#, 1
	note __, 3
	note F#, 1
	note A_, 1
	note G#, 3
	note __, 1
	note E_, 3
	note __, 1
	octave 7
	note D_, 2
	note __, 1
	music_tempo_2 $1
	note D#, 1
	music_tempo_2 $a
	note E_, 2
	music_tempo_2 $7
	octave 6
	note B_, 2
	note __, 2
	music_fa $b6
	octave 7
	note G#, 1
	octave 8
	note C#, 1
	octave 7
	note G#, 12
	note __, 4
	note B_, 4
	note A#, 4
	note F#, 4
	note __, 2
	note C#, 1
	note G#, 1
	note C#, 6
	note __, 2
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	note E_, 1
	note F#, 1
	note C#, 5
	note __, 1
	octave 6
	note B_, 1
	note A_, 1
	note G#, 4
	music_fa $b9
	note C#, 1
	note G#, 1
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	note A#, 3
	note B_, 1
	note __, 2
	octave 7
	note C#, 14
	note __, 2
	note C#, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note F#, 1
	note __, 1
	note E_, 3
	note D#, 1
	note __, 2
	note E_, 3
	note D#, 1
	note __, 2
	note C#, 12
	note __, 2
	octave 6
	note B_, 1
	note __, 1
	note A#, 4
	octave 7
	note C_, 3
	note C#, 1
	note __, 2
	note D#, 14
	note __, 2
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D#, 1
	note G#, 1
	note __, 1
	note F#, 3
	note F_, 1
	note __, 2
	note F#, 3
	note F_, 1
	note __, 2
	note D#, 12
	note __, 2
	note C#, 1
	note __, 1
	note C_, 4
	jump_channel Music_828b1

MusicHeader_8202c_Ch3: ; 829cf
	music_tempo_2 $7
	music_fa $3
	music_fb $0, $0, $4, $0
	music_noise_sample $f

Music_829da: ; 829da
	music_setrepeat1a $4
	call_channel Music_82a48
	music_dorepeat1a
	music_setrepeat1d $3
	music_setrepeat1a $4
	call_channel Music_82a48
	music_dorepeat1a
	music_setrepeat1a $4
	octave 4
	note B_, 2
	note __, 1
	octave 5
	note D_, 3
	note E_, 2
	music_dorepeat1a
	music_dorepeat1d
	music_setrepeat1a $4
	octave 5
	note F#, 2
	note __, 1
	note F#, 1
	note C#, 1
	octave 4
	note F#, 1
	note B_, 2
	note __, 1
	note B_, 1
	octave 5
	note C#, 1
	octave 4
	note F#, 1
	note B_, 2
	octave 5
	note C#, 2
	music_dorepeat1a
	music_setrepeat1a $4
	octave 5
	note G#, 2
	note __, 1
	note G#, 1
	note D#, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 2
	note __, 1
	note C#, 1
	note D#, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 2
	note D#, 2
	music_dorepeat1a
	jump_channel Music_829da

Music_82a1d: ; 82a1d
	music_setrepeat1a $2
	note D#, 1
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note G#, 1
	ret_channel

Music_82a2b: ; 82a2b
	music_tempo_2 $7
	music_fa $b9
	music_fb $11, $12, $3, $11
	ret_channel

Music_82a35: ; 82a35
	music_tempo_2 $1
	music_fa $b6
	music_fb $11, $0, $3, $11
	ret_channel

Music_82a3f: ; 82a3f
	music_fa $b6
	octave 8
	note G#, 1
	note G#, 1
	octave 7
	note G#, 1
	note __, 1
	ret_channel

Music_82a48: ; 82a48
	octave 4
	note G#, 2
	note __, 1
	note B_, 3
	octave 5
	note C#, 2
	ret_channel

Music_82a4f: ; 82a4f
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 1
	note D#, 2
	note D_, 1
	ret_channel

Music_82a56: ; 82a56
	note C_, 1
	note D_, 2
	note D#, 1
	note G#, 2
	note D#, 2
	ret_channel

Music_82a5c: ; 82a5c
	note C_, 2
	note D#, 2
	note G#, 1
	note D#, 2
	note D_, 1
	note C_, 1
	note D_, 2
	note D#, 1
	note G#, 1
	note G#, 1
	note D#, 2
	ret_channel

MusicHeader_8202c_Ch6: ; 82a68
	music_tempo_2 $7

Music_82a6a: ; 82a6a
	call_channel Music_82a4f
	call_channel Music_82a56
	note C_, 2
	note C_, 2
	note G#, 1
	note D_, 2
	note D_, 1
	music_tempo_2 $1
	note G#, 9
	note G#, 10
	note G#, 9
	note G#, 10
	note G#, 9
	note G#, 9
	music_tempo_2 $7
	music_setrepeat1a $5
	call_channel Music_82a4f
	call_channel Music_82a56
	call_channel Music_82a5c
	music_dorepeat1a
	call_channel Music_82a4f
	call_channel Music_82a56
	note C_, 2
	note D#, 2
	note G#, 1
	note D#, 2
	note D_, 1
	note C_, 1
	note D_, 2
	note D#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	music_setrepeat1a $4
	call_channel Music_82a4f
	call_channel Music_82a56
	call_channel Music_82a5c
	music_dorepeat1a
	jump_channel Music_82a6a

MusicHeader_82036_Ch1: ; 82aac
	music_tempo_2 $6
	music_fa $b7
	music_fb $11, $12, $6, $11
	music_e8 $12
	music_f9 $15, 4, 4
	octave 6
	note A_, 2
	note __, 2
	note __, 4
	octave 8
	note D_, 2
	note A_, 2
	octave 6
	note G#, 2
	note __, 2
	note __, 4
	octave 8
	note D_, 2
	note A_, 2
	octave 6
	note F_, 2
	note __, 2
	note __, 4
	octave 8
	note D_, 2
	note A_, 2
	octave 6
	note E_, 2
	note __, 2
	note __, 4
	octave 8
	note D_, 2
	note A_, 2

Music_82ad6: ; 82ad6
	music_fa $b7
	octave 6
	music_setrepeat1a $8
	note D_, 2
	note F_, 2
	note G#, 2
	note A_, 2
	note G#, 2
	note F_, 2
	music_dorepeat1a
	music_fb $11, $12, $3, $31
	note C_, 2
	music_tempo_2 $4
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	music_tempo_2 $6
	note G#, 2
	note F_, 2
	note G#, 2
	note B_, 2
	octave 6
	note C_, 10
	note __, 2
	octave 5
	note G#, 2
	music_tempo_2 $4
	note G_, 1
	note G#, 1
	note G_, 1
	music_tempo_2 $6
	note E_, 2
	note C#, 2
	note E_, 2
	note G_, 2
	note G#, 10
	note __, 2
	music_fb $11, $12, $6, $11
	music_setrepeat1a $4
	octave 6
	note F_, 2
	note G_, 2
	note G#, 2
	note B_, 2
	octave 7
	note C_, 2
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	octave 6
	note B_, 2
	note G#, 2
	note F_, 2
	music_dorepeat1a
	octave 5
	music_setrepeat1a $3
	note F_, 2
	note G#, 2
	music_dorepeat1a
	music_setrepeat1a $3
	note G_, 2
	note A#, 2
	music_dorepeat1a
	note G#, 2
	note B_, 2
	note G#, 2
	note B_, 2
	note G#, 2
	octave 6
	note D#, 2
	music_setrepeat1a $3
	octave 5
	note A#, 2
	octave 6
	note D_, 2
	music_dorepeat1a
	music_setrepeat1a $3
	note C#, 2
	note E_, 2
	music_dorepeat1a
	music_setrepeat1a $3
	note D#, 2
	note F#, 2
	music_dorepeat1a
	music_setrepeat1a $2
	octave 5
	note B_, 2
	octave 6
	note D_, 2
	music_dorepeat1a
	octave 5
	note B_, 2
	octave 6
	note F#, 2
	music_setrepeat1a $10
	note C#, 2
	note F_, 2
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $2
	note C#, 2
	note F_, 2
	music_dorepeat1a
	music_fa $b3
	music_setrepeat1a $3
	note C#, 2
	note F_, 2
	music_dorepeat1a
	jump_channel Music_82ad6

MusicHeader_82036_Ch2: ; 82b63
	music_tempo_2 $6
	music_fb $11, $12, $6, $11
	music_e8 $12
	music_f9 $15, 4, 5
	music_setrepeat1d $2
	music_fa $b9
	music_setrepeat1a $2
	octave 7
	note D_, 2
	note F_, 2
	note G#, 2
	note A_, 2
	music_fa $b6
	music_dorepeat1a
	music_fa $b4
	note D_, 2
	note F_, 2
	note G#, 2
	note A_, 2
	music_dorepeat1d

Music_82b84: ; 82b84
	call_channel Music_82cf6
	music_tempo_2 $3
	octave 7
	note B_, 1
	octave 8
	note C_, 1
	octave 7
	note B_, 16
	note __, 6
	note A_, 1
	note B_, 1
	note A_, 16
	note __, 4
	note G#, 1
	note A_, 1
	music_fb $11, $12, $6, $11
	music_setrepeat1a $2
	note G#, 4
	note E_, 4
	note F_, 4
	music_fa $b6
	music_dorepeat1a
	music_fa $b4
	music_setrepeat1a $2
	note G#, 4
	note E_, 4
	note F_, 4
	music_fa $b2
	music_dorepeat1a
	call_channel Music_82cf6
	note D_, 4
	note E_, 4
	note F_, 4
	note A_, 3
	note G#, 1
	note A_, 1
	music_tempo_2 $6
	note G#, 11
	music_tempo_2 $3
	note __, 5
	music_tempo_2 $6
	note A_, 2
	music_fb $11, $12, $6, $11
	music_setrepeat1a $2
	note F_, 2
	note G#, 2
	note A_, 2
	music_fa $b6
	music_dorepeat1a
	music_fa $b4
	music_setrepeat1a $2
	note F_, 2
	note G#, 2
	note A_, 2
	music_fa $b2
	music_dorepeat1a
	call_channel Music_82cf6
	music_setrepeat1a $2
	octave 7
	note F_, 1
	note __, 1
	octave 6
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note G#, 2
	music_tempo_2 $4
	note F_, 1
	note G#, 1
	note F_, 1
	music_tempo_2 $6
	note E_, 2
	note C_, 2
	octave 6
	note B_, 2
	music_tempo_2 $4
	note G#, 1
	note B_, 1
	note G#, 1
	music_tempo_2 $6
	music_setrepeat1a $2
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note E_, 2
	music_tempo_2 $4
	note C#, 1
	note E_, 1
	note C#, 1
	music_tempo_2 $6
	note C_, 2
	octave 6
	note G#, 2
	note G_, 2
	music_tempo_2 $4
	note E_, 1
	note G_, 1
	note E_, 1
	music_tempo_2 $6
	call_channel Music_82d0c
	note C_, 12
	octave 6
	note C#, 6
	note __, 2
	note F_, 2
	note G#, 2
	music_tempo_2 $3
	note G_, 1
	note G#, 1
	music_tempo_2 $6
	note G_, 3
	note E_, 1
	note __, 3
	note C_, 1
	note __, 3
	note F#, 2
	note F_, 2
	note F#, 2
	note A_, 2
	note A#, 2
	octave 7
	note D#, 2
	note D_, 2
	octave 6
	note B_, 2
	note A#, 2
	note A_, 2
	note A#, 1
	note __, 3
	note A_, 6
	note __, 2
	octave 7
	note C#, 2
	note E_, 2
	music_tempo_2 $3
	note D#, 1
	note E_, 1
	music_tempo_2 $6
	note D#, 3
	note C_, 1
	note __, 3
	octave 6
	note G#, 1
	note __, 3
	music_tempo_2 $3
	octave 8
	note C_, 1
	note C#, 7
	music_tempo_2 $6
	octave 7
	note B_, 2
	octave 8
	note C#, 2
	octave 7
	note G#, 2
	note F#, 2
	note F_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	note C#, 1
	note __, 3
	music_fb $11, $12, $6, $11
	octave 7
	call_channel Music_82cfe
	octave 8
	call_channel Music_82cfe
	music_e8 $0
	note __, 12
	note __, 12
	music_e8 $12
	jump_channel Music_82b84

MusicHeader_82036_Ch3: ; 82c74
	music_tempo_2 $6
	call_channel Music_82d2b
	music_setrepeat1a $4
	note __, 12
	music_dorepeat1a

Music_82c7d: ; 82c7d
	octave 4
	music_setrepeat1a $4
	note D_, 2
	note D_, 2
	note __, 16
	note G#, 2
	note A_, 2
	music_dorepeat1a
	music_setrepeat1a $2
	octave 4
	note F_, 2
	octave 5
	note C_, 2
	note C_, 2
	music_dorepeat1a
	octave 4
	note C_, 12
	music_setrepeat1a $2
	note C#, 2
	note G#, 2
	note G#, 2
	music_dorepeat1a
	note G#, 12
	music_setfreqoffset $1
	note __, 2
	music_fa $1
	music_fb $0, $0, $2, $0
	music_noise_sample $f
	call_channel Music_82d0c
	note C_, 10
	music_setfreqoffset $0
	call_channel Music_82d2b
	octave 4
	note F_, 2
	note __, 2
	note F_, 2
	note G#, 2
	octave 5
	note C#, 2
	octave 4
	note F_, 2
	note G_, 2
	note A#, 2
	octave 5
	note E_, 2
	note __, 4
	octave 4
	note G_, 2
	note G#, 4
	note B_, 4
	octave 5
	note D#, 2
	octave 4
	note G#, 2
	note A#, 2
	octave 5
	note D_, 2
	note F_, 2
	note __, 4
	octave 4
	note A#, 2
	octave 5
	note C#, 2
	note __, 2
	note C#, 2
	note E_, 2
	note A_, 2
	note C#, 2
	note D#, 2
	note F#, 2
	octave 6
	note C_, 2
	note __, 4
	octave 5
	note D#, 2
	octave 4
	note B_, 4
	octave 5
	note D_, 4
	note F#, 2
	octave 4
	note B_, 2
	octave 5
	note C#, 2
	note F_, 2
	note G#, 2
	note __, 4
	note C#, 2
	music_setrepeat1a $2
	octave 5
	note C#, 8
	note __, 2
	octave 4
	note G#, 2
	octave 5
	note C#, 3
	note __, 1
	note C#, 2
	note __, 6
	music_dorepeat1a
	note __, 12
	note __, 12
	jump_channel Music_82c7d

Music_82cf6: ; 82cf6
	music_fa $b9
	music_fb $11, $12, $3, $31
	ret_channel

Music_82cfe: ; 82cfe
	music_fa $b9
	music_setrepeat1a $2
	note F_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note __, 2
	music_fa $b6
	music_dorepeat1a
	ret_channel

Music_82d0c: ; 82d0c
	octave 5
	note F_, 12
	note G_, 8
	note G#, 2
	note B_, 2
	octave 6
	note C_, 2
	music_tempo_2 $4
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	music_tempo_2 $6
	note G#, 2
	note G_, 2
	note F_, 16
	note G_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note G_, 12
	note __, 4
	note F_, 4
	note E_, 10
	note F_, 1
	note E_, 1
	ret_channel

Music_82d2b: ; 82d2b
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $c
	ret_channel

Music_82d35: ; 82d35
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 6
	note D_, 4
	note E_, 6
	note C#, 2
	note D_, 2
	note C#, 2
	note E_, 6
	note C#, 2
	note D_, 4
	note E_, 4
	ret_channel

MusicHeader_82036_Ch6: ; 82d43
	music_tempo_2 $6
	call_channel Music_82d35
	note D_, 4

Music_82d49: ; 82d49
	call_channel Music_82d35
	note D_, 4
	call_channel Music_82d35
	note D_, 4
	music_setrepeat1a $2
	note G#, 4
	note C_, 2
	note G#, 4
	note C_, 2
	note G#, 4
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	music_dorepeat1a
	call_channel Music_82d35
	note D_, 4
	call_channel Music_82d35
	music_tempo_2 $2
	note D_, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note E_, 1
	note E_, 1
	note E_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	music_tempo_2 $6
	music_setrepeat1a $4
	note C_, 2
	note C#, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note C_, 2
	note C#, 2
	note G#, 4
	note D_, 2
	note C_, 2
	music_dorepeat1a
	music_setrepeat1a $3
	note E_, 4
	note D_, 2
	note C#, 4
	note C#, 2
	note E_, 4
	note D_, 4
	note D_, 4
	music_dorepeat1a
	jump_channel Music_82d49

MusicHeader_82040_Ch1: ; 82d8f
	music_tempo_2 $9
	music_e8 $12
	music_f9 $15, 4, 3

Music_82d96: ; 82d96
	music_fa $b4
	music_fb $21, $11, $2, $11
	octave 5
	music_setrepeat1a $8
	note A_, 1
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note G_, 1
	note D#, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note A_, 1
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note D#, 1
	note G_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note C#, 1
	note E_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note D_, 1
	note F#, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note F#, 1
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	note G_, 1
	note A#, 1
	music_dorepeat1a
	music_fa $b3
	note G_, 1
	note A#, 1
	music_fa $b1
	note G_, 1
	note A#, 1
	music_fa $b5
	octave 5
	music_setrepeat1a $8
	note B_, 1
	note G_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note A_, 1
	note F_, 1
	music_dorepeat1a
	octave 6
	music_setrepeat1a $8
	note E_, 1
	note C_, 1
	music_dorepeat1a
	call_channel Music_83074
	music_setrepeat1a $8
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	music_dorepeat1a
	call_channel Music_83074
	music_setrepeat1a $2
	octave 6
	note D_, 1
	octave 5
	note A_, 1
	note G_, 1
	note A_, 1
	note D_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note G_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note G_, 1
	note A#, 1
	music_dorepeat1a
	octave 5
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C#, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 5
	note B_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C#, 1
	note E_, 1
	note F_, 2
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note D_, 1
	note A#, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	call_channel Music_8307c
	octave 6
	note E_, 1
	note A_, 1
	octave 7
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note __, 1
	music_fa $b5
	music_fb $21, $11, $2, $11
	octave 5
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note A_, 1
	call_channel Music_8307c
	octave 7
	note F_, 1
	note E_, 1
	note C_, 1
	octave 6
	note A_, 1
	note E_, 1
	music_fa $b5
	music_fb $11, $12, $3, $31
	octave 5
	note G_, 5
	note __, 1
	music_fb $11, $12, $4, $11
	note G_, 1
	note G_, 1
	music_fb $11, $12, $3, $31
	note E_, 3
	note __, 1
	note A_, 4
	music_fb $21, $11, $2, $11
	music_setrepeat1a $7
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	music_dorepeat1a
	music_fa $b3
	octave 6
	note C#, 1
	note E_, 1
	jump_channel Music_82d96

MusicHeader_82040_Ch2: ; 82e8f
	music_tempo_2 $9
	music_e8 $12
	music_f9 $15, 4, 3

Music_82e96: ; 82e96
	music_fa $b6
	music_fb $21, $11, $2, $11
	octave 6
	music_setrepeat1a $8
	note C_, 1
	note E_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	note C_, 1
	note E_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	music_dorepeat1a
	octave 5
	music_setrepeat1a $8
	note B_, 1
	note G#, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 6
	note C#, 1
	octave 5
	note A_, 1
	music_dorepeat1a
	octave 6
	music_setrepeat1a $8
	note D#, 1
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	note F_, 1
	note D_, 1
	music_dorepeat1a
	music_fa $b5
	note F_, 1
	note D_, 1
	music_fa $b3
	note F_, 1
	note D_, 1
	music_tempo_2 $9
	music_fa $b9
	music_fb $11, $12, $3, $31
	note __, 2
	note G_, 4
	music_tempo_2 $1
	note __, 4
	note A_, 5
	note B_, 4
	octave 7
	note C_, 5
	music_tempo_2 $9
	note D_, 4
	note F#, 2
	note E_, 2
	note D_, 3
	note __, 1
	octave 6
	music_setrepeat1a $4
	note C_, 1
	note E_, 1
	music_dorepeat1a
	note F_, 1
	note G_, 1
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 3
	note __, 1
	octave 7
	note D_, 3
	note __, 1
	octave 6
	note A_, 3
	note __, 1
	octave 7
	note C_, 3
	note __, 1
	octave 6
	note B_, 2
	music_tempo_2 $1
	note __, 4
	note A_, 5
	note B_, 4
	note A_, 5
	music_tempo_2 $9
	note G_, 4
	note __, 2
	octave 7
	note G_, 1
	note F#, 1
	note D_, 1
	octave 6
	note B_, 1
	octave 7
	note D_, 1
	note E_, 1
	octave 6
	note A_, 4
	note __, 2
	octave 7
	note C_, 4
	note __, 2
	note D_, 3
	music_tempo_2 $1
	note C#, 4
	note C_, 5
	music_tempo_2 $9
	octave 6
	note B_, 6
	note __, 2
	music_fb $11, $12, $4, $11
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	note G_, 1
	note D_, 1
	music_fb $11, $12, $3, $31
	note G_, 4
	note __, 2
	note F_, 4
	note __, 2
	note E_, 2
	note F_, 2
	note E_, 4
	note __, 2
	note C_, 4
	note __, 2
	octave 6
	note A_, 2
	note A#, 2
	octave 7
	note C_, 4
	note __, 2
	octave 6
	note G_, 4
	note __, 2
	note A#, 2
	note __, 2
	note A_, 4
	note __, 2
	octave 7
	note C#, 2
	note __, 2
	octave 6
	note A_, 2
	note B_, 2
	octave 7
	note C#, 2
	note D_, 2
	note C_, 1
	octave 6
	note A#, 1
	note A_, 2
	note G_, 1
	note F_, 1
	note E_, 2
	note D_, 1
	note C_, 1
	octave 5
	note A#, 4
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 5
	note __, 1
	music_fb $11, $12, $4, $11
	note D_, 1
	note D_, 1
	music_fb $11, $12, $3, $31
	note C_, 3
	note __, 1
	note E_, 3
	music_tempo_2 $1
	note F_, 4
	note G_, 5
	music_tempo_2 $9
	music_fb $11, $12, $4, $11
	note A_, 1
	octave 7
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1
	music_fb $11, $12, $3, $31
	note G_, 1
	note E_, 1
	music_fa $b6
	note G_, 1
	note B_, 1
	jump_channel Music_82e96

MusicHeader_82040_Ch3: ; 82fb6
	music_f9 $15, 4, 5

Music_82fb9: ; 82fb9
	call_channel Music_8306a
	music_noise_sample $c
	music_setfreqoffset $1
	octave 5
	note A_, 6
	note F_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	note F_, 2
	note G_, 7
	call_channel Music_83062
	note A_, 4
	note A#, 5
	call_channel Music_8306a
	octave 6
	note C_, 6
	octave 5
	note A#, 2
	note A_, 6
	octave 6
	note G_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	octave 5
	note A_, 2
	octave 6
	note C_, 10
	note D_, 2
	note C_, 2
	octave 5
	note A#, 2
	note A_, 3
	call_channel Music_83062
	note G#, 4
	note G_, 5
	call_channel Music_8306a
	note F#, 4
	note G#, 2
	note A_, 2
	note B_, 2
	note G#, 2
	note A_, 2
	note B_, 2
	octave 6
	note C#, 6
	octave 5
	note B_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	note C#, 2
	note F_, 2
	note D#, 6
	note C#, 2
	note D#, 2
	note C_, 10
	music_tempo_2 $9
	music_fb $0, $0, $4, $0
	music_setfreqoffset $0
	music_noise_sample $f
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	music_setrepeat1a $5
	note G_, 8
	note __, 2
	note D_, 1
	note __, 1
	note F_, 4
	music_dorepeat1a
	note G_, 8
	note __, 2
	note D_, 1
	note __, 1
	note F_, 2
	note G_, 2
	note A#, 10
	note F_, 1
	note __, 1
	note A_, 4
	note G_, 10
	note G_, 1
	note __, 1
	octave 5
	note D_, 4
	note C_, 10
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 4
	octave 4
	note A_, 10
	note A_, 1
	note __, 1
	octave 5
	note E_, 2
	octave 4
	note A_, 2
	note A#, 10
	note A#, 1
	note __, 1
	octave 5
	note F_, 2
	octave 4
	note A_, 2
	note G_, 8
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note G_, 1
	octave 4
	note A#, 1
	octave 5
	note E_, 1
	note D_, 1
	note C_, 1
	octave 4
	note A_, 6
	note __, 2
	note A_, 2
	note A_, 2
	note __, 2
	note A_, 2
	octave 5
	music_setrepeat1a $5
	note E_, 1
	note G_, 1
	music_dorepeat1a
	note E_, 1
	note C#, 1
	note D_, 1
	note E_, 1
	music_fa $2
	note F_, 1
	note G_, 1
	jump_channel Music_82fb9

Music_83062: ; 83062
	music_tempo_2 $1
	music_fb $0, $0, $1, $0
	ret_channel

Music_8306a: ; 8306a
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $6, $0
	ret_channel

Music_83074: ; 83074
	music_setrepeat1a $8
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	music_dorepeat1a
	ret_channel

Music_8307c: ; 8307c
	music_fa $b7
	music_fb $11, $12, $4, $11
	ret_channel

MusicHeader_82040_Ch6: ; 83084
	music_tempo_2 $9

Music_83086: ; 83086
	music_setrepeat1a $15
	note C_, 2
	note C#, 2
	note E_, 2
	note C_, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note E_, 2
	music_dorepeat1a
	note C_, 4
	note D_, 4
	note C#, 2
	note C_, 2
	note E_, 2
	note E_, 2
	jump_channel Music_83086

MusicHeader_8204a_Ch1: ; 8309a
	music_tempo_2 $6
	music_fa $b8
	music_f9 $15, 4, 4

Music_830a1: ; 830a1
	call_channel Music_832be
	call_channel Music_832de
	call_channel Music_832be
	music_fb $11, $12, $4, $11
	call_channel Music_8331d
	note D_, 1
	octave 6
	note A#, 1
	note F_, 1
	note D_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note F_, 1
	note D_, 1
	octave 5
	note A#, 1
	note F_, 1
	octave 6
	note D_, 1
	note F_, 1
	note A#, 1
	octave 7
	note D_, 1
	call_channel Music_8331d
	call_channel Music_8331d
	music_fb $11, $12, $4, $41
	call_channel Music_832de
	note G#, 4
	note __, 2
	note D#, 1
	note G#, 1
	octave 6
	note C_, 4
	note __, 2
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	note D#, 4
	note __, 2
	note C_, 1
	note D#, 1
	note G#, 4
	note __, 2
	note D#, 1
	note G#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 10
	note __, 2
	music_setrepeat1a $2
	octave 6
	note A#, 1
	octave 7
	note F_, 1
	music_dorepeat1a
	octave 6
	note A#, 8
	octave 7
	note F_, 1
	note D_, 1
	octave 6
	note A#, 1
	note F_, 1
	octave 5
	note E_, 4
	note __, 2
	octave 4
	note B_, 1
	octave 5
	note E_, 1
	note G#, 4
	note __, 2
	note E_, 1
	note G#, 1
	note B_, 4
	note __, 2
	note G#, 1
	note B_, 1
	octave 6
	note E_, 4
	note __, 2
	octave 5
	note B_, 1
	octave 6
	note E_, 1
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 10
	note __, 2
	music_setrepeat1a $2
	octave 6
	note F#, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	octave 6
	note F#, 8
	octave 7
	note C#, 1
	octave 6
	note A#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note D#, 1
	octave 5
	note B_, 1
	octave 6
	note G#, 2
	note F_, 1
	note C#, 1
	octave 5
	note G#, 1
	octave 6
	note A#, 2
	octave 7
	note C#, 1
	note __, 1
	note C_, 2
	octave 6
	note G#, 2
	jump_channel Music_830a1

MusicHeader_8204a_Ch2: ; 8313e
	music_tempo_2 $6
	music_f9 $15, 4, 4

Music_83143: ; 83143
	music_fa $79
	call_channel Music_8329a
	call_channel Music_8328a
	note A#, 2
	octave 7
	note C#, 2
	call_channel Music_8328a
	note F#, 2
	note F_, 2
	call_channel Music_8329a
	note E_, 8
	note __, 2
	note C#, 2
	note D_, 2
	note E_, 2
	note F_, 4
	note __, 2
	note A#, 4
	music_tempo_2 $3
	note __, 3
	octave 8
	note C#, 1
	music_tempo_2 $6
	note D_, 4
	note C#, 2
	octave 7
	note A_, 2
	note __, 2
	note E_, 8
	note __, 2
	music_fb $11, $12, $4, $11
	note E_, 1
	note C#, 1
	octave 6
	note A_, 1
	note E_, 1
	octave 7
	note C#, 1
	octave 6
	note A_, 1
	note E_, 1
	note C#, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 7
	note C#, 1
	note E_, 1
	note C#, 1
	note E_, 1
	note A_, 1
	music_fb $11, $12, $4, $41
	call_channel Music_8328a
	note A#, 2
	octave 7
	note C#, 2
	call_channel Music_8328a
	note F#, 2
	note F_, 2
	note D#, 1
	note C_, 1
	note D#, 1
	note G#, 1
	note A#, 4
	note G#, 4
	octave 7
	note D#, 4
	note G#, 4
	note G_, 4
	note D#, 4
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note __, 2
	note A#, 8
	note __, 2
	note F_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 8
	note A#, 1
	note F_, 1
	note D_, 1
	octave 6
	note A#, 1
	octave 5
	note B_, 1
	note G#, 1
	note B_, 1
	octave 6
	note E_, 1
	note F#, 4
	note E_, 4
	note B_, 4
	octave 7
	note E_, 4
	note D#, 4
	octave 6
	note B_, 4
	octave 7
	note D#, 2
	note __, 2
	note C#, 2
	note __, 2
	note __, 2
	note F#, 8
	note __, 2
	note C#, 1
	note F#, 1
	note C#, 1
	note F#, 1
	note C#, 8
	note F#, 1
	note C#, 1
	octave 6
	note A#, 1
	note F#, 1
	music_fa $b9
	note B_, 1
	note F#, 1
	note D#, 1
	octave 7
	note C#, 2
	octave 6
	note G#, 1
	note F_, 1
	note C#, 1
	octave 7
	note D#, 8
	jump_channel Music_83143

MusicHeader_8204a_Ch3: ; 831e1
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $3, $0
	music_noise_sample $c

Music_831ec: ; 831ec
	music_setrepeat1d $4
	call_channel Music_83335
	music_dorepeat1d
	music_setrepeat1a $4
	note A_, 4
	note C#, 1
	note __, 1
	note E_, 4
	note A_, 1
	note __, 3
	note D_, 1
	note E_, 1
	music_dorepeat1a
	music_setrepeat1d $2
	call_channel Music_83335
	music_dorepeat1d
	note G#, 2
	note __, 1
	note G#, 1
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G#, 6
	note __, 2
	octave 5
	note D#, 1
	note G#, 1
	octave 4
	note G#, 2
	note __, 1
	note G#, 1
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G#, 2
	note __, 2
	note G#, 2
	octave 5
	note D#, 2
	octave 4
	note G#, 1
	octave 5
	note G#, 1
	octave 4
	note A#, 2
	note __, 1
	note A#, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note A#, 2
	note __, 2
	note A#, 4
	octave 5
	note F_, 1
	note A#, 1
	octave 4
	note A#, 2
	note __, 1
	note A#, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note A#, 2
	note __, 1
	note A#, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note A#, 2
	octave 5
	note A#, 2
	octave 4
	note E_, 2
	note __, 1
	note E_, 1
	note B_, 1
	note __, 1
	note E_, 6
	note __, 2
	note B_, 1
	octave 5
	note E_, 1
	octave 4
	note E_, 2
	note __, 1
	note E_, 1
	note B_, 1
	note __, 1
	note E_, 2
	note __, 2
	note E_, 2
	note B_, 2
	note E_, 1
	octave 5
	note E_, 1
	octave 4
	note F#, 2
	note __, 1
	note F#, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F#, 2
	note __, 2
	note F#, 4
	octave 5
	note C#, 1
	note F#, 1
	octave 4
	note F#, 2
	note __, 1
	note F#, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F#, 2
	note __, 1
	note F#, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F#, 2
	octave 5
	note F#, 2
	octave 4
	note B_, 2
	note __, 1
	octave 5
	note C#, 3
	octave 4
	note G#, 1
	note __, 1
	octave 5
	note D#, 2
	octave 4
	note D#, 1
	note __, 1
	note G#, 1
	note A#, 3
	jump_channel Music_831ec

Music_8328a: ; 8328a
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 16
	note __, 4
	octave 6
	note A#, 2
	music_tempo_2 $4
	note G#, 1
	note A#, 1
	note G#, 1
	music_tempo_2 $6
	ret_channel

Music_8329a: ; 8329a
	music_fb $11, $12, $7, $11
	note __, 2
	music_e8 $12
	octave 5
	note C#, 2
	note D#, 2
	note G#, 2
	note A#, 2
	octave 6
	note C#, 2
	note D#, 2
	octave 5
	note G#, 2
	note A#, 2
	octave 6
	note D#, 2
	note G#, 2
	note A#, 2
	octave 7
	note C#, 2
	octave 6
	note G#, 2
	note A#, 2
	octave 7
	note D#, 2
	music_fb $11, $12, $4, $41
	ret_channel

Music_832be: ; 832be
	music_fb $11, $12, $7, $11
	note __, 2
	music_e8 $12
	octave 4
	note G#, 2
	note A#, 2
	octave 5
	note C#, 2
	note D#, 2
	note G#, 2
	note A#, 2
	note C#, 2
	note D#, 2
	note A#, 2
	octave 6
	note C#, 2
	note D#, 2
	note F#, 2
	note D#, 2
	note F#, 2
	note A#, 2
	music_fb $11, $12, $4, $41
	ret_channel

Music_832de: ; 832de
	music_setrepeat1a $2
	octave 6
	note A#, 1
	octave 7
	note D#, 1
	music_dorepeat1a
	octave 6
	note A#, 2
	music_fa $b5
	octave 7
	note D#, 1
	note A#, 1
	note D#, 1
	note A#, 1
	note D#, 4
	note __, 2
	music_fa $b8
	octave 6
	note D#, 2
	music_tempo_2 $4
	note C#, 1
	note D#, 1
	note C#, 1
	music_tempo_2 $6
	octave 5
	note A#, 8
	note __, 4
	music_setrepeat1a $2
	octave 6
	note A#, 1
	octave 7
	note D#, 1
	music_dorepeat1a
	octave 6
	note A#, 4
	octave 5
	note G#, 1
	note A#, 1
	note __, 1
	note A#, 1
	octave 6
	note C#, 1
	octave 5
	note A#, 3
	octave 6
	note D#, 2
	music_tempo_2 $4
	note C#, 1
	note D#, 1
	note C#, 1
	music_tempo_2 $6
	octave 5
	note A#, 8
	note __, 4
	ret_channel

Music_8331d: ; 8331d
	octave 7
	note C#, 1
	octave 6
	note A_, 1
	note E_, 1
	note C#, 1
	note A_, 1
	note E_, 1
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	note C#, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 7
	note C#, 1
	ret_channel

Music_83335: ; 83335
	octave 4
	note C#, 3
	note D#, 1
	note __, 2
	music_setrepeat1a $2
	note D#, 1
	octave 5
	note D#, 1
	octave 4
	music_dorepeat1a
	note D#, 2
	note __, 2
	note D#, 1
	note __, 1
	note F#, 3
	note D#, 1
	note __, 2
	note D#, 2
	note A#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 2
	note C#, 2
	ret_channel

Music_8334f: ; 8334f
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	ret_channel

MusicHeader_8204a_Ch6: ; 8335c
	music_tempo_2 $6

Music_8335e: ; 8335e
	call_channel Music_8334f
	note G#, 1
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 2
	call_channel Music_8334f
	note C_, 2
	note G#, 2
	note G#, 2
	note C_, 2
	call_channel Music_8334f
	note G#, 1
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1a $3
	call_channel Music_8334f
	note C_, 2
	note G#, 2
	note G#, 2
	note C_, 2
	music_dorepeat1a
	music_setrepeat1a $3
	call_channel Music_8334f
	note G#, 1
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 2
	call_channel Music_8334f
	note C_, 2
	note G#, 2
	note G#, 2
	note C_, 2
	music_dorepeat1a
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 1
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 2
	jump_channel Music_8335e

MusicHeader_82054_Ch1: ; 833a1
	music_tempo_2 $8
	music_e8 $18
	music_setfreqoffset $1
	music_f9 $15, 4, 4

Music_833aa: ; 833aa
	note __, 1
	call_channel Music_837d0
	octave 5
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	music_fa $72
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note __, 1
	call_channel Music_837d8
	octave 5
	note D_, 1
	note G_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note A#, 1
	note A_, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note G_, 1
	call_channel Music_837e0
	note __, 1
	music_fa $b4
	octave 5
	note G_, 1
	music_setrepeat1a $2
	octave 6
	note D_, 1
	note F#, 1
	note A#, 1
	note A_, 1
	octave 7
	note C#, 1
	note F#, 1
	music_fa $b2
	music_dorepeat1a
	note __, 2
	music_tempo_2 $8
	note __, 1
	call_channel Music_837d0
	octave 6
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	music_fa $72
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note __, 1
	call_channel Music_837d8
	octave 5
	note G_, 1
	note A#, 1
	note A_, 1
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	note F_, 1
	note C_, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	note A_, 1
	note F_, 1
	note D_, 1
	call_channel Music_837e0
	music_fa $b4
	music_setrepeat1a $2
	octave 7
	note F#, 1
	octave 6
	note G_, 1
	octave 5
	note G#, 1
	octave 4
	note A_, 1
	octave 5
	note A#, 1
	octave 6
	note B_, 1
	octave 7
	note D#, 1
	music_fa $b2
	music_dorepeat1a
	note __, 1
	music_tempo_2 $8
	music_fa $b3
	music_fb $11, $12, $3, $11
	octave 5
	note A#, 1
	note A#, 2
	octave 6
	note C_, 1
	note C_, 2
	note D_, 1
	note D_, 2
	note D#, 1
	note D#, 2
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note G_, 1
	note D_, 6
	note __, 2
	note __, 1
	octave 5
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	note C_, 2
	note D_, 1
	note D_, 2
	note D#, 1
	note D#, 2
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 8
	music_tempo_2 $4
	note __, 1
	music_tempo_2 $8
	music_fa $78
	music_fb $11, $13, $4, $11
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note G_, 1
	note A#, 1
	music_setrepeat1a $3
	note A_, 1
	note A#, 1
	music_dorepeat1a
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 9
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 2
	note D_, 1
	note D#, 1
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note A#, 2
	note A_, 1
	note G_, 1
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	music_fa $76
	music_setrepeat1a $4
	note A_, 1
	note A#, 1
	music_dorepeat1a
	music_fa $78
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 2
	note D_, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 4
	note __, 1
	note __, 2
	music_tempo_2 $4
	note D#, 1
	note F_, 1
	music_tempo_2 $8
	note F#, 4
	note __, 1
	note __, 2
	music_tempo_2 $4
	note G_, 1
	note F#, 1
	music_tempo_2 $8
	music_fb $11, $13, $3, $11
	note F_, 3
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	music_tempo_2 $4
	note __, 1
	music_tempo_2 $8
	music_fb $11, $11, $2, $11
	music_fa $73
	music_setrepeat1a $2
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	music_dorepeat1a
	call_channel Music_837e8
	music_fa $74
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note G_, 1
	note F#, 1
	call_channel Music_837e8
	music_fa $74
	octave 6
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note A#, 1
	note G#, 1
	note G_, 1
	call_channel Music_837f2
	octave 6
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	music_tempo_2 $4
	note __, 1
	music_tempo_2 $8
	call_channel Music_837f2
	octave 6
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	music_setrepeat1a $4
	note G_, 1
	note F#, 1
	music_dorepeat1a
	jump_channel Music_833aa

MusicHeader_82054_Ch2: ; 83540
	music_tempo_2 $8
	music_e8 $18
	music_f9 $15, 4, 5

Music_83547: ; 83547
	call_channel Music_837ad
	octave 5
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	music_fa $77
	note A_, 1
	note A#, 1
	music_fa $75
	note A_, 1
	note A#, 1
	call_channel Music_837b5
	octave 7
	note D_, 3
	note __, 1
	note C#, 3
	note __, 1
	note C_, 3
	note __, 1
	octave 6
	note A#, 3
	note __, 1
	music_tempo_2 $4
	music_fb $11, $11, $2, $11
	music_setrepeat1a $2
	octave 5
	note D_, 1
	note F#, 1
	note A#, 1
	note A_, 1
	octave 7
	note C#, 1
	note F#, 1
	music_fa $73
	music_dorepeat1a
	music_tempo_2 $8
	note __, 2
	call_channel Music_837ad
	octave 6
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	music_fa $77
	note C_, 1
	note D_, 1
	music_fa $75
	note C_, 1
	note D_, 1
	call_channel Music_837b5
	octave 7
	note F_, 3
	note __, 1
	note E_, 3
	note __, 1
	note D#, 3
	note __, 1
	note D_, 3
	note __, 1
	music_tempo_2 $4
	music_fb $11, $11, $2, $11
	music_setrepeat1a $2
	octave 7
	note F#, 1
	octave 6
	note G_, 1
	octave 5
	note G#, 1
	note __, 1
	note A#, 1
	octave 6
	note B_, 1
	octave 7
	note D#, 1
	music_fa $73
	music_dorepeat1a
	music_tempo_2 $8
	note __, 1
	call_channel Music_837b5
	call_channel Music_8379a
	octave 6
	note A#, 1
	note A_, 1
	note G_, 1
	note D_, 5
	note __, 2
	note __, 2
	octave 5
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	call_channel Music_8379a
	octave 6
	note A_, 10
	note __, 2
	note __, 4
	note A#, 1
	note A_, 1
	note G_, 1
	note D_, 13
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	octave 7
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	music_fa $77
	note D#, 1
	note D_, 1
	music_setrepeat1a $4
	note C_, 1
	note D_, 1
	music_dorepeat1a
	music_fa $79
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	music_tempo_2 $1
	music_fa $78
	note D_, 2
	note F#, 2
	note A_, 2
	music_fa $79
	octave 7
	note D_, 10
	music_tempo_2 $8
	note __, 1
	octave 5
	note F_, 1
	music_tempo_2 $1
	music_fa $78
	octave 6
	note C_, 2
	note E_, 2
	note G_, 2
	music_fa $79
	note A#, 10
	music_tempo_2 $8
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note C#, 1
	note C_, 1
	octave 5
	note A#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note __, 1
	octave 6
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	note D_, 1
	note __, 1
	note G_, 1
	music_fb $11, $13, $3, $11
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	music_fa $74
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	music_fa $79
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	music_fa $74
	note B_, 1
	note A#, 1
	note G#, 1
	note G_, 1
	call_channel Music_837bd
	music_fa $79
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note G_, 1
	note F#, 1
	call_channel Music_837bd
	music_fa $79
	octave 6
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note A#, 1
	note G#, 1
	note G_, 1
	call_channel Music_837bd
	music_fa $79
	octave 6
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	call_channel Music_837bd
	music_fa $79
	octave 6
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	music_fa $77
	octave 5
	note B_, 1
	note A#, 1
	jump_channel Music_83547

MusicHeader_82054_Ch3: ; 836b3
	music_tempo_2 $8
	music_fa $3
	music_noise_sample $f

Music_836b9: ; 836b9
	music_fb $0, $0, $7, $0
	octave 4
	note G_, 2
	note G_, 2
	note A#, 2
	note __, 10
	note __, 10
	octave 5
	note D_, 2
	octave 4
	note F_, 4
	octave 4
	note G_, 2
	note G_, 2
	note A#, 2
	note __, 10
	note __, 10
	note G_, 2
	octave 5
	note D_, 4
	note C_, 2
	note C_, 2
	octave 4
	note G_, 4
	note __, 2
	note G_, 2
	note A#, 1
	octave 5
	note C_, 3
	octave 4
	note G_, 2
	note G_, 2
	note D_, 4
	note __, 2
	note G_, 2
	octave 5
	note C_, 1
	note D_, 3
	octave 4
	note A_, 2
	note A_, 2
	note D#, 4
	note __, 2
	note A_, 2
	note A_, 1
	octave 5
	note D#, 3
	note D_, 2
	note D_, 2
	octave 4
	note A_, 4
	note __, 2
	note A_, 2
	octave 5
	note D_, 1
	octave 4
	note A_, 3
	music_fb $0, $0, $4, $0
	note G_, 10
	note A_, 1
	note A#, 1
	octave 5
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 2
	note __, 1
	octave 4
	note G_, 1
	octave 5
	note G_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 9
	octave 4
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 5
	note C_, 1
	note D_, 1
	note D#, 10
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	note B_, 1
	octave 5
	note C#, 1
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	octave 4
	note __, 1
	note G_, 1
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	music_fb $0, $0, $1, $0
	note A_, 6
	music_tempo_2 $4
	note __, 1
	note G_, 1
	note F_, 1
	note E_, 1
	music_tempo_2 $8
	note D_, 6
	music_tempo_2 $4
	note __, 1
	note E_, 1
	note F_, 1
	note F#, 1
	music_tempo_2 $8
	music_fb $0, $0, $4, $0
	note G_, 8
	music_setrepeat1a $6
	octave 5
	note C_, 1
	note C_, 1
	note __, 1
	octave 4
	note G_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 5
	note C#, 1
	note C#, 1
	note __, 1
	octave 4
	note G#, 1
	music_dorepeat1a
	octave 5
	note C_, 1
	note C_, 1
	note __, 1
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	note __, 1
	note G_, 2
	note C#, 1
	note C#, 1
	note __, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	jump_channel Music_836b9

Music_8379a: ; 8379a
	octave 6
	note C_, 1
	note C_, 1
	note __, 1
	note D_, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note F_, 1
	note F_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	ret_channel

Music_837ad: ; 837ad
	music_fa $79
	music_fb $11, $11, $3, $11
	ret_channel

Music_837b5: ; 837b5
	music_fa $79
	music_fb $11, $13, $4, $11
	ret_channel

Music_837bd: ; 837bd
	music_fa $79
	music_setrepeat1a $2
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_fa $74
	music_setrepeat1a $2
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	ret_channel

Music_837d0: ; 837d0
	music_fa $73
	music_fb $11, $11, $3, $11
	ret_channel

Music_837d8: ; 837d8
	music_fa $b8
	music_fb $11, $13, $4, $11
	ret_channel

Music_837e0: ; 837e0
	music_tempo_2 $4
	music_fb $11, $0, $1, $11
	ret_channel

Music_837e8: ; 837e8
	music_fa $73
	music_setrepeat1a $4
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	ret_channel

Music_837f2: ; 837f2
	music_fb $11, $0, $2, $11
	music_fa $73
	music_setrepeat1a $3
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	octave 5
	note A#, 1
	music_tempo_2 $4
	octave 6
	note C_, 1
	music_tempo_2 $8
	music_fa $78
	music_fb $11, $13, $4, $11
	ret_channel

Music_83810: ; 83810
	note G#, 2
	note E_, 2
	note D_, 2
	note D#, 2
	note G#, 1
	note G#, 1
	note D#, 2
	ret_channel

MusicHeader_82054_Ch6: ; 83818
	music_tempo_2 $8

Music_8381a: ; 8381a
	music_setrepeat1d $2
	note C_, 2
	note C_, 2
	note E_, 2
	music_setrepeat1a $6
	note D_, 1
	note C#, 1
	note D#, 2
	music_dorepeat1a
	note G#, 1
	note G#, 1
	music_dorepeat1d
	music_setrepeat1a $4
	note C_, 2
	note C_, 2
	note E_, 2
	note D_, 1
	note C#, 1
	note D#, 2
	note D#, 2
	note D_, 1
	note C#, 1
	note E_, 2
	music_dorepeat1a
	note C_, 4
	call_channel Music_83810
	note C_, 3
	note C_, 1
	call_channel Music_83810
	music_setrepeat1a $2
	note C_, 4
	note G#, 2
	note E_, 2
	note D_, 2
	note D#, 2
	note G#, 2
	note D#, 2
	music_dorepeat1a
	note D_, 2
	note G#, 2
	note E_, 2
	note C_, 2
	note D#, 1
	note G#, 2
	note C_, 1
	note D#, 2
	note G#, 2
	note C_, 2
	music_setrepeat1a $3
	note D_, 2
	note G#, 2
	music_dorepeat1a
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 1
	note G#, 1
	music_setrepeat1a $d
	note C_, 1
	note G#, 2
	note D#, 1
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note D#, 1
	note G#, 1
	music_setrepeat1a $3
	note C_, 1
	note G#, 2
	note D#, 1
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note C_, 1
	note G#, 2
	note D#, 1
	note C_, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note C_, 2
	note E_, 2
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	jump_channel Music_8381a

MusicHeader_8205e_Ch1: ; 83881
	music_tempo_2 $9
	music_e8 $1b
	music_setfreqoffset $1

Music_83887: ; 83887
	music_fb $11, $11, $7, $12
	music_setrepeat1a $3
	call_channel Music_83a8c
	call_channel Music_83ab6
	music_dorepeat1a
	call_channel Music_83a8c
	music_tempo_2 $6
	music_fa $b4
	music_fb $11, $11, $2, $11
	octave 5
	call_channel Music_83ac3
	octave 8
	note C#, 1
	music_tempo_2 $9
	music_fa $78
	music_fb $11, $11, $7, $12
	music_setrepeat1a $4
	octave 5
	note A#, 1
	octave 6
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note C_, 1
	note D#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note C_, 1
	note D_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 5
	note A#, 1
	octave 6
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 5
	note A#, 1
	octave 6
	note E_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 6
	note F_, 1
	note A_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note F_, 1
	note G#, 1
	music_dorepeat1a
	music_setrepeat1d $2
	music_setrepeat1a $4
	octave 6
	note F_, 1
	octave 7
	note C_, 1
	music_dorepeat1a
	octave 6
	music_setrepeat1a $4
	note F_, 1
	note B_, 1
	music_dorepeat1a
	music_dorepeat1d
	octave 6
	music_setrepeat1a $10
	note D#, 1
	note F#, 1
	music_dorepeat1a
	music_tempo_2 $1
	note __, 9
	note __, 5
	music_tempo_2 $9
	music_fb $11, $11, $3, $11
	music_fa $b3
	call_channel Music_83a7e
	call_channel Music_83a7e
	music_fa $b2
	call_channel Music_83a7e
	call_channel Music_83a7e
	music_fa $b3
	call_channel Music_83a85
	call_channel Music_83a85
	music_fa $b2
	call_channel Music_83a85
	octave 8
	note C_, 1
	octave 7
	note G#, 1
	music_tempo_2 $1
	note F#, 4
	music_tempo_2 $9
	jump_channel Music_83887

MusicHeader_8205e_Ch2: ; 8392b
	music_tempo_2 $9
	music_f9 $15, 4, 5

Music_83930: ; 83930
	music_e8 $0
	music_fa $b9
	music_fb $11, $11, $5, $51
	note __, 12
	music_e8 $12
	octave 5
	note F#, 3
	music_tempo_2 $1
	note F_, 4
	note E_, 5
	music_tempo_2 $9
	note D#, 7
	note __, 1
	note G#, 7
	note __, 1
	note A#, 7
	note __, 1
	octave 6
	note C#, 12
	note __, 2
	note C_, 2
	note C#, 2
	music_tempo_2 $6
	note C_, 1
	note C#, 1
	note C_, 1
	music_tempo_2 $9
	octave 5
	note A#, 2
	note G#, 2
	note __, 8
	note D#, 2
	note F_, 2
	note F#, 2
	octave 6
	note C#, 1
	music_tempo_2 $1
	note C_, 4
	note C#, 5
	music_tempo_2 $9
	note C_, 10
	note __, 2
	note C#, 2
	note D#, 2
	octave 5
	note A#, 16
	note __, 8
	music_tempo_2 $6
	music_fa $b4
	music_fb $11, $11, $2, $11
	octave 5
	note C#, 1
	call_channel Music_83ac3
	music_tempo_2 $9
	music_fa $b9
	music_fb $11, $11, $5, $51
	octave 7
	note C#, 2
	octave 6
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 5
	note __, 1
	note C_, 1
	note D_, 1
	note D#, 5
	note __, 1
	music_tempo_2 $1
	note F_, 14
	note D#, 4
	note F_, 4
	music_tempo_2 $4
	note D#, 8
	music_tempo_2 $9
	note D_, 3
	note __, 1
	note F_, 2
	octave 6
	note A_, 2
	note A#, 2
	octave 7
	note F_, 2
	note F#, 2
	octave 6
	note A#, 2
	note B_, 2
	octave 7
	note F#, 2
	note A_, 5
	note __, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_fa $b5
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_fa $b3
	note A#, 1
	note A_, 1
	music_fa $b9
	octave 8
	note C_, 6
	music_e8 $1b
	octave 7
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	call_channel Music_83a75
	music_fa $b5
	call_channel Music_83a75
	music_fa $b9
	music_e8 $12
	octave 5
	note D#, 8
	note F#, 4
	note A#, 4
	note A_, 4
	note F_, 4
	note C_, 4
	octave 6
	note C_, 4
	music_fb $11, $11, $3, $11
	music_e8 $1b
	call_channel Music_83a7e
	music_fa $b7
	call_channel Music_83a7e
	music_fa $b5
	call_channel Music_83a7e
	music_fa $b3
	call_channel Music_83a7e
	music_fa $b9
	call_channel Music_83a85
	music_fa $b7
	call_channel Music_83a85
	music_fa $b5
	call_channel Music_83a85
	music_fa $b3
	call_channel Music_83a85
	jump_channel Music_83930

MusicHeader_8205e_Ch3: ; 83a0e
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $c

Music_83a19: ; 83a19
	music_setrepeat1a $4
	octave 4
	note D#, 2
	note D#, 2
	note __, 12
	note E_, 2
	note E_, 2
	note __, 10
	note G#, 1
	octave 5
	note D#, 1
	music_dorepeat1a
	octave 4
	note E_, 2
	note E_, 2
	note __, 8
	note A#, 2
	note E_, 2
	note F#, 2
	note F#, 2
	note __, 4
	note F#, 4
	octave 5
	note D_, 4
	octave 4
	note G_, 12
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	note B_, 2
	note B_, 2
	note __, 4
	octave 5
	note F_, 4
	octave 4
	note B_, 4
	octave 5
	note D_, 10
	note __, 4
	note D_, 1
	octave 4
	note G#, 1
	octave 5
	note D_, 2
	note D_, 2
	note __, 12
	note __, 2
	music_fa $2
	music_fb $0, $0, $3, $0
	music_noise_sample $f
	music_setfreqoffset $1
	octave 5
	note D#, 8
	note F#, 4
	note A#, 4
	note A_, 4
	note F_, 4
	note C_, 4
	octave 6
	note C_, 2
	music_setfreqoffset $0
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $c
	octave 4
	note D#, 2
	note D#, 2
	note __, 10
	note D#, 2
	note D_, 2
	note D_, 2
	note __, 10
	note D_, 2
	jump_channel Music_83a19

Music_83a75: ; 83a75
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	ret_channel

Music_83a7e: ; 83a7e
	octave 7
	note C#, 1
	octave 6
	note A_, 1
	note G_, 1
	note D#, 1
	ret_channel

Music_83a85: ; 83a85
	octave 8
	note C_, 1
	octave 7
	note G#, 1
	note F#, 1
	note D_, 1
	ret_channel

Music_83a8c: ; 83a8c
	music_fa $78
	octave 6
	note A#, 1
	octave 7
	note D#, 1
	octave 6
	note G#, 1
	note A#, 1
	note D#, 1
	note G#, 1
	music_fa $76
	note A#, 1
	octave 7
	note D#, 1
	octave 6
	note G#, 1
	note A#, 1
	note D#, 1
	note G#, 1
	music_fa $75
	note A#, 1
	octave 7
	note D#, 1
	octave 6
	note G#, 1
	note A#, 1
	note D#, 1
	note G#, 1
	music_fa $74
	note A#, 1
	octave 7
	note D#, 1
	octave 6
	note G#, 1
	note A#, 1
	note D#, 1
	note G#, 1
	ret_channel

Music_83ab6: ; 83ab6
	note A#, 1
	octave 7
	note D#, 1
	octave 6
	note G#, 1
	note A#, 1
	music_fa $73
	note D#, 1
	note G#, 1
	note G#, 1
	note __, 1
	ret_channel

Music_83ac3: ; 83ac3
	note E_, 1
	note G#, 1
	music_fa $b5
	note A#, 1
	octave 6
	note C#, 1
	note E_, 1
	music_fa $b6
	note G#, 1
	note A#, 1
	octave 7
	note C#, 1
	music_fa $b7
	note E_, 1
	note G#, 1
	note A#, 1
	ret_channel

Music_83ad7: ; 83ad7
	note D_, 1
	note C#, 1
	note D_, 2
	note E_, 2
	note C#, 2
	note D_, 2
	note C#, 4
	note D_, 1
	note C#, 1
	ret_channel

MusicHeader_8205e_Ch6: ; 83ae1
	music_tempo_2 $9

Music_83ae3: ; 83ae3
	music_setrepeat1a $8
	note D_, 4
	note E_, 2
	note C#, 10
	music_dorepeat1a
	music_setrepeat1a $2
	call_channel Music_83ad7
	note E_, 2
	note D_, 4
	note D_, 1
	note C#, 1
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	music_dorepeat1a
	call_channel Music_83ad7
	note E_, 6
	note D_, 1
	note C#, 1
	note E_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	music_setrepeat1a $3
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note D_, 2
	note C#, 6
	music_dorepeat1a
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note D_, 2
	note C#, 4
	note E_, 2
	jump_channel Music_83ae3

MusicHeader_82068_Ch1: ; 83b14
	music_tempo_2 $6
	music_e8 $12
	music_f9 $13, 4, 4

Music_83b1b: ; 83b1b
	music_fa $78
	music_fb $11, $12, $4, $21
	octave 6
	note A_, 1
	note A_, 1
	music_fb $11, $13, $7, $11
	note D_, 2
	note G_, 2
	note D#, 2
	note A#, 2
	note G_, 2
	octave 7
	note D#, 2
	octave 6
	note A#, 2
	note A_, 2
	octave 7
	note C_, 2
	octave 6
	note A#, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note C#, 2
	note C_, 2
	octave 5
	note A#, 2
	octave 6
	note C_, 2
	note D#, 2
	note C_, 2
	music_fb $11, $12, $4, $21
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 3
	note G_, 4
	music_tempo_2 $3
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	music_fa $75
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	music_tempo_2 $6
	music_fa $78
	note __, 2
	octave 6
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	octave 7
	note C_, 1
	note C_, 1
	music_fb $11, $13, $7, $11
	octave 6
	note G_, 2
	note C_, 2
	note G#, 2
	note D#, 2
	note C_, 2
	octave 5
	note G#, 2
	octave 6
	note D#, 2
	note D_, 2
	note F_, 2
	note D#, 2
	note C_, 2
	octave 5
	note A#, 2
	octave 6
	note D_, 2
	octave 5
	note F#, 2
	note F_, 2
	octave 6
	note D#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	music_fb $11, $12, $4, $21
	note C_, 2
	octave 7
	note C_, 1
	note __, 3
	note C_, 4
	music_tempo_2 $3
	octave 6
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	music_fa $74
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	music_fa $78
	note __, 4
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note D#, 1
	note __, 1
	music_tempo_2 $6
	music_fa $b8
	octave 5
	note G#, 9
	note __, 1
	note G_, 1
	note G#, 1
	note G_, 4
	note F_, 2
	note G_, 2
	note G#, 2
	note B_, 2
	note A#, 2
	note G#, 4
	note G_, 2
	note G#, 4
	octave 6
	note C_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	octave 5
	note G_, 2
	note G#, 14
	note __, 2
	music_fb $11, $12, $4, $11
	note G#, 4
	note G#, 1
	note __, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note A#, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	note D#, 1
	note F_, 1
	octave 5
	note F_, 4
	note G#, 1
	note __, 1
	note D#, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A#, 4
	octave 6
	note C#, 1
	note __, 1
	note C#, 1
	note C_, 1
	note C#, 1
	octave 5
	note G#, 1
	note F#, 1
	note G#, 1
	note G#, 1
	note F_, 1
	note G#, 1
	octave 6
	note C#, 1
	note C#, 4
	note C_, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 1
	octave 6
	note G#, 1
	note F#, 1
	note D#, 1
	note C#, 1
	note C_, 1
	octave 5
	note G#, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note F_, 1
	call_channel Music_83e1c
	music_setrepeat1a $4
	note G#, 1
	note G#, 1
	note C#, 1
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note G_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	music_dorepeat1a
	call_channel Music_83e1c
	music_setrepeat1a $2
	note F_, 1
	note F_, 1
	note C#, 1
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $2
	note G#, 1
	note G#, 1
	note C#, 1
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note G_, 1
	note G_, 1
	note C#, 1
	note C#, 1
	music_dorepeat1a
	jump_channel Music_83b1b

MusicHeader_82068_Ch2: ; 83c42
	music_tempo_2 $6
	music_e8 $12
	music_f9 $13, 4, 4

Music_83c49: ; 83c49
	music_fa $79
	music_fb $11, $12, $4, $21
	octave 7
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	octave 6
	note A_, 2
	octave 7
	note D_, 2
	note F#, 2
	note A_, 2
	note G#, 2
	note G_, 4
	music_setrepeat1a $2
	note A_, 1
	note __, 1
	note D_, 1
	note __, 1
	music_dorepeat1a
	music_fa $75
	octave 6
	note F_, 1
	note A_, 1
	music_fa $79
	octave 7
	note D_, 1
	note __, 1
	note C_, 4
	octave 6
	note A#, 4
	note G_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 3
	note D_, 4
	music_tempo_2 $3
	note C#, 1
	note C_, 1
	octave 6
	note B_, 1
	note A#, 1
	music_fa $75
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	music_tempo_2 $6
	music_fa $79
	note __, 2
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 1
	octave 7
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 1
	note D_, 2
	note C_, 2
	octave 6
	note G_, 2
	octave 7
	note D_, 2
	note C_, 2
	octave 6
	note A#, 2
	note G_, 2
	note __, 2
	note A#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 4
	music_tempo_2 $3
	note E_, 1
	note F_, 3
	music_tempo_2 $6
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 1
	note __, 3
	note F_, 4
	music_tempo_2 $3
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	music_fa $75
	note C_, 1
	octave 6
	note B_, 1
	note A#, 1
	note A_, 1
	music_fa $79
	note __, 4
	octave 7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	music_tempo_2 $6
	music_fa $b9
	music_fb $11, $12, $4, $41
	octave 6
	note F_, 9
	note __, 1
	note E_, 1
	note F_, 1
	note E_, 4
	note C_, 2
	note E_, 2
	note F_, 2
	note G#, 4
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 4
	octave 6
	note A#, 2
	note G#, 2
	note G_, 4
	note C_, 2
	note F_, 14
	note __, 2
	music_fb $11, $12, $4, $11
	note D#, 4
	note F_, 1
	note __, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note C_, 4
	note D#, 1
	note __, 1
	octave 5
	note A#, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note D#, 1
	note D#, 4
	note G#, 1
	note __, 1
	note A#, 1
	note G#, 1
	note A#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note F_, 1
	note G#, 4
	note A#, 1
	note __, 3
	octave 7
	note F_, 1
	note D#, 1
	note C_, 1
	octave 6
	note A#, 1
	note G#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 5
	note A#, 1
	note G#, 1
	music_fb $11, $12, $4, $21
	note A#, 4
	octave 6
	note C_, 2
	note C#, 2
	note __, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note A#, 2
	note G#, 2
	note A#, 2
	octave 6
	note C_, 2
	note __, 2
	note C#, 1
	note D#, 1
	note F_, 5
	note __, 1
	note D#, 1
	note F_, 1
	note D#, 5
	note __, 1
	note F_, 1
	note G#, 1
	note A#, 5
	note __, 1
	octave 7
	note C_, 1
	note C#, 1
	note D#, 3
	note __, 1
	note F_, 3
	note __, 1
	note F_, 9
	note __, 1
	note D#, 2
	note F_, 2
	note G#, 2
	note F_, 2
	note D#, 2
	note C_, 2
	octave 6
	note A#, 2
	note G#, 2
	note F_, 1
	note __, 2
	octave 7
	note C_, 1
	note C#, 1
	note D#, 1
	octave 6
	note G#, 5
	note __, 1
	note A#, 2
	octave 7
	note C_, 2
	note C#, 2
	note C_, 2
	octave 6
	note G#, 2
	note A#, 7
	note __, 1
	music_fb $11, $12, $4, $11
	music_setrepeat1a $2
	octave 7
	note C_, 1
	note C_, 1
	octave 6
	note F_, 1
	note F_, 1
	music_dorepeat1a
	jump_channel Music_83c49

MusicHeader_82068_Ch3: ; 83d97
	music_tempo_2 $6
	music_fa $3
	music_noise_sample $f

Music_83d9d: ; 83d9d
	music_fb $0, $0, $4, $0
	call_channel Music_83e2d
	music_setrepeat1a $2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note D#, 2
	note A#, 2
	note F_, 2
	note D#, 2
	note __, 2
	octave 4
	note A#, 2
	note __, 2
	note A#, 2
	octave 5
	note A#, 2
	note E_, 2
	note D#, 2
	note C#, 2
	octave 4
	note A#, 2
	note G#, 2
	music_dorepeat1a
	call_channel Music_83e2d
	note __, 2
	note F_, 2
	music_setrepeat1a $2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	music_dorepeat1a
	note F_, 2
	note C#, 4
	note F#, 2
	music_tempo_2 $3
	note A#, 3
	note G#, 3
	note D#, 2
	music_tempo_2 $6
	note F_, 3
	note D#, 2
	note F_, 1
	note B_, 4
	note A#, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note F_, 2
	note A#, 2
	note G#, 4
	note G#, 2
	note G#, 2
	octave 5
	note F_, 2
	music_fb $0, $0, $6, $0
	octave 4
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	music_setrepeat1a $8
	music_fb $0, $0, $7, $0
	octave 4
	note A#, 2
	note A#, 2
	note A#, 2
	music_fb $0, $0, $2, $0
	note G#, 2
	music_fb $0, $0, $7, $0
	note A#, 2
	note A#, 2
	note A#, 2
	music_fb $0, $0, $2, $0
	octave 5
	note F_, 2
	music_dorepeat1a
	jump_channel Music_83d9d

Music_83e11: ; 83e11
	note C_, 4
	note A_, 4
	note C#, 2
	note C_, 2
	note A_, 4
	note C#, 2
	note C_, 2
	note A_, 4
	note C#, 2
	note C_, 2
	ret_channel

Music_83e1c: ; 83e1c
	music_setrepeat1a $4
	octave 7
	note C_, 1
	note C_, 1
	octave 6
	note F_, 1
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note A#, 1
	note A#, 1
	note D#, 1
	note D#, 1
	music_dorepeat1a
	ret_channel

Music_83e2d: ; 83e2d
	music_setrepeat1a $2
	octave 4
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	note C_, 2
	octave 4
	note A#, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	octave 5
	note F_, 2
	octave 4
	note B_, 2
	note A#, 2
	note G#, 2
	note F_, 2
	note D#, 2
	music_dorepeat1a
	ret_channel

MusicHeader_82068_Ch6: ; 83e48
	music_tempo_2 $6

Music_83e4a: ; 83e4a
	music_setrepeat1a $7
	call_channel Music_83e11
	note A_, 2
	note C#, 2
	music_dorepeat1a
	call_channel Music_83e11
	note A_, 2
	note A_, 2
	music_setrepeat1a $f
	note C_, 2
	note C#, 2
	note A_, 2
	note C#, 2
	music_dorepeat1a
	note C_, 2
	note C#, 2
	note A_, 2
	note A_, 1
	note A_, 1
	jump_channel Music_83e4a

MusicHeader_82000_Ch1:
MusicHeader_82000_Ch2:
MusicHeader_82000_Ch3:
MusicHeader_82000_Ch4:
MusicHeader_82000_Ch5:
MusicHeader_82000_Ch6:
MusicHeader_8200e_Ch1:
MusicHeader_8200e_Ch2:
MusicHeader_8200e_Ch3:
MusicHeader_8200e_Ch6:
MusicHeader_82072_Ch1:
MusicHeader_82072_Ch2:
MusicHeader_82072_Ch3:
MusicHeader_82072_Ch6:
