	object_const_def ; object_event constants
	const ROUTE3_DELINQUENT1
	const ROUTE3_BIKER1
	const ROUTE3_BIKER2
	const ROUTE3_DELINQUENT2
	const ROUTE3_GRAMPS

Route3_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerDelinquentKaren:
	trainer DELINQUENT, KAREN, EVENT_BEAT_DELINQUENT_KAREN, DelinquentKarenSeenText, DelinquentKarenBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentKarenAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerForest:
	trainer BIKER, FOREST_BIKER, EVENT_BEAT_BIKER_FOREST, BikerForestSeenText, BikerForestBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerForestAfterBattleText
	waitbutton
	closetext
	end

TrainerBikerCalvin:
	trainer BIKER, CALVIN, EVENT_BEAT_BIKER_CALVIN, BikerCalvinSeenText, BikerCalvinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerCalvinAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentTracy:
	trainer DELINQUENT, TRACY, EVENT_BEAT_DELINQUENT_TRACY, DelinquentTracySeenText, DelinquentTracyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentTracyAfterBattleText
	waitbutton
	closetext
	end

Route3MtMoonSquareSign:
	jumptext Route3MtMoonSquareSignText

Route3GrampsScript:
	jumptextfaceplayer Route3GrampsText

DelinquentKarenSeenText:
	text "We're supposed to"
	line "go into Mt.Moon to"
	cont "look for someone,"

	para "but we don't really"
	line "feel like it."
	done

DelinquentKarenBeatenText:
	text "Guess I really"
	line "wasn't feeling it…"
	done

DelinquentKarenAfterBattleText:
	text "We won't go in"
	line "since the Clefairy"
	cont "kicked our butts."

	para "…Eh, forget I said"
	line "anything, got it?"
	done

BikerForestSeenText:
	text "Get outta here!"

	para "These mountains"
	line "belong to us!"
	done

BikerForestBeatenText:
	text "I suppose you can"
	para "stay…"
	done

BikerForestAfterBattleText:
	text "Yeah, whatever!"

	para "You can stay…"
	done

BikerCalvinSeenText:
	text "The wind in my"
	line "hair is great!"

	para "I love being a"
	line "Biker!"
	done

BikerCalvinBeatenText:
	text "I don't love"
	line "losing, though."
	done

BikerCalvinAfterBattleText:
	text "The Feds?"

	para "I just ride around"
	line "with them and act"
	cont "like them."

	para "I don't do much of"
	line "the heavy lifting."
	done

DelinquentTracySeenText:
	text "What do you think"
	line "of my green hair?"

	para "Pretty cool, huh?"
	done

DelinquentTracyBeatenText:
	text "I think it's"
	line "pretty cool…"
	done

DelinquentTracyAfterBattleText:
	text "You should dye"
	line "your hair."

	para "It would look"
	line "great!"
	done

Route3MtMoonSquareSignText:
	text "Mt.Moon Square"

	para "Just go up the"
	line "stairs."
	done

Route3GrampsText:
	text "I was planning on"
	line "building a #mon"
	cont "Center here,"

	para "but recent events"
	line "have put those"
	cont "plans on hold."
	done

Route3_MapEvents:
	db 0, 0 ; filler

	db 1 ; warp events
	warp_event 52,  1, MOUNT_MOON, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event 49, 13, BGEVENT_READ, Route3MtMoonSquareSign

	db 5 ; object events
	object_event 26, 12, SPRITE_DAISY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 2, TrainerDelinquentKaren, -1
	object_event 10,  7, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBikerForest, -1
	object_event 16,  3, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerBikerCalvin, -1
	object_event 43, 14, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentTracy, -1
	object_event 48,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route3GrampsScript, -1
