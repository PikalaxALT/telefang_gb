	dw MusicHeader_8a002
	dw MusicHeader_8a010
	dw MusicHeader_8a01a
	dw MusicHeader_8a024
	dw MusicHeader_8a02e
	dw MusicHeader_8a038
	dw MusicHeader_8a042
	dw MusicHeader_8a04c
	dw MusicHeader_8a056
	dw MusicHeader_8a060
	dw MusicHeader_8a06a
	dw MusicHeader_8a074
	dw MusicHeader_8a07e
	dw MusicHeader_8a088
	dw MusicHeader_8a09c
	dw MusicHeader_8a092

MusicHeader_8a002: ; 8a002
	channel %111111, $f0
	dw MusicHeader_8a002_Ch1
	dw MusicHeader_8a002_Ch2
	dw MusicHeader_8a002_Ch3
	dw MusicHeader_8a002_Ch4
	dw MusicHeader_8a002_Ch5
	dw MusicHeader_8a002_Ch6

MusicHeader_8a010: ; 8a010
	channel %111001, $f0
	dw MusicHeader_8a010_Ch1
	dw MusicHeader_8a010_Ch2
	dw MusicHeader_8a010_Ch3
	dw MusicHeader_8a010_Ch6

MusicHeader_8a01a: ; 8a01a
	channel %111001, $c0
	dw MusicHeader_8a01a_Ch1
	dw MusicHeader_8a01a_Ch2
	dw MusicHeader_8a01a_Ch3
	dw MusicHeader_8a01a_Ch6

MusicHeader_8a024: ; 8a024
	channel %111001, $c0
	dw MusicHeader_8a024_Ch1
	dw MusicHeader_8a024_Ch2
	dw MusicHeader_8a024_Ch3
	dw MusicHeader_8a024_Ch6

MusicHeader_8a02e: ; 8a02e
	channel %111001, $c0
	dw MusicHeader_8a02e_Ch1
	dw MusicHeader_8a02e_Ch2
	dw MusicHeader_8a02e_Ch3
	dw MusicHeader_8a02e_Ch6

MusicHeader_8a038: ; 8a038
	channel %111001, $c0
	dw MusicHeader_8a038_Ch1
	dw MusicHeader_8a038_Ch2
	dw MusicHeader_8a038_Ch3
	dw MusicHeader_8a038_Ch6

MusicHeader_8a042: ; 8a042
	channel %111001, $c0
	dw MusicHeader_8a042_Ch1
	dw MusicHeader_8a042_Ch2
	dw MusicHeader_8a042_Ch3
	dw MusicHeader_8a042_Ch6

MusicHeader_8a04c: ; 8a04c
	channel %111001, $c0
	dw MusicHeader_8a04c_Ch1
	dw MusicHeader_8a04c_Ch2
	dw MusicHeader_8a04c_Ch3
	dw MusicHeader_8a04c_Ch6

MusicHeader_8a056: ; 8a056
	channel %111001, $c0
	dw MusicHeader_8a056_Ch1
	dw MusicHeader_8a056_Ch2
	dw MusicHeader_8a056_Ch3
	dw MusicHeader_8a056_Ch6

MusicHeader_8a060: ; 8a060
	channel %111001, $c0
	dw MusicHeader_8a060_Ch1
	dw MusicHeader_8a060_Ch2
	dw MusicHeader_8a060_Ch3
	dw MusicHeader_8a060_Ch6

MusicHeader_8a06a: ; 8a06a
	channel %111001, $c0
	dw MusicHeader_8a06a_Ch1
	dw MusicHeader_8a06a_Ch2
	dw MusicHeader_8a06a_Ch3
	dw MusicHeader_8a06a_Ch6

MusicHeader_8a074: ; 8a074
	channel %111001, $c0
	dw MusicHeader_8a074_Ch1
	dw MusicHeader_8a074_Ch2
	dw MusicHeader_8a074_Ch3
	dw MusicHeader_8a074_Ch6

MusicHeader_8a07e: ; 8a07e
	channel %111001, $c0
	dw MusicHeader_8a07e_Ch1
	dw MusicHeader_8a07e_Ch2
	dw MusicHeader_8a07e_Ch3
	dw MusicHeader_8a07e_Ch6

MusicHeader_8a088: ; 8a088
	channel %111001, $c0
	dw MusicHeader_8a088_Ch1
	dw MusicHeader_8a088_Ch2
	dw MusicHeader_8a088_Ch3
	dw MusicHeader_8a088_Ch6

MusicHeader_8a092: ; 8a092
	channel %111001, $c0
	dw MusicHeader_8a092_Ch1
	dw MusicHeader_8a092_Ch2
	dw MusicHeader_8a092_Ch3
	dw MusicHeader_8a092_Ch6

MusicHeader_8a09c: ; 8a09c
	channel %111001, $c0
	dw MusicHeader_8a09c_Ch1
	dw MusicHeader_8a09c_Ch2
	dw MusicHeader_8a09c_Ch3
	dw MusicHeader_8a09c_Ch6

MusicHeader_8a002_Ch1: ; 8a0a6
MusicHeader_8a002_Ch2: ; 8a0a6
MusicHeader_8a002_Ch3: ; 8a0a6
MusicHeader_8a002_Ch4: ; 8a0a6
MusicHeader_8a002_Ch5: ; 8a0a6
MusicHeader_8a002_Ch6: ; 8a0a6
MusicHeader_8a010_Ch1: ; 8a0a6
MusicHeader_8a010_Ch2: ; 8a0a6
MusicHeader_8a010_Ch3: ; 8a0a6
MusicHeader_8a010_Ch6: ; 8a0a6
MusicHeader_8a092_Ch1: ; 8a0a6
MusicHeader_8a092_Ch2: ; 8a0a6
MusicHeader_8a092_Ch3: ; 8a0a6
MusicHeader_8a092_Ch6: ; 8a0a6
	music_ff

MusicHeader_8a01a_Ch1: ; 8a0a7
	music_tempo_2 $8

Music_8a0a9: ; 8a0a9
	music_fb $11, $11, $3, $31
	music_f9 $10, 4, 3
	note __, 2
	music_e8 $10
	music_setrepeat1a $6
	music_fa $b7
	octave 6
	note C_, 2
	note C#, 2
	note C_, 2
	octave 5
	note A#, 2
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	note A#, 2
	note G_, 2
	note G#, 2
	music_fa $b4
	note G_, 1
	note G#, 1
	music_dorepeat1a
	music_fa $b7
	octave 6
	note C_, 2
	note C#, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note C_, 2
	octave 5
	note G#, 2
	note G#, 2
	note F_, 1
	note G#, 1
	note G#, 2
	note A#, 2
	octave 6
	note C_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	octave 5
	note A#, 2
	note G#, 2
	note G_, 2
	note G#, 2
	music_fb $11, $12, $7, $11
	music_e8 $18
	note A#, 2
	octave 6
	note C_, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note C_, 2
	octave 5
	note A#, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 6
	note C_, 2
	note D_, 2
	note D#, 2
	note G_, 2
	note F_, 2
	note G_, 2
	music_fb $11, $11, $3, $31
	note G#, 4
	note G_, 2
	note G#, 2
	note F_, 4
	note D#, 2
	note C#, 2
	note G_, 2
	note D#, 2
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note C#, 4
	note C_, 2
	octave 5
	note A#, 2
	note F_, 2
	music_fa $b4
	note A#, 1
	note F_, 1
	note A#, 1
	octave 6
	note G_, 1
	music_fa $b7
	octave 5
	note G_, 2
	note G#, 2
	note A#, 2
	octave 6
	note C_, 2
	octave 5
	note A#, 2
	music_fb $11, $12, $7, $11
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	note A#, 2
	octave 6
	note C_, 2
	jump_channel Music_8a0a9

MusicHeader_8a01a_Ch2: ; 8a138
	music_tempo_2 $8
	music_f9 $10, 4, 3

Music_8a13d: ; 8a13d
	note __, 2
	music_e8 $10
	call_channel Music_8a235
	note F_, 1
	note F_, 1
	note A#, 1
	note A#, 1
	note __, 2
	call_channel Music_8a243
	note A#, 2
	note G_, 2
	note G#, 2
	music_setfreqoffset $0
	call_channel Music_8a235
	note G_, 1
	note G_, 1
	note D#, 1
	note D#, 1
	note __, 2
	call_channel Music_8a243
	music_setfreqoffset $0
	music_e8 $18
	music_fa $b9
	music_fb $11, $12, $5, $51
	octave 6
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note F_, 2
	note E_, 2
	note F_, 2
	note C_, 2
	music_fa $b5
	note F_, 1
	note C_, 1
	music_fa $b9
	note E_, 2
	note F_, 2
	note C_, 4
	octave 6
	note A#, 2
	note G#, 2
	note A#, 3
	music_tempo_2 $4
	note A_, 1
	note G#, 1
	music_tempo_2 $8
	note G_, 2
	note G#, 2
	note G_, 3
	note __, 1
	note __, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note D#, 3
	music_tempo_2 $4
	note D_, 1
	note C#, 1
	music_tempo_2 $8
	note C_, 2
	note D#, 1
	note __, 1
	note G_, 2
	note G#, 1
	note __, 1
	note A#, 4
	note __, 2
	note G_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C#, 2
	note C_, 5
	note __, 1
	octave 6
	note A#, 3
	note __, 1
	note F_, 2
	note G#, 2
	note A#, 2
	music_tempo_2 $4
	note G_, 7
	note F#, 1
	music_tempo_2 $8
	note F_, 6
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	note G_, 6
	note F_, 1
	note G_, 1
	note F_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 6
	note A#, 2
	note G#, 2
	note G_, 5
	note __, 1
	note F_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note F_, 7
	note __, 1
	note D#, 2
	note C#, 2
	note C_, 3
	note __, 1
	octave 6
	note A#, 3
	note __, 1
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note C#, 2
	note C_, 2
	octave 6
	note A#, 2
	note G#, 4
	note G_, 4
	note F_, 10
	note __, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note D#, 2
	jump_channel Music_8a13d

MusicHeader_8a01a_Ch3: ; 8a1ea
	music_tempo_2 $8
	music_fa $3
	music_fb $0, $0, $8, $0
	music_noise_sample $f

Music_8a1f5: ; 8a1f5
	octave 5
	music_setrepeat1a $5
	note F_, 14
	note __, 2
	note C_, 4
	music_dorepeat1a
	note F_, 14
	note __, 3
	music_fb $0, $0, $1, $0
	note D#, 1
	note C#, 1
	note C_, 1
	music_fb $0, $0, $8, $0
	octave 4
	note A#, 14
	note __, 2
	note G#, 4
	note A#, 14
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note G#, 2
	note F_, 14
	note D#, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 5
	note C_, 10
	note __, 2
	octave 4
	note F_, 2
	octave 5
	note C_, 2
	note C#, 14
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 4
	note __, 2
	note C_, 2
	note F_, 2
	note C_, 2
	octave 4
	note A#, 6
	note __, 2
	octave 5
	note C_, 12
	note C#, 4
	note D#, 4
	jump_channel Music_8a1f5

Music_8a235: ; 8a235
	music_fa $b9
	music_fb $11, $12, $5, $11
	octave 6
	note F_, 1
	note F_, 1
	octave 7
	note C_, 1
	note C_, 1
	ret_channel

Music_8a243: ; 8a243
	music_setfreqoffset $1
	music_fa $b3
	music_fb $11, $12, $2, $11
	octave 6
	note C_, 2
	octave 5
	note G#, 2
	ret_channel

MusicHeader_8a01a_Ch6: ; 8a251
	music_tempo_2 $8

Music_8a253: ; 8a253
	note C_, 4
	note E_, 4
	note D#, 4
	note D_, 4
	note D#, 2
	note C_, 2
	jump_channel Music_8a253

MusicHeader_8a024_Ch1: ; 8a25c
	music_tempo_2 $8
	music_fa $b8
	music_fb $11, $13, $3, $21
	music_f9 $15, 4, 3

