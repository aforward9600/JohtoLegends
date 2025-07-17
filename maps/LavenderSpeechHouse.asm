	object_const_def ; object_event constants
	const LAVENDERSPEECHHOUSE_GRANNY

LavenderSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderSpeechHousePokefanFScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .LavenderSpeechHousePokefanF2
	jumptextfaceplayer LavenderSpeechHousePokefanFText

.LavenderSpeechHousePokefanF2:
	jumptextfaceplayer LavenderSpeechHousePokefanFText2

LavenderSpeechHouseBookshelf:
	jumpstd genericsink

LavenderSpeechHousePokefanFText:
	text "I can't even pay"
	line "my respects to my"
	cont "poor departed"
	cont "Sandshrew."

	para "Curse those Feds!"
	done

LavenderSpeechHousePokefanFText2:
	text "Now I can pay my"
	line "respects to"
	cont "Sandshrew."
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAVENDER_TOWN, 3
	warp_event  5,  7, LAVENDER_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	db 1 ; object events
	object_event  3,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
