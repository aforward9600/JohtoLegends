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
	npctrade TRADE_DIALOGSET_NEWBIE,    TANGELA,    RAPIDASH,   "Epona@@@@@@", $ea, $aa, RAWST_BERRY,  48926, "Damien@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_NEWBIE,    DUSKULL,    BRONZOR,    "Reflecto@@@", $96, $86, LEPPA_BERRY,  15616, "Tim@@@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      MAGBY,      SQUIRTLE,   "Mitch@@@@@@", $98, $88, ASPEAR_BERRY, 00283, "Jenny@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      HERACROSS,  BLISSEY,    "Blessed@@@@", $98, $88, PECHA_BERRY,  29189, "Sarah@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_GIRL,      BAGON,      DRATINI,    "Drake@@@@@@", $ea, $aa, SITRUS_BERRY, 26491, "Jewel@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, PHANPY,     PIKACHU,    "Pooka@@@@@@", $96, $66, LIGHT_BALL,   50082, "Forest@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, ELEKID,     CHARMANDER, "Flameo@@@@@", $96, $77, LEPPA_BERRY,  49635, "Rocky@@@", TRADE_GENDER_EITHER
	npctrade TRADE_DIALOGSET_COLLECTOR, SMOOCHUM,   BULBASAUR,  "Bubsy@@@@@@", $96, $77, LUM_BERRY,    42069, "Sheldon@", TRADE_GENDER_FEMALE
	npctrade TRADE_DIALOGSET_GIRL,      GIBLE,      LARVITAR,   "Tarry@@@@@@", $ea, $aa, SITRUS_BERRY, 26491, "Jewel@@@", TRADE_GENDER_EITHER
