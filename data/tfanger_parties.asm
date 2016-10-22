IF DEF(POWER)
; TFanger 01
	db KESHI, 8, 0, 50, 6, 6
	db OSHE, 5, 0, 20, 2, 2
	db 0, 0, 0, 0, 0, 0
ELSE
; TFanger 01
	db TSUNONASU, 8, 0, 50, 6, 6
	db OSHE, 5, 0, 20, 2, 2
	db 0, 0, 0, 0, 0, 0
ENDC

; TFanger 02
	db SUGURI, 8, 0, 50, 3, 3
	db PAMPAS, 7, 0, 20, 1, 1
	db 0, 0, 0, 0, 0, 0

; TFanger 03
	db NORIUTSUGI, 10, 0, 50, 1, 1
	db PUNICA, 8, 0, 30, 10, 10
	db MYRTUS, 5, 0, 20, 8, 8

; TFanger 04
	db RHODANTHE, 9, 0, 50, 7, 7
	db 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0

; TFanger 05
	db NORIUTSUGI, 10, 0, 50, 9, 9
	db 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0

IF DEF(POWER)
; TFanger 06
	db NORIUTSUGI, 10, 0, 50, 3, 3
	db KESHI, 8, 0, 20, 4, 4
	db 0, 0, 0, 0, 0, 0

; TFanger 07
	db IXORA, 11, 0, 50, 1, 1
	db LICORICE, 8, 0, 50, 10, 10
	db 0, 0, 0, 0, 0, 0
ELSE
; TFanger 06
	db TSUNONASU, 10, 0, 50, 3, 3
	db NORIUTSUGI, 8, 0, 20, 4, 4
	db TSUNONASU, 0, 0, 0, 5, 5

; TFanger 07
	db IXORA, 11, 0, 50, 1, 1
	db RHODANTHE, 8, 0, 50, 10, 10
	db 0, 0, 0, 0, 0, 0
ENDC

; TFanger 08
	db LICORICE, 9, 0, 50, 9, 9
	db IXORA, 9, 0, 50, 1, 1
	db 0, 0, 0, 0, 0, 0

; TFanger 09
	db LAPEIROUSIA, 10, 0, 50, 1, 1
	db PUNICA, 8, 0, 50, 11, 11
	db 0, 0, 0, 0, 0, 0

; TFanger 10
	db LAPEIROUSIA, 10, 0, 50, 6, 6
	db PUNICA, 9, 0, 50, 4, 4
	db 0, 0, 0, 0, 0, 0

; TFanger 11
	db SORGHUM, 13, 0, 50, 9, 9
	db LICORICE, 10, 0, 50, 3, 3
	db SUGURI, 10, 0, 30, 10, 10

IF DEF(POWER)
; TFanger 12
	db ANGIOS, 20, 2, 50, 9, 9
	db 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0

; TFanger 13
	db ANGIOS, 60, 11, 50, 5, 5
	db RAYGIRTH, 56, 11, 50, 3, 3
	db 0, 0, 0, 0, 0, 0

ELSE
; TFanger 12
	db GYMNOS, 20, 2, 50, 9, 9
	db 0, 0, 0, 0, 0, 0
	db 0, 0, 0, 0, 0, 0

; TFanger 13
	db GYMNOS, 60, 11, 50, 5, 5
	db RAYGIRTH, 56, 11, 50, 3, 3
	db 0, 0, 0, 0, 0, 0
ENDC

; TFanger 14
	db GENTIANA, 64, 13, 50, 3, 3
	db DIPSACUS, 62, 13, 50, 3, 3
	db MAORAN, 61, 13, 50, 4, 4

; TFanger 15
	db KOCHIA, 18, 2, 50, 9, 9
	db MONSTERA, 18, 0, 50, 10, 10
	db 0, 0, 0, 0, 0, 0

; TFanger 16
	db NORIUTSUGI, 19, 2, 50, 11, 11
	db OSHE, 19, 2, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

IF DEF(POWER)
; TFanger 17
	db HIOUGI, 20, 2, 50, 3, 3
	db GUMI, 20, 2, 50, 5, 5
	db 0, 0, 0, 0, 0, 0

; TFanger 18
	db MYRTUS, 24, 2, 50, 4, 4
	db KOCHIA, 24, 0, 50, 4, 4
	db PUNICA, 24, 2, 50, 0, 0