Music_8a268: ; 8a268
	note __, 2
	music_e8 $10
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	note D_, 1
	note __, 1
	octave 5
	note G_, 2
	note __, 2
	octave 6
	note C_, 2
	note A_, 1
	note __, 1
	octave 5
	note B_, 2
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note A_, 2
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note G_, 2
	octave 6
	note C_, 1
	note __, 1
	note G_, 2
	note F_, 1
	note __, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 2
	octave 6
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note G_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note C_, 2
	octave 5
	note B_, 2
	octave 6
	note C_, 2
	note __, 2
	octave 5
	note A_, 2
	note __, 2
	octave 6
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	note F_, 2
	note G_, 1
	note A_, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note C_, 4
	note D_, 1
	note __, 1
	note C_, 2
	octave 5
	note B_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note __, 1
	music_tempo_2 $2
	octave 6
	note E_, 10
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	music_tempo_2 $8
	note E_, 2
	note __, 2
	call_channel Music_8a50d
	note G_, 1
	note __, 1
	note C_, 2
	octave 5
	note B_, 1
	note __, 1
	call_channel Music_8a51a
	call_channel Music_8a50d
	octave 7
	note D_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note B_, 1
	note __, 1
	call_channel Music_8a51a
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	octave 5
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 2
	note D#, 1
	note __, 1
	octave 7
	note C_, 2
	octave 6
	note D#, 1
	note __, 1
	note D_, 4
	octave 5
	note B_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note C_, 2
	note D#, 1
	note __, 1
	octave 7
	note C_, 2
	octave 6
	note D#, 1
	note C_, 1
	note D_, 1
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 1
	jump_channel Music_8a268

MusicHeader_8a024_Ch2: ; 8a358
	music_tempo_2 $8
	music_fa $79
	music_fb $11, $13, $3, $21
	music_e8 $10
	music_setfreqoffset $1
	music_f9 $15, 4, 3

Music_8a368: ; 8a368
	call_channel Music_8a4d9
	note D_, 1
	note __, 1
	note G_, 4
	note F_, 2
	note E_, 1
	note D_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	note G_, 2
	note __, 2
	note A_, 1
	note B_, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note F_, 2
	note E_, 1
	note D_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 4
	note __, 1
	note C_, 1
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	note D_, 4
	note D#, 2
	note __, 2
	call_channel Music_8a4d9
	octave 6
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note __, 1
	note A_, 2
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	note C_, 1
	octave 6
	note B_, 1
	note A_, 1
	note G_, 1
	music_tempo_2 $1
	note __, 5
	octave 7
	note F#, 3
	music_tempo_2 $8
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note F_, 2
	note E_, 1
	note D_, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note __, 1
	music_tempo_2 $2
	octave 7
	note C_, 10
	note D_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	music_tempo_2 $8
	octave 8
	note C_, 2
	note __, 2
	call_channel Music_8a4e5
	note F_, 1
	note __, 1
	octave 6
	note A_, 2
	note G_, 1
	note __, 1
	call_channel Music_8a4f1
	call_channel Music_8a4e5
	note A_, 1
	note __, 1
	octave 6
	note G_, 2
	note A_, 1
	note __, 1
	call_channel Music_8a4f1
	octave 6
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D_, 3
	note E_, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 6
	note B_, 1
	note A_, 1
	note G_, 1
	call_channel Music_8a503
	note G_, 4
	note __, 2
	note G_, 1
	note __, 1
	call_channel Music_8a503
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	note __, 1
	jump_channel Music_8a368

MusicHeader_8a024_Ch3: ; 8a431
	music_tempo_2 $8
	music_fa $3
	music_fb $0, $0, $4, $0
	music_noise_sample $f

Music_8a43c: ; 8a43c
	call_channel Music_8a52b
	note G_, 2
	octave 5
	note D_, 1
	note __, 1
	note F_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	note C_, 2
	octave 4
	note A_, 1
	note __, 1
	note B_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 1
	note __, 1
	note A_, 2
	note G_, 1
	note __, 1
	call_channel Music_8a52b
	note G_, 1
	note A_, 1
	note B_, 2
	note F_, 2
	note __, 2
	octave 5
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 4
	note G_, 1
	note A_, 1
	note B_, 1
	octave 5
	note C_, 1
	note D_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 2
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 2
	octave 4
	note A_, 1
	note G#, 1
	note G_, 1
	note __, 1
	note G_, 7
	octave 5
	note D_, 1
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 1
	note __, 1
	note C_, 7
	note E_, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note D#, 2
	note D_, 2
	octave 4
	note G_, 1
	note __, 1
	note G_, 7
	octave 5
	note G_, 1
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note D_, 2
	note G_, 2
	note C_, 1
	note __, 1
	note C_, 7
	note E_, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note D#, 2
	note D_, 2
	octave 4
	music_setrepeat1a $4
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	music_dorepeat1a
	octave 5
	note D_, 2
	octave 4
	note G_, 8
	octave 5
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	note G#, 2
	octave 5
	note G#, 2
	note D#, 2
	note F_, 1
	note G#, 1
	note B_, 2
	note D_, 1
	note D_, 1
	note G_, 2
	note D_, 2
	octave 4
	note G#, 2
	octave 5
	note G#, 2
	note D#, 2
	note G#, 1
	note D_, 1
	octave 4
	note G_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note B_, 2
	jump_channel Music_8a43c

Music_8a4d9: ; 8a4d9
	octave 7
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	ret_channel

Music_8a4e5: ; 8a4e5
	octave 5
	note G_, 1
	note __, 1
	octave 7
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 2
	ret_channel

Music_8a4f1: ; 8a4f1
	octave 6
	note C_, 1
	note __, 1
	octave 7
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 2
	note C_, 1
	note __, 1
	octave 6
	note G#, 2
	note G_, 1
	note __, 1
	ret_channel

Music_8a503: ; 8a503
	octave 6
	note G#, 2
	octave 7
	note G#, 1
	note __, 1
	note G#, 2
	octave 6
	note G#, 1
	note __, 1
	ret_channel

Music_8a50d: ; 8a50d
	octave 5
	note D_, 1
	note __, 1
	music_setrepeat1a $3
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	music_dorepeat1a
	octave 6
	note B_, 2
	ret_channel

Music_8a51a: ; 8a51a
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 2
	note E_, 1
	note __, 1
	note C_, 2
	octave 5
	note B_, 1
	note __, 1
	ret_channel

Music_8a52b: ; 8a52b
	octave 5
	note C_, 2
	note __, 2
	octave 4
	note B_, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 2
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note F_, 2
	note __, 2
	octave 5
	note E_, 2
	note __, 2
	note D_, 2
	octave 4
	note G_, 1
	note __, 1
	ret_channel

MusicHeader_8a024_Ch6: ; 8a542
	music_tempo_2 $8

Music_8a544: ; 8a544
	music_setrepeat1a $e
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	music_dorepeat1a
	note C_, 2
	note F_, 1
	note G#, 1
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note D_, 2
	music_setrepeat1a $4
	note G#, 2
	note G#, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note D_, 2
	music_dorepeat1a
	music_setrepeat1a $4
	note C_, 2
	note D_, 2
	music_dorepeat1a
	note G#, 2
	note C_, 2
	music_setrepeat1a $3
	note D_, 2
	note C_, 2
	music_dorepeat1a
	music_setrepeat1a $2
	note C_, 2
	note G#, 2
	note G#, 2
	note C_, 2
	note D_, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note C_, 2
	music_dorepeat1a
	jump_channel Music_8a544

MusicHeader_8a02e_Ch1: ; 8a57a
	music_tempo_2 $9
	music_fb $11, $13, $2, $21
	music_f9 $13, 4, 4
	music_setfreqoffset $1

Music_8a586: ; 8a586
	note __, 1
	music_fa $74
	music_e8 $12
	octave 6
	note G_, 2
	note A_, 2
	note __, 1
	music_fa $78
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	note A_, 2
	note G_, 2
	note A_, 1
	note B_, 1
	octave 6
	note D_, 2
	note __, 2
	octave 5
	note B_, 2
	octave 6
	note G_, 2
	note F#, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note B_, 4
	note __, 2
	octave 6
	note D_, 2
	note A_, 2
	note G_, 2
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note __, 2
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note A_, 2
	note B_, 2
	octave 6
	note C_, 1
	note D_, 1
	note E_, 2
	note D_, 2
	note C_, 2
	note __, 2
	note D_, 3
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	note D_, 1
	note G#, 1
	note F_, 1
	note E_, 1
	note D_, 1
	octave 5
	note B_, 1
	note G#, 1
	note __, 1
	note __, 2
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note __, 2
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note A_, 2
	note G_, 2
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	note __, 2
	note B_, 1
	octave 6
	note C_, 1
	note D_, 2
	note E_, 2
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note E_, 4
	note __, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 2
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note F#, 4
	note __, 2
	note D_, 1
	note E_, 1
	note F#, 2
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note __, 1
	octave 5
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note __, 1
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note B_, 1
	note A_, 1
	note G_, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note B_, 2
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note G#, 2
	note B_, 1
	note __, 1
	note __, 2
	octave 6
	note G_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note B_, 4
	jump_channel Music_8a586

MusicHeader_8a02e_Ch2: ; 8a681
	music_tempo_2 $9
	music_fa $79
	music_fb $11, $13, $4, $41
	music_e8 $12
	music_f9 $13, 4, 4

Music_8a68f: ; 8a68f
	octave 6
	note G_, 2
	note A_, 2
	note B_, 5
	note __, 1
	note G_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	octave 7
	note D_, 5
	note __, 1
	note E_, 2
	note D_, 2
	note __, 2
	note D_, 2
	note G_, 2
	note F#, 6
	note E_, 2
	note D_, 2
	octave 6
	note B_, 1
	note __, 1
	note F#, 2
	note G_, 2
	octave 7
	note D_, 6
	note C_, 2
	octave 6
	note E_, 4
	note A_, 2
	note __, 4
	call_channel Music_8a7bd
	note C_, 2
	note D_, 2
	note E_, 2
	note G_, 2
	note F#, 4
	note __, 1
	note E_, 1
	note D_, 1
	note E_, 1
	music_tempo_2 $1
	music_setrepeat1a $4
	note D_, 4
	note E_, 5
	music_dorepeat1a
	music_tempo_2 $9
	note D_, 1
	note __, 1
	note C_, 2
	octave 6
	note B_, 5
	note __, 1
	note G_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	octave 7
	note D_, 6
	note C_, 2
	octave 6
	note B_, 2
	note __, 2
	octave 7
	note D_, 2
	note G_, 2
	note A_, 8
	note __, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 5
	note __, 1
	note C_, 2
	octave 6
	note B_, 2
	note __, 2
	octave 7
	note C_, 2
	note D_, 2
	note __, 2
	call_channel Music_8a7bd
	note F#, 2
	note __, 2
	note D_, 2
	note __, 2
	note G_, 10
	note __, 2
	jump_channel Music_8a68f

MusicHeader_8a02e_Ch3: ; 8a6f4
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $8, $0
	music_noise_sample $f
	note __, 4

Music_8a700: ; 8a700
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	octave 5
	note D_, 2
	note A_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	note G_, 2
	octave 5
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 2
	octave 4
	note B_, 2
	note G_, 2
	note A_, 2
	octave 5
	note E_, 2
	note G_, 2
	note E_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	note C_, 2
	note G_, 2
	note E_, 2
	note C_, 2
	octave 4
	note A_, 2
	note G_, 2
	octave 5
	note G_, 2
	note F#, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note C_, 2
	octave 4
	note B_, 2
	note A_, 2
	octave 5
	note E_, 2
	note A_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note F#, 2
	note E_, 2
	note D_, 4
	note C_, 4
	octave 4
	note B_, 4
	note A_, 4
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	note E_, 2
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note G_, 2
	note E_, 2
	note C_, 2
	octave 4
	note B_, 2
	octave 5
	note A_, 2
	note F#, 2
	note D_, 2
	note C_, 2
	note G_, 2
	note A_, 2
	note B_, 2
	note C#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 4
	note D_, 2
	note A_, 2
	octave 5
	note D_, 2
	note F#, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note A_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	note C_, 2
	note D_, 2
	octave 4
	note A_, 2
	note F#, 2
	note A_, 2
	note G_, 2
	octave 5
	note G_, 2
	note F#, 2
	note D_, 2
	octave 4
	note E_, 2
	octave 5
	note G#, 2
	note E_, 2
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note E_, 2
	note A_, 2
	note D_, 2
	note F#, 2
	music_fb $0, $0, $2, $0
	note A_, 1
	note B_, 1
	octave 6
	note C_, 1
	note D_, 1
	music_fb $0, $0, $8, $0
	octave 5
	note G_, 4
	note D_, 4
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note D_, 2
	jump_channel Music_8a700

	octave 6
	note B_, 4
	note F#, 4
	note B_, 5
	octave 7
	note C#, 1
	note D_, 3
	note C#, 1
	note D_, 3
	octave 6
	note B_, 1
	octave 7
	note F#, 6
	note D_, 2
	ret_channel

