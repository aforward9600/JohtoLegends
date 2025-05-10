	object_const_def ; object_event constants
	const ROUTE26_COOLTRAINER_M1
	const ROUTE26_COOLTRAINER_M2
	const ROUTE26_COOLTRAINER_F1
	const ROUTE26_COOLTRAINER_F2
	const ROUTE26_YOUNGSTER
	const ROUTE26_FISHER
	const ROUTE26_FRUIT_TREE
	const ROUTE26_POKE_BALL

Route26_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

TrainerCooltrainermJuan:
	trainer COOLTRAINERM, JUAN, EVENT_BEAT_COOLTRAINERM_JUAN, CooltrainermJuanSeenText, CooltrainermJuanBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermJuanAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermGaven3:
	trainer COOLTRAINERM, GAVEN1, EVENT_BEAT_COOLTRAINERM_GAVEN, CooltrainermGaven3SeenText, CooltrainermGaven3BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermGavenAfterText
	waitbutton
	closetext
	end

TrainerCooltrainerfMary:
	trainer COOLTRAINERF, MARY1, EVENT_BEAT_COOLTRAINERF_MARY, CooltrainerfMarySeenText, CooltrainerfMaryBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMaryAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfTessa:
	trainer COOLTRAINERF, BETH1, EVENT_BEAT_COOLTRAINERF_TESSA, CooltrainerfTessaSeenText, CooltrainerfTessaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfTessaAfterText
	waitbutton
	closetext
	end

Route26PsychicScript:
	jumptextfaceplayer Route26PsychicText

Route26FisherScript:
	jumptextfaceplayer Route26FisherText

Route26Sign:
	jumptext Route26SignText

Route26FruitTree:
	fruittree FRUITTREE_ROUTE_26

Route26MaxElixer:
	itemball TM_DRAGON_PULSE

CooltrainermJuanSeenText:
	text "Vaporeon is one"
	line "of my favorite"
	cont "#mon!"

	para "…"

	para "Why are you"
	line "looking at me"
	cont "like that for?"
	done

CooltrainermJuanBeatenText:
	text "Was it something"
	line "I said?"
	done

CooltrainermJuanAfterBattleText:
	text "Did you know that"
	line "in terms of battle"
	cont "capabilities,"

	para "that Vaporeon is"
	line "neat?"

	para "…"

	para "What did you think"
	line "I was going to"
	cont "say?"
	done

CooltrainermGaven3SeenText:
	text "It's time to make"
	line "my dreams come"
	cont "true!"
	done

CooltrainermGaven3BeatenText:
	text "I can't give up!"
	done

CooltrainermGavenAfterText:
	text "I just need to"
	line "work on my team's"
	cont "strengths!"

	para "Then we'll be"
	line "unstoppable!"
	done

CooltrainerfMarySeenText:
	text "If I beat you,"
	line "I think I'll have"
	cont "the confidence to"

	para "take on the"
	line "#mon League!"
	done

CooltrainerfMaryBeatenText:
	text "Maybe I'm not"
	line "ready…"
	done

CooltrainerfMaryAfterBattleText:
	text "I've defeated"
	line "eight Gym Leaders,"

	para "but I guess I'm"
	line "not quite there"
	cont "yet…"
	done

CooltrainerfTessaSeenText:
	text "Let's see who's"
	line "ready for the"
	cont "#mon League!"
	done

CooltrainerfTessaBeatenText:
	text "You apparently"
	line "are!"
	done

CooltrainerfTessaAfterText:
	text "We'll win soon"
	line "enough, I know it!"
	done

Route26PsychicText:
	text "Darn!"

	para "I was just beaten"
	line "by a really strong"
	cont "trainer!"

	para "Swept me away!"

	para "I'll need to train"
	line "more if I want to"
	cont "stand a chance!"
	done

Route26FisherText:
	text "I'm not battling"
	line "today."

	para "Just here to fish."

	para "I don't think I'm"
	line "of the same level"
	cont "as everyone else"
	cont "here."
	done

Route26SignText:
	text "Route 26"

	para "#mon League"
	line "Reception Gate"
	done

Route26_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  7,  5, VICTORY_ROAD_GATE, 3
	warp_event 15, 57, ROUTE_26_HEAL_HOUSE, 1
	warp_event  5, 71, DAY_OF_WEEK_SIBLINGS_HOUSE, 1

	db 0 ; coord events

	db 1 ; bg events
	bg_event  8,  6, BGEVENT_READ, Route26Sign

	db 8 ; object events
	object_event 14, 22, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainermJuan, -1
	object_event  4, 34, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermGaven3, -1
	object_event  9,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfMary, -1
	object_event  8, 56, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainerfTessa, -1
	object_event 16, 80, SPRITE_PSYCHIC, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route26PsychicScript, -1
	object_event  8, 98, SPRITE_FISHER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, Route26FisherScript, -1
	object_event 14, 54, SPRITE_FRUIT_TREE, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route26FruitTree, -1
	object_event  9, 15, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_ITEMBALL, 0, Route26MaxElixer, EVENT_ROUTE_26_MAX_ELIXER
