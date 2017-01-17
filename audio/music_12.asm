	dw MusicHeader_4a002
	dw MusicHeader_4a010
	dw MusicHeader_4a01a
	dw MusicHeader_4a024
	dw MusicHeader_4a02e
	dw MusicHeader_4a038
	dw MusicHeader_4a042
	dw MusicHeader_4a04c
	dw MusicHeader_4a056
	dw MusicHeader_4a060
	dw MusicHeader_4a06a
	dw MusicHeader_4a074
	dw MusicHeader_4a07e
	dw MusicHeader_4a07e
	dw MusicHeader_4a07e
	dw MusicHeader_4a07e

MusicHeader_4a002: ; 4a002
	channel %111111, $f0
	dw MusicHeader_4a002_Ch1
	dw MusicHeader_4a002_Ch2
	dw MusicHeader_4a002_Ch3
	dw MusicHeader_4a002_Ch4
	dw MusicHeader_4a002_Ch5
	dw MusicHeader_4a002_Ch6

MusicHeader_4a010: ; 4a010
	channel %111001, $f0
	dw MusicHeader_4a010_Ch1
	dw MusicHeader_4a010_Ch2
	dw MusicHeader_4a010_Ch3
	dw MusicHeader_4a010_Ch6

MusicHeader_4a01a: ; 4a01a
	channel %111001, $c0
	dw MusicHeader_4a01a_Ch1
	dw MusicHeader_4a01a_Ch2
	dw MusicHeader_4a01a_Ch3
	dw MusicHeader_4a01a_Ch6

MusicHeader_4a024: ; 4a024
	channel %111001, $c0
	dw MusicHeader_4a024_Ch1
	dw MusicHeader_4a024_Ch2
	dw MusicHeader_4a024_Ch3
	dw MusicHeader_4a024_Ch6

MusicHeader_4a02e: ; 4a02e
	channel %111001, $c0
	dw MusicHeader_4a02e_Ch1
	dw MusicHeader_4a02e_Ch2
	dw MusicHeader_4a02e_Ch3
	dw MusicHeader_4a02e_Ch6

MusicHeader_4a038: ; 4a038
	channel %111001, $c0
	dw MusicHeader_4a038_Ch1
	dw MusicHeader_4a038_Ch2
	dw MusicHeader_4a038_Ch3
	dw MusicHeader_4a038_Ch6

MusicHeader_4a042: ; 4a042
	channel %111001, $c0
	dw MusicHeader_4a042_Ch1
	dw MusicHeader_4a042_Ch2
	dw MusicHeader_4a042_Ch3
	dw MusicHeader_4a042_Ch6

MusicHeader_4a04c: ; 4a04c
	channel %111001, $c0
	dw MusicHeader_4a04c_Ch1
	dw MusicHeader_4a04c_Ch2
	dw MusicHeader_4a04c_Ch3
	dw MusicHeader_4a04c_Ch6

MusicHeader_4a056: ; 4a056
	channel %111001, $c0
	dw MusicHeader_4a056_Ch1
	dw MusicHeader_4a056_Ch2
	dw MusicHeader_4a056_Ch3
	dw MusicHeader_4a056_Ch6

MusicHeader_4a060: ; 4a060
	channel %111001, $c0
	dw MusicHeader_4a060_Ch1
	dw MusicHeader_4a060_Ch2
	dw MusicHeader_4a060_Ch3
	dw MusicHeader_4a060_Ch6

MusicHeader_4a06a: ; 4a06a
	channel %111001, $c0
	dw MusicHeader_4a06a_Ch1
	dw MusicHeader_4a06a_Ch2
	dw MusicHeader_4a06a_Ch3
	dw MusicHeader_4a06a_Ch6

MusicHeader_4a074: ; 4a074
	channel %111001, $c0
	dw MusicHeader_4a074_Ch1
	dw MusicHeader_4a074_Ch2
	dw MusicHeader_4a074_Ch3
	dw MusicHeader_4a074_Ch6

MusicHeader_4a07e: ; 4a07e
	channel %111001, $c0
	dw MusicHeader_4a07e_Ch1
	dw MusicHeader_4a07e_Ch2
	dw MusicHeader_4a07e_Ch3
	dw MusicHeader_4a07e_Ch6

MusicHeader_4a002_Ch1: ; 4a088
MusicHeader_4a002_Ch2: ; 4a088
MusicHeader_4a002_Ch3: ; 4a088
MusicHeader_4a002_Ch4: ; 4a088
MusicHeader_4a002_Ch5: ; 4a088
MusicHeader_4a002_Ch6: ; 4a088
MusicHeader_4a010_Ch1: ; 4a088
MusicHeader_4a010_Ch2: ; 4a088
MusicHeader_4a010_Ch3: ; 4a088
MusicHeader_4a010_Ch6: ; 4a088
MusicHeader_4a07e_Ch1: ; 4a088
MusicHeader_4a07e_Ch2: ; 4a088
MusicHeader_4a07e_Ch3: ; 4a088
MusicHeader_4a07e_Ch6: ; 4a088
	music_ff

MusicHeader_4a01a_Ch1: ; 4a089
	music_tempo_2 $4
	music_fa $77
	octave 5
	note C_, 5
	music_fa $b8
	note G_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	octave 7
	note C_, 1
	music_e8 $18
	music_f9 $c, 5, 4
	note D#, 10
	note __, 2
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	octave 5
	note B_, 1
	note G#, 1
	note F_, 1
	jump_channel MusicHeader_4a024_Ch1

MusicHeader_4a01a_Ch2: ; 4a0ae
	music_tempo_2 $4
	music_fa $ba
	octave 6
	note C_, 1
	note D#, 1
	note G_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D#, 1
	music_f9 $c, 5, 4
	music_e8 $18
	note G_, 16
	note __, 2
	note F#, 1
	note D#, 1
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	octave 5
	note B_, 1
	jump_channel MusicHeader_4a024_Ch2

MusicHeader_4a01a_Ch3: ; 4a0ce
	music_tempo_2 $4
	music_fa $3
	music_noise_sample $f
	note __, 4
	octave 4
	music_setrepeat1a $a
	note F_, 1
	note F#, 1
	music_dorepeat1a
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 5
	note C_, 1
	note C#, 1
	note D_, 1
	jump_channel MusicHeader_4a024_Ch3

MusicHeader_4a01a_Ch6: ; 4a0e7
	music_tempo_2 $4
	note C_, 4
	note C_, 2
	note G#, 2
	music_setrepeat1a $2
	note G#, 4
	note C_, 2
	note G#, 1
	note G#, 1
	music_dorepeat1a
	note G#, 2
	note C_, 2
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	jump_channel MusicHeader_4a024_Ch6

MusicHeader_4a024_Ch1: ; 4a0fc
	music_tempo_2 $4
	music_fa $77
	music_fb $11, $12, $0, $0
	octave 5
	music_setrepeat1a $5
	note A#, 2
	note B_, 2
	music_dorepeat1a
	octave 6
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	octave 5
	note B_, 2
	music_setrepeat1a $7
	note A#, 2
	note B_, 2
	music_dorepeat1a
	octave 6
	note D_, 2
	note F_, 2

Music_4a11b: ; 4a11b
	octave 6
	music_setrepeat1a $4
	note C_, 2
	note D#, 2
	music_dorepeat1a
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 5
	note G#, 2
	music_setrepeat1a $7
	note G_, 2
	note G#, 2
	music_dorepeat1a
	note A#, 2
	note B_, 2
	octave 6
	music_setrepeat1a $3
	note C_, 2
	note C#, 2
	music_dorepeat1a
	note D#, 2
	note F_, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	music_setrepeat1a $5
	note C_, 2
	note C#, 2
	music_dorepeat1a
	note D#, 2
	note F_, 2
	note G_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	music_setrepeat1a $4
	note C_, 2
	note D#, 2
	music_dorepeat1a
	note C_, 2
	note C#, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	octave 5
	note A#, 2
	music_setrepeat1a $7
	note G_, 2
	note G#, 2
	music_dorepeat1a
	note A#, 2
	note B_, 2
	octave 6
	music_setrepeat1a $5
	note C_, 2
	note C#, 2
	music_dorepeat1a
	note D#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	music_setrepeat1a $4
	note D#, 2
	note F_, 2
	music_dorepeat1a
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	octave 6
	note A#, 2
	note G#, 2
	note G_, 2
	note D#, 2
	octave 5
	note A#, 2
	octave 6
	music_setrepeat1a $8
	note C_, 2
	note D#, 2
	music_dorepeat1a
	music_setrepeat1a $5
	note D_, 2
	note D#, 2
	music_dorepeat1a
	note F_, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	music_setrepeat1a $5
	note C_, 2
	note C#, 2
	music_dorepeat1a
	note D#, 2
	note F_, 2
	note D#, 2
	note C#, 2
	note C_, 2
	note C#, 2
	music_setrepeat1a $5
	note D#, 2
	note F_, 2
	music_dorepeat1a
	note G#, 2
	note A#, 2
	note G#, 2
	note G_, 2
	note D#, 2
	octave 5
	note A#, 2
	jump_channel Music_4a11b

MusicHeader_4a024_Ch2: ; 4a1a8
	music_tempo_2 $4
	music_fa $b8
	music_e8 $8
	octave 5
	note G#, 2
	note __, 2
	music_e8 $18
	octave 6
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	music_fa $b5
	octave 6
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	music_fa $b2
	octave 6
	note D_, 1
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	note __, 1
	music_fa $b8
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	music_fa $b5
	octave 7
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	music_fa $b2
	octave 7
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	note D_, 1
	note __, 1
	music_fa $b8
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	note F_, 1
	music_fa $b5
	octave 6
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	note F_, 1
	music_fa $b2
	octave 6
	note F_, 1
	note G#, 1
	note B_, 1
	octave 7
	note D_, 1
	note F_, 1
	note __, 1
	music_fa $b8
	note F_, 1
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	music_fa $b5
	octave 7
	note F_, 1
	note D_, 1
	octave 6
	note B_, 1
	note G#, 1
	note F_, 1
	music_fa $b2
	octave 7
	note F_, 1
	note D_, 1

Music_4a219: ; 4a219
	music_fa $b2
	octave 6
	note F_, 2
	note C_, 2
	music_e8 $18
	music_fa $b8
	octave 7
	note G_, 2
	note __, 2
	note D#, 2
	note __, 2
	note C_, 2
	octave 6
	note A#, 2
	note A_, 2
	note __, 2
	note A#, 2
	note __, 2
	music_fa $b5
	note A#, 2
	note __, 2
	music_fa $b8
	octave 7
	note C_, 2
	note __, 2
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	note G#, 2
	note G_, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	music_fa $b5
	note G_, 2
	note __, 2
	music_fa $b8
	note D#, 2
	note __, 2
	note F_, 1
	note G_, 1
	note G#, 1
	octave 7
	note C_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note __, 2
	music_fa $b5
	note G_, 2
	music_fa $b8
	octave 6
	note G_, 2
	note A#, 2
	octave 7
	note C_, 2
	note C#, 2
	note C_, 2
	octave 6
	note B_, 2
	note A#, 2
	note A_, 2
	note G#, 2
	note G_, 2
	note G_, 1
	note G#, 1
	octave 7
	note C_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note A#, 1
	note G_, 1
	note __, 2
	music_fa $b5
	note G_, 2
	music_fa $b8
	octave 6
	note F_, 2
	note G#, 2
	octave 7
	note C_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note C_, 2
	octave 6
	note B_, 2
	note A#, 2
	note A_, 2
	music_fa $b4
	note C#, 2
	note C_, 2
	music_fa $b8
	octave 7
	note C_, 2
	note __, 2
	note D#, 2
	note __, 2
	note F_, 2
	note __, 2
	note F#, 2
	note __, 2
	note G_, 2
	note __, 2
	note F#, 2
	note __, 2
	note D_, 2
	note __, 2
	music_f9 $10, 5, 4
	note F_, 8
	note D#, 2
	note __, 2
	music_fa $b4
	note D#, 2
	note __, 2
	music_fa $b8
	octave 6
	note B_, 8
	octave 7
	note C_, 2
	note __, 2
	music_fa $b4
	note C_, 2
	note __, 2
	octave 5
	note B_, 2
	octave 6
	note C_, 2
	music_fa $b8
	octave 7
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	octave 6
	note G#, 2
	note __, 2
	note G_, 2
	note __, 2
	octave 7
	note D#, 2
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	octave 6
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note __, 1
	music_fa $b5
	note C_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note G_, 1
	note __, 1
	music_fa $b8
	note C_, 2
	note D#, 2
	note F_, 2
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note F_, 2
	note G_, 2
	note A#, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note __, 2
	note D#, 2
	note D_, 2
	note D#, 2
	note __, 2
	octave 6
	note A#, 2
	note A_, 2
	note A#, 2
	note __, 2
	note G_, 2
	note F#, 2
	note G_, 2
	note __, 2
	music_fa $b4
	note D#, 2
	note D_, 2
	music_fa $b8
	note F_, 2
	note G_, 2
	note G#, 2
	note A#, 2
	octave 7
	note C_, 2
	note D_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C#, 2
	note D_, 2
	octave 6
	note A#, 2
	note G#, 2
	note A#, 2
	note C_, 2
	note __, 2
	music_fa $b4
	note C_, 2
	note __, 2
	octave 6
	music_fa $b8
	note A#, 2
	note __, 2
	music_fa $b4
	note A#, 2
	note __, 2
	music_fa $b8
	octave 7
	note D#, 2
	note __, 2
	music_fa $b4
	note D#, 2
	note __, 2
	music_fa $b8
	note F_, 2
	note __, 2
	music_fa $b4
	note F_, 2
	note __, 2
	octave 6
	note C#, 2
	note D#, 2
	music_fa $b8
	note A#, 2
	note D#, 2
	note G#, 2
	note G_, 2
	note D#, 2
	octave 6
	note A#, 2
	note __, 2
	music_fa $b4
	note A#, 2
	music_fa $b8
	octave 7
	note C_, 2
	note C#, 2
	note C_, 2
	octave 6
	note A#, 2
	note G#, 2
	note G_, 2
	jump_channel Music_4a219