; TFanger 19
	db GANRAIKOU, 25, 2, 50, 1, 1
	db HIOUGI, 25, 3, 50, 3, 3
	db OSHE, 25, 0, 50, 9, 9

; TFanger 20
	db DRILARMOR, 26, 4, 50, 8, 8
	db IXORA, 26, 4, 50, 5, 5
	db NORIUTSUGI, 26, 1, 50, 2, 2

; TFanger 21
	db DRILARMOR, 32, 17, 50, 1, 1
	db BYAKUBU, 32, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 22
	db SHELLSTERA, 32, 17, 50, 7, 7
	db LICORICE, 32, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0
ELSE
; TFanger 17
	db BUBARIA, 20, 2, 50, 3, 3
	db GUMI, 20, 2, 50, 5, 5
	db 0, 0, 0, 0, 0, 0

; TFanger 18
	db LICORICE, 24, 2, 50, 4, 4
	db KOCHIA, 24, 0, 50, 4, 4
	db PUNICA, 24, 2, 50, 0, 0

; TFanger 19
	db GANRAIKOU, 25, 2, 50, 1, 1
	db BUBARIA, 25, 3, 50, 3, 3
	db OSHE, 25, 0, 50, 9, 9

; TFanger 20
	db DRILARMOR, 26, 4, 50, 8, 8
	db RHODANTHE, 26, 4, 50, 5, 5
	db NORIUTSUGI, 26, 1, 50, 2, 2

; TFanger 21
	db DRILARMOR, 32, 17, 50, 1, 1
	db ERYNGO, 32, 17, 50, 6, 6
	db TSUNONASU, 0, 17, 0, 6, 6

; TFanger 22
	db LICORICE, 32, 17, 50, 7, 7
	db SHELLSTERA, 32, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0
ENDC

; TFanger 23
	db PAMPAS, 32, 17, 50, 1, 1
	db SHELLSTERA, 32, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

IF DEF(POWER)
; TFanger 24
	db BUBARIA, 32, 17, 50, 9, 9
	db BERZELIA, 32, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0
ELSE
; TFanger 24
	db SHELLSTERA, 32, 17, 50, 9, 9
	db BERZELIA, 32, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0
ENDC

; TFanger 25
	db GERON, 32, 17, 50, 8, 8
	db GANRAIKOU, 32, 17, 50, 9, 9
	db 0, 0, 0, 0, 0, 0

IF DEF(POWER)
; TFanger 26
	db WARUTAH, 53, 6, 50, 3, 3
	db FIREKOKKO, 48, 6, 50, 2, 2
	db HITODEIGHT, 47, 6, 50, 2, 2

; TFanger 27
	db GUNTZATL, 53, 6, 50, 9, 9
	db SHELLSTERA, 48, 6, 50, 9, 9
	db GHOSBOAR, 47, 6, 50, 1, 1

; TFanger 28
	db BALLTAMUS, 53, 6, 50, 2, 2
	db BERZELIA, 50, 6, 50, 5, 5
	db WORMITERALA, 47, 6, 50, 1, 1

; TFanger 29
	db ZUDOON, 51, 6, 50, 3, 3
	db HELIOPSIS, 50, 6, 50, 3, 3
	db MIDOTOR, 47, 6, 50, 0, 0

; TFanger 30
	db HELIOPSIS, 53, 6, 50, 1, 1
	db CHAMELAN, 47, 6, 50, 10, 10
	db OBANA, 47, 6, 50, 1, 1

; TFanger 31
	db CHAMELAN, 49, 9, 50, 7, 7
	db BERZELIA, 50, 9, 50, 5, 5
	db HELIOPSIS, 49, 9, 50, 3, 3
ELSE
; TFanger 26
	db WARUTAH, 53, 6, 50, 3, 3
	db FIREKOKKO, 48, 6, 50, 2, 2
	db GADHORO, 47, 6, 50, 2, 2

; TFanger 27
	db GUNTZATL, 53, 6, 50, 9, 9
	db SHELLSTERA, 48, 6, 50, 9, 9
	db ARANEIDA, 47, 6, 50, 1, 1

; TFanger 28
	db BADHORO, 53, 6, 50, 2, 2
	db BERZELIA, 50, 6, 50, 5, 5
	db WORMITERALA, 47, 6, 50, 1, 1