Music_8a7bd: ; 8a7bd
	note E_, 2
	note D#, 2
	note E_, 2
	octave 7
	note C_, 2
	octave 6
	note B_, 2
	note A_, 2
	note G_, 2
	note B_, 4
	note __, 2
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	note __, 2
	note E_, 2
	note D#, 2
	note E_, 2
	ret_channel

MusicHeader_8a02e_Ch6: ; 8a7da
	music_tempo_2 $9
	note __, 4

Music_8a7dd: ; 8a7dd
	music_setrepeat1a $7
	note C_, 4
	note D#, 2
	note C#, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note C_, 2
	music_dorepeat1a
	note C_, 2
	note D#, 2
	note E_, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note C_, 2
	jump_channel Music_8a7dd

MusicHeader_8a038_Ch1: ; 8a7f2
	music_tempo_2 $7
	music_fa $34

Music_8a7f6: ; 8a7f6
	note __, 2
	call_channel Music_8aaba
	music_fa $37
	note A_, 2
	note __, 2
	music_f9 $e, 5, 5
	octave 5
	note B_, 7
	note __, 1
	note A_, 3
	note __, 1
	note G#, 3
	note __, 1
	octave 6
	music_reset_var22_flag6_and_setenvreset $3
	note E_, 1
	note F_, 1
	music_reset_var22_flag6_and_setenvreset $4
	note E_, 1
	note F_, 1
	music_reset_var22_flag6_and_setenvreset $5
	note E_, 1
	note F_, 1
	music_reset_var22_flag6_and_setenvreset $6
	note E_, 1
	note F_, 1
	note __, 2
	music_reset_var22_flag6_and_setenvreset $4
	call_channel Music_8aacf
	music_set_var22_flag6_and_setenvreset $7
	note A#, 2
	note __, 2
	octave 6
	note D_, 7
	note __, 1
	note C_, 3
	note __, 1
	octave 5
	note B_, 3
	note __, 1
	octave 6
	music_reset_var22_flag6_and_setenvreset $3
	note G_, 1
	note G#, 1
	music_reset_var22_flag6_and_setenvreset $4
	note G_, 1
	note G#, 1
	music_reset_var22_flag6_and_setenvreset $5
	note G_, 1
	note G#, 1
	music_reset_var22_flag6_and_setenvreset $6
	note G_, 1
	note G#, 1
	call_channel Music_8aadd
	note __, 1
	music_set_var22_flag6_and_setenvreset $7
	octave 5
	note A_, 1
	octave 6
	note C#, 1
	note F_, 1
	call_channel Music_8aadd
	music_set_var22_flag6_and_setenvreset $7
	note E_, 1
	note B_, 1
	octave 7
	note D_, 1
	note __, 1
	music_e8 $0
	note __, 2
	music_e8 $14
	music_reset_var22_flag6_and_setenvreset $5
	octave 6
	music_setrepeat1a $3
	note C#, 1
	note D_, 1
	music_dorepeat1a
	note C#, 1
	note C_, 1
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	note __, 2
	music_setrepeat1a $3
	note C#, 1
	note D_, 1
	music_dorepeat1a
	note E_, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note F_, 1
	note E_, 1
	note D_, 1
	octave 4
	note B_, 2
	note __, 2
	note A_, 2
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note A_, 1
	octave 5
	note F_, 1
	note __, 1
	note G#, 2
	note B_, 1
	note __, 1
	octave 6
	note D_, 2
	note __, 2
	note C_, 2
	note D_, 1
	note __, 1
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	octave 5
	note B_, 1
	note A_, 1
	note G#, 1
	note G_, 1
	note F#, 6
	note G#, 1
	note A_, 1
	note A#, 2
	octave 6
	note D_, 2
	note C#, 2
	note C_, 2
	octave 5
	note B_, 4
	note A_, 1
	note G_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note D#, 1
	music_set_var22_flag6_and_setenvreset $7
	note E_, 2
	note D_, 2
	note C#, 2
	octave 5
	note B_, 2
	octave 6
	music_setrepeat1a $2
	call_channel Music_8ab0f
	music_dorepeat1a
	note A#, 2
	note __, 2
	octave 5
	note A#, 4
	octave 6
	note D_, 1
	note __, 1
	note E_, 1
	note __, 1
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	octave 5
	note E_, 2
	call_channel Music_8ab0f
	note A#, 2
	note __, 2
	octave 6
	note A_, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	note C#, 1
	octave 5
	note A_, 1
	note F_, 1
	note A_, 1
	octave 6
	note C#, 1
	note F_, 1
	note A_, 1
	octave 7
	note C#, 1
	octave 6
	note A_, 1
	note F_, 1
	music_setrepeat1a $2
	note G_, 1
	note D#, 1
	octave 5
	note B_, 1
	octave 6
	note D#, 1
	octave 5
	note B_, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note B_, 1
	octave 6
	note D#, 1
	note G_, 1
	note B_, 1
	note G_, 1
	note D#, 1
	music_dorepeat1a
	note F_, 1
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	note C#, 1
	octave 5
	note A_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note A_, 1
	octave 6
	note C#, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note C#, 1
	music_reset_var22_flag6_and_setenvreset $4
	jump_channel Music_8a7f6

MusicHeader_8a038_Ch2: ; 8a913
	music_fa $76

Music_8a915: ; 8a915
	call_channel Music_8aaba
	music_fa $78
	note A_, 1
	note __, 1
	music_f9 $e, 5, 5
	octave 6
	note C_, 12
	octave 5
	note B_, 2
	octave 6
	music_reset_var22_flag6_and_setenvreset $4
	call_channel Music_8aa83
	music_reset_var22_flag6_and_setenvreset $5
	call_channel Music_8aa83
	music_reset_var22_flag6_and_setenvreset $6
	call_channel Music_8aa83
	music_reset_var22_flag6_and_setenvreset $7
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	music_reset_var22_flag6_and_setenvreset $6
	call_channel Music_8aacf
	music_set_var22_flag6_and_setenvreset $8
	note A#, 1
	note __, 1
	octave 6
	note D#, 12
	note D_, 2
	music_reset_var22_flag6_and_setenvreset $4
	octave 7
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $5
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $6
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $7
	note D_, 1
	note D#, 1
	call_channel Music_8aa8b
	music_set_var22_flag6_and_setenvreset $8
	note __, 1
	note D#, 1
	note G_, 1
	note B_, 1
	call_channel Music_8aa8b
	music_set_var22_flag6_and_setenvreset $8
	note B_, 1
	octave 7
	note D_, 1
	note E_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 2
	note __, 2
	note A_, 2
	note __, 2
	note G_, 2
	note E_, 2
	note D_, 2
	note C#, 6
	note C_, 6
	octave 5
	note B_, 2
	note A_, 2
	note G#, 5
	note __, 1
	note A_, 1
	octave 6
	note D_, 1
	note A_, 1
	note B_, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 2
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 2
	note F#, 2
	note G#, 1
	note F#, 1
	note __, 2
	note B_, 2
	octave 7
	note C#, 2
	octave 6
	note B_, 2
	octave 7
	note D_, 4
	note C#, 2
	note C_, 2
	note __, 2
	octave 6
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 1
	note __, 1
	note G#, 1
	note A_, 1
	note __, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 1
	octave 7
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 1
	note C_, 1
	octave 6
	note B_, 1
	note A_, 2
	note G_, 2
	note F#, 2
	note E_, 2
	octave 7
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $14
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $14
	note D_, 2
	note __, 2
	octave 6
	note E_, 2
	note D_, 2
	note E_, 2
	note G_, 2
	octave 7
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $14
	note E_, 2
	note __, 2
	note F_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $14
	note D_, 4
	note E_, 14
	note D#, 1
	note E_, 1
	note D#, 16
	note E_, 14
	note D#, 1
	note E_, 1
	note G_, 16
	music_reset_var22_flag6_and_setenvreset $6
	jump_channel Music_8a915

MusicHeader_8a038_Ch3: ; 8a9f2
	music_tempo_2 $7
	music_noise_sample $f
	music_fa $3
	music_fb $0, $0, $2, $11

Music_8a9fd: ; 8a9fd
	call_channel Music_8ab1a
	note E_, 2
	call_channel Music_8ab1a
	note A_, 2
	music_setrepeat1a $2
	note A#, 1
	note __, 1
	note A#, 2
	note A_, 2
	note A#, 2
	note __, 2
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	note B_, 1
	note __, 1
	note B_, 2
	note A#, 2
	note B_, 2
	note __, 2
	note B_, 2
	octave 5
	note E_, 2
	octave 4
	note B_, 2
	music_dorepeat1a
	music_setrepeat1a $2
	note A_, 1
	note __, 1
	note A_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note G_, 2
	note A_, 2
	note G_, 2
	music_dorepeat1a
	note E_, 1
	note __, 1
	note E_, 2
	note D_, 2
	note E_, 2
	note __, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note A#, 1
	note __, 1
	note A#, 2
	note G#, 2
	octave 5
	note E_, 2
	note __, 2
	octave 4
	note A_, 2
	note B_, 2
	octave 5
	note C_, 2
	note D_, 1
	note __, 1
	note D_, 2
	note C_, 2
	note D_, 1
	note __, 1
	note G#, 1
	note A_, 1
	octave 4
	note G_, 2
	note F#, 2
	note F_, 2
	note E_, 1
	note __, 1
	note E_, 2
	note D_, 2
	note E_, 2
	octave 5
	note D_, 1
	note E_, 1
	octave 4
	note E_, 4
	note D_, 2
	call_channel Music_8ab27
	octave 6
	note F_, 2
	octave 5
	note D#, 1
	note E_, 1
	octave 4
	note B_, 2
	octave 6
	note F_, 2
	octave 4
	note G_, 2
	call_channel Music_8ab27
	octave 6
	note G_, 2
	octave 4
	note G_, 2
	note G_, 2
	octave 6
	note F_, 2
	octave 4
	note G_, 2
	music_setrepeat1a $8
	note F_, 2
	music_dorepeat1a
	music_setrepeat1a $8
	note G#, 2
	music_dorepeat1a
	music_setrepeat1a $8
	note B_, 2
	music_dorepeat1a
	music_setrepeat1a $8
	note D_, 2
	music_dorepeat1a
	jump_channel Music_8a9fd

Music_8aa83: ; 8aa83
	music_setrepeat1a $2
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	music_dorepeat1a
	ret_channel

Music_8aa8b: ; 8aa8b
	music_set_var22_flag6_and_setenvreset $8
	octave 7
	note D#, 1
	octave 6
	note A#, 1
	note G_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $4
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $5
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $6
	note G#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $7
	note G#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $6
	note A#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $5
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	music_reset_var22_flag6_and_setenvreset $4
	note A#, 1
	note A_, 1
	note A#, 1
	note A_, 1
	ret_channel

Music_8aaba: ; 8aaba
	music_tempo_2 $3
	octave 5
	note A_, 1
	octave 6
	note E_, 1
	music_tempo_2 $4
	note A_, 1
	octave 7
	note E_, 1
	music_e8 $14
	music_tempo_2 $7
	music_fb $11, $13, $2, $11
	ret_channel

Music_8aacf: ; 8aacf
	music_tempo_2 $3
	octave 5
	note A#, 1
	octave 6
	note F_, 1
	music_tempo_2 $4
	note A#, 1
	octave 7
	note F_, 1
	music_tempo_2 $7
	ret_channel

Music_8aadd: ; 8aadd
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note G#, 1
	note F_, 1
	note C#, 1
	octave 5
	note A_, 1
	octave 6
	music_reset_var22_flag6_and_setenvreset $3
	note D_, 1
	note D#, 1
	note D_, 1
	music_reset_var22_flag6_and_setenvreset $4
	note D#, 1
	note D_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $5
	note D_, 1
	note D#, 1
	note D_, 1
	music_reset_var22_flag6_and_setenvreset $6
	note D#, 1
	note D_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $7
	note E_, 1
	note D#, 1
	note E_, 1
	music_reset_var22_flag6_and_setenvreset $6
	note D#, 1
	note E_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $5
	note E_, 1
	note D#, 1
	note E_, 1
	music_reset_var22_flag6_and_setenvreset $4
	note D#, 1
	note E_, 1
	note D#, 1
	ret_channel

Music_8ab0f: ; 8ab0f
	octave 6
	note A#, 2
	note __, 2
	note A#, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $14
	ret_channel

Music_8ab1a: ; 8ab1a
	octave 4
	note A_, 1
	note __, 1
	note A_, 2
	note G_, 2
	note A_, 2
	note __, 8
	note E_, 2
	note __, 8
	note E_, 1
	note __, 1
	note G_, 2
	ret_channel

