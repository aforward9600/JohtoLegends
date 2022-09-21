	object_const_def ; object_event constants
	const TINTOWER3F_ROCKET_1
	const TINTOWER3F_SCIENTIST
	const TINTOWER3F_ROCKET_GIRL
	const TINTOWER3F_POKE_BALL

TinTower3F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TinTower3FRocket1:
	jumptextfaceplayer TinTower3FRocketText

ScientistMac2Script:
	trainer SCIENTIST, MAC_2, EVENT_BEAT_SCIENTIST_MAC_2, ScientistMac2SeenText, ScientistMac2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext ScientistMac2AfterText
	waitbutton
	closetext
	end

GruntF11Script:
	trainer GRUNTF, GRUNTF_11, EVENT_BEAT_ROCKET_GRUNTF_11, GruntF11SeenText, GruntF11BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext GruntF11AfterText
	waitbutton
	closetext
	end

TinTower3FFullHeal:
	itemball FULL_HEAL

TinTower3FRocketText:
	text "Don't bother me!"

	para "I'm getting deja"
	line "vu right now!"

	para "I got stuck here"
	line "in another tower!"

	para "I hate this!"
	done

ScientistMac2SeenText:
	text "I'm really just in"
	line "it for the"
	cont "science."
	done

ScientistMac2BeatenText:
	text "Wait, I remember"
	line "you!"
	done

ScientistMac2AfterText:
	text "I lost to you at"
	line "Goldenrod Tower"
	cont "as well!"
	done

GruntF11SeenText:
	text "You're a real"
	line "pain, you know"
	cont "that?"
	done

GruntF11BeatenText:
	text "Like I said,"

	para "a pain!"
	done

GruntF11AfterText:
	text "You'll be in for"
	line "pain soon enough."
	done

TinTower3F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 10, 14, TIN_TOWER_2F, 1
	warp_event 16,  2, TIN_TOWER_4F, 2

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  3, 12, SPRITE_ROCKET, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, TinTower3FRocket1, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event 16, 12, SPRITE_SCIENTIST, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, ScientistMac2Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  2,  6, SPRITE_ROCKET_GIRL, SPRITEMOVEDATA_SPINCOUNTERCLOCKWISE, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, GruntF11Script, EVENT_TIN_TOWER_1F_WISE_TRIO_1
	object_event  3, 14, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, TinTower3FFullHeal, EVENT_TIN_TOWER_3F_FULL_HEAL