; TFanger 29
	db ARAKUIDA, 51, 6, 50, 3, 3
	db HELIOPSIS, 50, 6, 50, 3, 3
	db REIGE, 47, 6, 50, 0, 0

; TFanger 30
	db KIYORUKA, 53, 6, 50, 1, 1
	db DRILARMOR, 47, 6, 50, 10, 10
	db OBANA, 47, 6, 50, 1, 1

; TFanger 31
	db ZUDOON, 49, 9, 50, 7, 7
	db BERZELIA, 50, 9, 50, 5, 5
	db HELIOPSIS, 49, 9, 50, 3, 3
ENDC

; TFanger 32
	db GAMAZUMI, 51, 9, 50, 6, 6
	db WARUTAH, 50, 9, 50, 8, 8
	db BURENICA, 52, 9, 50, 3, 3

; TFanger 33
	db GUNTZATL, 50, 9, 50, 5, 5
	db BOUVARDI, 51, 9, 50, 3, 3
	db FIREKOKKO, 50, 9, 50, 1, 1

; TFanger 34
	db FIREKOKKO, 48, 11, 50, 10, 10
	db RAYGOTEN, 49, 11, 50, 8, 8
	db SORGHUM, 47, 11, 50, 0, 0

IF DEF(POWER)
; TFanger 35
	db CHAMELAN, 46, 11, 50, 0, 0
	db DRILARMOR, 46, 11, 50, 7, 7
	db GODETIA, 46, 11, 50, 3, 3
ELSE
; TFanger 35
	db ARAKUIDA, 46, 11, 50, 0, 0
	db DRILARMOR, 46, 11, 50, 7, 7
	db GODETIA, 46, 11, 50, 3, 3
ENDC

; TFanger 36
	db BURENICA, 47, 11, 50, 11, 11
	db SHELLSTERA, 48, 11, 50, 4, 4
	db NIGELLA, 48, 11, 50, 5, 5

; TFanger 37
	db RAYGOTEN, 47, 11, 50, 7, 7
	db GERON, 47, 11, 50, 4, 4
	db OBANA, 47, 11, 50, 10, 10

; TFanger 38
	db FIREKOKKO, 49, 11, 50, 4, 4
	db GODETIA, 49, 11, 50, 6, 6
	db ARMARU, 48, 11, 50, 7, 7

IF DEF(POWER)
; TFanger 39
	db DIPSACUS, 56, 12, 50, 4, 4
	db CHAMELAN, 54, 12, 50, 3, 3
	db CORTOS, 54, 12, 50, 11, 11

; TFanger 40
	db GAMAZUMI, 53, 12, 50, 3, 3
	db BALLTAMUS, 55, 12, 50, 5, 5
	db SCORPIL, 52, 12, 50, 4, 4

; TFanger 41
	db KIYORUKA, 54, 11, 50, 8, 8
	db SHELLSTERA, 54, 12, 50, 8, 8
	db POTZAL, 51, 12, 50, 2, 2

; TFanger 42
	db PAPAVER, 53, 11, 50, 6, 6
	db RAYGOTEN, 54, 12, 50, 9, 9
	db RAIGALEON, 55, 11, 50, 2, 2
ELSE
; TFanger 39
	db DIPSACUS, 55, 12, 50, 4, 4
	db TEMPEST, 55, 12, 50, 3, 3
	db CORTOS, 55, 12, 50, 11, 11

; TFanger 40
	db GAMAZUMI, 55, 12, 50, 3, 3
	db ZUDOON, 55, 12, 50, 5, 5
	db SCORPIL, 55, 12, 50, 4, 4

; TFanger 41
	db KIYORUKA, 55, 11, 50, 8, 8
	db SHELLSTERA, 55, 12, 50, 8, 8
	db POTZAL, 55, 12, 50, 2, 2

; TFanger 42
	db PAPAVER, 55, 11, 50, 6, 6
	db RAYGOTEN, 55, 12, 50, 9, 9
	db RAIGALEON, 55, 11, 50, 2, 2
ENDC

; TFanger 43
	db DRILARMOR, 32, 17, 50, 1, 1
	db DRILARMOR, 30, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

