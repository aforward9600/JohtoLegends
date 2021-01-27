	object_const_def ; object_event constants
	const ROUTE39BARN_MOOMOO
	const ROUTE39BARN_SAILOR

Route39Barn_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MoomooScript:
	refreshscreen
	pokepic MILTANK
	cry MILTANK
	waitbutton
	closepokepic
	opentext
	checkevent EVENT_GOT_PINK_BOW_FROM_MOOMOO
	iftrue .GotBow
	writetext HoldingSomethingText
	buttonsound
	verbosegiveitem PINK_BOW
	waitbutton
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MOOMOO
	end

.GotBow:
	writetext MoomooHappyMooText
	waitbutton
	closetext
	end

Route39BarnSailorScript:
	jumptextfaceplayer Route39BarnSailorText

HoldingSomethingText:
	text "Miltank: Mooo!"

	para "The Miltank is"
	line "holding something."

	para "Looks like she"
	line "wants to give it"
	cont "to you."
	done

MoomooHappyMooText:
	text "Miltank: Mooo!"
	done

Route39BarnSailorText:
	text "Oh, hello!"

	para "I'm just helping"
	line "out part-time"
	cont "since the owner"
	cont "took a job in"
	cont "Goldenrod City."

	para "The embargo took a"
	line "lot out of the"
	cont "business."

	para "Luckily, we're"
	line "able to scrape by"
	cont "with Johto sales."

	para "If you want to buy"
	line "some MooMoo Milk,"
	cont "head into the"
	cont "house and speak"
	cont "with the owner's"
	cont "wife."

	para "Thank you for your"
	line "business!"
	done

Route39Barn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ROUTE_39, 1
	warp_event  4,  7, ROUTE_39, 1

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  3,  3, SPRITE_TAUROS, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnSailorScript, -1
