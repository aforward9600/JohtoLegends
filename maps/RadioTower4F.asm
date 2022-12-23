	object_const_def ; object_event constants
	const RADIOTOWER4F_ENGINEER
	const RADIOTOWER4F_ROCKET1
	const RADIOTOWER4F_ARCHER
	const RADIOTOWER4F_ROCKET_GIRL
	const RADIOTOWER4F_POKE_BALL

RadioTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

RadioTower4FEngineerScript:
	faceplayer
	opentext
	checkevent EVENT_GOLDENROD_TOWER_TAKEOVER
	iftrue .Engineer3Script
	writetext RadioTower4FEngineerText
	waitbutton
	closetext
	end

.Engineer3Script:
	writetext RadioTower4FEngineer2Text
	waitbutton
	closetext
	end

TrainerGruntM15:
	trainer GRUNTM, GRUNTM_15, EVENT_BEAT_ROCKET_GRUNTM_15, GruntM15SeenText, GruntM15BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM15AfterBattleText
	waitbutton
	closetext
	end

TrainerArcher2:
	trainer ARCHER, ARCHER_2, EVENT_BEAT_GOLDENROD_TOWER_ARCHER, Archer2SeenText, Archer2BeatenText, Archer2LastMonText, .Script

.Script:
	endifjustbattled
	opentext
	writetext Archer2AfterBattleText
	waitbutton
	closetext
	end

TrainerGruntF9:
	trainer GRUNTF, GRUNTF_9, EVENT_BEAT_ROCKET_GRUNTF_9, GruntF9SeenText, GruntF9BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF9AfterBattleText
	waitbutton
	closetext
	end

RadioTower4FSurfTM:
	itemball TM_SURF

Archer2LastMonText:
	text "Were we wrong?"

	para "Is this not"
	line "enough?"
	done

RadioTower4FEngineerText:
	text "This is only the"
	line "4th weirdest thing"
	cont "to happen to me"
	cont "this week."
	done

RadioTower4FEngineer2Text:
	text "I wonder what"
	line "other weird things"
	cont "are gonna happen?"
	done

GruntM15SeenText:
	text "I don't need you"
	line "bothering Mr."
	cont "Archer right now!"

	para "He's still annoyed"
	line "from his last"
	cont "battle with you!"
	done

GruntM15BeatenText:
	text "Doh!"
	done

GruntM15AfterBattleText:
	text "Well, don't say I"
	line "didn't warn you!"
	done

Archer2SeenText:
	text "Once again, you've"
	line "come to meddle in"
	cont "our affairs."

	para "I'm afraid that"
	line "this time, our"
	cont "battle won't occur"
	cont "the same way as"
	cont "before!"

	para "I've had our top"
	line "minds research a"
	cont "way to stop you,"
	cont "and now, it's"
	cont "time to enact a"
	cont "new method!"
	done

Archer2BeatenText:
	text "It seems that"
	line "overwhelming you"
	cont "with superior"
	cont "numbers didn't"
	cont "work…"
	done

Archer2AfterBattleText:
	text "Hm…"

	para "It seems more"
	line "research will be"
	cont "required."

	para "What is it that"
	line "you possess that"
	cont "we as an organ-"
	cont "ization lack?"

	para "Hmph."

	para "Go ahead, the boss"
	line "is looking for"
	cont "something, but I'm"
	cont "certain that she"
	cont "can take time out"
	cont "of her schedule to"
	cont "beat you down!"
	done

GruntF9SeenText:
	text "Why are we doing"
	line "this?"

	para "No idea."

	para "We just do what"
	line "the boss tells us."
	done

GruntF9BeatenText:
	text "Do we have free"
	line "will?"
	done

GruntF9AfterBattleText:
	text "Are we simply"
	line "doing what we're"
	cont "told?"

	para "Are the choices"
	line "ours to make?"

	para "I don't really"
	line "know…"
	done

RadioTower4F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  9, RADIO_TOWER_5F, 1
	warp_event 11, 15, RADIO_TOWER_3F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 5 ; object events
	object_event 17,  4, SPRITE_ENGINEER, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 2, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, RadioTower4FEngineerScript, -1
	object_event  3,  3, SPRITE_ROCKET, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerGruntM15, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  3,  8, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerArcher2, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 11,  7, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 1, TrainerGruntF9, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  8,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, RadioTower4FSurfTM, EVENT_GOT_TM49_SURF
