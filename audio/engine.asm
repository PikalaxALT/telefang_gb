music_engine: MACRO
UpdateSound_\1:
	push af
	push bc
	push de
	push hl
	ld a, [H_MusicID]
	cp $1
	jp z, MusicNone_\1
	or a
	jr z, .no_new_music
	call PlayMusic_\1
	xor a
	ld [H_MusicID], a
	jr .finished_starting_audio

.no_new_music
	ld a, [wRingtoneID]
	or a
	jr z, .no_ringtone
	xor a
	ld [H_SFX_ID], a
.no_ringtone
	ld a, [H_SFX_ID]
	or a
	jr z, .no_sfx
	call PlaySFX_\1
	xor a
	ld [H_SFX_ID], a
	jr .finished_starting_audio

.no_sfx
	ld a, [H_Ringtone]
	or a
	jr z, .finished_starting_audio
	call PlayRingtone_\1
	xor a
	ld [H_Ringtone], a
.finished_starting_audio
	ld a, [wSoundUpdatesDisabled]
	or a
	jr z, .sound_updates_disabled
	ld a, [wcf91]
	or a
	jp nz, .check_channel5
	ld a, $ff
	ld [wcf91], a
	ld a, $8
	ld [rNR22], a
	ld [rNR42], a
	xor a
	ld [rNR32], a
	ld a, $80
	ld [rNR24], a
	ld [rNR44], a
	ld [rNR34], a
	jp .check_channel5

.sound_updates_disabled
	ld a, [wcf91]
	or a
	jr z, .check_fade
	xor a
	ld [wcf91], a
	ld a, $8f
	ld [rNR52], a
	ld [wcf94], a
	ld a, $8
	ld [rNR12], a
	ld a, $80
	ld [rNR14], a
	xor a
	ld [wChannel5], a
.check_fade
	ld a, [wMusicFade]
	or a
	jr z, .update_tracks
	ld a, [wCurMusicFade]
	or a
	jr z, .fade_iteration
	dec a
	ld [wCurMusicFade], a
	jr .update_tracks

.fade_iteration
	ld a, [wVolume]
	sub $22
	jr c, .reset_all
	ld [wVolume], a
	ld [rNR50], a
	ld a, [wMusicFade]
	ld [wCurMusicFade], a
	jr .update_tracks

.reset_all
	xor a
	ld [rNR50], a
	ld [wMusicFade], a
	ld [wCurMusicFade], a
	ld [rNR51], a
	ld [wChannel1], a
	ld [wChannel2], a
	ld [wChannel3], a
	ld [wChannel4], a
	ld [wChannel5], a
	ld [wChannel6], a
	ld [rNR11], a
	ld [rNR21], a
	ld [rNR32], a
	ld [rNR42], a
	ld [rNR13], a
	ld [rNR23], a
	ld [rNR33], a
	ld [rNR43], a
	ld [rNR30], a
	ld a, $8
	ld [rNR10], a
	ld a, $c0
	ld [rNR14], a
	ld [rNR24], a
	ld [rNR34], a
	ld [rNR44], a
	pop hl
	pop de
	pop bc
	pop af
	ret

.update_tracks
	ld de, wChannel1
	ld a, [de]
	or a
	jr z, .check_channel2
	xor a
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .special_check_channel1
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .check_channel2

.special_check_channel1
	ld a, [wcf94]
	or a
	jr z, .update_channel1
	xor a
	ld [wcf94], a
	ld hl, $5
	add hl, de
	ld a, [hli]
	ld [rNR10], a
	ld a, [hli]
	ld [rNR11], a
	inc hl
	ld a, [hli]
	or $8
	ld [rNR12], a
	inc hl
	ld a, [hli]
	ld [rNR13], a
	ld a, [hl]
	or $80
	ld [rNR14], a
.update_channel1
	call UpdateChannel_\1
.check_channel2
	ld de, wChannel2
	ld a, [de]
	or a
	jr z, .check_channel3
	ld a, $1
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .update_channel2
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .check_channel3

.update_channel2
	call UpdateChannel_\1
.check_channel3
	ld de, wChannel3
	ld a, [de]
	or a
	jr z, .check_channel4
	ld a, $2
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .update_channel3
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .check_channel4

.update_channel3
	call UpdateChannel_\1
.check_channel4
	ld de, wChannel4
	ld a, [de]
	or a
	jr z, .check_channel5
	ld a, $3
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .update_channel4
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .check_channel5

.update_channel4
	call UpdateChannel_\1
.check_channel5
	ld de, wChannel5
	ld a, [de]
	or a
	jr z, .check_channel6
	ld a, $4
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .update_channel5
	ld a, [hl]
	and $7f
	ld [hl], a
	jr .check_channel6

.update_channel5
	call UpdateChannel_\1
.check_channel6
	ld a, [wSoundUpdatesDisabled]
	or a
	jr nz, UpdateRingtone_\1
	ld de, wChannel6
	ld a, [de]
	or a
	jr z, UpdateRingtone_\1
	ld a, $5
	ld [H_CurChannel], a
	call AudioEngineFunc_42ff_\1
	jr z, .update_channel6
	ld a, [hl]
	and $7f
	ld [hl], a
	jr UpdateRingtone_\1

.update_channel6
	call UpdateChannel_\1
UpdateRingtone_\1:
	ld a, [wSoundUpdatesDisabled]
	or a
	jr z, .check_ringtone_playing
	jp FinishSoundUpdate_\1

.check_ringtone_playing
	ld a, [wRingtoneID]
	or a
	jr nz, .countdown_wcfc7
	jp FinishSoundUpdate_\1

.countdown_wcfc7
	ld a, [wcfc7]
	dec a
	ld [wcfc7], a
	jr z, .play_ringtone
	cp $1
	jr z, .break_note
	jp FinishSoundUpdate_\1

.break_note
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jp FinishSoundUpdate_\1

.play_ringtone
	ld a, [wRingtonePointer]
	ld e, a
	ld a, [wRingtonePointer + 1]
	ld d, a
	ld a, [wcfc5]
	cp $fe
	jr nz, asm_4268_\1
	call MemSRAMBank_\1
	ld a, [de]
	ld [H_MusicEngineBuffer], a
	call CloseSRAM_\1
	inc de
	cp $ff
	jr nz, asm_4217_\1
	xor a
	ld [wRingtoneID], a
	jp FinishSoundUpdate_\1

MemSRAMBank_\1: ; 48206 (11:4206)
	enable_sram
	ld a, [wAudioSRAMBank]
	ld [MBC3SRamBank], a
	ret

