	object_const_def ; object_event constants
	const DAYCARE_GRAMPS
	const DAYCARE_GRANNY
	const DAYCARE_MR_POKEMON
	const DAYCARE_RIVAL

DayCare_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .EggCheckCallback

.EggCheckCallback:
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .PutDayCareManOutside
	clearevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	setevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

.PutDayCareManOutside:
	setevent EVENT_DAY_CARE_MAN_IN_DAY_CARE
	clearevent EVENT_DAY_CARE_MAN_ON_ROUTE_34
	return

DayCareManScript_Inside:
	faceplayer
	opentext
	checkevent EVENT_GOT_ODD_EGG
	iftrue .AlreadyHaveOddEgg
	writetext DayCareManText_GiveOddEgg
	buttonsound
	closetext
	readvar VAR_PARTYCOUNT
	ifequal PARTY_LENGTH, .PartyFull
	special GiveOddEgg
	opentext
	writetext DayCareText_GotOddEgg
	playsound SFX_KEY_ITEM
	waitsfx
	writetext DayCareText_DescribeOddEgg
	waitbutton
	closetext
	setevent EVENT_GOT_ODD_EGG
	end

.PartyFull:
	opentext
	writetext DayCareText_PartyFull
	waitbutton
	closetext
	end

.AlreadyHaveOddEgg:
	special DayCareMan
	waitbutton
	closetext
	end

DayCareLadyScript:
	faceplayer
	opentext
	checkflag ENGINE_DAY_CARE_MAN_HAS_EGG
	iftrue .HusbandWasLookingForYou
	special DayCareLady
	waitbutton
	closetext
	end

.HusbandWasLookingForYou:
	writetext Text_GrampsLookingForYou
	waitbutton
	closetext
	end

DayCareMrPokemon:
	checkevent EVENT_TALKED_TO_MR_POKEMON_AT_DAY_CARE
	iftrue .PerhapsIllSeeYouLater
	opentext
	writetext DayCareMrPokemonText
	waitbutton
	closetext
	faceplayer
	checkevent EVENT_GOT_RAINBOW_WING
	iftrue .LegendaryPokemon
	checkevent EVENT_GOT_SILVER_WING
	iftrue .LegendaryPokemon
	opentext
	writetext DayCareMrPokemonBusyText
	waitbutton
	closetext
	turnobject DAYCARE_MR_POKEMON, RIGHT
	end

.LegendaryPokemon:
	opentext
	writetext HmWhatIsThatText
	waitbutton
	closetext
	pause 15
	playsound SFX_ENTER_DOOR
	appear DAYCARE_RIVAL
	applymovement DAYCARE_RIVAL, DayCareRivalMovement1
	readvar VAR_FACING
	ifequal UP, .DayCareRival1
	ifequal RIGHT, .DayCareRival2

.DayCareRival1:
	turnobject DAYCARE_RIVAL, UP
.DayCareRival2:
	opentext
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DracoMrPokemon
	writetext DahliaMrPokemonText
	waitbutton
	closetext
	sjump MrPokemonLegendary

.DracoMrPokemon:
	writetext DracoMrPokemonText
	waitbutton
	closetext
	sjump MrPokemonLegendary

.PerhapsIllSeeYouLater:
	jumptextfaceplayer PerhapsIllSeeYouLaterText

MrPokemonLegendary:
	opentext
	writetext MrPokemonLegendaryText
	waitbutton
	closetext
	setevent EVENT_TALKED_TO_MR_POKEMON_AT_DAY_CARE
	setevent EVENT_GOLDENROD_GYM_RIVAL_1
	setmapscene ROUTE_34, SCENE_ROUTE_34_NINJA
	setevent EVENT_ROUTE_34_OFFICER
	checkflag ENGINE_PLAYER_IS_FEMALE
	iftrue .DayCareDracoFarewell
	opentext
	writetext DayCareDahliaFarewellText
	waitbutton
	closetext
	applymovement DAYCARE_RIVAL, DayCareRivalMovement2
	disappear DAYCARE_RIVAL
	playsound SFX_EXIT_BUILDING
	pause 30
	sjump .LeaveDaycare

.DayCareDracoFarewell:
	opentext
	writetext DayCareDracoFarewellText
	waitbutton
	closetext
	applymovement DAYCARE_RIVAL, DayCareRivalMovement2
	disappear DAYCARE_RIVAL
	playsound SFX_EXIT_BUILDING
	pause 30
	sjump .LeaveDaycare

.LeaveDaycare:
	setevent EVENT_DAY_CARE_MR_POKEMON
	readvar VAR_FACING
	ifequal UP, .PlayerLeaves
	ifequal RIGHT, .PlayerLeavesDown

.PlayerLeavesDown:
	applymovement PLAYER, DayCarePlayerMovement2
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	warpfacing LEFT, ROUTE_34, 11, 14
	end

.PlayerLeaves:
	applymovement PLAYER, DayCarePlayerMovement1
	playsound SFX_EXIT_BUILDING
	disappear PLAYER
	special FadeOutPalettes
	warpfacing LEFT, ROUTE_34, 11, 14
	end

DayCareBookshelf:
	jumpstd difficultbookshelf

DayCareRivalMovement1:
	step RIGHT
	step_end

DayCareRivalMovement2:
	step LEFT
	step_end

DayCarePlayerMovement1:
	step LEFT
	step LEFT
	step_end

DayCarePlayerMovement2:
	step DOWN
	step LEFT
	step_end

Text_GrampsLookingForYou:
	text "Gramps was looking"
	line "for you."
	done

