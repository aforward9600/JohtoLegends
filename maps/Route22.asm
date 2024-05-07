	object_const_def ; object_event constants
	const ROUTE22_BIKER

Route22_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerBuford:
	trainer BIKER, BUFORD, EVENT_BEAT_BIKER_BUFORD, BikerBufordSeenText, BikerBufordBeatenText, 0, .Script

.Script:
	opentext
	writetext BikerBufordAfterText
	waitbutton
	closetext
	checkevent EVENT_SET_FLAGS_IN_KANTO
	iftrue .IgnoreFlags
	setevent EVENT_VIRIDIAN_CITY_CIVILLIANS
	setevent EVENT_CINNABAR_MANSION_1F_GIOVANNI
	setevent EVENT_FED_HIDEOUT_GIOVANNI
	setevent EVENT_VIRIDIAN_GYM_TRAINERS
	setevent EVENT_PEWTER_CITY_CIVILLIANS
	setevent EVENT_CERULEAN_GYM_LILY
	setevent EVENT_CERULEAN_GYM_DAISY
	setevent EVENT_CERULEAN_GYM_VIOLET
	setevent EVENT_CERULEAN_CITY_VIOLET
	setevent EVENT_CERULEAN_CITY_LILY
	clearevent EVENT_BEAT_BLACKBELT_HIROSHI
	setevent EVENT_SAFFRON_CITY_CIVILLIANS
	setevent EVENT_FUCHSIA_CITY_LAPRAS
	setevent EVENT_FED_HIDEOUT_PLAYER
	setevent EVENT_FERROPEXOLA
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B1F_1
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B1F_2
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B2F_1
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B2F_2
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_1
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B3F_2
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_2
	setevent EVENT_SEAFOAM_ISLAND_BOULDER_B4F_1
	setevent EVENT_CERULEAN_CITY_CIVILLIANS
	setevent EVENT_SET_FLAGS_IN_KANTO
.IgnoreFlags:
	end

VictoryRoadEntranceSign:
	jumptext VictoryRoadEntranceSignText

BikerBufordSeenText:
	text "Hey punk!"

	para "I don't know where"
	line "you're from, but I"
	cont "don't like the way"
	cont "you're walking!"

	para "You're from Johto,"
	line "right?"

	para "Don't you know the"
	line "new laws?"

	para "No outsiders!"
	done

BikerBufordBeatenText:
	text "You fought the law"
	line "and you won!"
	done

BikerBufordAfterText:
	text "Wait, you're the"
	line "new Champion?"

	para "Why didn't you"
	line "tell me!"

	para "Now I feel like an"
	line "idiot for fighting"
	cont "you!"
	done

VictoryRoadEntranceSignText:
	text "#mon League"

	para "Victory Road"
	line "Entrance"
	done

Route22_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 13,  5, VICTORY_ROAD_GATE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 15,  7, BGEVENT_READ, VictoryRoadEntranceSign

	db 1 ; object events
	object_event 35, 11, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerBikerBuford, -1
