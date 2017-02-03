OverworldPhonecallCheck: ; a4ba4 (29:4ba4)
	ld a, [wPhoneCallRingtoneTimer]
	or a
	ret z
	ld a, [wc9de]
	or a
	jr nz, .stop_ringing
	call CheckInOverworld
	jr nz, .stop_ringing
	ld a, [wMapGroup]
	cp $b
	jr z, .stop_ringing
	ld a, [wcd00]
	or a
	jp nz, .stop_ringing
	ld a, [wDShotReceptionLevel]
	or a
	jr nz, .timer_check
.stop_ringing
	ld a, $0
	ld [wPhoneCallRingtoneTimer], a
	ld a, $0
	ld [wPhoneIsRinging], a
	ld a, $3
	ld [wOverworldRingtoneSubroutine], a
	ret

.timer_check
	ld a, [wPhoneCallRingtoneTimer]
	cp 200
	jr c, .try_advance_timer
	ld a, [wPhoneCallRingtoneTimer]
	dec a
	ld [wPhoneCallRingtoneTimer], a
	ret

.try_advance_timer
	ld a, [wPlayerObjectStruct_Duration + 18]
	cp $0
	ret nz
	ld a, [wVBlankCounter]
	and $3
	jr nz, .check_picked_up
	ld a, [wPhoneCallRingtoneTimer]
	dec a
	ld [wPhoneCallRingtoneTimer], a
	jr nz, .check_picked_up
	ld a, $0
	ld [wPhoneIsRinging], a
	call ResumeNormalMusicIfPhoneIsRinging
.check_picked_up
	ld a, [hJoyNew]
	and A_BUTTON
	ret z
	ld a, $0
	ld [wPhoneCallRingtoneTimer], a
	call ResumeNormalMusicIfPhoneIsRinging
	ld a, [wPhoneCallDenjuuAddressBookPointer]
	ld e, a
	ld a, [wPhoneCallDenjuuAddressBookPointer + 1]
	ld d, a
	enable_sram sAddressBook
	ld a, $7
	add e
	ld e, a
	ld a, $0
	adc d
	ld d, a
	ld a, [de]
	dec de
	push af
	call GetDenjuuNicknameFromAdddressBookOffset
	enable_sram sAddressBook
	ld a, [wPhoneCallDenjuuAddressBookPointer]
	ld l, a
	ld a, [wPhoneCallDenjuuAddressBookPointer + 1]
	ld h, a
	ld a, [hl]
	ld b, a
	ld [wCustomSpriteDest], a
	callba CopySpeciesNameBToCA53
	disable_sram
	call OverworldRandom8_
	cp $b4
	jr nc, .std_text_1
	call SamplePhoneCallFromStdTextPool
	jr .print

.std_text_1
	ld a, $0
	ld [wc942], a
	ld a, [wc943]
	ld c, a
	inc a
	cp 200
	jr c, .get_text_pointer
	xor a
.get_text_pointer
	ld [wc943], a
	ld e, $15
	call Multiply_C_by_E
	ld hl, Data_98000
	add hl, de
	ld a, l
	ld [wPhoneCallPointerOrIdxs], a
	ld a, h
	ld [wPhoneCallPointerOrIdxs + 1], a
.print
	callba Func_2cea0
	ld b, $0
	ld c, $99
	pop af
	call PrintMapObjectText_
	ld a, $4
	ld [wPhoneCallSubroutine], a
	ret

CallContact: ; a4c9b (29:4c9b)
	ld a, [wc912]
	ld [wCustomSpriteDest], a
SamplePhoneCallFromStdTextPool: ; a4ca1 (29:4ca1)
	push hl
	push de
	call OverworldRandom8_
	cp $99
	jr c, .okay1
	ld a, $1
	ld [wc942], a
	call OverworldRandom8_
	ld c, a
	ld e, $69
	call Multiply_C_by_E
	ld l, d
	ld b, $13
	ld a, l
	ld [wPhoneCallPointerOrIdxs], a
	ld a, b
	ld [wPhoneCallPointerOrIdxs + 1], a
	jr .finish

