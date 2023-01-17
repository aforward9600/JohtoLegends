	object_const_def ; object_event constants
	const UNIONCAVE1F_HIKER1
	const UNIONCAVE1F_BEAUTY
	const UNIONCAVE1F_FISHER1
	const UNIONCAVE1F_POKEFAN_M
	const UNIONCAVE1F_POKE_BALL1
	const UNIONCAVE1F_POKE_BALL2
	const UNIONCAVE1F_POKE_BALL3
	const UNIONCAVE1F_POKE_BALL4

UnionCave1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerBeautyBetty:
	trainer BEAUTY, BETTY, EVENT_BEAT_BEAUTY_BETTY, BeautyBettySeenText, BeautyBettyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BeautyBettyAfterBattleText
	waitbutton
	closetext
	end

TrainerHikerBubba:
	trainer HIKER, BUBBA, EVENT_BEAT_HIKER_BUBBA, HikerBubbaSeenText, HikerBubbaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HikerBubbaAfterBattleText
	waitbutton
	closetext
	end

TrainerPokeFanMRoberto:
	trainer POKEFANM, ROBERTO, EVENT_BEAT_POKEFANM_ROBERTO, PokeFanMRobertoSeenText, PokeFanMRobertoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PokeFanMRobertoAfterBattleText
	waitbutton
	closetext
	end

TrainerFirebreatherBlart:
	trainer FIREBREATHER, BLART, EVENT_BEAT_FIREBREATHER_BLART, FirebreatherBlartSeenText, FirebreatherBlartBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext FirebreatherBlartAfterBattleText
	waitbutton
	closetext
	end

UnionCave1FDuskBall:
	itemball DUSK_BALL

UnionCave1FLinkCable:
	itemball LINK_CABLE

UnionCave1FFullRestore:
	itemball FULL_RESTORE

UnionCave1FPearl:
	itemball PEARL

UnionCave1FUnusedSign:
; unused
	jumptext UnionCave1FUnusedSignText

HikerRussellSeenText:
	text "You're headed to"
	line "AZALEA, are you?"

	para "Let my #MON see"
	line "if you are good"
	cont "enough to battle."
	done

HikerRussellBeatenText:
	text "Oh, oh, oh!"
	done

HikerRussellAfterBattleText:
	text "All right, then!"
	line "I've decided."

	para "I'm not leaving"
	line "until my #MON"
	cont "get tougher!"
	done

BeautyBettySeenText:
	text "What?"

	para "Is it unexpected"
	line "for a lady like me"
	cont "to be in a cave?"

	para "I don't need to"
	line "conform to your"
	cont "standards!"
	done

BeautyBettyBeatenText:
	text "Sorry…"

	para "I shouldn't have"
	line "shouted…"
	done

BeautyBettyAfterBattleText:
	text "I shouldn't have"
	line "assumed you'd"
	cont "think that…"
	done

HikerBubbaSeenText:
	text "Well, it turns out"
	line "the monster was a"
	cont "#mon."

	para "Whoops!"
	done

HikerBubbaBeatenText:
	text "Ah man…"
	done

HikerBubbaAfterBattleText:
	text "I'll look like a"
	line "fool if this gets"
	cont "out."

	para "Please keep this a"
	line "secret to everybody."
	done

PokeFanMRobertoSeenText:
	text "Too much sun is"
	line "bad for my"
	cont "#mon!"

	para "That's why I spend"
	line "time in here!"
	done

PokeFanMRobertoBeatenText:
	text "It's too dark!"
	done

PokeFanMRobertoAfterBattleText:
	text "Now that I think"
	line "about it…"

	para "My Tangrowth"
	line "likes the sun…"
	done

FirebreatherBlartSeenText:
	text "You ever seen a"
	line "fire breathing"
	cont "show before?"
	done

FirebreatherBlartBeatenText:
	text "Fwoosh!"
	done

FirebreatherBlartAfterBattleText:
	text "I guess you have"
	line "already seen one."

	para "You didn't seem"
	line "that impressed."
	done

UnionCave1FUnusedSignText:
	text "Union Cave"
	done

UnionCave1F_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  5, 19, UNION_CAVE_B1F, 3
	warp_event  3, 33, UNION_CAVE_B1F, 4
	warp_event 17, 31, ROUTE_33, 1
	warp_event 17,  3, ROUTE_32, 4

	db 0 ; coord events

	db 0 ; bg events

	db 8 ; object events
	object_event 11,  6, SPRITE_HIKER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 2, TrainerHikerBubba, -1
	object_event  3, 20, SPRITE_BUENA, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBeautyBetty, -1
	object_event  6, 27, SPRITE_FIREBREATHER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 4, TrainerFirebreatherBlart, -1
	object_event 14, 19, SPRITE_POKEFAN_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_TRAINER, 4, TrainerPokeFanMRoberto, -1
	object_event 17, 21, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FDuskBall, EVENT_UNION_CAVE_1F_DUSK_BALL
	object_event  4,  2, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FLinkCable, EVENT_UNION_CAVE_1F_LINK_CABLE
	object_event  4, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FFullRestore, EVENT_UNION_CAVE_1F_FULL_RESTORE
	object_event 12, 33, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, UnionCave1FPearl, EVENT_UNION_CAVE_1F_PEARL