IF DEF(POWER)
; TFanger 44
	db SHELLSTERA, 31, 17, 50, 7, 7
	db SHELLSTERA, 32, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 45
	db PAMPAS, 32, 17, 50, 1, 1
	db SHELLSTERA, 29, 17, 50, 2, 2
	db DRILARMOR, 30, 17, 50, 4, 4

; TFanger 46
	db BUBARIA, 33, 17, 50, 9, 9
	db BUBARIA, 28, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

; TFanger 47
	db GERON, 32, 17, 50, 8, 8
	db GANRAIKOU, 29, 17, 50, 9, 9
	db GODETIA, 29, 17, 50, 9, 9

; TFanger 48
	db DRILARMOR, 30, 17, 50, 1, 1
	db DRILARMOR, 30, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 49
	db SHELLSTERA, 31, 17, 50, 7, 7
	db LICORICE, 27, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 50
	db SHELLSTERA, 30, 17, 50, 1, 1
	db SHELLSTERA, 31, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

; TFanger 51
	db BERZELIA, 27, 17, 50, 9, 9
	db BERZELIA, 26, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

; TFanger 52
	db GODETIA, 30, 17, 50, 8, 8
	db GODETIA, 29, 17, 50, 9, 9
	db 0, 0, 0, 0, 0, 0

; TFanger 53
	db FIREKOKKO, 53, 6, 50, 3, 3
	db FIREKOKKO, 48, 6, 50, 2, 2
	db FIREKOKKO, 47, 6, 50, 2, 2

; TFanger 54
	db GHOSBOAR, 53, 6, 50, 9, 9
	db FIREKOKKO, 48, 6, 50, 9, 9
	db GHOSBOAR, 47, 6, 50, 1, 1

; TFanger 55
	db BALLTAMUS, 53, 6, 50, 2, 2
	db WORMITERALA, 50, 6, 50, 5, 5
	db WORMITERALA, 47, 6, 50, 1, 1

; TFanger 56
	db ZUDOON, 51, 6, 50, 3, 3
	db ZUDOON, 50, 6, 50, 3, 3
	db MIDOTOR, 47, 6, 50, 0, 0

; TFanger 57
	db HELIOPSIS, 53, 6, 50, 1, 1
	db HELIOPSIS, 47, 6, 50, 10, 10
	db HELIOPSIS, 47, 6, 50, 1, 1

; TFanger 58
	db HITODEIGHT, 53, 6, 50, 3, 3
	db FIREKOKKO, 48, 6, 50, 2, 2
	db HITODEIGHT, 47, 6, 50, 2, 2

; TFanger 59
	db SHELLSTERA, 53, 6, 50, 9, 9
	db SHELLSTERA, 48, 6, 50, 9, 9
	db GHOSBOAR, 47, 6, 50, 1, 1

; TFanger 60
	db BALLTAMUS, 53, 6, 50, 2, 2
	db BERZELIA, 50, 6, 50, 5, 5
	db BALLTAMUS, 47, 6, 50, 1, 1

; TFanger 61
	db ZUDOON, 51, 6, 50, 3, 3
	db HELIOPSIS, 50, 6, 50, 3, 3
	db HELIOPSIS, 47, 6, 50, 0, 0

; TFanger 62
	db CHAMELAN, 53, 6, 50, 1, 1
	db CHAMELAN, 47, 6, 50, 10, 10
	db OBANA, 47, 6, 50, 1, 1

; TFanger 63
	db CHAMELAN, 49, 9, 50, 7, 7
	db CHAMELAN, 50, 9, 50, 5, 5
	db HELIOPSIS, 49, 9, 50, 3, 3

; TFanger 64
	db GAMAZUMI, 51, 9, 50, 6, 6
	db WARUTAH, 50, 9, 50, 8, 8
	db GAMAZUMI, 52, 9, 50, 3, 3

; TFanger 65
	db BOUVARDI, 50, 9, 50, 5, 5
	db BOUVARDI, 51, 9, 50, 3, 3
	db BOUVARDI, 50, 9, 50, 1, 1

; TFanger 66
	db CHAMELAN, 49, 9, 50, 7, 7
	db BERZELIA, 50, 9, 50, 5, 5
	db BERZELIA, 49, 9, 50, 3, 3