.okay1
	ld a, $1
	ld [wc942], a
	ld a, [wcd26]
	ld e, a
	ld c, 10
	call Multiply_C_by_E
	ld a, [wc944]
	ld c, a
	inc a
	cp 10
	jr c, .okay2
	xor a
.okay2
	ld [wc944], a
	add e
	ld b, $12
	ld [wPhoneCallPointerOrIdxs], a
	ld a, b
	ld [wPhoneCallPointerOrIdxs + 1], a
.finish
	callba Func_2cea0
	ld a, [wPhoneCallPointerOrIdxs + 1]
	ld b, a
	ld a, [wPhoneCallPointerOrIdxs]
	ld c, a
	pop de
	pop hl
	ret

PhoneCall_PrintText:
	ld a, [wc942]
	or a
	jr z, .has_prompt
	ld a, [wPhoneCallSubroutine]
	inc a
	ld [wPhoneCallSubroutine], a
	cp $6
	jp z, .end_call
	ld a, [wPhoneCallPointerOrIdxs]
	ld c, a
	ld a, [wPhoneCallPointerOrIdxs + 1]
	ld b, a
	jp .print_text

.has_prompt
	ld a, [wPhoneCallSubroutine]
	cp $4
	jr z, .std_phone_call
	cp $5
	jr z, .prompt
	cp $6
	jr z, .prompt
	jp .end_call

.std_phone_call
	ld a, [wPhoneCallPointerOrIdxs]
	ld l, a
	ld a, [wPhoneCallPointerOrIdxs + 1]
	ld h, a
	call GetPhoneCallData
	jr .load_idxs

.prompt
	ld a, [wPhoneCallPointerOrIdxs]
	ld l, a
	ld a, [wPhoneCallPointerOrIdxs + 1]
	ld h, a
	ld bc, EVENT_SAID_YES
	call CheckEventFlag
	jr nz, .said_yes
	ld bc, EVENT_SAID_NO
	call CheckEventFlag
	jr nz, .said_no
	jr .end_call

.said_yes
	call GetPhoneCallData
	inc hl
	inc hl
	inc hl
.load_idxs
	ld a, l
	ld [wPhoneCallPointerOrIdxs], a
	ld a, h
	ld [wPhoneCallPointerOrIdxs + 1], a
	call AdjustFDInPhoneCall
	ld a, [wPhoneCallSubroutine]
	inc a
	ld [wPhoneCallSubroutine], a
.print_text
	ld a, $2
	ld [wTextSubfunction], a
	ld a, $c0
	ld [wTextBoxStartTile], a
	ld a, $e0
	ld [wTileWhere0IsLoaded], a
	ld a, $5
	ld [wca65], a
	ld d, $c
	call LoadAndStartStdTextPointer_
	ld a, $2
	ld [wTextDelayTimerReset], a
	ld a, $2
	ld [wcada], a
	callba ClearTextboxInterior
	callba DrawPhoneTextbox
	ret

.said_no
	inc hl
	inc hl
	inc hl
	call GetPhoneCallData
	ld a, $6
	add l
	ld l, a
	ld a, $0
	adc h
	ld h, a
	jp .load_idxs

.end_call
	ld a, $1
	ld [wPhoneCallSubroutine], a
	ld a, $8
	ld [wScriptDelay], a
	ret

AdjustFDInPhoneCall: ; a4dbb (29:4dbb)
	push bc
	enable_sram sAddressBook
	ld hl, sAddressBook + 2 ; FD
	ld a, [wCallerID]
	ld c, a
	ld b, $0
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	sla c
	rl b
	add hl, bc
	ld a, [hl]
	bit 7, e
	jr nz, .negative
	add e
	jr nc, .okay
	ld a, $ff
	jr .okay

.negative
	add e
	jr c, .okay
	xor a
.okay
	ld [hl], a
	ld c, a
	ld a, [wOAMAnimation12_Duration + 3]
	ld b, a
	ld a, c
	sub b
	ld [wOAMAnimation12_Duration + 6], a
	disable_sram
	pop bc
	ret
