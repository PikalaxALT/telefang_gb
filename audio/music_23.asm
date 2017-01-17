	dw MusicHeader_8dff6
	dw MusicHeader_8e004
	dw MusicHeader_8e00e
	dw MusicHeader_8e018
	dw MusicHeader_8e022
	dw MusicHeader_8e02c
	dw MusicHeader_8e040
	dw MusicHeader_8e036
	dw MusicHeader_8e04a
	dw MusicHeader_8e054

MusicHeader_8dff6: ; 8dff6
	channel %111111, $f0
	dw MusicHeader_8dff6_Ch1
	dw MusicHeader_8dff6_Ch2
	dw MusicHeader_8dff6_Ch3
	dw MusicHeader_8dff6_Ch4
	dw MusicHeader_8dff6_Ch5
	dw MusicHeader_8dff6_Ch6

MusicHeader_8e004: ; 8e004
	channel %111001, $f0
	dw MusicHeader_8e004_Ch1
	dw MusicHeader_8e004_Ch2
	dw MusicHeader_8e004_Ch3
	dw MusicHeader_8e004_Ch6

MusicHeader_8e00e: ; 8e00e
	channel %111001, $c0
	dw MusicHeader_8e00e_Ch1
	dw MusicHeader_8e00e_Ch2
	dw MusicHeader_8e00e_Ch3
	dw MusicHeader_8e00e_Ch6

MusicHeader_8e018: ; 8e018
	channel %111001, $c0
	dw MusicHeader_8e018_Ch1
	dw MusicHeader_8e018_Ch2
	dw MusicHeader_8e018_Ch3
	dw MusicHeader_8e018_Ch6

MusicHeader_8e022: ; 8e022
	channel %111001, $c0
	dw MusicHeader_8e022_Ch1
	dw MusicHeader_8e022_Ch2
	dw MusicHeader_8e022_Ch3
	dw MusicHeader_8e022_Ch6

MusicHeader_8e02c: ; 8e02c
	channel %111001, $c0
	dw MusicHeader_8e02c_Ch1
	dw MusicHeader_8e02c_Ch2
	dw MusicHeader_8e02c_Ch3
	dw MusicHeader_8e02c_Ch6

MusicHeader_8e036: ; 8e036
	channel %111001, $c0
	dw MusicHeader_8e036_Ch1
	dw MusicHeader_8e036_Ch2
	dw MusicHeader_8e036_Ch3
	dw MusicHeader_8e036_Ch6

MusicHeader_8e040: ; 8e040
	channel %111001, $c0
	dw MusicHeader_8e040_Ch1
	dw MusicHeader_8e040_Ch2
	dw MusicHeader_8e040_Ch3
	dw MusicHeader_8e040_Ch6

MusicHeader_8e04a: ; 8e04a
	channel %111001, $c0
	dw MusicHeader_8e04a_Ch1
	dw MusicHeader_8e04a_Ch2
	dw MusicHeader_8e04a_Ch3
	dw MusicHeader_8e04a_Ch6

MusicHeader_8e054: ; 8e054
	channel %111001, $c0
	dw MusicHeader_8e054_Ch1
	dw MusicHeader_8e054_Ch2
	dw MusicHeader_8e054_Ch3
	dw MusicHeader_8e054_Ch6

MusicHeader_8dff6_Ch1: ; 8e05e
MusicHeader_8dff6_Ch2: ; 8e05e
MusicHeader_8dff6_Ch3: ; 8e05e
MusicHeader_8dff6_Ch4: ; 8e05e
MusicHeader_8dff6_Ch5: ; 8e05e
MusicHeader_8dff6_Ch6: ; 8e05e
MusicHeader_8e004_Ch1: ; 8e05e
MusicHeader_8e004_Ch2: ; 8e05e
MusicHeader_8e004_Ch3: ; 8e05e
MusicHeader_8e004_Ch6: ; 8e05e
	music_ff

MusicHeader_8e00e_Ch1: ; 8e05f
	music_tempo_2 $5
	music_setfreqoffset $1

Music_8e063: ; 8e063
	note __, 4
	music_e8 $f
	music_fb $11, $11, $3, $21
	music_setrepeat1a $3
	call_channel Music_8e236
	music_fa $b4
	note E_, 2
	note F#, 2
	music_dorepeat1a
	call_channel Music_8e236
	music_fa $b7
	music_fb $11, $11, $2, $21
	music_setrepeat1a $8
	call_channel Music_8e256
	music_dorepeat1a
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note E_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note E_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note E_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	call_channel Music_8e256
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_fa $b8
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	music_fa $b4
	note B_, 1
	note __, 1
	note A_, 1
	music_fa $b8
	note E_, 2
	note __, 1
	music_fa $b4
	note E_, 1
	note __, 2
	note __, 4
	music_fa $b8
	note A_, 1
	note __, 1
	note E_, 1
	music_fa $b4
	note A_, 1
	note __, 1
	note E_, 1
	music_fa $b8
	note E_, 2
	note __, 1
	music_fa $b4
	note E_, 1
	music_fa $b8
	note A_, 2
	note __, 1
	music_fa $b4
	note A_, 2
	note __, 1
	jump_channel Music_8e063

MusicHeader_8e00e_Ch2: ; 8e10f
	music_tempo_2 $5

Music_8e111: ; 8e111
	music_fa $b9
	music_fb $11, $11, $2, $21
	music_e8 $f
	music_f9 $13, 4, 7
	music_setrepeat1a $4
	call_channel Music_8e256
	music_dorepeat1a
	music_fb $11, $12, $5, $51
	octave 6
	note D#, 10
	note __, 2
	note E_, 10
	note __, 2
	note F#, 6
	note F_, 1
	note E_, 1
	note D#, 16
	note __, 4
	call_channel Music_8e1fc
	octave 7
	call_channel Music_8e210
	call_channel Music_8e1fc
	octave 8
	call_channel Music_8e210
	call_channel Music_8e1fc
	music_fa $b9
	music_f9 $13, 4, 7
	note E_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note E_, 4
	note F#, 2
	note __, 2
	music_f9 $14, 4, 11
	note D#, 16
	note __, 4
	call_channel Music_8e1fc
	octave 7
	call_channel Music_8e210
	call_channel Music_8e1fc
	octave 8
	call_channel Music_8e210
	call_channel Music_8e1fc
	music_fa $79
	music_f9 $13, 4, 7
	octave 5
	note E_, 2
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_tempo_2 $a
	octave 6
	note E_, 10
	note __, 2
	music_tempo_2 $5
	note D#, 1
	note C#, 1
	note D#, 2
	octave 5
	note B_, 2
	note __, 2
	note F#, 2
	note __, 4
	music_fa $b9
	octave 7
	note B_, 2
	note A_, 2
	note __, 2
	music_fa $79
	octave 5
	note D#, 2
	note E_, 1
	note __, 1
	note F#, 8
	note __, 2
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note G_, 1
	note __, 1
	note F#, 2
	note __, 2
	note B_, 16
	note __, 2
	music_fa $b9
	octave 6
	note A_, 2
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 6
	note E_, 1
	note __, 1
	note A_, 2
	note __, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note A_, 2
	note __, 2
	octave 7
	note E_, 2
	note __, 2
	octave 5
	note A_, 1
	note __, 1
	jump_channel Music_8e111

MusicHeader_8e00e_Ch3: ; 8e1cd
	music_tempo_2 $5
	music_fa $3
	music_fb $0, $0, $5, $0
	music_noise_sample $f

Music_8e1d8: ; 8e1d8
	music_setrepeat1d $3
	call_channel Music_8e285
	music_setrepeat1a $2
	call_channel Music_8e298
	music_dorepeat1a
	music_dorepeat1d
	call_channel Music_8e285
	octave 4
	note G_, 4
	note __, 2
	note G_, 4
	note __, 2
	note G_, 4
	note __, 2
	note G_, 4
	note __, 2
	note G_, 2
	octave 5
	note D_, 2
	note __, 2
	octave 4
	note G_, 2
	call_channel Music_8e298
	jump_channel Music_8e1d8

Music_8e1fc: ; 8e1fc
	music_f9 $0, 0, 0
	music_fa $77
	octave 6
	note A_, 2
	note __, 2
	music_fa $75
	note A_, 2
	note __, 2
	music_fa $b9
	octave 5
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	ret_channel

Music_8e210: ; 8e210
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	music_fb $11, $11, $2, $21
	music_fa $b5
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	music_fa $b3
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	music_e8 $0
	note __, 2
	music_e8 $f
	music_fb $11, $12, $5, $51
	ret_channel

Music_8e236: ; 8e236
	music_fa $b7
	octave 6
	note A_, 2
	note __, 2
	music_fa $b4
	note A_, 2
	note __, 2
	music_fa $b7
	note A_, 2
	note F#, 2
	music_fa $b4
	note A_, 2
	note F#, 2
	music_fa $b7
	octave 6
	note A_, 2
	note __, 2
	music_fa $b4
	note A_, 2
	note __, 2
	music_fa $b7
	octave 5
	note E_, 2
	note F#, 2
	ret_channel

Music_8e256: ; 8e256
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 7
	note D#, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 7
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 7
	note D#, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note F#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	ret_channel

Music_8e285: ; 8e285
	music_setrepeat1a $2
	octave 4
	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 4
	note __, 2
	note B_, 2
	octave 5
	note F#, 2
	note __, 2
	octave 4
	note B_, 2
	music_dorepeat1a
	ret_channel

