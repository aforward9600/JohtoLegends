	object_const_def ; object_event constants
	const ROUTE27_COOLTRAINER_M1
	const ROUTE27_COOLTRAINER_M2
	const ROUTE27_COOLTRAINER_F1
	const ROUTE27_COOLTRAINER_F2
	const ROUTE27_YOUNGSTER1
	const ROUTE27_YOUNGSTER2
	const ROUTE27_POKE_BALL1
	const ROUTE27_POKE_BALL2
	const ROUTE27_FISHER

Route27_MapScripts:
	db 2 ; scene scripts
	scene_script .DummyScene0 ; SCENE_DEFAULT
	scene_script .DummyScene1 ; SCENE_FINISHED

	db 0 ; callbacks

.DummyScene0:
	end

.DummyScene1:
	end

FirstStepIntoKantoLeftScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a66
	sjump FirstStepIntoKantoScene_Continue

FirstStepIntoKantoRightScene:
	turnobject ROUTE27_FISHER, LEFT
	showemote EMOTE_SHOCK, ROUTE27_FISHER, 15
	applymovement ROUTE27_FISHER, MovementData_0x1a0a69
FirstStepIntoKantoScene_Continue:
	turnobject PLAYER, RIGHT
	opentext
	writetext Route27FisherHeyText
	buttonsound
	writetext Route27FisherText
	waitbutton
	closetext
	setscene SCENE_FINISHED
	end

Route27FisherScript:
	jumptextfaceplayer Route27FisherText

TrainerPsychicHoudini:
	trainer PSYCHIC_T, HOUDINI, EVENT_BEAT_PSYCHIC_HOUDINI, PsychicHoudiniSeenText, PsychicHoudiniBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicHoudiniAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperCarl:
	trainer BIRD_KEEPER, CARL, EVENT_BEAT_BIRD_KEEPER_CARL, BirdKeeperCarlSeenText, BirdKeeperCarlBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperCarlAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermCorey:
	trainer COOLTRAINERM, COREY1, EVENT_BEAT_COOLTRAINERM_COREY, CooltrainermCoreySeenText, CooltrainermCoreyBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermCoreyAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermAlm:
	trainer COOLTRAINERM, ALM, EVENT_BEAT_COOLTRAINERM_ALM, CooltrainermAlmSeenText, CooltrainermAlmBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermAlmAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfReena:
	trainer COOLTRAINERF, REENA1, EVENT_BEAT_COOLTRAINERF_REENA, CooltrainerfReenaSeenText, CooltrainerfReenaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfReenaAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerfMaria:
	trainer COOLTRAINERF, MARIA, EVENT_BEAT_COOLTRAINERF_MARIA, CooltrainerfMariaSeenText, CooltrainerfMariaBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMariaAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign:
	jumptext TohjoFallsSignText

Route27TMSolarbeam:
	itemball MAX_REPEL

Route27RareCandy:
	itemball RARE_CANDY

MovementData_0x1a0a66:
	step LEFT
	step LEFT
	step_resume

MovementData_0x1a0a69:
	step LEFT
	step_resume

Route27FisherHeyText:
	text "Hey!"
	done

Route27FisherText:
	text "Do you know what"
	line "you just did?"

	para "You've taken your"
	line "first step into"
	cont "Kanto!"

	para "Well, the part"
	line "that's not under"
	cont "the control of"
	cont "the Federation."

	para "They're too"
	line "cowardly to take"
	cont "on the Elite Four."

	para "The Elite Four"
	line "aren't doing"
	cont "anything about"
	cont "them, so it's a"
	cont "stalemate."
	done

CooltrainermCoreySeenText:
	text "You got past that"
	line "whirlpool?"
	done

CooltrainermCoreyBeatenText:
	text "Yow!"
	done

CooltrainermCoreyAfterBattleText:
	text "Lapras can't get"
	line "rid of whirlpools"
	cont "without a certain"
	cont "call."

	para "Isn't that weird?"
	done

CooltrainermAlmSeenText:
	text "Hold it!"

	para "I'm gonna be"
	line "the new champion!"
	done

CooltrainermAlmBeatenText:
	text "Looks like I'm not…"
	done

CooltrainermAlmAfterBattleText:
	text "The old Champion"
	line "vacated not long"
	cont "after the Feds"
	cont "took over Kanto."

	para "Wonder what"
	line "happened to him?"
	done

CooltrainerfReenaSeenText:
	text "This Route is one"
	line "of the last"
	cont "challenges before"
	cont "the League."

	para "We're all pretty"
	line "tough!"
	done

CooltrainerfReenaBeatenText:
	text "You're tough, too!"
	done

CooltrainerfReenaAfterBattleText:
	text "I think you'll do"
	line "just fine!"
	done

CooltrainerfMariaSeenText:
	text "I'll see if you're"
	line "ready for the"
	cont "League!"
	done

CooltrainerfMariaBeatenText:
	text "I'd say you are!"
	done

CooltrainerfMariaAfterBattleText:
	text "Looks like I'm not"
	line "ready yet."

	para "Soon I will be!"
	done

PsychicHoudiniSeenText:
	text "My disappearing"
	line "act will mystify"
	cont "you!"

	para "Behold!!"
	done

PsychicHoudiniBeatenText:
	text "My #mon"
	line "disappeared!"
	done

PsychicHoudiniAfterBattleText:
	text "I wish my battling"
	line "skills were as"
	cont "good as my"
	cont "illusion skills."
	done

BirdKeeperCarlSeenText:
	text "My birds and I"
	line "will make it to"
	cont "the #mon League"
	cont "and win!"
	done

BirdKeeperCarlBeatenText:
	text "We didn't make it!"
	done

BirdKeeperCarlAfterBattleText:
	text "Perhaps someday"
	line "we will, but not"
	cont "today."
	done

TohjoFallsSignText:
	text "Tohjo Falls"

	para "The Link Between"
	line "Kanto and Johto"
	done

Route27_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event 33,  7, ROUTE_27_SANDSTORM_HOUSE, 1
	warp_event 26,  5, TOHJO_FALLS, 1
	warp_event 36,  5, TOHJO_FALLS, 2

	db 2 ; coord events
	coord_event 18, 10, SCENE_DEFAULT, FirstStepIntoKantoLeftScene
	coord_event 19, 10, SCENE_DEFAULT, FirstStepIntoKantoRightScene

	db 1 ; bg events
	bg_event 25,  7, BGEVENT_READ, TohjoFallsSign

	db 9 ; object events
	object_event 58, 13, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermCorey, -1
	object_event 62,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 1, TrainerCooltrainermAlm, -1
	object_event 75, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfReena, -1
	object_event 37,  7, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMaria, -1
	object_event 69,  7, SPRITE_PSYCHIC, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_PINK, OBJECTTYPE_TRAINER, 1, TrainerPsychicHoudini, -1
	object_event 51,  5, SPRITE_BIRD_KEEPER, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 2, TrainerBirdKeeperCarl, -1
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route27FisherScript, -1
