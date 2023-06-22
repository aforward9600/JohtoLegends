	object_const_def ; object_event constants
	const PEWTERNIDORANSPEECHHOUSE_SUPER_NERD
	const PEWTERNIDORANSPEECHHOUSE_NIDORAN_M

PewterNidoranSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

PewterNidoranSpeechHouseSuperNerdScript:
	jumptextfaceplayer PewterNidoranSpeechHouseSuperNerdText

PewterNidoran:
	refreshscreen
	pokepic GROWLITHE
	cry GROWLITHE
	waitbutton
	closepokepic
	opentext
	writetext PewterNidoranText
	waitbutton
	closetext
	end

PewterNidoranSpeechHouseSuperNerdText:
	text "Growlith will"
	line "protect me!"
	done

PewterNidoranText:
	text "Growlithe: Bark!"
	done

PewterNidoranSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, PEWTER_CITY, 1
	warp_event  3,  7, PEWTER_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  5, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, PewterNidoranSpeechHouseSuperNerdScript, -1
	object_event  4,  5, SPRITE_GROWLITHE, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, PewterNidoran, -1