Music_8e298: ; 8e298
	octave 4
	note A_, 4
	note __, 2
	note A_, 4
	note __, 2
	note A_, 4
	note __, 2
	note A_, 4
	note __, 2
	note A_, 2
	octave 5
	note E_, 2
	note __, 2
	octave 4
	note A_, 2
	ret_channel

MusicHeader_8e00e_Ch6: ; 8e2a8
	music_tempo_2 $5

Music_8e2aa: ; 8e2aa
	note C_, 2
	note C#, 2
	note D_, 4
	note G#, 6
	note C_, 4
	note C#, 2
	note C_, 4
	note G#, 4
	note D_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	jump_channel Music_8e2aa

MusicHeader_8e018_Ch1: ; 8e2b9
	music_tempo_2 $7
	music_fb $11, $12, $3, $12
	music_f9 $e, 5, 4

Music_8e2c3: ; 8e2c3
	music_fa $74
	music_setfreqoffset $1
	octave 7
	note A#, 8
	music_e8 $14
	note __, 2
	note G_, 4
	note F#, 6
	note __, 2
	octave 8
	note C_, 4
	octave 7
	note A#, 6
	note __, 2
	note G_, 4
	note F#, 4
	octave 8
	note D_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 7
	note A#, 4
	octave 8
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 6
	note __, 2
	octave 7
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 2
	music_setfreqoffset $0
	music_fa $77
	octave 7
	note C_, 4
	note D_, 4
	note D#, 10
	note F_, 1
	note D#, 1
	note D_, 10
	note D#, 1
	note E_, 1
	note F_, 10
	note E_, 1
	note D_, 1
	note C_, 10
	note D_, 1
	note D#, 1
	note D#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 6
	note G#, 4
	octave 7
	note D#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 6
	note G#, 4
	octave 7
	note D#, 4
	note D_, 2
	note __, 2
	octave 7
	note C_, 2
	note __, 2
	note D_, 4
	note C_, 2
	note __, 2
	octave 6
	note B_, 2
	note __, 2
	jump_channel Music_8e2c3

MusicHeader_8e018_Ch2: ; 8e31c
	music_tempo_2 $7
	music_fa $b9
	music_fb $11, $13, $5, $22
	music_f9 $e, 5, 3
	octave 7

Music_8e329: ; 8e329
	note A#, 6
	music_e8 $14
	note __, 2
	note G_, 4
	note F#, 6
	note __, 2
	octave 8
	note C_, 4
	octave 7
	note A#, 6
	note __, 2
	note G_, 4
	note F#, 4
	octave 8
	note D_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 7
	note A#, 4
	octave 8
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 6
	note __, 2
	octave 7
	note G_, 4
	note A#, 4
	note G#, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 10
	note __, 2
	octave 8
	note C_, 4
	octave 7
	note G#, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	octave 8
	note D_, 4
	note C_, 4
	octave 7
	note A#, 4
	note G_, 2
	note __, 2
	note A#, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 8
	note C_, 4
	octave 7
	note A#, 2
	note __, 2
	note G#, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 4
	note G_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 6
	note B_, 4
	octave 7
	note G_, 4
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	note F_, 10
	note __, 2
	jump_channel Music_8e329

MusicHeader_8e018_Ch3: ; 8e37d
	music_tempo_2 $7
	music_fa $3
	music_fb $0, $0, $a, $18
	music_noise_sample $f
	octave 5

Music_8e389: ; 8e389
	music_setrepeat1a $2
	note D#, 4
	note G_, 4
	note A#, 4
	note D#, 4
	note F#, 4
	note A_, 4
	music_dorepeat1a
	note D#, 4
	note G_, 4
	note D_, 4
	note C_, 4
	note D#, 4
	note G_, 4
	note F_, 4
	note G#, 4
	octave 6
	note C_, 4
	octave 4
	note A#, 4
	octave 5
	note D_, 4
	note F_, 4
	note G#, 4
	octave 6
	note C_, 4
	note D#, 4
	octave 5
	note D_, 4
	note A_, 4
	octave 6
	note D_, 4
	octave 5
	note G_, 4
	note A#, 4
	octave 6
	note D_, 4
	octave 5
	note C_, 4
	note D#, 4
	note G_, 4
	note F_, 4
	note G#, 4
	note F_, 4
	note F_, 4
	note G#, 4
	note F_, 4
	octave 4
	note A#, 4
	octave 5
	note D_, 4
	note F_, 4
	octave 4
	note A#, 4
	octave 5
	note C_, 4
	note D_, 4
	jump_channel Music_8e389

MusicHeader_8e018_Ch6: ; 8e3c6
	music_ff

MusicHeader_8e022_Ch1: ; 8e3c7
	music_tempo_2 $6
	music_fa $b8
	music_fb $11, $12, $2, $11
	music_e8 $c
	music_f9 $15, 4, 1
	octave 5
	note D#, 1
	note F#, 1
	octave 6
	note D#, 1
	note F#, 1
	octave 5
	note F#, 1
	note B_, 1
	octave 6
	note F#, 1
	note B_, 1
	note B_, 1
	octave 7
	note D#, 1
	note F#, 1
	octave 8
	note D#, 1
	note F#, 2
	note __, 2
	call_channel Music_8e634

Music_8e3ec: ; 8e3ec
	music_fa $77
	octave 6
	music_setrepeat1a $3
	note __, 2
	note D#, 2
	music_dorepeat1a
	note __, 2
	note C#, 2
	note D#, 2
	note E_, 2
	note D#, 1
	note E_, 2
	note D#, 2
	note __, 1
	note D#, 2
	note __, 2
	note C#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note B_, 2
	note B_, 1
	note A#, 1
	note G#, 1
	note A#, 1
	note F#, 2
	music_fa $78
	octave 7
	note D#, 2
	octave 6
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note E_, 1
	octave 5
	note B_, 2
	octave 6
	note G#, 1
	note __, 1
	octave 7
	note F#, 1
	note C#, 1
	octave 6
	note A#, 1
	note F#, 1
	octave 7
	note G#, 1
	note D#, 1
	octave 6
	note B_, 1
	note G#, 1
	octave 7
	note A_, 1
	note E_, 1
	note C#, 1
	octave 6
	note A_, 1
	octave 7
	note A#, 1
	note F#, 1
	note C#, 1
	octave 6
	note A#, 1
	octave 7
	note C#, 3
	note __, 1
	note C#, 2
	note D#, 2
	note C#, 2
	octave 6
	note B_, 2
	note A#, 2
	note G#, 2
	note A#, 1
	note __, 1
	note A#, 1
	note B_, 1
	octave 7
	note C#, 2
	octave 6
	note A#, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 4
	music_fa $b8
	music_setrepeat1a $3
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $3
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	octave 6
	music_setrepeat1a $3
	note A_, 1
	note B_, 1
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $3
	note A_, 1
	note B_, 1
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	note A_, 1
	note B_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	note G_, 1
	note A_, 1
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $3
	note G_, 1
	note A_, 1
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	note G_, 1
	note A_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	note F_, 1
	note G_, 1
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $3
	note F_, 1
	note G_, 1
	music_dorepeat1a
	music_fa $b8
	music_setrepeat1a $2
	note F_, 1
	note G_, 1
	music_dorepeat1a
	jump_channel Music_8e3ec

MusicHeader_8e022_Ch2: ; 8e4af
	music_tempo_2 $6
	music_fa $b9
	music_fb $11, $12, $2, $11
	music_e8 $c
	music_f9 $15, 4, 1
	octave 5
	note F#, 1
	note B_, 1
	octave 6
	note F#, 1
	note B_, 1
	octave 5
	note B_, 1
	octave 6
	note F#, 1
	note B_, 1
	octave 7
	note C#, 1
	note D#, 1
	note F#, 1
	note B_, 1
	octave 8
	note F#, 1
	note B_, 2
	note __, 2
	call_channel Music_8e634

Music_8e4d4: ; 8e4d4
	octave 7
	note D#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	octave 6
	note B_, 1
	note __, 1
	octave 7
	note D#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1
	note G#, 1
	note F#, 1
	note E_, 1
	note G#, 1
	note F#, 3
	note B_, 1
	note __, 4
	octave 5
	note D#, 1
	note E_, 1
	note D#, 1
	octave 4
	note B_, 1
	octave 5
	note F#, 4
	octave 6
	note A_, 4
	note __, 2
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note B_, 4
	note F#, 4
	note A_, 2
	note B_, 2
	octave 7
	note C#, 2
	note E_, 2
	note D#, 4
	note __, 2
	note E_, 1
	note F#, 1
	note G#, 2
	note E_, 1
	note __, 1
	octave 6
	note B_, 2
	note __, 2
	note __, 2
	octave 7
	note B_, 1
	note __, 1
	note A#, 2
	note G#, 1
	note __, 1
	note A#, 4
	note B_, 4
	octave 8
	note C_, 4
	note C#, 4
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 7
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note __, 1
	note F#, 4
	note __, 2
	note F#, 1
	octave 8
	note C#, 1
	octave 7
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	music_setrepeat1a $3
	note D#, 1
	note E_, 1
	music_dorepeat1a
	music_fa $b6
	music_setrepeat1a $3
	note D#, 1
	note E_, 1
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $2
	note D#, 1
	note E_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	note C#, 1
	note D#, 1
	music_dorepeat1a
	music_fa $b6
	music_setrepeat1a $3
	note C#, 1
	note D#, 1
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $2
	note C#, 1
	note D#, 1
	music_dorepeat1a
	music_setrepeat1a $3
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	music_fa $b6
	music_setrepeat1a $3
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $2
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	octave 6
	music_setrepeat1a $3
	note A_, 1
	note B_, 1
	music_dorepeat1a
	music_fa $b6
	music_setrepeat1a $3
	note A_, 1
	note B_, 1
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $2
	note A_, 1
	note B_, 1
	music_dorepeat1a
	jump_channel Music_8e4d4

