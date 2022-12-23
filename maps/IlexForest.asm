	object_const_def ; object_event constants
	const ILEXFOREST_FARFETCHD
	const ILEXFOREST_SUPER_NERD
	const ILEXFOREST_BLACK_BELT
	const ILEXFOREST_ROCKER
	const ILEXFOREST_POKE_BALL1
	const ILEXFOREST_KURT
	const ILEXFOREST_LASS
	const ILEXFOREST_HEX_MANIAC
	const ILEXFOREST_POKE_BALL2
	const ILEXFOREST_POKE_BALL3
	const ILEXFOREST_POKE_BALL4

IlexForest_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .FarfetchDAppears

.FarfetchDAppears:
	checkevent EVENT_BEAT_FARFETCHD
	iftrue .FarfetchDWillNotAppear
	readvar VAR_WEEKDAY
	ifequal MONDAY, .FarfetchDWillAppear
.FarfetchDWillNotAppear:
	disappear ILEXFOREST_FARFETCHD
	return

.FarfetchDWillAppear:
	appear ILEXFOREST_FARFETCHD
	return

IlexForestCharcoalApprenticeScript:
	faceplayer
	opentext
	checkevent EVENT_HERDED_FARFETCHD
	iftrue .DoneFarfetchd
	writetext IlexForestApprenticeIntroText
	waitbutton
	closetext
	end

.DoneFarfetchd:
	writetext IlexForestApprenticeAfterText
	waitbutton
	closetext
	end

TrainerSuperNerdIrwin:
	trainer SUPER_NERD, IRWIN, EVENT_BEAT_SUPER_NERD_IRWIN, SuperNerdIrwinSeenText, SuperNerdIrwinBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext SuperNerdIrwinAfterBattleText
	waitbutton
	closetext
	end

IlexForestFarfetchdScript:
	faceplayer
	opentext
	writetext Text_Kwaaaa
	pause 15
	cry FARFETCH_D
	waitbutton
	closetext
	loadwildmon FARFETCH_D, 40
	loadvar VAR_BATTLETYPE, BATTLETYPE_SHINY
	startbattle
	ifequal LOSE, .NotBeaten
	disappear ILEXFOREST_FARFETCHD
	reloadmapafterbattle
	special CheckCaughtCelebi
	iftrue .CaughtFarfetchd
	setevent EVENT_BEAT_FARFETCHD
	end

.CaughtFarfetchd:
	setevent EVENT_CAUGHT_FARFETCHD
	end

.NotBeaten:
	reloadmapafterbattle
	end

IlexForestDarkPulseGirlScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_TM63_DARK_PULSE
	iftrue .AlreadyGotHeadbutt
	writetext Text_DarkPulseIntro
	buttonsound
	verbosegiveitem TM_DARK_PULSE
	iffalse .BagFull
	setevent EVENT_GOT_TM63_DARK_PULSE
	closetext
	end

.AlreadyGotHeadbutt:
	writetext Text_DarkPulseOutro
	waitbutton
.BagFull:
	closetext
	end

TrainerHexManiacMaeve:
	trainer HEX_MANIAC, MAEVE, EVENT_BEAT_HEX_MANIAC_MAEVE, HexManiacMaeveSeenText, HexManiacMaeveBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext HexManiacMaeveAfterBattleText
	waitbutton
	closetext
	end

TrainerCooltrainerFEmiko:
	trainer COOLTRAINERF, EMIKO, EVENT_BEAT_COOLTRAINERF_EMIKO, CooltrainerFEmikoSeenText, CooltrainerFEmikoBeatenText, 0, .Script

.Script:
	endifjustbattled
	opentext
	writetext CooltrainerFEmikoAfterBattleText
	waitbutton
	closetext
	end

IlexForestLassScript:
	jumptextfaceplayer Text_IlexForestLass

IlexForestRevive:
	itemball REVIVE

IlexForestXAttack:
	itemball X_ATTACK

IlexForestAntidote:
	itemball ULTRA_BALL

IlexForestEther:
	itemball ETHER

IlexForestHiddenEther:
	hiddenitem MAX_ETHER, EVENT_ILEX_FOREST_HIDDEN_ETHER

IlexForestHiddenSuperPotion:
	hiddenitem HYPER_POTION, EVENT_ILEX_FOREST_HIDDEN_SUPER_POTION

IlexForestHiddenFullHeal:
	hiddenitem FULL_HEAL, EVENT_ILEX_FOREST_HIDDEN_FULL_HEAL

IlexForestBoulder:
; unused
	jumpstd strengthboulder

IlexForestSignpost:
	jumptext IlexForestSignpostText

