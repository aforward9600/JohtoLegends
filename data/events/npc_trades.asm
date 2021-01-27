npctrade: MACRO
; dialog set, requested mon, offered mon, nickname, dvs, item, OT ID, OT name, gender requested
	db \1
	dw \2, \3
	db \4, \5, \6, \7
	shift
	dw \7
	db \8, \9
	db 0, 0
ENDM

NPCTrades:
; entries correspond to NPCTRADE_* constants
	npctrade TRADE_DIALOGSET_HAPPY,     MEOWTH,     CLEFAIRY,   "Nebula@@@@@", $37, $66, SITRUS_BERRY, 37460, "Mike@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    TANGELA,    CHARMANDER, "Flameo@@@@@", $98, $88, RAWST_BERRY,  48926, "Damien@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      CHINCHOU,   BULBASAUR,  "Bubsy@@@@@@", $98, $88, PECHA_BERRY,  29189, "Sarah@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      MAGBY,      SQUIRTLE,   "Mitch@@@@@@", $98, $88, ASPEAR_BERRY, 00283, "Jenny@@@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_NEWBIE,    PHANPY,     PIKACHU,    "Pooka@@@@@@", $96, $86, LEPPA_BERRY,  15616, "Tim@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      TYROGUE,    AERODACTYL, "Peetree@@@@", $96, $66, SITRUS_BERRY, 26491, "Jewel@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, DUGTRIO,    MAGNETON,   "Maggie@@@@@", $96, $66, METAL_COAT,   50082, "Forest@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, ELEKID,     KABUTO,     "Kabby@@@@@@", $96, $77, HARD_STONE,   49635, "Rocky@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, SMOOCHUM,   OMANYTE,    "Lord Helix@", $96, $77, MYSTIC_WATER, 42069, "Sheldon@", TRADE_GENDER_FEMALE