CloseSRAM_\1: ; 48212 (11:4212)
	xor a
	ld [MBC3SRamEnable], a
	ret

asm_4217_\1
	ld a, [H_MusicEngineBuffer]
	ld c, a
	and $f
	cp $0
	jr nz, .asm_422d
	ld a, $7
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_4268_\1

.asm_422d
	cp $1
	jr nz, .asm_423d
	ld a, $6
	ld [wcfc5], a
	ld a, $2
	ld [wcfc6], a
	jr asm_4268_\1

.asm_423d
	cp $2
	jr nz, .asm_4245
	ld a, $5
	jr .asm_4257

.asm_4245
	cp $3
	jr nz, .asm_424d
	ld a, $4
	jr .asm_4257

.asm_424d
	cp $4
	jr nz, .asm_4255
	ld a, $3
	jr .asm_4257

.asm_4255
	ld a, $2
.asm_4257
	ld [wcfc5], a
	ld a, c
	and $f0
	srl a
	srl a
	srl a
	srl a
	ld [wcfc6], a
asm_4268_\1
	call MemSRAMBank_\1
	ld a, [de]
	ld [H_MusicEngineBuffer], a
	call CloseSRAM_\1
	inc de
	ld a, [H_MusicEngineBuffer]
	cp $fe
	jr nz, .is_note
	ld a, [wcfc8]
	or a
	jr z, .not_ram
	xor a
	ld [H_Ringtone], a
	ld [wRingtoneID], a
	jp FinishSoundUpdate_\1

.not_ram
	ld a, [wcfc3]
	ld e, a
	ld a, [wcfc4]
	ld d, a
	inc de
	jr asm_4268_\1

.is_note
	ld c, a
	and $f0
	cp $c0
	jr nz, .not_rest
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [rNR11], a
	ld [rNR13], a
	ld a, $80
	ld [rNR14], a
	jr .finish

.not_rest
	ld a, $c0
	ld [rNR11], a
	ld a, $f0
	ld [rNR12], a
	ld a, c
	ld c, a
	and $f
	sla a
	ld b, a
	ld a, c
	and $f0
	or b
	ld hl, AudioEngineData_4569_\1
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hl]
	ld [rNR13], a
	inc hl
	ld a, [hl]
	or $80
	ld [rNR14], a
.finish
	ld a, [wcfc5]
	and $f
	ld c, a
	call MemSRAMBank_\1
	ld a, [de]
	ld [H_MusicEngineBuffer], a
	call CloseSRAM_\1
	ld a, [H_MusicEngineBuffer]
	inc de
	and $f
.loop
	or a
	jr z, .got_length
	dec a
	sla c
	jr .loop

.got_length
	ld a, c
	ld [wcfc7], a
	ld a, e
	ld [wRingtonePointer], a
	ld a, d
	ld [wRingtonePointer + 1], a
FinishSoundUpdate_\1: ; 482fa (11:42fa)
	pop hl
	pop de
	pop bc
	pop af
	ret

AudioEngineFunc_42ff_\1: ; 482ff (11:42ff)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $80
	ret

UpdateChannel_\1: ; 48307 (11:4307)
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, UpdateSFXChannel_\1
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .next_note
	ld a, [H_CurChannel]
	cp $5
	jp z, AudioEngineFunc_48cb_\1
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, AudioEngineFunc_48cb_\1
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, ExecuteTrackFunction_\1
	call AudioEngineFunc_4ad1_\1
	jp AudioEngineFunc_4651_\1

.next_note
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_4341_\1
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $2
	jp z, AudioEngineFunc_44e8_\1
asm_434e_\1
	ld a, [bc]
	ld [H_MusicCommand], a
	inc bc
	cp $ef
	jr nz, .check_f0
	ld hl, wcf9b
	inc [hl]
	jr asm_434e_\1

.check_f0
	and $f0
	cp $f0
	jr nz, .check_e0
	call DoAudioFunction_f0_ff_\1
	jr asm_4341_\1

.check_e0
	cp $e0
	jr nz, .check_octave
	call DoAudioFunction_e0_ef_\1
	jr asm_4341_\1

.check_octave
	cp $d0
	jr nz, .note
	ld a, [H_MusicCommand]
	and $f
	ld hl, $9
	add hl, de
	ld [hl], a
	jr asm_4341_\1

.rest
	ld hl, $8
	add hl, de
	xor a
	ld [hl], a
	call SetCurChannelEnv_\1
	ld hl, $c
	add hl, de
	ld bc, .Null
	ld [hl], c
	inc hl
	ld [hl], b
	ld a, $ff
	call SetCurChannelFrq_\1
	ld a, $8f
	jp SetCurChannelKik_\1

.Null:
	ret

.note
	call StoreAudioPointer_\1
	ld hl, $3
	add hl, de
	ld a, [H_MusicCommand]
	and $f
	ld b, a
	inc b
	xor a
.loop_duration
	add [hl]
	dec b
	jr nz, .loop_duration
	inc hl
	ld [hl], a
	ld a, [H_CurChannel]
	cp $5
	jp z, AudioEngineFunc_489a_\1
	ld hl, $23
	add hl, de
	ld a, [hl]
	cp $1
	jp z, AudioEngineFunc_489a_\1
	ld a, [H_MusicCommand]
	and $f0
	cp $c0
	jr z, .rest ; rest
	ld a, [H_CurChannel]
	cp $2
	jr nz, .skip_noise
	xor a
	ld [rNR30], a
	ld a, [wcf99]
	add a
	ld hl, AudioEnginePointers_4db3_\1
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld b, $10
	ld c, rWAVE % $100
.wave
	ld a, [hli]
	ld [$ff00+c], a
	inc c
	dec b
	jr nz, .wave
	ld a, $80
	ld [rNR30], a
.skip_noise
	ld hl, $7
	add hl, de
	ld a, [hli]
	ld [hl], a
	call SetCurChannelEnv_\1
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $40
	call nz, AudioEngineFunc_441e_\1
	jr asm_4455_\1

AudioEngineFunc_440a_\1: ; 4840a (11:440a)
	swap a
	ld hl, $e
	add hl, de
	ld [hli], a
	ld a, [H_MusicEngineBuffer]
	and $f
	swap a
	ld [hl], a
	ld hl, $c
	add hl, de
	ret

AudioEngineFunc_441e_\1: ; 4841e (11:441e)
	ld hl, $10
	add hl, de
	ld a, [hl]
	ld [H_MusicEngineBuffer], a
	and $f0
	jr z, AudioEngineFunc_4434_\1
	call AudioEngineFunc_440a_\1
	ld bc, AudioEngineFunc_49eb_\1
	ld [hl], c
	inc hl
	ld [hl], b
	ret