Music_8ab27: ; 8ab27
	note A_, 1
	note __, 1
	note A_, 2
	note G_, 2
	note A_, 2
	octave 6
	note F_, 2
	octave 4
	note A_, 1
	note __, 1
	octave 6
	note F_, 2
	octave 4
	note G_, 2
	note A_, 1
	note __, 1
	octave 6
	note F_, 2
	octave 4
	note G_, 2
	ret_channel

Music_8ab3c: ; 8ab3c
	note C_, 2
	note D_, 2
	note G#, 2
	note C_, 2
	note D_, 1
	note C#, 1
	note C_, 2
	note G#, 2
	note D_, 2
	ret_channel

MusicHeader_8a038_Ch6: ; 8ab46
	music_tempo_2 $7

Music_8ab48: ; 8ab48
	music_setrepeat1a $e
	call_channel Music_8ab3c
	music_dorepeat1a
	music_setrepeat1a $2
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note C#, 2
	music_dorepeat1a
	music_setrepeat1a $3
	call_channel Music_8ab3c
	music_dorepeat1a
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note G#, 1
	note G#, 1
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	jump_channel Music_8ab48

MusicHeader_8a042_Ch1: ; 8ab74
	music_tempo_2 $9
	music_fa $78
	music_e8 $1b
	music_f9 $15, 4, 3
	music_fb $11, $11, $3, $31

Music_8ab82: ; 8ab82
	call_channel Music_8ae5a
	note D#, 1
	note __, 2
	note C#, 1
	note D#, 1
	note F#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	octave 5
	note A#, 3
	octave 6
	music_setrepeat1a $6
	note F_, 1
	note G#, 1
	music_dorepeat1a
	call_channel Music_8ae5a
	octave 5
	note D#, 2
	note F#, 1
	octave 6
	note C#, 2
	note C_, 1
	note __, 2
	octave 5
	note B_, 3
	note A#, 1
	note __, 3
	octave 4
	note A#, 3
	music_tempo_2 $1
	octave 5
	music_setrepeat1a $3
	note C#, 7
	note C_, 7
	music_dorepeat1a
	octave 4
	note B_, 6
	note A#, 6
	music_tempo_2 $9
	octave 6
	note A#, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note B_, 3
	note A#, 1
	note __, 2
	octave 7
	note F#, 3
	note F_, 1
	note __, 2
	note F#, 3
	octave 6
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 2
	note __, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note A_, 2
	note F#, 1
	note F_, 2
	note D#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F#, 1
	note F_, 3
	octave 6
	note A#, 1
	octave 7
	note A#, 1
	octave 6
	note A#, 1
	note G#, 3
	note F#, 1
	note __, 2
	note A#, 3
	note F_, 1
	note __, 2
	note B_, 3
	note F#, 1
	note __, 2
	octave 7
	note C#, 3
	octave 6
	note F#, 1
	note __, 2
	octave 5
	note A#, 1
	note A#, 1
	note A#, 1
	note B_, 1
	note __, 1
	note B_, 1
	octave 6
	note C#, 3
	octave 5
	note B_, 1
	octave 6
	note C#, 1
	octave 5
	note B_, 1
	octave 6
	note A#, 1
	note __, 2
	octave 7
	note F_, 1
	note __, 2
	octave 6
	note F_, 1
	note __, 5
	note __, 3
	octave 8
	note D#, 1
	note __, 1
	music_tempo_2 $1
	note D#, 5
	note D_, 4
	music_tempo_2 $9
	note C#, 2
	note C_, 1
	octave 7
	note B_, 2
	note A#, 1
	note __, 2
	music_f9 $0, 3, 6
	note B_, 1
	note F_, 3
	note __, 2
	music_tempo_2 $1
	note F_, 5
	octave 6
	note A_, 4
	music_tempo_2 $9
	octave 7
	note F_, 3
	music_f9 $15, 4, 3
	octave 5
	music_setrepeat1a $2
	note F_, 1
	note F#, 1
	note F_, 1
	note G_, 1
	note F#, 1
	note F_, 1
	music_dorepeat1a
	music_f9 $0, 3, 6
	note __, 2
	octave 7
	note G#, 1
	note D_, 3
	note __, 2
	music_tempo_2 $1
	octave 8
	note D_, 5
	octave 7
	note F_, 4
	music_tempo_2 $9
	octave 8
	note D_, 3
	music_tempo_2 $1
	music_f9 $15, 4, 3
	octave 6
	music_setrepeat1a $2
	note A#, 4
	note __, 5
	note A#, 4
	note A_, 5
	note A#, 4
	note __, 5
	music_dorepeat1a
	music_tempo_2 $9
	note A#, 1
	note B_, 1
	octave 7
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note B_, 1
	jump_channel Music_8ab82

MusicHeader_8a042_Ch2: ; 8ac5b
	music_tempo_2 $9
	music_fa $b9
	music_e8 $1b
	music_f9 $15, 4, 3

Music_8ac64: ; 8ac64
	music_fb $11, $11, $3, $31
	call_channel Music_8ae18
	note A#, 1
	note __, 2
	octave 7
	note C#, 2
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note A#, 1
	note F#, 2
	note G#, 1
	music_setrepeat1a $6
	octave 6
	note A#, 1
	octave 7
	note C#, 1
	music_dorepeat1a
	call_channel Music_8ae18
	octave 7
	note C#, 1
	note __, 1
	note C_, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 1
	note __, 2
	note G#, 1
	note A_, 2
	note A#, 1
	music_tempo_2 $1
	note D#, 9
	note __, 9
	music_setrepeat1a $4
	note C#, 4
	note D#, 5
	music_dorepeat1a
	music_fa $b5
	music_setrepeat1a $3
	note C#, 4
	note D#, 5
	music_dorepeat1a
	music_fa $b9
	music_setrepeat1a $3
	note C#, 4
	note D#, 5
	music_dorepeat1a
	music_tempo_2 $9
	octave 7
	note D#, 1
	note __, 1
	note D_, 1
	note D#, 1
	note __, 1
	note F_, 1
	note F#, 1
	note __, 1
	note F_, 1
	note F#, 1
	note __, 1
	note G#, 1
	note B_, 3
	note A#, 1
	note __, 2
	note B_, 3
	note A#, 1
	note __, 2
	note B_, 1
	note __, 1
	note A#, 1
	note G#, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note __, 1
	octave 6
	note B_, 1
	note A#, 1
	note B_, 1
	octave 7
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note B_, 1
	note A#, 3
	note __, 3
	note B_, 3
	note A#, 1
	note __, 2
	octave 7
	note D_, 3
	octave 6
	note A#, 1
	note __, 2
	octave 7
	note D#, 3
	octave 6
	note A#, 1
	note __, 2
	octave 7
	note E_, 3
	octave 6
	note A#, 1
	note __, 2
	octave 7
	music_setrepeat1a $2
	note F_, 1
	note G#, 1
	note F_, 1
	note G#, 1
	note F_, 1
	note F#, 1
	music_dorepeat1a
	note F_, 1
	note __, 2
	note A#, 1
	note __, 2
	octave 6
	note A#, 1
	note __, 2
	music_e8 $0
	note __, 3
	music_e8 $1b
	octave 7
	note D#, 1
	note __, 1
	note D_, 1
	note C#, 1
	note __, 1
	note C_, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 1
	note A_, 2
	note A#, 1
	call_channel Music_8ae2e
	octave 8
	note C_, 1
	octave 7
	note F#, 3
	call_channel Music_8ae2e
	octave 8
	music_tempo_2 $1
	note F#, 5
	octave 7
	note A_, 4
	music_tempo_2 $9
	note F#, 3
	music_f9 $15, 4, 3
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note B_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note G#, 1
	note __, 1
	note G_, 1
	note F#, 2
	note G_, 1
	call_channel Music_8ae38
	octave 7
	note A_, 1
	note D#, 3
	call_channel Music_8ae38
	music_tempo_2 $1
	octave 8
	note D#, 5
	octave 7
	note F#, 4
	music_tempo_2 $9
	octave 8
	note D#, 3
	music_f9 $15, 4, 3
	music_fb $11, $11, $6, $11
	octave 7
	note F#, 1
	note F_, 1
	note F#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	music_fb $11, $11, $3, $31
	note A#, 3
	music_fb $11, $11, $6, $11
	octave 8
	note A#, 1
	octave 7
	note A#, 1
	octave 8
	note A#, 1
	jump_channel Music_8ac64

MusicHeader_8a042_Ch3: ; 8ad5e
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $2, $0
	music_noise_sample $f

Music_8ad69: ; 8ad69
	call_channel Music_8ae42
	note D#, 1
	note __, 5
	note F#, 1
	note __, 5
	note G#, 2
	note A#, 1
	octave 5
	note C#, 2
	octave 4
	note A#, 1
	note __, 2
	note A#, 3
	note C#, 1
	call_channel Music_8ae42
	octave 4
	note D#, 1
	note __, 2
	note A_, 2
	note A#, 1
	note __, 2
	octave 5
	note C#, 3
	octave 4
	note A#, 1
	note D#, 1
	note __, 11
	octave 5
	note D#, 3
	note F#, 1
	note __, 1
	note D#, 1
	note C#, 3
	note F#, 1
	note __, 1
	note C#, 1
	octave 4
	note B_, 3
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note B_, 1
	note A#, 3
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note A#, 1
	note G#, 3
	octave 5
	note D#, 1
	note G#, 1
	octave 4
	note G#, 1
	note A_, 3
	octave 5
	note E_, 1
	note A_, 1
	octave 4
	note A_, 1
	note A#, 1
	note __, 1
	note A#, 1
	octave 5
	note D_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note __, 1
	note D_, 1
	note D#, 2
	note D_, 1
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note A#, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1
	octave 5
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 1
	note C_, 1
	note C_, 1
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	octave 4
	note A#, 1
	note __, 1
	note A#, 1
	octave 5
	note D_, 1
	note D#, 1
	note F_, 1
	octave 4
	note A#, 1
	note __, 5
	octave 5
	note D#, 1
	note __, 1
	note E_, 1
	note F_, 1
	note __, 1
	note F#, 1
	note G_, 1
	note __, 1
	note F#, 1
	note F_, 1
	note __, 1
	note E_, 1
	note D#, 1
	note __, 5
	note D#, 1
	note __, 5
	note C_, 1
	note __, 1
	note C#, 1
	note D_, 1
	note __, 1
	note D#, 1
	note E_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note __, 1
	note C#, 1
	note C_, 1
	note __, 5
	note C_, 1
	note __, 5
	octave 4
	note A#, 1
	note A_, 1
	note A#, 1
	note B_, 2
	note B_, 1
	note A#, 2
	octave 5
	note F_, 1
	octave 4
	note A#, 3
	jump_channel Music_8ad69

Music_8ae18: ; 8ae18
	octave 5
	note A#, 1
	octave 6
	note C#, 1
	octave 5
	note A#, 1
	octave 6
	note A#, 1
	note __, 2
	note A_, 2
	note A#, 1
	note __, 2
	note A_, 1
	note D#, 1
	note E_, 1
	note F_, 1
	note F#, 2
	note D#, 1
	note __, 2
	note A#, 3
	note A_, 1
	ret_channel

Music_8ae2e: ; 8ae2e
	music_f9 $15, 4, 3
	octave 5
	note A#, 1
	note __, 1
	music_f9 $0, 3, 6
	ret_channel

Music_8ae38: ; 8ae38
	music_f9 $15, 4, 3
	octave 5
	note G_, 1
	note __, 1
	music_f9 $0, 3, 6
	ret_channel

Music_8ae42: ; 8ae42
	octave 4
	note D#, 1
	note __, 5
	note F#, 1
	note __, 5
	note G#, 1
	note __, 4
	note A_, 1
	note __, 2
	note A#, 3
	note C#, 1
	ret_channel

Music_8ae4e: ; 8ae4e
	music_setrepeat1a $3
	note D_, 2
	note C#, 1
	note D#, 3
	music_dorepeat1a
	note D_, 2
	note C#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	ret_channel

Music_8ae5a: ; 8ae5a
	note __, 3
	octave 6
	note F#, 1
	note __, 2
	note F_, 2
	note F#, 1
	note __, 2
	note F#, 1
	note __, 3
	note C#, 1
	note D#, 1
	note __, 3
	note D#, 3
	note __, 1
	ret_channel

MusicHeader_8a042_Ch6: ; 8ae69
	music_tempo_2 $9