MusicHeader_8e022_Ch3: ; 8e58c
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $1, $0
	music_noise_sample $f
	octave 6
	note B_, 1
	note F#, 1
	note D#, 1
	octave 5
	note B_, 1
	octave 6
	note F#, 1
	note D#, 1
	octave 5
	note B_, 1
	note F#, 1
	octave 6
	note D#, 1
	octave 5
	note B_, 1
	note F#, 1
	note D#, 1
	octave 4
	note B_, 4
	note __, 2
	music_fb $0, $0, $4, $0
	music_noise_sample $c
	octave 4
	note F#, 2
	note G#, 2
	note A#, 2

Music_8e5b7: ; 8e5b7
	music_setrepeat1d $2
	music_setrepeat1a $3
	octave 4
	note B_, 2
	octave 5
	note F#, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note A_, 2
	octave 5
	note E_, 1
	note __, 1
	music_dorepeat1d
	call_channel Music_8e63f
	octave 4
	note B_, 2
	octave 5
	note B_, 1
	note __, 1
	call_channel Music_8e63f
	note C#, 2
	note D#, 2
	music_setrepeat1a $2
	octave 4
	note E_, 2
	octave 5
	note G#, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 4
	note E_, 2
	octave 5
	note E_, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 4
	note F#, 2
	octave 5
	note A#, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 4
	note F#, 2
	octave 5
	note F#, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note C#, 2
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note D#, 2
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note E_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note F_, 2
	octave 5
	note F_, 1
	note __, 1
	music_setrepeat1a $2
	octave 4
	note F#, 2
	octave 5
	note F#, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 4
	note F#, 1
	note __, 1
	octave 5
	note C#, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note B_, 8
	note __, 2
	octave 5
	note D#, 2
	note E_, 2
	note F#, 2
	octave 4
	note A_, 8
	note A_, 4
	octave 5
	note C#, 4
	octave 4
	note G_, 2
	note B_, 2
	octave 5
	note D_, 1
	note __, 1
	note G_, 6
	note F#, 4
	note F_, 4
	note E_, 1
	note __, 1
	note D_, 10
	jump_channel Music_8e5b7

Music_8e634: ; 8e634
	music_e8 $0
	note __, 8
	music_fb $11, $12, $3, $21
	music_e8 $12
	ret_channel

Music_8e63f: ; 8e63f
	music_setrepeat1a $2
	octave 4
	note A_, 2
	octave 6
	note C#, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note B_, 2
	octave 5
	note B_, 1
	note __, 1
	ret_channel

MusicHeader_8e022_Ch6: ; 8e64d
	music_tempo_2 $6
	note __, 16

Music_8e650: ; 8e650
	note A_, 2
	note A_, 2
	note A_, 1
	note A_, 1
	note C_, 1
	note A_, 1
	music_setrepeat1d $4
	music_setrepeat1a $3
	note C_, 2
	note C#, 2
	note A_, 2
	note C#, 2
	music_dorepeat1a
	note C_, 2
	note A_, 2
	note A_, 2
	note C_, 2
	music_dorepeat1d
	music_setrepeat1a $e
	note C#, 2
	note E_, 1
	note C#, 1
	music_dorepeat1a
	jump_channel Music_8e650

MusicHeader_8e02c_Ch1: ; 8e66d
	music_tempo_2 $4
	music_fa $78
	music_fb $11, $11, $3, $31
	music_e8 $c
	octave 7
	music_setrepeat1a $4
	note F#, 1
	note G#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note G_, 1
	note A_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note G#, 1
	note A#, 1
	music_dorepeat1a
	note A_, 1
	note B_, 1
	music_setrepeat1a $3
	note A_, 1
	note B_, 1
	octave 8
	note C#, 1
	octave 7
	note B_, 1
	note A_, 1
	note G_, 1
	music_dorepeat1a
	music_fa $76
	octave 7
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	music_fa $74
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note __, 1
	music_tempo_2 $8

Music_8e6b1: ; 8e6b1
	music_fb $11, $12, $5, $11
	music_e8 $16
	octave 6
	music_setrepeat1d $3
	call_channel Music_8e95a
	music_fa $b8
	music_setrepeat1a $2
	note F_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	music_dorepeat1a
	call_channel Music_8e95a
	music_dorepeat1d
	music_setrepeat1d $2
	call_channel Music_8e961
	music_fa $b8
	music_setrepeat1a $2
	note F#, 1
	note G#, 1
	note F#, 1
	note D#, 1
	music_dorepeat1a
	call_channel Music_8e961
	music_dorepeat1d
	music_setrepeat1d $2
	call_channel Music_8e968
	music_fa $b8
	music_setrepeat1a $2
	note E_, 1
	note G#, 1
	note A#, 1
	note G#, 1
	music_dorepeat1a
	call_channel Music_8e968
	music_dorepeat1d
	call_channel Music_8e96f
	music_fa $b8
	music_setrepeat1a $2
	note D#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	music_dorepeat1a
	call_channel Music_8e96f
	call_channel Music_8e976
	music_fa $b8
	music_setrepeat1a $2
	note D#, 1
	note F#, 1
	note A#, 1
	note F#, 1
	music_dorepeat1a
	call_channel Music_8e976
	music_fa $b8
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note __, 1
	note F_, 1
	note C_, 1
	note F_, 1
	music_setrepeat1a $2
	note __, 1
	note C#, 1
	octave 5
	note A#, 1
	octave 6
	note C#, 1
	music_dorepeat1a
	note F_, 1
	note C#, 1
	octave 5
	note A#, 1
	octave 6
	note C#, 1
	note F_, 1
	note A#, 1
	octave 7
	note C#, 1
	octave 6
	note A#, 1
	note D#, 1
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note D#, 1
	note F#, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note D_, 1
	octave 5
	note G#, 1
	note B_, 1
	octave 6
	note D_, 1
	note E_, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note E_, 1
	note D_, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note G_, 1
	note B_, 1
	octave 7
	note D_, 1
	octave 6
	note B_, 1
	music_fb $11, $12, $3, $31
	note G#, 1
	note __, 1
	note E_, 1
	note F_, 1
	note F#, 1
	note __, 1
	note D_, 1
	note D#, 1
	music_fa $b6
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	music_fa $b4
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	jump_channel Music_8e6b1

MusicHeader_8e02c_Ch2: ; 8e768
	music_tempo_2 $4
	music_fa $79
	music_fb $11, $11, $3, $31
	music_e8 $c
	octave 8
	music_setrepeat1a $4
	note C_, 1
	note D_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note C#, 1
	note D#, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note D_, 1
	note E_, 1
	music_dorepeat1a
	note D#, 1
	note F_, 1
	music_setrepeat1a $3
	note D#, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note C#, 1
	music_dorepeat1a
	music_fa $77
	octave 7
	note B_, 1
	octave 8
	note C#, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 7
	note B_, 1
	music_fa $75
	note A_, 1
	note B_, 1
	octave 8
	note C#, 1
	note D#, 1
	note C#, 1
	octave 7
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1

Music_8e7ac: ; 8e7ac
	music_tempo_2 $8
	music_fa $77
	music_fb $11, $12, $5, $11
	music_e8 $0
	note __, 6
	music_e8 $16
	music_setrepeat1a $2
	octave 6
	note A#, 1
	note G_, 1
	note A#, 1
	octave 7
	note C_, 1
	music_fa $75
	music_dorepeat1a
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	music_fa $b9
	music_fb $11, $12, $3, $31
	music_f9 $15, 4, 3
	octave 7
	note C_, 3
	music_tempo_2 $4
	note D_, 1
	note D#, 1
	music_tempo_2 $8
	note F_, 4
	note __, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note D_, 4
	note __, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note D#, 1
	note __, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note __, 1
	note F#, 1
	note __, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	note D#, 2
	note A#, 1
	note __, 3
	note A#, 1
	note __, 2
	music_fb $11, $12, $5, $11
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note F#, 1
	music_fa $b6
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note F#, 1
	music_fa $b9
	music_fb $11, $12, $3, $31
	octave 7
	note A#, 2
	note __, 2
	note E_, 2
	note __, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	note G#, 5
	note __, 1
	note F#, 1
	note G#, 1
	note C#, 2
	note __, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note A#, 4
	note __, 2
	note A#, 1
	note __, 1
	note A#, 6
	note __, 2
	music_tempo_2 $4
	music_setrepeat1a $2
	octave 5
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D#, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	music_fa $b6
	music_dorepeat1a
	music_tempo_2 $8
	music_fa $79
	octave 5
	note A#, 2
	octave 6
	note C_, 1
	note C#, 1
	note __, 2
	note D#, 1
	note __, 1
	note F_, 2
	note A#, 1
	note __, 3
	note G#, 1
	note F#, 1
	note F_, 6
	note F#, 1
	music_tempo_2 $4
	note F_, 1
	note E_, 1
	music_tempo_2 $8
	note D#, 6
	note __, 2
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F#, 1
	note A_, 1
	note __, 2
	note D_, 1
	note F_, 1
	note __, 2
	note D_, 1
	note G#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note F#, 1
	note C_, 1
	note __, 1
	octave 5
	music_fa $77
	note A#, 1
	octave 6
	note E_, 1
	octave 5
	note A#, 1
	note __, 1
	music_fa $75
	note G#, 1
	octave 6
	note D_, 1
	octave 5
	note G#, 1
	note __, 1
	jump_channel Music_8e7ac

