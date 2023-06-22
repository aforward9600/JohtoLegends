	object_const_def ; object_event constants
	const CERULEANGYMBADGESPEECHHOUSE_GRANNY
	const CERULEANGYMBADGESPEECHHOUSE_MISTY

CeruleanGymBadgeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CeruleanGymBadgeSpeechHousePokefanMScript:
	jumptextfaceplayer CeruleanGymBadgeSpeechHousePokefanMText

BabyMistyScript:
	jumptextfaceplayer BabyMistyText

CeruleanGymBadgeSpeechHousePokefanMText:
	text "After the deaths"
	line "of their parents,"

	para "I took it upon"
	line "myself to raise"
	cont "my granddaughters."

	para "I keep telling"
	line "them to not play"
	cont "outside, but they"

	para "love to play hide"
	line "and seek."

	para "They're strong"
	line "battlers, so they"
	cont "don't seem to have"
	cont "any fear."
	done

BabyMistyText:
	text "Misty:…………………………"

	para "…………Gah?"
	done

CeruleanGymBadgeSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 1
	warp_event  3,  7, CERULEAN_CITY, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanGymBadgeSpeechHousePokefanMScript, -1
	object_event  5,  6, SPRITE_MISTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BabyMistyScript, -1
