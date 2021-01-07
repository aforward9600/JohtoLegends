	object_const_def ; object_event constants
	const ICEPATHB1F_ROCK1
	const ICEPATHB1F_ROCK2
	const ICEPATHB1F_ROCK3
	const ICEPATHB1F_ROCK4
	const ICEPATHB1F_POKE_BALL
	const ICEPATHB1F_YOUNGSTER
	const ICEPATHB1F_LASS

IcePathB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB1FRock:
	jumpstd smashrock

IcePathB1FPotion:
	itemball POTION

IcePathB1FRazorClaw:
	itemball RAZOR_CLAW

TrainerYoungsterTimmy:
	trainer YOUNGSTER, TIMMY, EVENT_BEAT_YOUNGSTER_TIMMY, YoungsterTimmySeenText, YoungsterTimmyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterTimmyAfterText
	waitbutton
	closetext
	end

TrainerLassArielle:
	trainer LASS, ARIELLE, EVENT_BEAT_LASS_ARIELLE, LassArielleSeenText, LassArielleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassArielleAfterText
	waitbutton
	closetext
	end

IcePathB1FHiddenMaxPotion:
	hiddenitem RARE_CANDY, EVENT_ICE_PATH_B1F_HIDDEN_MAX_POTION

YoungsterTimmySeenText:
	text "W-w-w-wow!"
	line "It-t-t-t's"
	cont "f-f-f-reezing!"
	done

YoungsterTimmyBeatenText:
	text "C-c-c-cold!"
	done

YoungsterTimmyAfterText:
	text "I t-t-think m-my"
	line "f-f-feet are f-f-"
	cont "frozen in place!"
	done

LassArielleSeenText:
	text "Aren't you a sight"
	line "for sore eyes!"
	done

LassArielleBeatenText:
	text "That wasn't a"
	line "sight I wanted to"
	cont "see!"
	done

LassArielleAfterText:
	text "Alright, out of"
	line "my sight! I"
	cont "wasn't expecting"

	para "to lose like that!"
	done

IcePathB1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  3, 15, ICE_PATH_1F, 3
	warp_event 17,  3, ICE_PATH_B2F_MAHOGANY_SIDE, 1
	warp_event  5, 25, ICE_PATH_1F, 4
	warp_event 11, 27, ICE_PATH_B2F_BLACKTHORN_SIDE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 16, 33, BGEVENT_ITEM, IcePathB1FHiddenMaxPotion

	db 8 ; object events
	object_event  9,  1, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event 17, 14, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  6, 11, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  6, 13, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB1FRock, -1
	object_event  5, 35, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB1FPotion, EVENT_ICE_PATH_B1F_IRON
	object_event  3, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL,0, IcePathB1FRazorClaw, EVENT_ICE_PATH_B1F_RAZOR_CLAW
	object_event 14, 24, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerYoungsterTimmy, -1
	object_event  4,  6, SPRITE_LASS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassArielle, -1