MusicHeader_8e02c_Ch3: ; 8e889
	music_tempo_2 $8
	music_fa $3
	music_fb $0, $0, $2, $0
	music_noise_sample $f
	octave 5
	note __, 1
	note E_, 1
	note C_, 1
	note F#, 1
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note G#, 1
	note E_, 1
	note C_, 1
	note F#, 1
	octave 6
	note D#, 1
	note C#, 1
	octave 5
	note A_, 1
	note F_, 1
	note C#, 1
	note F_, 1
	music_fb $0, $0, $7, $0
	octave 4
	note A_, 2
	octave 5
	note F_, 2
	note C#, 2
	note A_, 2
	note F_, 2
	note A#, 2
	music_fb $0, $0, $2, $0
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1

Music_8e8bf: ; 8e8bf
	music_setrepeat1d $8
	music_setrepeat1a $3
	music_fa $2
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $2
	music_fa $3
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	music_fa $2
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	music_dorepeat1a
	music_dorepeat1d
	octave 5
	music_setrepeat1a $3
	music_fa $2
	note A#, 1
	note B_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	music_fa $3
	note A#, 1
	note B_, 1
	music_dorepeat1a
	music_fa $2
	note A#, 1
	note F#, 1
	note D#, 1
	octave 4
	note B_, 1
	music_fa $3
	music_fb $0, $0, $5, $0
	octave 4
	note A#, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note A_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note G#, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F_, 1
	note __, 1
	note F#, 1
	octave 4
	note F#, 1
	octave 5
	note C#, 1
	note F#, 1
	note A#, 1
	octave 6
	note C#, 1
	note F_, 1
	note C#, 1
	octave 4
	note B_, 1
	note F#, 1
	note B_, 1
	octave 5
	note F#, 1
	note A_, 1
	octave 6
	note C#, 1
	note D#, 1
	note C#, 1
	octave 5
	note E_, 1
	octave 4
	note E_, 1
	note B_, 1
	octave 5
	note E_, 1
	note F#, 1
	note B_, 1
	octave 6
	note F#, 1
	note D_, 1
	octave 4
	note A_, 1
	note E_, 1
	note A_, 1
	octave 5
	note E_, 1
	note G_, 1
	note B_, 1
	octave 6
	note D_, 1
	note C#, 1
	octave 4
	note A#, 2
	note __, 2
	note G#, 2
	note __, 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note A#, 2
	music_fb $0, $0, $2, $0
	jump_channel Music_8e8bf

	music_tempo_2 $4
	music_fa $79
	music_fb $11, $11, $3, $31
	music_e8 $c
	ret_channel

Music_8e95a: ; 8e95a
	music_fa $b5
	note F_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	ret_channel

Music_8e961: ; 8e961
	music_fa $b5
	note F#, 1
	note G#, 1
	note F#, 1
	note D#, 1
	ret_channel

Music_8e968: ; 8e968
	music_fa $b5
	note E_, 1
	note G#, 1
	note A#, 1
	note G#, 1
	ret_channel

Music_8e96f: ; 8e96f
	music_fa $b5
	note D#, 1
	note G_, 1
	note A_, 1
	note G_, 1
	ret_channel

Music_8e976: ; 8e976
	music_fa $b5
	note D#, 1
	note F#, 1
	note A#, 1
	note F#, 1
	ret_channel

MusicHeader_8e02c_Ch6: ; 8e97d
	music_ff

MusicHeader_8e036_Ch1: ; 8e97e
	music_tempo_2 $3
	music_fa $75
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	music_tempo_2 $6
	music_fa $77
	music_fb $11, $12, $3, $31
	music_e8 $12
	music_setfreqoffset $1
	music_f9 $15, 4, 3
	octave 6
	note A#, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note C#, 1
	note D_, 4
	note __, 2
	note D#, 1
	note D_, 2
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 4
	octave 6
	note A_, 3
	note __, 1
	octave 7
	note C_, 6
	note __, 2
	octave 6
	note A#, 1
	note __, 1
	music_fa $74
	call_channel Music_8ed8e
	music_fa $77
	note D_, 1
	note G_, 1
	octave 7
	note D_, 1
	note __, 1
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note A#, 1
	octave 6
	note D#, 1
	note G_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 2
	note D_, 1
	note __, 1
	note F_, 2
	note G_, 1
	note __, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note C_, 4
	note C_, 2
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	music_setrepeat1a $3
	note A_, 1
	note G_, 1
	music_fa $74
	music_dorepeat1a
	music_fa $77
	octave 5
	note G_, 1
	octave 6
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note D#, 2
	note __, 1
	note D#, 2
	note __, 1
	note G_, 1
	note __, 1
	note F_, 3
	note __, 1
	note C_, 3
	note __, 1
	note D_, 2
	note __, 1
	note D_, 2
	note __, 1
	note F_, 1
	note __, 1
	note G#, 2
	note A#, 2
	note G_, 3
	note __, 1
	note D#, 2
	note __, 1
	note D#, 2
	note F_, 1
	note G_, 1
	note A#, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 2
	note __, 1
	note D_, 2
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	music_setrepeat1a $3
	note D#, 1
	note C_, 1
	music_dorepeat1a
	note D#, 1
	note G_, 1
	music_setrepeat1a $3
	note F#, 1
	note D_, 1
	music_dorepeat1a
	note D#, 1
	note D_, 1
	music_setrepeat1a $2
	octave 5
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note E_, 1
	note G_, 1
	music_dorepeat1a
	note A_, 1
	note __, 1
	note A#, 1
	octave 7
	note D_, 1
	note __, 1
	note F_, 3
	note E_, 3
	note __, 1
	note C_, 2
	octave 6
	note A#, 2
	note G_, 3
	note __, 1
	note G_, 2
	note __, 1
	note F#, 1
	note __, 2
	music_fa $74
	call_channel Music_8ed99
	music_fa $77
	octave 6
	note A#, 1
	note F_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 2
	octave 6
	note A_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 2
	note D#, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note __, 1
	octave 5
	note E_, 1
	note A_, 1
	octave 6
	note C_, 1
	note E_, 1
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	note F_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 2
	octave 6
	note A_, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note F_, 1
	note __, 2
	note C_, 1
	note F_, 1
	note C_, 1
	note E_, 1
	note F_, 2
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note C_, 1
	note E_, 1
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 2
	note __, 1
	note G#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	note G_, 1
	note D#, 1
	octave 5
	note A#, 1
	note G_, 1
	note A#, 1
	octave 6
	note D#, 1
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note G_, 1
	music_setrepeat1a $2
	call_channel Music_8eda4
	music_fa $76
	music_dorepeat1a
	music_fa $74
	music_setrepeat1a $2
	call_channel Music_8eda4
	music_fa $72
	music_dorepeat1a
	music_ff

MusicHeader_8e036_Ch2: ; 8eb26
	music_tempo_2 $3
	music_fa $77
	octave 6
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	music_tempo_2 $6
	music_fa $79
	music_fb $11, $12, $3, $31
	music_e8 $12
	music_f9 $15, 4, 2
	octave 7
	note G_, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	music_tempo_2 $3
	octave 6
	note F_, 5
	note F#, 1
	music_tempo_2 $6
	note G_, 2
	note __, 1
	note A#, 1
	note __, 2
	octave 7
	note C_, 2
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A#, 1
	note G_, 2
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note F_, 1
	note G_, 1
	music_tempo_2 $3
	note G#, 1
	note A_, 5
	note __, 2
	note F_, 7
	note F#, 1
	music_tempo_2 $6
	note G_, 8
	note __, 1
	call_channel Music_8ed8e
	octave 7
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	octave 8
	note C_, 2
	note __, 2
	octave 7
	note A#, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 1
	note __, 1
	note F_, 1
	note G_, 1
	octave 8
	note D_, 2
	octave 7
	note G_, 1
	note __, 3
	note F_, 1
	note G_, 1
	octave 8
	note D_, 2
	octave 7
	note A_, 1
	note __, 2
	octave 8
	note C_, 1
	octave 7
	note A#, 1
	note A_, 1
	music_tempo_2 $3
	note F#, 1
	note G_, 11
	music_tempo_2 $6
	note __, 1
	note G_, 1
	note __, 2
	music_fa $b9
	octave 6
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A#, 1
	octave 8
	music_setrepeat1a $2
	note C_, 1
	note D_, 1
	music_fa $b5
	music_dorepeat1a
	note __, 2
	music_fa $79
	octave 7
	note F_, 2
	note __, 1
	note F_, 3
	note F#, 1
	note __, 1
	note G_, 2
	note __, 1
	note G_, 2
	note __, 1
	note A#, 1
	note __, 1
	note A_, 2
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 5
	note __, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note __, 1
	note D#, 2
	note __, 1
	note G_, 1
	note __, 1
	note F_, 2
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 8
	note __, 2
	note D_, 2
	note D#, 2
	note D_, 2
	music_tempo_2 $3
	note C_, 6
	octave 6
	note B_, 1
	note A#, 1
	note A_, 6
	note A#, 1
	octave 7
	note C_, 1
	music_tempo_2 $6
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 3
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	note A_, 1
	note G_, 2
	note __, 1
	octave 7
	note D_, 2
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 7
	note __, 1
	music_tempo_2 $3
	note G_, 6
	note F#, 1
	note F_, 1
	music_tempo_2 $6
	note E_, 2
	note F_, 1
	note E_, 1
	note D_, 5
	note __, 2
	note D_, 1
	note __, 1
	call_channel Music_8ed99
	note D_, 1
	note D#, 3
	note F_, 1
	note __, 2
	note D_, 3
	note C_, 1
	note __, 2
	octave 6
	note A#, 2
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	note A_, 1
	octave 7
	note C_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note A_, 1
	note F_, 3
	note G_, 1
	note __, 2
	note A_, 3
	note F_, 1
	note __, 2
	note C_, 2
	note D_, 4
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 8
	note __, 1
	note F_, 2
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 6
	note __, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A_, 13
	music_setrepeat1a $2
	octave 6
	note A_, 1
	octave 7
	note C_, 1
	note F_, 1
	note A_, 1
	music_fa $77
	music_dorepeat1a
	music_fa $75
	music_setrepeat1a $2
	octave 6
	note A_, 1
	octave 7
	note C_, 1
	note F_, 1
	note A_, 1
	music_fa $73
	music_dorepeat1a
	music_ff

