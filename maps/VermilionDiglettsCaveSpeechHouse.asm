	object_const_def ; object_event constants
	const VERMILIONDIGLETTSCAVESPEECHHOUSE_GENTLEMAN

VermilionDiglettsCaveSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionDiglettsCaveSpeechHouseGentlemanScript:
	jumptextfaceplayer VermilionDiglettsCaveSpeechHouseGentlemanText

VermilionDiglettsCaveSpeechHouseGentlemanText:
	text "Over many years,"
	line "Diglett dug a"
	cont "large tunnel."

	para "That tunnel goes"
	line "to a distant town."

	para "The Feds used it"
	line "as a shortcut to"
	cont "that distant town."

	para "The town is most"
	line "likely under their"
	cont "control now."

	para "It's sad to think"
	line "about."
	done

VermilionDiglettsCaveSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, VERMILION_CITY, 6
	warp_event  5,  7, VERMILION_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event  2,  3, SPRITE_GENTLEMAN, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, VermilionDiglettsCaveSpeechHouseGentlemanScript, -1
