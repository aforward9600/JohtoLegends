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

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .FlyPoint

.DummyScene0:
	end

.DummyScene1:
	end

.FlyPoint:
	checkevent EVENT_REACHED_ROUTE_23
	iftrue .NoClearFlag
	clearflag ENGINE_FLYPOINT_INDIGO_PLATEAU
.NoClearFlag:
	return

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

TrainerPsychicGilbert:
	trainer PSYCHIC_T, GILBERT, EVENT_BEAT_PSYCHIC_GILBERT, PsychicGilbertSeenText, PsychicGilbertBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext PsychicGilbertAfterBattleText
	waitbutton
	closetext
	end

TrainerBirdKeeperJose2:
	trainer BIRD_KEEPER, JOSE2, EVENT_BEAT_BIRD_KEEPER_JOSE2, BirdKeeperJose2SeenText, BirdKeeperJose2BeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext BirdKeeperJose2AfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBlake:
	trainer COOLTRAINERM, BLAKE, EVENT_BEAT_COOLTRAINERM_BLAKE, CooltrainermBlakeSeenText, CooltrainermBlakeBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBlakeAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainermBrian:
	trainer COOLTRAINERM, BRIAN, EVENT_BEAT_COOLTRAINERM_BRIAN, CooltrainermBrianSeenText, CooltrainermBrianBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainermBrianAfterBattleText
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

TrainerCooltrainerfMegan:
	trainer COOLTRAINERF, MEGAN, EVENT_BEAT_COOLTRAINERF_MEGAN, CooltrainerfMeganSeenText, CooltrainerfMeganBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerfMeganAfterBattleText
	waitbutton
	closetext
	end

TohjoFallsSign:
	jumptext TohjoFallsSignText

Route27TMSolarbeam:
	itemball TM_SOLARBEAM

Route27RareCandy:
	itemball RARE_CANDY

MovementData_0x1a0a66:
	step LEFT
	step LEFT
	step_end

MovementData_0x1a0a69:
	step LEFT
	step_end

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

CooltrainermBlakeSeenText:
	text "You look pretty"
	line "strong."
	cont "Let me battle you!"
	done

CooltrainermBlakeBeatenText:
	text "Yow!"
	done

CooltrainermBlakeAfterBattleText:
	text "If you prevail on"
	line "this harsh trek,"

	para "the truth will be"
	line "revealed!"

	para "Heh, sorry, I just"
	line "wanted to say"
	cont "something cool."
	done

CooltrainermBrianSeenText:
	text "Hm? You're good,"
	line "aren't you?"
	done

CooltrainermBrianBeatenText:
	text "Just as I thought!"
	done

CooltrainermBrianAfterBattleText:
	text "A good trainer can"
	line "recognize other"
	cont "good trainers."
	done

CooltrainerfReenaSeenText:
	text "You shouldn't"
	line "underestimate the"

	para "wild #MON in"
	line "these parts."
	done

CooltrainerfReenaBeatenText:
	text "Oh! You're much"
	line "too strong!"
	done

CooltrainerfReenaAfterBattleText:
	text "You're just a kid,"
	line "but you're not to"

	para "be underestimated"
	line "either."
	done

CooltrainerfMeganSeenText:
	text "It's rare to see"
	line "anyone come here."

	para "Are you training"
	line "on your own?"
	done

CooltrainerfMeganBeatenText:
	text "Oh! You're really"
	line "strong!"
	done

CooltrainerfMeganAfterBattleText:
	text "I'm checking out"
	line "pre- and post-"
	cont "evolution #MON."

	para "Evolution really"
	line "does make #MON"
	cont "stronger."

	para "But evolved forms"
	line "also learn moves"
	cont "later on."
	done

PsychicGilbertSeenText:
	text "Don't say a thing!"

	para "Let me guess what"
	line "you're thinking."

	para "Mmmmmmm…"

	para "I got it! You're"
	line "on the #MON"
	cont "LEAGUE challenge!"
	done

PsychicGilbertBeatenText:
	text "You're too much!"
	done

PsychicGilbertAfterBattleText:
	text "With your skills,"
	line "you'll do well at"
	cont "the LEAGUE."

	para "That's what my"
	line "premonition says."
	done

BirdKeeperJose2SeenText:
	text "Tweet! Tweet!"
	line "Tetweet!"
	done

BirdKeeperJose2BeatenText:
	text "Tweet!"
	done

BirdKeeperJose2AfterBattleText:
	text "BIRD KEEPERS like"
	line "me mimic bird"

	para "whistles to com-"
	line "mand #MON."
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
	object_event 48,  7, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 3, TrainerCooltrainermBlake, -1
	object_event 58,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainermBrian, -1
	object_event 72, 10, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 4, TrainerCooltrainerfReena, -1
	object_event 37,  6, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerfMegan, -1
	object_event 65,  7, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerPsychicGilbert, -1
	object_event 58, 13, SPRITE_YOUNGSTER, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_TRAINER, 3, TrainerBirdKeeperJose2, -1
	object_event 60, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27TMSolarbeam, EVENT_ROUTE_27_TM_SOLARBEAM
	object_event 53, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, Route27RareCandy, EVENT_ROUTE_27_RARE_CANDY
	object_event 21, 10, SPRITE_POKEMANIAC, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, Route27FisherScript, -1
