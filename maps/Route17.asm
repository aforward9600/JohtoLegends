	object_const_def ; object_event constants
	const ROUTE17_BIKER1
	const ROUTE17_BIKER2
	const ROUTE17_BIKER3
	const ROUTE17_BIKER4

Route17_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .AlwaysOnBike

.AlwaysOnBike:
	setflag ENGINE_ALWAYS_ON_BIKE
	setflag ENGINE_DOWNHILL
	return

TrainerBikerCharles:
	trainer BIKER, CHARLES, EVENT_BEAT_BIKER_CHARLES, BikerCharlesSeenText, BikerCharlesBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCharlesAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerRiley:
	trainer BIKER, RILEY, EVENT_BEAT_BIKER_RILEY, BikerRileySeenText, BikerRileyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerRileyAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerJoel:
	trainer BIKER, JOEL, EVENT_BEAT_BIKER_JOEL, BikerJoelSeenText, BikerJoelBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJoelAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckCurly:
	trainer ROUGHNECK, CURLY, EVENT_BEAT_ROUGHNECK_CURLY, RoughneckCurlySeenText, RoughneckCurlyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckCurlyAfterBattleText
	waitbutton
	closetext
	end

Route17HiddenMaxEther:
	hiddenitem MAX_ETHER, EVENT_ROUTE_17_HIDDEN_MAX_ETHER

Route17HiddenMaxElixer:
	hiddenitem MAX_ELIXER, EVENT_ROUTE_17_HIDDEN_MAX_ELIXER

BikerRileySeenText:
	text "Hey, you! You're"
	line "from Johto, huh?"

	para "Why don't you go"
	line "back to where you"
	cont "came from?"
	done

BikerRileyBeatenText:
	text "Stupid bumpkin!"
	done

BikerRileyAfterBattleText:
	text "We don't like your"
	line "kind around here!"
	done

BikerJoelSeenText:
	text "Gimme your bike!"
	done

BikerJoelBeatenText:
	text "Please don't take"
	line "my bike!"
	done

BikerJoelAfterBattleText:
	text "I only joined the"
	line "Feds for a free"
	cont "bike…"

	para "I don't have enough"
	line "cash for one…"
	done

RoughneckCurlySeenText:
	text "How am I on"
	line "Cycling Road"
	cont "without a bike?"

	para "Don't ask questions"
	line "you aren't prepared"
	cont "to handle the"
	cont "answers to!"
	done

RoughneckCurlyBeatenText:
	text "Stop asking"
	cont "questions!"
	done

RoughneckCurlyAfterBattleText:
	text "Is it not possible"
	line "to ignore the laws"
	cont "of physics?"

	para "Anything's possible"
	line "in a video game!"
	done

BikerCharlesSeenText:
	text "I hate being on"
	line "Cycling Road!"

	para "I'm constantly"
	line "being pulled down"
	cont "the road!"
	done

BikerCharlesBeatenText:
	text "Yaaaah! Crashed!"
	done

BikerCharlesAfterBattleText:
	text "My balance is off."

	para "Why couldn't I be"
	line "stationed in a"
	cont "better place, like"
	cont "Saffron City?"
	done

Route17_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event 17, 82, ROUTE_17_ROUTE_18_GATE, 1
	warp_event 17, 83, ROUTE_17_ROUTE_18_GATE, 2

	db 0 ; coord events

	db 2 ; bg events
	bg_event  9, 54, BGEVENT_ITEM, Route17HiddenMaxEther
	bg_event  8, 77, BGEVENT_ITEM, Route17HiddenMaxElixer

	db 4 ; object events
	object_event  4, 17, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerRiley, -1
	object_event  9, 68, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 1, TrainerBikerJoel, -1
	object_event  3, 53, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckCurly, -1
	object_event  6, 80, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerBikerCharles, -1
