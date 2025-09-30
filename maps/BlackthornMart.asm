	object_const_def ; object_event constants
	const BLACKTHORNMART_CLERK
	const BLACKTHORNMART_COOLTRAINER_M
	const BLACKTHORNMART_BLACK_BELT
	const BLACKTHORNMART_CLERK2

BlackthornMart_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

BlackthornMartClerkScript:
	opentext
	checkevent EVENT_GOT_JOURNAL
	iftrue .PokeBallsInStock
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN
	closetext
	end

.PokeBallsInStock:
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN_JOURNAL
	closetext
	end

BlackthornMartClerk2Script:
	opentext
	pokemart MARTTYPE_STANDARD, MART_BLACKTHORN_TMS
	closetext
	end

BlackthornMartCooltrainerMScript:
	checkevent EVENT_GOT_JOURNAL
	iftrue .PokeBallsInStock
	jumptextfaceplayer BlackthornMartCooltrainerMText

.PokeBallsInStock:
	jumptextfaceplayer BlackthornMartCooltrainerMText_PokeBallsInStock

BlackthornMartBlackBeltScript:
	jumptextfaceplayer BlackthornMartBlackBeltText

BlackthornMartCooltrainerMText:
	text "Where are the #"
	line "Balls? I need them"
	cont "to fill out my"

	para "team! I don't want"
	line "to be the weakest"
	cont "in my family!"
	done

BlackthornMartCooltrainerMText_PokeBallsInStock:
	text "Hey, they got #"
	line "Balls in stock"
	cont "now! I can get to"

	para "catching #mon!"
	done

BlackthornMartBlackBeltText:
	text "When I was walking"
	line "in the grass, a"

	para "bug #mon poi-"
	line "soned my #mon!"

	para "I just kept going,"
	line "but then my"
	cont "#mon had 1 HP."

	para "You should keep an"
	line "Antidote with you."
	done

BlackthornMart_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, BLACKTHORN_CITY, 4
	warp_event  3,  7, BLACKTHORN_CITY, 4

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event  1,  3, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerkScript, -1
	object_event  7,  6, SPRITE_COOLTRAINER_M, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 2, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartCooltrainerMScript, -1
	object_event  5,  2, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, -1, PAL_NPC_GREEN, OBJECTTYPE_SCRIPT, 0, BlackthornMartBlackBeltScript, -1
	object_event  1,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, BlackthornMartClerk2Script, -1
