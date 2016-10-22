IF DEF(POWER)
	db KESHI, KESHI, CRYPTO, OSHE,  3
	db KESHI, CRYPTO, CRYPTO, OSHE,  3
	db KESHI, FUNGUS, CRYPTO, OSHE,  5
	db KESHI, FUNGUS, CRYPTO, OSHE,  5
ELSE
	db KOCHIA, KOCHIA, OSHE, KESHI,  3
	db KOCHIA, OSHE, OSHE, KESHI,  3
	db KOCHIA, FUNGUS, OSHE, KESHI,  5
	db KOCHIA, FUNGUS, OSHE, KESHI,  5
ENDC
	db KESHI, SUGURI, PAMPAS, OSHE,  9
	db SUGURI, PAMPAS, KESHI, OSHE,  9
IF DEF(POWER)
	db PAMPAS, LICORICE, VIBURNUM, PUNICA, 12
	db GANRAIKOU, PAMPAS, LICORICE, TELOPEA, 12
ELSE
	db PAMPAS, LICORICE, VIBURNUM, ANGIOS, 12
	db GANRAIKOU, PAMPAS, LICORICE, NORIUTSUGI, 12
ENDC
	db IXORA, LAPEIROUSIA, RHODANTHE, OBANA, 17
	db IXORA, LAPEIROUSIA, RHODANTHE, OBANA, 17
	db IXORA, MYRTUS, RHODANTHE, OBANA, 17
	db IXORA, LAPEIROUSIA, RHODANTHE, OBANA, 17
	db IXORA, MYRTUS, RHODANTHE, OBANA, 17
IF DEF(POWER)
	db CURCUMA, RHODANTHE, MANTEA, TELOPEA, 20
	db OSHE, CURCUMA, MANTEA, TELOPEA, 20
	db NIGELLA, OSHE, RHODANTHE, TELOPEA, 20
	db RHODANTHE, CURCUMA, OSHE, TELOPEA, 20
	db HAGUMANOKI, RHODANTHE, NIGELLA, TELOPEA, 20
	db NIGELLA, HAGUMANOKI, CURCUMA, TELOPEA, 20
	db BYAKUBU, ERYNGO, BUBARIA, TELOPEA, 22
	db ERYNGO, BUBARIA, BYAKUBU, TELOPEA, 22
	db FIREKOKKO, BYAKUBU, ERYNGO, TELOPEA, 22
	db OSHE, CHAMERAID, FUNGBLADE, CRYPTORIDE, 26
	db OSHE, FUNGBLADE, KERORIN, CRYPTORIDE, 26
	db SUGULAI, KERORIN, OSHE, CRYPTORIDE, 26
	db CHAMERAID, FUNGBLADE, SUGULAI, CRYPTORIDE, 26
	db FUNGBLADE, KERORIN, SUGULAI, CRYPTORIDE, 26
	db HITODEIGHT, GHOSBOAR, RASENMAI, CORTOS, 30
	db GHOSBOAR, RASENMAI, CORTOS, MUSA, 30
ELSE
	db CURCUMA, RHODANTHE, MANTEA, NORIUTSUGI, 20
	db OSHE, CURCUMA, MANTEA, NORIUTSUGI, 20
	db NIGELLA, OSHE, RHODANTHE, NORIUTSUGI, 20
	db RHODANTHE, CURCUMA, OSHE, NORIUTSUGI, 20
	db HAGUMANOKI, RHODANTHE, NIGELLA, NORIUTSUGI, 20
	db NIGELLA, HAGUMANOKI, CURCUMA, NORIUTSUGI, 20
	db BYAKUBU, ERYNGO, BUBARIA, NORIUTSUGI, 22
	db ERYNGO, BUBARIA, BYAKUBU, NORIUTSUGI, 22
	db FIREKOKKO, BYAKUBU, ERYNGO, NORIUTSUGI, 22
	db ARMARU, CHAMERAID, FUNGBLADE, RAYGIRTH, 26
	db ARMARU, FUNGBLADE, KERORIN, RAYGIRTH, 26
	db SUGULAI, KERORIN, ARMARU, RAYGIRTH, 26
	db CHAMERAID, FUNGBLADE, SUGULAI, RAYGIRTH, 26
	db FUNGBLADE, KERORIN, SUGULAI, RAYGIRTH, 26
	db HITODEIGHT, GADHORO, CLIOGERA, CORTOS, 30
	db GADHORO, CLIOGERA, CORTOS, MUSA, 30
ENDC
	db HITODEIGHT, CORTOS, VANDA, UIKYOU, 30
	db FUNGBLADE, FUNGBLADE, SORGHUM, CURCUMA, 34
IF DEF(POWER)
	db FUNNEL, MIDOTOR, OCTOR, GAULTHERIA, 34
ELSE
	db FUNNEL, REIGE, TOGERUKA, GAULTHERIA, 34
ENDC
	db GAIURUS, ARANEIDA, ARMCRAB, GADORKUMA, 37
	db ARANEIDA, GAIURUS, ARMCRAB, GADORKUMA, 37
	db ARMCRAB, ARANEIDA, GAIURUS, GADORKUMA, 37
	db GAIURUS, ARANEIDA, ARMCRAB, GADORKUMA, 40
	db ARANEIDA, GAIURUS, ARMCRAB, GADORKUMA, 40
	db ARMCRAB, ARANEIDA, GAIURUS, GADORKUMA, 40