MusicHeader_4a024_Ch3: ; 4a348
	music_tempo_2 $8
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	octave 4
	music_setrepeat1a $2
	note A#, 1
	note A#, 2
	note A#, 1
	note A#, 2
	note A#, 1
	note A#, 1
	note A#, 2
	note A#, 1
	octave 5
	note F_, 1
	octave 6
	note D#, 1
	octave 5
	note F_, 1
	octave 4
	note G#, 2
	music_dorepeat1a

Music_4a367: ; 4a367
	octave 5
	note C_, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	octave 4
	note G_, 4
	note G_, 2
	note A#, 2
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	octave 4
	note G_, 4
	note G_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note C_, 1
	note C#, 3
	note G#, 4
	note C#, 2
	note F_, 2
	note C_, 2
	note C#, 2
	note C_, 1
	note C#, 3
	note G#, 4
	note C#, 2
	note E_, 2
	note C#, 2
	note C_, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	note D#, 2
	note D#, 2
	octave 4
	note G_, 2
	note A#, 2
	note B_, 2
	note C_, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 2
	note G_, 1
	note D#, 4
	note G_, 2
	octave 4
	note A#, 2
	note B_, 2
	octave 5
	note C#, 2
	note C_, 1
	note C#, 3
	octave 4
	note G#, 4
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note C_, 1
	note C#, 3
	octave 4
	note G#, 4
	note G#, 2
	note A#, 2
	note B_, 2
	music_setrepeat1a $2
	octave 5
	note C_, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 3
	octave 4
	note G_, 4
	note G_, 2
	note A#, 2
	note B_, 2
	music_dorepeat1a
	octave 5
	note C#, 2
	note C_, 1
	note C#, 3
	octave 4
	note G#, 4
	note G#, 2
	note A#, 2
	octave 5
	note C_, 2
	note C#, 2
	note C_, 1
	note C#, 3
	octave 4
	note G#, 4
	note G#, 2
	note A#, 2
	note B_, 2
	jump_channel Music_4a367

MusicHeader_4a024_Ch6: ; 4a3d8
	music_tempo_2 $8
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 1
	note G#, 2
	note G#, 1
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 1
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 1

Music_4a3ed: ; 4a3ed
	music_setrepeat1a $7
	note C_, 1
	note C#, 1
	note G#, 1
	note C#, 1
	music_dorepeat1a
	note G#, 2
	note G#, 1
	note C_, 1
	music_setrepeat1a $2
	note C_, 1
	note D_, 1
	note C#, 1
	note G#, 2
	note C#, 1
	note G#, 2
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	music_dorepeat1a
	music_setrepeat1a $7
	note C_, 1
	note C#, 1
	note G#, 2
	note C_, 1
	note C#, 1
	note G#, 2
	note C_, 1
	note C#, 1
	note G#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note G#, 2
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note C_, 1
	note G#, 2
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 1
	note G#, 2
	jump_channel Music_4a3ed

MusicHeader_4a02e_Ch1: ; 4a423
	music_tempo_2 $7
	music_fa $38
	music_fb $11, $14, $2, $11
	music_e8 $6

Music_4a42e: ; 4a42e
	call_channel Music_4aa08
	note C_, 2
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
	octave 7
	note C_, 1
	note F_, 1
	note C_, 1
	octave 6
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	note F_, 1
	note C_, 1
	call_channel Music_4aa08
	note F_, 2
	note D_, 1
	octave 6
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	octave 5
	note A#, 2
	note __, 1
	note D_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	octave 6
	note C_, 1
	note D_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note D_, 1
	note C_, 1
	octave 5
	note A_, 1
	note G_, 2
	note __, 1
	note A#, 1
	note __, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 2
	note __, 1
	note F_, 2
	note __, 1
	note D#, 1
	note D_, 1
	note D#, 1
	octave 5
	note A#, 2
	note __, 1
	octave 6
	note D#, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 2
	note __, 2
	note G_, 1
	note D#, 1
	note G_, 1
	note A_, 2
	note __, 1
	music_f9 $e, 5, 7
	note F_, 6
	octave 5
	note G#, 1
	note F_, 1
	note __, 1
	octave 6
	note D#, 1
	note C_, 1
	octave 5
	note G#, 1
	note F_, 1
	octave 6
	note D#, 1
	note D_, 1
	octave 5
	note A#, 1
	note __, 1
	note A#, 1
	note G_, 1
	note D_, 1
	note G_, 1
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note G#, 1
	note __, 1
	octave 6
	note D#, 1
	note C_, 1
	octave 5
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note F_, 1
	note G_, 1
	note G#, 1
	music_tempo_2 $4
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $8
	note D#, 1
	octave 5
	note A#, 1
	octave 6
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 2
	note G#, 1
	note G#, 1
	music_tempo_2 $4
	music_reset_var22_flag6_and_setenvreset $5
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note C_, 1
	octave 5
	note G#, 1
	music_tempo_2 $5
	note C#, 1
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $8
	octave 6
	note F_, 2
	note C_, 1
	note D#, 1
	note F_, 1
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	note G#, 2
	note G_, 1
	note F_, 2
	note __, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note __, 1
	note D_, 2
	note D#, 1
	note F_, 1
	octave 7
	note G_, 2
	note G_, 1
	note __, 1
	note F_, 1
	note G_, 2
	note __, 2
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note D#, 1
	octave 5
	note A#, 1
	octave 6
	note F_, 1
	note G_, 1
	octave 7
	note G_, 2
	note G_, 1
	note __, 1
	note F_, 1
	note G_, 2
	note __, 2
	octave 6
	note D#, 1
	note G_, 1
	note D#, 1
	note G#, 1
	note D#, 1
	note A#, 1
	note G#, 1
	note F_, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note D#, 1
	music_tempo_2 $4
	note D_, 1
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $9
	note C_, 2
	note __, 1
	note D#, 1
	note __, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note G_, 1
	note __, 1
	note D#, 1
	note F_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A#, 1
	octave 5
	note G_, 1
	octave 6
	note D#, 1
	note G_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note D#, 1
	octave 5
	note A#, 1
	octave 6
	note A_, 1
	note D_, 1
	note G_, 1
	note C_, 1
	note D#, 1
	octave 5
	note G_, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 1
	octave 5
	note G_, 1
	note F_, 1
	note G_, 1
	octave 6
	note D_, 1
	octave 5
	note G_, 1
	octave 6
	note F_, 1
	note D_, 1
	octave 5
	note G_, 1
	octave 6
	note D#, 1
	note A#, 1
	note A_, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note F_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	music_tempo_2 $18
	music_set_var22_flag6_and_setenvreset $8
	note F_, 1
	music_tempo_2 $7
	note C_, 1
	octave 6
	note G_, 1
	note A#, 1
	note F_, 1
	note G_, 1
	note D_, 1
	note D#, 1
	note __, 1
	note F_, 1
	note G_, 2
	note A#, 1
	octave 7
	note D#, 1
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note __, 1
	note C_, 2
	note __, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 2
	note __, 3
	octave 5
	note F_, 4
	note A#, 2
	octave 6
	note D#, 2
	note G#, 2
	octave 7
	note C#, 2
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note C_, 2
	note __, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note D#, 1
	note G_, 1
	octave 7
	note C_, 1
	note __, 1
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note F_, 1
	note D_, 1
	octave 5
	note A#, 1
	note G_, 2
	note __, 2
	octave 6
	note C_, 3
	note D_, 1
	note D#, 1
	note F_, 5
	note G#, 2
	note G_, 2
	note D#, 2
	note __, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note D_, 1
	note G_, 5
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 2
	note F_, 2
	note D#, 1
	note C_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note __, 1
	note G_, 1
	note F_, 1
	note D#, 1
	octave 5
	note G#, 1
	note F_, 1
	octave 6
	note C_, 1
	note D#, 1
	note G_, 1
	note F_, 1
	note __, 1
	note D#, 2
	note __, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	octave 7
	note C_, 2
	note __, 2
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note B_, 2
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 3
	jump_channel Music_4a42e

MusicHeader_4a02e_Ch2: ; 4a63a
	music_tempo_2 $7
	music_fa $79
	music_fb $11, $14, $3, $12
	music_e8 $6

Music_4a645: ; 4a645
	call_channel Music_4a9e0
	music_f9 $10, 5, 3
	note A_, 15
	note __, 2
	call_channel Music_4a9e0
	octave 8
	note C_, 7
	note __, 2
	octave 7
	note D_, 4
	music_reset_var22_flag6_and_setenvreset $7
	music_tempo_2 $2
	note E_, 1
	music_tempo_2 $1a
	music_set_var22_flag6_and_setenvreset $9
	note F_, 1
	music_tempo_2 $7
	note G_, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note C_, 1
	note D_, 5
	note __, 1
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note C#, 1
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $9
	note D_, 1
	music_tempo_2 $7
	note F_, 2
	note A#, 2
	note A_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 3
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 2
	note F_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	note F_, 3
	note A#, 1
	note __, 1
	octave 8
	note D_, 1
	note __, 1
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note D_, 1
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $9
	note D#, 1
	music_tempo_2 $7
	note D_, 1
	note C_, 1
	note __, 1
	octave 7
	note A#, 1
	note __, 1
	octave 8
	note C_, 3
	note __, 1
	octave 7
	note C_, 4
	note __, 1
	note F_, 2
	note D#, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A#, 6
	note G_, 1
	note A#, 1
	note G_, 1
	octave 7
	note C_, 2
	note D_, 1
	note D#, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	octave 7
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note F#, 1
	music_tempo_2 $21
	music_set_var22_flag6_and_setenvreset $9
	note G_, 1
	music_tempo_2 $7
	note __, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G_, 2
	note F_, 1
	note F_, 1
	music_tempo_2 $6
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $7
	octave 6
	note C_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note C_, 1
	octave 7
	note A_, 1
	music_set_var22_flag6_and_setenvreset $9
	music_tempo_2 $e
	note A#, 1
	music_tempo_2 $7
	note G#, 2
	note G_, 2
	note G#, 1
	note D#, 1
	note C_, 1
	note D#, 1
	note __, 1
	note G#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	call_channel Music_4a9ff
	octave 6
	note G_, 1
	note A#, 1
	note G_, 1
	octave 7
	note C_, 1
	octave 6
	note G_, 1
	octave 7
	note D_, 1
	note D#, 1
	call_channel Music_4a9ff
	octave 7
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 1
	note G#, 1
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note G#, 1
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $9
	note A#, 1
	music_tempo_2 $7
	note G_, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note F_, 3
	note F_, 1
	note __, 1
	note D#, 2
	note F_, 1
	note __, 1
	note C_, 1
	note D_, 1
	note __, 1
	note D#, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 3
	note F_, 1
	note D#, 1
	note D_, 1
	octave 6
	note G_, 1
	octave 7
	note F_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 2
	octave 6
	note G_, 1
	octave 7
	note C_, 1
	note __, 1
	note F_, 1
	note D#, 4
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note A#, 1
	note __, 1
	music_tempo_2 $4
	music_reset_var22_flag6_and_setenvreset $7
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	music_set_var22_flag6_and_setenvreset $9
	music_tempo_2 $7
	octave 8
	note C_, 4
	note __, 1
	note C_, 1
	note C_, 1
	note D_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 7
	note A#, 1
	octave 8
	note C_, 1
	octave 7
	note G_, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note F_, 1
	note G_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 2
	note __, 1
	note C_, 2
	note __, 2
	octave 5
	note A#, 2
	octave 6
	note D#, 2
	note G#, 2
	octave 7
	note C#, 2
	note F#, 2
	octave 7
	note G_, 3
	note __, 1
	note C_, 2
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note F#, 1
	music_tempo_2 $c
	music_set_var22_flag6_and_setenvreset $9
	note G_, 1
	music_tempo_2 $7
	note F_, 3
	note __, 1
	note D#, 2
	note F_, 2
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	note F#, 1
	music_tempo_2 $13
	music_set_var22_flag6_and_setenvreset $9
	note G_, 1
	music_tempo_2 $7
	note A#, 3
	octave 8
	note C_, 2
	octave 7
	note F_, 2
	note D#, 2
	note D_, 2
	octave 6
	note A#, 2
	note G#, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note C_, 1
	note G_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G#, 1
	note D_, 3
	note C_, 3
	octave 6
	note G_, 6
	note G_, 2
	octave 7
	note F#, 2
	note G_, 8
	note __, 2
	note F_, 2
	note C_, 2
	note F_, 2
	note G_, 1
	note A_, 1
	note A#, 1
	octave 8
	note C_, 1
	octave 7
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 6
	note G#, 1
	octave 7
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 2
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note A#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note D#, 1
	note __, 1
	note C_, 1
	note __, 1
	note D#, 1
	note F_, 1
	note G_, 4
	note __, 1
	note G_, 1
	note __, 1
	octave 8
	note C_, 2
	note __, 2
	octave 7
	note G_, 2
	note G_, 1
	note G_, 1
	note __, 2
	note G_, 2
	note G_, 1
	note G_, 1
	note __, 1
	note F_, 3
	jump_channel Music_4a645

MusicHeader_4a02e_Ch3: ; 4a814
	music_tempo_2 $7
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11

