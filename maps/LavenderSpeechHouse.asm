	object_const_def ; object_event constants
	const LAVENDERSPEECHHOUSE_GRANNY
	const LAVENDERSPEECHHOUSE_GRAMPS

LavenderSpeechHouse_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

LavenderSpeechHousePokefanFScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .LavenderSpeechHousePokefanF2
	jumptextfaceplayer LavenderSpeechHousePokefanFText

.LavenderSpeechHousePokefanF2:
	jumptextfaceplayer LavenderSpeechHousePokefanFText2

OddKeystoneMart:
	faceplayer
	opentext
	writetext BuyOddKeystoneText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	giveitem ODD_KEYSTONE
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	writetextend OddKeystoneText

.Refused:
	writetextend RefusedOddKeystoneText

.NoRoom:
	writetextend NoRoomForOddKeystoneText

.NotEnoughMoney:
	writetextend NotEnoughMoneyOddKeystoneText

LavenderSpeechHouseBookshelf:
	jumpstd genericsink

LavenderSpeechHousePokefanFText:
	text "I can't even pay"
	line "my respects to my"
	cont "poor departed"
	cont "Sandshrew."

	para "Curse those Feds!"
	done

LavenderSpeechHousePokefanFText2:
	text "Now I can pay my"
	line "respects to"
	cont "Sandshrew."
	done

BuyOddKeystoneText:
	text "Sometimes spirits"
	line "escape from the"
	cont "tower."

	para "When that happens,"
	line "I trap them in"
	cont "these stones."

	para "It's not a peaceful"
	line "rest, but it's"
	cont "better than just"
	cont "letting them"
	cont "wander."

	para "Would you like to"
	line "buy one?"

	para "¥10,000, please."
	done

RefusedOddKeystoneText:
	text "I understand."

	para "It is a little"
	line "creepy."
	done

OddKeystoneText:
	text "Take care and don't"
	line "break it!"
	done

NotEnoughMoneyOddKeystoneText:
	text "Come back when you"
	line "have money."
	done

NoRoomForOddKeystoneText:
	text "No room!"
	done

LavenderSpeechHouse_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  4,  7, LAVENDER_TOWN, 3
	warp_event  5,  7, LAVENDER_TOWN, 3

	db 0 ; coord events

	db 2 ; bg events
	bg_event  0,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf
	bg_event  1,  1, BGEVENT_READ, LavenderSpeechHouseBookshelf

	db 2 ; object events
	object_event  3,  3, SPRITE_GRANNY, SPRITEMOVEDATA_STANDING_UP, 0, 0, -1, -1, PAL_NPC_BLUE, OBJECTTYPE_SCRIPT, 0, LavenderSpeechHousePokefanFScript, -1
	object_event  6,  4, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, OddKeystoneMart, -1