Music_8ae6b: ; 8ae6b
	music_setrepeat1d $3
	call_channel Music_8ae4e
	music_dorepeat1d
	note D_, 2
	note C#, 1
	note D#, 3
	note D_, 2
	note C#, 1
	note D#, 3
	note __, 12
	music_setrepeat1d $6
	call_channel Music_8ae4e
	music_dorepeat1d
	note D_, 2
	note C#, 1
	note D#, 3
	note D_, 2
	note C#, 1
	note D#, 1
	note C#, 1
	note D#, 1
	jump_channel Music_8ae6b

MusicHeader_8a060_Ch1: ; 8ae89
	music_tempo_2 $4
	music_fa $b7
	music_fb $11, $11, $1, $11
	note __, 2
	music_e8 $6
	octave 4
	note D_, 1
	note F#, 1
	note A_, 1
	octave 5
	note C#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 6
	note C#, 1
	note F#, 1
	note A_, 1
	octave 7
	note C#, 1
	music_fb $0, $0, $0, $0
	music_fa $b5
	octave 5
	note D_, 1
	note F#, 1
	note A_, 1
	octave 6
	note C#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 7
	note C#, 1
	note F#, 1
	note A_, 1
	note __, 1
	music_e8 $0
	note __, 12
	note __, 6
	music_tempo_2 $f
	music_fa $b8
	music_fb $0, $12, $7, $51
	music_f9 $13, 4, 3

Music_8aec9: ; 8aec9
	note __, 2
	music_e8 $18
	octave 6
	note D_, 4
	note A_, 6
	octave 7
	note C_, 4
	octave 6
	note A_, 4
	note D_, 4
	note A#, 8
	note G_, 4
	note F_, 8
	note G#, 4
	note A#, 12
	note B_, 8
	note G#, 4
	note __, 2
	octave 5
	note F#, 2
	note G_, 4
	note __, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 6
	note C#, 3
	note __, 1
	note D_, 2
	note E_, 4
	note __, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 10
	note __, 2
	note A#, 10
	note __, 2
	note B_, 10
	note __, 2
	jump_channel Music_8aec9

MusicHeader_8a060_Ch2: ; 8aef8
	music_tempo_2 $2
	music_fa $b9
	music_fb $11, $11, $1, $11
	music_e8 $6
	octave 5
	note D_, 2
	note F#, 2
	note A_, 2
	octave 6
	note C#, 2
	note D_, 2
	note F#, 2
	note A_, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 7
	note C#, 2
	note D_, 2
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	music_fb $0, $0, $0, $0
	music_fa $b3
	octave 7
	note D_, 2
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	music_fa $b2
	octave 7
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	note E_, 2
	music_fa $b2
	octave 7
	note D_, 2
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	music_fa $b1
	octave 7
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	note E_, 2
	music_fa $b1
	octave 7
	note D_, 2
	note F#, 2
	note A_, 2
	octave 8
	note C#, 2
	music_e8 $0
	note __, 14
	music_tempo_2 $f
	music_fa $ba
	music_fb $0, $12, $7, $51
	music_f9 $13, 4, 3

Music_8af52: ; 8af52
	note __, 4
	music_e8 $18
	octave 6
	note F#, 4
	octave 7
	note D_, 2
	note C_, 2
	octave 7
	note G_, 8
	note __, 4
	note D_, 4
	music_tempo_2 $1
	octave 8
	note A#, 8
	note __, 7
	note G_, 8
	note __, 7
	note G_, 8
	note __, 7
	note D_, 8
	note __, 7
	note D_, 8
	note __, 7
	octave 7
	note A#, 8
	note __, 7
	note A#, 8
	note __, 7
	note G_, 8
	note __, 7
	music_tempo_2 $f
	note C_, 4
	music_tempo_2 $1
	octave 8
	note G#, 8
	note __, 7
	note F_, 8
	note __, 7
	note F_, 8
	note __, 7
	note C_, 8
	note __, 7
	note C_, 8
	note __, 7
	octave 7
	note G#, 8
	note __, 7
	note G#, 8
	note __, 7
	note F_, 8
	note __, 7
	music_tempo_2 $f
	note D_, 4
	music_tempo_2 $1
	octave 8
	note A#, 8
	note __, 7
	note G_, 8
	note __, 7
	note G_, 8
	note __, 7
	note D_, 8
	note __, 7
	note D_, 8
	note __, 7
	octave 7
	note A#, 8
	note __, 7
	note A#, 8
	note __, 7
	note G_, 8
	note __, 7
	music_tempo_2 $f
	note D#, 4
	music_tempo_2 $1
	octave 8
	note B_, 8
	note __, 7
	note G#, 8
	note __, 7
	note G#, 8
	note __, 7
	note D#, 8
	note __, 7
	note D#, 8
	note __, 7
	octave 7
	note B_, 8
	note __, 7
	note B_, 8
	note __, 7
	note G#, 8
	note __, 7
	music_tempo_2 $f
	note __, 2
	octave 5
	note A_, 2
	note B_, 4
	note __, 2
	note A_, 2
	note B_, 2
	octave 6
	note C_, 2
	note D_, 2
	note E_, 3
	note __, 1
	note F#, 2
	note G_, 4
	note __, 2
	note F#, 2
	note G_, 2
	note A_, 2
	note B_, 2
	octave 7
	note C#, 2
	call_channel Music_8b05c
	note C#, 4
	music_tempo_2 $1
	octave 8
	note F#, 8
	note __, 7
	note C#, 8
	note __, 7
	octave 7
	note A#, 8
	note __, 7
	octave 8
	note C#, 8
	note __, 7
	octave 7
	note F#, 8
	note __, 7
	note A#, 8
	note __, 7
	note C#, 8
	note __, 7
	note F#, 8
	note __, 7
	call_channel Music_8b05c
	music_tempo_2 $f
	jump_channel Music_8af52

MusicHeader_8a060_Ch3: ; 8aff0
	music_tempo_2 $4
	music_fa $3
	music_fb $0, $0, $0, $0
	music_noise_sample $f
	octave 4
	note D_, 1
	note F#, 1
	note A_, 1
	octave 5
	note C#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 6
	note C#, 1
	octave 5
	note D_, 1
	note F#, 1
	note A_, 1
	octave 6
	note C#, 1
	note D_, 1
	note F#, 1
	note A_, 1
	octave 7
	note C#, 1
	note __, 8
	note __, 12
	note __, 6
	music_tempo_2 $f

Music_8b016: ; 8b016
	music_f9 $13, 4, 7
	music_fb $0, $0, $0, $0
	octave 4
	note A_, 12
	note A_, 12
	music_fb $0, $0, $4, $0
	octave 6
	note D#, 4
	octave 5
	note A#, 2
	note G_, 2
	note D_, 4
	octave 6
	note C#, 4
	octave 5
	note G#, 2
	note F_, 2
	note C_, 4
	octave 6
	note D#, 4
	octave 5
	note A#, 2
	note G_, 2
	note D_, 4
	octave 6
	note E_, 4
	octave 5
	note B_, 2
	note G#, 2
	note D#, 4
	note __, 2
	note D_, 2
	note E_, 4
	note __, 2
	note D_, 2
	note E_, 2
	note F#, 2
	note G_, 2
	note A_, 3
	note __, 1
	note B_, 2
	octave 6
	note C_, 4
	note __, 2
	octave 5
	note B_, 2
	octave 6
	note C_, 2
	note D_, 2
	note E_, 2
	note F#, 2
	music_f9 $13, 4, 3
	note G_, 12
	note F#, 12
	note G_, 12
	jump_channel Music_8b016

Music_8b05c: ; 8b05c
	music_tempo_2 $f
	octave 7
	note D_, 4
	music_tempo_2 $1
	octave 8
	note G_, 8
	note __, 7
	note D_, 8
	note __, 7
	octave 7
	note B_, 8
	note __, 7
	octave 8
	note D_, 8
	note __, 7
	octave 7
	note G_, 8
	note __, 7
	note B_, 8
	note __, 7
	note D_, 8
	note __, 7
	note G_, 8
	note __, 7
	music_tempo_2 $f
	ret_channel

MusicHeader_8a060_Ch6: ; 8b079
	music_tempo_2 $7
	note __, 16
	note __, 8
	music_tempo_2 $f

Music_8b07f: ; 8b07f
	note E_, 2
	note C#, 8
	note C#, 2
	note E_, 4
	note E_, 2
	note C#, 4
	note C#, 2
	music_setrepeat1a $4
	note E_, 4
	note D_, 2
	note C#, 2
	note E_, 4
	music_dorepeat1a
	note D_, 4
	note E_, 2
	note C#, 2
	note D_, 4
	note E_, 4
	note D_, 4
	note E_, 4
	note D_, 2
	note C#, 2
	note E_, 6
	note C#, 2
	note E_, 4
	note E_, 4
	note D_, 2
	note C#, 2
	note E_, 2
	note C#, 2
	note E_, 4
	note E_, 2
	note C#, 2
	note E_, 4
	note E_, 4
	note E_, 2
	note C#, 2
	note E_, 4
	jump_channel Music_8b07f

MusicHeader_8a06a_Ch1: ; 8b0a9
	music_tempo_2 $4
	music_fa $b4
	music_fb $11, $11, $2, $21
	note __, 1
	music_e8 $c
	music_setfreqoffset $1
	music_f9 $16, 4, 3
	note __, 2
	call_channel Music_8b1c6
	note B_, 3
	music_fa $b3
	call_channel Music_8b1dd
	music_fa $b5
	call_channel Music_8b1dd
	music_fa $b7
	call_channel Music_8b1dd
	music_tempo_2 $9
	music_fb $11, $12, $a, $11
	music_e8 $1b

Music_8b0d7: ; 8b0d7
	music_setrepeat1a $2
	call_channel Music_8b1e3
	music_dorepeat1a
	octave 7
	note G#, 2
	note F#, 2
	note E_, 2
	note C_, 2
	music_setrepeat1a $5
	call_channel Music_8b1e3
	music_dorepeat1a
	octave 7
	note G#, 2
	note F#, 2
	note E_, 2
	note C_, 2
	music_setrepeat1a $3
	call_channel Music_8b1e3
	music_dorepeat1a
	octave 6
	note A_, 2
	note E_, 2
	note C#, 2
	octave 5
	note A_, 2
	octave 6
	note C#, 2
	note E_, 2
	note F#, 2
	note D#, 2
	octave 5
	note B_, 2
	note F#, 2
	note B_, 2
	octave 6
	note D#, 2
	note E_, 2
	octave 5
	note B_, 2
	note G#, 2
	note E_, 2
	note B_, 2
	note G#, 2
	octave 6
	note E_, 2
	note C#, 2
	octave 5
	note A_, 2
	note E_, 2
	octave 6
	note E_, 2
	note F#, 2
	music_setrepeat1a $2
	octave 6
	note F#, 2
	note D#, 2
	octave 5
	note B_, 2
	note F#, 2
	octave 6
	note D#, 2
	octave 5
	note B_, 2
	music_dorepeat1a
	jump_channel Music_8b0d7

MusicHeader_8a06a_Ch2: ; 8b124
	music_tempo_2 $4
	music_fa $b9
	music_fb $11, $11, $3, $31
	note __, 1
	music_e8 $c
	music_f9 $16, 4, 3
	call_channel Music_8b1c6
	note B_, 5
	music_fa $b4
	call_channel Music_8b1be
	music_fa $b6
	call_channel Music_8b1be
	music_fa $b8
	call_channel Music_8b1be
	music_tempo_2 $9
	music_fa $b9
	music_fb $11, $12, $5, $41
	music_e8 $1b

Music_8b151: ; 8b151
	music_setrepeat1a $2
	octave 6
	note G#, 7
	note __, 1
	note A_, 2
	note B_, 2
	octave 7
	note C_, 6
	note __, 2
	octave 6
	note B_, 2
	note A_, 1
	note __, 1
	note A_, 10
	note B_, 2
	note G#, 10
	note __, 2
	music_dorepeat1a
	octave 7
	note C#, 6
	note D#, 2
	note E_, 4
	note D#, 4
	octave 6
	note B_, 4
	note F#, 4
	note G#, 4
	note __, 2
	note E_, 2
	note F#, 2
	note G#, 2
	note A_, 4
	note __, 2
	note F#, 2
	note G#, 2
	note A_, 2
	music_tempo_2 $12
	note B_, 10
	note __, 2
	music_tempo_2 $9
	jump_channel Music_8b151

MusicHeader_8a06a_Ch3: ; 8b17f
	music_tempo_2 $4
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $f
	octave 5
	note C#, 8
	octave 4
	note A_, 8
	note G_, 10
	music_fa $2
	note G_, 12
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $8, $0