Music_4a81f: ; 4a81f
	call_channel Music_4a9f0
	note F_, 2
	octave 6
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note A_, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 1
	octave 5
	note F_, 1
	octave 6
	note A_, 1
	note F_, 1
	note C_, 1
	octave 5
	note F_, 1
	call_channel Music_4a9f0
	note D_, 2
	note F_, 1
	note A_, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note D_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note F_, 1
	octave 6
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	octave 4
	note G_, 1
	note G_, 2
	note G_, 2
	note A_, 1
	note A#, 1
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 5
	note D_, 1
	octave 4
	note F_, 1
	octave 5
	note D#, 1
	octave 4
	note F_, 1
	octave 5
	note F_, 1
	octave 4
	note F_, 1
	octave 5
	note D#, 1
	note D#, 2
	note D#, 2
	note D_, 1
	note C_, 1
	octave 4
	note A#, 1
	note A_, 1
	octave 5
	note D_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	note C_, 1
	octave 4
	note D_, 1
	note A#, 1
	octave 5
	note D_, 1
	note C_, 1
	note C_, 2
	note C_, 2
	octave 4
	note G_, 1
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note D_, 1
	octave 5
	note D_, 1
	note C_, 1
	note D_, 1
	octave 4
	note A_, 1
	octave 5
	note F_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	note D#, 2
	note D#, 2
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note F_, 1
	note F_, 1
	note A_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	note F_, 1
	note F_, 2
	note F_, 2
	octave 5
	note D_, 1
	note C_, 1
	octave 4
	note A_, 1
	note G_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A#, 1
	note G_, 1
	octave 5
	note C_, 1
	note D_, 1
	octave 4
	note G#, 1
	note G#, 2
	note G#, 2
	note G_, 1
	note F_, 1
	note G_, 1
	note D#, 1
	note D#, 1
	octave 5
	note D#, 1
	octave 4
	note A#, 1
	octave 5
	note F_, 1
	octave 4
	note A#, 1
	octave 5
	note D#, 2
	note C#, 2
	note C_, 1
	note C#, 1
	octave 4
	note C#, 1
	octave 5
	note C#, 1
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note D#, 2
	octave 4
	note C#, 1
	octave 5
	note C#, 2
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note C_, 1
	octave 4
	note G#, 1
	octave 5
	note D#, 2
	note F_, 2
	octave 4
	note A#, 1
	octave 5
	note F_, 2
	note G_, 1
	note D#, 1
	note C_, 1
	note G_, 2
	note C_, 1
	note F_, 1
	note G_, 1
	octave 7
	note F_, 2
	note F_, 1
	note __, 1
	note D#, 1
	octave 5
	note C_, 2
	note C_, 3
	note D_, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	octave 4
	note A#, 1
	octave 7
	note F_, 2
	note F_, 1
	note __, 1
	note D#, 1
	octave 4
	note G#, 2
	note G#, 3
	note A#, 1
	note G#, 1
	octave 5
	note C_, 1
	octave 4
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note F_, 1
	note D#, 1
	note F_, 1
	octave 5
	note C_, 1
	octave 4
	note F_, 1
	octave 5
	note D#, 1
	note F_, 1
	octave 4
	note G_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	octave 5
	note D_, 1
	octave 4
	note G_, 1
	octave 5
	note F_, 1
	note G_, 1
	octave 4
	note G#, 1
	octave 5
	note D#, 1
	note A#, 1
	octave 4
	note A#, 1
	octave 5
	note F_, 1
	octave 6
	note C_, 1
	octave 5
	note C_, 1
	note G_, 1
	octave 6
	note D#, 1
	note D_, 1
	note D#, 1
	note C_, 1
	octave 5
	note G_, 1
	note D#, 1
	note F_, 1
	note C_, 1
	octave 5
	note G#, 1
	note G#, 1
	note G_, 1
	note G#, 1
	octave 5
	note D#, 1
	octave 4
	note G#, 1
	octave 5
	note F_, 1
	note G_, 1
	octave 4
	note A#, 1
	note A#, 1
	note G#, 1
	note A#, 1
	octave 5
	note F_, 1
	octave 4
	note A#, 1
	octave 5
	note G_, 1
	note F_, 1
	note C_, 1
	note G_, 1
	octave 6
	note C_, 1
	octave 4
	note A#, 1
	octave 5
	note F_, 1
	octave 6
	note C_, 1
	octave 4
	note A_, 1
	octave 5
	note F_, 1
	note A_, 1
	note F_, 1
	octave 6
	note D#, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	note D#, 1
	note G_, 1
	note C_, 1
	note G_, 1
	octave 6
	note D#, 1
	octave 4
	note G_, 1
	octave 5
	note D_, 1
	octave 6
	note D_, 1
	octave 4
	note F_, 1
	octave 5
	note C_, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 2
	note C_, 1
	note C_, 1
	note C_, 1
	octave 4
	note A#, 1
	octave 5
	note C_, 1
	note __, 2
	note C_, 14
	call_channel Music_4aa19
	music_setrepeat1a $2
	octave 4
	note F_, 1
	note F_, 1
	octave 5
	note C_, 1
	note D#, 1
	octave 4
	note F_, 1
	note D#, 2
	note F_, 1
	note F_, 1
	note F_, 1
	octave 5
	note D_, 1
	note F_, 1
	octave 4
	note F_, 1
	note G_, 2
	note A#, 1
	music_dorepeat1a
	call_channel Music_4aa19
	octave 4
	note F_, 1
	note F_, 1
	octave 5
	note C_, 1
	note D#, 1
	octave 4
	note F_, 1
	note D#, 2
	note D#, 1
	note D#, 1
	note D#, 1
	note A#, 1
	octave 5
	note C#, 1
	octave 4
	note D#, 1
	note F_, 2
	note A#, 1
	octave 4
	note G#, 1
	note G#, 1
	octave 5
	note D#, 1
	note G#, 1
	octave 4
	note G#, 1
	note D#, 2
	note F_, 1
	note F_, 1
	note F_, 1
	octave 5
	note C_, 1
	note F_, 1
	octave 4
	note F_, 1
	note G_, 2
	octave 5
	note C_, 1
	octave 4
	note G_, 1
	note G_, 1
	octave 6
	note D_, 2
	note D_, 1
	note D_, 1
	octave 4
	note G_, 1
	note G_, 1
	octave 6
	note D_, 2
	note D_, 1
	note D_, 1
	octave 4
	note A#, 1
	note B_, 3
	jump_channel Music_4a81f

Music_4a9e0: ; 4a9e0
	music_setrepeat1a $2
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	music_e8 $14
	note __, 1
	music_dorepeat1a
	note G_, 1
	note A#, 1
	note __, 1
	ret_channel

Music_4a9f0: ; 4a9f0
	octave 5
	music_setrepeat1a $2
	note C_, 1
	note C_, 2
	note G_, 1
	octave 6
	note C_, 1
	octave 5
	note G_, 1
	music_dorepeat1a
	note C_, 1
	note D#, 1
	note __, 1
	ret_channel

Music_4a9ff: ; 4a9ff
	octave 8
	note C_, 2
	note C_, 2
	octave 7
	note A#, 1
	octave 8
	note C_, 2
	note __, 2
	ret_channel

Music_4aa08: ; 4aa08
	octave 6
	music_setrepeat1a $2
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	music_e8 $d
	note __, 1
	music_dorepeat1a
	note A#, 1
	octave 7
	note D_, 1
	note __, 1
	ret_channel

Music_4aa19: ; 4aa19
	music_setrepeat1a $2
	octave 5
	note C_, 1
	note C_, 1
	note G_, 1
	note A#, 1
	note C_, 1
	octave 4
	note A#, 2
	octave 5
	note C_, 1
	note C_, 1
	note C_, 1
	note F_, 1
	note A_, 1
	note C_, 1
	octave 4
	note A#, 2
	note G_, 1
	music_dorepeat1a
	ret_channel

Music_4aa2f: ; 4aa2f
	music_setrepeat1a $2
	note G#, 1
	note G#, 1
	note D_, 1
	note C_, 1
	note C_, 1
	note D_, 1
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note C#, 1
	note A#, 2
	note C_, 1
	note G#, 2
	ret_channel

Music_4aa3f: ; 4aa3f
	music_setrepeat1a $3
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note D_, 1
	note C_, 1
	note G#, 2
	ret_channel

MusicHeader_4a02e_Ch6: ; 4aa49
	music_tempo_2 $7

Music_4aa4b: ; 4aa4b
	call_channel Music_4aa2f
	music_setrepeat1a $3
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	call_channel Music_4aa2f
	music_setrepeat1a $2
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note G#, 2
	music_setrepeat1d $3
	call_channel Music_4aa3f
	music_dorepeat1d
	music_setrepeat1a $3
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	music_setrepeat1d $2
	call_channel Music_4aa3f
	music_dorepeat1d
	note G#, 1
	note D_, 1
	note C_, 1
	note A#, 2
	note C_, 1
	note G#, 2
	music_setrepeat1a $2
	note C_, 1
	note D_, 1
	note G#, 2
	music_dorepeat1a
	music_setrepeat1a $2
	note G#, 2
	note C_, 1
	note G#, 2
	music_dorepeat1a
	note G#, 2
	note C_, 1
	note G#, 1
	note G#, 2
	music_setrepeat1a $2
	note G#, 2
	note G#, 2
	note C_, 1
	note G#, 2
	note A#, 2
	note C_, 1
	note G#, 2
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	music_setrepeat1d $4
	call_channel Music_4aa3f
	music_dorepeat1d
	music_setrepeat1a $3
	note G#, 2
	note C_, 1
	music_dorepeat1a
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 5
	note D_, 1
	note C#, 1
	note A#, 2
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	music_setrepeat1d $8
	call_channel Music_4aa3f
	music_dorepeat1d
	note C_, 1
	note D_, 1
	note A#, 2
	note G#, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note A#, 2
	note G#, 1
	note G#, 1
	note D_, 1
	note C_, 1
	note G#, 1
	note G#, 1
	jump_channel Music_4aa4b

MusicHeader_4a038_Ch1: ; 4aacb
	music_tempo_2 $5
	music_fa $b7
	music_fb $11, $13, $2, $12
	music_e8 $4
	octave 6
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note A_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note G#, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note G_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note G_, 1
	note __, 1
	note E_, 3
	music_set_var22_flag6_and_setenvreset $6
	note G_, 1
	music_setrepeat1a $7
	note E_, 1
	note G_, 1
	music_dorepeat1a
	music_setrepeat1a $3
	note D#, 1
	note G_, 1
	music_dorepeat1a
	note E_, 1
	note F_, 1
	music_setrepeat1a $4
	note A_, 1
	note F_, 1
	music_dorepeat1a
	note A_, 2
	note __, 2
	music_e8 $0
	note __, 4
	music_e8 $1d
	music_set_var22_flag6_and_setenvreset $7

Music_4ab17: ; 4ab17
	octave 5
	note A#, 2
	note A_, 1
	note __, 1
	octave 6
	note D#, 2
	note D_, 1
	note __, 1
	note G_, 2
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note F_, 2
	note D_, 1
	note __, 1
	note D_, 2
	octave 5
	note A#, 1
	note __, 1
	note A#, 2
	octave 6
	note D_, 1
	note __, 1
	octave 5
	note A_, 2
	note F_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note F_, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note D#, 2
	note C_, 1
	note __, 1
	note D_, 2
	octave 5
	note D#, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G_, 1
	note __, 1
	note A#, 2
	note D#, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G_, 1
	note __, 1
	note A_, 2
	note F_, 1
	note __, 1
	note A#, 2
	note A_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 6
	note D#, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note D_, 2
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note G_, 2
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note F_, 2
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note D#, 2
	octave 5
	note A#, 1
	note __, 1
	octave 6
	note D_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 6
	note F_, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note D#, 2
	octave 5
	note F_, 1
	note __, 1
	octave 6
	note D_, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note D_, 2
	octave 5
	note G_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note G_, 1
	note __, 1
	octave 5
	note A#, 2
	octave 6
	note G_, 4
	octave 5
	note G_, 1
	octave 6
	note G_, 1
	note __, 1
	octave 5
	note G_, 1
	note A#, 2
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 2
	note C_, 2
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	note A_, 2
	note __, 2
	note A#, 4
	note D#, 1
	note __, 1
	note G_, 2
	note D#, 1
	note __, 1
	note A#, 2
	note D#, 1
	note __, 1
	octave 7
	note C_, 2
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note D_, 2
	octave 6
	note A#, 2
	note __, 2
	note A_, 2
	note __, 2
	note A_, 2
	note __, 2
	note C_, 3
	octave 6
	note G_, 1
	note C_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note G_, 1
	octave 7
	note C_, 1
	note E_, 1
	note C_, 1
	octave 6
	note G_, 1
	note E_, 1
	note G_, 1
	note E_, 1
	note C_, 1
	note D_, 1
	music_setrepeat1a $3
	octave 6
	note D#, 1
	note D_, 1
	octave 5
	note A#, 1
	note G_, 1
	music_dorepeat1a
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note G_, 1
	music_setrepeat1a $3
	octave 6
	note D#, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	music_dorepeat1a
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note D_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	octave 6
	note F_, 1
	note C_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	note A_, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note C_, 1
	octave 5
	note G_, 1
	octave 6
	note C_, 1
	note E_, 1
	note C_, 1
	octave 5
	note E_, 1
	note __, 1
	note F_, 2
	note E_, 1
	note __, 1
	octave 6
	note C_, 2
	octave 5
	note A_, 1
	note __, 1
	note A#, 1
	note G_, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note F_, 1
	note D_, 1
	note D#, 1
	note C_, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	octave 5
	note A_, 1
	note A#, 1
	note G_, 1
	note A_, 1
	octave 6
	note C_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	octave 6
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note F_, 1
	note A_, 1
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	octave 6
	note F_, 1
	note C_, 1
	octave 5
	note A_, 1
	note F_, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 2
	octave 5
	note D#, 1
	note G#, 1
	music_f9 $a, 5, 6
	octave 6
	note D#, 8
	note __, 2
	music_e8 $0
	note __, 2
	note __, 16
	note __, 2
	music_e8 $1d
	note A_, 1
	note __, 1
	note A#, 1
	note A_, 1
	note G_, 1
	note __, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note D_, 2
	note C_, 1
	note __, 1
	note D_, 2
	note E_, 1
	note __, 1
	note F_, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 5
	note A#, 1
	octave 5
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D_, 2
	note C_, 1
	octave 6
	note A#, 1
	note A_, 4
	note F_, 2
	note G_, 1
	note A_, 2
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 2
	note E_, 1
	note __, 1
	note F_, 2
	note G_, 2
	note F_, 2
	note E_, 1
	note __, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 2
	note E_, 1
	note __, 1
	note D_, 2
	note E_, 1
	note __, 1
	note D_, 2
	octave 5
	note A_, 1
	note __, 1
	octave 6
	note D_, 1
	note E_, 1
	note F_, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 2
	note C_, 1
	note __, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note A#, 1
	octave 5
	note A_, 1
	note G_, 1
	note A_, 1
	octave 6
	note A#, 1
	note C_, 1
	octave 7
	note C_, 1
	note __, 1
	note C_, 1
	note __, 1
	note C_, 2
	note __, 2
	jump_channel Music_4ab17

