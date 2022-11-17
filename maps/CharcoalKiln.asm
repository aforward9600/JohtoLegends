	object_const_def ; object_event constants
	const CHARCOALKILN_BLACK_BELT
	const CHARCOALKILN_YOUNGSTER
	const CHARCOALKILN_MOLTRES

CharcoalKiln_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

CharcoalKilnBoss:
	faceplayer
	opentext
	checkevent EVENT_CAUGHT_FARFETCHD
	iftrue .CaughtFarfetchd
	checkevent EVENT_BEAT_FARFETCHD
	iftrue .BeatFarfetchd
	writetext CharcoalKilnBossText1
	waitbutton
	closetext
	end

.BeatFarfetchd:
	checkevent EVENT_CAUGHT_FARFETCHD
	iftrue .CaughtFarfetchd
	writetext CharcoalKilnBossText3
	waitbutton
	closetext
	end

.CaughtFarfetchd:
	checkevent EVENT_GOT_STICK_IN_CHARCOAL_KILN
	iftrue .AlreadyGotStick
	writetext CharcoalKilnBossText4
	buttonsound
	verbosegiveitem STICK
	iffalse .Done
	setevent EVENT_GOT_STICK_IN_CHARCOAL_KILN
	closetext
	end

.AlreadyGotStick:
	writetext CharcoalKilnBossText2
	waitbutton
	closetext
	end

.Done:
	closetext
	end

CharcoalKilnApprentice:
	faceplayer
	opentext
	checkevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	iftrue .Thanks
	writetext CharcoalKilnApprenticeText2
	buttonsound
	verbosegiveitem CHARCOAL
	iffalse .Done
	setevent EVENT_GOT_CHARCOAL_IN_CHARCOAL_KILN
	closetext
	end

.Thanks:
	writetext CharcoalKilnApprenticeText1
	waitbutton
	closetext
	end

.Done:
	closetext
	end

CharcoalKilnFarfetchd:
	refreshscreen
	pokepic FARFETCH_D
	cry FARFETCH_D
	waitbutton
	closepokepic
	opentext
	writetext FarfetchdText
	waitbutton
	closetext
	end

CharcoalKilnBookshelf:
	jumpstd magazinebookshelf

CharcoalKilnRadio:
	jumpstd radio2

CharcoalKilnBossText1:
	text "Some say that on"
	line "Mondays, a strange"
	cont "colored #mon"

	para "appears in Ilex"
	line "Forest."

	para "Hm?"

	para "Why Mondays?"

	para "No idea…"
	done

CharcoalKilnBossText2:
	text "Has the Farfetch'd"
	line "been a good ally"
	cont "to you?"

	para "Take good care of"
	line "it…"
	done

CharcoalKilnBossText3:
	text "So, you saw it?"
	line "That Farfetch'd…"

	para "Most likely it's"
	line "one of a kind…"

	para "You likely won't"
	line "see another like"
	cont "it…"
	done

CharcoalKilnBossText4:
	text "So, you caught"
	line "that Farfetch'd?"

	para "Most impressive…"

	para "Here, I want you"
	line "to have this…"

	para "It's a Stick…"

	para "Farfetch'd love"
	line "them…"

	para "It boosts the rate"
	line "at which they deal"
	cont "critical hits when"
	cont "they hold it…"
	done

CharcoalKilnApprenticeText1:
	text "I'm gonna be a"
	line "master cutter"
	cont "someday!"

	para "Together with my"
	line "trusty Farfetch'd,"

	para "we'll make a"
	line "perfect team!"
	done

CharcoalKilnApprenticeText2:
	text "Hey, take this!"

	para "This is Charcoal"
	line "that I made!"

	para "Fire-type #mon"
	line "would be happy to"
	cont "hold that."

	para "Cool, huh?"
	done

CharcoalKilnApprenticeText3:
	text "The SLOWPOKE came"
	line "back, and you even"
	cont "found FARFETCH'D."

	para "You're the cool-"
	line "est, man!"
	done

FarfetchdText:
	text "Farfetch'd: Kwaa!"
	done

CharcoalKiln_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, AZALEA_TOWN, 2
	warp_event  3,  7, AZALEA_TOWN, 2

	db 0 ; coord events

	db 3 ; bg events
	bg_event  0,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  1,  1, BGEVENT_READ, CharcoalKilnBookshelf
	bg_event  7,  1, BGEVENT_READ, CharcoalKilnRadio

	db 3 ; object events
	object_event  2,  3, SPRITE_BLACK_BELT, SPRITEMOVEDATA_SPINRANDOM_SLOW, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnBoss, EVENT_CHARCOAL_KILN_BOSS
	object_event  5,  3, SPRITE_KID, SPRITEMOVEDATA_WANDER, 1, 1, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CharcoalKilnApprentice, -1
	object_event  5,  6, SPRITE_FARFETCHD, SPRITEMOVEDATA_POKEMON, 2, 2, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, CharcoalKilnFarfetchd, EVENT_CHARCOAL_KILN_FARFETCH_D