; TFanger 67
	db GAMAZUMI, 51, 9, 50, 6, 6
	db BURENICA, 50, 9, 50, 8, 8
	db BURENICA, 52, 9, 50, 3, 3

; TFanger 68
	db GUNTZATL, 50, 9, 50, 5, 5
	db BOUVARDI, 51, 9, 50, 3, 3
	db GUNTZATL, 50, 9, 50, 1, 1

; TFanger 69
	db FIREKOKKO, 48, 11, 50, 10, 10
	db RAYGOTEN, 49, 11, 50, 8, 8
	db RAYGOTEN, 46, 11, 50, 0, 0

; TFanger 70
	db CHAMELAN, 46, 11, 50, 0, 0
	db CHAMELAN, 43, 11, 50, 7, 7
	db GODETIA, 46, 11, 50, 3, 3

; TFanger 71
	db BURENICA, 47, 11, 50, 11, 11
	db SHELLSTERA, 46, 11, 50, 4, 4
	db BURENICA, 48, 11, 50, 5, 5

; TFanger 72
	db GERON, 47, 11, 50, 7, 7
	db GERON, 45, 11, 50, 4, 4
	db OBANA, 47, 11, 50, 10, 10

; TFanger 73
	db GODETIA, 49, 11, 50, 4, 4
	db GODETIA, 48, 11, 50, 6, 6
	db GODETIA, 48, 11, 50, 7, 7

; TFanger 74
	db FIREKOKKO, 48, 11, 50, 10, 10
	db RAYGOTEN, 49, 11, 50, 8, 8
	db RAYGOTEN, 47, 11, 50, 0, 0

; TFanger 75
	db GODETIA, 46, 11, 50, 0, 0
	db DRILARMOR, 43, 11, 50, 7, 7
	db GODETIA, 47, 11, 50, 3, 3

; TFanger 76
	db BURENICA, 47, 11, 50, 11, 11
	db NIGELLA, 48, 11, 50, 4, 4
	db NIGELLA, 46, 11, 50, 5, 5

; TFanger 77
	db OBANA, 47, 11, 50, 7, 7
	db GERON, 46, 11, 50, 4, 4
	db OBANA, 45, 11, 50, 10, 10

; TFanger 78
	db GERON, 49, 11, 50, 4, 4
	db GODETIA, 48, 11, 50, 6, 6
	db OBANA, 47, 11, 50, 7, 7

; TFanger 79
	db DIPSACUS, 56, 12, 50, 4, 4
	db CORTOS, 54, 12, 50, 3, 3
	db CORTOS, 54, 12, 50, 11, 11

; TFanger 80
	db GAMAZUMI, 53, 12, 50, 3, 3
	db DIPSACUS, 55, 12, 50, 5, 5
	db GAMAZUMI, 52, 12, 50, 4, 4

; TFanger 81
	db SHELLSTERA, 54, 11, 50, 8, 8
	db SHELLSTERA, 54, 12, 50, 8, 8
	db POTZAL, 51, 12, 50, 2, 2

; TFanger 82
	db RAIGALEON, 53, 11, 50, 6, 6
	db RAIGALEON, 54, 12, 50, 9, 9
	db RAIGALEON, 55, 11, 50, 2, 2

; TFanger 83
	db DIPSACUS, 56, 12, 50, 4, 4
	db CHAMELAN, 54, 12, 50, 3, 3
	db DIPSACUS, 52, 12, 50, 11, 11

; TFanger 84
	db GAMAZUMI, 53, 12, 50, 3, 3
	db GAMAZUMI, 56, 12, 50, 5, 5
	db GAMAZUMI, 55, 12, 50, 4, 4

; TFanger 85
	db POTZAL, 54, 11, 50, 8, 8
	db SHELLSTERA, 52, 12, 50, 8, 8
	db POTZAL, 55, 12, 50, 2, 2

; TFanger 86
	db RAYGOTEN, 57, 11, 50, 6, 6
	db RAYGOTEN, 50, 12, 50, 9, 9
	db RAIGALEON, 50, 11, 50, 2, 2
ELSE
; TFanger 44
	db LICORICE, 31, 17, 50, 7, 7
	db SHELLSTERA, 32, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 45
	db PAMPAS, 32, 17, 50, 1, 1
	db PAMPAS, 29, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