MusicHeader_4a038_Ch2: ; 4aced
	music_tempo_2 $5
	music_fa $79
	music_fb $11, $14, $2, $12
	music_e8 $4
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note E_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note D#, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note D_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note D_, 1
	note __, 1
	music_f9 $14, 5, 5
	note C_, 16
	note __, 2
	octave 6
	note A#, 4
	note __, 2
	octave 7
	note C_, 12
	note __, 2
	music_e8 $0
	note __, 4
	music_e8 $1d

Music_4ad2c: ; 4ad2c
	octave 6
	note G_, 2
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	music_fb $11, $14, $2, $11
	music_f9 $f, 5, 4
	octave 7
	note D_, 6
	note __, 2
	octave 6
	note G_, 4
	octave 7
	note D_, 1
	note __, 1
	note F_, 4
	note F_, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note C_, 2
	note __, 2
	octave 6
	note A#, 2
	octave 7
	note C_, 2
	note __, 2
	note D_, 2
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	note G_, 4
	note G_, 2
	note F_, 2
	note __, 2
	note G_, 2
	note __, 2
	note A_, 2
	note __, 2
	note A#, 6
	note A_, 2
	note A#, 2
	octave 7
	note C_, 2
	note D_, 2
	note G_, 2
	note F_, 2
	note __, 2
	note D#, 2
	note __, 2
	note D_, 2
	note __, 2
	note C_, 4
	octave 6
	note G_, 2
	note A_, 2
	note A#, 2
	octave 7
	note C_, 2
	note D_, 2
	octave 6
	note G_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note F_, 14
	note G_, 2
	note A_, 2
	call_channel Music_4b004
	note __, 2
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note G_, 12
	note __, 2
	note G_, 2
	note A_, 1
	note __, 1
	call_channel Music_4b004
	note A#, 2
	octave 8
	note C_, 4
	octave 7
	note A#, 2
	octave 8
	note C_, 2
	note D_, 12
	note __, 2
	octave 7
	note D_, 4
	note C_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note __, 2
	note C_, 2
	octave 6
	note A#, 2
	octave 7
	note C_, 8
	note __, 2
	octave 6
	note A#, 2
	note __, 2
	note A_, 1
	note __, 1
	note A#, 4
	octave 7
	note C_, 2
	note D_, 2
	note F_, 4
	note E_, 2
	note F_, 2
	note G_, 6
	note __, 2
	octave 6
	note G_, 1
	note __, 1
	note A_, 2
	note G_, 1
	note __, 1
	octave 7
	note D_, 2
	octave 6
	note F_, 1
	note __, 1
	note G_, 2
	note A_, 2
	note A#, 2
	octave 7
	note C_, 2
	note D_, 2
	note G_, 2
	note D_, 2
	note C_, 6
	note F_, 2
	note C_, 2
	octave 6
	note A_, 1
	note __, 1
	octave 7
	note C_, 2
	octave 6
	note A#, 2
	note A_, 2
	note G_, 2
	note A_, 2
	note __, 2
	note A#, 2
	note __, 2
	octave 7
	note C_, 2
	note __, 2
	note D_, 6
	note __, 2
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	octave 6
	note A#, 1
	music_tempo_2 $26
	music_set_var22_flag6_and_setenvreset $9
	octave 7
	note C_, 1
	music_tempo_2 $5
	note __, 2
	music_fb $11, $14, $1, $11
	music_e8 $0
	music_fa $b9
	note __, 1
	music_e8 $1d
	octave 4
	note G_, 1
	note __, 1
	octave 5
	note D_, 2
	octave 4
	note G_, 1
	note A_, 1
	octave 6
	note D_, 2
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note C_, 1
	note A#, 1
	music_fa $79
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 1
	note __, 1
	note D_, 1
	note __, 1
	note E_, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	octave 8
	note C_, 1
	octave 7
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 6
	note A_, 1
	note G_, 1
	note A_, 1
	octave 7
	note C_, 1
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	octave 7
	note G_, 1
	note E_, 1
	note C_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note F_, 1
	note G_, 1
	note __, 1
	music_reset_var22_flag6_and_setenvreset $5
	note G_, 1
	note D_, 1
	note C_, 1
	music_set_var22_flag6_and_setenvreset $9
	note F_, 1
	note __, 1
	note E_, 1
	note D_, 6
	note __, 1
	note E_, 2
	note D_, 1
	note __, 1
	note E_, 1
	note F_, 1
	note __, 1
	octave 6
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A_, 2
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note A_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F_, 1
	note __, 1
	note D_, 1
	note __, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note __, 1
	octave 7
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note E_, 2
	note __, 2
	music_e8 $0
	note __, 2
	music_e8 $1d
	note F_, 2
	note __, 2
	note E_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 2
	note __, 2
	jump_channel Music_4ad2c

MusicHeader_4a038_Ch3: ; 4ae86
	music_tempo_2 $5
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	music_setrepeat1a $2
	octave 4
	note G_, 2
	octave 5
	note G_, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note F_, 2
	note G_, 1
	note __, 1
	note A#, 2
	note G_, 4
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F#, 1
	note __, 1
	music_setrepeat1a $2
	octave 4
	note G_, 2
	octave 5
	note G_, 1
	note __, 1
	music_dorepeat1a
	octave 4
	note F_, 2
	note G_, 1
	note __, 1
	note A#, 2
	note G_, 4
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note D#, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F#, 1
	note __, 1
	octave 4
	note F_, 2
	note __, 6

Music_4aed4: ; 4aed4
	octave 4
	note G_, 2
	note G_, 1
	note __, 1
	note F_, 4
	call_channel Music_4b022
	call_channel Music_4b014
	music_setrepeat1a $2
	octave 4
	note D#, 2
	note A#, 1
	note __, 1
	note D#, 2
	octave 5
	note C#, 1
	note D#, 1
	music_dorepeat1a
	call_channel Music_4b014
	call_channel Music_4b022
	call_channel Music_4b014
	octave 5
	music_setrepeat1a $3
	note E_, 2
	note C_, 1
	note __, 1
	music_dorepeat1a
	note E_, 2
	note D#, 4
	octave 4
	note A#, 1
	note __, 1
	note D#, 1
	note A#, 1
	octave 5
	note D#, 2
	octave 4
	note F_, 2
	octave 5
	note C_, 1
	note __, 1
	octave 5
	note F_, 1
	note C_, 1
	octave 4
	note F_, 2
	octave 5
	note G_, 2
	note G_, 2
	note __, 2
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note D#, 4
	octave 4
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	octave 5
	note G_, 2
	octave 4
	note A#, 2
	octave 5
	note D#, 2
	note F_, 2
	note G_, 2
	note G_, 2
	note __, 2
	note F_, 2
	note __, 2
	note F_, 2
	note __, 2
	note E_, 4
	note C_, 2
	note G_, 2
	note E_, 2
	octave 6
	note C_, 2
	octave 5
	note G_, 2
	note C_, 2
	note D_, 2
	music_setrepeat1a $2
	octave 5
	note D#, 2
	note D#, 2
	octave 4
	note D#, 1
	note A#, 1
	octave 5
	note D#, 2
	octave 4
	note D#, 2
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	music_dorepeat1a
	note G_, 2
	note G_, 2
	note G_, 1
	octave 5
	note D_, 1
	note A#, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	note G_, 2
	note D_, 2
	note C_, 2
	note C_, 2
	octave 4
	note C_, 1
	note G_, 1
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	note G_, 2
	note C_, 2
	octave 4
	note D#, 2
	note D#, 2
	note D#, 1
	note A#, 1
	octave 5
	note D#, 2
	octave 4
	note D#, 2
	note A#, 2
	octave 5
	note D#, 2
	octave 4
	note A#, 2
	octave 5
	note D_, 2
	note D_, 2
	octave 4
	note D_, 1
	note A_, 1
	octave 5
	note D_, 2
	octave 4
	note D_, 2
	note A_, 2
	octave 5
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note C_, 2
	note C_, 2
	octave 4
	note C_, 1
	note G_, 1
	octave 5
	note C_, 2
	octave 4
	note C_, 2
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note G_, 2
	note G#, 2
	note G#, 2
	note G#, 1
	octave 5
	note D#, 1
	note G#, 2
	octave 4
	note F_, 2
	octave 5
	note C_, 2
	note A_, 2
	note C_, 2
	octave 4
	note G_, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 1
	note A_, 2
	note A#, 2
	octave 5
	note C_, 2
	note D_, 2
	note F_, 2
	note G_, 1
	note A_, 1
	note G_, 1
	note F_, 2
	note G_, 1
	note F_, 1
	note E_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	octave 4
	note A_, 1
	octave 5
	note E_, 2
	note C_, 2
	note D_, 2
	note D_, 2
	note C_, 1
	note D_, 2
	note E_, 2
	note D_, 2
	note C_, 1
	octave 4
	note A#, 1
	note A_, 2
	note G#, 1
	note G_, 2
	octave 5
	note G_, 2
	octave 4
	note A_, 2
	octave 5
	note A_, 2
	octave 4
	note A#, 2
	octave 5
	note A#, 2
	octave 5
	note C_, 2
	octave 6
	note C_, 2
	octave 5
	note D_, 2
	note C_, 1
	note D_, 2
	octave 4
	note A_, 2
	octave 5
	note D_, 1
	octave 4
	note A_, 2
	octave 5
	note C_, 1
	note D_, 2
	note C_, 1
	octave 4
	note A#, 1
	note A_, 1
	note G_, 2
	note F_, 2
	note G_, 2
	note A#, 2
	octave 5
	note D_, 2
	note F_, 2
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	note D_, 2
	note D_, 1
	note __, 1
	note C_, 2
	note D_, 2
	note F_, 2
	note E_, 2
	note D_, 2
	note C#, 2
	note C_, 2
	note G_, 2
	note C_, 2
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note A#, 2
	note A_, 2
	octave 5
	note C_, 2
	note D_, 2
	note A_, 2
	note D_, 2
	note __, 2
	jump_channel Music_4aed4

Music_4b004: ; 4b004
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $7
	octave 8
	note C_, 1
	music_tempo_2 $8
	octave 7
	music_set_var22_flag6_and_setenvreset $9
	note A#, 1
	music_tempo_2 $5
	note A_, 2
	ret_channel

Music_4b014: ; 4b014
	music_setrepeat1a $2
	octave 4
	note F_, 2
	octave 5
	note C_, 1
	note __, 1
	octave 4
	note F_, 2
	octave 5
	note D#, 1
	note F_, 1
	music_dorepeat1a
	ret_channel

Music_4b022: ; 4b022
	music_setrepeat1a $2
	octave 4
	note G_, 2
	octave 5
	note D_, 1
	note __, 1
	octave 4
	note G_, 2
	octave 5
	note F_, 1
	note G_, 1
	music_dorepeat1a
	ret_channel

MusicHeader_4a038_Ch6: ; 4b030
	music_tempo_2 $5
	music_setrepeat1a $8
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	music_dorepeat1a
	music_setrepeat1a $3
	note G#, 2
	note C_, 2
	music_dorepeat1a

Music_4b03e: ; 4b03e
	note G#, 1
	note G#, 1
	note C_, 2
	music_setrepeat1a $7
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note C_, 2
	note G#, 2
	note G#, 2
	note D_, 1
	note C#, 1
	note C_, 2
	note G#, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note D_, 1
	note C_, 1
	note A#, 2
	note C#, 2
	note A#, 2
	note C#, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note C_, 2
	note G#, 2
	note G#, 2
	note D_, 1
	note C_, 1
	note A#, 2
	note C#, 2
	note A#, 2
	note C#, 2
	note C_, 2
	note G#, 2
	note G#, 2
	note D_, 1
	note C#, 1
	note C_, 2
	note G#, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note G#, 2
	note A#, 2
	music_setrepeat1a $7
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 1
	note G#, 1
	note A#, 2
	music_setrepeat1a $7
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	music_setrepeat1a $11
	note C_, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note G#, 2
	note D_, 2
	note C_, 2
	note G#, 2
	note G#, 2
	note D_, 2
	music_setrepeat1a $3
	note C_, 2
	note C_, 2
	note G#, 2
	note D_, 2
	music_dorepeat1a
	note C_, 2
	note C_, 2
	note G#, 2
	note G#, 1
	note G#, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note D_, 1
	note C#, 1
	note C_, 2
	note G#, 2
	note D_, 1
	note D_, 1
	note G#, 2
	note G#, 2
	note G#, 2
	note G#, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note C_, 2
	jump_channel Music_4b03e

