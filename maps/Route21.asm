	object_const_def ; object_event constants
	const ROUTE21_SWIMMER_GIRL
	const ROUTE21_SWIMMER_GUY
	const ROUTE21_FISHER
	const ROUTE21_LASS

Route21_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmermSeth:
	trainer SWIMMERM, SETH, EVENT_BEAT_SWIMMERM_SETH, SwimmermSethSeenText, SwimmermSethBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermSethAfterBattleText
	waitbutton
	closetext
	end

TrainerLassUsagi:
	trainer LASS, USAGI, EVENT_BEAT_LASS_USAGI, LassUsagiSeenText, LassUsagiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext LassUsagiAfterText
	waitbutton
	closetext
	end

TrainerSwimmerfNikki:
	trainer SWIMMERF, NIKKI, EVENT_BEAT_SWIMMERF_NIKKI, SwimmerfNikkiSeenText, SwimmerfNikkiBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfNikkiAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherArnold:
	trainer FISHER, ARNOLD, EVENT_BEAT_FISHER_ARNOLD, FisherArnoldSeenText, FisherArnoldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherArnoldAfterBattleText
	waitbutton
	closetext
	end

SwimmermSethSeenText:
	text "Swimming is good"
	line "for the heart!"
	done

SwimmermSethBeatenText:
	text "Cramp!"
	done

SwimmermSethAfterBattleText:
	text "You should stretch"
	line "before swimming!"
	done

SwimmerfNikkiSeenText:
	text "The seas have been"
	line "getting polluted"
	cont "recently…"
	done

SwimmerfNikkiBeatenText:
	text "I'm worried about"
	line "the sea…"
	done

SwimmerfNikkiAfterBattleText:
	text "Those Feds are"
	line "responsible for"
	cont "this!"

	para "They dump all"
	line "kinds of stuff"
	cont "into the seas."

	para "Not to mention all"
	line "of the emissions"
	cont "from their bikes…"
	done

FisherArnoldSeenText:
	text "The fishin' hasn't"
	line "been so good as of"
	cont "late…"
	done

FisherArnoldBeatenText:
	text "Another small fry…"
	done

FisherArnoldAfterBattleText:
	text "Maybe the seas"
	line "are angry with us…"
	done

LassUsagiSeenText:
	text "I come out here to"
	line "get away from the"
	cont "Feds."
	done

LassUsagiBeatenText:
	text "I couldn't get"
	line "away from you!"
	done

LassUsagiAfterText:
	text "Those idiots are"
	line "worried about"
	cont "getting their"
	cont "hair wet!"

	para "No way they come"
	line "out here!"
	done

Route21_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 16, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfNikki, -1
	object_event  2, 30, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerSwimmermSeth, -1
	object_event 14, 22, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherArnold, -1
	object_event  5, 15, SPRITE_LASS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 0, TrainerLassUsagi, -1
