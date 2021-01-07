	object_const_def ; object_event constants
	const ICEPATHB3F_POKE_BALL
	const ICEPATHB3F_ROCK
	const ICEPATHB3F_BUG_CATCHER

IcePathB3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

IcePathB3FNevermeltice:
	itemball NEVERMELTICE

IcePathB3FRock:
	jumpstd smashrock

TrainerBugCatcherAnton:
	trainer BUG_CATCHER, ANTON, EVENT_BEAT_BUG_CATCHER_ANTON, BugCatcherAntonSeenText, BugCatcherAntonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BugCatcherAntonAfterText
	waitbutton
	closetext
	end

BugCatcherAntonSeenText:
	text "It was a mistake"
	line "to come here. My"
	cont "Bug-types are"

	para "about to enter"
	line "hibernation."
	done

BugCatcherAntonBeatenText:
	text "My poor bugs..."
	done

BugCatcherAntonAfterText:
	text "If it wasn't so"
	line "cold, I would have"
	cont "won that battle!"
	done

IcePathB3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  5, ICE_PATH_B2F_MAHOGANY_SIDE, 2
	warp_event 15,  5, ICE_PATH_B2F_BLACKTHORN_SIDE, 2

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  5,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IcePathB3FNevermeltice, EVENT_ICE_PATH_B3F_NEVERMELTICE
	object_event  9,  8, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IcePathB3FRock, -1
	object_event  6,  1, SPRITE_BUG_CATCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 2, TrainerBugCatcherAnton, -1