MusicHeader_4a042_Ch1: ; 4b0c4
	music_tempo_2 $6
	music_fa $38
	music_fb $11, $13, $2, $12
	music_e8 $c
	octave 5
	note F#, 2
	note __, 1
	music_e8 $12
	note A_, 2
	note __, 1
	note G#, 2
	note __, 1
	octave 6
	note D_, 2
	note __, 1
	note C#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	call_channel Music_4b418

Music_4b0e3: ; 4b0e3
	call_channel Music_4b428
	music_fa $38
	octave 5
	note F#, 1
	note __, 2
	note A_, 1
	note __, 2
	note G#, 1
	note __, 2
	octave 6
	note D_, 1
	note __, 2
	note C#, 1
	note __, 1
	octave 5
	note G_, 1
	note __, 1
	call_channel Music_4b418
	call_channel Music_4b428
	call_channel Music_4b44b
	call_channel Music_4b441
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	call_channel Music_4b441
	octave 6
	note D_, 1
	note E_, 1
	note F#, 1
	note E_, 1
	note F#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1
	note G#, 1
	note E_, 1
	note F#, 1
	note __, 1
	note D_, 1
	note __, 1
	octave 5
	note B_, 1
	note A_, 1
	note B_, 1
	octave 6
	note D_, 1
	note E_, 1
	note __, 1
	octave 5
	note B_, 3
	note __, 2
	octave 6
	note D#, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note C_, 1
	octave 6
	note A#, 1
	note A_, 1
	note F_, 1
	note G_, 1
	note __, 1
	note D#, 1
	note __, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D#, 1
	note F_, 1
	note __, 1
	note C_, 3
	note __, 2
	music_f9 $c, 5, 6
	note E_, 14
	note D#, 1
	note D_, 1
	note C#, 10
	note __, 2
	note G_, 1
	note G#, 1
	note C#, 1
	note __, 1
	note C#, 2
	note __, 2
	note D_, 2
	note __, 2
	note C#, 2
	note __, 2
	note C_, 2
	note __, 2
	music_reset_var22_flag6_and_setenvreset $6
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 3
	octave 5
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 3
	note G_, 1
	note F#, 1
	note F_, 1
	music_set_var22_flag6_and_setenvreset $7
	music_setrepeat1a $4
	note F#, 1
	note B_, 1
	note F#, 2
	note A_, 2
	note G#, 1
	note G_, 2
	note F#, 2
	octave 4
	note B_, 1
	octave 5
	note D_, 2
	note C#, 2
	music_dorepeat1a
	call_channel Music_4b44b
	call_channel Music_4b441
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	call_channel Music_4b441
	octave 6
	note F_, 1
	note __, 1
	note F#, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	octave 7
	note A_, 1
	note D#, 1
	note A_, 1
	note D#, 1
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $a
	note A_, 1
	note D#, 1
	music_dorepeat1a
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note F#, 1
	note __, 1
	note G_, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	octave 7
	note A#, 1
	note C_, 1
	note A#, 1
	note C_, 1
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $a
	note A#, 1
	note C_, 1
	music_dorepeat1a
	music_tempo_2 $6
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	octave 7
	note B_, 1
	note F_, 1
	note B_, 1
	note F_, 1
	music_reset_var22_flag6_and_setenvreset $3
	music_setrepeat1a $a
	note B_, 1
	note F_, 1
	music_dorepeat1a
	music_tempo_2 $6
	octave 7
	music_set_var22_flag6_and_setenvreset $4
	note C#, 1
	note D_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $5
	note C#, 1
	note D_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $6
	note C#, 1
	note D_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $7
	note C#, 1
	note D_, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $8
	note C#, 1
	note D_, 1
	music_set_var22_flag6_and_setenvreset $9
	note C#, 1
	note D_, 1
	jump_channel Music_4b0e3

MusicHeader_4a042_Ch2: ; 4b1ff
	music_tempo_2 $6
	music_fa $78
	music_fb $11, $13, $2, $12
	music_e8 $c
	octave 5
	note B_, 2
	note __, 1
	music_e8 $12
	octave 6
	note D_, 2
	note __, 1
	note C#, 2
	note __, 1
	note G_, 2
	note __, 1
	note F#, 1
	note __, 1
	note C_, 1
	note __, 1
	call_channel Music_4b3e7
	music_f9 $c, 5, 4

Music_4b220: ; 4b220
	music_fa $b8
	octave 6
	note F#, 5
	note __, 1
	note B_, 5
	note __, 1
	call_channel Music_4b3f7
	note F_, 10
	note __, 2
	note C#, 4
	music_fa $78
	octave 5
	note B_, 1
	note __, 2
	octave 6
	note D_, 1
	note __, 2
	note C#, 1
	note __, 2
	note G_, 1
	note __, 2
	note F#, 1
	note __, 1
	note C_, 1
	note __, 1
	call_channel Music_4b3e7
	music_fa $b8
	octave 6
	note F#, 5
	note __, 1
	note B_, 5
	note __, 1
	octave 7
	call_channel Music_4b3f7
	note F_, 10
	note __, 2
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	call_channel Music_4b40f
	call_channel Music_4b405
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	call_channel Music_4b405
	octave 6
	note F#, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note B_, 1
	note A_, 1
	note B_, 1
	octave 7
	note C#, 1
	octave 6
	note B_, 1
	octave 7
	note C#, 1
	note D#, 1
	note E_, 1
	note D#, 1
	note C#, 1
	octave 6
	note B_, 1
	note A_, 1
	note B_, 1
	note __, 1
	note F#, 3
	note __, 2
	music_e8 $0
	note __, 8
	music_e8 $12
	note G_, 1
	note A_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	note D_, 1
	note C_, 1
	note D_, 1
	note E_, 1
	note F_, 1
	note E_, 1
	note D_, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note C_, 1
	note __, 1
	octave 6
	note G_, 3
	note __, 2
	music_e8 $0
	note __, 8
	music_e8 $12
	note G#, 1
	octave 7
	note C#, 1
	note __, 1
	note C_, 1
	note __, 1
	octave 6
	note B_, 1
	note __, 1
	note A#, 3
	note A_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 7
	note C#, 1
	note G#, 1
	note __, 1
	note G_, 1
	note __, 1
	note F#, 1
	note __, 1
	note E_, 3
	note C#, 1
	note __, 1
	note C_, 1
	note C#, 1
	octave 6
	note G#, 1
	note __, 1
	note G_, 2
	note D#, 1
	note __, 1
	note G#, 2
	note E_, 1
	note __, 1
	note G_, 2
	note D#, 1
	note __, 1
	note F#, 2
	note D_, 1
	note __, 1
	note A#, 2
	note G_, 1
	note __, 1
	note A_, 2
	note F#, 1
	note __, 1
	note G#, 2
	note F_, 1
	note __, 1
	note G_, 2
	note E_, 1
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note F_, 1
	note G#, 1
	octave 7
	note D_, 1
	octave 6
	note B_, 8
	note __, 2
	note A#, 1
	note A_, 1
	note G#, 10
	note __, 2
	octave 7
	note G#, 1
	note D_, 1
	note E_, 1
	octave 6
	note A#, 1
	octave 7
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $6
	note C#, 1
	music_tempo_2 $16
	music_set_var22_flag6_and_setenvreset $8
	note D_, 1
	music_tempo_2 $6
	note __, 2
	octave 6
	note B_, 4
	note __, 2
	note B_, 1
	octave 7
	note D_, 1
	note F#, 1
	note A_, 1
	note G#, 10
	note __, 2
	note G#, 1
	note D_, 1
	octave 6
	note G#, 1
	note D_, 1
	call_channel Music_4b40f
	call_channel Music_4b405
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	call_channel Music_4b405
	note A_, 1
	note __, 1
	note A#, 1
	note __, 1
	music_e8 $0
	note __, 12
	music_e8 $12
	note A#, 1
	note __, 1
	note B_, 1
	note __, 1
	music_e8 $0
	note __, 12
	music_e8 $12
	note B_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	music_e8 $0
	note __, 8
	music_e8 $12
	note F#, 1
	note C_, 1
	octave 6
	note F#, 1
	note C_, 1
	octave 7
	music_set_var22_flag6_and_setenvreset $4
	note G_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $5
	note G_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $6
	note G_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $7
	note G_, 1
	note G#, 1
	note __, 1
	music_set_var22_flag6_and_setenvreset $8
	note G_, 1
	note G#, 1
	music_set_var22_flag6_and_setenvreset $9
	note G_, 1
	note G#, 1
	jump_channel Music_4b220

MusicHeader_4a042_Ch3: ; 4b35a
	music_tempo_2 $6
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	octave 4
	note B_, 3
	octave 5
	note D_, 3
	note C#, 3
	note G_, 3
	note F#, 2
	note C_, 2
	octave 4
	music_setrepeat1a $4
	note B_, 1
	note B_, 2
	music_dorepeat1a
	note B_, 1
	note B_, 1
	note B_, 1
	note B_, 1

Music_4b377: ; 4b377
	call_channel Music_4b454
	music_setrepeat1a $10
	note B_, 1
	note F#, 1
	music_dorepeat1a
	call_channel Music_4b454
	call_channel Music_4b45f
	call_channel Music_4b454
	music_setrepeat1a $8
	octave 4
	note G_, 1
	octave 5
	note C_, 1
	note D#, 1
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $8
	octave 4
	note G#, 1
	octave 5
	note C#, 1
	note E_, 1
	note C#, 1
	music_dorepeat1a
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note G#, 2
	octave 5
	note C#, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 2
	octave 4
	note F#, 2
	note B_, 2
	note A#, 2
	octave 5
	note E_, 2
	octave 4
	note A_, 2
	octave 5
	note D#, 2
	octave 4
	note G#, 2
	octave 5
	note D_, 2
	octave 4
	note G_, 2
	octave 5
	note C#, 2
	music_setrepeat1a $4
	octave 4
	note B_, 1
	octave 5
	note F#, 1
	octave 4
	note B_, 2
	octave 5
	note D_, 2
	note C#, 1
	note C_, 2
	octave 4
	note B_, 2
	note F#, 1
	note A_, 2
	note G#, 2
	music_dorepeat1a
	call_channel Music_4b45f
	octave 4
	note D_, 2
	note D#, 2
	note __, 12
	note D#, 2
	note E_, 2
	note __, 12
	note E_, 2
	note F_, 2
	note __, 12
	octave 5
	note B_, 1
	note A#, 2
	note A_, 1
	note G#, 2
	note G_, 1
	note F#, 2
	note F_, 1
	note E_, 2
	note D#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	jump_channel Music_4b377

Music_4b3e7: ; 4b3e7
	octave 5
	note B_, 1
	note __, 2
	octave 6
	note D_, 1
	note __, 2
	note C#, 1
	note __, 2
	note G_, 1
	note __, 2
	note F#, 1
	octave 7
	note C#, 1
	note E_, 1
	note A#, 1
	ret_channel

Music_4b3f7: ; 4b3f7
	note F#, 3
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $6
	note G_, 1
	music_tempo_2 $4
	music_set_var22_flag6_and_setenvreset $8
	note F#, 1
	music_tempo_2 $6
	ret_channel

Music_4b405: ; 4b405
	note G_, 1
	note __, 1
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	note G_, 1
	note __, 1
	ret_channel

Music_4b40f: ; 4b40f
	octave 6
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	ret_channel

Music_4b418: ; 4b418
	octave 5
	note F#, 1
	note __, 2
	note A_, 1
	note __, 2
	note G#, 1
	note __, 2
	octave 6
	note D_, 1
	note __, 2
	note D_, 1
	note G_, 1
	octave 7
	note C_, 1
	note F#, 1
	ret_channel

Music_4b428: ; 4b428
	music_fa $77
	music_setrepeat1a $2
	octave 5
	note B_, 1
	octave 6
	note C#, 1
	note __, 1
	note D_, 1
	note E_, 1
	note __, 1
	music_dorepeat1a
	octave 5
	note B_, 1
	note __, 1
	note B_, 1
	octave 6
	note D_, 1
	note C#, 4
	octave 5
	note G#, 4
	note F_, 4
	note G#, 4
	ret_channel

Music_4b441: ; 4b441
	note A#, 1
	note __, 1
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	note A#, 1
	note __, 1
	ret_channel

Music_4b44b: ; 4b44b
	octave 5
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	ret_channel

Music_4b454: ; 4b454
	music_setrepeat1a $8
	octave 4
	note F#, 1
	note B_, 1
	octave 5
	note D_, 1
	octave 4
	note B_, 1
	music_dorepeat1a
	ret_channel

Music_4b45f: ; 4b45f
	octave 4
	note F#, 1
	octave 5
	note C#, 1
	note F#, 1
	note C#, 1
	octave 4
	note F#, 1
	octave 5
	note C#, 1
	note F#, 1
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	octave 4
	note G_, 1
	octave 5
	note G_, 1
	note C#, 1
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	note G_, 1
	note C#, 1
	octave 4
	note G#, 1
	octave 5
	note D_, 1
	note G#, 1
	note D_, 1
	octave 4
	note G#, 1
	octave 5
	note D_, 1
	note G#, 1
	music_setrepeat1a $2
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	note G_, 1
	music_dorepeat1a
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	octave 4
	note G_, 1
	ret_channel

Music_4b493: ; 4b493
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note C_, 2
	note D_, 1
	note C#, 1
	note C_, 2
	ret_channel