AudioEngineFunc_4434_\1:
	ld hl, $11
	add hl, de
	ld a, [hl]
	ld [H_MusicEngineBuffer], a
	and $f0
	jr z, AudioEngineFunc_444a_\1
	call AudioEngineFunc_440a_\1
	ld bc, AudioEngineFunc_4a1a_\1
	ld [hl], c
	inc hl
	ld [hl], b
	ret

AudioEngineFunc_444a_\1:
	ld hl, $c
	add hl, de
	ld bc, AudioEngineFunc_4a49_\1
	ld [hl], c
	inc hl
	ld [hl], b
	ret

asm_4455_\1
	ld hl, $15
	add hl, de
	ld a, [hld]
	or a
	jr z, .asm_4466
	ld b, a
	ld a, [hli]
	inc hl
	inc hl
	ld [hli], a
	ld [hl], b
	inc hl
	ld [hl], $0
.asm_4466
	ld a, [H_MusicCommand]
	ld hl, $9
	add hl, de
	ld b, [hl]
	sla b
	and $f0
	add b
	ld [H_MusicEngineBuffer], a
	ld a, [H_CurChannel]
	or a
	jr z, .asm_448b
	cp $1
	ld a, [H_MusicEngineBuffer]
	jr nz, AudioEngineFunc_4495_\1
	call AudioEngineFunc_469d_\1
	ld hl, wcfb5
	jr .asm_4494

.asm_448b
	ld a, [H_MusicEngineBuffer]
	call AudioEngineFunc_4698_\1
	ld hl, wcfb4
.asm_4494
	ld [hl], a
AudioEngineFunc_4495_\1:
	ld hl, AudioEngineData_4569_\1
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld c, a
	ld [H_FFA6], a
	ld a, [hl]
	ld b, a
	ld [H_FFA7], a
	ld hl, $24
	add hl, de
	ld a, [hl]
	ld l, a
	ld h, $0
	add hl, bc
	ld a, l
	ld [H_FFA6], a
	ld a, h
	ld [H_FFA7], a
	ld hl, $a
	add hl, de
	ld a, [H_FFA6]
	ld [hli], a
	call SetCurChannelFrq_\1
	ld a, [H_FFA7]
	and $f
	ld [hl], a
	or $80
	jp SetCurChannelKik_\1

UpdateSFXChannel_\1: ; 484cd (11:44cd)
	ld hl, $4
	add hl, de
	dec [hl]
	jr z, .next_note
	ret

.next_note
	ld hl, $1
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
asm_44dc_\1
	ld a, [de]
	or a
	ret z
	ld hl, $23
	add hl, de
	ld a, [hl]
	or a
	jp z, asm_434e_\1
AudioEngineFunc_44e8_\1: ; 484e8 (11:44e8)
	ld a, [bc]
	inc bc
	ld [H_MusicCommand], a
	cp $e0
	jp z, .NoiseCommandE0
	and $f0
	cp $f0
	jr nz, .check_e0
	call DoAudioFunction_f0_ff_\1
	jr asm_44dc_\1

.check_e0
	cp $e0
	jr nz, .noise
	call DoAudioFunction_e0_ef_\1
	jr asm_44dc_\1

.noise
	ld hl, $3
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_MusicCommand]
	and $f0
	jr z, .no_first_nybble
	add $20
	call AudioEngineFunc_4ba0_\1
	ld hl, $8
	add hl, de
	ld [hli], a
	call SetCurChannelEnv_\1
	ld a, [bc]
	inc bc
	ld [hli], a
	call SetCurChannelFrq_\1
	ld a, [H_MusicCommand]
	and $f
	ld [hl], a
	or $80
	call SetCurChannelKik_\1
	jr StoreAudioPointer_\1

.no_first_nybble
	call StoreAudioPointer_\1
	ld a, [H_MusicCommand]
	and $f
	swap a
	call AudioEngineFunc_4ba0_\1
	or $8
	ld [rNR42], a
	ld a, $80
	ld [rNR44], a
	ret

.NoiseCommandE0
	ld a, [bc]
	inc bc
	ld hl, $4
	add hl, de
	ld [hl], a
	call StoreAudioPointer_\1
	xor a
	call SetCurChannelEnv_\1
	ld a, $ff
	call SetCurChannelFrq_\1
	ld a, $8f
	jp SetCurChannelKik_\1

StoreAudioPointer_\1: ; 48561 (11:4561)
	ld hl, $1
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

AudioEngineData_4569_\1:
	db $83, 7,  $06, 7,  $0b, 6,  $13, 4,  $2e, 0,  $ff, -1,  $ff, -1,  $ff, -1
	db $8a, 7,  $14, 7,  $27, 6,  $50, 4,  $a2, 0,  $ff, -1,  $ff, -1,  $ff, -1
	db $91, 7,  $21, 7,  $42, 6,  $85, 4,  $08, 1,  $ff, -1,  $ff, -1,  $ff, -1
	db $97, 7,  $2d, 7,  $5b, 6,  $b7, 4,  $6d, 1,  $ff, -1,  $ff, -1,  $ff, -1
	db $9d, 7,  $39, 7,  $72, 6,  $e6, 4,  $cb, 1,  $ff, -1,  $ff, -1,  $ff, -1
	db $a2, 7,  $44, 7,  $89, 6,  $16, 5,  $25, 2,  $ff, -1,  $ff, -1,  $ff, -1
	db $a8, 7,  $4f, 7,  $9e, 6,  $3c, 5,  $7a, 2,  $ff, -1,  $ff, -1,  $ff, -1
	db $ad, 7,  $59, 7,  $b2, 6,  $64, 5,  $c7, 2,  $ff, -1,  $ff, -1,  $ff, -1
	db $b1, 7,  $62, 7,  $c4, 6,  $89, 5,  $14, 3,  $ff, -1,  $ff, -1,  $ff, -1
	db $b6, 7,  $6b, 7,  $d6, 6,  $ad, 5,  $5a, 3,  $ff, -1,  $ff, -1,  $ff, -1
	db $ba, 7,  $74, 7,  $e9, 6,  $d2, 5,  $9d, 3,  $ff, -1,  $ff, -1,  $ff, -1
	db $be, 7,  $7b, 7,  $f9, 6,  $ed, 5,  $dc, 3,  $ff, -1,  $ff, -1,  $ff, -1

