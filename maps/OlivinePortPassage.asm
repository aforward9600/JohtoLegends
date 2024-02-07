	object_const_def ; object_event constants
	const OLIVINEPORTPASSAGE_POKEFAN_M

OlivinePortPassage_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

OlivinePortPassagePokefanMScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .OlivinePortPassagePokefanM2
	jumptextfaceplayer OlivinePortPassagePokefanMText

.OlivinePortPassagePokefanM2
	jumptextfaceplayer OlivinePortPassagePokefanMText2

OlivinePortPassagePokefanMText:
	text "You're wasting"
	line "your time heading"
	cont "this way."

	para "No ships are sail-"
	line "ing to Kanto, and"
	cont "only cargo ships"
	cont "are sailing to"
	cont "other regions."

	para "Stupid embargo."
	line "I hope the people"
	cont "of Kanto figure"
	cont "this out soon."

	para "Businesses are"
	line "hurting here!"
	done

OlivinePortPassagePokefanMText2:
	text "With the embargo"
	line "lifted, our"
	cont "businesses can"
	cont "thrive again!"
	done

OlivinePortPassage_MapEvents:
	db 0, 0 ; filler

	db 5 ; warp events
	warp_event 15,  0, OLIVINE_CITY, 9
	warp_event 16,  0, OLIVINE_CITY, 10
	warp_event 15,  4, OLIVINE_PORT_PASSAGE, 4
	warp_event  3,  2, OLIVINE_PORT_PASSAGE, 3
	warp_event  3, 14, OLIVINE_PORT, 1

	db 0 ; coord events

	db 0 ; bg events

	db 1 ; object events
	object_event 17,  1, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OlivinePortPassagePokefanMScript, -1