Music_4b49c: ; 4b49c
	music_setrepeat1a $3
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C_, 2
	note C#, 1
	note D_, 2
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C_, 2
	note D_, 1
	note C_, 2
	note G#, 1
	note G#, 1
	note G#, 2
	ret_channel

MusicHeader_4a042_Ch6: ; 4b4b6
	music_tempo_2 $6
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 4
	note C_, 2
	note D_, 2
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note F_, 1
	note F_, 1
	note F#, 1
	note F#, 1
	note G_, 1
	note G_, 1
	note G#, 1
	note G#, 1

Music_4b4ca: ; 4b4ca
	music_setrepeat1a $3
	call_channel Music_4b493
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	call_channel Music_4b493
	note G#, 1
	note G#, 1
	note G#, 2
	call_channel Music_4b493
	note G#, 2
	note D_, 1
	note C#, 1
	call_channel Music_4b493
	note G#, 1
	note C_, 1
	note A#, 2
	music_setrepeat1a $8
	note C_, 1
	note D_, 1
	note E_, 2
	music_dorepeat1a
	call_channel Music_4b49c
	music_setrepeat1a $4
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	music_setrepeat1a $7
	note C_, 1
	note C#, 1
	note E_, 2
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note G#, 2
	call_channel Music_4b49c
	music_setrepeat1a $8
	note C_, 1
	note D_, 1
	note E_, 2
	music_dorepeat1a
	music_setrepeat1d $2
	note G#, 2
	note G#, 2
	music_setrepeat1a $4
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note C_, 2
	note C_, 2
	music_dorepeat1d
	note G#, 2
	note G#, 2
	music_setrepeat1a $4
	note D_, 1
	note C#, 1
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note G#, 2
	music_setrepeat1a $4
	note G#, 1
	note G#, 2
	music_dorepeat1a
	note G#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	jump_channel Music_4b4ca

MusicHeader_4a04c_Ch1: ; 4b52b
	music_tempo_2 $9
	music_fb $11, $12, $4, $11
	music_e8 $6

Music_4b534: ; 4b534
	music_fa $76
	octave 5
	music_setrepeat1a $10
	note D#, 1
	note C_, 1
	note G_, 1
	music_e8 $18
	note F#, 1
	note D#, 1
	note C_, 1
	music_dorepeat1a
	music_fa $38
	music_fb $11, $13, $4, $11
	octave 5
	note A#, 1
	note A#, 1
	octave 7
	note C#, 1
	note G_, 1
	note __, 1
	octave 5
	note A#, 1
	note A#, 1
	note __, 1
	note A#, 2
	call_channel Music_4b7c0
	octave 6
	note C_, 1
	note C_, 1
	octave 7
	note D#, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note C_, 1
	note __, 1
	note C_, 2
	call_channel Music_4b7c0
	music_fa $37
	octave 5
	music_setrepeat1a $18
	note C_, 1
	note D#, 1
	music_dorepeat1a
	octave 6
	note C#, 2
	note __, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	note C#, 2
	note __, 2
	note C_, 2
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 1
	octave 5
	note B_, 1
	octave 6
	note C_, 2
	note __, 2
	note D#, 2
	note __, 1
	octave 5
	note B_, 1
	octave 6
	note D#, 1
	octave 5
	note B_, 1
	octave 6
	note D#, 1
	octave 5
	note B_, 1
	octave 6
	note D#, 2
	note __, 2
	note D_, 2
	note __, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 2
	note __, 2
	octave 7
	note F#, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	music_e8 $0
	note __, 6
	music_e8 $18
	note A#, 1
	note __, 2
	octave 5
	note A#, 1
	note __, 1
	music_e8 $0
	note __, 5
	music_e8 $18
	octave 7
	note F_, 1
	note __, 1
	octave 6
	note C#, 1
	note __, 1
	music_e8 $0
	note __, 6
	music_e8 $18
	note A_, 1
	note __, 2
	octave 5
	note A_, 1
	note __, 1
	music_e8 $0
	note __, 5
	note __, 3
	music_e8 $18
	music_tempo_2 $5
	music_reset_var22_flag6_and_setenvreset $5
	octave 4
	note A_, 1
	octave 5
	note D#, 1
	note A_, 1
	music_tempo_2 $4
	octave 6
	note D#, 1
	note A_, 1
	octave 7
	note D#, 1
	music_f9 $12, 5, 5
	music_tempo_2 $9
	note A_, 10
	music_set_var22_flag6_and_setenvreset $6
	note __, 2
	jump_channel Music_4b534

MusicHeader_4a04c_Ch2: ; 4b5e7
	music_tempo_2 $9
	music_f9 $12, 5, 5
	music_e8 $19

Music_4b5ee: ; 4b5ee
	music_fa $b8
	music_fb $11, $13, $2, $11
	call_channel Music_4b7a6
	note C_, 10
	note __, 1
	octave 5
	music_reset_var22_flag6_and_setenvreset $6
	music_tempo_2 $5
	note B_, 1
	music_tempo_2 $4
	note A#, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	note A_, 10
	note __, 2
	call_channel Music_4b7a6
	note G_, 1
	music_reset_var22_flag6_and_setenvreset $6
	music_tempo_2 $5
	note G#, 1
	music_tempo_2 $4
	note A_, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	note A#, 9
	music_reset_var22_flag6_and_setenvreset $6
	music_tempo_2 $5
	note A_, 1
	music_tempo_2 $4
	note G#, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	note G_, 9
	note __, 1
	music_tempo_2 $5
	music_reset_var22_flag6_and_setenvreset $6
	note C_, 1
	note F#, 1
	music_tempo_2 $4
	note B_, 1
	octave 7
	note F#, 1
	music_tempo_2 $9
	music_fb $11, $13, $3, $11
	music_fa $78
	octave 6
	note G_, 1
	note G_, 1
	music_set_var22_flag6_and_setenvreset $5
	octave 5
	note A#, 1
	note A#, 1
	note A#, 1
	octave 6
	music_set_var22_flag6_and_setenvreset $8
	note G_, 1
	note G_, 1
	note __, 1
	note G_, 2
	call_channel Music_4b7b0
	note A_, 1
	note A_, 1
	music_set_var22_flag6_and_setenvreset $5
	note C_, 1
	note C_, 1
	note C_, 1
	music_set_var22_flag6_and_setenvreset $8
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 2
	call_channel Music_4b7b0
	octave 6
	octave 6
	note C_, 1
	note D#, 1
	note A#, 4
	note C_, 1
	note D#, 1
	note A_, 4
	note C_, 1
	note D#, 1
	note G#, 4
	note C_, 1
	note D#, 1
	note G_, 3
	music_tempo_2 $5
	music_reset_var22_flag6_and_setenvreset $6
	note G#, 1
	music_tempo_2 $4
	note G_, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	note F#, 7
	note __, 1
	note A_, 2
	octave 7
	note C_, 2
	note D#, 8
	note __, 2
	music_tempo_2 $5
	music_reset_var22_flag6_and_setenvreset $6
	octave 6
	note B_, 1
	note F_, 1
	music_tempo_2 $4
	octave 5
	note B_, 1
	note F_, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	octave 6
	note G_, 2
	note __, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 1
	note F#, 1
	note G_, 2
	note __, 2
	note F#, 2
	note __, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 1
	note F_, 1
	note F#, 2
	note __, 2
	note A_, 2
	note __, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 1
	note G#, 1
	note A_, 2
	note __, 2
	note G#, 2
	note __, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	note G_, 1
	note G#, 2
	note __, 2
	octave 7
	note B_, 1
	note C_, 1
	octave 6
	note G#, 1
	octave 5
	note G#, 2
	note __, 2
	octave 6
	note C_, 1
	note F#, 1
	octave 7
	note C_, 1
	note D_, 1
	octave 6
	note E_, 1
	note __, 1
	note E_, 1
	octave 5
	note E_, 2
	note __, 1
	octave 6
	note E_, 1
	note A#, 1
	octave 7
	note E_, 1
	note A#, 1
	octave 6
	note A#, 1
	note G_, 1
	octave 5
	note G_, 2
	note __, 2
	note A#, 1
	octave 6
	note F_, 1
	note A#, 1
	octave 7
	note C#, 1
	octave 6
	note D#, 1
	note __, 1
	note D#, 1
	octave 5
	note D#, 2
	note __, 1
	octave 6
	note D#, 1
	note A_, 1
	octave 7
	note D#, 1
	music_tempo_2 $5
	music_reset_var22_flag6_and_setenvreset $6
	octave 5
	note C_, 1
	note F#, 1
	octave 6
	note C_, 1
	music_tempo_2 $4
	note F#, 1
	octave 7
	note C_, 1
	note F#, 1
	music_tempo_2 $9
	music_set_var22_flag6_and_setenvreset $8
	octave 8
	note C_, 13
	note __, 2
	jump_channel Music_4b5ee

MusicHeader_4a04c_Ch3: ; 4b701
	music_tempo_2 $9
	music_fa $3
	music_noise_sample $f

Music_4b707: ; 4b707
	music_fb $0, $0, $4, $13
	octave 4
	note C_, 12
	note D#, 12
	note G_, 10
	note F#, 2
	note D_, 12
	note C_, 12
	note D#, 12
	note D_, 12
	note G_, 12
	octave 4
	note G_, 1
	note G_, 1
	note __, 1
	octave 5
	note C#, 2
	note G_, 1
	octave 4
	note G_, 1
	octave 5
	note C#, 1
	note G_, 1
	octave 4
	note G_, 1
	call_channel Music_4b7cd
	note A_, 1
	note A_, 1
	note __, 1
	octave 5
	note D#, 2
	note A_, 1
	octave 4
	note A_, 1
	octave 5
	note D#, 1
	note A_, 1
	octave 4
	note A_, 1
	call_channel Music_4b7cd
	music_setrepeat1a $4
	octave 4
	note C_, 2
	note __, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 1
	note A#, 2
	note A_, 2
	note G#, 2
	music_dorepeat1a
	note A#, 3
	note __, 2
	note A_, 1
	note A#, 2
	note A_, 2
	note A#, 2
	note A_, 3
	note __, 2
	note G#, 1
	note A_, 2
	note G#, 2
	note A_, 2
	octave 5
	note C_, 3
	note __, 2
	octave 4
	note B_, 1
	octave 5
	note C_, 2
	octave 4
	note B_, 2
	octave 5
	note C_, 2
	octave 4
	note B_, 3
	note __, 2
	note A#, 1
	note B_, 2
	note A#, 2
	note B_, 2
	note G#, 1
	note D_, 1
	note __, 1
	note G#, 1
	note D_, 1
	note G#, 1
	note A_, 1
	note A#, 1
	note B_, 2
	note A#, 1
	note E_, 1
	note __, 1
	note A#, 1
	note E_, 1
	note A#, 1
	note B_, 1
	octave 5
	note C_, 1
	note E_, 1
	note D#, 1
	octave 4
	note G_, 1
	note C#, 1
	note __, 1
	note G_, 1
	note C#, 1
	note G_, 1
	note G#, 1
	note A_, 1
	note A#, 2
	note A_, 1
	note D#, 1
	note __, 1
	note A_, 1
	note D#, 1
	note A_, 1
	note A#, 1
	note B_, 1
	octave 5
	note D#, 1
	note D_, 1
	note __, 3
	music_tempo_2 $5
	music_fb $0, $0, $0, $0
	octave 4
	note F#, 1
	octave 5
	note C_, 1
	note F#, 1
	music_tempo_2 $4
	octave 6
	note C_, 1
	note F#, 1
	octave 7
	note C_, 1
	music_tempo_2 $9
	note C_, 10
	note __, 2
	jump_channel Music_4b707

Music_4b7a6: ; 4b7a6
	octave 6
	note C_, 9
	note __, 1
	note D_, 1
	note D#, 1
	note F_, 9
	note __, 1
	note D#, 1
	note D_, 1
	ret_channel

Music_4b7b0: ; 4b7b0
	note G#, 1
	note G#, 1
	music_set_var22_flag6_and_setenvreset $5
	octave 5
	note B_, 1
	note B_, 1
	note B_, 1
	octave 6
	music_set_var22_flag6_and_setenvreset $8
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 2
	ret_channel

Music_4b7c0: ; 4b7c0
	octave 5
	note B_, 1
	note B_, 1
	octave 7
	note D_, 1
	note G#, 1
	note __, 1
	octave 5
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 2
	ret_channel

Music_4b7cd: ; 4b7cd
	note G#, 1
	note G#, 1
	note __, 1
	octave 5
	note D_, 2
	note G#, 1
	octave 4
	note G#, 1
	octave 5
	note D_, 1
	note G#, 1
	octave 4
	note G#, 1
	ret_channel

MusicHeader_4a04c_Ch6: ; 4b7db
	music_tempo_2 $9

Music_4b7dd: ; 4b7dd
	music_setrepeat1a $7
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 2
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 2
	music_dorepeat1a
	note C_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note E_, 2
	note C_, 1
	note C#, 1
	note D_, 1
	note F_, 1
	note G_, 1
	note G#, 1
	music_setrepeat1a $4
	music_tempo_2 $9
	note G#, 1
	note G#, 1
	note __, 1
	music_tempo_2 $3
	note F_, 1
	note F#, 1
	note G_, 1
	music_tempo_2 $9
	note G#, 1
	note __, 1
	note G#, 1
	note C#, 1
	note D_, 1
	music_tempo_2 $3
	note F_, 1
	note F#, 1
	note G_, 1
	music_dorepeat1a
	music_tempo_2 $9
	music_setrepeat1a $2
	note C_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C#, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note C_, 1
	note C#, 1
	note D_, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note C_, 1
	note G#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C_, 1
	music_dorepeat1a
	music_setrepeat1a $4
	music_tempo_2 $3
	note G#, 1
	note G_, 1
	note F_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	music_tempo_2 $9
	note G#, 1
	note G#, 1
	note C_, 2
	note __, 2
	note G#, 2
	note C_, 1
	music_tempo_2 $3
	note F_, 1
	note G_, 1
	note G#, 1
	music_dorepeat1a
	music_tempo_2 $9
	music_setrepeat1a $4
	note C_, 2
	music_tempo_2 $3
	note F_, 1
	note G_, 1
	note G#, 1
	music_tempo_2 $9
	note G#, 2
	note D_, 1
	note C_, 2
	note G#, 2
	music_dorepeat1a
	music_tempo_2 $3
	note G#, 1
	note G_, 1
	note G_, 1
	note F_, 1
	note F_, 1
	note D_, 1
	note D_, 1
	note C#, 1
	note C#, 1
	music_tempo_2 $9
	note G#, 1
	note C_, 2
	note __, 12
	jump_channel Music_4b7dd

