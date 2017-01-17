	dw MusicHeader_86002
	dw MusicHeader_86010
	dw MusicHeader_8601a
	dw MusicHeader_86024
	dw MusicHeader_8602e
	dw MusicHeader_86038
	dw MusicHeader_86042
	dw MusicHeader_8604c
	dw MusicHeader_86056
	dw MusicHeader_86060
	dw MusicHeader_8606a
	dw MusicHeader_86074
	dw MusicHeader_8607e
	dw MusicHeader_8607e
	dw MusicHeader_8607e
	dw MusicHeader_8607e

MusicHeader_86002: ; 86002
	channel %111111, $f0
	dw MusicHeader_86002_Ch1
	dw MusicHeader_86002_Ch2
	dw MusicHeader_86002_Ch3
	dw MusicHeader_86002_Ch4
	dw MusicHeader_86002_Ch5
	dw MusicHeader_86002_Ch6

MusicHeader_86010: ; 86010
	channel %111001, $f0
	dw MusicHeader_86010_Ch1
	dw MusicHeader_86010_Ch2
	dw MusicHeader_86010_Ch3
	dw MusicHeader_86010_Ch6

MusicHeader_8601a: ; 8601a
	channel %111001, $c0
	dw MusicHeader_8601a_Ch1
	dw MusicHeader_8601a_Ch2
	dw MusicHeader_8601a_Ch3
	dw MusicHeader_8601a_Ch6

MusicHeader_86024: ; 86024
	channel %111001, $c0
	dw MusicHeader_86024_Ch1
	dw MusicHeader_86024_Ch2
	dw MusicHeader_86024_Ch3
	dw MusicHeader_86024_Ch6

MusicHeader_8602e: ; 8602e
	channel %111001, $c0
	dw MusicHeader_8602e_Ch1
	dw MusicHeader_8602e_Ch2
	dw MusicHeader_8602e_Ch3
	dw MusicHeader_8602e_Ch6

MusicHeader_86038: ; 86038
	channel %111001, $c0
	dw MusicHeader_86038_Ch1
	dw MusicHeader_86038_Ch2
	dw MusicHeader_86038_Ch3
	dw MusicHeader_86038_Ch6

MusicHeader_86042: ; 86042
	channel %111001, $c0
	dw MusicHeader_86042_Ch1
	dw MusicHeader_86042_Ch2
	dw MusicHeader_86042_Ch3
	dw MusicHeader_86042_Ch6

MusicHeader_8604c: ; 8604c
	channel %111001, $c0
	dw MusicHeader_8604c_Ch1
	dw MusicHeader_8604c_Ch2
	dw MusicHeader_8604c_Ch3
	dw MusicHeader_8604c_Ch6

MusicHeader_86056: ; 86056
	channel %111001, $c0
	dw MusicHeader_86056_Ch1
	dw MusicHeader_86056_Ch2
	dw MusicHeader_86056_Ch3
	dw MusicHeader_86056_Ch6

MusicHeader_86060: ; 86060
	channel %111001, $c0
	dw MusicHeader_86060_Ch1
	dw MusicHeader_86060_Ch2
	dw MusicHeader_86060_Ch3
	dw MusicHeader_86060_Ch6

MusicHeader_8606a: ; 8606a
	channel %111001, $c0
	dw MusicHeader_8606a_Ch1
	dw MusicHeader_8606a_Ch2
	dw MusicHeader_8606a_Ch3
	dw MusicHeader_8606a_Ch6

MusicHeader_86074: ; 86074
	channel %111001, $c0
	dw MusicHeader_86074_Ch1
	dw MusicHeader_86074_Ch2
	dw MusicHeader_86074_Ch3
	dw MusicHeader_86074_Ch6

MusicHeader_8607e: ; 8607e
	channel %111001, $c0
	dw MusicHeader_8607e_Ch1
	dw MusicHeader_8607e_Ch2
	dw MusicHeader_8607e_Ch3
	dw MusicHeader_8607e_Ch6

MusicHeader_86002_Ch1: ; 86088
MusicHeader_86002_Ch2: ; 86088
MusicHeader_86002_Ch3: ; 86088
MusicHeader_86002_Ch4: ; 86088
MusicHeader_86002_Ch5: ; 86088
MusicHeader_86002_Ch6: ; 86088
MusicHeader_86010_Ch1: ; 86088
MusicHeader_86010_Ch2: ; 86088
MusicHeader_86010_Ch3: ; 86088
MusicHeader_86010_Ch6: ; 86088
MusicHeader_8607e_Ch1: ; 86088
MusicHeader_8607e_Ch2: ; 86088
MusicHeader_8607e_Ch3: ; 86088
MusicHeader_8607e_Ch6: ; 86088
	music_ff