IF DEF(POWER)
	db RAIGALEON, POTZAL, ABIRAS, PUNEEDLE, 45
	db POTZAL, ABIRAS, KERORIN, PUNEEDLE, 50
	db ANGILANCE, OCTAGUN, KIRINGIKU, KINGPIN, 53
	db KIRINGIKU, ANGILANCE, OCTAGUN, KINGPIN, 60
	db KESHI, FUNGUS, LYCHNIS, CRYPTO,  7
	db KESHI, GUMI, LYCHNIS, CRYPTO,  7
ELSE
	db RAIGALEON, POTZAL, ABIRAS, ANGIORN, 45
	db POTZAL, ABIRAS, KERORIN, ANGIORN, 50
	db ANGIPOWER, ZEA, ANGIGORGO, YARROW, 53
	db ANGIPOWER, ZEA, YARROW, ANGIGORGO, 60
	db KESHI, FUNGUS, LYCHNIS, KOCHIA,  7
	db KESHI, GUMI, LYCHNIS, KOCHIA,  7
ENDC
	db KESHI, SUGURI, PAMPAS, LICORICE, 10
	db LICORICE, PAMPAS, KESHI, SUGURI, 10
IF DEF(POWER)
	db VANDA, UIKYOU, GHOSBOAR, SCORPIL, 32
	db CORTOS, VANDA, UIKYOU, SCORPIL, 32
	db GHOSBOAR, CORTOS, VANDA, RASENMAI, 32
ELSE
	db VANDA, UIKYOU, GADHORO, CLIOGERA, 32
	db CORTOS, VANDA, UIKYOU, CLIOGERA, 32
	db GADHORO, CORTOS, VANDA, CLIOGERA, 32
ENDC
	db LICORICE, FUNGBLADE, SORGHUM, CURCUMA, 36
	db FUNGBLADE, LICORICE, CURCUMA, SORGHUM, 36
	db SORGHUM, LICORICE, CURCUMA, FUNGBLADE, 36
IF DEF(POWER)
	db FUNNEL, MIDOTOR, OCTOR, GAULTHERIA, 38
	db MIDOTOR, OCTOR, FUNNEL, GAULTHERIA, 38
	db FUNNEL, OCTOR, MIDOTOR, GAULTHERIA, 38
	db OCTOR, FUNNEL, MIDOTOR, GAULTHERIA, 38
	db FUNNEL, OCTOR, MIDOTOR, GAULTHERIA, 38
ELSE
	db FUNNEL, REIGE, TOGERUKA, GAULTHERIA, 38
	db REIGE, TOGERUKA, FUNNEL, GAULTHERIA, 38
	db FUNNEL, TOGERUKA, REIGE, GAULTHERIA, 38
	db TOGERUKA, FUNNEL, REIGE, GAULTHERIA, 38
	db FUNNEL, TOGERUKA, REIGE, GAULTHERIA, 38
ENDC
	db HELIOPSIS, ARMCRAB, GADORKUMA, PAPAVER, 48
	db PAPAVER, GADORKUMA, KIYORUKA, ARMCRAB, 48
	db TESSEN, GADORKUMA, HELIOPSIS, KIYORUKA, 48
	db KIYORUKA, PAPAVER, TESSEN, GADORKUMA, 48
	db ARMCRAB, GADORKUMA, KIYORUKA, PAPAVER, 48
	db POTZAL, ABIRAS, KERORIN, KAYA, 55
	db ABIRAS, KERORIN, KAYA, POTZAL, 55
	db KERORIN, ABIRAS, POTZAL, KAYA, 55
	db POTZAL, KERORIN, ABIRAS, KAYA, 55
	db KAYA, ABIRAS, KERORIN, KERORIN, 55
	db KAYA, POTZAL, KERORIN, ABIRAS, 55
	db KAYA, ABIRAS, KERORIN, POTZAL, 55
	db KAYA, ABIRAS, POTZAL, KERORIN, 55
IF DEF(POWER)
	db KIRINGIKU, ANGILANCE, OCTAGUN, KINGPIN, 61
	db KIRINGIKU, ANGILANCE, GUNTZATL, KINGPIN, 61
	db KIRINGIKU, ARAKUIDA, OCTAGUN, KINGPIN, 61
	db KIRINGIKU, ARAKUIDA, GUNTZATL, KINGPIN, 62
	db GUNTZATL, ANGILANCE, OCTAGUN, KINGPIN, 62
	db GUNTZATL, OCTAGUN, ANGILANCE, KINGPIN, 62
	db GUNTZATL, ARAKUIDA, ANGILANCE, KINGPIN, 63
	db GUNTZATL, OCTAGUN, KIRINGIKU, KINGPIN, 63
	db OCTAGUN, ANGILANCE, KIRINGIKU, KINGPIN, 63
ELSE
	db ANGIPOWER, ZEA, ANGIGORGO, YARROW, 63
	db ANGIPOWER, ZEA, GUNTZATL, YARROW, 63
	db ANGIPOWER, ARAKUIDA, ANGIGORGO, YARROW, 63
	db ANGIPOWER, ARAKUIDA, GUNTZATL, YARROW, 63
	db GUNTZATL, ZEA, ANGIGORGO, YARROW, 63
	db GUNTZATL, ANGIGORGO, ZEA, YARROW, 63
	db GUNTZATL, ARAKUIDA, ANGIGORGO, YARROW, 63
	db GUNTZATL, ANGIGORGO, ZEA, YARROW, 63
	db ANGIGORGO, ANGIPOWER, ZEA, YARROW, 63
ENDC
	db ARMARU, CHAMERAID, GERON, CHAMELAN, 52
	db CHAMERAID, GERON, ARMARU, GAMURU, 53
	db GERON, CHAMELAN, CHAMERAID, GAMURU, 54