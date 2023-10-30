	object_const_def ; object_event constants
	const LAVENDERTOWN_BIKER
	const LAVENDERTOWN_DELINQUENT
	const LAVENDERTOWN_GRAMPS
	const LAVENDERTOWN_YOUNGSTER

LavenderTown_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.FlyPoint:
	setflag ENGINE_FLYPOINT_LAVENDER
	return

LavenderTownBikerScript:
	jumptextfaceplayer LavenderTownBikerText

LavenderTownDelinquentScript:
	jumptextfaceplayer LavenderTownDelinquentText

LavenderTownGrampsScript:
	jumptextfaceplayer LavenderTownGrampsText

LavenderTownTeacherScript:
	jumptextfaceplayer LavenderTownTeacherText

LavenderTownSign:
	jumptext LavenderTownSignText

VolunteerPokemonHouseSign:
	jumptext VolunteerPokemonHouseSignText

SoulHouseSign:
	jumptext SoulHouseSignText

LavenderPokecenterSignText:
	jumpstd pokecentersign

LavenderMartSignText:
	jumpstd martsign

LavenderTownBikerText:
	text "Why am I even"
	line "here?"

	para "There's nothing but"
	line "a tower of dead"
	cont "#mon."

	para "There's no need to"
	line "be here!"

	para "I wish I was on"
	line "Cycling Road."

	para "Now there's a fun"
	line "place to be!"
	done

LavenderTownDelinquentText:
	text "I threatened the"
	line "name rater to"
	cont "change the name of"
	cont "the #mon that I"
	cont "stole,"

	para "but it turns out"
	line "does it for free."

	para "Whoops!"
	done

LavenderTownGrampsText:
	text "So many #mon"
	line "have lost their"
	cont "lives from the war"
	cont "and the Feds…"

	para "Truly sad…"
	done

LavenderTownTeacherText:
	text "Mr. Fuji appeared"
	line "one day a while"
	cont "ago,"

	para "and he's put so"
	line "much effort into"
	cont "raising #mon"
	cont "that have been"
	cont "orphaned or"
	cont "abandoned."

	para "I wonder what his"
	line "past is…"
	done

LavenderTownSignText:
	text "Lavender Town"

	para "The Noble Purple"
	line "Town"
	done

VolunteerPokemonHouseSignText:
	text "Lavender Volunteer"
	line "#mon House"
	done

SoulHouseSignText:
	text "#mon Tower"

	para "May the Souls of"
	line "#mon Rest Easy"
	done

LavenderTown_MapEvents:
	db 0, 0 ; filler

	db 6 ; warp events
	warp_event  3,  5, LAVENDER_POKECENTER_1F, 1
	warp_event  7,  9, MR_FUJIS_HOUSE, 1
	warp_event  3, 13, LAVENDER_SPEECH_HOUSE, 1
	warp_event  7, 13, LAVENDER_NAME_RATER, 1
	warp_event 15, 13, LAVENDER_MART, 1
	warp_event 14,  5, LAV_RADIO_TOWER_1F, 1

	db 0 ; coord events

	db 5 ; bg events
	bg_event  9,  3, BGEVENT_READ, LavenderTownSign
	bg_event 17,  7, BGEVENT_READ, SoulHouseSign
	bg_event  5,  9, BGEVENT_READ, VolunteerPokemonHouseSign
	bg_event  4,  5, BGEVENT_READ, LavenderPokecenterSignText
	bg_event 16, 13, BGEVENT_READ, LavenderMartSignText

	db 4 ; object events
	object_event 12,  7, SPRITE_BIKER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, LavenderTownBikerScript, EVENT_SAFFRON_CITY_FEDS
	object_event  2, 15, SPRITE_DAISY, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, LavenderTownDelinquentScript, EVENT_SAFFRON_CITY_FEDS
	object_event 12, 13, SPRITE_TEACHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, LavenderTownTeacherScript, -1
	object_event  6, 11, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 1, LavenderTownGrampsScript, -1
