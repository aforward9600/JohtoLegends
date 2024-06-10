	object_const_def ; object_event constants
	const OLIVINEPUNISHMENTSPEECHHOUSE_POKEFAN_M
	const OLIVINEPUNISHMENTSPEECHHOUSE_GRANDPA

OlivinePunishmentSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePunishmentSpeechHouseDaughter:
	jumptextfaceplayer OlivinePunishmentSpeechHouseDaughterText

OlivinePunishmentSpeechHouseSwarmGuy:
	jumptextfaceplayer OlivinePunishmentSpeechHouseSwarmGuyText

OlivinePunishmentSpeechHouseBookshelf2:
	jumpstd picturebookshelf

OlivinePunishmentSpeechHouseBookshelf1:
	jumpstd magazinebookshelf

SwarmChannel:
	jumpstd swarmscript

OlivinePunishmentSpeechHouseDaughterText:
	text "My father likes to"
	line "watch the Swarm"
	cont "Channel a little"
	cont "too much, to be"
	cont "honest."

	para "It's the only"
	line "thing he watches."

	para "We're probably the"
	line "only house in the"
	cont "region with the"
	cont "channel constantly"
	cont "on."
	done

OlivinePunishmentSpeechHouseSwarmGuyText:
	text "You here to watch"
	line "the Swarm Channel?"

	para "It's great!"

	para "They let you know"
	line "where a swarm of"
	cont "#mon appear!"

	para "It changes every"
	line "day, and sometimes"

	para "you may not get a"
	line "swarm."

	para "I've heard that"
	line "uniquely colored"
	cont "#mon can show"

	para "more often in such"
	line "swarms!"
	done

OlivinePunishmentSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
;	warp_event  2,  7, SEAFOAM_ISLAND_B4F, 1
;	warp_event  3,  7, LANCES_ROOM, 1
	warp_event  2,  7, OLIVINE_CITY, 4
	warp_event  3,  7, OLIVINE_CITY, 4

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf1
	bg_event  1,  1, BGEVENT_READ, OlivinePunishmentSpeechHouseBookshelf2
	bg_event  2,  1, BGEVENT_READ, SwarmChannel

	db 2 ; object events
	object_event  1,  2, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseDaughter, -1
	object_event  5,  5, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePunishmentSpeechHouseSwarmGuy, -1