Music_8b19b: ; 8b19b
	music_setrepeat1d $2
	music_setrepeat1a $3
	octave 5
	note E_, 10
	octave 4
	note B_, 2
	music_dorepeat1a
	octave 5
	note E_, 8
	octave 4
	note B_, 4
	music_dorepeat1d
	note A_, 8
	octave 5
	note C#, 4
	octave 4
	note B_, 8
	octave 5
	note D#, 4
	note E_, 8
	octave 4
	note B_, 4
	note A_, 8
	note B_, 2
	octave 5
	note C#, 2
	octave 4
	note B_, 12
	octave 5
	note D#, 12
	jump_channel Music_8b19b

Music_8b1be: ; 8b1be
	music_setrepeat1a $2
	octave 7
	note B_, 1
	octave 8
	note C_, 1
	music_dorepeat1a
	ret_channel

Music_8b1c6: ; 8b1c6
	octave 6
	note G#, 1
	octave 7
	note C#, 1
	note E_, 1
	note B_, 1
	octave 8
	note E_, 4
	octave 6
	note E_, 1
	note A_, 1
	octave 7
	note C#, 1
	note G#, 1
	octave 8
	note C#, 4
	octave 6
	note D_, 1
	note G_, 1
	note B_, 1
	octave 7
	note F#, 1
	ret_channel

Music_8b1dd: ; 8b1dd
	music_setrepeat1a $2
	note G_, 1
	note A_, 1
	music_dorepeat1a
	ret_channel

Music_8b1e3: ; 8b1e3
	octave 7
	note G#, 2
	note F#, 2
	note E_, 2
	octave 6
	note B_, 2
	ret_channel

MusicHeader_8a06a_Ch6: ; 8b1ea
	music_tempo_2 $4
	note __, 16
	note __, 10
	note __, 12
	music_tempo_2 $9
	music_setrepeat1a $7

Music_8b1f3: ; 8b1f3
	note D_, 4
	note E_, 6
	note C#, 2
	note D_, 4
	note C#, 8
	music_dorepeat1a
	jump_channel Music_8b1f3

MusicHeader_8a04c_Ch1: ; 8b1fc
	music_fb $11, $11, $2, $21
	music_e8 $12
	music_f9 $15, 4, 2
	music_tempo_2 $6
	music_fa $78
	octave 6
	note D_, 2
	note E_, 1
	note F#, 1

Music_8b20e: ; 8b20e
	note B_, 2
	note __, 2
	octave 5
	note B_, 2
	octave 6
	note C_, 1
	note D_, 1
	note G_, 2
	note A_, 1
	note B_, 1
	octave 7
	note C_, 2
	octave 6
	note B_, 1
	note A_, 1
	note G_, 1
	note __, 1
	note D_, 2
	note C_, 2
	octave 5
	note B_, 2
	octave 6
	note D_, 1
	note __, 1
	note A_, 1
	note B_, 1
	octave 7
	note C_, 2
	octave 6
	note B_, 1
	note A_, 1
	note G_, 1
	note D_, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note B_, 1
	note G_, 1
	note D_, 1
	note G_, 1
	octave 7
	note D_, 1
	octave 6
	note B_, 1
	note G_, 1
	note B_, 1
	octave 7
	note G_, 1
	note D_, 1
	octave 6
	note B_, 1
	note G_, 1
	octave 7
	note A_, 2
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 2
	note C_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note B_, 4
	note G_, 2
	note B_, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 2
	note A_, 1
	note __, 1
	note G_, 2
	note F#, 1
	note __, 1
	note A_, 4
	note E_, 4
	octave 7
	note C#, 2
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G#, 2
	note __, 2
	note A_, 2
	note __, 2
	octave 6
	note B_, 2
	octave 7
	note C_, 1
	note __, 1
	note C#, 2
	note D_, 1
	note __, 1
	octave 6
	note B_, 4
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note G_, 1
	note B_, 1
	music_setrepeat1a $2
	note A_, 1
	note A#, 1
	note A_, 1
	note F_, 1
	note C_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note E_, 2
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note D_, 1
	octave 6
	note B_, 1
	note G_, 1
	note __, 1
	octave 5
	note B_, 2
	octave 6
	note C_, 2
	note C#, 1
	note __, 1
	note D_, 4
	music_setrepeat1a $2
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note F_, 2
	note E_, 1
	note D_, 1
	note G_, 2
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 5
	note B_, 2
	octave 6
	note C_, 1
	note __, 1
	note C#, 2
	note D_, 2
	octave 7
	note C_, 2
	octave 6
	note B_, 2
	octave 7
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note A_, 2
	note G_, 2
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 6
	note A_, 4
	note __, 2
	note A_, 1
	note G_, 1
	note F#, 4
	octave 7
	note C_, 4
	octave 6
	note B_, 2
	octave 7
	note C_, 1
	octave 6
	note B_, 1
	note A_, 2
	note B_, 1
	note A_, 1
	note G_, 1
	note __, 1
	note B_, 2
	octave 7
	note C_, 2
	note D_, 2
	music_setrepeat1a $2
	octave 7
	note G_, 1
	note D_, 1
	note C_, 1
	octave 6
	note G_, 1
	music_dorepeat1a
	octave 7
	note F#, 1
	note D_, 1
	octave 6
	note A_, 1
	note F#, 1
	note D_, 2
	note E_, 1
	note F#, 1
	jump_channel Music_8b20e

MusicHeader_8a04c_Ch2: ; 8b2f7
	music_fb $11, $11, $2, $21
	music_e8 $12
	music_f9 $15, 4, 2

Music_8b301: ; 8b301
	music_tempo_2 $6
	music_fa $79
	octave 6
	note B_, 2
	octave 7
	note C_, 1
	note D_, 1
	note G_, 2
	note __, 2
	call_channel Music_8b447
	note D_, 2
	note __, 2
	call_channel Music_8b447
	octave 6
	note B_, 4
	octave 7
	note D_, 4
	note G_, 4
	note B_, 4
	octave 8
	note C_, 2
	octave 7
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 2
	note G_, 1
	note __, 1
	note A_, 4
	note G_, 4
	note __, 2
	note F#, 1
	note E_, 1
	note D_, 4
	note __, 2
	note C_, 1
	octave 6
	note B_, 1
	octave 7
	note C#, 4
	note __, 2
	note D_, 1
	note E_, 1
	note A_, 2
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	music_setrepeat1a $2
	octave 7
	note D_, 1
	note __, 1
	octave 8
	note D_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note D_, 2
	note E_, 1
	note __, 1
	note F#, 2
	note E_, 1
	note D_, 1
	note G_, 8
	note __, 2
	note G_, 2
	note A_, 2
	note G_, 2
	note F_, 2
	note E_, 1
	note __, 1
	note F_, 2
	note A_, 1
	note __, 1
	octave 8
	note C_, 4
	note __, 2
	octave 7
	note B_, 1
	note A_, 1
	music_setrepeat1a $2
	octave 7
	note B_, 1
	octave 8
	note C_, 1
	octave 7
	note B_, 1
	note G_, 1
	note D_, 1
	note __, 1
	music_fa $76
	music_dorepeat1a
	note __, 2
	music_fa $79
	note D_, 1
	note C#, 1
	note C_, 4
	note F_, 4
	note A_, 4
	octave 8
	note C_, 4
	octave 7
	note B_, 2
	octave 8
	note C_, 1
	note __, 1
	note C#, 1
	note __, 1
	note D_, 1
	note __, 1
	music_e8 $0
	note __, 6
	music_e8 $12
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note D#, 2
	note D_, 2
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 8
	note C_, 2
	octave 7
	note A#, 2
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 2
	note D_, 2
	note F#, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 8
	note D_, 2
	note C_, 2
	octave 7
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 12
	note __, 4
	octave 8
	music_tempo_2 $4
	music_fa $b7
	music_setrepeat1a $9
	note D_, 1
	note E_, 1
	music_dorepeat1a
	jump_channel Music_8b301

MusicHeader_8a04c_Ch3: ; 8b3b2
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $2, $21
	music_noise_sample $c
	note __, 4

Music_8b3be: ; 8b3be
	music_setrepeat1a $2
	octave 5
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note C_, 1
	note D_, 1
	octave 4
	note G_, 4
	music_dorepeat1a
	octave 5
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note C_, 1
	note D_, 1
	note F#, 2
	note __, 2
	note F#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note E_, 1
	note C#, 1
	octave 4
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	music_setrepeat1a $2
	octave 5
	note D_, 2
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note D_, 2
	note A_, 1
	octave 6
	note D_, 1
	music_dorepeat1a
	octave 5
	note G_, 2
	note __, 2
	note G_, 2
	note C_, 1
	note D_, 1
	octave 4
	note G_, 2
	note __, 2
	octave 5
	note G_, 2
	note D_, 2
	note F_, 2
	note __, 2
	note F_, 2
	note C_, 1
	note D_, 1
	call_channel Music_8b451
	octave 4
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 5
	note F_, 2
	note __, 2
	note F_, 2
	note C_, 1
	note D_, 1
	call_channel Music_8b451
	octave 4
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 5
	note C_, 2
	note __, 2
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note D_, 2
	note __, 2
	note D_, 2
	note __, 2
	jump_channel Music_8b3be

Music_8b447: ; 8b447
	octave 6
	note G_, 4
	note __, 2
	octave 7
	note C_, 1
	note D_, 1
	note E_, 2
	note D_, 1
	note C_, 1
	ret_channel

Music_8b451: ; 8b451
	octave 4
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note G_, 2
	octave 5
	note D_, 1
	note G_, 1
	ret_channel

Music_8b45d: ; 8b45d
	note G#, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	ret_channel

Music_8b466: ; 8b466
	note G#, 2
	note C_, 2
	note G#, 4
	note G#, 1
	note G#, 1
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	ret_channel

MusicHeader_8a04c_Ch6: ; 8b470
	music_tempo_2 $6
	note __, 4

Music_8b473: ; 8b473
	music_setrepeat1a $6
	call_channel Music_8b45d
	music_dorepeat1a
	call_channel Music_8b466
	music_setrepeat1a $7
	call_channel Music_8b45d
	music_dorepeat1a
	call_channel Music_8b466
	note G#, 1
	note G#, 1
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	jump_channel Music_8b473

MusicHeader_8a056_Ch1: ; 8b492
	music_tempo_2 $6
	music_fa $77
	music_fb $11, $13, $2, $21
	note __, 4
	music_setfreqoffset $1
	music_e8 $12

Music_8b4a0: ; 8b4a0
	music_setrepeat1a $2
	octave 5
	note G_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 5
	note G#, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	note C#, 1
	note __, 1
	music_dorepeat1a
	note C_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 6
	note D#, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	note D#, 1
	note __, 1
	music_setrepeat1a $2
	octave 5
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note G#, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note G#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note A#, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	octave 5
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	note F_, 1
	note __, 1
	music_setrepeat1a $2
	octave 4
	note A#, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	music_dorepeat1a
	jump_channel Music_8b4a0

MusicHeader_8a056_Ch2: ; 8b524
	music_tempo_2 $6
	music_fa $79
	music_fb $11, $13, $3, $31
	music_e8 $c
	music_f9 $13, 4, 3

Music_8b532: ; 8b532
	octave 6
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 2
	note __, 2
	octave 7
	note D#, 4
	note __, 2
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	note C#, 2
	note C_, 1
	note __, 1
	octave 6
	note A#, 4
	note __, 2
	octave 6
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note D_, 1
	note D#, 1
	octave 6
	note A#, 2
	octave 7
	note D_, 1
	note D#, 1
	octave 6
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 4
	note __, 2
	note G_, 1
	note G#, 1
	note A#, 2
	note F_, 1
	note __, 1
	octave 5
	note A#, 4
	octave 6
	note C_, 4
	note __, 2
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	note D_, 4
	note __, 2
	note C_, 1
	note D_, 1
	note D#, 4
	note __, 2
	note D_, 1
	note D#, 1
	note G_, 2
	note __, 2
	note F_, 2
	note G_, 1
	note G#, 1
	note A#, 2
	note E_, 1
	note __, 1
	note C_, 1
	note __, 1
	note A#, 1
	note __, 1
	note G#, 2
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note F_, 1
	octave 5
	note A#, 1
	octave 6
	note A#, 1
	note D#, 6
	note __, 2
	jump_channel Music_8b532

MusicHeader_8a056_Ch3: ; 8b594
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $2, $21
	music_noise_sample $f
	note __, 4

