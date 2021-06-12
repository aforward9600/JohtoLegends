	object_const_def ; object_event constants
	const RADIOTOWER2F_ROCKET_GIRL2
	const RADIOTOWER2F_ROCKET1
	const RADIOTOWER2F_ROCKET2
	const RADIOTOWER2F_ROCKET3
	const RADIOTOWER2F_ROCKET_GIRL
	const RADIOTOWER2F_ENGINEER

RadioTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerGruntM11:
	trainer GRUNTM, GRUNTM_11, EVENT_BEAT_ROCKET_GRUNTM_11, GruntM11SeenText, GruntM11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM11AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM13:
	trainer GRUNTM, GRUNTM_13, EVENT_BEAT_ROCKET_GRUNTM_13, GruntM13SeenText, GruntM13BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM13AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntM14:
	trainer GRUNTM, GRUNTM_14, EVENT_BEAT_ROCKET_GRUNTM_14, GruntM14SeenText, GruntM14BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM14AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF7:
	trainer GRUNTF, GRUNTF_7, EVENT_BEAT_ROCKET_GRUNTF_7, GruntF7SeenText, GruntF7BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF7AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF6:
	trainer GRUNTF, GRUNTF_6, EVENT_BEAT_ROCKET_GRUNTF_6, GruntF6SeenText, GruntF6BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF6AfterBattleText
	waitbutton
	closetext
	end

RadioTower2FEngineerScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_TOWER_TAKEOVER
	iftrue .EngineerScript2
	writetext RadioTower2FEngineerText
	waitbutton
	closetext
	end

.EngineerScript2:
	writetext RadioTower2FEngineer2Text
	waitbutton
	closetext
	end

GruntM11SeenText:
	text "Get outta here,"
	line "kid!"

	para "Us adults are"
	line "busy!"
	done

GruntM11BeatenText:
	text "Dang it!"
	done

GruntM11AfterBattleText:
	text "I guess you're not"
	line "just a kid."
	done

GruntM13SeenText:
	text "That weird thing"
	line "in the middle…"

	para "Why does it sway"
	line "back and forth?"

	para "Is there a reason?"

	para "Is it symbolic?"

	para "Are we the same"
	line "way?"

	para "…Hey!"

	para "Don't interupt my"
	line "philosophical"
	cont "mumblings!"
	done

GruntM13BeatenText:
	text "I guess philosophy"
	line "and battles are"
	cont "not my strengths…"
	done

GruntM13AfterBattleText:
	text "I woulda won if I"
	line "hadn't been distr-"
	cont "acted by the pole."
	done

GruntM14SeenText:
	text "The third floor's"
	line "off limits to you!"
	done

GruntM14BeatenText:
	text "It's really not."

	para "I just wanted to"
	line "say something"
	cont "cool."
	done

GruntM14AfterBattleText:
	text "Someone on the"
	line "third floor is"
	cont "waiting for you."

	para "And she's not"
	line "happy about it."
	done

GruntF7SeenText:
	text "Bad idea coming"
	line "this way!"

	para "Now you get to"
	line "face me!"
	done

GruntF7BeatenText:
	text "Wh-who are you?"
	done

GruntF7AfterBattleText:
	text "Fine!"

	para "Whatever!"
	done

GruntF6SeenText:
	text "Which path should"
	line "you take?"

	para "Beat me, and I'll"
	line "give you a hint!"
	done

GruntF6BeatenText:
	text "Alright, I'll tell"
	line "you!"
	done

GruntF6AfterBattleText:
	text "The girl is tough-"
	line "er than the two"
	cont "guys."

	para "Do what you will"
	line "with that info."
	done

RadioTower2FEngineerText:
	text "What'll happen to"
	line "our tower?"
	done

RadioTower2FEngineer2Text:
	text "Looks like we'll"
	line "be back on"
	cont "schedule soon."
	done

RadioTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 14, RADIO_TOWER_3F, 1
	warp_event 10,  2, RADIO_TOWER_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 6 ; object events
	object_event  8,  4, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerGruntF6, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 11,  6, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM11, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 12,  8, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntM13, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 10, 12, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM14, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  8,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntF7, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  6, 14, SPRITE_ENGINEER, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower2FEngineerScript, -1
