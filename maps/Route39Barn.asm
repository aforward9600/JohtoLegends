	object_const_def ; object_event constants
	const ROUTE39BARN_MOOMOO
	const ROUTE39BARN_SAILOR
	const ROUTE39BARN_MILTON

Route39Barn_MapScripts:
	db 0 ; scene scripts

	db 1 ; callbacks
	callback MAPCALLBACK_OBJECTS, .MiltonSunday

.MiltonSunday:
	checkevent EVENT_CLEARED_RADIO_TOWER
	iftrue .IsItSunday
	disappear ROUTE39BARN_MILTON
	return

.IsItSunday:
	readvar VAR_WEEKDAY
	ifequal SUNDAY, .AppearMilton
	disappear ROUTE39BARN_MILTON
	return

.AppearMilton:
	appear ROUTE39BARN_MILTON
	return

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
	iffalse .Exit
	waitbutton
.Exit:
	closetext
	setevent EVENT_GOT_PINK_BOW_FROM_MOOMOO
	end

.GotBow:
	writetext MoomooHappyMooText
	waitbutton
	closetext
	end

Route39BarnSailorScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .Route39BarnSailor2
	jumptextfaceplayer Route39BarnSailorText

.Route39BarnSailor2
	jumptextfaceplayer Route39BarnSailorText2

Route39BarnMiltonScript:
	jumptextfaceplayer Route39BarnMiltonText

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

Route39BarnMiltonText:
	text "Howdy there!"

	para "I come back every"
	line "week to help out!"

	para "Can't let my wife"
	line "and mother do all"
	cont "the work!"

	para "My sister Martha"
	line "always prefered"
	cont "working in the"
	cont "barn."

	para "Mom and Dad never"
	line "wanted her to be"
	cont "in the barn."

	para "Always wanted her"
	line "to be lady-like."

	para "I think she"
	line "resented that a"
	cont "little bit."

	para "She chose to be"
	line "a Trainer instead."

	para "She's a real good"
	line "one at that."

	para "If ya meet her,"
	line "don't tell her I"
	cont "said that!"

	para "She'd have my head"
	line "fer that!"
	done

Route39BarnSailorText2:
	text "While I'll be happy"
	line "to sail again,"

	para "I'm going to be a"
	line "little sad to"
	cont "leave the farm."

	para "Makes a man almost"
	line "tear up!"
	done

Route39Barn_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  7, ROUTE_39, 1
	warp_event  4,  7, ROUTE_39, 1

	db 0 ; coord events

	db 0 ; bg events

	db 3 ; object events
	object_event  3,  3, SPRITE_MILTANK, SPRITEMOVEDATA_POKEMON, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MoomooScript, -1
	object_event  6,  3, SPRITE_SAILOR, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnSailorScript, -1
	object_event  2,  3, SPRITE_MILTON, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, Route39BarnMiltonScript, EVENT_ROUTE_39_BARN_MILTON