MusicNone_\1: ; 48629 (11:4629)
	xor a
	ld [rNR52], a
	ld [rNR50], a
	xor a
	ld [H_Ringtone], a
	ld [wRingtoneID], a
	ld [H_MusicID], a
	ld [wChannel1], a
	ld [wChannel2], a
	ld [wChannel3], a
	ld [wChannel4], a
	ld [wChannel5], a
	ld [wChannel6], a
	ld a, $77
	ld [rNR50], a
	jp UpdateRingtone_\1

AudioEngineFunc_4651_\1: ; 48651 (11:4651)
	ld a, [H_CurChannel]
	or a
	jr z, .asm_4679
	cp $1
	ret nz
	ld a, [wcfb5]
	call AudioEngineFunc_469d_\1
	ld a, [wcfb1]
	or a
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	ret nz
	ld a, $20
	ld [hl], a
	call SetCurChannelEnv_\1
	call AudioEngineFunc_46b4_\1
	ld a, [hl]
	jp AudioEngineFunc_4495_\1

.asm_4679
	ld a, [wcfb4]
	call AudioEngineFunc_4698_\1
	ld a, [wcfb0]
	or a
	ret z
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	ret nz
	ld a, $20
	ld [hl], a
	call SetCurChannelEnv_\1
	call AudioEngineFunc_46ac_\1
	ld a, [hl]
	jp AudioEngineFunc_4495_\1

AudioEngineFunc_4698_\1: ; 48698 (11:4698)
	ld hl, wcfb2
	jr asm_46a0_\1

AudioEngineFunc_469d_\1: ; 4869d (11:469d)
	ld hl, wcfb3
asm_46a0_\1
	push af
	ld a, [hl]
	inc a
	and $3f
	ld [hl], a
	call AudioEngineFunc_46c2_\1
	pop af
	ld [hl], a
	ret

AudioEngineFunc_46ac_\1: ; 486ac (11:46ac)
	ld hl, wcfb0
	ld a, [wcfb2]
	jr asm_46ba_\1

AudioEngineFunc_46b4_\1: ; 486b4 (11:46b4)
	ld hl, wcfb1
	ld a, [wcfb3]
asm_46ba_\1
	sub [hl]
	and $3f
	call AudioEngineFunc_46c2_\1
	ld a, [hl]
	ret

AudioEngineFunc_46c2_\1: ; 486c2 (11:46c2)
	push bc
	push af
	ld hl, AudioEnginePointers_46d9_\1
	ld a, [H_CurChannel]
	add a
	ld c, a
	ld b, $0
	add hl, bc
	ld a, [hli]
	ld h, [hl]
	ld l, a
	pop af
	ld c, a
	ld b, $0
	add hl, bc
	pop bc
	ret

AudioEnginePointers_46d9_\1:
	dw wcf00
	dw wcf40

AudioCommands1_\1:
	dw AudioCommand_e0_\1
	dw AudioCommand_e1_\1
	dw AudioCommand_e2_\1
	dw AudioCommand_e3_\1
	dw AudioCommand_e4_\1
	dw AudioCommand_e5_\1
	dw AudioCommand_e6_\1
	dw AudioCommand_e7_\1
	dw AudioCommand_e8_\1
	dw AudioCommand_e0_\1
	dw AudioCommand_ea_\1
	dw AudioCommand_eb_\1
	dw AudioCommand_ec_\1
	dw AudioCommand_e0_\1
	dw AudioCommand_e0_\1
	dw AudioCommand_e0_\1

AudioCommands2_\1:
	dw AudioCommand_f0_\1
	dw AudioCommand_f1_\1
	dw AudioCommand_JumpChannel_\1
	dw AudioCommand_f3_\1
	dw AudioCommand_f4_\1
	dw AudioCommand_call_channel_\1
	dw AudioCommand_ret_channel_\1
	dw AudioCommand_f7_\1
	dw AudioCommand_f8_\1
	dw AudioCommand_f9_\1
	dw AudioCommand_fa_\1
	dw AudioCommand_fb_\1
	dw AudioCommand_fc_\1
	dw AudioCommand_fd_\1
	dw AudioCommand_fe_\1
	dw AudioCommand_ff_\1

DoAudioFunction_f0_ff_\1: ; 4871d (11:471d)
	ld hl, AudioCommands2_\1
	jp DoAudioFunction_\1

DoAudioFunction_e0_ef_\1: ; 48723 (11:4723)
	ld hl, AudioCommands1_\1
	jp DoAudioFunction_\1

DoAudioFunction_\1: ; 48729 (11:4729)
	ld a, [H_MusicCommand]
	and $f
	add a
	add l
	ld l, a
	jr nc, .asm_4734
	inc h
.asm_4734
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

AudioCommand_f0_\1: ; 48738 (11:4738)
	ld hl, $1a
	jr asm_474c_\1

AudioCommand_f1_\1: ; 4873d (11:473d)
	ld hl, $1a
	jr asm_4757_\1

AudioCommand_JumpChannel_\1: ; 48742 (11:4742)
	ld a, [bc]
	ld l, a
	inc bc
	ld a, [bc]
	ld b, a
	ld c, l
	ret

AudioCommand_f3_\1: ; 48749 (11:4749)
	ld hl, $1d
asm_474c_\1
	ld a, [bc]
	inc bc
	add hl, de
	ld [hli], a
	ld [hl], c
	inc hl
	ld [hl], b
	ret

AudioCommand_f4_\1: ; 48754 (11:4754)
	ld hl, $1d
asm_4757_\1
	add hl, de
	dec [hl]
	ret z
	inc hl
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

AudioCommand_call_channel_\1: ; 4875f (11:475f)
	ld a, [bc]
	inc bc
	push af
	ld a, [bc]
	inc bc
	ld hl, $20
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ld b, a
	pop af
	ld c, a
	ret

AudioCommand_ret_channel_\1: ; 4876f (11:476f)
	ld hl, $20
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ret

AudioCommand_f7_\1: ; 48777 (11:4777)
	ld hl, $5
	call AudioEngineFunc_4895_\1
	jp SetCurChannelEnt_\1

AudioCommand_f8_\1: ; 48780 (11:4780)
	ld hl, $24
	jp AudioEngineFunc_4895_\1

AudioCommand_f9_\1: ; 48786 (11:4786)
	ld a, [bc]
	inc bc
	ld hl, $14
	add hl, de
	ld [hli], a
	ld a, [bc]
	and $f0
	swap a
	ld [hli], a
	ld a, [bc]
	inc bc
	and $f
	ld [hl], a
	ret

