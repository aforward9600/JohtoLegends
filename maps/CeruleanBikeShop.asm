	object_const_def ; object_event constants
	const CERULEANBIKESHOP_CLERK
	const CERULEANBIKESHOP_BIKER

CeruleanBikeShop_MapScripts:
	db 0 ; scene_scripts

	db 0 ; callbacks

CeruleanBikeShopBikerScript:
	jumptextfaceplayer CeruleanBikeShopBikerText

CeruleanBikeShopOwnerScript:
	faceplayer
	opentext
	checkevent EVENT_BEAT_BIKER_BOSS
	iftrue .KeepBike
	checkevent EVENT_GOT_BICYCLE
	iftrue .BikeShopAfter
	writetext HaveABikeText
	buttonsound
	waitsfx
	giveitem BICYCLE
	writetext GotABicycleText
	playsound SFX_KEY_ITEM
	waitsfx
	itemnotify
	setevent EVENT_GOT_BICYCLE
.BikeShopAfter:
	writetext UseTheBikeText
	waitbutton
	closetext
	end

.KeepBike:
	writetext KeepBikeText
	waitbutton
	closetext
	end

CeruleanBikeShopBikerText:
	text "This is the best"
	line "place!"

	para "We get all our"
	line "bikes here!"
	done

HaveABikeText:
	text "Welcome to Miracle"
	line "Cycle!"

	para "Would you like to"
	line "buy a bicycle?"

	para "Only ¥1,000,000!"

	para "…Wait a minute…"

	para "Are you the"
	line "Champion?"

	para "You are!"

	para "I can't believe it!"

	para "…You know, before"
	line "this whole thing,"

	para "I sold a bunch of"
	line "bikes to the Feds…"

	para "I had no idea what"
	line "would happen…"

	para "I feel guilty, but"
	line "I keep selling"
	cont "bikes to them…"

	para "I've made a killing"
	line "here, but after"
	cont "everything…"

	para "…I want to help"
	line "put an end to this"
	cont "madness."

	para "Here, borrow this"
	line "bike."

	para "This will help you"
	line "on Cycling Road."
	done

GotABicycleText:
	text "<PLAYER> got a"
	line "Bicycle!"
	done

UseTheBikeText:
	text "Use that bike and"
	line "end this!"

	para "Just don't tell"
	line "them where you got"
	cont "it from, OK?"
	done

KeepBikeText:
	text "A million thanks,"
	line "pal!"

	para "As a reward, you"
	line "keep the bike,"
	cont "free of charge!"

	para "No need to thank"
	line "me!"
	done

CeruleanBikeShop_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  2,  7, CERULEAN_CITY, 6
	warp_event  3,  7, CERULEAN_CITY, 6

	db 0 ; coord events

	db 0 ; bg events

	db 2 ; object events
	object_event  7,  2, SPRITE_CLERK, SPRITEMOVEDATA_STANDING_LEFT, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopOwnerScript, -1
	object_event  2,  4, SPRITE_BIKER, SPRITEMOVEDATA_SPINRANDOM_FAST, 0, 0, -1, -1, PAL_NPC_RED, OBJECTTYPE_SCRIPT, 0, CeruleanBikeShopBikerScript, -1