MusicHeader_4a056_Ch1: ; 4b867
	music_tempo_2 $4
	music_fa $77
	octave 5
	note F_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	music_e8 $17
	music_tempo_2 $8
	music_fa $78
	music_fb $11, $13, $2, $11
	music_f9 $10, 5, 5
	note D#, 2
	note __, 1
	note G_, 1
	octave 5
	note A#, 1
	octave 6
	note D#, 1
	octave 5
	note F_, 1
	note A_, 1
	octave 6
	note C_, 1
	note F_, 3
	note A#, 1
	note G#, 1
	note F#, 1
	note C#, 1
	note C_, 1
	octave 5
	note A#, 1
	note G#, 1
	octave 6
	note C_, 1
	note D#, 1
	note G#, 2
	octave 7
	note C_, 1
	music_tempo_2 $4
	music_reset_var22_flag6_and_setenvreset $6
	octave 5
	note D_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note A#, 1
	octave 6
	note D_, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note A#, 1
	note F_, 1
	octave 7
	note D_, 1
	octave 6
	note A#, 1
	note F_, 1
	note D_, 1
	note F_, 1
	note D_, 1
	octave 5
	note A#, 1
	octave 6
	note D_, 1
	octave 5
	note A#, 1
	note F_, 1
	note A#, 1
	note F_, 1
	note D_, 1
	music_tempo_2 $7

Music_4b8c1: ; 4b8c1
	call_channel Music_4ba44
	music_reset_var22_flag6_and_setenvreset $5
	octave 5
	note D#, 1
	note G#, 1
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note C#, 1
	note C_, 1
	note __, 1
	note C#, 1
	note C_, 1
	note __, 1
	note C#, 2
	note __, 1
	note F#, 2
	note __, 1
	note A#, 2
	note F#, 1
	note F_, 1
	note __, 1
	note F#, 2
	note D#, 1
	note __, 1
	octave 7
	note C#, 1
	note __, 1
	octave 6
	note G#, 1
	note __, 1
	note G#, 1
	octave 5
	note F_, 1
	note G#, 1
	octave 6
	note C#, 1
	note F_, 1
	call_channel Music_4ba44
	note G#, 1
	note G_, 1
	note __, 1
	note G#, 1
	note __, 1
	note G#, 1
	note __, 1
	note C#, 3
	note __, 1
	note F#, 2
	note __, 1
	note A#, 2
	octave 5
	note F#, 1
	note G#, 1
	note A#, 1
	note G#, 3
	note A#, 1
	note B_, 1
	octave 6
	note C#, 2
	note __, 1
	note D#, 1
	note F_, 1
	note C#, 1
	note __, 1
	note D#, 3
	music_setrepeat1a $4
	note C#, 1
	note C_, 1
	note __, 1
	music_dorepeat1a
	note C#, 1
	note __, 1
	note D#, 1
	note __, 1
	music_setrepeat1a $4
	note G#, 1
	note G_, 1
	note D#, 1
	music_dorepeat1a
	note G#, 1
	note G_, 1
	jump_channel Music_4b8c1

MusicHeader_4a056_Ch2: ; 4b91d
	music_tempo_2 $4
	music_fa $b7
	octave 5
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	music_e8 $17
	music_tempo_2 $8
	music_fa $b8
	music_fb $11, $13, $2, $11
	note G_, 2
	note __, 1
	music_f9 $10, 5, 4
	note A#, 5
	note __, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note A#, 1
	octave 7
	note D#, 2
	note __, 1
	octave 6
	note C_, 1
	note D#, 1
	note G#, 1
	octave 7
	note C_, 2
	note D#, 1
	note F_, 11
	note __, 1
	music_f9 $e, 5, 4
	music_tempo_2 $7
	music_noise_sample $14

Music_4b956: ; 4b956
	call_channel Music_4ba2a
	music_reset_var22_flag6_and_setenvreset $5
	octave 5
	note G#, 1
	octave 6
	note D#, 1
	music_set_var22_flag6_and_setenvreset $8
	octave 7
	note G#, 1
	note D#, 1
	note C_, 1
	note C#, 1
	note C_, 1
	octave 6
	note G#, 1
	note F#, 2
	note __, 1
	note A#, 3
	octave 7
	note C#, 2
	note D#, 4
	note __, 1
	note F_, 1
	note F#, 1
	note G#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 4
	note __, 1
	call_channel Music_4ba2a
	note C_, 2
	note __, 1
	note C#, 1
	note D#, 1
	note C_, 1
	note __, 1
	octave 6
	note F#, 3
	note __, 1
	note A#, 3
	octave 7
	note C#, 2
	octave 6
	note B_, 2
	note __, 1
	note A#, 3
	note G#, 2
	note F_, 2
	note __, 1
	note F#, 1
	note G#, 1
	note F_, 1
	music_tempo_2 $4
	note __, 1
	music_tempo_2 $3
	music_reset_var22_flag6_and_setenvreset $5
	note F#, 1
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $8
	note G_, 16
	note __, 3
	octave 7
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note __, 1
	jump_channel Music_4b956

MusicHeader_4a056_Ch3: ; 4b9b1
	music_tempo_2 $8
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	note __, 3
	octave 5
	note D#, 3
	octave 4
	note D#, 2
	octave 5
	note D#, 1
	note F_, 3
	octave 4
	note F_, 3
	octave 5
	note F#, 4
	octave 4
	note F#, 2
	octave 5
	note G#, 3
	octave 4
	note G#, 1
	octave 5
	note C_, 1
	note G#, 1
	octave 4
	note A#, 12
	music_tempo_2 $7

Music_4b9d5: ; 4b9d5
	music_setrepeat1a $2
	music_noise_sample $f
	octave 4
	note A#, 2
	octave 5
	note A#, 1
	note A_, 1
	note A#, 1
	note F_, 2
	octave 4
	note G#, 2
	octave 5
	note D#, 2
	octave 4
	note G#, 1
	octave 5
	note G#, 2
	note G_, 1
	note F_, 1
	octave 4
	note G_, 2
	note __, 1
	octave 5
	note D_, 3
	octave 4
	note G_, 1
	note F_, 1
	note __, 1
	note F_, 1
	note __, 1
	note F_, 1
	octave 5
	note C_, 2
	note F_, 2
	octave 4
	note G#, 2
	octave 5
	note G#, 1
	note G_, 1
	note G#, 1
	note D#, 2
	octave 4
	note F#, 2
	octave 5
	note C#, 2
	octave 4
	note F#, 1
	octave 5
	note F#, 2
	note F_, 1
	note D#, 1
	octave 4
	note B_, 2
	note __, 1
	note B_, 3
	octave 5
	note F#, 1
	note C#, 1
	note __, 1
	note C#, 2
	note G#, 3
	note C#, 2
	music_dorepeat1a
	music_setrepeat1a $2
	octave 5
	note D#, 1
	note __, 1
	note A#, 1
	note A_, 1
	note A#, 1
	note D#, 1
	note __, 1
	note C#, 1
	note __, 1
	note C#, 2
	note F_, 1
	note G#, 2
	note C#, 2
	music_dorepeat1a
	jump_channel Music_4b9d5

Music_4ba2a: ; 4ba2a
	octave 5
	music_reset_var22_flag6_and_setenvreset $5
	note A#, 1
	note F_, 1
	music_set_var22_flag6_and_setenvreset $8
	octave 7
	note A#, 1
	note F_, 1
	note D_, 1
	note D#, 1
	note D_, 1
	octave 6
	note A#, 1
	note G#, 2
	note __, 1
	octave 7
	note C_, 3
	note D#, 2
	note D_, 1
	note __, 1
	note D#, 1
	note F_, 12
	note __, 1
	ret_channel

Music_4ba44: ; 4ba44
	music_reset_var22_flag6_and_setenvreset $5
	music_noise_sample $14
	octave 5
	note F_, 1
	note A#, 1
	music_set_var22_flag6_and_setenvreset $7
	octave 6
	note D#, 1
	note D_, 1
	note __, 1
	note D#, 1
	note D_, 1
	note __, 1
	note D#, 2
	note __, 1
	note G#, 2
	note __, 1
	octave 7
	note C_, 2
	note __, 2
	octave 6
	note G_, 1
	note F_, 1
	note __, 1
	note G_, 1
	note F_, 1
	note A#, 1
	note __, 1
	note A#, 1
	note A_, 1
	note __, 1
	note G_, 2
	note F_, 2
	ret_channel

MusicHeader_4a056_Ch6: ; 4ba69
	music_tempo_2 $4
	note C#, 1
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note D_, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	note F_, 1
	music_tempo_2 $8
	note G#, 2
	note C_, 1
	note C_, 3
	note G#, 1
	note G#, 1
	note G#, 1
	note C_, 2
	note D_, 1
	note G#, 3
	note C_, 1
	note C#, 1
	note C#, 1
	note G#, 1
	note G#, 1
	note G#, 1
	note C_, 3
	note C_, 3
	note C_, 3
	note C_, 3
	music_tempo_2 $7

Music_4ba8e: ; 4ba8e
	music_setrepeat1a $8
	note C_, 1
	note C#, 1
	note D_, 2
	note G#, 2
	note C#, 2
	note C_, 1
	note C#, 1
	note D_, 1
	note G#, 2
	note G#, 1
	note C_, 2
	music_dorepeat1a
	music_setrepeat1d $2
	note C_, 2
	music_setrepeat1a $4
	note G#, 1
	note G#, 2
	music_dorepeat1a
	note G#, 2
	music_dorepeat1d
	jump_channel Music_4ba8e

MusicHeader_4a060_Ch1: ; 4baa9
	music_tempo_2 $5
	music_fa $b8
	music_fb $11, $12, $2, $21
	music_e8 $f
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	note A#, 1
	note __, 1
	octave 5
	note G#, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 5
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 6
	note C_, 1
	note __, 1
	note E_, 1
	note __, 1
	octave 5
	note D_, 1
	note __, 1
	note F#, 1
	note __, 1
	music_fa $b6
	note A_, 1
	note __, 1
	music_fa $b4
	octave 6
	note C#, 1
	note __, 1
	music_tempo_2 $a
	music_fa $b8
	music_fb $11, $13, $2, $21
	music_setrepeat1a $2
	octave 6
	note C#, 1
	note D_, 1
	note C#, 1
	note D_, 1
	note C#, 1
	note __, 1
	music_dorepeat1a
	note D_, 1
	note C#, 1
	octave 5
	note B_, 1
	note A#, 1
	music_fb $11, $13, $5, $21

Music_4bafd: ; 4bafd
	note __, 1
	music_setrepeat1d $2
	call_channel Music_4bc76
	music_setrepeat1a $2
	music_fa $b8
	octave 6
	note E_, 1
	note D#, 1
	note E_, 1
	music_fa $b5
	note D#, 1
	note E_, 1
	music_fa $b4
	note D#, 1
	note E_, 1
	note __, 1
	music_dorepeat1a
	music_dorepeat1d
	call_channel Music_4bc76
	music_setrepeat1a $2
	music_fa $b8
	octave 6
	note G#, 1
	note G_, 1
	note G#, 1
	music_fa $b5
	note G_, 1
	note G#, 1
	music_fa $b4
	note G_, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	call_channel Music_4bc76
	call_channel Music_4bc89
	note __, 1
	call_channel Music_4bc89
	jump_channel Music_4bafd

MusicHeader_4a060_Ch2: ; 4bb38
	music_tempo_2 $5
	music_fa $b9
	music_fb $11, $12, $2, $21
	music_e8 $f
	music_f9 $15, 4, 3
	octave 6
	note G#, 1
	note __, 1
	note B_, 1
	note __, 1
	octave 7
	note D#, 1
	note __, 1
	note F#, 1
	note __, 1
	octave 6
	note F_, 1
	note __, 1
	note G#, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note D#, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	note F_, 1
	note __, 1
	note A_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	octave 5
	note B_, 1
	note __, 1
	octave 6
	note D_, 1
	note __, 1
	music_fa $b7
	note F#, 1
	note __, 1
	music_fa $b5
	note A_, 1
	note __, 1
	music_tempo_2 $a
	music_fa $b9
	music_fb $11, $13, $2, $21
	music_setrepeat1a $2
	octave 5
	note F_, 1
	note G_, 1
	note F_, 1
	note G_, 1
	note F_, 1
	note __, 1
	music_dorepeat1a
	note F#, 1
	note E_, 1
	note D_, 1
	note C#, 1
	music_fb $11, $13, $5, $21

