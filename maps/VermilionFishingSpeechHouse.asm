	object_const_def ; object_event constants
	const VERMILIONFISHINGSPEECHHOUSE_FISHING_GURU

VermilionFishingSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FishingDude:
	checkevent EVENT_DECO_MAGIKARP_DOLL
	iftrue .MagikarpPassword
	jumptextfaceplayer FishingDudeText

.MagikarpPassword:
	jumptextfaceplayer MagikarpPasswordText

FishingDudesHousePhoto:
	jumptext FishingDudesHousePhotoText

FishingDudesHouseBookshelf:
; unused
	jumpstd picturebookshelf

FishingDudeText:
	text "I am the Fishing"
	line "Dude, the elder of"
	cont "the Fishing Bros."

	para "Have you met the"
	line "Fishing Guru at"
	cont "Lake Of Rage?"

	para "He dreams about"
	line "seeing the world's"
	cont "greatest Magikarp."

	para "I haven't spoken"
	line "to him since the"
	cont "embargo started."

	para "I wonder if he's"
	line "seen the Magikarp"
	cont "he's always sought."
	done

FishingDudesHousePhotoText:
	text "It's a photo of"
	line "people fishing…"

	para "They're having a"
	line "great time…"
	done

MagikarpPasswordText:
	text "Have you ever"
	line "heard of a person"
	cont "starting their"
	cont "journey with just"
	cont "a Magikarp?"

	para "Boy, that would be"
	line "STUPID, huh?"
	done

VermilionFishingSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, VERMILION_CITY, 1
	warp_event  3,  7, VERMILION_CITY, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  3,  0, BGEVENT_READ, FishingDudesHousePhoto

	db 1 ; object events
	object_event  2,  4, SPRITE_FISHING_GURU, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, FishingDude, -1