MusicHeader_8601a_Ch1: ; 86089
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
	jump_channel MusicHeader_86024_Ch1

MusicHeader_8601a_Ch2: ; 860ae
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
	jump_channel MusicHeader_86024_Ch2

MusicHeader_8601a_Ch3: ; 860ce
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
	jump_channel MusicHeader_86024_Ch3

MusicHeader_8601a_Ch6: ; 860e7
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
	jump_channel MusicHeader_86024_Ch6

MusicHeader_86024_Ch1: ; 860fc
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

Music_8611b: ; 8611b
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
	jump_channel Music_8611b

MusicHeader_86024_Ch2: ; 861a8
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

Music_86219: ; 86219
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
	jump_channel Music_86219

MusicHeader_86024_Ch3: ; 86348
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

Music_86367: ; 86367
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
	jump_channel Music_86367

MusicHeader_86024_Ch6: ; 863d8
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

Music_863ed: ; 863ed
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
	jump_channel Music_863ed

MusicHeader_8602e_Ch1: ; 86423
	music_tempo_2 $7
	music_fa $38
	music_fb $11, $14, $2, $11
	music_e8 $6

Music_8642e: ; 8642e
	call_channel Music_86a08
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
	call_channel Music_86a08
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
	jump_channel Music_8642e

MusicHeader_8602e_Ch2: ; 8663a
	music_tempo_2 $7
	music_fa $79
	music_fb $11, $14, $3, $12
	music_e8 $6

Music_86645: ; 86645
	call_channel Music_869e0
	music_f9 $10, 5, 3
	note A_, 15
	note __, 2
	call_channel Music_869e0
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
	call_channel Music_869ff
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
	call_channel Music_869ff
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
	jump_channel Music_86645

MusicHeader_8602e_Ch3: ; 86814
	music_tempo_2 $7
	music_fa $3
	music_noise_sample $f
	music_fb $0, $0, $2, $11

Music_8681f: ; 8681f
	call_channel Music_869f0
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
	call_channel Music_869f0
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
	call_channel Music_86a19
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
	call_channel Music_86a19
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
	jump_channel Music_8681f

Music_869e0: ; 869e0
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

Music_869f0: ; 869f0
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

Music_869ff: ; 869ff
	octave 8
	note C_, 2
	note C_, 2
	octave 7
	note A#, 1
	octave 8
	note C_, 2
	note __, 2
	ret_channel

Music_86a08: ; 86a08
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

Music_86a19: ; 86a19
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

Music_86a2f: ; 86a2f
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

Music_86a3f: ; 86a3f
	music_setrepeat1a $3
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note D_, 1
	note C_, 1
	note G#, 2
	ret_channel

MusicHeader_8602e_Ch6: ; 86a49
	music_tempo_2 $7

Music_86a4b: ; 86a4b
	call_channel Music_86a2f
	music_setrepeat1a $3
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	call_channel Music_86a2f
	music_setrepeat1a $2
	note C_, 1
	note C#, 1
	note G#, 2
	music_dorepeat1a
	note C_, 1
	note G#, 1
	note G#, 2
	music_setrepeat1d $3
	call_channel Music_86a3f
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
	call_channel Music_86a3f
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
	call_channel Music_86a3f
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
	call_channel Music_86a3f
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
	jump_channel Music_86a4b

MusicHeader_86038_Ch1: ; 86acb
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

Music_86b17: ; 86b17
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
	jump_channel Music_86b17

MusicHeader_86038_Ch2: ; 86ced
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

Music_86d2c: ; 86d2c
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
	call_channel Music_87004
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
	call_channel Music_87004
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
	jump_channel Music_86d2c

MusicHeader_86038_Ch3: ; 86e86
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

Music_86ed4: ; 86ed4
	octave 4
	note G_, 2
	note G_, 1
	note __, 1
	note F_, 4
	call_channel Music_87022
	call_channel Music_87014
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
	call_channel Music_87014
	call_channel Music_87022
	call_channel Music_87014
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
	jump_channel Music_86ed4

Music_87004: ; 87004
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

Music_87014: ; 87014
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

Music_87022: ; 87022
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