Music_4bb8e: ; 4bb8e
	music_setrepeat1d $2
	call_channel Music_4bc4e
	music_setrepeat1a $2
	music_fa $b9
	octave 5
	note C#, 1
	note G#, 1
	note B_, 1
	note G#, 1
	note B_, 1
	music_fa $b7
	note G#, 1
	music_fa $b6
	note B_, 1
	music_fa $b4
	note G#, 1
	music_dorepeat1a
	music_dorepeat1d
	call_channel Music_4bc4e
	music_setrepeat1a $2
	music_fa $b9
	octave 5
	note F_, 1
	octave 6
	note C_, 1
	note D#, 1
	note C_, 1
	note D#, 1
	music_fa $b7
	note C_, 1
	music_fa $b6
	note D#, 1
	music_fa $b4
	note C_, 1
	music_dorepeat1a
	call_channel Music_4bc4e
	call_channel Music_4bc64
	note D#, 1
	call_channel Music_4bc64
	note G#, 1
	jump_channel Music_4bb8e

MusicHeader_4a060_Ch3: ; 4bbce
	music_tempo_2 $5
	music_fa $3
	music_fb $0, $0, $1, $0
	music_noise_sample $f
	octave 5
	note E_, 4
	note F_, 1
	note E_, 1
	note D#, 1
	note D_, 1
	note C#, 4
	note D_, 1
	note C#, 1
	note C_, 1
	octave 4
	note B_, 1
	note A#, 4
	note B_, 1
	note A#, 1
	note A_, 1
	note G#, 1
	note G_, 4
	note A_, 1
	note B_, 1
	octave 5
	note C#, 1
	note E_, 1
	music_tempo_2 $a
	music_fb $0, $0, $3, $0
	music_f9 $15, 4, 7
	music_noise_sample $f
	music_noise_sample $e
	octave 5
	note A#, 8
	note B_, 2
	octave 6
	note C#, 2
	note D_, 2
	note E_, 2

Music_4bc05: ; 4bc05
	note __, 2
	octave 6
	note F#, 2
	note E_, 2
	note D_, 2
	note C#, 4
	octave 5
	note A_, 2
	note B_, 2
	octave 6
	note C#, 4
	note G#, 10
	note G#, 2
	note A_, 2
	note G#, 2
	note F#, 2
	note E_, 2
	note C#, 2
	note C#, 2
	octave 5
	note B_, 4
	octave 6
	note C#, 4
	octave 5
	note G#, 1
	note A#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	note A#, 1
	note G#, 1
	note F#, 1
	note G#, 1
	note A#, 1
	note B_, 1
	octave 6
	note C#, 1
	note D_, 4
	note A_, 4
	note F#, 4
	note C#, 4
	note C_, 4
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note F#, 4
	note E_, 2
	note D_, 2
	note C#, 4
	octave 5
	note B_, 4
	note A#, 2
	music_tempo_2 $1
	note F#, 15
	note G_, 5
	music_tempo_2 $a
	note G#, 12
	jump_channel Music_4bc05

Music_4bc4e: ; 4bc4e
	music_setrepeat1a $2
	music_fa $b9
	octave 4
	note B_, 1
	octave 5
	note F#, 1
	note A_, 1
	note F#, 1
	note A_, 1
	music_fa $b7
	note F#, 1
	music_fa $b6
	note A_, 1
	music_fa $b4
	note F#, 1
	music_dorepeat1a
	ret_channel

Music_4bc64: ; 4bc64
	music_fa $b9
	octave 4
	note G#, 1
	octave 5
	note D#, 1
	note F#, 1
	note D#, 1
	note F#, 1
	music_fa $b7
	note D#, 1
	music_fa $b6
	note F#, 1
	music_fa $b4
	ret_channel

Music_4bc76: ; 4bc76
	music_setrepeat1a $2
	music_fa $b8
	octave 6
	note D_, 1
	note C#, 1
	note D_, 1
	music_fa $b5
	note C#, 1
	note D_, 1
	music_fa $b4
	note C#, 1
	note D_, 1
	note __, 1
	music_dorepeat1a
	ret_channel

Music_4bc89: ; 4bc89
	music_fa $b8
	octave 5
	note B_, 1
	note A#, 1
	note B_, 1
	music_fa $b5
	note A#, 1
	note B_, 1
	music_fa $b4
	note A#, 1
	note B_, 1
	ret_channel

MusicHeader_4a060_Ch6: ; 4bc98
	music_ff

MusicHeader_4a06a_Ch1: ; 4bc99
	music_tempo_2 $8
	music_fa $77
	music_fb $11, $13, $2, $11
	music_f9 $10, 5, 5
	music_e8 $17
	octave 6
	note F_, 5
	note __, 1
	note C#, 1
	octave 5
	note G#, 1
	octave 6
	note C#, 1
	note F_, 1
	note C#, 1
	note F_, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note A#, 2
	note __, 1
	note A#, 1
	note G_, 1
	note A#, 1
	octave 7
	note D#, 2
	note __, 1
	octave 6
	note A_, 1
	note C_, 1
	note F_, 1
	note A_, 6
	music_tempo_2 $3
	music_e8 $11
	music_reset_var22_flag6_and_setenvreset $6
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 7
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	music_f9 $e, 5, 5
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $7
	octave 6

Music_4bcd9: ; 4bcd9
	music_setrepeat1a $2
	note F_, 1
	note G#, 1
	note __, 1
	note G_, 1
	note G#, 1
	note __, 1
	music_dorepeat1a
	note F_, 1
	note G#, 1
	note G_, 1
	note G#, 1
	music_setrepeat1a $2
	note G_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	music_dorepeat1a
	note G_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	music_setrepeat1a $2
	note D#, 1
	note G_, 1
	note __, 1
	note F_, 1
	note G_, 1
	note __, 1
	music_dorepeat1a
	note D#, 1
	note G_, 1
	note F_, 1
	note G_, 1
	music_setrepeat1a $2
	note F_, 1
	note A#, 1
	note __, 1
	note A_, 1
	note A#, 1
	note __, 1
	music_dorepeat1a
	note F_, 1
	note A#, 1
	note A_, 1
	note A#, 1
	jump_channel Music_4bcd9

MusicHeader_4a06a_Ch2: ; 4bd10
	music_tempo_2 $8
	music_fa $b8
	music_fb $11, $13, $2, $11
	octave 5
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note A_, 1
	note A#, 1
	octave 7
	note C_, 1
	music_e8 $17
	note F_, 3
	note C#, 1
	note D#, 1
	note F_, 1
	note D#, 1
	octave 6
	note A#, 1
	octave 7
	note D#, 1
	note G_, 1
	note D#, 1
	note G_, 1
	note A#, 3
	note G_, 1
	note G#, 1
	note A#, 1
	music_f9 $10, 5, 4
	octave 8
	note C_, 9
	music_tempo_2 $3
	music_e8 $11
	music_reset_var22_flag6_and_setenvreset $7
	octave 7
	note C_, 1
	note __, 1
	note F_, 1
	note __, 1
	note G_, 1
	note __, 1
	octave 8
	note C_, 1
	note __, 1
	music_f9 $e, 5, 4
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $8

Music_4bd50: ; 4bd50
	call_channel Music_4bda7
	music_e8 $14
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 2
	note __, 2
	music_e8 $0
	note __, 8
	call_channel Music_4bdb4
	call_channel Music_4bda7
	music_e8 $14
	note D_, 4
	note __, 2
	note D#, 4
	note __, 2
	note F_, 3
	music_reset_var22_flag6_and_setenvreset $6
	music_tempo_2 $4
	note E_, 1
	music_tempo_2 $3
	note D#, 1
	music_tempo_2 $7
	music_set_var22_flag6_and_setenvreset $8
	note D_, 10
	note __, 2
	note D_, 1
	note D#, 1
	note D_, 1
	note D#, 1
	call_channel Music_4bdb4
	call_channel Music_4bda7
	jump_channel Music_4bd50

MusicHeader_4a06a_Ch3: ; 4bd86
	music_tempo_2 $8
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11
	octave 5
	note F_, 3
	note D#, 3
	note C#, 3
	note C#, 3
	octave 4
	note A#, 3
	note G#, 3
	note G_, 3
	note D#, 3
	note F_, 12
	music_tempo_2 $7
	music_fb $0, $0, $f, $1e

Music_4bda3: ; 4bda3
	note F_, 4
	jump_channel Music_4bda3

Music_4bda7: ; 4bda7
	music_e8 $14
	octave 7
	note D_, 1
	note D_, 1
	note __, 1
	note D_, 1
	note D_, 2
	note __, 2
	music_e8 $0
	note __, 8
	ret_channel

Music_4bdb4: ; 4bdb4
	music_e8 $14
	note C_, 1
	note C_, 1
	note __, 1
	note C_, 1
	note C_, 2
	note __, 2
	music_e8 $0
	note __, 8
	ret_channel

MusicHeader_4a06a_Ch6: ; 4bdc0
	music_tempo_2 $8
	note G#, 2
	note D_, 1
	note C#, 1
	note C_, 1
	note G#, 1
	note G#, 2
	note C_, 1
	note C#, 1
	note F#, 1
	note F#, 1
	note G#, 2
	note D_, 1
	note C#, 1
	note C_, 1
	note G#, 1
	note G#, 2
	note C_, 1
	music_tempo_2 $4
	note C#, 1
	note C#, 1
	note D_, 1
	note D_, 1
	note F_, 1
	note F#, 1
	music_tempo_2 $8
	note G#, 9
	music_tempo_2 $6
	note G#, 2
	note G#, 1
	note G#, 1
	music_tempo_2 $7

Music_4bde5: ; 4bde5
	note C_, 2
	note D_, 2
	note G#, 2
	note D_, 2
	note C_, 1
	note G#, 2
	note C_, 1
	note G#, 1
	note C#, 1
	note E_, 2
	jump_channel Music_4bde5

MusicHeader_4a074_Ch1: ; 4bdf2
	music_tempo_2 $9
	music_fa $b6
	music_fb $11, $12, $2, $21
	note __, 1
	music_e8 $12

Music_4bdfe: ; 4bdfe
	music_setrepeat1a $6
	octave 5
	note G_, 1
	octave 6
	note D#, 1
	note C_, 1
	note D#, 1
	octave 5
	note G_, 1
	octave 6
	note D#, 1
	note C_, 1
	note __, 1
	music_dorepeat1a
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	octave 5
	note G#, 1
	octave 6
	note D#, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note G_, 1
	note C_, 1
	note F_, 1
	note C_, 1
	note D#, 1
	note C_, 1
	note F_, 1
	note __, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note F_, 1
	note G_, 1
	note G#, 1
	note A#, 1
	note G#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	octave 5
	note A#, 1
	call_channel Music_4bee2
	octave 6
	note D_, 1
	octave 5
	note B_, 1
	octave 6
	note D_, 1
	note D#, 1
	note D_, 1
	octave 5
	note B_, 1
	note G_, 1
	note B_, 1
	call_channel Music_4bee2
	octave 6
	note C_, 1
	octave 5
	note G#, 1
	octave 6
	note C_, 1
	note D#, 1
	note D_, 1
	octave 5
	note A#, 1
	note F_, 1
	note A#, 1
	jump_channel Music_4bdfe

MusicHeader_4a074_Ch2: ; 4be54
	music_tempo_2 $9
	music_fa $79
	music_fb $11, $13, $4, $41
	music_e8 $12
	music_f9 $13, 4, 3

Music_4be62: ; 4be62
	octave 7
	note C_, 8
	note __, 2
	note D_, 2
	note D#, 2
	note F_, 2
	note D#, 2
	note D_, 2
	octave 6
	note G_, 4
	octave 7
	note G_, 5
	note __, 1
	note G_, 2
	note G_, 4
	note F_, 2
	note D#, 2
	note D_, 4
	note C_, 4
	octave 6
	note A#, 6
	octave 7
	note C_, 2
	note D_, 3
	note __, 1
	octave 6
	note A#, 2
	octave 7
	note F_, 2
	note F_, 3
	note __, 1
	note D#, 2
	note F_, 2
	note G_, 4
	note D_, 3
	note __, 1
	note C_, 2
	note D_, 2
	note D#, 2
	octave 6
	note G_, 2
	octave 7
	note D_, 4
	note C_, 4
	octave 6
	note A#, 2
	octave 7
	note G_, 2
	note G_, 5
	note __, 1
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note D_, 2
	note C_, 2
	note D_, 2
	note __, 2
	note D_, 1
	note D#, 1
	note F_, 4
	note G#, 2
	note G_, 3
	note __, 1
	jump_channel Music_4be62

MusicHeader_4a074_Ch3: ; 4beaa
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $f

Music_4beb5: ; 4beb5
	octave 5
	note C_, 10
	octave 4
	note A#, 2
	octave 5
	note C_, 2
	octave 4
	note F_, 2
	note A#, 10
	note G#, 2
	note A#, 2
	note G_, 2
	note G#, 10
	note A#, 2
	note G#, 2
	note G_, 2
	note F_, 8
	note G#, 2
	note G_, 2
	note F_, 2
	note D#, 2
	note A#, 8
	note B_, 2
	octave 5
	note D_, 2
	note G_, 2
	octave 4
	note G_, 2
	octave 5
	note C_, 8
	octave 4
	note F_, 8
	note A#, 8
	note B_, 4
	note G_, 4
	octave 5
	note C_, 8
	octave 4
	note F_, 8
	note A#, 8
	note G#, 4
	note G_, 4
	jump_channel Music_4beb5

Music_4bee2: ; 4bee2
	octave 6
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note G_, 1
	note A_, 1
	note A#, 1
	octave 6
	note C_, 1
	note D_, 1
	note D#, 1
	note G_, 1
	note F_, 1
	note D#, 1
	note D_, 1
	note C_, 1
	octave 5
	note A#, 1
	note A_, 1
	note __, 1
	note G_, 1
	octave 6
	note D_, 1
	note C_, 1
	note F_, 1
	note D_, 1
	note C_, 1
	octave 5
	note G_, 1
	ret_channel

MusicHeader_4a074_Ch6: ; 4bf01
	music_ff