MusicHeader_8e036_Ch3: ; 8ec85
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $3, $0
	music_noise_sample $f
	octave 5
	note D_, 6
	octave 4
	call_channel Music_8ed5e
	call_channel Music_8ed6c
	call_channel Music_8ed5e
	call_channel Music_8ed5e
	call_channel Music_8ed6c
	octave 4
	note G_, 2
	octave 5
	note G_, 1
	octave 4
	note G_, 2
	note G_, 1
	octave 5
	note F_, 1
	note G_, 1
	note __, 2
	note G_, 1
	note D_, 1
	note F_, 1
	octave 4
	note G_, 1
	octave 5
	note F_, 1
	note G_, 1
	octave 4
	note G_, 1
	octave 5
	note G_, 1
	note A_, 1
	note A#, 1
	note __, 4
	octave 4
	note G_, 1
	octave 6
	note D_, 1
	octave 4
	note G_, 1
	octave 6
	note C_, 1
	octave 4
	note G_, 1
	octave 5
	note A#, 1
	octave 4
	note G_, 1
	octave 5
	note A_, 1
	note C_, 1
	octave 6
	note C_, 2
	octave 5
	note C_, 2
	note D_, 1
	note D#, 1
	note G_, 1
	note F_, 1
	note A_, 2
	octave 4
	note F_, 2
	note G_, 1
	note A_, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	note D_, 1
	note F_, 1
	octave 4
	note G#, 2
	octave 5
	note D#, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note C_, 3
	note C_, 2
	note D_, 1
	note D#, 1
	note G_, 1
	octave 4
	note F_, 2
	note G_, 2
	note A_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 4
	note G#, 4
	note G_, 4
	note G_, 2
	octave 5
	note D_, 2
	note C_, 3
	octave 4
	note G_, 2
	note A_, 1
	note A#, 1
	octave 5
	note C_, 1
	note D_, 2
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	note G_, 2
	octave 5
	note D_, 1
	octave 4
	note G_, 3
	note A#, 2
	note A_, 4
	octave 5
	note E_, 2
	note C_, 1
	octave 4
	note A_, 1
	note G_, 8
	note A_, 1
	octave 5
	note C_, 1
	note __, 1
	note E_, 2
	note F_, 1
	note E_, 1
	note C_, 1
	octave 4
	note D_, 2
	octave 5
	note D_, 2
	octave 4
	note D_, 3
	octave 5
	note D_, 2
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note A_, 1
	note G_, 3
	note A_, 3
	octave 5
	note D#, 3
	note D_, 3
	note C_, 3
	octave 4
	note A_, 2
	note A_, 1
	music_setrepeat1a $2
	octave 5
	note C_, 1
	note E_, 1
	note A_, 1
	note E_, 1
	music_dorepeat1a
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note E_, 1
	note D_, 3
	note E_, 3
	note F_, 3
	note D_, 3
	octave 4
	note A_, 2
	music_setrepeat1a $11
	note A#, 2
	music_dorepeat1a
	music_setrepeat1a $4
	octave 4
	note F_, 2
	octave 5
	note F_, 1
	note C_, 1
	music_dorepeat1a
	octave 4
	note F_, 12
	music_ff

Music_8ed5e: ; 8ed5e
	music_setrepeat1a $2
	octave 4
	note G_, 2
	octave 5
	note G_, 1
	octave 4
	note G_, 2
	note G_, 1
	octave 5
	note F_, 1
	note G_, 1
	music_dorepeat1a
	ret_channel

Music_8ed6c: ; 8ed6c
	music_setrepeat1a $2
	octave 4
	note C_, 2
	octave 5
	note C_, 1
	octave 4
	note C_, 2
	note C_, 1
	note B_, 1
	octave 5
	note C_, 1
	music_dorepeat1a
	octave 4
	note D#, 2
	octave 5
	note D#, 1
	octave 4
	note D#, 2
	note D#, 1
	octave 5
	note D_, 1
	note D#, 1
	octave 4
	note F_, 2
	octave 5
	note F_, 1
	octave 4
	note F_, 2
	note F_, 1
	octave 5
	note E_, 1
	note F_, 1
	ret_channel

Music_8ed8e: ; 8ed8e
	octave 6
	note F_, 1
	note G_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note F_, 1
	ret_channel

Music_8ed99: ; 8ed99
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	ret_channel

Music_8eda4: ; 8eda4
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	octave 7
	note C_, 1
	ret_channel

MusicHeader_8e036_Ch6: ; 8edab
	music_tempo_2 $6
	note C_, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note F#, 1
	note F#, 1
	music_setrepeat1a $10
	note C_, 2
	note G#, 2
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note G#, 1
	note C_, 4
	note G#, 1
	note C_, 2
	note G#, 1
	note G#, 2
	note C#, 1
	note G#, 1
	note G#, 1
	music_setrepeat1a $7
	note C_, 2
	note C#, 1
	note C_, 1
	note G#, 1
	note C_, 1
	note C#, 1
	note C_, 2
	note C_, 1
	note C#, 1
	note C_, 1
	note G#, 2
	note C#, 1
	note C_, 1
	music_dorepeat1a
	note C_, 2
	note C#, 1
	note C_, 1
	note G#, 1
	note C_, 1
	note C#, 1
	note G#, 2
	note C_, 1
	note C#, 1
	note C_, 1
	note G#, 1
	note G#, 1
	note C#, 1
	note C_, 1
	note G#, 1
	note G#, 1
	music_setrepeat1a $5
	note C_, 1
	note G#, 1
	note C#, 1
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note G#, 1
	note C_, 2
	note G#, 2
	music_setrepeat1a $2
	note C#, 1
	note C_, 1
	note G#, 1
	note C_, 1
	music_dorepeat1a
	note G#, 1
	note G#, 1
	music_setrepeat1a $4
	note C_, 1
	note G#, 1
	note C#, 1
	music_dorepeat1a
	note C_, 1
	note G#, 1
	music_setrepeat1a $c
	note C_, 2
	note G#, 1
	note C#, 1
	music_dorepeat1a
	note G#, 16
	music_ff

MusicHeader_8e040_Ch1: ; 8ee0a
	music_tempo_2 $6
	music_fa $78
	music_fb $11, $13, $2, $11
	music_e8 $5
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	music_e8 $11
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1

Music_8ee41: ; 8ee41
	call_channel Music_8f1af
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 2
	note F_, 1
	note G_, 1
	note A#, 1
	note G_, 3
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note F#, 1
	note F_, 1
	music_set_var22_flag6_and_setenvreset $7
	music_tempo_2 $6
	note E_, 3
	note __, 1
	call_channel Music_8f1af
	octave 7
	note C_, 1
	note D_, 1
	note __, 1
	note C_, 3
	octave 6
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 5
	note A#, 1
	octave 6
	note A#, 1
	note __, 1
	note A#, 4
	note __, 1
	note A#, 2
	note __, 1
	note A#, 4
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note F_, 1
	note __, 1
	call_channel Music_8f217
	octave 7
	note C_, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $3
	octave 6
	note A#, 1
	note A_, 1
	octave 6
	note A_, 1
	note A#, 1
	octave 7
	note D_, 1
	note C_, 1
	note F_, 1
	music_set_var22_flag6_and_setenvreset $7
	call_channel Music_8f217
	octave 7
	note D#, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $3
	octave 6
	note A#, 1
	octave 8
	note C_, 1
	octave 7
	note C_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note F_, 1
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note A#, 1
	note F_, 1
	note A#, 1
	note D#, 2
	note G#, 1
	note D#, 1
	note C_, 1
	note F#, 1
	note C#, 1
	note F#, 1
	octave 5
	note B_, 2
	octave 6
	note E_, 1
	octave 5
	note B_, 1
	note G#, 1
	call_channel Music_8f224
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note C_, 1
	note __, 1
	note E_, 3
	note A_, 1
	note E_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note C_, 1
	octave 5
	note A_, 1
	note __, 1
	note A#, 1
	octave 6
	note C_, 1
	call_channel Music_8f224
	note E_, 1
	note __, 1
	note C#, 1
	octave 5
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	octave 6
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note __, 1
	octave 5
	note B_, 3
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 2
	note __, 1
	note A#, 1
	octave 6
	note D_, 1
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note __, 1
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	note C_, 1
	note __, 1
	octave 5
	note G_, 1
	note A#, 1
	note A_, 1
	note __, 1
	note E_, 1
	note G_, 1
	note A#, 1
	note __, 1
	jump_channel Music_8ee41

