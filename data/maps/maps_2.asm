map_2: MACRO
;\1: map name: for the MapAttributes pointer (see data/maps/attributes.asm)
;\2: tileset: a TILESET_* constant
;\3: environment: TOWN, ROUTE, INDOOR, CAVE, ENVIRONMENT_5, GATE, or DUNGEON
;\4: location: from constants/landmark_constants.asm
;\5: music: a MUSIC_* constant
;\6: phone service flag: TRUE to prevent phone calls
;\7: time of day: a PALETTE_* constant
;\8: fishing group: a FISHGROUP_* constant
	db BANK(\1_MapAttributes), \2, \3
	dw \1_MapAttributes
	db \4, \5
	dn \6, \7
	db \8
ENDM

MapGroupPointers_2::
; pointers to the first map of each map group
	dw MapGroup_Route47

MapGroup_Route47:
	map_2 Route47, TILESET_ROUTE_47, ROUTE, ROUTE_47, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map_2 Route48, TILESET_ROUTE_47, ROUTE, ROUTE_48, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map_2 CliffCave, TILESET_CAVE, CAVE, CLIFF_CAVE, MUSIC_UNION_CAVE, FALSE, PALETTE_NITE, FISHGROUP_OCEAN
	map_2 WildAreaOutside, TILESET_ROUTE_47, TOWN, WILD_AREA_OUTSIDE, MUSIC_ROUTE_26, FALSE, PALETTE_AUTO, FISHGROUP_OCEAN
	map_2 WildAreaPokecenter, TILESET_POKECENTER, INDOOR, WILD_AREA_OUTSIDE, MUSIC_POKEMON_CENTER, FALSE, PALETTE_DAY, FISHGROUP_OCEAN
