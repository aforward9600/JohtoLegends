	object_const_def ; object_event constants
	const TINTOWER4F_POKE_BALL1
	const TINTOWER4F_POKE_BALL2
	const TINTOWER4F_POKE_BALL3
	const TINTOWER4F_GRUNT

TinTower4F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower4FGrunt:	
	trainer GRUNTM, GRUNTM_22, EVENT_BEAT_ROCKET_GRUNTM_22, GruntM22SeenText, GruntM22BeatenText, 0, .Script

.Script:
	endifjustbattled
	faceplayer
	opentext
	writetext GruntMAfterText
	waitbutton
	closetext
	end

TinTower4FUltraBall:
	itemball TM_SHADOW_BALL

TinTower4FPPUp:
	itemball PP_UP

TinTower4FTwistedSpoon:
	itemball TWISTEDSPOON

TinTower4FHiddenMaxPotion:
	hiddenitem MAX_POTION, EVENT_TIN_TOWER_4F_HIDDEN_MAX_POTION

GruntM22SeenText:
	text "We're a little"
	line "short-staffed"
	cont "right now."
	done

GruntM22BeatenText:
	text "Whoops!"
	done

GruntMAfterText:
	text "We're spread thin"
	line "on other missions"
	cont "right now."

	para "Whoops!"

	para "I shouldn't have"
	line "said that!"
	done

TinTower4F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  2,  4, TIN_TOWER_5F, 2
	warp_event 16,  2, TIN_TOWER_3F, 2
	warp_event  2, 14, TIN_TOWER_5F, 3
	warp_event 17, 15, TIN_TOWER_5F, 4

	db 0 ; coord events

	db 1 ; bg events
	bg_event 11,  6, BGEVENT_ITEM, TinTower4FHiddenMaxPotion

	db 4 ; object events
	object_event 14, 10, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, TinTower4FUltraBall, EVENT_TIN_TOWER_4F_ULTRA_BALL
	object_event 17, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FPPUp, EVENT_TIN_TOWER_4F_PP_UP
	object_event  2, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower4FTwistedSpoon, EVENT_TIN_TOWER_4F_ESCAPE_ROPE
	object_event  4,  2, SPRITE_ROCKET, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TinTower4FGrunt, EVENT_TIN_TOWER_1F_WISE_TRIO_1