IlexForestShrineScript:
	checkevent EVENT_FOREST_IS_RESTLESS
	iftrue .ForestIsRestless
	sjump .DontDoCelebiEvent

.ForestIsRestless:
	checkitem GS_BALL
	iftrue .AskCelebiEvent
.DontDoCelebiEvent:
	jumptext Text_IlexForestShrine

.AskCelebiEvent:
	opentext
	writetext Text_ShrineCelebiEvent
	yesorno
	iftrue .CelebiEvent
	closetext
	end

.CelebiEvent:
	takeitem GS_BALL
	clearevent EVENT_FOREST_IS_RESTLESS
	setevent EVENT_AZALEA_TOWN_KURT
	disappear ILEXFOREST_LASS
	clearevent EVENT_ROUTE_34_ILEX_FOREST_GATE_LASS
	writetext Text_InsertGSBall
	waitbutton
	closetext
	pause 20
	showemote EMOTE_SHOCK, PLAYER, 20
	special FadeOutMusic
	applymovement PLAYER, MovementData_0x6ef58
	pause 30
	turnobject PLAYER, DOWN
	pause 20
	clearflag ENGINE_FOREST_IS_RESTLESS
	special CelebiShrineEvent
	loadwildmon CELEBI, 50
	startbattle
	reloadmapafterbattle
	pause 20
	special CheckCaughtCelebi
	iffalse .DidntCatchCelebi
	appear ILEXFOREST_KURT
	applymovement ILEXFOREST_KURT, MovementData_0x6ef4e
	opentext
	writetext Text_KurtCaughtCelebi
	waitbutton
	closetext
	applymovement ILEXFOREST_KURT, MovementData_0x6ef53
	disappear ILEXFOREST_KURT
.DidntCatchCelebi:
	end

MovementData_0x6ef4e:
	step UP
	step UP
	step UP
	step UP
	step_end

MovementData_0x6ef53:
	step DOWN
	step DOWN
	step DOWN
	step DOWN
	step_end

MovementData_0x6ef58:
	fix_facing
	slow_step DOWN
	remove_fixed_facing
	step_end

IlexForestApprenticeIntroText:
	text "Oh, man… My boss"
	line "is going to be"
	cont "steaming…"

	para "The FARFETCH'D"
	line "that CUTS trees"

	para "for charcoal took"
	line "off on me."

	para "I can't go looking"
	line "for it here in the"
	cont "ILEX FOREST."

	para "It's too big, dark"
	line "and scary for me…"
	done

IlexForestApprenticeAfterText:
	text "Wow! Thanks a"
	line "whole bunch!"

	para "My boss's #MON"
	line "won't obey me be-"
	cont "cause I don't have"
	cont "a BADGE."
	done

Text_ItsTheMissingPokemon:
	text "It's the missing"
	line "#MON!"
	done

Text_Kwaaaa:
	text "Farfetch'd: Kwaa!"
	done

Text_CharcoalMasterIntro:
	text "Ah! My FARFETCH'D!"

	para "You found it for"
	line "us, kid?"

	para "Without it, we"
	line "wouldn't be able"

	para "to CUT trees for"
	line "charcoal."

	para "Thanks, kid!"

	para "Now, how can I"
	line "thank you…"

	para "I know! Here, take"
	line "this."
	done

Text_CharcoalMasterOutro:
	text "That's the CUT HM."
	line "Teach that to a"

	para "#MON to clear"
	line "small trees."

	para "Of course, you"
	line "have to have the"

	para "GYM BADGE from"
	line "AZALEA to use it."
	done

Text_CharcoalMasterTalkAfter:
	text "Do you want to"
	line "apprentice as a"

	para "charcoal maker"
	line "with me?"

	para "You'll be first-"
	line "rate in ten years!"
	done

Text_DarkPulseIntro:
	text "What am I doing?"

	para "Just sitting here"
	line "in the dark."

	para "I like the dark."

	para "You'll learn to"
	line "like it too,"

	para "with this."
	done

ReceivedDarkPulseText:
	text "<PLAYER> received"
	line "TM63."
	done

TMGoesIntoBagText:
	text "<PLAYER> puts the"
	line "TM63 in"
	cont "the TM Pocket."
	done

Text_DarkPulseOutro:
	text "Dark Pulse can"
	line "make an opponent"
	cont "flinch."

	para "That's what I"
	line "call dark…"
	done

Text_IlexForestLass:
	text "Did something"
	line "happen to the"
	cont "forest's guardian?"
	done

IlexForestSignpostText:
	text "Ilex Forest is"
	line "so overgrown with"

	para "trees that you"
	line "can't see the sky."

	para "Please watch out"
	line "for items that may"
	cont "have been dropped."
	done

