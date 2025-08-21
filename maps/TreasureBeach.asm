	object_const_def ; object_event constants
	const TREASUREBEACH_SWIMMERF
	const TREASUREBEACH_LASS

TreasureBeach_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerLassGabrielle:
		trainer LASS, GABRIELLE, EVENT_BEAT_LASS_GABRIELLE, LassGabrielleSeenText, LassGabrielleBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	faceplayer
	writetext LassGabrielleAfterText
	waitbutton
	closetext
	end

TrainerSwimmerFTara:
		trainer SWIMMERF, TARA, EVENT_BEAT_SWIMMERF_TARA, SwimmerFTaraSeenText, SwimmerFTaraBeatenText, 0, .AfterScript

.AfterScript:
	endifjustbattled
	opentext
	faceplayer
	writetext SwimmerFTaraAfterText
	waitbutton
	closetext
	end

SwimmerFTaraSeenText:
	text "This spot is so"
	line "peaceful."

	para "I can just float"
	line "here for hours."
	done

SwimmerFTaraBeatenText:
	text "I guess I was too"
	line "relaxed…"
	done

SwimmerFTaraAfterText:
	text "You can leave now."

	para "I just want to"
	line "relax."
	done

LassGabrielleSeenText:
	text "Do you know why"
	line "this area is"
	cont "called Treasure"
	cont "Beach?"
	done

LassGabrielleBeatenText:
	text "I'll tell you!"
	done

LassGabrielleAfterText:
	text "Tourists used to"
	line "drop items here"
	cont "for the locals to"
	cont "find,"

	para "but there isn't"
	line "anything now."
	done

TreasureBeach_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  6,  7, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerSwimmerFTara, -1
	object_event  7, 18, SPRITE_LASS, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerLassGabrielle, -1
	