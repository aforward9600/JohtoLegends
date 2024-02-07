	object_const_def ; object_event constants
	const ROUTE12_FISHER1
	const ROUTE12_FISHER2
	const ROUTE12_FISHER3
	const ROUTE12_FISHER4
	const ROUTE12_POKE_BALL1
	const ROUTE12_POKE_BALL2

Route12_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerFisherKyle:
	trainer FISHER, KYLE, EVENT_BEAT_FISHER_KYLE, FisherKyleSeenText, FisherKyleBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherKyleAfterBattleText
	waitbutton
	closetext
	end

TrainerFisherMartin:
	trainer FISHER, MARTIN, EVENT_BEAT_FISHER_MARTIN, FisherMartinSeenText, FisherMartinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FisherMartinAfterBattleText
	waitbutton
	closetext
	end

Route12Fisher:
	jumptextfaceplayer Route12FisherText

TrainerYoungsterBarney:
	trainer YOUNGSTER, BARNEY_YOUNGSTER, EVENT_BEAT_FISHER_BARNEY, YoungsterBarneySeenText, YoungsterBarneyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext YoungsterBarneyAfterBattleText
	waitbutton
	closetext
	end

Route12Sign:
	jumptext Route12SignText

FishingSpotSign:
	jumptext FishingSpotSignText

Route12Calcium:
	itemball CALCIUM

Route12Nugget:
	itemball NUGGET

Route12HiddenElixer:
	hiddenitem ELIXER, EVENT_ROUTE_12_HIDDEN_ELIXER

FisherMartinSeenText:
	text "I gotta keep"
	line "fishing!"
	done

FisherMartinBeatenText:
	text "Gwaaah!"
	done

FisherMartinAfterBattleText:
	text "It keeps my mind"
	line "off of all the"
	cont "problems…"
	done

Route12FisherText:
	text "These docks used"
	line "to be the best"
	cont "place in Kanto to"
	cont "fish…"

	para "Those Fed punks!"
	done

YoungsterBarneySeenText:
	text "The Feds hated the"
	line "docks here so bad,"

	para "they burned them"
	line "all!"

	para "It's a bad idea to"
	line "ride a bike on"
	cont "docks!"
	done

YoungsterBarneyBeatenText:
	text "The poor docks…"
	done

YoungsterBarneyAfterBattleText:
	text "These docks will"
	line "take forever to"
	cont "fix…"
	done

FisherKyleSeenText:
	text "I don't dare stand"
	line "on the docks"
	cont "anymore."

	para "Not a good idea to"
	line "stand on burnt"
	cont "wood."
	done

FisherKyleBeatenText:
	text "Smokin'!"
	done

FisherKyleAfterBattleText:
	text "At least there's"
	line "some land here."

	para "Otherwise, this"
	line "route would be"
	cont "empty."
	done

Route12SignText:
	text "Route 12"

	para "North To Lavender"
	line "Town"
	done

FishingSpotSignText:
	text "Fishing Spot"
	done

Route12_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 11, 33, ROUTE_12_SUPER_ROD_HOUSE, 1

	db 0 ; coord events

	db 3 ; bg events
	bg_event 11, 27, BGEVENT_READ, Route12Sign
	bg_event 13,  9, BGEVENT_READ, FishingSpotSign
	bg_event 14, 13, BGEVENT_ITEM, Route12HiddenElixer

	db 6 ; object events
	object_event 10, 21, SPRITE_FISHER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 1, TrainerFisherMartin, -1
	object_event  9, 26, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route12Fisher, -1
	object_event  5, 34, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerYoungsterBarney, -1
	object_event  8,  7, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 0, TrainerFisherKyle, -1
	object_event  5, 43, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Calcium, EVENT_ROUTE_12_CALCIUM
	object_event  5, 51, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route12Nugget, EVENT_ROUTE_12_NUGGET
