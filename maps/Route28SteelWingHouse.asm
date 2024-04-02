	object_const_def ; object_event constants
	const ROUTE27SANDSTORMHOUSE_FERROPEXOLA

Route28SteelWingHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

FerropexolaScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_FERROPEXOLA
	iftrue .FerropexolaRematch
	writetext FerropexolaWelcomeText
	waitbutton
	closetext
	winlosstext FerropexolaLossText, FerropexolaLastMonText
	loadtrainer FERROPEXOLA_TRAINER, FERROPEXOLA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FerropexolaGoldTrophyText
	buttonsound
	waitsfx
	writetext PlayerGotGoldTrophyText
	playsound SFX_CAUGHT_MON
	waitsfx
	buttonsound
	pause 15
	writetext FerropexolaComeBackText
	waitbutton
	closetext
	setevent EVENT_DECO_GOLD_TROPHY
	setevent EVENT_BEAT_FERROPEXOLA
	end

.FerropexolaRematch:
	writetext FerropexolaRematchText
	yesorno
	iffalse .Refused
	writetext FerropexolaLetsFightText
	waitbutton
	closetext
	winlosstext FerropexolaLossText, FerropexolaLastMonText
	loadtrainer FERROPEXOLA_TRAINER, FERROPEXOLA1
	startbattle
	reloadmapafterbattle
	opentext
	writetext FerropexolaCongratsText
	waitbutton
	closetext
	end

.FerropexolaAfterBattle:
	writetext FerropexolaCongratsText
	waitbutton
	closetext
	end

.Refused:
	writetext FerropexolaComeBackText
	waitbutton
	closetext
	end

FerropexolaLastMonText:
	text "This has gotten"
	line "intersting!"
	done

CelebrityHouseBookshelf:
	jumpstd magazinebookshelf

FerropexolaWelcomeText:
	text "???: Welcome,"
	line "<PLAYER>."

	para "How do I know your"
	line "name?"

	para "I am Ferropexola."

	para "I'm the lead"
	line "designer for this"
	cont "ROM hack."

	para "I've been waiting a"
	line "long time for this"
	cont "moment."

	para "You may have been"
	line "waiting just as"
	cont "long."

	para "I want to see just"
	line "how strong you've"
	cont "become over the"
	cont "course of your"
	cont "adventure."

	para "Let's battle!"
	done

FerropexolaLossText:
	text "Ferropexola:…"

	para "Truly incredible…"

	para "I'd dare say that"
	line "you're the most"
	cont "powerful trainer"
	cont "in the game."
	done

FerropexolaCongratsText:
	text "Ferropexola: Well,"
	line "my hat's off to"
	cont "you, if I were"
	cont "wearing one."

	para "Congratulations!"

	para "Come back any time"
	line "for another battle"
	cont "if you want."

	para "I'll be here."
	done

FerropexolaRematchText:
	text "Ferropexola: Back"
	line "for a rematch?"
	done

FerropexolaLetsFightText:
	text "Let's do it!"
	done

FerropexolaComeBackText:
	text "Come back any time"
	line "you like."

	para "I've got no where"
	line "else to be right"
	cont "now."
	done

FerropexolaGoldTrophyText:
	text "Ferropexola: You've"
	line "done well!"

	para "It takes quite a"
	line "bit of skill to"
	cont "defeat me!"

	para "Have this Gold"
	line "Trophy!"

	para "You've earned it!"
	done

PlayerGotGoldTrophyText:
	text "<PLAYER> got the"
	line "Gold Trophy!"
	done

Route28SteelWingHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, ROUTE_28, 1
	warp_event  3,  7, ROUTE_28, 1

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, CelebrityHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, CelebrityHouseBookshelf

	db 1 ; object events
	object_event  2,  3, SPRITE_SUPER_NERD, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, FerropexolaScript, EVENT_FERROPEXOLA