AudioCommand_fa_\1: ; 48799 (11:4799)
	ld a, [bc]
	inc bc
	push af
	ld hl, $6
	add hl, de
	and $c0
	ld [hl], a
	ld a, [H_CurChannel]
	cp $2
	jr z, .asm_47ae
	ld a, [hl]
	call SetCurChannelLen_\1
.asm_47ae
	inc hl
	pop af
	and $f
	swap a
	ld [hl], a
	ret

AudioCommand_fb_\1: ; 487b6 (11:47b6)
	ld hl, $10
	add hl, de
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hl], a
	jp AudioCommand_ec_\1

AudioCommand_fc_\1: ; 487c9 (11:47c9)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	ret

AudioCommand_fd_\1: ; 487d2 (11:47d2)
	ld hl, $3
	jp AudioEngineFunc_4895_\1

AudioCommand_fe_\1: ; 487d8 (11:47d8)
	ld hl, $23
	jp AudioEngineFunc_4895_\1

AudioCommand_ff_\1: ; 487de (11:47de)
	ld hl, $0
	add hl, de
	xor a
	ld [hl], a
	ld a, [H_CurChannel]
	cp $5
	jr nz, .check_ch5
	ld a, [wChannel4]
	or a
	ret nz
	xor a
	ld [rNR42], a
	ret

.check_ch5
	cp $4
	jr nz, .music_ch
	ld a, $ff
	ld [wcf94], a
.music_ch
	ld hl, AudioEngineData_4d95_\1
	ld a, [H_CurChannel]
	or a
	jr z, .ch1
	push bc
	ld b, $0
	cp $1
	jr nz, .check_ch3
	ld c, 5
	jr .offset

.check_ch3
	cp $2
	jr nz, .check_ch4
	ld c, 10
	jr .offset

.check_ch4
	cp $3
	jr nz, .ch5
	ld c, 15
	ld a, $ff
	ld [wcf9a], a
	jr .offset

.ch5
	ld c, 20
.offset
	add hl, bc
	pop bc
.ch1
	ld a, [hli]
	cp $ee
	call nz, SetCurChannelEnt_\1
	ld a, [hli]
	call SetCurChannelLen_\1
	ld a, [hli]
	call SetCurChannelEnv_\1
	ld a, [hli]
	call SetCurChannelFrq_\1
	ld a, [hl]
	jp SetCurChannelKik_\1

AudioCommand_e1_\1: ; 48840 (11:4840)
	ld hl, $3
	jp AudioEngineFunc_4895_\1

AudioCommand_e2_\1: ; 48846 (11:4846)
	ld hl, $a
	call AudioEngineFunc_4895_\1
	ld [rNR43], a
	ret

AudioCommand_e3_\1: ; 4884f (11:484f)
	ld hl, $6
	call AudioEngineFunc_4895_\1
	jp SetCurChannelLen_\1

AudioCommand_e8_\1: ; 48858 (11:4858)
	ld hl, wcfb0
	ld a, [H_CurChannel]
	add l
	ld l, a
	ld a, [bc]
	inc bc
	ld [hl], a
	ret

AudioCommand_e4_\1: ; 48864 (11:4864)
	ret

AudioCommand_e5_\1: ; 48865 (11:4865)
	ret

AudioCommand_e6_\1: ; 48866 (11:4866)
	ret

AudioCommand_e7_\1: ; 48867 (11:4867)
	ld a, [bc]
	inc bc
	ld [wcf99], a
	ret

AudioCommand_ea_\1: ; 4886d (11:486d)
	ld hl, $22
	add hl, de
	ld a, [hl]
	and $bf
	ld [hl], a
	jr asm_487f_\1

AudioCommand_eb_\1: ; 48877 (11:4877)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
asm_487f_\1
	ld hl, $7
	add hl, de
	ld a, [bc]
	inc bc
	and $f
	swap a
	ld [hl], a
	ret

AudioCommand_ec_\1: ; 4888b (11:488b)
	ld hl, $22
	add hl, de
	ld a, [hl]
	or $40
	ld [hl], a
	ret

AudioCommand_e0_\1: ; 48894 (11:4894)
	ret

AudioEngineFunc_4895_\1: ; 48895 (11:4895)
	ld a, [bc]
	inc bc
	add hl, de
	ld [hl], a
	ret

AudioEngineFunc_489a_\1: ; 4889a (11:489a)
	ld a, [wChannel4]
	or a
	ret nz
	ld a, [wcf9a]
	or a
	jr z, .asm_48b5
	xor a
	ld [wcf9a], a
	ld a, [wcf95]
	and $77
	or $88
	ld [rNR51], a
	ld [wcf95], a
.asm_48b5
	ld a, [H_MusicCommand]
	and $f0
	swap a
	add a
	ld hl, AudioEnginePointers_4937_\1
	add l
	ld l, a
	jr nc, .asm_48c5
	inc h
.asm_48c5
	ld a, [hli]
	ld b, [hl]
	ld c, a
	jp AudioEngineFunc_48e0_\1

AudioEngineFunc_48cb_\1: ; 488cb (11:48cb)
	ld a, [wChannel4]
	or a
	ret nz
	ld hl, $11
	add hl, de
	dec [hl]
	ret nz
	ld hl, $c
	add hl, de
	ld a, [hl]
	or a
	ret z
	ld c, a
	inc hl
	ld b, [hl]
AudioEngineFunc_48e0_\1: ; 488e0 (11:48e0)
	ld a, [bc]
	inc bc
	ld [H_FFA5], a
	cp $ff
	jr nz, .asm_48f7
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld hl, $c
	add hl, de
	ld [hli], a
	ld [hl], a
	ret

.asm_48f7
	ld a, [H_FFA5]
	and $f0
	jr nz, .asm_491a
	ld hl, $10
	add hl, de
	ld a, [hli]
	ld [hl], a
	ld a, [H_FFA5]
	swap a
	ld [rNR42], a
	call AudioEngineFunc_4ba0_\1
	ld a, $80
	ld [rNR44], a
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	ret

.asm_491a
	cp $e0
	jr nz, .asm_492b
	ld a, [H_FFA5]
	and $f
	ld hl, $10
	add hl, de
	ld [hl], a
	jp AudioEngineFunc_48e0_\1

.asm_492b
	ld a, [bc]
	inc bc
	ld hl, $a
	add hl, de
	ld [hl], a
	ld [rNR43], a
	jp AudioEngineFunc_48e0_\1