; TFanger 46
	db SHELLSTERA, 33, 17, 50, 9, 9
	db BERZELIA, 28, 17, 50, 2, 2
	db BERZELIA, 32, 17, 50, 3, 3

; TFanger 47
	db GERON, 32, 17, 50, 8, 8
	db GANRAIKOU, 29, 17, 50, 9, 9
	db GANRAIKOU, 29, 17, 50, 9, 9

; TFanger 48
	db ERYNGO, 30, 17, 50, 1, 1
	db ERYNGO, 30, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 49
	db LICORICE, 31, 17, 50, 7, 7
	db LICORICE, 27, 17, 50, 6, 6
	db 0, 0, 0, 0, 0, 0

; TFanger 50
	db DRILARMOR, 30, 17, 50, 1, 1
	db DRILARMOR, 31, 17, 50, 2, 2
	db 0, 0, 0, 0, 0, 0

; TFanger 51
	db SHELLSTERA, 27, 17, 50, 9, 9
	db BERZELIA, 26, 17, 50, 2, 2
	db SHELLSTERA, 33, 17, 50, 3, 3

; TFanger 52
	db SHELLSTERA, 30, 17, 50, 8, 8
	db SHELLSTERA, 29, 17, 50, 9, 9
	db 0, 0, 0, 0, 0, 0

; TFanger 53
	db WARUTAH, 53, 6, 50, 3, 3
	db WARUTAH, 48, 6, 50, 2, 2
	db WARUTAH, 47, 6, 50, 2, 2

; TFanger 54
	db GUNTZATL, 53, 6, 50, 9, 9
	db SHELLSTERA, 48, 6, 50, 9, 9
	db SHELLSTERA, 47, 6, 50, 1, 1

; TFanger 55
	db BADHORO, 53, 6, 50, 2, 2
	db BERZELIA, 50, 6, 50, 5, 5
	db BADHORO, 47, 6, 50, 1, 1

; TFanger 56
	db ARAKUIDA, 51, 6, 50, 3, 3
	db HELIOPSIS, 50, 6, 50, 3, 3
	db REIGE, 47, 6, 50, 0, 0

; TFanger 57
	db KIYORUKA, 53, 6, 50, 1, 1
	db KIYORUKA, 47, 6, 50, 10, 10
	db KIYORUKA, 47, 6, 50, 1, 1

; TFanger 58
	db FIREKOKKO, 53, 6, 50, 3, 3
	db KIYORUKA, 48, 6, 50, 2, 2
	db FIREKOKKO, 47, 6, 50, 2, 2

; TFanger 59
	db SHELLSTERA, 53, 6, 50, 9, 9
	db GUNTZATL, 48, 6, 50, 9, 9
	db GUNTZATL, 47, 6, 50, 1, 1

; TFanger 60
	db BADHORO, 53, 6, 50, 2, 2
	db BERZELIA, 50, 6, 50, 5, 5
	db BERZELIA, 47, 6, 50, 1, 1

; TFanger 61
	db REIGE, 51, 6, 50, 3, 3
	db HELIOPSIS, 50, 6, 50, 3, 3
	db REIGE, 47, 6, 50, 0, 0

; TFanger 62
	db KIYORUKA, 53, 6, 50, 1, 1
	db KIYORUKA, 47, 6, 50, 10, 10
	db OBANA, 47, 6, 50, 1, 1

; TFanger 63
	db BERZELIA, 49, 9, 50, 7, 7
	db BERZELIA, 50, 9, 50, 5, 5
	db ZUDOON, 49, 9, 50, 3, 3

; TFanger 64
	db GAMAZUMI, 51, 9, 50, 6, 6
	db GAMAZUMI, 50, 9, 50, 8, 8
	db BURENICA, 52, 9, 50, 3, 3

; TFanger 65
	db GUNTZATL, 50, 9, 50, 5, 5
	db GUNTZATL, 51, 9, 50, 3, 3
	db FIREKOKKO, 50, 9, 50, 1, 1

; TFanger 66
	db ZUDOON, 49, 9, 50, 7, 7
	db GUNTZATL, 50, 9, 50, 5, 5
	db ZUDOON, 49, 9, 50, 3, 3

; TFanger 67
	db WARUTAH, 51, 9, 50, 6, 6
	db GAMAZUMI, 50, 9, 50, 8, 8
	db GAMAZUMI, 52, 9, 50, 3, 3