Text_IlexForestShrine:
	text "Ilex Forest"
	line "Shrine…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"
	done

Text_ShrineCelebiEvent:
	text "Ilex Forest"
	line "Shrine…"

	para "It's in honor of"
	line "the forest's"
	cont "protector…"

	para "Oh? What is this?"

	para "It's a hole."
	line "It looks like the"

	para "GS Berry would fit"
	line "inside it."

	para "Want to put the GS"
	line "Berry here?"
	done

Text_InsertGSBall:
	text "<PLAYER> put in the"
	line "GS Berry."
	done

Text_KurtCaughtCelebi:
	text "Whew, wasn't that"
	line "something!"

	para "<PLAYER>, that was"
	line "fantastic. Thanks!"

	para "The legends about"
	line "that Shrine were"
	cont "real after all."

	para "I feel inspired by"
	line "what I just saw."

	para "It motivates me to"
	line "be a better"
	cont "Leader!"

	para "I'm going!"
	done

HexManiacMaeveSeenText:
	text "Are you here to"
	line "bask in darkness"
	cont "as well?"
	done

HexManiacMaeveBeatenText:
	text "I guess not…"
	done

HexManiacMaeveAfterBattleText:
	text "Please leave."

	para "Your bright aura"
	line "is making this"
	cont "place a little"
	cont "too uncomfortable."
	done

SuperNerdIrwinSeenText:
	text "Hey!"

	para "Don't try to"
	line "muscle in on my"
	cont "territory!"
	done

SuperNerdIrwinBeatenText:
	text "Muscle is right!"
	done

SuperNerdIrwinAfterBattleText:
	text "I heard there was"
	line "a #mon of an"
	cont "unusual color in"
	cont "this forest…"

	para "But I haven't come"
	line "across it yet…"
	done

CooltrainerFEmikoSeenText:
	text "Have you heard the"
	line "the legend of the"
	cont "Guardian of the"
	cont "Forest?"
	done

CooltrainerFEmikoBeatenText:
	text "Legendary!"
	done

CooltrainerFEmikoAfterBattleText:
	text "The shrine back"
	line "there was built in"
	cont "honor of the"
	cont "Guardian of the"
	cont "Forest."

	para "I'd say it's a"
	line "Grass-Type #mon"
	cont "since it's a"
	cont "forest."

	para "Makes sense, yes?"
	done

IlexForest_MapEvents:
	db 0, 0 ; filler

	db 3 ; warp events
	warp_event  1,  5, ROUTE_34_ILEX_FOREST_GATE, 3
	warp_event  3, 42, ILEX_FOREST_AZALEA_GATE, 1
	warp_event  3, 43, ILEX_FOREST_AZALEA_GATE, 2

	db 0 ; coord events

	db 5 ; bg events
	bg_event  3, 17, BGEVENT_READ, IlexForestSignpost
	bg_event 11,  7, BGEVENT_ITEM, IlexForestHiddenEther
	bg_event 22, 14, BGEVENT_ITEM, IlexForestHiddenSuperPotion
	bg_event  1, 17, BGEVENT_ITEM, IlexForestHiddenFullHeal
	bg_event  8, 22, BGEVENT_UP, IlexForestShrineScript

	db 11 ; object events
	object_event 25, 22, SPRITE_FARFETCHD, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, IlexForestFarfetchdScript, EVENT_ILEX_FOREST_FARFETCHD
	object_event 29, 30, SPRITE_SUPER_NERD, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 2, TrainerSuperNerdIrwin, -1
	object_event  1, 36, SPRITE_COOLTRAINER_F, SPRITEMOVEDATA_SPINCLOCKWISE, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_TRAINER, 2, TrainerCooltrainerFEmiko, -1
	object_event 15, 14, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, IlexForestDarkPulseGirlScript, -1
	object_event 20, 32, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestRevive, EVENT_ILEX_FOREST_REVIVE
	object_event  8, 29, SPRITE_KURT, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_ILEX_FOREST_KURT
	object_event  3, 24, SPRITE_TWIN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, IlexForestLassScript, EVENT_ILEX_FOREST_LASS
	object_event 12,  1, SPRITE_HEX_MANIAC, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_TRAINER, 0, TrainerHexManiacMaeve, -1
	object_event  9, 17, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestXAttack, EVENT_ILEX_FOREST_X_ATTACK
	object_event 17,  7, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestAntidote, EVENT_ILEX_FOREST_ANTIDOTE
	object_event 27,  1, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, IlexForestEther, EVENT_ILEX_FOREST_ETHER