MusicHeader_8e040_Ch2: ; 8ef20
	music_tempo_2 $6
	music_fa $78
	music_fb $11, $13, $2, $11
	music_e8 $5
	octave 6
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 7
	note F_, 1
	note __, 1
	music_e8 $11
	octave 6
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 7
	note E_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 7
	note E_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $6
	note F_, 1
	music_tempo_2 $3
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note E_, 1
	music_f9 $c, 5, 4

Music_8ef61: ; 8ef61
	call_channel Music_8f158
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $6
	note C#, 1
	music_tempo_2 $4
	music_set_var22_flag6_and_setenvreset $8
	note D_, 1
	music_tempo_2 $6
	note __, 1
	note F_, 2
	note __, 2
	note D_, 2
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 7
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note F#, 1
	note F_, 1
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $8
	note E_, 4
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 1
	call_channel Music_8f158
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A_, 3
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note F_, 1
	note __, 1
	note F_, 11
	note __, 2
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	octave 6
	note A_, 1
	note A#, 1
	octave 7
	note D_, 1
	note C_, 1
	note F_, 1
	note E_, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note G#, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note F_, 1
	note D#, 1
	note D_, 2
	note __, 1
	note C_, 5
	music_tempo_2 $f
	octave 6
	note A#, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note A_, 1
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $8
	note G#, 5
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 6
	note A_, 1
	note __, 1
	octave 7
	note C_, 7
	octave 6
	note A#, 2
	note A_, 2
	note A#, 2
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note G_, 3
	note F_, 1
	note __, 1
	note D_, 2
	note F_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	music_reset_var22_flag6_and_setenvreset $3
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	music_set_var22_flag6_and_setenvreset $8
	octave 6
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note __, 1
	note D_, 1
	note F_, 1
	note E_, 1
	note __, 1
	octave 6
	note A#, 1
	octave 7
	note D_, 1
	note C_, 1
	note __, 1
	octave 6
	note G_, 1
	note A#, 1
	note A_, 1
	note __, 1
	jump_channel Music_8ef61

MusicHeader_8e040_Ch3: ; 8f048
	music_tempo_2 $6
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $6, $11
	octave 5
	note C_, 2
	note C_, 2
	octave 6
	note D_, 2
	octave 5
	note C_, 2
	note C_, 2
	octave 6
	note C_, 2
	octave 5
	note C_, 2
	note C_, 2
	octave 6
	note F_, 2
	octave 5
	note C_, 2
	note C_, 2
	octave 6
	note G_, 2
	octave 5
	note C_, 2
	note C_, 2
	note D_, 2
	note E_, 2
	music_fb $0, $0, $2, $11

Music_8f071: ; 8f071
	call_channel Music_8f232
	call_channel Music_8f246
	call_channel Music_8f232
	call_channel Music_8f259
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	call_channel Music_8f232
	call_channel Music_8f246
	call_channel Music_8f232
	call_channel Music_8f259
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note F_, 1
	octave 5
	note F_, 1
	note __, 1
	note G_, 2
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	call_channel Music_8f29c
	octave 6
	note F_, 1
	octave 4
	note F_, 1
	octave 6
	note F_, 1
	octave 4
	note F_, 1
	octave 6
	note D#, 1
	octave 4
	note F_, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note F_, 1
	note __, 1
	call_channel Music_8f29c
	octave 6
	note G_, 1
	octave 4
	note F_, 1
	octave 6
	note G#, 1
	octave 4
	note F_, 1
	octave 6
	note D#, 1
	octave 4
	note F_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note F_, 1
	note __, 1
	note A#, 1
	octave 5
	note F_, 1
	note A#, 1
	octave 4
	note F_, 2
	octave 5
	note C_, 1
	note F_, 1
	note G#, 1
	octave 4
	note F#, 1
	octave 5
	note C#, 1
	note F#, 1
	note C#, 2
	octave 4
	note G#, 1
	note C#, 2
	music_fb $0, $0, $6, $11
	music_setrepeat1a $2
	octave 5
	note C_, 2
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	music_dorepeat1a
	octave 4
	note F_, 2
	note F_, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note F_, 2
	note F_, 2
	octave 5
	note C_, 2
	note F_, 2
	note C_, 2
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	note C#, 2
	note C#, 2
	octave 4
	note A_, 2
	octave 5
	note C#, 2
	note D_, 2
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note D_, 2
	music_fb $0, $0, $2, $11
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note A_, 1
	note G_, 1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 4
	note A#, 1
	note A_, 1
	note G_, 1
	octave 5
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note C_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	jump_channel Music_8f071

Music_8f158: ; 8f158
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $8
	octave 7
	note F_, 1
	note G_, 1
	note __, 1
	note F_, 3
	note C_, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $6
	note C#, 1
	music_tempo_2 $9
	note D_, 1
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $8
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	note C_, 4
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note F_, 3
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 12
	note __, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note __, 1
	octave 8
	note C_, 3
	octave 7
	note F_, 1
	note __, 1
	note D_, 2
	note F_, 1
	note __, 1
	note A_, 2
	note A#, 1
	note __, 1
	octave 8
	note C_, 2
	note __, 1
	note C_, 3
	octave 7
	note A#, 1
	note A_, 1
	note D_, 3
	note __, 1
	ret_channel

Music_8f1af: ; 8f1af
	music_fa $77
	octave 5
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note A#, 2
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 6
	note F_, 2
	note D_, 1
	note F_, 1
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A_, 2
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 2
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	octave 6
	note D#, 1
	note G_, 1
	note A#, 1
	octave 7
	note D#, 1
	note D_, 1
	note __, 1
	note C_, 2
	note __, 1
	octave 6
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note A_, 1
	octave 6
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 2
	note G_, 1
	note __, 1
	note F_, 2
	note E_, 1
	note __, 1
	note F_, 1
	note G_, 1
	note __, 1
	note A_, 2
	note A#, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	note A#, 1
	note __, 1
	note D#, 1
	note A_, 1
	note D#, 1
	note __, 1
	ret_channel

Music_8f217: ; 8f217
	octave 7
	note C_, 1
	note C_, 1
	octave 5
	note F_, 1
	octave 7
	note C_, 1
	note __, 1
	octave 7
	note D_, 1
	octave 5
	note F_, 1
	ret_channel

Music_8f224: ; 8f224
	music_setrepeat1a $2
	octave 6
	note E_, 1
	octave 5
	note A#, 1
	music_dorepeat1a
	octave 6
	note E_, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	ret_channel

Music_8f232: ; 8f232
	octave 4
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note F_, 2
	octave 4
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 5
	note F_, 2
	octave 4
	note A#, 1
	note __, 1
	ret_channel

Music_8f246: ; 8f246
	octave 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note D_, 2
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 2
	ret_channel

Music_8f259: ; 8f259
	octave 5
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	note A#, 2
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 2
	note C_, 1
	note __, 1
	note F_, 1
	note C_, 1
	note __, 1
	note F_, 2
	note G_, 1
	note A_, 1
	note A#, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note G_, 1
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	note A_, 1
	note A#, 1
	octave 5
	note D_, 1
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	ret_channel

Music_8f29c: ; 8f29c
	octave 6
	note F_, 1
	note F_, 1
	octave 4
	note F_, 1
	octave 6
	note F_, 1
	octave 4
	note F_, 1
	ret_channel

Music_8f2a6: ; 8f2a6
	music_setrepeat1a $3
	note C_, 2
	note D_, 2
	note G#, 2
	note C#, 2
	music_dorepeat1a
	ret_channel

MusicHeader_8e040_Ch6: ; 8f2ae
	music_tempo_2 $6
	music_setrepeat1a $4
	note C_, 2
	note C_, 2
	note G#, 2
	music_dorepeat1a
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note C_, 2

Music_8f2bb: ; 8f2bb
	music_setrepeat1d $3
	call_channel Music_8f2a6
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 1
	note G#, 1
	music_dorepeat1d
	call_channel Music_8f2a6
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1d $3
	call_channel Music_8f2a6
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 1
	note G#, 1
	music_dorepeat1d
	call_channel Music_8f2a6
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1a $7
	note C_, 2
	note G#, 2
	music_dorepeat1a
	note C_, 1
	note C_, 1
	note G#, 2
	music_setrepeat1a $2
	note C_, 2
	note C_, 1
	note G#, 2
	note C_, 1
	note G#, 2
	music_dorepeat1a
	music_setrepeat1d $3
	music_setrepeat1a $3
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note D_, 1
	note C_, 1
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C_, 1
	note G#, 2
	note G#, 1
	note G#, 1
	music_dorepeat1d
	jump_channel Music_8f2bb

MusicHeader_8e04a_Ch1: ; 8f306
	music_tempo_2 $8
	music_fa $b3
	music_fb $11, $11, $2, $21
	music_e8 $18
	music_setfreqoffset $1
	music_f9 $18, 4, 3
	note __, 1
	call_channel Music_8f6bc
	note D_, 3
	music_fa $b7
	music_fb $11, $12, $3, $31
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	octave 6
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note E_, 4
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note B_, 10
	note __, 2