Music_8b5a0: ; 8b5a0
	octave 4
	note D#, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G_, 2
	note G#, 1
	note A#, 1
	note D#, 2
	note __, 2
	octave 5
	note D#, 2
	note __, 2
	octave 4
	note C#, 2
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F_, 2
	note F#, 1
	note G#, 1
	note C#, 2
	note __, 2
	octave 5
	note C#, 2
	note __, 2
	octave 4
	note G#, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note F_, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note D#, 2
	note A#, 1
	note __, 1
	note D_, 2
	note A#, 1
	note __, 1
	note D#, 2
	note A#, 1
	note __, 1
	octave 5
	note A#, 2
	note __, 2
	octave 4
	note A#, 4
	note G#, 2
	note D#, 1
	note __, 1
	note G#, 2
	note __, 2
	note A#, 2
	note F_, 1
	note __, 1
	note A#, 2
	note __, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note C_, 2
	note __, 2
	octave 5
	note C#, 2
	note __, 2
	octave 4
	note C#, 2
	note __, 2
	note E_, 2
	note __, 2
	note E_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note D_, 2
	note A#, 1
	note __, 1
	note D#, 2
	note A#, 1
	octave 5
	note D#, 1
	octave 4
	note D#, 2
	note __, 2
	note A#, 2
	note A#, 2
	jump_channel Music_8b5a0

Music_8b609: ; 8b609
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	note C_, 2
	note C#, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 1
	note C#, 1
	ret_channel

MusicHeader_8a056_Ch6: ; 8b615
	music_tempo_2 $6
	note __, 4

Music_8b618: ; 8b618
	music_setrepeat1a $2
	call_channel Music_8b609
	music_dorepeat1a
	music_setrepeat1a $2
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	music_dorepeat1a
	call_channel Music_8b609
	music_setrepeat1a $4
	note C_, 2
	note C#, 2
	note G#, 2
	note C#, 2
	music_dorepeat1a
	music_setrepeat1a $2
	call_channel Music_8b609
	music_dorepeat1a
	jump_channel Music_8b618

MusicHeader_8a074_Ch1: ; 8b638
	music_tempo_2 $6
	music_fa $b8
	music_fb $11, $12, $3, $11
	music_e8 $15
	music_f9 $18, 4, 3
	octave 4
	note E_, 1
	note A_, 1
	octave 5
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 6
	note C#, 1
	note E_, 1
	music_tempo_2 $7
	note G_, 1
	note A_, 1
	octave 7
	note C#, 1
	note E_, 1
	music_tempo_2 $8
	note E_, 1
	note A_, 1
	music_tempo_2 $9
	note A_, 1
	note E_, 1
	music_tempo_2 $5
	music_fb $11, $11, $2, $11
	octave 6
	music_setrepeat1a $4
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	music_setrepeat1a $4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $2
	octave 7
	note C#, 4
	note E_, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 6
	note A_, 2
	note __, 2
	note G_, 2
	note __, 2
	note E_, 2
	note __, 2
	note C#, 2
	note __, 2
	octave 5
	note A_, 2
	note __, 2
	music_dorepeat1a
	music_fa $b7

Music_8b69c: ; 8b69c
	octave 5
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 4
	note A_, 1
	note __, 1
	octave 5
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 4
	note B_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note D_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	note G_, 1
	note __, 1
	jump_channel Music_8b69c

MusicHeader_8a074_Ch2: ; 8b736
	music_tempo_2 $6
	music_fa $b9
	music_fb $11, $12, $3, $11
	music_e8 $15
	music_f9 $18, 4, 3
	octave 4
	note A_, 1
	octave 5
	note C#, 1
	note E_, 1
	note G_, 1
	note A_, 1
	octave 6
	note C#, 1
	note E_, 1
	note G_, 1
	music_tempo_2 $7
	note A_, 1
	octave 7
	note C#, 1
	note E_, 1
	note G_, 1
	music_tempo_2 $8
	note A_, 1
	octave 8
	note D_, 1
	music_tempo_2 $9
	note C#, 1
	octave 7
	note A_, 1
	music_tempo_2 $5
	music_fb $11, $12, $2, $11
	octave 6
	music_setrepeat1a $4
	note A_, 1
	note __, 1
	note B_, 1
	note __, 1
	music_dorepeat1a
	octave 7
	music_setrepeat1a $4
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	music_dorepeat1a
	music_setrepeat1a $4
	note F#, 1
	note __, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	octave 7
	note A_, 16
	call_channel Music_8b84e
	octave 7
	note G_, 16
	call_channel Music_8b84e

Music_8b78f: ; 8b78f
	call_channel Music_8b86f
	music_fa $b6
	call_channel Music_8b86f
	music_fa $b4
	call_channel Music_8b86f
	music_fa $b2
	call_channel Music_8b86f
	note __, 4
	music_fa $b9
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	call_channel Music_8b877
	music_fa $b6
	call_channel Music_8b877
	music_fa $b4
	call_channel Music_8b877
	music_fa $b2
	call_channel Music_8b877
	music_fa $b9
	note B_, 8
	call_channel Music_8b87e
	music_fa $b6
	call_channel Music_8b87e
	music_fa $b4
	call_channel Music_8b87e
	music_fa $b2
	call_channel Music_8b87e
	call_channel Music_8b87e
	note __, 2
	music_fa $b9
	call_channel Music_8b887
	music_fa $b6
	call_channel Music_8b887
	music_fa $b4
	call_channel Music_8b887
	music_fa $b2
	call_channel Music_8b887
	music_fa $b9
	jump_channel Music_8b78f

MusicHeader_8a074_Ch3: ; 8b7ec
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $2, $0
	music_f9 $18, 4, 7
	music_noise_sample $7
	note __, 8
	music_tempo_2 $7
	note __, 4
	music_tempo_2 $8
	note __, 2
	music_tempo_2 $9
	note __, 2
	music_tempo_2 $5
	octave 6
	note D#, 14
	note D_, 1
	note C#, 1
	note C_, 14
	octave 5
	note B_, 1
	note A#, 1
	note A_, 14
	note G#, 1
	note G_, 1
	note F#, 16
	music_fb $0, $0, $5, $0
	music_setrepeat1a $2
	octave 4
	note A_, 4
	octave 5
	note E_, 4
	note A_, 4
	note B_, 4
	octave 6
	note C#, 8
	octave 5
	note E_, 4
	note C#, 4
	music_dorepeat1a
	music_fb $0, $0, $2, $0

Music_8b82a: ; 8b82a
	music_setrepeat1a $3
	octave 4
	note A_, 4
	note __, 2
	octave 5
	note A_, 4
	note __, 2
	octave 4
	note A_, 4
	note __, 4
	octave 5
	note G_, 2
	note A_, 2
	octave 4
	note A_, 4
	note __, 4
	music_dorepeat1a
	octave 4
	note B_, 4
	note __, 2
	octave 5
	note B_, 4
	note __, 2
	octave 4
	note B_, 4
	note __, 4
	octave 5
	note A_, 2
	note B_, 2
	octave 4
	note B_, 4
	note __, 4
	jump_channel Music_8b82a

Music_8b84e: ; 8b84e
	octave 7
	note A_, 1
	octave 8
	note E_, 1
	note D_, 1
	note A_, 1
	music_fa $b6
	octave 7
	note A_, 1
	octave 8
	note E_, 1
	note D_, 1
	note A_, 1
	music_fa $b4
	octave 7
	note A_, 1
	octave 8
	note E_, 1
	note D_, 1
	note A_, 1
	music_fa $b2
	octave 7
	note A_, 1
	octave 8
	note E_, 1
	note D_, 1
	note A_, 1
	music_fa $b9
	ret_channel

Music_8b86f: ; 8b86f
	octave 7
	note C#, 1
	note __, 1
	note E_, 1
	note __, 1
	note A_, 1
	note __, 1
	ret_channel

Music_8b877: ; 8b877
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 1
	note __, 1
	ret_channel

Music_8b87e: ; 8b87e
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note B_, 1
	note __, 1
	note A_, 1
	note __, 1
	ret_channel

Music_8b887: ; 8b887
	octave 7
	note B_, 1
	note __, 1
	octave 8
	note D_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	note __, 1
	ret_channel

MusicHeader_8a074_Ch6: ; 8b892
	music_tempo_2 $6
	note __, 8
	music_tempo_2 $7
	note __, 4
	music_tempo_2 $8
	note __, 2
	music_tempo_2 $9
	note __, 2
	music_tempo_2 $5
	note D_, 2
	note C#, 2
	note E_, 10
	note C#, 2
	note D_, 4
	note D_, 12
	note D_, 2
	note C#, 2
	note E_, 10
	note C#, 2
	note D_, 4
	note D_, 4
	music_tempo_2 $2
	music_setrepeat1a $a
	note D#, 1
	music_dorepeat1a
	music_setrepeat1a $a
	note E_, 1
	music_dorepeat1a
	music_tempo_2 $5
	note __, 16
	note __, 16
	note __, 16
	note __, 16

Music_8b8bc: ; 8b8bc
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
	jump_channel Music_8b8bc

MusicHeader_8a07e_Ch1: ; 8b8cb
	music_tempo_2 $6
	music_fa $78
	music_fb $11, $12, $5, $31
	music_e8 $12
	music_f9 $10, 4, 3
	octave 5
	note A#, 1
	note A#, 1
	note __, 1
	octave 6
	note C#, 1
	note C#, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 3
	octave 6
	note D#, 2
	note G_, 1
	note D#, 1
	octave 5
	note A#, 1
	note G_, 1
	octave 6
	note C#, 1
	note C#, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	note C#, 1
	note __, 3
	note F#, 2
	note A#, 1
	note F#, 1
	note C#, 1
	octave 5
	note A#, 1
	octave 6
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 2
	note A#, 1
	note G_, 1
	note D#, 1
	octave 5
	note A#, 1

Music_8b90b: ; 8b90b
	call_channel Music_8badc
	music_fa $76
	note D#, 1
	note F#, 1
	note __, 1
	note F_, 5
	note C#, 4
	octave 5
	note A#, 8
	call_channel Music_8badc
	octave 5
	note B_, 1
	octave 6
	note D#, 1
	note C#, 1
	octave 5
	note B_, 1
	note A#, 4
	note G#, 4
	note F#, 4
	note A#, 1
	note B_, 1
	octave 6
	note C#, 1
	note F#, 1
	note E_, 4
	note __, 2
	note F#, 4
	note __, 2
	note G_, 4
	music_setrepeat1a $2
	note F#, 1
	note G_, 1
	note F#, 1
	note D#, 1
	note B_, 1
	note __, 1
	music_fa $74
	music_dorepeat1a
	music_fa $78
	octave 5
	note B_, 1
	octave 6
	note F#, 1
	note B_, 1
	octave 7
	note D#, 1
	octave 5
	note G#, 1
	note G_, 1
	note G#, 1
	note A#, 1
	note B_, 1
	note __, 1
	note B_, 1
	note A#, 1
	note B_, 1
	octave 6
	note C#, 1
	note D_, 1
	note __, 1
	note D_, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note F_, 1
	note __, 3
	note F_, 4
	music_tempo_2 $8
	note C#, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note A#, 1
	music_tempo_2 $6
	octave 6
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 6
	jump_channel Music_8b90b

MusicHeader_8a07e_Ch2: ; 8b970
	music_tempo_2 $6
	music_fa $39
	music_fb $11, $12, $5, $31
	music_e8 $12
	music_f9 $10, 4, 3
	octave 6
	note F_, 1
	note F_, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 3
	note A#, 6
	note G#, 1
	note G#, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note A#, 1
	note __, 3
	octave 7
	note C#, 6
	note D#, 4
	octave 6
	note D#, 1
	note G_, 1
	note A#, 1
	octave 7
	note D#, 5
	note G_, 1
	note D#, 1
	octave 6
	note A#, 1
	note G_, 1

