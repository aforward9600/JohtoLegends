spawn: MACRO
; map, x, y
	map_id \1
	db \2, \3
ENDM

SpawnPoints:
; entries correspond to SPAWN_* constants

	spawn PLAYERS_HOUSE_2F,            3,  3
	spawn VIRIDIAN_POKECENTER_1F,      5,  3

	spawn PALLET_TOWN,                 5,  6
	spawn VIRIDIAN_CITY,              23, 26
	spawn PEWTER_CITY,                13, 26
	spawn CERULEAN_CITY,              19, 22
	spawn ROUTE_10_NORTH,             11,  2
	spawn VERMILION_CITY,              9,  6
	spawn LAVENDER_TOWN,               3,  6
	spawn SAFFRON_CITY,                9, 30
	spawn CELADON_CITY,               29, 10
	spawn FUCHSIA_CITY,               19, 28
	spawn CINNABAR_ISLAND,            11, 12
	spawn ROUTE_26,                    7,  6
	spawn ROUTE_23,                    9,  6

	spawn BLACKTHORN_CITY,            23, 30
	spawn MAHOGANY_TOWN,              15, 14
	spawn LAKE_OF_RAGE,                5, 20
	spawn ECRUTEAK_CITY,              23, 28
	spawn OLIVINE_CITY,               13, 22
	spawn CIANWOOD_CITY,              23, 44
	spawn WILD_AREA_OUTSIDE,           5, 18
	spawn GOLDENROD_CITY,             15, 28
	spawn AZALEA_TOWN,                15, 10
	spawn ROUTE_32,                   11, 74
	spawn VIOLET_CITY,                31, 26
	spawn CHERRYGROVE_CITY,           29,  4
	spawn NEW_BARK_TOWN,              13,  6
	spawn SILVER_CAVE_OUTSIDE,        23, 20
	spawn TEAM_ROCKET_BASE_JAIL,       5,  6
	spawn ONE_ISLAND,                 11, 18
	spawn N_A,                        -1, -1