Music_8f349: ; 8f349
	music_fa $b8
	music_fb $11, $12, $8, $12
	octave 6
	note C_, 2
	note E_, 2
	note F_, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note F_, 2
	note A_, 2
	note A#, 2
	octave 7
	note C_, 2
	octave 6
	note F_, 2
	note D_, 2
	octave 5
	note A#, 2
	music_fb $11, $12, $3, $31
	octave 6
	note C_, 3
	music_tempo_2 $4
	note D_, 1
	note D#, 1
	music_tempo_2 $8
	note E_, 2
	note F_, 1
	note G_, 1
	note F_, 2
	note E_, 2
	note G_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	note __, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note A#, 1
	octave 7
	note D_, 6
	note E_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 6
	note A_, 1
	note A#, 1
	octave 7
	note C_, 2
	octave 6
	note A_, 2
	octave 7
	note D_, 2
	note E_, 1
	music_tempo_2 $4
	note D_, 1
	note C#, 1
	music_tempo_2 $8
	note C_, 4
	octave 6
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 2
	note E_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 7
	note C#, 1
	note D_, 7
	note __, 1
	music_fb $11, $12, $8, $12
	call_channel Music_8f6cb
	note G_, 2
	octave 5
	note A#, 2
	octave 6
	note D_, 2
	note F_, 2
	note D_, 2
	note A#, 2
	note D_, 2
	note F_, 2
	note A#, 2
	octave 5
	note A_, 2
	octave 6
	note C_, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	octave 5
	note A_, 2
	music_fb $11, $12, $5, $12
	note B_, 1
	octave 6
	note C_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	music_fb $11, $12, $8, $12
	call_channel Music_8f6cb
	note C_, 2
	octave 5
	note A#, 2
	octave 6
	note D_, 2
	note F_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note A_, 2
	note E_, 2
	note G_, 2
	note A_, 2
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 2
	note G_, 1
	note A_, 1
	note G_, 2
	note F_, 2
	note __, 1
	note E_, 2
	note __, 1
	note D_, 2
	octave 6
	note D#, 2
	note C_, 2
	note D#, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	octave 7
	note D_, 3
	note C_, 3
	octave 6
	note A#, 2
	note G#, 2
	note D_, 2
	note F_, 2
	note G#, 2
	note D#, 2
	note D#, 2
	note D#, 2
	note C_, 4
	octave 5
	note A#, 2
	octave 6
	note C_, 2
	note C#, 4
	note __, 2
	music_fa $b6
	music_fb $11, $12, $3, $31
	music_setrepeat1a $5
	note D_, 1
	note D#, 1
	music_dorepeat1a
	music_fa $b8
	note F_, 1
	note G#, 1
	music_fb $11, $12, $8, $12
	note D#, 2
	note C_, 2
	note D#, 2
	note F_, 4
	note D#, 2
	note F_, 2
	note G_, 4
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note __, 2
	octave 6
	note D#, 2
	note F_, 2
	note G_, 2
	note G_, 1
	note C_, 1
	note G_, 2
	note G_, 1
	note C_, 1
	note F_, 1
	octave 5
	note A#, 1
	octave 6
	note F_, 2
	note F_, 1
	octave 5
	note A#, 1
	octave 6
	note C#, 2
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	note __, 2
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	note D_, 2
	jump_channel Music_8f349

MusicHeader_8e04a_Ch2: ; 8f47c
	music_tempo_2 $8
	music_fa $ba
	music_fb $11, $12, $3, $31
	music_e8 $18
	music_f9 $18, 4, 3
	call_channel Music_8f6bc
	note D_, 10
	note __, 2
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 6
	note A_, 2
	note G_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note D_, 4
	note C_, 2
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 1
	note A_, 1
	note G_, 10
	note __, 2

Music_8f4aa: ; 8f4aa
	note __, 2
	music_fa $79
	octave 7
	note E_, 2
	note F_, 2
	note E_, 2
	note G_, 3
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 6
	note A_, 1
	note A#, 1
	note __, 2
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 3
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	octave 8
	note C_, 1
	octave 7
	note A#, 1
	note G_, 8
	note __, 2
	note F_, 2
	note A#, 2
	octave 8
	note C_, 2
	note D_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 7
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note A_, 2
	note __, 2
	note D_, 2
	note __, 4
	note D_, 2
	note F_, 2
	note G_, 1
	music_tempo_2 $4
	note F#, 1
	note F_, 1
	music_tempo_2 $8
	note E_, 7
	note __, 1
	note D_, 4
	note C_, 4
	note D_, 6
	music_tempo_2 $4
	note __, 1
	note D#, 1
	note E_, 1
	note F_, 1
	music_tempo_2 $8
	note F#, 8
	music_fa $b9
	note __, 4
	note G_, 1
	note __, 3
	note G_, 2
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 4
	note D_, 1
	note __, 7
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F_, 4
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	octave 7
	note C_, 3
	note __, 1
	note D_, 12
	note __, 2
	note D_, 1
	note E_, 1
	note F_, 1
	note __, 5
	note E_, 1
	note __, 3
	note E_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 3
	note __, 1
	note G_, 3
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 8
	note __, 2
	octave 6
	note A_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note E_, 4
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 2
	note __, 2
	music_setrepeat1a $3
	note G_, 1
	note __, 1
	music_dorepeat1a
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 8
	note C_, 4
	octave 7
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 2
	note __, 1
	note G#, 2
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	music_tempo_2 $4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	music_tempo_2 $8
	note G_, 2
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G#, 4
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 6
	music_fa $75
	call_channel Music_8f6ac
	music_fa $77
	call_channel Music_8f6ac
	music_fa $79
	call_channel Music_8f6ac
	music_fa $74
	call_channel Music_8f6ac
	music_fa $b9
	octave 7
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 4
	note G_, 1
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note G_, 1
	note __, 3
	note G_, 1
	note __, 1
	note F_, 2
	note D#, 1
	note __, 1
	note G_, 2
	note G#, 1
	note __, 1
	note A#, 1
	note __, 1
	note F_, 3
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 14
	note __, 4
	jump_channel Music_8f4aa

MusicHeader_8e04a_Ch3: ; 8f5b6
	music_tempo_2 $8
	music_fa $3
	music_fb $0, $0, $7, $0
	music_noise_sample $f
	note __, 12
	octave 5
	note G_, 2
	octave 6
	note C_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	note D_, 4
	note E_, 2
	note F_, 2
	note E_, 2
	note C_, 2
	octave 5
	note G_, 2
	octave 4
	note G_, 4
	music_fb $0, $0, $5, $0
	note B_, 1
	octave 5
	note C_, 1
	note D_, 2
	music_tempo_2 $b
	octave 4
	note G_, 16
	music_tempo_2 $8

Music_8f5e2: ; 8f5e2
	music_setrepeat1a $2
	octave 5
	note C_, 2
	note G_, 2
	octave 6
	note C_, 2
	note D_, 4
	note C_, 2
	octave 5
	note G_, 2
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note D_, 2
	music_dorepeat1a
	octave 4
	note A#, 2
	octave 5
	note F_, 2
	octave 6
	note C_, 2
	note D_, 2
	note C_, 2
	octave 5
	note A#, 2
	note A_, 2
	note F_, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note A_, 2
	note A#, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note E_, 2
	note B_, 2
	octave 6
	note C_, 2
	octave 5
	note A_, 2
	octave 6
	note C_, 2
	octave 5
	note G_, 2
	note C_, 2
	note D_, 2
	note A_, 2
	octave 6
	note D_, 2
	note E_, 4
	note D_, 2
	octave 5
	note A_, 2
	note D_, 2
	music_setrepeat1a $2
	octave 5
	note C_, 2
	note __, 1
	note C_, 2
	octave 4
	note G_, 1
	note A_, 1
	octave 5
	note C_, 2
	note D_, 2
	note C_, 3
	octave 4
	note A_, 2
	note G_, 2
	note __, 1
	note G_, 1
	octave 5
	note D_, 1
	octave 4
	note G_, 2
	note G_, 2
	octave 5
	note G_, 2
	note F_, 2
	note D_, 2
	octave 4
	note G_, 1
	note F_, 2
	note __, 1
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 2
	note F_, 2
	note F_, 2
	octave 5
	note E_, 1
	note F_, 1
	note E_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 2
	note __, 1
	note G_, 1
	octave 5
	note D_, 1
	octave 4
	note G_, 2
	note G_, 2
	note G_, 2
	note G_, 1
	note G_, 1
	note A_, 1
	note B_, 2
	music_dorepeat1a
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 4
	note G#, 2
	note G#, 2
	note G_, 4
	note G_, 2
	note G_, 2
	note F_, 4
	note F_, 2
	note F_, 2
	note F_, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note G#, 4
	note G_, 2
	note G#, 2
	octave 5
	note C#, 4
	octave 4
	note G#, 2
	octave 5
	note C#, 2
	octave 4
	note A#, 4
	note A#, 2
	octave 5
	note F_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note C_, 2
	note C_, 2
	octave 4
	note B_, 4
	note B_, 2
	note B_, 2
	note A#, 4
	note A#, 2
	note A#, 2
	note A_, 4
	note A_, 2
	note A_, 2
	note A_, 2
	note G#, 2
	octave 5
	note D#, 2
	octave 4
	note G#, 2
	note F#, 4
	octave 5
	note C#, 2
	octave 4
	note F#, 2
	note D_, 4
	note A_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note D_, 2
	jump_channel Music_8f5e2