Music_8b99e: ; 8b99e
	call_channel Music_8bacc
	octave 5
	note A#, 1
	octave 6
	note D#, 1
	note __, 1
	note C#, 4
	note __, 1
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	music_tempo_2 $3
	octave 7
	note C_, 1
	note C#, 3
	music_tempo_2 $6
	octave 6
	note B_, 1
	note A#, 1
	note __, 1
	note F#, 3
	call_channel Music_8bacc
	note G#, 1
	note A#, 1
	note B_, 1
	octave 7
	note C#, 1
	note D#, 4
	note __, 2
	note C#, 1
	octave 6
	note B_, 1
	octave 7
	note C#, 3
	music_tempo_2 $3
	note C_, 1
	octave 6
	note B_, 1
	music_tempo_2 $6
	note A#, 4
	note B_, 1
	note G_, 1
	note A_, 1
	note B_, 1
	octave 7
	note E_, 8
	note __, 2
	note D#, 1
	note C#, 1
	music_setrepeat1a $2
	note D#, 1
	note E_, 1
	note D#, 1
	octave 6
	note B_, 1
	octave 7
	note F#, 1
	note __, 1
	music_fa $35
	music_dorepeat1a
	music_fa $34
	note D#, 1
	note E_, 1
	note D#, 1
	octave 6
	note B_, 1
	music_fa $39
	octave 6
	note E_, 1
	note D#, 1
	note E_, 1
	note F#, 1
	note G_, 1
	note __, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note B_, 1
	octave 7
	note C#, 1
	note D_, 1
	note E_, 1
	note D_, 1
	note __, 3
	note C#, 12
	music_fa $79
	octave 6
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note A#, 1
	note __, 1
	note A#, 1
	note A#, 6
	music_fa $39
	jump_channel Music_8b99e

MusicHeader_8a07e_Ch3: ; 8ba16
	music_tempo_2 $6
	music_fa $3
	music_fb $0, $0, $2, $21
	music_noise_sample $f
	octave 5
	note D#, 1
	note D#, 1
	note __, 1
	note F_, 1
	note F_, 1
	note __, 1
	note D#, 2
	octave 4
	note D#, 2
	octave 5
	note G_, 2
	note D#, 2
	octave 4
	note A#, 2
	octave 5
	note E_, 1
	note E_, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note F#, 2
	octave 4
	note F#, 2
	octave 5
	note A#, 2
	note F#, 2
	note C#, 2
	octave 5
	note D#, 1
	note D#, 1
	note __, 1
	octave 4
	note D#, 1
	note D#, 1
	note __, 1
	octave 5
	note D#, 1
	note D#, 1
	note __, 1
	octave 4
	note D#, 1
	note D#, 6

Music_8ba4d: ; 8ba4d
	music_setrepeat1a $2
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note B_, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note B_, 2
	octave 5
	note C#, 2
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note B_, 2
	octave 5
	note C#, 2
	music_dorepeat1a
	octave 4
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note B_, 1
	octave 5
	note E_, 1
	note __, 1
	octave 4
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	note __, 1
	note B_, 2
	octave 5
	note E_, 2
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note __, 1
	note B_, 1
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note B_, 2
	octave 5
	note D#, 2
	octave 4
	note E_, 1
	note __, 1
	note E_, 1
	note __, 1
	note G_, 1
	note B_, 1
	note __, 1
	note E_, 1
	note __, 1
	note E_, 1
	note E_, 1
	note __, 1
	note G_, 2
	note B_, 2
	note F_, 3
	octave 5
	note C#, 1
	octave 4
	note F_, 1
	note __, 1
	note F#, 4
	octave 5
	note C#, 1
	note __, 1
	note G#, 2
	octave 5
	note C#, 2
	octave 4
	note F#, 1
	note A#, 1
	note __, 1
	note F#, 1
	octave 5
	note C#, 1
	note __, 1
	octave 4
	note F#, 1
	octave 5
	note F#, 1
	note __, 1
	octave 4
	note F#, 1
	octave 5
	note C#, 2
	note F#, 1
	note C#, 1
	octave 4
	note F#, 2
	jump_channel Music_8ba4d

Music_8bacc: ; 8bacc
	music_setrepeat1a $2
	note G#, 2
	note D#, 1
	note __, 1
	music_fa $35
	music_dorepeat1a
	music_fa $34
	note G#, 2
	note D#, 1
	note __, 1
	music_fa $39
	ret_channel

Music_8badc: ; 8badc
	music_fa $78
	music_setrepeat1a $2
	octave 5
	note G#, 1
	note A#, 1
	note B_, 1
	octave 6
	note C#, 1
	note D#, 1
	note __, 1
	music_dorepeat1a
	ret_channel

Music_8baea: ; 8baea
	music_tempo_2 $2
	music_setrepeat1a $6
	note D#, 1
	music_dorepeat1a
	note E_, 1
	note E_, 1
	note E_, 1
	note G#, 1
	note G#, 1
	note G#, 1
	music_tempo_2 $6
	ret_channel

MusicHeader_8a07e_Ch6: ; 8baf9
	music_tempo_2 $6
	music_setrepeat1a $2
	note G#, 2
	note C_, 1
	note G#, 2
	note C_, 1
	note G#, 2
	note C_, 2
	note G#, 1
	note C_, 1
	note G#, 1
	note G#, 1
	note D_, 1
	note G#, 1
	music_dorepeat1a
	note G#, 4
	note C_, 2
	note C_, 1
	note G#, 2
	note G#, 1
	note G#, 2
	call_channel Music_8baea

Music_8bb13: ; 8bb13
	music_setrepeat1a $6
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note C_, 2
	note G#, 2
	note D_, 2
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note D#, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note G#, 1
	note G#, 1
	note D#, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note G#, 1
	note E_, 1
	note G#, 1
	note E_, 1
	note G#, 2
	note C_, 1
	note C_, 1
	music_setrepeat1a $3
	note G#, 2
	note C_, 2
	music_dorepeat1a
	note G#, 4
	note C_, 2
	note C_, 1
	note G#, 2
	note G#, 1
	note G#, 2
	call_channel Music_8baea
	jump_channel Music_8bb13

MusicHeader_8a088_Ch1: ; 8bb42
	music_tempo_2 $4
	music_fb $0, $11, $1, $11
	music_e8 $1b
	music_fa $b3
	octave 5
	note D#, 1
	note F_, 1
	note F#, 1
	note G#, 1
	music_fa $b6
	note A#, 1
	octave 6
	note C_, 1
	note C#, 1
	note D#, 1
	music_fa $b8
	note F_, 1
	note D#, 1
	note C#, 1
	octave 5
	note A#, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note G#, 1
	octave 6
	note C_, 1
	music_tempo_2 $1
	note __, 15
	music_setfreqoffset $1
	music_tempo_2 $9
	music_fa $b3
	music_fb $0, $11, $2, $11
	jump_channel Music_8bba2

MusicHeader_8a088_Ch2: ; 8bb7b
	music_tempo_2 $4
	music_fb $0, $11, $1, $11
	music_e8 $1b
	music_fa $b4
	octave 5
	note F#, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	music_fa $b7
	note C#, 1
	note D#, 1
	note F_, 1
	note F#, 1
	music_fa $b9
	call_channel Music_8bc35
	note C#, 1
	note D#, 1
	music_tempo_2 $9
	music_fa $b8
	music_fb $11, $11, $5, $11

Music_8bba2: ; 8bba2
	music_setrepeat1d $2
	music_setrepeat1a $4
	octave 7
	note F_, 1
	note C#, 1
	octave 6
	note G#, 1
	note F_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	octave 7
	note F_, 1
	note D#, 1
	octave 6
	note G#, 1
	note G_, 1
	music_dorepeat1a
	music_dorepeat1d
	music_setrepeat1a $2
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	note A#, 1
	note F#, 1
	call_channel Music_8bc41
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	note A#, 1
	note D#, 1
	call_channel Music_8bc41
	octave 6
	note B_, 1
	note A#, 1
	note F#, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note C#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note D#, 1
	note B_, 1
	note A#, 1
	note F#, 1
	note F_, 1
	music_dorepeat1a
	jump_channel Music_8bba2

MusicHeader_8a088_Ch3: ; 8bbe0
	music_tempo_2 $4
	music_fa $2
	music_fb $0, $0, $0, $0
	music_noise_sample $f
	music_setfreqoffset $1
	note __, 2
	octave 5
	note F#, 1
	note G#, 1
	note A#, 1
	octave 6
	note C_, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note F#, 1
	call_channel Music_8bc35
	music_setfreqoffset $0
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $4, $0
	music_f9 $15, 5, 9

Music_8bc09: ; 8bc09
	octave 4
	note A#, 10
	octave 5
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 8
	note G#, 6
	note G#, 2
	note G_, 2
	note D#, 2
	note F_, 6
	note D#, 2
	note C#, 2
	note C_, 2
	octave 4
	note G#, 4
	note A#, 12
	note B_, 8
	octave 5
	note F#, 2
	note F_, 2
	note C#, 2
	octave 4
	note G#, 2
	note F#, 12
	octave 5
	note D#, 2
	note C#, 2
	octave 4
	note B_, 4
	octave 5
	note F#, 2
	note F_, 4
	note F#, 2
	note G#, 2
	note A#, 2
	note C#, 12
	note C#, 2
	octave 4
	note B_, 2
	jump_channel Music_8bc09

Music_8bc35: ; 8bc35
	note G#, 1
	note F#, 1
	note F_, 1
	note D#, 1
	note C_, 1
	note C#, 1
	note D#, 1
	note F_, 1
	note G#, 1
	octave 7
	note C_, 1
	ret_channel

Music_8bc41: ; 8bc41
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	note A#, 1
	note F_, 1
	ret_channel

MusicHeader_8a088_Ch6: ; 8bc48
	music_ff

MusicHeader_8a09c_Ch1: ; 8bc49
	music_tempo_2 $7
	music_fa $b8
	music_fb $11, $14, $3, $12

Music_8bc52: ; 8bc52
	call_channel Music_8bcfd
	note D_, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note C#, 1
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	note __, 1
	note B_, 1
	note G#, 1
	note __, 1
	note A_, 1
	note G_, 1
	note D_, 2
	call_channel Music_8bcfd
	octave 5
	note G_, 1
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note G_, 1
	note __, 1
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	octave 6
	note B_, 3
	jump_channel Music_8bc52

MusicHeader_8a09c_Ch2: ; 8bc83
	music_tempo_2 $7
	music_fa $79
	music_fb $11, $14, $3, $12

Music_8bc8c: ; 8bc8c
	call_channel Music_8bce9
	note F_, 1
	note D_, 1
	note __, 1
	note E_, 1
	note C#, 1
	note __, 1
	note D#, 1
	note C_, 1
	note __, 1
	note D_, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	note G_, 2
	call_channel Music_8bce9
	note G_, 1
	note G_, 1
	note __, 1
	octave 7
	note G_, 1
	note G_, 1
	note __, 1
	octave 6
	note G_, 1
	note G_, 1
	note __, 1
	octave 7
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 1
	note G_, 3
	jump_channel Music_8bc8c

MusicHeader_8a09c_Ch3: ; 8bcb8
	music_tempo_2 $7
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11

Music_8bcc3: ; 8bcc3
	call_channel Music_8bd0f
	note D_, 1
	note D_, 1
	note __, 1
	note C#, 1
	note C#, 1
	note __, 1
	note C_, 1
	note C_, 1
	note __, 1
	octave 4
	note B_, 1
	note B_, 1
	note __, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note B_, 1
	call_channel Music_8bd0f
	octave 4
	music_setrepeat1a $9
	note G_, 1
	music_dorepeat1a
	octave 5
	note G_, 2
	note G_, 1
	note D_, 1
	octave 4
	note B_, 1
	note G_, 2
	jump_channel Music_8bcc3

Music_8bce9: ; 8bce9
	octave 6
	note G_, 3
	note G_, 1
	music_e8 $14
	note __, 1
	octave 7
	note C_, 1
	octave 6
	note B_, 1
	octave 7
	note C_, 1
	note D#, 1
	note C_, 1
	note __, 1
	octave 6
	note A_, 1
	note __, 1
	note F#, 3
	ret_channel

Music_8bcfd: ; 8bcfd
	octave 6
	note D#, 1
	note C_, 1
	note D_, 1
	note D#, 1
	music_e8 $14
	note __, 1
	note G_, 3
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	note __, 1
	note F#, 1
	note __, 1
	note D#, 3
	ret_channel

Music_8bd0f: ; 8bd0f
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note A#, 1
	octave 5
	note C_, 1
	note C_, 1
	octave 6
	note C_, 2
	octave 5
	note C_, 1
	octave 4
	note A_, 1
	note A_, 1
	note __, 1
	octave 5
	note A_, 1
	note __, 1
	note A_, 3
	ret_channel

Music_8bd24: ; 8bd24
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note G#, 2
	note D_, 1
	note C#, 1
	ret_channel

MusicHeader_8a09c_Ch6: ; 8bd32
	music_tempo_2 $7

Music_8bd34: ; 8bd34
	call_channel Music_8bd24
	music_setrepeat1a $4
	note D_, 1
	note C#, 1
	note C_, 1
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note G#, 2
	call_channel Music_8bd24
	music_setrepeat1a $3
	note G#, 1
	note G#, 1
	note C#, 1
	music_dorepeat1a
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	jump_channel Music_8bd34

