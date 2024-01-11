	object_const_def ; object_event constants
	const ROUTE10SOUTH_POKEFAN_M1
	const ROUTE10SOUTH_POKEFAN_M2

Route10South_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerRoughneckLarry:
	trainer ROUGHNECK, LARRY_ROUGHNECK, EVENT_BEAT_ROUGHNECK_LARRY, RoughneckLarrySeenText, RoughneckLarryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckLarryAfterBattleText
	waitbutton
	closetext
	end

TrainerPokefanmTrenton:
	trainer POKEFANM, TRENTON, EVENT_BEAT_POKEFANM_TRENTON, PokefanmTrentonSeenText, PokefanmTrentonBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokefanmTrentonAfterBattleText
	waitbutton
	closetext
	end

Route10Sign:
	jumptext Route10SignText

RoughneckLarrySeenText:
	text "Lavender Town is"
	line "ours!"
	done

RoughneckLarryBeatenText:
	text "Yeesh!"
	done

RoughneckLarryAfterBattleText:
	text "Ugh…"

	para "If the ghosts had"
	line "not scared me so"
	cont "bad, I coulda won!"
	done

PokefanmTrentonSeenText:
	text "I won't let those"
	line "nasty Feds take my"
	cont "darling #mon!"
	done

PokefanmTrentonBeatenText:
	text "Please don't take"
	line "my #mon!"
	done

PokefanmTrentonAfterBattleText:
	text "You're not going to"
	line "take my #mon?"

	para "That's a relief!"
	done

Route10SignText:
	text "Route 10"

	para "Cerulean City -"
	line "Lavender Town"
	done

Route10South_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  6,  1, ROCK_TUNNEL_1F, 2

	db 0 ; coord events

	db 1 ; bg events
	bg_event  5,  3, BGEVENT_READ, Route10Sign

	db 2 ; object events
	object_event 17,  3, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckLarry, -1
	object_event  8, 10, SPRITE_POKEFAN_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerPokefanmTrenton, -1
