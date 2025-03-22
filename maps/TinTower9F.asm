	object_const_def ; object_event constants
	const TINTOWER9F_POKE_BALL
	const TINTOWER9F_ARCHER

TinTower9F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower9FArcher:
	trainer ARCHER, ARCHER_4, EVENT_BEAT_TIN_TOWER_ARCHER, TinTower9FArcherSeenText, TinTower9FArcherBeatenText, Archer4LastMonText, .Script

.Script:
	faceplayer
	opentext
	writetext TinTower9FArcherAfterText
	waitbutton
	closetext
	setevent EVENT_TIN_TOWER_ROOF_ROCKET_BALL
	setevent EVENT_TIN_TOWER_ROOF_PLAYER
	setevent EVENT_TIN_TOWER_ROOF_HO_OH_2
	end

TinTower9FHPUp:
	itemball HP_UP

TinTower9FUnusedHoOhText:
; unused
	text "HO-OH: Shaoooh!"
	done

TinTower9FUnusedLugiaText:
; unused
	text "LUGIA: Gyaaan!"
	done

Archer4LastMonText:
	text "It seems this was"
	line "inevitable too…"
	done

TinTower9FArcherSeenText:
	text "You again, huh?"

	para "I guess this was"
	line "inevitable."

	para "Let's get this"
	line "over with."
	done

TinTower9FArcherBeatenText:
	text "Just as I thought…"
	done

TinTower9FArcherAfterText:
	text "Well, this is"
	line "unfortunate."

	para "I may have bought"
	line "the boss enough"
	cont "time."

	para "Go on, and see"
	line "for yourself."

	para "Perhaps you'll get"
	line "lucky and see"
	cont "something amazing."
	done

TinTower9F_MapEvents:
	db 0, 0 ; filler

	db 7 ; warp events
	warp_event 12,  3, TIN_TOWER_8F, 2
	warp_event  2,  5, TIN_TOWER_8F, 3
	warp_event 12,  7, TIN_TOWER_8F, 4
	warp_event  7,  9, TIN_TOWER_ROOF, 1
	warp_event 16,  7, TIN_TOWER_7F, 5
	warp_event  6, 13, TIN_TOWER_8F, 5
	warp_event  8, 13, TIN_TOWER_8F, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  9,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower9FHPUp, EVENT_TIN_TOWER_9F_HP_UP
	object_event  8,  8, SPRITE_ARCHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TinTower9FArcher, EVENT_TIN_TOWER_1F_WISE_TRIO_1