Text_DayCareManTalksAboutEggTicket:
	text "I'm the Day-Care"
	line "Man."

	para "There's something"
	line "new in Goldenrod"

	para "called the Trade"
	line "CORNER."

	para "I was given an EGG"
	line "TICKET that can be"

	para "traded in for a"
	line "ODD EGG."

	para "But since we run a"
	line "DAY-CARE, we don't"

	para "need it. You may"
	line "as well have it."
	done

DayCareManText_GiveOddEgg:
	text "I'm the Day-Care"
	line "Man."

	para "Do you know about"
	line "Eggs?"

	para "I was raising"
	line "#mon with my"
	cont "wife, you see."

	para "We were shocked to"
	line "find an Egg!"

	para "How incredible is"
	line "that?"

	para "Well, wouldn't you"
	line "like this Egg?"

	para "Then fine, this is"
	line "yours to keep!"
	done

DayCareText_ComeAgain:
	text "Come again."
	done

DayCareText_GotOddEgg:
	text "<PLAYER> received"
	line "Odd Egg!"
	done

DayCareText_DescribeOddEgg:
	text "I found that when"
	line "I was caring for"

	para "someone's #mon"
	line "before."

	para "But the trainer"
	line "didn't want the"

	para "Egg, so I'd kept"
	line "it around."
	done

DayCareText_PartyFull:
	text "You've no room for"
	line "this."
	done

DayCareMrPokemonText:
	text "So you're saying"
	line "these eggs are…"
	done

DayCareMrPokemonBusyText:
	text "Excuse me, I'm"
	line "trying to have a"
	cont "conversation right"
	cont "now."
	done

EndOfDemoText:
	text "This is the end of"
	line "the current demo."

	para "Stay tuned for"
	line "updates!"

	para "Thats what this"
	line "letter from"
	cont "Ferropexola says!"
	done

HmWhatIsThatText:
	text "Excuse me, I'm"
	line "trying to have a"
	cont "convers…"

	para "…Hm?"

	para "W-what is that you"
	line "have there?"

	para "That wing…"

	para "Is that what I"
	line "think it is?"

	para "…It is! It is!"

	para "What you hold here"
	line "is a feather from"
	cont "a legendary #-"
	cont "mon!"

	para "What would you"
	line "trade it for?!"

	para "I have plenty of"
	line "of rare objects!"

	para "…Pardon?"

	para "You don't want to"
	line "part with it?"

	para "How disappointing…"

	para "You should have"
	line "said so sooner…"
	done

DahliaMrPokemonText:
	text "<RIVAL>: Hey"
	line "<PLAYER>!"

	para "You found Mr."
	line "#mon!"

	para "Have you found"
	line "anything out?"

	para "…A legendary #-"
	line "mon?!"

	para "Awesome!"

	para "Mr. #mon, can"
	line "you tell me about"
	cont "my mine as well?"
	done

DracoMrPokemonText:
	text "<RIVAL>: Hey"
	line "<PLAYER>!"

	para "You found Mr."
	line "#mon!"

	para "Have you found"
	line "anything out?"

	para "…A legendary #-"
	line "mon?!"

	para "Awesome!"

	para "Mr. #mon, can"
	line "you tell me about"
	cont "my mine as well?"
	done

MrPokemonLegendaryText:
	text "Y-you have one as"
	line "well?!"

	para "Where did you get"
	line "these?!"

	para "…A man at the"
	line "Goldenrod Tower?"

	para "…Of course, I"
	line "should have known."

	para "That selfish old"
	line "geezer never let"
	cont "me even make an"
	cont "offer on his rare"
	cont "collection."

	para "I may as well give"
	line "you some info on"
	cont "those wings, but"
	cont "my memory is a"
	cont "little hazy."

	para "This Rainbow Wing"
	line "belonged to Ho-Oh,"
	cont "and this Silver"
	cont "Wing belonged to"
	cont "Lugia."

	para "I'm afraid that"
	line "if you want to"
	cont "learn more than"
	cont "that, then you'll"
	cont "have to talk with"
	cont "an old man at the"
	cont "Bell Tower in"
	cont "Ecruteak City."

	para "Nobody knows more"
	line "about the legends"
	cont "than the monks of"
	cont "Bell Tower."

	para "At least I got to"
	line "see these wings"
	cont "in person."

	para "Thank you for"
	line "that."
	done

DayCareDahliaFarewellText:
	text "<RIVAL>: So, Bell"
	line "Tower, huh?"

	para "I'm off then!"

	para "Thank you, Mr."
	line "#mon!"
	done

DayCareDracoFarewellText:
	text "<RIVAL>: So, Bell"
	line "Tower, huh?"

	para "I'm off then!"

	para "Thank you, Mr."
	line "#mon!"
	done

PerhapsIllSeeYouLaterText:
	text "Come see me at my"
	line "house on Route 30"
	cont "sometime."

	para "Especially if you"
	line "find anything you"
	cont "want to trade."
	done

DayCare_MapEvents:
	db 0, 0 ; filler

	db 4 ; warp events
	warp_event  0,  5, ROUTE_34, 3
	warp_event  0,  6, ROUTE_34, 4
	warp_event  2,  7, ROUTE_34, 5
	warp_event  3,  7, ROUTE_34, 5

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, DayCareBookshelf
	bg_event  1,  1, BGEVENT_READ, DayCareBookshelf

	db 4 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareManScript_Inside, EVENT_DAY_CARE_MAN_IN_DAY_CARE
	object_event  5,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, DayCareLadyScript, -1
	object_event  2,  4, SPRITE_GENTLEMAN, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, DayCareMrPokemon, EVENT_DAY_CARE_MR_POKEMON
	object_event  0,  5, SPRITE_RIVAL, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, ObjectEvent, EVENT_DAY_CARE_RIVAL
