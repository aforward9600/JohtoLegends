	object_const_def ; object_event constants
	const RADIOTOWER3F_ARIANA
	const RADIOTOWER3F_ROCKET
	const RADIOTOWER3F_ROCKET_GIRL
	const RADIOTOWER3F_SCIENTIST

RadioTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerAriana2:
	trainer ARIANA, ARIANA_2, EVENT_BEAT_GOLDENROD_TOWER_ARIANA, Ariana2SeenText, Ariana2BeatenText, Ariana2LastMonText, .Script

.Script:
	endifjustbattled
	opentext
	writetext Ariana2AfterBattleText
	waitbutton
	closetext
	end

RadioTower3FRocketScript:
	jumptextfaceplayer RadioTower3FRocketText

TrainerGruntF8:
	trainer GRUNTF, GRUNTF_8, EVENT_BEAT_ROCKET_GRUNTF_8, GruntF8SeenText, GruntF8BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF8AfterBattleText
	waitbutton
	closetext
	end

TrainerScientistMac:
	trainer SCIENTIST, MAC, EVENT_BEAT_SCIENTIST_MAC, ScientistMacSeenText, ScientistMacBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMacAfterBattleText
	waitbutton
	closetext
	end

Ariana2LastMonText:
	text "Not again!"
	done

Ariana2SeenText:
	text "You again?!"

	para "Of all the people"
	line "I'd have to run"
	cont "into today, of"
	cont "course it would be"
	cont "you!"

	para "Remember me from"
	line "the lighthouse?"

	para "Don't forget my"
	line "name: Ariana!"

	para "You embarassed me"
	line "so much!"

	para "The boss was cross"
	line "with me!"

	para "It's time for some"
	line "payback!"
	done

Ariana2BeatenText:
	text "AAAAHHHH!"

	para "You obnoxious,"
	line "inconsiderate,"
	cont "snot-nosed brat!"
	done

Ariana2AfterBattleText:
	text "You…you…"

	para "GAH!"

	para "……Ugh, I need to"
	line "calm down. She'll"
	cont "have my head if I"
	cont "don't."

	para "Go on, get out of"
	line "my sight, worm!"

	para "Archer will punish"
	line "you real good!"
	done

GruntF8SeenText:
	text "You're quite"
	line "meddlesome, you"
	cont "know that?"
	done

GruntF8BeatenText:
	text "Aw man…"
	done

GruntF8AfterBattleText:
	text "Try not to vomit"
	line "when going over"
	cont "these ramps."

	para "We don't need"
	line "Ariana's outfit"
	cont "to be ruined."
	done

ScientistMacSeenText:
	text "This architecture"
	line "is astounding!"

	para "Wouldn't you say?"

	para "…Hey, you're not"
	line "with us!"
	done

ScientistMacBeatenText:
	text "I spent too much"
	line "time looking at"
	cont "this tower…"
	done

ScientistMacAfterBattleText:
	text "Who built this"
	line "tower, and for"
	cont "what purpose?"

	para "These are the"
	line "questions I ask"
	cont "myself and seek to"
	cont "answer."

	para "Demolishing this"
	line "building would be"
	cont "a mistake."

	para "That's the only"
	line "reason I decided"
	cont "to come on this"
	cont "mission."
	done

RadioTower3FRocketText:
	text "I'm not going to"
	line "battle you right"
	cont "now."

	para "I should, but I'm"
	line "still trying to"
	cont "figure out how to"
	cont "get around here."

	para "These jumps are"
	line "confusing."
	done

RadioTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 14, RADIO_TOWER_2F, 1
	warp_event 16,  2, RADIO_TOWER_4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 14,  3, SPRITE_ARIANA, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerAriana2, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  3, 14, SPRITE_ROCKET, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, RadioTower3FRocketScript, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event  3,  5, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TrainerGruntF8, EVENT_GOLDENROD_TOWER_TAKEOVER
	object_event 17,  9, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerScientistMac, EVENT_GOLDENROD_TOWER_TAKEOVER