MusicHeader_86038_Ch6: ; 87030
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

Music_8703e: ; 8703e
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
	jump_channel Music_8703e

MusicHeader_86042_Ch1: ; 870c4
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
	call_channel Music_87418

Music_870e3: ; 870e3
	call_channel Music_87428
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
	call_channel Music_87418
	call_channel Music_87428
	call_channel Music_8744b
	call_channel Music_87441
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	call_channel Music_87441
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
	call_channel Music_8744b
	call_channel Music_87441
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	note B_, 1
	note __, 1
	note B_, 1
	call_channel Music_87441
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
	jump_channel Music_870e3

MusicHeader_86042_Ch2: ; 871ff
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
	call_channel Music_873e7
	music_f9 $c, 5, 4

Music_87220: ; 87220
	music_fa $b8
	octave 6
	note F#, 5
	note __, 1
	note B_, 5
	note __, 1
	call_channel Music_873f7
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
	call_channel Music_873e7
	music_fa $b8
	octave 6
	note F#, 5
	note __, 1
	note B_, 5
	note __, 1
	octave 7
	call_channel Music_873f7
	note F_, 10
	note __, 2
	note D_, 1
	note E_, 1
	note D_, 1
	note E_, 1
	call_channel Music_8740f
	call_channel Music_87405
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	call_channel Music_87405
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
	call_channel Music_8740f
	call_channel Music_87405
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	note G#, 1
	note __, 1
	note G#, 1
	call_channel Music_87405
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
	jump_channel Music_87220

MusicHeader_86042_Ch3: ; 8735a
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

Music_87377: ; 87377
	call_channel Music_87454
	music_setrepeat1a $10
	note B_, 1
	note F#, 1
	music_dorepeat1a
	call_channel Music_87454
	call_channel Music_8745f
	call_channel Music_87454
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
	call_channel Music_8745f
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
	jump_channel Music_87377

Music_873e7: ; 873e7
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

Music_873f7: ; 873f7
	note F#, 3
	music_tempo_2 $2
	music_reset_var22_flag6_and_setenvreset $6
	note G_, 1
	music_tempo_2 $4
	music_set_var22_flag6_and_setenvreset $8
	note F#, 1
	music_tempo_2 $6
	ret_channel

Music_87405: ; 87405
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

Music_8740f: ; 8740f
	octave 6
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	note F#, 1
	note __, 1
	note F#, 1
	ret_channel

Music_87418: ; 87418
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

Music_87428: ; 87428
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

Music_87441: ; 87441
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

Music_8744b: ; 8744b
	octave 5
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	note A_, 1
	note __, 1
	note A_, 1
	ret_channel

Music_87454: ; 87454
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

Music_8745f: ; 8745f
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

Music_87493: ; 87493
	note C_, 2
	note D_, 1
	note C#, 1
	note G#, 2
	note C_, 2
	note D_, 1
	note C#, 1
	note C_, 2
	ret_channel

Music_8749c: ; 8749c
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

MusicHeader_86042_Ch6: ; 874b6
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

Music_874ca: ; 874ca
	music_setrepeat1a $3
	call_channel Music_87493
	note G#, 2
	note D_, 1
	note C#, 1
	music_dorepeat1a
	call_channel Music_87493
	note G#, 1
	note G#, 1
	note G#, 2
	call_channel Music_87493
	note G#, 2
	note D_, 1
	note C#, 1
	call_channel Music_87493
	note G#, 1
	note C_, 1
	note A#, 2
	music_setrepeat1a $8
	note C_, 1
	note D_, 1
	note E_, 2
	music_dorepeat1a
	call_channel Music_8749c
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
	call_channel Music_8749c
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
	jump_channel Music_874ca

MusicHeader_8604c_Ch1: ; 8752b
	music_tempo_2 $9
	music_fb $11, $12, $4, $11
	music_e8 $6

Music_87534: ; 87534
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
	call_channel Music_877c0
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
	call_channel Music_877c0
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
	jump_channel Music_87534

MusicHeader_8604c_Ch2: ; 875e7
	music_tempo_2 $9
	music_f9 $12, 5, 5
	music_e8 $19

Music_875ee: ; 875ee
	music_fa $b8
	music_fb $11, $13, $2, $11
	call_channel Music_877a6
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
	call_channel Music_877a6
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
	call_channel Music_877b0
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
	call_channel Music_877b0
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
	jump_channel Music_875ee