; TFanger 68
	db GUNTZATL, 50, 9, 50, 5, 5
	db GUNTZATL, 51, 9, 50, 3, 3
	db GUNTZATL, 50, 9, 50, 1, 1

; TFanger 69
	db RAYGOTEN, 48, 11, 50, 10, 10
	db SORGHUM, 49, 11, 50, 8, 8
	db SORGHUM, 46, 11, 50, 0, 0

; TFanger 70
	db GODETIA, 46, 11, 50, 0, 0
	db RAYGOTEN, 43, 11, 50, 7, 7
	db RAYGOTEN, 46, 11, 50, 3, 3

; TFanger 71
	db BURENICA, 47, 11, 50, 11, 11
	db BURENICA, 46, 11, 50, 4, 4
	db NIGELLA, 48, 11, 50, 5, 5

; TFanger 72
	db OBANA, 47, 11, 50, 7, 7
	db GERON, 45, 11, 50, 4, 4
	db OBANA, 47, 11, 50, 10, 10

; TFanger 73
	db GODETIA, 49, 11, 50, 4, 4
	db GODETIA, 48, 11, 50, 6, 6
	db ARMARU, 48, 11, 50, 7, 7

; TFanger 74
	db RAYGOTEN, 48, 11, 50, 10, 10
	db RAYGOTEN, 49, 11, 50, 8, 8
	db SORGHUM, 47, 11, 50, 0, 0

; TFanger 75
	db DRILARMOR, 46, 11, 50, 0, 0
	db DRILARMOR, 43, 11, 50, 7, 7
	db DRILARMOR, 47, 11, 50, 3, 3

; TFanger 76
	db BURENICA, 47, 11, 50, 11, 11
	db BURENICA, 48, 11, 50, 4, 4
	db NIGELLA, 46, 11, 50, 5, 5

; TFanger 77
	db RAYGOTEN, 47, 11, 50, 7, 7
	db GERON, 46, 11, 50, 4, 4
	db GERON, 45, 11, 50, 10, 10

; TFanger 78
	db FIREKOKKO, 49, 11, 50, 4, 4
	db GODETIA, 48, 11, 50, 6, 6
	db GODETIA, 47, 11, 50, 7, 7

; TFanger 79
	db DIPSACUS, 56, 12, 50, 4, 4
	db TEMPEST, 54, 12, 50, 3, 3
	db TEMPEST, 54, 12, 50, 11, 11

; TFanger 80
	db GAMAZUMI, 53, 12, 50, 3, 3
	db ZUDOON, 55, 12, 50, 5, 5
	db GAMAZUMI, 52, 12, 50, 4, 4

; TFanger 81
	db POTZAL, 54, 11, 50, 8, 8
	db SHELLSTERA, 54, 12, 50, 8, 8
	db POTZAL, 51, 12, 50, 2, 2

; TFanger 82
	db PAPAVER, 53, 11, 50, 6, 6
	db RAYGOTEN, 54, 12, 50, 9, 9
	db PAPAVER, 55, 11, 50, 2, 2

; TFanger 83
	db CORTOS, 56, 12, 50, 4, 4
	db TEMPEST, 54, 12, 50, 3, 3
	db CORTOS, 52, 12, 50, 11, 11

; TFanger 84
	db GAMAZUMI, 53, 12, 50, 3, 3
	db SCORPIL, 56, 12, 50, 5, 5
	db SCORPIL, 55, 12, 50, 4, 4

; TFanger 85
	db KIYORUKA, 54, 11, 50, 8, 8
	db SHELLSTERA, 52, 12, 50, 8, 8
	db KIYORUKA, 55, 12, 50, 2, 2

; TFanger 86
	db PAPAVER, 57, 11, 50, 6, 6
	db RAYGOTEN, 50, 12, 50, 9, 9
	db RAYGOTEN, 50, 11, 50, 2, 2
ENDC

; TFanger 87
	db BASHOU, 99, 15, 100, 11, 11
	db GENTIANA, 99, 15, 100, 11, 11
	db TESSEN, 99, 15, 100, 11, 11

; TFanger 88
	db PUNICA, 99, 15, 100, 11, 11
	db LIRIOPE, 99, 15, 100, 11, 11
	db NORIUTSUGI, 99, 15, 100, 11, 11

