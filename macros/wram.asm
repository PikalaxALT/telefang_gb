oam_animation_struct: MACRO
\1_PriorityFlags:: db
\1_TemplateBank:: db
\1_TemplateIdx:: db
\1_XCoord:: db
\1_YCoord:: db
\1_Palette:: db
	ds 2
\1_Duration:: db
	ds $17
ENDM

battle_struct: MACRO
\1Species:: ds 1
\1Level:: ds 1
\1CurHP:: ds 1
\1MaxHP:: ds 1
\1Speed:: ds 1
\1Field0x05:: ds 1
\1Field0x06:: ds 1
\1ArrivedStatus:: ds 1
\1Field0x08:: ds 1
\1Field0x09:: ds 1
\1FD:: ds 1
\1MoveTarget:: ds 1
\1Field0x0c:: ds 1
\1AddressBookLocation:: ds 1
\1Attack:: ds 1
\1Defense:: ds 1
\1SpAtk:: ds 1
\1SpDef:: ds 1
\1Field0x12:: ds 1
\1SpeedCopy1:: ds 1
\1SpeedCopy2:: ds 1
\1Field0x15:: ds 1
ENDM
