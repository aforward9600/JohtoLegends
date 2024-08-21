	object_const_def ; object_event constants
	const CERULEANGYMBADGESPEECHHOUSE_GRANNY
	const CERULEANGYMBADGESPEECHHOUSE_MISTY

CeruleanGymBadgeSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MistysGrandmotherScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .MistysGrandmother2
	jumptextfaceplayer MistysGrandmotherText1

.MistysGrandmother2:
	jumptextfaceplayer MistysGrandmotherText2

BabyMistyScript:
	jumptextfaceplayer BabyMistyText

MistysGrandmotherText1:
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

MistysGrandmotherText2:
	text "My granddaughters"
	line "can play outside"
	cont "in peace again."

	para "What a relief."
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
	object_event  2,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MistysGrandmotherScript, -1
	object_event  5,  6, SPRITE_MISTY, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, BabyMistyScript, -1
