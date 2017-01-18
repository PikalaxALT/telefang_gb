Func_1c9b: ; 1c9b (0:1c9b)
	ld a, [wdc05]
	and a
	ret z
	ld a, [wdc04]
	and a
	ret nz
	ld a, [wdc00]
	and a
	ret z
	ld a, [wdc04]
	and a
	ret nz
	ld a, $81
	ld [rSC], a
	ret

Serial: ; 1cb4 (0:1cb4)
	push af
	push bc
	push de
	push hl
	xor a
	ld [wdc07], a
	ld a, [wdc05]
	cp $2
	jr z, .asm_1cfb
	ld a, [rSB]
	cp $b2
	jr z, .asm_1cdc
	cp $fd
	jr z, .asm_1ce8
	xor a
	ld [wdc00], a
	ld a, $ff
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jp Func_1d1e

.asm_1cdc
	ld a, $2
	ld [wdc05], a
	ld a, $1
	ld [wdc00], a
	jr .asm_1cf1

.asm_1ce8
	ld a, $2
	ld [wdc05], a
	xor a
	ld [wdc00], a
.asm_1cf1
	xor a
	ld [rSB], a
	ld a, $80
	ld [rSC], a
	jp Func_1d1e

.asm_1cfb
	ld a, $1
	ld [wdc04], a
	ld a, [rSB]
	ld [wInternalSerialReceiveBuffer], a
	ld a, [wInternalSerialSendBuffer]
	ld [rSB], a
	ld bc, $20
	call Serial_WaitCycles
	ld a, $80
	ld [rSC], a
	xor a
	ld [wdc04], a
	call Func_1da5
	call Func_1d84
Func_1d1e: ; 1d1e (0:1d1e)
	pop hl
	pop de
	pop bc
	pop af
	reti

InitSerialData: ; 1d23 (0:1d23)
	ld hl, wSerialSendQueue
	ld bc, $300
	call ClearMemory3
	ld a, $ff
	ld [rSB], a
	ld [wdc06], a
	ld a, $80
	ld [rSC], a
	ret

Func_1d38:
	ld a, $1
	ld [wdc01], a
	ld a, $fd
	ld [rSB], a
	ld a, $81
	ld [rSC], a
	ret

Func_1d46: ; 1d46 (0:1d46)
	ld a, [wdc05]
	and a
	ret nz
	ld a, $b2
	ld [rSB], a
	ld [wdc06], a
	ld a, $80
	ld [rSC], a
	ret

Serial_WaitCycles:
.asm_1d57
	dec bc
	ld a, b
	or c
	jr nz, .asm_1d57
	ret

Func_1d5d: ; 1d5d
	ld hl, wSerialReceiveQueue
	ld bc, $100
	jp ClearMemory3

StageNthByteForSerialSend: ; 1d66 (0:1d66)
	di
	ld a, $1
	ld [wDataStagedForSerialSend], a
	ld a, [wSerialSendQueueSize]
	ld l, a
	ld h, wSerialSendQueue / $100
	ld a, [wSerialSend]
	ld [hl], a
	inc l
	or a
	jr z, .asm_1d82
	ld a, l
	ld [wSerialSendQueueSize], a
	xor a
	ld [wSerialSend], a
.asm_1d82
	ei
	ret

Func_1d84:
	ld a, [wDataStagedForSerialSend]
	and a
	jr z, .asm_1da0
	xor a
	ld [wDataStagedForSerialSend], a
	ld a, [wSerialSendQueuePointer]
	ld l, a
	ld h, wSerialSendQueue / $100
	ld a, [hl]
	inc l
	ld [wInternalSerialSendBuffer], a
	or a
	ret z
	ld a, l
	ld [wSerialSendQueuePointer], a
	ret

.asm_1da0
	xor a
	ld [wInternalSerialSendBuffer], a
	ret

Func_1da5:
	ld a, $1
	ld [wDataStagedForSerialReceive], a
	ld a, [wSerialReceiveQueueSize]
	ld l, a
	ld h, wSerialReceiveQueue / $100
	ld a, [wInternalSerialReceiveBuffer]
	ld [hl], a
	inc l
	or a
	ret z
	ld a, l
	ld [wSerialReceiveQueueSize], a
	ret

GetNthByteReceivedFromSerial: ; 1dbc (0:1dbc)
	di
	ld a, [wDataStagedForSerialReceive]
	and a
	jr z, .nope
	xor a
	ld [wDataStagedForSerialReceive], a
	ld a, [wSerialReceiveQueuePointer]
	ld l, a
	ld h, wSerialReceiveQueue / $100
	ld a, [hl]
	inc l
	ld [wSerialReceive], a
	or a
	jr z, .done
	ld a, l
	ld [wSerialReceiveQueuePointer], a
.done
	ei
	ret

.nope
	xor a
	ld [wSerialReceive], a
	ei
	ret
