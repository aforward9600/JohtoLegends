	object_const_def ; object_event constants
	const TINTOWER2F_ROCKET
	const TINTOWER2F_ROCKET_GIRL

TinTower2F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower2FRocket1Script:
	trainer GRUNTM, GRUNTM_16, EVENT_BEAT_ROCKET_GRUNTM_16, GruntM16SeenText, GruntM16BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntM16AfterBattleText
	waitbutton
	closetext
	end

TinTower2FRocket2Script:
	trainer GRUNTF, GRUNTF_10, EVENT_BEAT_ROCKET_GRUNTF_10, GruntF10SeenText, GruntF10BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF10AfterBattleText
	waitbutton
	closetext
	end

GruntM16SeenText:
	text "We knew you'd be"
	line "here to stop us."

	para "The boss is good"
	line "at pattern"
	cont "recognition."
	done

GruntM16BeatenText:
	text "She probably saw"
	line "this coming too…"
	done

GruntM16AfterBattleText:
	text "She's good at it,"

	para "I never said any"
	line "of us were…"
	done

GruntF10SeenText:
	text "Target acquired."
	done

GruntF10BeatenText:
	text "Mission failed."
	done

GruntF10AfterBattleText:
	text "I sometimes talk"
	line "like that to focus"

	para "myself. Doesn't"
	line "always work…"
	done

TinTower2F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 14, TIN_TOWER_3F, 1
	warp_event 10,  2, TIN_TOWER_1F, 3

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event 12,  5, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TinTower2FRocket1Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  9, 11, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TinTower2FRocket2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
