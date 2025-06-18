; Landmarks indexes (see data/maps/landmarks.asm)
	const_def

; Johto landmarks
	const SPECIAL_MAP       ; 00
	const BLACKTHORN_CITY   ; 01
	const DRAGONS_DEN       ; 02
	const ROUTE_45          ; 03
	const DARK_CAVE         ; 04
	const ICE_PATH          ; 05
	const ROUTE_44          ; 06
	const MAHOGANY_TOWN     ; 07
	const UNKNOWN           ; 08
	const ROUTE_43          ; 09
	const LAKE_OF_RAGE      ; 0a
	const INFANT_GROVE      ; 0b
	const ROUTE_42          ; 0c
	const MT_MORTAR         ; 0d
	const ECRUTEAK_CITY     ; 0e
	const BELLCHIME_PATH    ; 0f
	const TIN_TOWER         ; 10
	const BURNED_TOWER      ; 12
	const ROUTE_38          ; 13
	const ROUTE_39          ; 14
	const OLIVINE_CITY      ; 15
	const LIGHTHOUSE        ; 16
	const BATTLE_TOWER      ; 17
	const ROUTE_40          ; 18
	const WHIRL_ISLANDS     ; 19
	const ROUTE_41          ; 1a
	const CIANWOOD_CITY     ; 1b
	const CLIFFS_EDGE_GATE  ; 1c
	const ROUTE_47          ; 1d
	const CLIFF_CAVE        ; 1e
	const EMBEDDED_TOWER    ; 1f
	const ROUTE_48          ; 20
	const WILD_AREA_OUTSIDE ; 21
	const ROUTE_37          ; 22
	const ROUTE_36          ; 23
	const NATIONAL_PARK     ; 24
	const ROUTE_35          ; 25
	const GOLDENROD_CITY    ; 26
	const RADIO_TOWER       ; 27
	const ROUTE_34          ; 28
	const ILEX_FOREST       ; 29
	const AZALEA_TOWN       ; 2a
	const SLOWPOKE_WELL     ; 2b
	const ROUTE_33          ; 2c
	const UNION_CAVE        ; 2d
	const ROUTE_32          ; 2e
	const RUINS_OF_ALPH     ; 2f
	const VIOLET_CITY       ; 30
	const SPROUT_TOWER      ; 31
	const ROUTE_31          ; 32
	const ROUTE_30          ; 33
	const CHERRYGROVE_CITY  ; 34
	const ROUTE_29          ; 35
	const NEW_BARK_TOWN     ; 36
	const ROUTE_46          ; 37
	const SILVER_CAVE       ; 38
KANTO_LANDMARK EQU const_value
	const PALLET_TOWN       ; 39
	const ROUTE_1           ; 3a
	const VIRIDIAN_CITY     ; 3b
	const ROUTE_2           ; 3c
	const VIRIDIAN_FOREST   ; 3d
	const PEWTER_CITY       ; 3e
	const ROUTE_3           ; 3f
	const MT_MOON           ; 40
	const ROUTE_4           ; 41
	const CERULEAN_CITY     ; 42
	const CERULEAN_CAVE     ; 43
	const ROUTE_24          ; 44
	const ROUTE_25          ; 45
	const ROUTE_5           ; 46
	const UNDERGROUND_PATH  ; 47
	const ROUTE_6           ; 48
	const VERMILION_CITY    ; 49
	const DIGLETTS_CAVE     ; 4a
	const ROUTE_7           ; 4b
	const ROUTE_8           ; 4c
	const ROUTE_9           ; 4d
	const ROCK_TUNNEL       ; 4e
	const ROUTE_10          ; 4f
	const POWER_PLANT       ; 50
	const LAVENDER_TOWN     ; 51
	const LAV_RADIO_TOWER   ; 52
	const CELADON_CITY      ; 53
	const SAFFRON_CITY      ; 54
	const ROUTE_11          ; 55
	const ROUTE_12          ; 56
	const ROUTE_13          ; 57
	const ROUTE_14          ; 58
	const ROUTE_15          ; 59
	const ROUTE_16          ; 5a
	const ROUTE_17          ; 5b
	const ROUTE_18          ; 5c
	const FUCHSIA_CITY      ; 5d
	const ROUTE_19          ; 5e
	const ROUTE_20          ; 5f
	const SEAFOAM_ISLANDS   ; 60
	const CINNABAR_ISLAND   ; 61
	const POKEMON_MANSION   ; 62
	const CINNABAR_VOLCANO  ; 63
	const UNKNOWN_2         ; 64
	const ROUTE_21          ; 65
	const ROUTE_22          ; 66
	const VICTORY_ROAD      ; 67
	const ROUTE_23          ; 68
	const INDIGO_PLATEAU    ; 69
	const ROUTE_26          ; 6a
	const ROUTE_27          ; 6b
	const TOHJO_FALLS       ; 6c
	const ROUTE_28          ; 6d
SEVII_LANDMARK EQU const_value
	const ONE_ISLAND        ; 6e
	const TREASURE_BEACH    ; 6f
	const KINDLE_ROAD       ; 70
	const MT_EMBER          ; 71

; used in CaughtData
GIFT_LOCATION  EQU $fd
EVENT_LOCATION EQU $fe

; Regions
	const_def
	const JOHTO_REGION  ; 0
	const KANTO_REGION  ; 1
	const SEVII_ISLANDS ; 2
NUM_REGIONS EQU const_value