AudioEnginePointers_4937_\1:
	dw AudioEngineData_4951_\1
	dw AudioEngineData_495d_\1
	dw AudioEngineData_4965_\1
	dw AudioEngineData_496d_\1
	dw AudioEngineData_4978_\1
	dw AudioEngineData_4985_\1
	dw AudioEngineData_4991_\1
	dw AudioEngineData_499d_\1
	dw AudioEngineData_49aa_\1
	dw AudioEngineData_49b7_\1
	dw AudioEngineData_49c7_\1
	dw AudioEngineData_49d3_\1
	dw AudioEngineData_49e2_\1

AudioEngineData_4951_\1:
	db $e1, $d0, $36, $0f, $d0, $37, $0f, $d0, $35, $03, $02, $ff

AudioEngineData_495d_\1:
	db $e1, $d0, $01, $09, $d0, $00, $04, $ff

AudioEngineData_4965_\1:
	db $e1, $d0, $01, $0c, $d0, $00, $06, $ff

AudioEngineData_496d_\1:
	db $e1, $d0, $01, $0b, $e6, $05, $04, $03, $02, $01, $ff

AudioEngineData_4978_\1:
	db $e1, $d0, $01, $0e, $e6, $07, $06, $05, $04, $03, $02, $01, $ff

AudioEngineData_4985_\1:
	db $e1, $d0, $15, $0b, $d0, $16, $e3, $05, $04, $03, $02, $ff

AudioEngineData_4991_\1:
	db $e1, $d0, $15, $0c, $d0, $16, $e3, $05, $04, $03, $02, $ff

AudioEngineData_499d_\1:
	db $e1, $d0, $15, $0d, $d0, $16, $e3, $05, $04, $03, $02, $01, $ff

AudioEngineData_49aa_\1:
	db $e1, $d0, $15, $0e, $d0, $07, $e3, $05, $04, $03, $02, $01, $ff

AudioEngineData_49b7_\1:
	db $e1, $d0, $4f, $0f, $d0, $3f, $0e, $d0, $3d, $e4, $05, $04, $03, $02, $01, $ff

AudioEngineData_49c7_\1:
	db $e1, $d0, $2c, $0c, $e6, $d0, $11, $0d, $0a, $06, $02, $ff

AudioEngineData_49d3_\1:
	db $e1, $d0, $3c, $0b, $d0, $4c, $0b, $d0, $5c, $0b, $07, $e3, $04, $02, $ff

AudioEngineData_49e2_\1:
	db $ff

ExecuteTrackFunction_\1: ; 489e3 (11:49e3)
	ld hl, $c
	add hl, de
	ld a, [hli]
	ld h, [hl]
	ld l, a
	jp [hl]

AudioEngineFunc_49eb_\1: ; 489eb (11:49eb)
	call AudioEngineFunc_4aa9_\1
	jp nc, AudioEngineFunc_4a4d_\1
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	add [hl]
	jr nc, .asm_49ff
	ld a, $f0
.asm_49ff
	ld hl, $8
	add hl, de
	ld [hl], a
	call SetCurChannelEnv_\1
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call SetCurChannelKik_\1
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, AudioEngineFunc_4434_\1
	ret

AudioEngineFunc_4a1a_\1: ; 48a1a (11:4a1a)
	call AudioEngineFunc_4aa9_\1
	jp nc, AudioEngineFunc_4a4d_\1
	ld hl, $8
	add hl, de
	ld a, [hl]
	ld hl, $f
	add hl, de
	sub [hl]
	jr nc, .asm_4a2e
	ld a, $10
.asm_4a2e
	ld hl, $8
	add hl, de
	ld [hl], a
	call SetCurChannelEnv_\1
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	call SetCurChannelKik_\1
	ld hl, $e
	add hl, de
	dec [hl]
	jp z, AudioEngineFunc_444a_\1
	ret

AudioEngineFunc_4a49_\1: ; 48a49 (11:4a49)
	call AudioEngineFunc_4aa9_\1
	ret c
AudioEngineFunc_4a4d_\1: ; 48a4d (11:4a4d)
	call AudioEngineFunc_4ab4_\1
	ld hl, $13
	add hl, de
	ld a, [hl]
	ld [H_MusicEngineBuffer], a
	and $f0
	call AudioEngineFunc_440a_\1
	ld bc, AudioEngineFunc_4a64_\1
	ld [hl], c
	inc hl
	ld [hl], b
	ret

AudioEngineFunc_4a64_\1:
	ld hl, $f
	add hl, de
	ld a, [hl]
	sub $10
	ld [hl], a
	ret nz
	ld hl, $e
	add hl, de
	ld a, [hl]
	dec a
	jr z, .asm_4a88
	ld [hl], a
	call AudioEngineFunc_4ab4_\1
	ld hl, $13
	add hl, de
	ld a, [hl]
	and $f
	swap a
	ld hl, $f
	add hl, de
	ld [hl], a
	ret

.asm_4a88
	ld hl, $8
	add hl, de
	ld [hl], $0
	call SetCurChannelEnv_\1
	push bc
	ld bc, .Null
	ld hl, $c
	add hl, de
	ld [hl], c
	inc hl
	ld [hl], b
	pop bc
	ld a, [H_CurChannel]
	cp $2
	ret z
	ld a, $80
	jp SetCurChannelKik_\1

.Null:
	ret

AudioEngineFunc_4aa9_\1: ; 48aa9 (11:4aa9)
	ld hl, $12
	add hl, de
	ld a, [hl]
	ld hl, $4
	add hl, de
	cp [hl]
	ret

AudioEngineFunc_4ab4_\1: ; 48ab4 (11:4ab4)
	ld hl, $8
	add hl, de
	ld a, [hl]
	or a
	jp z, AudioEngineFunc_4ac3_\1
	sub $10
	jr nz, AudioEngineFunc_4ac3_\1
	ld a, $10
AudioEngineFunc_4ac3_\1: ; 48ac3 (11:4ac3)
	ld [hl], a
	call SetCurChannelEnv_\1
	ld hl, $b
	add hl, de
	ld a, [hl]
	or $80
	jp SetCurChannelKik_\1

AudioEngineFunc_4ad1_\1: ; 48ad1 (11:4ad1)
	ld hl, $16
	add hl, de
	ld a, [hli]
	or a
	ret z
	ld a, [hl]
	or a
	jr z, .asm_4ade
	dec [hl]
	ret

.asm_4ade
	inc hl
	dec [hl]
	jr z, .asm_4ae3
	ret

.asm_4ae3
	ld hl, $15
	add hl, de
	ld a, [hli]
	inc hl
	inc hl
	ld [hl], a
	ld hl, $19
	add hl, de
	ld a, [hl]
	xor $1
	ld [hl], a
	ld hl, $16
	add hl, de
	ld a, [hl]
	jr z, .asm_4b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	add c
	ld c, a
	jr nc, .asm_4b06
	inc b
