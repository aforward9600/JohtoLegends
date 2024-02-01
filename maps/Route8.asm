	object_const_def ; object_event constants
	const ROUTE8_BIKER1
	const ROUTE8_BIKER2
	const ROUTE8_BIKER3
	const ROUTE8_DELINQUENT
	const ROUTE8_SUPER_NERD2
	const ROUTE8_FRUIT_TREE

Route8_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBikerDwayne:
	trainer BIKER, DWAYNE, EVENT_BEAT_BIKER_DWAYNE, BikerDwayneSeenText, BikerDwayneBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerDwayneAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerHarris:
	trainer BIKER, HARRIS, EVENT_BEAT_BIKER_HARRIS, BikerHarrisSeenText, BikerHarrisBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerHarrisAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerZeke:
	trainer BIKER, ZEKE, EVENT_BEAT_BIKER_ZEKE, BikerZekeSeenText, BikerZekeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerZekeAfterBattleText
	waitbutton
	closetext
	end

TrainerSupernerdSam:
	trainer DELINQUENT, CAROL, EVENT_BEAT_DELINQUENT_CAROL, SupernerdSamSeenText, SupernerdSamBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SupernerdSamAfterBattleText
	waitbutton
	closetext
	end

;TrainerSupernerdTom:
;	trainer SUPER_NERD, TOM, EVENT_BEAT_SUPER_NERD_TOM, SupernerdTomSeenText, SupernerdTomBeatenText, 0, .Script

;.Script:
;	endifjustbattled
;	opentext
;	writetext SupernerdTomAfterBattleText
;	waitbutton
;	closetext
;	end

Route8Supernerd:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .Route8Supernerd2
	jumptextfaceplayer Route8SupernerdText

.Route8Supernerd2:
	jumptextfaceplayer Route8SupernerdText2

Route8LockedDoor:
	jumptext Route8LockedDoorText

Route8UndergroundPathSign:
	jumptext Route8UndergroundPathSignText

Route8FruitTree:
	fruittree FRUITTREE_ROUTE_8

BikerDwayneSeenText:
	text "We're the Kanto"
	line "#mon Federation"
	cont "trainer group."

	para "We'll drive you"
	line "under our wheels!"
	done

BikerDwayneBeatenText:
	text "S-sorry!"
	done

BikerDwayneAfterBattleText:
	text "The Kanto #mon"
	line "Federation will"
	cont "never fall!"
	done

BikerHarrisSeenText:
	text "The cops shut down"
	line "our Underground"

	para "Path! That really"
	line "fries me!"
	done

BikerHarrisBeatenText:
	text "F-forgive me!"
	done

BikerHarrisAfterBattleText:
	text "Wiped out by some"
	line "punk from Johto…"
	done

BikerZekeSeenText:
	text "We're the Kanto"
	line "#mon Federa-"
	cont "tion!"
	cont "Right on!"
	done

BikerZekeBeatenText:
	text "Yikes! Sorry!"
	done

BikerZekeAfterBattleText:
	text "We'll try not to"
	line "disturb anyone"
	cont "from now on…"
	done

SupernerdSamSeenText:
	text "Those idiots are"
	line "always apologizing"
	cont "to people."

	para "How are we going"
	line "to keep up our"
	cont "tough image?"
	done

SupernerdSamBeatenText:
	text "Ah! I'm so sorry!"
	done

SupernerdSamAfterBattleText:
	text "Great, now they"
	line "got me doing it!"
	done

Route8SupernerdText:
	text "I wouldn't go any"
	line "further west."

	para "The Feds have the"
	line "entrance to"
	cont "Saffron City well"
	cont "guarded."
	done

Route8SupernerdText2:
	text "With their boss"
	line "gone, Saffron"
	cont "City is easy to"
	cont "get to now."
	done

;SupernerdTomSeenText:
;	text "Hm… You've got"
;	line "many GYM BADGES."
;	done

;SupernerdTomBeatenText:
;	text "Just as I thought…"
;	line "You're tough!"
;	done

;SupernerdTomAfterBattleText:
;	text "GYM BADGES give"
;	line "you advantages in"
;	cont "battles."
;	done

Route8LockedDoorText:
	text "It's locked…"
	done

Route8UndergroundPathSignText:
	text "The flyer's torn."

	para "It's impossible to"
	line "read…"
	done

Route8_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  4, ROUTE_8_SAFFRON_GATE, 3
	warp_event  4,  5, ROUTE_8_SAFFRON_GATE, 4

	db 0 ; coord events

	db 2 ; bg events
	bg_event 11,  7, BGEVENT_READ, Route8UndergroundPathSign
	bg_event 10,  5, BGEVENT_READ, Route8LockedDoor

	db 6 ; object events
	object_event 12, 14, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBikerDwayne, -1
	object_event  3, 10, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 5, TrainerBikerHarris, -1
	object_event 19,  7, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerZeke, -1
	object_event 26,  4, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerSupernerdSam, -1
	object_event 32, 13, SPRITE_SUPER_NERD, SPRITEMOVEDATA_WANDER, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, Route8Supernerd, -1
	object_event 33,  5, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route8FruitTree, -1
