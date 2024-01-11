	object_const_def ; object_event constants
	const ROUTE19_SWIMMER_GIRL
	const ROUTE19_SWIMMER_GUY1
	const ROUTE19_SWIMMER_GUY2
	const ROUTE19_SWIMMER_GUY3
	const ROUTE19_FISHER1
	const ROUTE19_FISHER2

Route19_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerSwimmerfDawn:
	trainer SWIMMERF, DAWN, EVENT_BEAT_SWIMMERF_DAWN, SwimmerfDawnSeenText, SwimmerfDawnBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfDawnAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermHarold:
	trainer SWIMMERM, HAROLD, EVENT_BEAT_SWIMMERM_HAROLD, SwimmermHaroldSeenText, SwimmermHaroldBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermHaroldAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmerfHarlene:
	trainer SWIMMERF, HARLENE, EVENT_BEAT_SWIMMERF_HARLENE, SwimmerfHarleneSeenText, SwimmerfHarleneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmerfHarleneAfterBattleText
	waitbutton
	closetext
	end

TrainerSwimmermTucker:
	trainer SWIMMERM, TUCKER, EVENT_BEAT_SWIMMERM_TUCKER, SwimmermTuckerSeenText, SwimmermTuckerBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SwimmermTuckerAfterBattleText
	waitbutton
	closetext
	end

Route19Fisher1Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .RocksCleared
	writetext Route19Fisher1Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher1Text_RocksCleared
	waitbutton
	closetext
	end

Route19Fisher2Script:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .RocksCleared
	writetext Route19Fisher2Text
	waitbutton
	closetext
	end

.RocksCleared:
	writetext Route19Fisher2Text_RocksCleared
	waitbutton
	closetext
	end

Route19Sign:
	jumptext Route19SignText

CarefulSwimmingSign:
	jumptext CarefulSwimmingSignText

SwimmermHaroldSeenText:
	text "There are strong"
	line "currents in"
	cont "Seafoam Islands."
	done

SwimmermHaroldBeatenText:
	text "Glub…"
	done

SwimmermHaroldAfterBattleText:
	text "I wonder if there's"
	line "a way to block the"
	cont "currents?"
	done

SwimmermTuckerSeenText:
	text "Pant, pant…"
	line "Swimming… is…"
	cont "exhausting!"
	done

SwimmermTuckerBeatenText:
	text "I need some"
	line "Protein!"
	done

SwimmermTuckerAfterBattleText:
	text "Protein is useful"
	line "for building"
	cont "muscles and"
	cont "energy!"
	done

SwimmerfDawnSeenText:
	text "You ever been to"
	line "Seafoam Islands?"
	done

SwimmerfDawnBeatenText:
	text "It's a great sight."
	done

SwimmerfDawnAfterBattleText:
	text "The ice in the"
	line "cave is beautiful."

	para "It's not a good"
	line "place to wear a"
	cont "bikini to, though…"
	done

SwimmerfHarleneSeenText:
	text "Woah! Cool Lapras!"

	para "Can I ride it?"
	done

SwimmerfHarleneBeatenText:
	text "Aw, you're no fun…"
	done

SwimmerfHarleneAfterBattleText:
	text "I'd like to get a"
	line "Lapras one day."
	done

Route19Fisher1Text:
	text "This is a good"
	line "spot for fishing,"
	cont "wouldn't you say?"

	para "The Feds rarely"
	line "come down here."
	done

Route19Fisher1Text_RocksCleared:
	text "I can get back to"
	line "fishing in peace!"
	done

Route19Fisher2Text:
	text "Fuchsia City took"
	line "a nasty beating"
	cont "from the Feds…"
	done

Route19Fisher2Text_RocksCleared:
	text "Let's hope that"
	line "Fuchsia City can"
	cont "recover, now that"
	cont "those idiots are"
	cont "gone!"
	done

Route19SignText:
	text "Route 19"

	para "Fuchsia City -"
	line "Seafoam Islands"
	done

CarefulSwimmingSignText:
	text "Please be careful"
	line "if you are swim-"
	cont "ming to Seafoam"
	cont "Islands."

	para "Fuchsia Police"
	done

Route19_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event  7,  3, ROUTE_19_FUCHSIA_GATE, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11, 13, BGEVENT_READ, Route19Sign
	bg_event 11,  1, BGEVENT_READ, CarefulSwimmingSign

	db 6 ; object events
	object_event  7, 23, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfDawn, -1
	object_event 13, 28, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermHarold, -1
	object_event 11, 17, SPRITE_SWIMMER_GIRL, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSwimmerfHarlene, -1
	object_event  5, 32, SPRITE_SWIMMER_GUY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerSwimmermTucker, -1
	object_event  5, 13, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 1, Route19Fisher1Script, -1
	object_event  9,  5, SPRITE_FISHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 1, Route19Fisher2Script, -1
