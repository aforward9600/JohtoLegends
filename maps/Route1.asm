	object_const_def ; object_event constants
	const ROUTE1_COOLTRAINER_F
	const ROUTE1_COOLTRAINER_M
	const ROUTE1_FRUIT_TREE

Route1_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSchoolboyDanny:
	trainer SCHOOLBOY, DANNY, EVENT_BEAT_SCHOOLBOY_DANNY, SchoolboyDannySeenText, SchoolboyDannyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SchoolboyDannyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfQuinn:
	trainer COOLTRAINERF, CARA, EVENT_BEAT_COOLTRAINERF_CARA, CooltrainerfQuinnSeenText, CooltrainerfQuinnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfQuinnAfterBattleText
	waitbutton
	closetext
	end

Route1Sign:
	jumptext Route1SignText

Route1FruitTree:
	fruittree FRUITTREE_ROUTE_1

SchoolboyDannySeenText:
	text "I feel safer being"
	line "close to Pallet"
	cont "Town."
	done

SchoolboyDannyBeatenText:
	text "I still feel safe…"
	done

SchoolboyDannyAfterBattleText:
	text "Prof. Oak is a"
	line "strong trainer!"

	para "It's too bad he's"
	line "so old…"
	done

CooltrainerfQuinnSeenText:
	text "Hold it!"

	para "I won't let any"
	line "harm come to"
	cont "Pallet Town!"
	done

CooltrainerfQuinnBeatenText:
	text "I couldn't protect"
	line "them…"
	done

CooltrainerfQuinnAfterBattleText:
	text "Wait, you're the"
	line "Champion?"

	para "Whoops. Guess I"
	line "should have asked"
	cont "before attacking…"
	done

Route1SignText:
	text "Route 1"

	para "Pallet Town -"
	line "Viridian City"
	done

Route1_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 1 ; bg events
	bg_event  7, 27, BGEVENT_READ, Route1Sign

	db 3 ; object events
	object_event  8, 16, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfQuinn, -1
	object_event 12, 24, SPRITE_SCHOOLBOY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerSchoolboyDanny, -1
	object_event  3,  7, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route1FruitTree, -1
