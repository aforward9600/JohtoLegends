	object_const_def ; object_event constants
	const VERMILIONMAGNETTRAINSPEECHHOUSE_POKEFAN_F
	const VERMILIONMAGNETTRAINSPEECHHOUSE_YOUNGSTER

VermilionMagnetTrainSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

VermilionMagnetTrainSpeechHousePokefanFScript:
	jumptextfaceplayer VermilionMagnetTrainSpeechHousePokefanFText

VermilionMagnetTrainSpeechHouseYoungsterScript:
	jumptextfaceplayer VermilionMagnetTrainSpeechHouseYoungsterText

VermilionMagnetTrainSpeechHouseBookshelf:
	jumpstd picturebookshelf

VermilionMagnetTrainSpeechHousePokefanFText:
	text "I often wonder"
	line "what happened to"
	cont "the Gym Leader."

	para "Did he escape?"

	para "I can only hope"
	line "so."
	done

VermilionMagnetTrainSpeechHouseYoungsterText:
	text "My husband died in"
	line "the war, so I'm not"
	cont "very fond of the"
	cont "foreign soldiers."
	done

VermilionMagnetTrainSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 4
	warp_event  3,  7, VERMILION_CITY, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, VermilionMagnetTrainSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, VermilionMagnetTrainSpeechHouseBookshelf

	db 2 ; object events
	object_event  2,  3, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, VermilionMagnetTrainSpeechHousePokefanFScript, -1
	object_event  0,  3, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, VermilionMagnetTrainSpeechHouseYoungsterScript, -1
