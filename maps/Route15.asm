	object_const_def ; object_event constants
	const ROUTE15_YOUNGSTER1
	const ROUTE15_YOUNGSTER2
	const ROUTE15_YOUNGSTER3
	const ROUTE15_YOUNGSTER4
	const ROUTE15_TEACHER1
	const ROUTE15_TEACHER2
	const ROUTE15_POKE_BALL

Route15_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerTeacherIsako:
	trainer TEACHER, ISAKO, EVENT_BEAT_TEACHER_ISAKO, TeacherIsakoSeenText, TeacherIsakoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext TeacherIsakoAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperTerry:
	trainer BIRD_KEEPER, TERRY, EVENT_BEAT_BIRD_KEEPER_TERRY, BirdKeeperTerrySeenText, BirdKeeperTerryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperTerryAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerBurgess:
	trainer BIKER, BURGESS, EVENT_BEAT_BIKER_BURGESS, BikerBurgessSeenText, BikerBurgessBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerBurgessAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckKanji:
	trainer ROUGHNECK, KANJI, EVENT_BEAT_ROUGHNECK_KANJI, RoughneckKanjiSeenText, RoughneckKanjiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckKanjiAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentChie:
	trainer DELINQUENT, CHIE, EVENT_BEAT_DELINQUENT_CHIE, DelinquentChieSeenText, DelinquentChieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentChieAfterBattleText
	waitbutton
	closetext
	end

Route15GrampsScript:
	jumptextfaceplayer Route15GrampsText

Route15Sign:
	jumptext Route15SignText

Route15PPUp:
	itemball PP_UP

TeacherIsakoSeenText:
	text "There is no class"
	line "for me to teach"
	cont "right now…"
	done

TeacherIsakoBeatenText:
	text "Kyaaah!"
	done

TeacherIsakoAfterBattleText:
	text "What is a teacher"
	line "without her"
	cont "students?"

	para "I hope school can"
	line "start again soon…"
	done

BirdKeeperTerrySeenText:
	text "It's over!"

	para "I have the high"
	line "ground!"
	done

BirdKeeperTerryBeatenText:
	text "Oh, wait."

	para "We're on the same"
	line "level."
	done

BirdKeeperTerryAfterBattleText:
	text "I still have the"
	line "high ground over"
	cont "those Feds down"
	cont "there."
	done

BikerBurgessSeenText:
	text "This road is all"
	line "bumpy!"

	para "It's terrible to"
	line "ride on!"
	done

BikerBurgessBeatenText:
	text "Oh yeah. That was"
	line "our fault!"
	done

BikerBurgessAfterBattleText:
	text "Now that I think"
	line "about it,"

	para "why did we take"
	line "all the bricks?"

	para "We didn't build"
	line "anything with"
	cont "them."
	done

RoughneckKanjiSeenText:
	text "The flowers here"
	line "are quite lovely."

	para "…Why did I tell"
	line "you that?"
	done

RoughneckKanjiBeatenText:
	text "That wasn't"
	line "lovely!"
	done

RoughneckKanjiAfterBattleText:
	text "I love flowers,"
	line "but they don't fit"
	cont "my tough image."
	done

DelinquentChieSeenText:
	text "I'mma kick you if"
	line "you don't get out"
	cont "of my face!"
	done

DelinquentChieBeatenText:
	text "D'oh I missed!"
	done

DelinquentChieAfterBattleText:
	text "Ow! I sprained my"
	line "ankle trying to"
	cont "kick you!"
	done

Route15SignText:
	text "Route 15"

	para "Fuchsia City -"
	line "Lavender Town"
	done

Route15GrampsText:
	text "They stole a bunch"
	line "of bricks from"
	cont "this road."

	para "What an odd crime"
	line "to commit."
	done

Route15_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  4, ROUTE_15_FUCHSIA_GATE, 3
	warp_event  2,  5, ROUTE_15_FUCHSIA_GATE, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 19,  9, BGEVENT_READ, Route15Sign

	db 7 ; object events
	object_event  8,  9, SPRITE_GRAMPS, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route15GrampsScript, -1
	object_event 15, 13, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerBurgess, -1
	object_event 33, 10, SPRITE_ROUGHNECK, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckKanji, -1
	object_event 24, 12, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentChie, -1
	object_event 29,  5, SPRITE_TEACHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerTeacherIsako, -1
	object_event 17,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperTerry, -1
	object_event 12,  5, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route15PPUp, EVENT_ROUTE_15_PP_UP
