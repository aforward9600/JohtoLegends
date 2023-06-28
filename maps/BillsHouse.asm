	object_const_def ; object_event constants
	const BILLSHOUSE_GRAMPS
	const BILLSHOUSE_ABRA

	const_def 1 ; locked Pokémon ID table entries, used for species checking
	const BILLSHOUSE_INDEX_LAPRAS
	const BILLSHOUSE_INDEX_ODDISH
	const BILLSHOUSE_INDEX_STARYU
	const BILLSHOUSE_INDEX_GROWLITHE
	const BILLSHOUSE_INDEX_VULPIX
	const BILLSHOUSE_INDEX_PICHU

BillsHouse_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_NEWMAP, .LoadReservedIDs

.LoadReservedIDs:
	loadmonindex BILLSHOUSE_INDEX_LAPRAS, LAPRAS
	loadmonindex BILLSHOUSE_INDEX_ODDISH, ODDISH
	loadmonindex BILLSHOUSE_INDEX_STARYU, STARYU
	loadmonindex BILLSHOUSE_INDEX_GROWLITHE, GROWLITHE
	loadmonindex BILLSHOUSE_INDEX_VULPIX, VULPIX
	loadmonindex BILLSHOUSE_INDEX_PICHU, PICHU
	return

BillsGrandpa:
	faceplayer
	opentext
	checkevent EVENT_DECO_BIG_LAPRAS_DOLL
	iftrue .AlreadyGotLaprasDoll
	checkevent EVENT_MET_BILLS_GRANDPA
	iftrue .MetGrandpa
	writetext BillsGrandpaIntroText
	buttonsound
	setevent EVENT_MET_BILLS_GRANDPA
.MetGrandpa:
	writetext BillsGrandpaLaprasText
	buttonsound
	writetext BillsGrandpaAskToSeeMonText
	yesorno
	iffalse .SaidNo
	scall .ExcitedToSee
	special BillsGrandfather
	iffalse .SaidNo
	checkmaplockedmons
	ifnotequal BILLSHOUSE_INDEX_LAPRAS, .WrongPokemon
	scall .CorrectPokemon
	setevent EVENT_SHOWED_LAPRAS_TO_BILLS_GRANDPA
.ShowedLapras:
	setevent EVENT_DECO_BIG_LAPRAS_DOLL
	writetext BillsGrandpaTokenOfAppreciationText
	buttonsound
	waitsfx
	writetext PlayerGotLaprasDollText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	writetext ThanksForShowingLaprasText
	waitbutton
	closetext
	end

.ExcitedToSee:
	writetext BillsGrandpaExcitedToSeeText
	buttonsound
	end

.SaidNo:
	writetext BillsGrandpaYouDontHaveItTextText
	waitbutton
	closetext
	end

.CorrectPokemon:
	writetext BillsGrandpaShownPokemonText
	buttonsound
	end

.ReceiveItem:
	writetext BillsGrandpaTokenOfAppreciationText
	buttonsound
	end

.JustShowedSomething:
	writetext BillsGrandpaComeAgainText
	waitbutton
	closetext
	end

.AlreadyGotLaprasDoll:
	writetext HowsYourJourneyGoingText
	waitbutton
	closetext
	end

.WrongPokemon:
	writetext BillsGrandpaWrongPokemonText
	waitbutton
	closetext
	end

.BagFull:
	closetext
	end

BillsHouseAbra:
	refreshscreen
	pokepic ABRA
	cry ABRA
	waitbutton
	closepokepic
	opentext
	writetext BillsHouseAbraText
	waitbutton
	closetext
	end

BillsGrandpaIntroText:
	text "Hm? You're <PLAYER>,"
	line "correct?"

	para "Hah! I thought so!"

	para "I run the Abra"
	line "Delivery Serice!"

	para "I still do work in"
	line "Johto, despite the"
	cont "embargo."

	para "The Federation"
	line "entrusts me with"
	cont "their #mon as"
	cont "well,"

	para "so they don't harm"
	line "me."

	para "I could just"
	line "Teleport away with"
	cont "the #mon if it"
	cont "came down to it!"

	para "Ho ho ho!"
	done

BillsGrandpaLaprasText:
	text "By the way, have"
	line "you ever seen a"
	cont "Lapras?"

	para "I've always wanted"
	line "to see a real one."

	para "If you have one,"
	line "could you please"
	cont "show me?"
	done

BillsGrandpaAskToSeeMonText:
	text "If you have a"
	line "Lapras, may I see"
	cont "it, please?"
	done

BillsGrandpaExcitedToSeeText:
	text "You will show me?"
	line "How good of you!"
	done

BillsGrandpaYouDontHaveItTextText:
	text "You don't have it?"
	line "That's too bad…"
	done

BillsGrandpaShownPokemonText:
	text "Ah, so that is"
	line "Lapras?"

	para "Isn't it cute!"
	line "That's so kind of"
	cont "you."
	done

BillsGrandpaTokenOfAppreciationText:
	text "Thanks!"

	para "This is a token of"
	line "my appreciation."

	para "It's a big Lapras"
	line "Doll!"

	para "It's so cute!"
	done

HowsYourJourneyGoingText:
	text "Have you met my"
	line "grandson, Bill?"

	para "He lives in"
	line "Goldenrod City."

	para "Quite the little"
	line "genius, he is."

	para "Says he's going to"
	line "make an electronic"
	cont "#mon storage!"

	para "Looks like I'll"
	line "have some"
	cont "competition!"

	para "Or maybe I can"
	line "retire by then!"
	done

BillsGrandpaComeAgainText:
	text "Come visit again"
	line "sometime."
	done

ThanksForShowingLaprasText:
	text "Thanks for showing"
	line "me a Lapras!"

	para "I really enjoyed"
	line "myself. I'm glad"

	para "I've lived such a"
	line "long life."
	done

BillsGrandpaWrongPokemonText:
	text "Hm?"

	para "That's not a"
	line "Lapras."
	done

PlayerGotLaprasDollText:
	text "<PLAYER> got a"
	line "Lapras Doll!"
	done

BillsHouseAbraText:
	text "Abra: Aabra…"
	done

BillsHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_25, 1
	warp_event  3,  7, ROUTE_25, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  2,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_UP, 0, 2, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, BillsGrandpa, -1
	object_event  4,  1, SPRITE_ABRA, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, BillsHouseAbra, -1
