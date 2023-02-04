flypoint: MACRO
	const FLY_\1
	db \2, SPAWN_\1
ENDM

Flypoints:
; landmark, spawn point
	const_def
; Johto
	flypoint BLACKTHORN,   BLACKTHORN_CITY
	flypoint MAHOGANY,     MAHOGANY_TOWN
	flypoint LAKE_OF_RAGE, LAKE_OF_RAGE
	flypoint ECRUTEAK,     ECRUTEAK_CITY
	flypoint OLIVINE,      OLIVINE_CITY
	flypoint CIANWOOD,     CIANWOOD_CITY
	flypoint WILD_AREA,    WILD_AREA_OUTSIDE
	flypoint GOLDENROD,    GOLDENROD_CITY
	flypoint AZALEA,       AZALEA_TOWN
	flypoint VIOLET,       VIOLET_CITY
	flypoint CHERRYGROVE,  CHERRYGROVE_CITY
	flypoint NEW_BARK,     NEW_BARK_TOWN
	flypoint MT_SILVER,    SILVER_CAVE

; Kanto
KANTO_FLYPOINT EQU const_value
	flypoint PALLET,       PALLET_TOWN
	flypoint VIRIDIAN,     VIRIDIAN_CITY
	flypoint PEWTER,       PEWTER_CITY
	flypoint CERULEAN,     CERULEAN_CITY
	flypoint VERMILION,    VERMILION_CITY
	flypoint ROCK_TUNNEL,  ROCK_TUNNEL
	flypoint LAVENDER,     LAVENDER_TOWN
	flypoint CELADON,      CELADON_CITY
	flypoint SAFFRON,      SAFFRON_CITY
	flypoint FUCHSIA,      FUCHSIA_CITY
	flypoint CINNABAR,     CINNABAR_ISLAND
	flypoint ROUTE_26,     VICTORY_ROAD
	flypoint INDIGO,       INDIGO_PLATEAU
	db -1