Music_8f6ac: ; 8f6ac
	music_setrepeat1a $2
	octave 7
	note A#, 1
	octave 8
	note C_, 1
	music_dorepeat1a
	ret_channel

Music_8f6b4: ; 8f6b4
	note C_, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 2
	ret_channel

Music_8f6bc: ; 8f6bc
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	ret_channel

Music_8f6cb: ; 8f6cb
	octave 6
	note E_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	octave 7
	note C_, 2
	octave 6
	note G_, 2
	note E_, 2
	ret_channel

MusicHeader_8e04a_Ch6: ; 8f6d6
	music_tempo_2 $8
	note __, 4
	note __, 16
	note __, 16
	note __, 16
	note __, 6
	note G#, 1
	note C_, 1
	note C_, 2
	note C#, 2
	note G#, 2
	note G#, 1
	note G#, 1

Music_8f6e4: ; 8f6e4
	music_setrepeat1a $7
	note C_, 2
	note C#, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note C#, 2
	note E_, 2
	note C_, 2
	music_dorepeat1a
	note C_, 2
	note C#, 2
	note D_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1d $2
	music_setrepeat1a $3
	call_channel Music_8f6b4
	note C_, 2
	music_dorepeat1a
	call_channel Music_8f6b4
	note G#, 1
	note G#, 1
	music_dorepeat1d
	music_setrepeat1a $2
	call_channel Music_8f6b4
	note C_, 2
	music_dorepeat1a
	call_channel Music_8f6b4
	note F_, 1
	note G#, 1
	note C_, 1
	note G#, 2
	note C_, 1
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1a $3
	call_channel Music_8f6b4
	note C_, 2
	music_dorepeat1a
	note D_, 2
	note G#, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note G#, 1
	note D#, 1
	note G#, 2
	note C_, 2
	jump_channel Music_8f6e4

MusicHeader_8e054_Ch1: ; 8f730
	music_tempo_2 $6
	music_fa $77
	music_fb $11, $13, $2, $11
	octave 6
	note G#, 1
	note G#, 1
	music_e8 $b
	note __, 1
	note A_, 1
	note A_, 1
	music_e8 $11
	note __, 1
	note A#, 1
	note A#, 1
	music_tempo_2 $4
	music_reset_var22_flag6_and_setenvreset $6
	octave 5
	note A#, 2
	note D_, 1
	note G#, 1
	octave 6
	note C_, 1
	note E_, 1
	music_tempo_2 $6
	note G#, 1
	music_setfreqoffset $1
	octave 7
	note D_, 3
	music_tempo_2 $4
	music_setfreqoffset $0
	octave 5
	note D_, 1
	note G#, 1
	octave 6
	note C_, 1
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	note D_, 1
	octave 5
	note A_, 1
	octave 6
	note D_, 1
	note G#, 1
	note D_, 1
	note G#, 1
	octave 7
	note C_, 1

Music_8f76f: ; 8f76f
	music_e8 $11
	call_channel Music_8f957
	octave 7
	note C#, 1
	note C#, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note C#, 1
	music_e8 $0
	note __, 8
	music_e8 $11
	call_channel Music_8f957
	octave 7
	note E_, 1
	note E_, 1
	note __, 1
	octave 6
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 5
	note E_, 1
	music_e8 $0
	note __, 12
	music_e8 $11
	octave 5
	note G#, 1
	note A_, 1
	octave 6
	note D#, 1
	note E_, 1
	music_tempo_2 $6
	music_reset_var22_flag6_and_setenvreset $5
	music_setrepeat1a $7
	octave 6
	note D#, 1
	octave 5
	note A_, 1
	music_dorepeat1a
	octave 6
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $6
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $4
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $3
	note D#, 1
	note D_, 1
	note C#, 1
	note __, 1
	music_e8 $0
	note __, 2
	note __, 16
	music_e8 $11
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $7
	octave 7
	note A#, 1
	note D#, 1
	octave 7
	note A#, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $4
	music_setrepeat1a $a
	octave 6
	note A#, 1
	octave 7
	note D#, 1
	music_dorepeat1a
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note A#, 1
	note __, 1
	music_e8 $0
	note __, 8
	jump_channel Music_8f76f

MusicHeader_8e054_Ch2: ; 8f7e5
	music_tempo_2 $6
	music_fa $b8
	music_fb $11, $13, $2, $11
	octave 7
	note C_, 1
	note C_, 1
	music_e8 $b
	note __, 1
	note C#, 1
	note C#, 1
	music_e8 $11
	note __, 1
	note D_, 1
	note D_, 1
	music_tempo_2 $4
	music_reset_var22_flag6_and_setenvreset $6
	octave 5
	note D_, 1
	note G#, 1
	octave 6
	note C_, 1
	note E_, 1
	note G#, 1
	octave 7
	music_tempo_2 $4c
	music_set_var22_flag6_and_setenvreset $8
	music_f9 $1c, 5, 5
	note D_, 1

Music_8f80f: ; 8f80f
	call_channel Music_8f937
	octave 7
	note D_, 1
	octave 6
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note D_, 1
	music_tempo_2 $3
	octave 7
	music_reset_var22_flag6_and_setenvreset $5
	music_setrepeat1a $4
	note A#, 1
	note E_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $4
	note A#, 1
	note E_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $2
	music_setrepeat1a $4
	note A#, 1
	note E_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $4
	note A#, 1
	note E_, 1
	music_dorepeat1a
	music_set_var22_flag6_and_setenvreset $8
	call_channel Music_8f937
	octave 7
	note F_, 1
	octave 6
	note A#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note F_, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	call_channel Music_8f94f
	music_reset_var22_flag6_and_setenvreset $3
	call_channel Music_8f94f
	music_reset_var22_flag6_and_setenvreset $2
	call_channel Music_8f94f
	music_reset_var22_flag6_and_setenvreset $3
	call_channel Music_8f94f
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $8
	octave 6
	note D_, 1
	note D#, 1
	note A#, 1
	note B_, 12
	music_tempo_2 $6
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $6
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $4
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $3
	note A#, 1
	note A_, 1
	note G#, 1
	note __, 1
	music_e8 $0
	note __, 2
	music_e8 $11
	music_tempo_2 $3
	octave 5
	music_reset_var22_flag6_and_setenvreset $5
	music_setrepeat1a $4
	note G#, 1
	note A_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $4
	note G#, 1
	note A_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $2
	music_setrepeat1a $4
	note G#, 1
	note A_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $4
	note G#, 1
	note A_, 1
	music_dorepeat1a
	music_reset_var22_flag6_and_setenvreset $6
	octave 6
	music_setrepeat1a $6
	note C#, 1
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	note C_, 1
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	octave 5
	note B_, 1
	octave 6
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	note C_, 1
	note A#, 1
	music_dorepeat1a
	music_setrepeat1a $6
	note C#, 1
	note A#, 1
	music_dorepeat1a
	note C_, 1
	note A#, 1
	note C_, 1
	note A#, 1
	jump_channel Music_8f80f

MusicHeader_8e054_Ch3: ; 8f8cc
	music_tempo_2 $6
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	octave 6
	note D_, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 12
	music_tempo_2 $3
	music_reset_var22_flag6
	octave 4
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D#, 1
	music_set_var22_flag6

Music_8f8ee: ; 8f8ee
	call_channel Music_8f96d
	note D_, 1
	octave 5
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	call_channel Music_8f96d
	note F_, 1
	octave 5
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	octave 4
	note __, 1
	note B_, 1
	note __, 1
	note A#, 1
	music_setrepeat1a $4
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D_, 1
	music_dorepeat1a
	music_tempo_2 $6
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note __, 8
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note __, 8
	note D#, 1
	note D#, 1
	note D#, 1
	note D#, 1
	note __, 4
	jump_channel Music_8f8ee

Music_8f937: ; 8f937
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $8
	octave 6
	note G#, 1
	note __, 1
	note A_, 1
	note G#, 1
	note __, 1
	note A_, 1
	note __, 1
	note G#, 1
	note G#, 1
	note A_, 1
	note __, 1
	note G#, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 1
	note A#, 1
	note A_, 1
	ret_channel

Music_8f94f: ; 8f94f
	music_setrepeat1a $4
	octave 8
	note C#, 1
	octave 7
	note G_, 1
	music_dorepeat1a
	ret_channel

Music_8f957: ; 8f957
	music_set_var22_flag6_and_setenvreset $7
	music_tempo_2 $c
	octave 6
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	note D_, 1
	note D#, 1
	note __, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	ret_channel

Music_8f96d: ; 8f96d
	music_tempo_2 $c
	note D_, 1
	note __, 1
	octave 5
	note C_, 1
	octave 4
	note B_, 1
	note __, 1
	octave 4
	note D_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 1
	note D_, 1
	note __, 1
	octave 5
	note C_, 1
	octave 4
	note D_, 1
	ret_channel

MusicHeader_8e054_Ch6: ; 8f986
	music_tempo_2 $6
	note G#, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G#, 1
	note C#, 1
	note G#, 1
	note G#, 1
	note C_, 2
	note C_, 2
	note G#, 4
	note C_, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1

Music_8f998: ; 8f998
	music_setrepeat1a $4
	note C_, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note C#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note C_, 2
	note C#, 2
	note A#, 4
	music_dorepeat1a
	music_setrepeat1a $7
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 4
	music_dorepeat1a
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note C_, 2
	note G#, 2
	music_setrepeat1a $4
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note C_, 2
	note G#, 2
	music_setrepeat1a $4
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note G#, 2
	note C_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	jump_channel Music_8f998

