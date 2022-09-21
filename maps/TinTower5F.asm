	object_const_def ; object_event constants
	const TINTOWER5F_POKE_BALL
	const TINTOWER5F_ROCKET_GIRL

TinTower5F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower5FGruntF:
	trainer GRUNTF, GRUNTF_12, EVENT_BEAT_ROCKET_GRUNTF_12, TinTower5FGruntFSeenText, TinTower5FGruntFBeatenText, 0, .Script

.Script:
	endifjustbattled
	faceplayer
	opentext
	writetext TinTower5FGruntFAfterText
	waitbutton
	closetext
	end

TinTower5FRareCandy:
	itemball RARE_CANDY

TinTower5FHiddenFullRestore:
	hiddenitem FULL_RESTORE, EVENT_TIN_TOWER_5F_HIDDEN_FULL_RESTORE

TinTower5FHiddenCarbos:
	hiddenitem CARBOS, EVENT_TIN_TOWER_5F_HIDDEN_CARBOS

TinTower5FGruntFSeenText:
	text "Get outta here!"

	para "Can't you see"
	line "we're busy?"
	done

TinTower5FGruntFBeatenText:
	text "Looks like I got"
	line "out!"
	done

TinTower5FGruntFAfterText:
	text "We really are busy"
	line "right now, so can"
	cont "you just go?"
	done

TinTower5F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event 11, 15, TIN_TOWER_6F, 2
	warp_event  2,  4, TIN_TOWER_4F, 1
	warp_event  2, 14, TIN_TOWER_4F, 3
	warp_event 17, 15, TIN_TOWER_4F, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 16, 14, BGEVENT_ITEM, TinTower5FHiddenFullRestore
	bg_event  3, 15, BGEVENT_ITEM, TinTower5FHiddenCarbos

	db 2 ; object events
	object_event  9,  9, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower5FRareCandy, EVENT_TIN_TOWER_5F_RARE_CANDY
	object_event 17,  0, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 1, TinTower5FGruntF, EVENT_TIN_TOWER_1F_WISE_TRIO_1