.asm_4b06
	ld hl, $a
	add hl, de
	ld a, c
	ld [hli], a
	call SetCurChannelFrq_\1
	ld a, b
	cp [hl]
	ret z
	ld [hl], a
	and $f
	jp SetCurChannelKik_\1

.asm_4b18
	ld hl, $a
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
.asm_4b1f
	dec bc
	dec a
	jr nz, .asm_4b1f
	jr .asm_4b06

SetCurChannelEnt_\1: ; 48b25 (11:4b25)
	call IsSFXChannel_\1
	ret nz
	push hl
	ld hl, EntPointers_\1
	jr SetCurChannelAudioRegister_Continue_\1

SetCurChannelLen_\1: ; 48b2f (11:4b2f)
	call IsSFXChannel_\1
	ret nz
	push hl
	ld hl, LenPointers_\1
	jr SetCurChannelAudioRegister_Continue_\1

SetCurChannelEnv_\1: ; 48b39 (11:4b39)
	call IsSFXChannel_\1
	ret nz
	push hl
	ld a, [H_CurChannel]
	cp $2
	jr nz, .asm_4b5d
	ld a, [H_MusicEngineBuffer]
	swap a
	and $f
	ld hl, AudioEngineData_4bec_\1
	add l
	ld l, a
	jr nc, .asm_4b54
	inc h
.asm_4b54
	ld a, [hl]
	ld [H_MusicEngineBuffer], a
	ld hl, EnvPointers_\1
	jr SetCurChannelAudioRegister_Continue_\1

.asm_4b5d
	ld a, [H_MusicEngineBuffer]
	and $f0
	or $8
	ld [H_MusicEngineBuffer], a
	ld hl, EnvPointers_\1
	jr SetCurChannelAudioRegister_Continue_\1

SetCurChannelFrq_\1: ; 48b6c (11:4b6c)
	call IsSFXChannel_\1
	ret nz
	push hl
	ld hl, FrqPointers_\1
	jr SetCurChannelAudioRegister_Continue_\1

SetCurChannelKik_\1: ; 48b76 (11:4b76)
	call IsSFXChannel_\1
	ret nz
	push hl
	ld hl, KikPointers_\1
SetCurChannelAudioRegister_Continue_\1
	ld a, [H_CurChannel]
	add a
	add l
	ld l, a
	jr nc, .asm_4b87
	inc h
.asm_4b87
	ld a, [hli]
	ld h, [hl]
	ld l, a
	ld a, [H_MusicEngineBuffer]
	ld [hl], a
	pop hl
	ret

IsSFXChannel_\1: ; 48b90 (11:4b90)
	ld [H_MusicEngineBuffer], a
	ld a, [H_CurChannel]
	or a
	jr nz, .no_sfx
	ld a, [wChannel5]
	or a
	ret

.no_sfx
	xor a
	ret

AudioEngineFunc_4ba0_\1: ; 48ba0 (11:4ba0)
	ld [H_MusicEngineBuffer], a
	ld a, [H_CurChannel]
	add wcff0 % $100
	ld l, a
	ld h, wcff0 / $100
	ld a, [H_MusicEngineBuffer]
	ld [hl], a
	ret

EntPointers_\1:
	dw rNR10, rNR20, rNR30, rNR40, rNR10, rNR40
LenPointers_\1:
	dw rNR11, rNR21, rNR31, rNR41, rNR11, rNR41
EnvPointers_\1:
	dw rNR12, rNR22, rNR32, rNR42, rNR12, rNR42
FrqPointers_\1:
	dw rNR13, rNR23, rNR33, rNR43, rNR13, rNR43
KikPointers_\1:
	dw rNR14, rNR24, rNR34, rNR44, rNR14, rNR44

AudioEngineData_4bec_\1:
	db $00, $60, $40, $20
	db $00, $00, $00, $00

PlayMusic_\1: ; 48bf4 (11:4bf4)
	xor a
	ld [wMusicFade], a
	ld [wCurMusicFade], a
	ld [wcf9b], a
	ld [wcfb0], a
	ld [wcfb1], a
	ld [wcfb4], a
	ld [wcfb5], a
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wVolume], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, MusicPointers_\1
	ld a, [H_MusicID]
	jp PlayAudioPointer_\1

PlaySFX_\1: ; 48c22 (11:4c22)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wVolume], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, SFXPointers_\1
	ld a, [H_SFX_ID]
	jp PlayAudioPointer_\1

PlayRingtone_\1: ; 48c3a (11:4c3a)
	ld a, $80
	ld [rNR52], a
	ld a, $77
	ld [wVolume], a
	ld [rNR50], a
	ld a, $ff
	ld [rNR51], a
	ld hl, RingtonePointers_\1
	xor a
	ld [wcfc8], a
	ld a, [H_Ringtone]
	and $80
	jr z, .not_ram
	ld a, $ff
	ld [wcfc8], a
.not_ram
	ld a, [H_Ringtone]
	and $7f
	ld [wRingtoneID], a
	cp $50
	jr c, .not_sram
	jp .GetSRamPointer

.not_sram
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
.Finish: ; 48c71 (11:4c71)
	ld a, [hli]
	ld [wRingtonePointer], a
	ld [wcfc3], a
	ld a, [hl]
	ld [wRingtonePointer + 1], a
	ld [wcfc4], a
	ld a, $1
	ld [wcfc7], a
	ld a, $fe
	ld [wcfc5], a
	ld a, $8
	ld [rNR10], a
	ld [rNR12], a
	xor a
	ld [wcfc6], a
	ld [rNR11], a
	ld [rNR13], a
	ld [rNR30], a
	ld [rNR31], a
	ld [rNR32], a
	ld [rNR33], a
	ld a, $80
	ld [rNR14], a
	ld [rNR34], a
	xor a
	ld [wChannel4], a
	ld [wChannel5], a
	ret

.GetSRamPointer: ; 48cad (11:4cad)
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld a, [hli]
	ld c, a
	ld h, [hl]
	ld l, c
	ld a, [hli]
	ld [wAudioSRAMBank], a
	jp .Finish

AudioEngineFunc_4cbe_\1:
; ????
	enable_sram
	ld a, c
	ld [MBC3SRamBank], a
asm_4cc7_\1
	inc bc
	inc bc
asm_4cc9_\1
	ld a, [H_CurChannel]
	inc a
	ld [H_CurChannel], a
	cp $6
	jr nz, .next_channel
	ret

.next_channel
	ld hl, $28
	add hl, de
	ld e, l
	ld d, h
	jr asm_4cf7_\1

