	object_const_def ; object_event constants
	const ROUTE14_POKEFAN_M1
	const ROUTE14_YOUNGSTER
	const ROUTE14_DELINQUENT
	const ROUTE14_KIM

Route14_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

Kim:
	faceplayer
	opentext
	checkevent EVENT_GOT_DRATINI_FROM_MASTER
	iftrue .LarvitarTrade
	trade NPC_TRADE_KIM
	waitbutton
	closetext
	end

.LarvitarTrade:
	trade NPC_TRADE_KIM_2
	waitbutton
	closetext
	end

TrainerBikerJamie:
	trainer BIKER, JAMIE, EVENT_BEAT_BIKER_JAMIE, BikerJamieSeenText, BikerJamieBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BikerJamieAfterBattleText
	waitbutton
	closetext
	end

TrainerRoughneckDirk:
	trainer ROUGHNECK, DIRK, EVENT_BEAT_ROUGHNECK_DIRK, RoughneckDirkSeenText, RoughneckDirkBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext RoughneckDirkAfterBattleText
	waitbutton
	closetext
	end

TrainerDelinquentAyase:
	trainer DELINQUENT, AYASE, EVENT_BEAT_DELINQUENT_AYASE, DelinquentAyaseSeenText, DelinquentAyaseBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext DelinquentAyaseAfterBattleText
	waitbutton
	closetext
	end

BikerJamieSeenText:
	text "That maze is"
	line "annoying while I'm"
	cont "on my bike."
	done

BikerJamieBeatenText:
	text "Awaaah!"
	done

BikerJamieAfterBattleText:
	text "You're annoying"
	line "too!"
	done

RoughneckDirkSeenText:
	text "Yeah, I'm bad!"

	para "What about it?"
	done

RoughneckDirkBeatenText:
	text "I'm really bad…"
	done

RoughneckDirkAfterBattleText:
	text "I'm a bad guy, and"
	line "I'm bad at battles."

	para "Sucks, huh?"
	done

DelinquentAyaseSeenText:
	text "I'm soooooo bored!"
	done

DelinquentAyaseBeatenText:
	text "I'd rather be bored"
	line "than a loser!"
	done

DelinquentAyaseAfterBattleText:
	text "Go away!"

	para "You're throwing off"
	line "my groove!"
	done

Route14_MapEvents:
	db 0, 0 ; filler

	db 0 ; warp events

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 11, 15, SPRITE_BIKER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerBikerJamie, -1
	object_event 11, 27, SPRITE_ROUGHNECK, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 3, TrainerRoughneckDirk, -1
	object_event  6, 11, SPRITE_DAISY, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_TRAINER, 3, TrainerDelinquentAyase, -1
	object_event  6,  3, SPRITE_TEACHER, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 4, Kim, -1
