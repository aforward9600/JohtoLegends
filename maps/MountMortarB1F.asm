	object_const_def ; object_event constants
	const MOUNTMORTARB1F_POKE_BALL1
	const MOUNTMORTARB1F_POKE_BALL2
	const MOUNTMORTARB1F_BOULDER
	const MOUNTMORTARB1F_BLACK_BELT
	const MOUNTMORTARB1F_POKE_BALL3
	const MOUNTMORTARB1F_POKE_BALL4
	const MOUNTMORTARB1F_POKE_BALL5
	const MOUNTMORTARB1F_ROCK

MountMortarB1F_MapScripts:
	db 0 ; scene scripts

	db 0 ; callbacks

MountMortarB1FKiyoScript:
	faceplayer
	opentext
	checkevent EVENT_GOT_GOLEM_CALL
	iftrue .GotTyrogue
	checkevent EVENT_BEAT_BLACKBELT_HIDEO
	iftrue .BeatKiyo
	writetext UnknownText_0x7e24d
	waitbutton
	closetext
	winlosstext UnknownText_0x7e2a9, 0
	loadtrainer BLACKBELT_T, HIDEO
	startbattle
	reloadmapafterbattle
	setevent EVENT_BEAT_BLACKBELT_HIDEO
	opentext
.BeatKiyo:
	writetext UnknownText_0x7e2c0
	buttonsound
	verbosegiveitem GOLEM_CALL
	iffalse .NoRoom
	setevent EVENT_GOT_GOLEM_CALL
.GotTyrogue:
	writetext UnknownText_0x7e36a
	waitbutton
	closetext
	end

.NoRoom:
	writetext UnknownText_0x7e3df
	waitbutton
	closetext
	end

MountMortarB1FBoulder:
	jumpstd strengthboulder

MountMortarB1FHyperPotion:
	itemball SUPER_POTION

MountMortarB1FCarbos:
	itemball CARBOS

MountMortarB1FFullRestore:
	itemball GREAT_BALL

MountMortarB1FMaxEther:
	itemball ETHER

MountMortarB1FPPUp:
	itemball PP_UP

MountMortarB1FHiddenMaxRevive:
	hiddenitem MAX_REVIVE, EVENT_MOUNT_MORTAR_B1F_HIDDEN_MAX_REVIVE

MountMortarB1FInsideRock:
	jumpstd smashrock

UnknownText_0x7e24d:
	text "Hey!"

	para "I have a great"
	line "item here for you."

	para "If you want it,"
	line "then you need to"
	cont "beat me in a"
	cont "battle!"
	done

UnknownText_0x7e2a9:
	text "Waaaarggh!"
	line "I am defeated!"
	done

UnknownText_0x7e2c0:
	text "I… have been"
	line "smashed…"

	para "Speaking of which,"

	para "here, take this."

	para "This item will let"
	line "you call a Golem"
	cont "to you."
	done

UnknownText_0x7e355:
	text "<PLAYER> received"
	line "Golem Call."
	done

UnknownText_0x7e36a:
	text "Golems are as hard"
	line "as rocks, and can"
	cont "break rocks as"
	cont "well!"

	para "Sometimes a #-"
	line "mon can pop out!"

	para "Try using it on"
	line "this rock!"
	done

UnknownText_0x7e3df:
	text "You have no room"
	line "in your pack!"
	done

MountMortarB1F_MapEvents:
	db 0, 0 ; filler

	db 2 ; warp events
	warp_event  3,  3, MOUNT_MORTAR_1F_INSIDE, 5
	warp_event 19, 29, MOUNT_MORTAR_1F_OUTSIDE, 7

	db 0 ; coord events

	db 1 ; bg events
	bg_event  4,  6, BGEVENT_ITEM, MountMortarB1FHiddenMaxRevive

	db 8 ; object events
	object_event 29, 12, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FHyperPotion, EVENT_MOUNT_MORTAR_B1F_HYPER_POTION
	object_event  4, 16, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FCarbos, EVENT_MOUNT_MORTAR_B1F_CARBOS
	object_event  9, 10, SPRITE_BOULDER, SPRITEMOVEDATA_STRENGTH_BOULDER, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FBoulder, -1
	object_event 16,  4, SPRITE_BLACK_BELT, SPRITEMOVEDATA_STANDING_RIGHT, 0, 0, -1, -1, PAL_NPC_BROWN, OBJECTTYPE_SCRIPT, 0, MountMortarB1FKiyoScript, -1
	object_event 34, 24, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FFullRestore, EVENT_MOUNT_MORTAR_B1F_FULL_RESTORE
	object_event 32,  3, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FMaxEther, EVENT_MOUNT_MORTAR_B1F_MAX_ETHER
	object_event 21, 26, SPRITE_POKE_BALL, SPRITEMOVEDATA_STILL, 0, 0, -1, -1, 0, OBJECTTYPE_ITEMBALL, 0, MountMortarB1FPPUp, EVENT_MOUNT_MORTAR_B1F_PP_UP
	object_event 17,  4, SPRITE_ROCK, SPRITEMOVEDATA_SMASHABLE_ROCK, 0, 0, -1, -1, 0, OBJECTTYPE_SCRIPT, 0, MountMortarB1FInsideRock, -1