MusicHeader_8604c_Ch3: ; 87701
	music_tempo_2 $9
	music_fa $3
	music_noise_sample $f

Music_87707: ; 87707
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
	call_channel Music_877cd
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
	call_channel Music_877cd
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
	jump_channel Music_87707

Music_877a6: ; 877a6
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

Music_877b0: ; 877b0
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

Music_877c0: ; 877c0
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

Music_877cd: ; 877cd
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

MusicHeader_8604c_Ch6: ; 877db
	music_tempo_2 $9

Music_877dd: ; 877dd
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
	jump_channel Music_877dd

MusicHeader_86056_Ch1: ; 87867
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

Music_878c1: ; 878c1
	call_channel Music_87a44
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
	call_channel Music_87a44
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
	jump_channel Music_878c1

MusicHeader_86056_Ch2: ; 8791d
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

Music_87956: ; 87956
	call_channel Music_87a2a
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
	call_channel Music_87a2a
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
	jump_channel Music_87956

MusicHeader_86056_Ch3: ; 879b1
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

Music_879d5: ; 879d5
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
	jump_channel Music_879d5

Music_87a2a: ; 87a2a
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

Music_87a44: ; 87a44
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

MusicHeader_86056_Ch6: ; 87a69
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

Music_87a8e: ; 87a8e
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
	jump_channel Music_87a8e

MusicHeader_86060_Ch1: ; 87aa9
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

Music_87afd: ; 87afd
	note __, 1
	music_setrepeat1d $2
	call_channel Music_87c76
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
	call_channel Music_87c76
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
	call_channel Music_87c76
	call_channel Music_87c89
	note __, 1
	call_channel Music_87c89
	jump_channel Music_87afd

MusicHeader_86060_Ch2: ; 87b38
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

Music_87b8e: ; 87b8e
	music_setrepeat1d $2
	call_channel Music_87c4e
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
	call_channel Music_87c4e
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
	call_channel Music_87c4e
	call_channel Music_87c64
	note D#, 1
	call_channel Music_87c64
	note G#, 1
	jump_channel Music_87b8e

MusicHeader_86060_Ch3: ; 87bce
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

Music_87c05: ; 87c05
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
	jump_channel Music_87c05

Music_87c4e: ; 87c4e
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

Music_87c64: ; 87c64
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

Music_87c76: ; 87c76
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

Music_87c89: ; 87c89
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

MusicHeader_86060_Ch6: ; 87c98
	music_ff

MusicHeader_8606a_Ch1: ; 87c99
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

Music_87cd9: ; 87cd9
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
	jump_channel Music_87cd9

MusicHeader_8606a_Ch2: ; 87d10
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

Music_87d50: ; 87d50
	call_channel Music_87da7
	music_e8 $14
	note D#, 1
	note D#, 1
	note __, 1
	note D#, 1
	note D#, 2
	note __, 2
	music_e8 $0
	note __, 8
	call_channel Music_87db4
	call_channel Music_87da7
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
	call_channel Music_87db4
	call_channel Music_87da7
	jump_channel Music_87d50

MusicHeader_8606a_Ch3: ; 87d86
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

Music_87da3: ; 87da3
	note F_, 4
	jump_channel Music_87da3

Music_87da7: ; 87da7
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

Music_87db4: ; 87db4
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

MusicHeader_8606a_Ch6: ; 87dc0
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

Music_87de5: ; 87de5
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
	jump_channel Music_87de5

MusicHeader_86074_Ch1: ; 87df2
	music_tempo_2 $9
	music_fa $b6
	music_fb $11, $12, $2, $21
	note __, 1
	music_e8 $12

Music_87dfe: ; 87dfe
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
	call_channel Music_87ee2
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
	call_channel Music_87ee2
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
	jump_channel Music_87dfe

MusicHeader_86074_Ch2: ; 87e54
	music_tempo_2 $9
	music_fa $79
	music_fb $11, $13, $4, $41
	music_e8 $12
	music_f9 $13, 4, 3

Music_87e62: ; 87e62
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
	jump_channel Music_87e62

MusicHeader_86074_Ch3: ; 87eaa
	music_tempo_2 $9
	music_fa $3
	music_fb $0, $0, $6, $0
	music_noise_sample $f

Music_87eb5: ; 87eb5
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
	jump_channel Music_87eb5

Music_87ee2: ; 87ee2
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

MusicHeader_86074_Ch6: ; 87f01
	music_ff

