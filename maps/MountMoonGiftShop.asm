	object_const_def ; object_event constants
	const MOUNTMOONGIFTSHOP_GRAMPS1 ; morning only
	const MOUNTMOONGIFTSHOP_GRAMPS2 ; day only
	const MOUNTMOONGIFTSHOP_LASS1 ; morning only
	const MOUNTMOONGIFTSHOP_LASS2 ; day only

MountMoonGiftShop_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMoonGiftShopClerkScript:
	faceplayer
	opentext
	checkevent EVENT_DECO_POSTER_2
	iftrue .MountMoonMart
	writetext HaveAClefairyPosterText
	buttonsound
	waitsfx
	writetext PlayerGotClefairyPosterText
	playsound SFX_CAUGHT_MON
	setevent EVENT_DECO_POSTER_2
	waitsfx
	buttonsound
	pause 15
	closetext
	end

.MountMoonMart:
	writetext BuyPeatBlockText
	special PlaceMoneyTopRight
	yesorno
	iffalse .Refused
	checkmoney YOUR_MONEY, 10000
	ifequal HAVE_LESS, .NotEnoughMoney
	verbosegiveitem PEAT_BLOCK
	iffalse .NoRoom
	waitsfx
	playsound SFX_TRANSACTION
	takemoney YOUR_MONEY, 10000
	special PlaceMoneyTopRight
	writetextend PeatBlockText

.Refused:
	writetextend RefusedPeatBlock

.NoRoom:
	writetextend NoRoomForPeatBlockText

.NotEnoughMoney:
	writetextend NotEnoughMoneyPeatBlock

MountMoonGiftShopLassScript:
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .MountMoonGiftShopLass2
	jumptextfaceplayer MountMoonGiftShopLassText

.MountMoonGiftShopLass2:
	jumptextfaceplayer MountMoonGiftShopLassText2

MountMoonGiftShopBrockScript:
	jumptextfaceplayer MountMoonGiftShopBrockText

MountMoonGiftShopLassText:
	text "I truly appreciate"
	line "the old man for"
	cont "letting us stay"
	cont "here."

	para "The Feds don't come"
	line "here."

	para "The Clefairy ran"
	line "them off one time,"
	cont "and that was that."

	para "I'm still worried"
	line "about my husband…"
	done

PlayerGotClefairyPosterText:
	text "<PLAYER> received"
	line "Clefairy Poster!"
	done

HaveAClefairyPosterText:
	text "The Clefairy come"
	line "out on Monday"
	cont "nights."

	para "They're fun to"
	line "watch dance."

	para "I made this poster"
	line "to commemorate the"
	cont "Clefairy dance."

	para "Here, take it!"

	para "It's good for"
	line "advertising!"
	done

MountMoonGiftShopBrockText:
	text "Brock: I wanna"
	line "play with #mon"
	cont "outside,"

	para "but mommy said"
	line "it's bad out."

	para "I hope daddy comes"
	line "home soon."
	done

MountMoonGiftShopLassText2:
	text "It looks like"
	line "Brock and I can"
	cont "return to Pewter"
	cont "City soon."

	para "It will be nice"
	line "to live life"
	cont "normally again."
	done

BuyPeatBlockText:
	text "I create blocks of"
	line "mud that contain"
	cont "pieces of meteors."

	para "I can sell you one"
	line "for ¥10,000."

	para "How about it?"
	done

RefusedPeatBlock:
	text "Are you certain?"

	para "It's made of"
	line "meteors!"
	done

NoRoomForPeatBlockText:
	text "There's not"
	line "enough room in"
	cont "your pack."
	done

PeatBlockText:
	text "Certain #mon"
	line "love this item,"

	para "and use its cosmic"
	line "power to evolve."

	para "Make sure you"
	line "give it to your"
	cont "#mon at the"
	cont "right time."

	para "Otherwise, the"
	line "result might not"
	cont "be what you want."
	done

NotEnoughMoneyPeatBlock:
	text "You're too broke to"
	line "afford this work"
	cont "of art!"
	done

MountMoonGiftShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  9,  7, MOUNT_MOON_SQUARE, 3
	warp_event 10,  7, MOUNT_MOON_SQUARE, 3

	db 0 ; coord events

	db 0 ; bg events

	db 4 ; object events
	object_event 10,  3, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_DOWN, 0, 0, -1, MORN, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  7,  2, SPRITE_GRAMPS, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, DAY, 0, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopClerkScript, -1
	object_event  7,  6, SPRITE_BUENA, SPRITEMOVEDATA_WALK_LEFT_RIGHT, 1, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopLassScript, -1
	object_event 11,  4, SPRITE_BROCK, SPRITEMOVEDATA_WALK_UP_DOWN, 0, 1, -1, -1, PAL_NPC_PINK, OBJECTTYPE_SCRIPT, 0, MountMoonGiftShopBrockScript, -1