PlayAudioPointer_\1: ; 48cdd (11:4cdd)
	dec a
	ld e, a
	ld d, $0
	add hl, de
	add hl, de
	ld c, [hl]
	inc hl
	ld b, [hl]
	ld a, [bc]
	ld [wChannelFlagsBuffer], a
	inc bc
	ld a, [bc]
	ld [wCurChannelFlags], a
	inc bc
	ld de, wChannel1
	xor a
	ld [H_CurChannel], a
asm_4cf7_\1
	ld a, [wChannelFlagsBuffer]
	add a
	ld [wChannelFlagsBuffer], a
	jr nc, asm_4cc9_\1
	ld hl, $0
	add hl, de
	ld a, [wCurChannelFlags]
	cp [hl]
	jr c, asm_4cc7_\1
	push de
	ld l, wChannel2 - wChannel1
	xor a
.clear_channel
	ld [de], a
	inc de
	dec l
	jr nz, .clear_channel
	pop de
	ld hl, $4
	add hl, de
	ld [hl], $1
	ld hl, $b
	add hl, de
	ld [hl], $ff
	call AudioCommand_e6_\1 ; ret
	ld a, [H_CurChannel]
	cp $5
	jr nz, .not_ch6
	ld a, [wChannel4]
	or a
	jp nz, .skip_init_registers
	xor a
	ld [rNR41], a
	ld [rNR42], a
	ld [rNR43], a
	ld a, $80
	ld [rNR44], a
	jp .skip_init_registers

.not_ch6
	push bc
	ld hl, AudioEngineData_4d95_\1
	ld a, [H_CurChannel]
	or a
	jr z, .set
	ld b, $0
	cp $1
	jr nz, .check_ch3
	ld c, 5
	jr .offset

.check_ch3
	cp $2
	jr nz, .check_ch4
	ld c, 10
	jr .offset

.check_ch4
	cp $3
	jr nz, .ch5
	ld c, 15
	jr .offset

.ch5
	ld c, 20
.offset
	add hl, bc
.set
	pop bc
	ld a, [hli]
	cp $ee
	call nz, SetCurChannelEnt_\1
	ld a, [hli]
	call SetCurChannelLen_\1
	ld a, [hli]
	call SetCurChannelEnv_\1
	ld a, [hli]
	call SetCurChannelFrq_\1
	ld a, [hl]
	call SetCurChannelKik_\1
.skip_init_registers
	ld hl, $0
	add hl, de
	ld a, [wCurChannelFlags]
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hli], a
	ld a, [bc]
	inc bc
	ld [hl], a
	ld hl, $22
	add hl, de
	ld a, $80
	ld [hl], a
	jp asm_4cc9_\1

AudioEngineData_4d95_\1:
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80
	db $00, $00, $00, $00, $80
	db $ee, $00, $08, $00, $80
	db $08, $00, $08, $00, $80
	db $ee, $00, $08, $00, $80

AudioEnginePointers_4db3_\1:
	dw AudioEngineData_4dd5_\1
	dw AudioEngineData_4de5_\1
	dw AudioEngineData_4df5_\1
	dw AudioEngineData_4e05_\1
	dw AudioEngineData_4e15_\1
	dw AudioEngineData_4e25_\1
	dw AudioEngineData_4e35_\1
	dw AudioEngineData_4e45_\1
	dw AudioEngineData_4e55_\1
	dw AudioEngineData_4e65_\1
	dw AudioEngineData_4e75_\1
	dw AudioEngineData_4e85_\1
	dw AudioEngineData_4e95_\1
	dw AudioEngineData_4ea5_\1
	dw AudioEngineData_4eb5_\1
	dw AudioEngineData_4ec5_\1
	dw AudioEngineData_4ed5_\1

AudioEngineData_4dd5_\1: db $00, $00, $00, $00, $00, $00, $00, $00, $ff, $ff, $ff, $ff, $ff, $ff, $ff, $ff
AudioEngineData_4de5_\1: db $00, $11, $23, $46, $8c, $de, $ef, $ff, $ff, $ee, $dc, $b9, $73, $21, $10, $00
AudioEngineData_4df5_\1: db $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8, $08, $f8
AudioEngineData_4e05_\1: db $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d, $02, $8d, $fd, $8d
AudioEngineData_4e15_\1: db $01, $24, $8b, $de, $fe, $eb, $84, $21, $01, $24, $8b, $de, $fe, $eb, $84, $21
AudioEngineData_4e25_\1: db $9b, $ce, $fd, $cb, $ba, $aa, $99, $88, $77, $66, $55, $54, $43, $20, $13, $46
AudioEngineData_4e35_\1: db $bf, $ff, $da, $88, $76, $31, $01, $37, $bc, $ef, $ec, $98, $77, $52, $00, $04
AudioEngineData_4e45_\1: db $b9, $53, $02, $44, $56, $8b, $cb, $ac, $df, $ec, $d6, $74, $33, $24, $35, $20
AudioEngineData_4e55_\1: db $fc, $d5, $63, $43, $64, $46, $86, $47, $66, $06, $ce, $96, $49, $64, $64, $34
AudioEngineData_4e65_\1: db $f8, $0c, $5a, $87, $a7, $89, $87, $98, $79, $87, $98, $7a, $79, $a5, $c0, $7f
AudioEngineData_4e75_\1: db $8f, $0c, $49, $67, $89, $6b, $3f, $07, $8f, $0c, $49, $67, $89, $6b, $3f, $07
AudioEngineData_4e85_\1: db $f0, $a5, $97, $87, $87, $86, $a5, $f0, $f0, $a5, $97, $87, $87, $86, $a5, $f0
AudioEngineData_4e95_\1: db $fc, $ba, $a9, $98, $76, $65, $54, $30, $fc, $ba, $a9, $98, $76, $65, $54, $30
AudioEngineData_4ea5_\1: db $8f, $6c, $28, $5f, $0a, $6d, $39, $07, $8f, $6c, $28, $5f, $0a, $6d, $39, $07
AudioEngineData_4eb5_\1: db $fa, $b7, $97, $84, $b7, $86, $84, $50, $fa, $b7, $97, $84, $b7, $86, $84, $50
AudioEngineData_4ec5_\1: db $bf, $dc, $dc, $b9, $64, $32, $32, $04, $bf, $dc, $dc, $b9, $64, $32, $32, $04
AudioEngineData_4ed5_\1: db $be, $de, $96, $76, $98, $95, $12, $14, $be, $de, $96, $76, $98, $95, $12, $14
ENDM
